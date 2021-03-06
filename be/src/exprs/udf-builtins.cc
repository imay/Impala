// Copyright 2012 Cloudera Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "exprs/udf-builtins.h"
#include "runtime/timestamp-value.h"
#include "util/bit-util.h"

#include <ctype.h>
#include <gutil/strings/substitute.h>
#include <math.h>


using namespace std;
using namespace boost::gregorian;
using namespace boost::posix_time;
using namespace strings;

namespace impala {

DoubleVal UdfBuiltins::Abs(FunctionContext* context, const DoubleVal& v) {
  if (v.is_null) return v;
  return DoubleVal(fabs(v.val));
}

DoubleVal UdfBuiltins::Pi(FunctionContext* context) {
  return DoubleVal(M_PI);
}

StringVal UdfBuiltins::Lower(FunctionContext* context, const StringVal& v) {
  if (v.is_null) return v;
  StringVal result(context, v.len);
  for (int i = 0; i < v.len; ++i) {
    result.ptr[i] = tolower(v.ptr[i]);
  }
  return result;
}

IntVal UdfBuiltins::MaxInt(FunctionContext* context) {
  return IntVal(numeric_limits<int32_t>::max());
}

TinyIntVal UdfBuiltins::MaxTinyInt(FunctionContext* context) {
  return TinyIntVal(numeric_limits<int8_t>::max());
}

SmallIntVal UdfBuiltins::MaxSmallInt(FunctionContext* context) {
  return SmallIntVal(numeric_limits<int16_t>::max());
}

BigIntVal UdfBuiltins::MaxBigInt(FunctionContext* context) {
  return BigIntVal(numeric_limits<int64_t>::max());
}

IntVal UdfBuiltins::MinInt(FunctionContext* context) {
  return IntVal(numeric_limits<int32_t>::min());
}

TinyIntVal UdfBuiltins::MinTinyInt(FunctionContext* context) {
  return TinyIntVal(numeric_limits<int8_t>::min());
}

SmallIntVal UdfBuiltins::MinSmallInt(FunctionContext* context) {
  return SmallIntVal(numeric_limits<int16_t>::min());
}

BigIntVal UdfBuiltins::MinBigInt(FunctionContext* context) {
  return BigIntVal(numeric_limits<int64_t>::min());
}

BooleanVal UdfBuiltins::IsNan(FunctionContext* context, const DoubleVal& val) {
  if (val.is_null) return BooleanVal(false);
  return BooleanVal(isnan(val.val));
}

BooleanVal UdfBuiltins::IsInf(FunctionContext* context, const DoubleVal& val) {
  if (val.is_null) return BooleanVal(false);
  return BooleanVal(isinf(val.val));
}

// The units which can be used when Truncating a Timestamp
struct TruncUnit {
  enum Type {
    UNIT_INVALID,
    YEAR,
    QUARTER,
    MONTH,
    WW,
    W,
    DAY,
    DAY_OF_WEEK,
    HOUR,
    MINUTE
  };
};

// Maps the user facing name of a unit to a TruncUnit
// Returns the TruncUnit for the given string
TruncUnit::Type StrToTruncUnit(FunctionContext* ctx, const StringVal& unit_str) {
  StringVal unit = UdfBuiltins::Lower(ctx, unit_str);
  if ((unit == "syyyy") || (unit == "yyyy") || (unit == "year") || (unit == "syear") ||
      (unit == "yyy") || (unit == "yy") || (unit == "y")) {
    return TruncUnit::YEAR;
  } else if (unit == "q") {
    return TruncUnit::QUARTER;
  } else if ((unit == "month") || (unit == "mon") || (unit == "mm") || (unit == "rm")) {
    return TruncUnit::MONTH;
  } else if (unit == "ww") {
    return TruncUnit::WW;
  } else if (unit == "w") {
    return TruncUnit::W;
  } else if ((unit == "ddd") || (unit == "dd") || (unit == "j")) {
    return TruncUnit::DAY;
  } else if ((unit == "day") || (unit == "dy") || (unit == "d")) {
    return TruncUnit::DAY_OF_WEEK;
  } else if ((unit == "hh") || (unit == "hh12") || (unit == "hh24")) {
    return TruncUnit::HOUR;
  } else if (unit == "mi") {
    return TruncUnit::MINUTE;
  } else {
    return TruncUnit::UNIT_INVALID;
  }
}

// Returns the most recent date, no later than orig_date, which is on week_day
// week_day: 0==Sunday, 1==Monday, ...
date GoBackToWeekday(const date& orig_date, int week_day) {
  int current_week_day = orig_date.day_of_week();
  int diff = current_week_day - week_day;
  if (diff == 0) return orig_date;
  if (diff > 0) {
    // ex. Weds(3) shifts to Tues(2), so we go back 1 day
    return orig_date - date_duration(diff);
  }
  // ex. Tues(2) shifts to Weds(3), so we go back 6 days
  DCHECK_LT(diff, 0);
  return orig_date - date_duration(7 + diff);
}

// Truncate to first day of year
TimestampValue TruncYear(const date& orig_date) {
  date new_date(orig_date.year(), 1, 1);
  time_duration new_time(0, 0, 0, 0);
  return TimestampValue(new_date, new_time);
}

// Truncate to first day of quarter
TimestampValue TruncQuarter(const date& orig_date) {
  int first_month_of_quarter = BitUtil::RoundDown(orig_date.month() - 1, 3) + 1;
  date new_date(orig_date.year(), first_month_of_quarter, 1);
  time_duration new_time(0, 0, 0, 0);
  return TimestampValue(new_date, new_time);
}

// Truncate to first day of month
TimestampValue TruncMonth(const date& orig_date) {
  date new_date(orig_date.year(), orig_date.month(), 1);
  time_duration new_time(0, 0, 0, 0);
  return TimestampValue(new_date, new_time);
}

// Same day of the week as the first day of the year
TimestampValue TruncWW(const date& orig_date) {
  const date& first_day_of_year = TruncYear(orig_date).get_date();
  int target_week_day = first_day_of_year.day_of_week();
  date new_date = GoBackToWeekday(orig_date, target_week_day);
  time_duration new_time(0, 0, 0, 0);
  return TimestampValue(new_date, new_time);
}

// Same day of the week as the first day of the month
TimestampValue TruncW(const date& orig_date) {
  const date& first_day_of_mon = TruncMonth(orig_date).get_date();
  const date& new_date = GoBackToWeekday(orig_date, first_day_of_mon.day_of_week());
  time_duration new_time(0, 0, 0, 0);
  return TimestampValue(new_date, new_time);
}

// Truncate to midnight on the given date
TimestampValue TruncDay(const date& orig_date) {
  time_duration new_time(0, 0, 0, 0);
  return TimestampValue(orig_date, new_time);
}

// Date of the previous Monday
TimestampValue TruncDayOfWeek(const date& orig_date) {
  const date& new_date = GoBackToWeekday(orig_date, 1);
  time_duration new_time(0, 0, 0, 0);
  return TimestampValue(new_date, new_time);
}

// Truncate minutes, seconds, and parts of seconds
TimestampValue TruncHour(const date& orig_date, const time_duration& orig_time) {
  time_duration new_time(orig_time.hours(), 0, 0, 0);
  return TimestampValue(orig_date, new_time);
}

// Truncate seconds and parts of seconds
TimestampValue TruncMinute(const date& orig_date, const time_duration& orig_time) {
  time_duration new_time(orig_time.hours(), orig_time.minutes(), 0, 0);
  return TimestampValue(orig_date, new_time);
}

TimestampVal UdfBuiltins::Trunc(
    FunctionContext* context, const TimestampVal& tv, const StringVal &unit_str) {
  const TimestampValue& ts = TimestampValue::FromTimestampVal(tv);
  const date& orig_date = ts.get_date();
  const time_duration& orig_time = ts.get_time();

  // resolve trunc_unit using the prepared state if possible, o.w. parse now
  // TruncPrepare() can only parse trunc_unit if user passes it as a string literal
  TruncUnit::Type trunc_unit;
  void* state = context->GetFunctionState(FunctionContext::THREAD_LOCAL);
  if (state != NULL) {
    trunc_unit = *reinterpret_cast<TruncUnit::Type*>(state);
  } else {
    trunc_unit = StrToTruncUnit(context, unit_str);
    if (trunc_unit == TruncUnit::UNIT_INVALID) {
      string string_unit(reinterpret_cast<char*>(unit_str.ptr), unit_str.len);
      context->SetError(Substitute("Invalid Truncate Unit: $0", string_unit).c_str());
      return TimestampVal::null();
    }
  }

  TimestampValue ret;
  TimestampVal ret_val;
  switch (trunc_unit) {
    case TruncUnit::YEAR:
      ret = TruncYear(orig_date);
      break;
    case TruncUnit::QUARTER:
      ret = TruncQuarter(orig_date);
      break;
    case TruncUnit::MONTH:
      ret = TruncMonth(orig_date);
      break;
    case TruncUnit::WW:
      ret = TruncWW(orig_date);
      break;
    case TruncUnit::W:
      ret = TruncW(orig_date);
      break;
    case TruncUnit::DAY:
      ret = TruncDay(orig_date);
      break;
    case TruncUnit::DAY_OF_WEEK:
      ret = TruncDayOfWeek(orig_date);
      break;
    case TruncUnit::HOUR:
      ret = TruncHour(orig_date, orig_time);
      break;
    case TruncUnit::MINUTE:
      ret = TruncMinute(orig_date, orig_time);
      break;
    default:
      // internal error: implies StrToTruncUnit out of sync with this switch
      context->SetError(Substitute("truncate unit $0 not supported", trunc_unit).c_str());
      return TimestampVal::null();
  }
  ret.ToTimestampVal(&ret_val);
  return ret_val;
}

void UdfBuiltins::TruncPrepare(FunctionContext* ctx,
                               FunctionContext::FunctionStateScope scope) {
  // Parse the unit up front if we can, otherwise do it on the fly in Trunc()
  if (ctx->IsArgConstant(1)) {
    StringVal* unit_str = reinterpret_cast<StringVal*>(ctx->GetConstantArg(1));
    TruncUnit::Type trunc_unit = StrToTruncUnit(ctx, *unit_str);
    if (trunc_unit == TruncUnit::UNIT_INVALID) {
      string string_unit(reinterpret_cast<char*>(unit_str->ptr), unit_str->len);
      ctx->SetError(Substitute("Invalid Truncate Unit: $0", string_unit).c_str());
    } else {
      TruncUnit::Type* state = reinterpret_cast<TruncUnit::Type*>(
          ctx->Allocate(sizeof(TruncUnit::Type)));
      *state = trunc_unit;
      ctx->SetFunctionState(scope, state);
    }
  }
}

void UdfBuiltins::TruncClose(FunctionContext* ctx,
                             FunctionContext::FunctionStateScope scope) {
  void* state = ctx->GetFunctionState(scope);
  if (state != NULL) {
    ctx->Free(reinterpret_cast<uint8_t*>(state));
    ctx->SetFunctionState(scope, NULL);
  }
}

// The units which can be used when extracting a Timestamp
struct ExtractField {
  enum Type {
    INVALID_FIELD,
    YEAR,
    MONTH,
    DAY,
    HOUR,
    MINUTE,
    SECOND,
    MILLISECOND,
    EPOCH
  };
};

// Maps the user facing name of a unit to a ExtractField
// Returns the ExtractField for the given unit
ExtractField::Type StrToExtractField(FunctionContext* ctx, const StringVal& unit_str) {
  StringVal unit = UdfBuiltins::Lower(ctx, unit_str);
  if (unit == "year") return ExtractField::YEAR;
  if (unit == "month") return ExtractField::MONTH;
  if (unit == "day") return ExtractField::DAY;
  if (unit == "hour") return ExtractField::HOUR;
  if (unit == "minute") return ExtractField::MINUTE;
  if (unit == "second") return ExtractField::SECOND;
  if (unit == "millisecond") return ExtractField::MILLISECOND;
  if (unit == "epoch") return ExtractField::EPOCH;
  return ExtractField::INVALID_FIELD;
}

IntVal UdfBuiltins::Extract(
    FunctionContext* context, const TimestampVal& tv, const StringVal &unit_str) {
  // resolve extract_field using the prepared state if possible, o.w. parse now
  // ExtractPrepare() can only parse extract_field if user passes it as a string literal
  ExtractField::Type field;
  void* state = context->GetFunctionState(FunctionContext::THREAD_LOCAL);
  if (state != NULL) {
    field = *reinterpret_cast<ExtractField::Type*>(state);
  } else {
    field = StrToExtractField(context, unit_str);
    if (field == ExtractField::INVALID_FIELD) {
      string string_unit(reinterpret_cast<char*>(unit_str.ptr), unit_str.len);
      context->SetError(Substitute("invalid extract field: $0", string_unit).c_str());
      return IntVal::null();
    }
  }

  const date& orig_date = *reinterpret_cast<const date*>(&tv.date);
  const time_duration& time = *reinterpret_cast<const time_duration*>(&tv.time_of_day);
  if (orig_date.is_special()) return IntVal::null();

  switch (field) {
    case ExtractField::YEAR: {
      return IntVal(orig_date.year());
    }
    case ExtractField::MONTH: {
      return IntVal(orig_date.month());
    }
    case ExtractField::DAY: {
      return IntVal(orig_date.day());
    }
    case ExtractField::HOUR: {
      return IntVal(time.hours());
    }
    case ExtractField::MINUTE: {
      return IntVal(time.minutes());
    }
    case ExtractField::SECOND: {
      return IntVal(time.seconds());
    }
    case ExtractField::MILLISECOND: {
      return IntVal(time.total_milliseconds() - time.total_seconds() * 1000);
    }
    case ExtractField::EPOCH: {
      ptime epoch_date(date(1970, 1, 1), time_duration(0, 0, 0));
      ptime cur_date(orig_date, time);
      time_duration diff = cur_date - epoch_date;
      return IntVal(diff.total_seconds());
    }
    default: {
      DCHECK(false) << field;
      return IntVal::null();
    }
  }
}

void UdfBuiltins::ExtractPrepare(FunctionContext* ctx,
                                 FunctionContext::FunctionStateScope scope) {
  // Parse the unit up front if we can, otherwise do it on the fly in Extract()
  if (ctx->IsArgConstant(1)) {
    StringVal* unit_str = reinterpret_cast<StringVal*>(ctx->GetConstantArg(1));
    ExtractField::Type field = StrToExtractField(ctx, *unit_str);
    if (field == ExtractField::INVALID_FIELD) {
      string string_field(reinterpret_cast<char*>(unit_str->ptr), unit_str->len);
      ctx->SetError(Substitute("invalid extract field: $0", string_field).c_str());
    } else {
      ExtractField::Type* state = reinterpret_cast<ExtractField::Type*>(
          ctx->Allocate(sizeof(ExtractField::Type)));
      *state = field;
      ctx->SetFunctionState(scope, state);
    }
  }
}

void UdfBuiltins::ExtractClose(FunctionContext* ctx,
                               FunctionContext::FunctionStateScope scope) {
  void* state = ctx->GetFunctionState(scope);
  if (state != NULL) {
    ctx->Free(reinterpret_cast<uint8_t*>(state));
    ctx->SetFunctionState(scope, NULL);
  }
}

} // namespace impala
