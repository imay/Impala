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


#ifndef IMPALA_UTIL_HASH_UTIL_H
#define IMPALA_UTIL_HASH_UTIL_H

#include "common/logging.h"
#include "common/compiler-util.h"

// For cross compiling with clang, we need to be able to generate an IR file with
// no sse instructions.  Attempting to load a precompiled IR file that contains
// unsupported instructions causes llvm to fail.  We need to use #defines to control
// the code that is built and the runtime checks to control what code is run.
#ifdef __SSE4_2__
#include <nmmintrin.h>
#endif
#include "util/cpu-info.h"

namespace impala {

// Utility class to compute hash values.
class HashUtil {
 public:
#ifdef __SSE4_2__
  // Compute the Crc32 hash for data using SSE4 instructions.  The input hash parameter is
  // the current hash/seed value.
  // This should only be called if SSE is supported.
  // This is ~4x faster than Fnv/Boost Hash.
  // NOTE: Any changes made to this function need to be reflected in Codegen::GetHashFn.
  // TODO: crc32 hashes with different seeds do not result in different hash functions.
  // The resulting hashes are correlated.
  static uint32_t CrcHash(const void* data, int32_t bytes, uint32_t hash) {
    DCHECK(CpuInfo::IsSupported(CpuInfo::SSE4_2));
    uint32_t words = bytes / sizeof(uint32_t);
    bytes = bytes % sizeof(uint32_t);

    const uint32_t* p = reinterpret_cast<const uint32_t*>(data);
    while (words--) {
      hash = _mm_crc32_u32(hash, *p);
      ++p;
    }

    const uint8_t* s = reinterpret_cast<const uint8_t*>(p);
    while (bytes--) {
      hash = _mm_crc32_u8(hash, *s);
      ++s;
    }

    // The lower half of the CRC hash has has poor uniformity, so swap the halves
    // for anyone who only uses the first several bits of the hash.
    hash = (hash << 16) | (hash >> 16);
    return hash;
  }
#endif

  // default values recommended by http://isthe.com/chongo/tech/comp/fnv/
  static const uint32_t FNV_PRIME = 0x01000193; //   16777619
  static const uint32_t FNV_SEED = 0x811C9DC5; // 2166136261
  static const uint64_t FNV64_PRIME = 1099511628211UL;
  static const uint64_t FNV64_SEED = 14695981039346656037UL;

  // Implementation of the Fowler–Noll–Vo hash function. This is not as performant
  // as boost's hash on int types (2x slower) but has bit entropy.
  // For ints, boost just returns the value of the int which can be pathological.
  // For example, if the data is <1000, 2000, 3000, 4000, ..> and then the mod of 1000
  // is taken on the hash, all values will collide to the same bucket.
  // For string values, Fnv is slightly faster than boost.
  // IMPORTANT: FNV hash suffers from poor diffusion of the least significant bit,
  // which can lead to poor results when input bytes are duplicated.
  // See FnvHash64to32() for how this can be mitigated.
  static uint64_t FnvHash64(const void* data, int32_t bytes, uint64_t hash) {
    const uint8_t* ptr = reinterpret_cast<const uint8_t*>(data);
    while (bytes--) {
      hash = (*ptr ^ hash) * FNV64_PRIME;
      ++ptr;
    }
    return hash;
  }

  // Return a 32-bit hash computed by invoking FNV-64 and folding the result to 32-bits.
  // This technique is recommended instead of FNV-32 since the LSB of an FNV hash is the
  // XOR of the LSBs of its input bytes, leading to poor results for duplicate inputs.
  // The input seed 'hash' is duplicated so the top half of the seed is not all zero.
  static uint32_t FnvHash64to32(const void* data, int32_t bytes, uint32_t hash) {
    uint64_t hash_u64 = hash | ((uint64_t)hash << 32);
    hash_u64 = FnvHash64(data, bytes, hash_u64);
    return (hash_u64 >> 32) ^ (hash_u64 & 0xFFFFFFFF);
  }

  // Computes the hash value for data.  Will call either CrcHash or FnvHash
  // depending on hardware capabilities.
  // Seed values for different steps of the query execution should use different seeds
  // to prevent accidental key collisions. (See IMPALA-219 for more details).
  static uint32_t Hash(const void* data, int32_t bytes, uint32_t seed) {
#ifdef __SSE4_2__
    if (LIKELY(CpuInfo::IsSupported(CpuInfo::SSE4_2))) {
      return CrcHash(data, bytes, seed);
    } else {
      return FnvHash64to32(data, bytes, seed);
    }
#else
    return FnvHash64to32(data, bytes, seed);
#endif
  }

};

}

#endif
