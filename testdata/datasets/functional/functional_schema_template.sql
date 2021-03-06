====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypes
---- PARTITION_COLUMNS
year int
month int
---- COLUMNS
id int COMMENT 'Add a comment'
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- ALTER
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=3);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=4);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=5);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=6);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=7);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=8);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=9);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=10);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=11);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=12);

ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=3);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=4);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=5);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=6);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=7);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=8);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=9);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=10);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=11);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=12);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090301.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090401.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=4);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090501.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=5);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090601.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=6);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090701.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=7);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090801.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=8);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090901.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=9);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/091001.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=10);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/091101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=11);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/091201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=12);

LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100301.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100401.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=4);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100501.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=5);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100601.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=6);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100701.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=7);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100801.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=8);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100901.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=9);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/101001.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=10);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/101101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=11);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/101201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=12);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesnopart
---- COLUMNS
id int
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypessmall
---- PARTITION_COLUMNS
year int
month int
---- COLUMNS
id int
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- ALTER
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=3);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=4);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesSmall/090101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesSmall/090201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesSmall/090301.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesSmall/090401.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=4);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypestiny
---- PARTITION_COLUMNS
year int
month int
---- COLUMNS
id int
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- ALTER
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=3);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2009, month=4);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesTiny/090101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesTiny/090201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesTiny/090301.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesTiny/090401.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=4);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesinsert
---- CREATE
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} LIKE {db_name}.alltypes
STORED AS {file_format};
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesnopart_insert
---- CREATE
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} like {db_name}.alltypesnopart
STORED AS {file_format};
====
---- DATASET
functional
---- BASE_TABLE_NAME
insert_overwrite_nopart
---- CREATE
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (col1 int)
STORED AS {file_format};
====
---- DATASET
functional
---- BASE_TABLE_NAME
insert_overwrite_partitioned
---- CREATE
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (col1 int)
PARTITIONED BY (col2 int)
STORED AS {file_format};
====
---- DATASET
functional
---- BASE_TABLE_NAME
insert_string_partitioned
---- CREATE
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (s1 string)
PARTITIONED BY (s2 string)
STORED AS {file_format};
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypeserror
---- CREATE
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '{hdfs_location}';
USE {db_name}{db_suffix};
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION (year=2009, month=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION (year=2009, month=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION (year=2009, month=3);

-- Create external temp table with desired file format with same data file location
-- Tmp tables must not specify an escape character we don't want any
-- data transformation to happen when inserting it into tmp tables.
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name}_tmp (
  id STRING,
  bool_col STRING,
  tinyint_col STRING,
  smallint_col STRING,
  int_col STRING,
  bigint_col STRING,
  float_col STRING,
  double_col STRING,
  date_string_col STRING,
  string_col STRING,
  timestamp_col STRING)
PARTITIONED BY (year INT, month INT)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS {file_format}
LOCATION '{hdfs_location}';

-- Make metastore aware of the partition directories for the temp table
ALTER TABLE {table_name}_tmp ADD IF NOT EXISTS PARTITION (year=2009, month=1);
ALTER TABLE {table_name}_tmp ADD IF NOT EXISTS PARTITION (year=2009, month=2);
ALTER TABLE {table_name}_tmp ADD IF NOT EXISTS PARTITION (year=2009, month=3);
---- DEPENDENT_LOAD
USE {db_name}{db_suffix};
-- Step 4: Stream the data from tmp text table to desired format tmp table
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}_tmp PARTITION (year, month)
SELECT * FROM {db_name}.{table_name}_tmp;

-- Cleanup the temp table
DROP TABLE IF EXISTS {db_name}{db_suffix}.{table_name}_tmp;
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesError/0901.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesError/0902.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesError/0903.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
====
---- DATASET
functional
---- BASE_TABLE_NAME
hbasealltypeserror
---- CREATE_HIVE
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  ":key,d:bool_col,d:tinyint_col,d:smallint_col,d:int_col,d:bigint_col,d:float_col,d:double_col,d:date_string_col,d:string_col,d:timestamp_col"
)
TBLPROPERTIES("hbase.table.name" = "functional_hbase.hbasealltypeserror");
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypeserrornonulls
---- CREATE
CREATE EXTERNAL TABLE IF NOT EXISTS  {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '{hdfs_location}';
-- Make metastore aware of the new partitions directories
-- ALTER does not take a fully qualified name.
USE {db_name}{db_suffix};

ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION (year=2009, month=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION (year=2009, month=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION (year=2009, month=3);

-- Create external temp table with desired file format with same data file location
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name}_tmp (
  id STRING,
  bool_col STRING,
  tinyint_col STRING,
  smallint_col STRING,
  int_col STRING,
  bigint_col STRING,
  float_col STRING,
  double_col STRING,
  date_string_col STRING,
  string_col STRING,
  timestamp_col STRING)
PARTITIONED BY (year INT, month INT)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  ESCAPED BY '\\'
STORED AS {file_format}
LOCATION '{hdfs_location}';

-- Make metastore aware of the partition directories
USE {db_name}{db_suffix};
ALTER TABLE {table_name}_tmp ADD IF NOT EXISTS PARTITION (year=2009, month=1);
ALTER TABLE {table_name}_tmp ADD IF NOT EXISTS PARTITION (year=2009, month=2);
ALTER TABLE {table_name}_tmp ADD IF NOT EXISTS PARTITION (year=2009, month=3);
---- DEPENDENT_LOAD
USE {db_name}{db_suffix};
-- Step 4: Stream the data from tmp text table to desired format tmp table
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}_tmp PARTITION (year, month)
SELECT * FROM {db_name}.{table_name}_tmp;

-- Cleanup the temp table
DROP TABLE IF EXISTS {db_name}{db_suffix}.{table_name}_tmp;
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesErrorNoNulls/0901.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesErrorNoNulls/0902.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesErrorNoNulls/0903.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
====
---- DATASET
functional
---- BASE_TABLE_NAME
hbasealltypeserrornonulls
---- CREATE_HIVE
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  ":key,d:bool_col,d:tinyint_col,d:smallint_col,d:int_col,d:bigint_col,d:float_col,d:double_col,d:date_string_col,d:string_col,d:timestamp_col"
)
TBLPROPERTIES("hbase.table.name" = "functional_hbase.hbasealltypeserrornonulls");
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesagg
---- PARTITION_COLUMNS
year int
month int
day int
---- COLUMNS
id int
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- ALTER
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=3);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=4);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=5);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=6);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=7);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=8);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=9);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=10);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month, day)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100102.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100103.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100104.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=4);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100105.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=5);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100106.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=6);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100107.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=7);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100108.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=8);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100109.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=9);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100110.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=10);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesaggnonulls
---- PARTITION_COLUMNS
year int
month int
day int
---- COLUMNS
id int
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- ALTER
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=3);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=4);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=5);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=6);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=7);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=8);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=9);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=10);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month, day)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100102.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100103.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100104.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=4);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100105.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=5);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100106.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=6);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100107.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=7);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100108.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=8);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100109.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=9);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100110.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=10);
====
---- DATASET
functional
---- BASE_TABLE_NAME
testtbl
---- COLUMNS
id bigint
name string
zip int
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
====
---- DATASET
functional
---- BASE_TABLE_NAME
dimtbl
---- COLUMNS
id bigint
name string
zip int
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/DimTbl/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
jointbl
---- COLUMNS
test_id bigint
test_name string
test_zip int
alltypes_id int
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/JoinTbl/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
liketbl
---- COLUMNS
str_col string
match_like_col string
no_match_like_col string
match_regex_col string
no_match_regex_col string
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/LikeTbl/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypessmallbinary
---- CREATE_HIVE
-- This table does not define a ':key' column spec. If one is not specified, the
-- first column is implied.
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp,
  year int,
  month int)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  "d:bool_col#-,
   d:tinyint_col#-,
   d:smallint_col#-,
   d:int_col#-,
   d:bigint_col#-,
   d:float_col#-,
   d:double_col#-,
   d:date_string_col#-,
   d:string_col#-,
   d:timestamp_col#s,
   d:year#-,
   d:month#-"
)
TBLPROPERTIES ("hbase.table.name" = "functional_hbase.alltypessmallbinary",
               "hbase.table.default.storage.type" = "binary");
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}
SELECT * FROM functional.alltypessmall;
====
---- DATASET
functional
---- BASE_TABLE_NAME
insertalltypesaggbinary
---- CREATE_HIVE
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp,
  year int,
  month int,
  day int)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  ":key#b,d:bool_col#b,d:tinyint_col#b,d:smallint_col#b,d:int_col#b,d:bigint_col#b,d:float_col#b,d:double_col#b,d:date_string_col,d:string_col,d:timestamp_col,d:year#b,d:month#b,d:day#b"
)
TBLPROPERTIES("hbase.table.name" = "functional_hbase.insertalltypesaggbinary");
====
---- DATASET
functional
---- BASE_TABLE_NAME
insertalltypesagg
---- PARTITION_COLUMNS
year int
month int
day int
---- COLUMNS
id int
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
====
---- DATASET
functional
---- BASE_TABLE_NAME
stringids
---- PARTITION_COLUMNS
year int
month int
day int
---- COLUMNS
id string
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypes_view
---- CREATE
CREATE VIEW IF NOT EXISTS {db_name}{db_suffix}.{table_name}
AS SELECT * FROM {db_name}{db_suffix}.alltypes;
---- LOAD
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypes_view_sub
---- CREATE
CREATE VIEW IF NOT EXISTS {db_name}{db_suffix}.{table_name} (x, y, z)
AS SELECT int_col, string_col, timestamp_col FROM {db_name}{db_suffix}.alltypes;
---- LOAD
====
---- DATASET
functional
---- BASE_TABLE_NAME
complex_view
---- CREATE
CREATE VIEW IF NOT EXISTS {db_name}{db_suffix}.complex_view
(abc COMMENT 'agg', xyz COMMENT 'gby') AS
SELECT COUNT(a.bigint_col), b.string_col FROM
{db_name}{db_suffix}.alltypesagg a INNER JOIN {db_name}{db_suffix}.alltypestiny b
ON a.id = b.id WHERE a.bigint_col < 50
GROUP BY b.string_col HAVING COUNT(a.bigint_col) > 1
ORDER BY b.string_col LIMIT 100;
---- LOAD
====
---- DATASET
functional
---- BASE_TABLE_NAME
view_view
---- CREATE
CREATE VIEW IF NOT EXISTS {db_name}{db_suffix}.{table_name}
AS SELECT * FROM {db_name}{db_suffix}.alltypes_view;
---- LOAD
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypes_parens
---- CREATE
CREATE VIEW IF NOT EXISTS {db_name}{db_suffix}.{table_name}
AS SELECT * FROM {db_name}{db_suffix}.alltypes
WHERE year = 2009 and (int_col < 100 OR bool_col = false) and month = 1;
---- LOAD
====
---- DATASET
functional
---- BASE_TABLE_NAME
text_comma_backslash_newline
---- COLUMNS
col1 string
col2 string
col3 int
col4 int
---- ROW_FORMAT
delimited fields terminated by ',' escaped by '\\' lines terminated by '\n'
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/data/text-comma-backslash-newline.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
text_dollar_hash_pipe
---- COLUMNS
col1 string
col2 string
col3 int
col4 int
---- ROW_FORMAT
delimited fields terminated by '$' escaped by '#' lines terminated by '|'
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/data/text-dollar-hash-pipe.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
text_thorn_ecirc_newline
---- COLUMNS
col1 string
col2 string
col3 int
col4 int
---- ROW_FORMAT
-- -2 => ASCII 254 (thorn character) and -22 is a lowercase e with a circumflex
delimited fields terminated by '-2' escaped by '-22' lines terminated by '\n'
---- LOAD
-- Hive has a bug where it will not load a table's table metadata if ESCAPED BY and
-- TERMINATED BY are specified at the same time and set to extended ASCII characters.
-- To work around this, the data file is loaded into a temp table with the same location.
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name}_tmp(i int) LOCATION '/test-warehouse/{table_name}';
LOAD DATA LOCAL INPATH '{impala_home}/testdata/data/text-thorn-ecirc-newline.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name}_tmp;
DROP TABLE {db_name}{db_suffix}.{table_name}_tmp;
====
---- DATASET
functional
---- BASE_TABLE_NAME
overflow
---- COLUMNS
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/data/overflow.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
widerow
---- COLUMNS
string_col string
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/data/widerow.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
greptiny
---- COLUMNS
field string
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/hive_benchmark/grepTiny/part-00000' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
rankingssmall
---- COLUMNS
pageRank int
pageURL string
avgDuration int
---- ROW_FORMAT
delimited fields terminated by '|'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/hive_benchmark/htmlTiny/Rankings.dat' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
uservisitssmall
---- COLUMNS
sourceIP string
destURL string
visitDate string
adRevenue float
userAgent string
cCode string
lCode string
sKeyword string
avgTimeOnSite int
---- ROW_FORMAT
delimited fields terminated by '|'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/hive_benchmark/htmlTiny/UserVisits.dat' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
emptytable
---- PARTITION_COLUMNS
f2 int
---- COLUMNS
field string
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesaggmultifiles
---- PARTITION_COLUMNS
year int
month int
day int
---- COLUMNS
id int
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
---- ALTER
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=3);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=4);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=5);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=6);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=7);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=8);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=9);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(year=2010, month=1, day=10);
---- DEPENDENT_LOAD
insert overwrite table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM {db_name}.{table_name} where id % 4 = 0;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM {db_name}.{table_name} where id % 4 = 1;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM {db_name}.{table_name} where id % 4 = 2;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT  id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM {db_name}.{table_name} where id % 4 = 3;
---- LOAD
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.dynamic.partition=true;
insert overwrite table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM functional.alltypesagg where id % 4 = 0;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM functional.alltypesagg where id % 4 = 1;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM functional.alltypesagg where id % 4 = 2;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM functional.alltypesagg where id % 4 = 3;
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesaggmultifilesnopart
---- COLUMNS
id int
bool_col boolean
tinyint_col tinyint
smallint_col smallint
int_col int
bigint_col bigint
float_col float
double_col double
date_string_col string
string_col string
timestamp_col timestamp
---- DEPENDENT_LOAD
insert overwrite table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM {db_name}.{table_name} where id % 4 = 0;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM {db_name}.{table_name} where id % 4 = 1;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM {db_name}.{table_name} where id % 4 = 2;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM {db_name}.{table_name} where id % 4 = 3;
---- LOAD
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.dynamic.partition=true;
SET hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
insert overwrite table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM functional.alltypesagg where id % 4 = 0;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM functional.alltypesagg where id % 4 = 1;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM functional.alltypesagg where id % 4 = 2;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM functional.alltypesagg where id % 4 = 3;
====
---- DATASET
functional
---- BASE_TABLE_NAME
stringpartitionkey
---- PARTITION_COLUMNS
string_col string
---- COLUMNS
id int
---- ALTER
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION (string_col = "partition1");
====
---- DATASET
functional
---- BASE_TABLE_NAME
tinytable
---- COLUMNS
a string
b string
---- ROW_FORMAT
delimited fields terminated by ','
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/TinyTable/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
tinyinttable
---- COLUMNS
int_col int
---- ROW_FORMAT
delimited fields terminated by ','
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/TinyIntTable/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
nulltable
---- COLUMNS
a string
b string
c string
d int
e double
f string
g string
---- ROW_FORMAT
delimited fields terminated by ','
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} select * from functional.nulltable;
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/NullTable/data.csv'
OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
nullescapedtable
---- COLUMNS
a string
b string
c string
d int
e double
f string
g string
---- ROW_FORMAT
delimited fields terminated by ',' escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} select * from functional.nulltable;
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/NullTable/data.csv'
OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
nullformat_custom
---- CREATE_HIVE
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  id int,
  a boolean,
  b string,
  c int,
  d double)
STORED AS {file_format}
TBLPROPERTIES("serialization.null.format" = "xyz");
====
---- DATASET
functional
---- BASE_TABLE_NAME
escapechartesttable
---- PARTITION_COLUMNS
id int
---- COLUMNS
bool_col boolean
---- ROW_FORMAT
delimited fields terminated by ',' escaped by '\n'
---- ALTER
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=0);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=1);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=2);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=3);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=4);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=5);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=6);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=7);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=8);
ALTER TABLE {table_name} ADD IF NOT EXISTS PARTITION(id=9);
----  DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (id)
select bool_col,id FROM {db_name}.alltypesagg where id < 10;
---- LOAD
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.dynamic.partition=true;
  SET hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (id)
select bool_col,id FROM {db_name}.alltypesagg where id < 10;
====
---- DATASET
functional
---- BASE_TABLE_NAME
TblWithRaggedColumns
---- COLUMNS
str_col string
int_col int
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/TblWithRaggedColumns/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
nullinsert
---- CREATE
-- Must not be external
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  str_col1 string,
  str_col2 string,
  str_col3 string,
  str_col4 string,
  int_cal int
)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '{hdfs_location}';
DROP TABLE IF EXISTS {db_name}{db_suffix}.{table_name}_alt;
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name}_alt(
  whole_row string
)
row format delimited fields terminated by '|'
stored as {file_format}
LOCATION '{hdfs_location}';
====
---- DATASET
functional
---- BASE_TABLE_NAME
zipcode_incomes
---- COLUMNS
id STRING
zip STRING
description1 STRING
description2 STRING
income int
---- ROW_FORMAT
DELIMITED FIELDS TERMINATED BY ','
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/ImpalaDemoDataset/DEC_00_SF3_P077_with_ann_noheader.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
unsupported_types
---- CREATE_HIVE
-- Create a table that mixes supported and unsupported scalar types.
-- We should be able to read the column values of supported types and
-- fail queries that reference  columns of unsupported types.
CREATE EXTERNAL TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  int_col INT,
  dec_col DECIMAL,
  str_col STRING,
  bin_col BINARY,
  bigint_col BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS {file_format}
LOCATION '{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/UnsupportedTypes/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
unsupported_partition_types
---- CREATE_HIVE
-- Create a table that is partitioned on an unsupported partition-column type
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (
  int_col INT)
PARTITIONED BY (t TIMESTAMP);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
old_rcfile_table
---- COLUMNS
key INT
value STRING
---- DEPENDENT_LOAD
LOAD DATA LOCAL INPATH '${{env:IMPALA_HOME}}/testdata/data/oldrcfile.rc' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
bad_text_lzo
---- COLUMNS
field STRING
---- DEPENDENT_LOAD
-- Error recovery test data for LZO compression.
LOAD DATA LOCAL INPATH '${{env:IMPALA_HOME}}/testdata/bad_text_lzo/bad_text.lzo' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
bad_seq_snap
---- COLUMNS
field STRING
---- DEPENDENT_LOAD
-- This data file contains format errors and is accessed by the unit test: sequence-file-recover-test.
LOAD DATA LOCAL INPATH '${{env:IMPALA_HOME}}/testdata/bad_seq_snap/bad_file' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
-- IMPALA-694: uses data file produced by parquet-mr version 1.2.5-cdh4.5.0
-- (can't use LOAD DATA LOCAL with Impala so copied in create-load-data.sh)
functional
---- BASE_TABLE_NAME
bad_parquet
---- COLUMNS
field STRING
====
---- DATASET
functional
---- BASE_TABLE_NAME
map_table
---- CREATE_HIVE
-- For structured-type testing
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (map_col map<int, string>);
====
---- DATASET
functional
---- BASE_TABLE_NAME
map_table_hbase
---- COLUMNS
key string
map_col map<string, string>
---- LOAD
-- TODO: Combine this table and the 'map_table' above when the data loading framework
-- has better support for specifying the executor (Hive vs Impala) for a table section.
====
---- DATASET
functional
---- BASE_TABLE_NAME
array_table
---- CREATE_HIVE
-- For structured-type testing
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (array_col array<int>);
====
---- DATASET
functional
---- BASE_TABLE_NAME
bad_serde
---- CREATE_HIVE
-- For incompatible SerDe testing
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (col int)
ROW FORMAT serde "org.apache.hadoop.hive.serde2.binarysortable.BinarySortableSerDe";
====
---- DATASET
functional
---- BASE_TABLE_NAME
rcfile_lazy_binary_serde
---- CREATE_HIVE
-- For incompatible SerDe testing
CREATE TABLE IF NOT EXISTS {db_name}{db_suffix}.{table_name} (int_col int)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.columnar.LazyBinaryColumnarSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.RCFileInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.RCFileOutputFormat';
====
---- DATASET
functional
---- BASE_TABLE_NAME
decimal_tbl
---- COLUMNS
d1 DECIMAL
d2 DECIMAL(10, 0)
d3 DECIMAL(20, 10)
d4 DECIMAL(38, 38)
d5 DECIMAL(10, 5)
---- ROW_FORMAT
delimited fields terminated by ','
---- LOAD
`hadoop fs -mkdir -p /test-warehouse/decimal_tbl && hadoop fs -put -f \
${IMPALA_HOME}/testdata/data/decimal_tbl.txt /test-warehouse/decimal_tbl/
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}
select * from functional.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
decimal_tiny
---- COLUMNS
c1 DECIMAL(10, 4)
c2 DECIMAL(15, 5)
c3 DECIMAL(1,1)
---- ROW_FORMAT
delimited fields terminated by ','
---- LOAD
`hadoop fs -mkdir -p /test-warehouse/decimal_tiny && hadoop fs -put -f \
${IMPALA_HOME}/testdata/data/decimal-tiny.txt /test-warehouse/decimal_tiny/
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}
select * from functional.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
widetable_250_cols
---- COLUMNS
`${IMPALA_HOME}/testdata/common/widetable.py --get_columns -n 250
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}
select * from functional.{table_name};
---- LOAD
`${IMPALA_HOME}/testdata/common/widetable.py --create_data -n 250 -o /tmp/widetable_data.csv
====
---- DATASET
functional
---- BASE_TABLE_NAME
widetable_500_cols
---- COLUMNS
`${IMPALA_HOME}/testdata/common/widetable.py --get_columns -n 500
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}
select * from functional.{table_name};
---- LOAD
`${IMPALA_HOME}/testdata/common/widetable.py --create_data -n 500 -o /tmp/widetable_data.csv
====
---- DATASET
functional
---- BASE_TABLE_NAME
widetable_1000_cols
---- COLUMNS
`${IMPALA_HOME}/testdata/common/widetable.py --get_columns -n 1000
---- ROW_FORMAT
delimited fields terminated by ','  escaped by '\\'
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}
select * from functional.{table_name};
---- LOAD
`${IMPALA_HOME}/testdata/common/widetable.py --create_data -n 1000 -o /tmp/widetable_data.csv
====
