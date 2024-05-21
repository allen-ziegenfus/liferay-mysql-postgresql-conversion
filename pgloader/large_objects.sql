ALTER TABLE analyticsmessage RENAME COLUMN body TO body_bytes;
ALTER TABLE analyticsmessage ADD COLUMN body OID;
UPDATE analyticsmessage SET body = lo_from_bytea(0, body_bytes::bytea), body_bytes = NULL;
ALTER TABLE analyticsmessage DROP COLUMN body_bytes;

ALTER TABLE batchengineexporttask RENAME COLUMN content TO content_bytes;
ALTER TABLE batchengineexporttask ADD COLUMN content OID;
UPDATE batchengineexporttask SET content = lo_from_bytea(0, content_bytes::bytea), content_bytes = NULL;
ALTER TABLE batchengineexporttask DROP COLUMN content_bytes;

ALTER TABLE batchengineimporttask RENAME COLUMN content TO content_bytes;
ALTER TABLE batchengineimporttask ADD COLUMN content OID;
UPDATE batchengineimporttask SET content = lo_from_bytea(0, content_bytes::bytea), content_bytes = NULL;
ALTER TABLE batchengineimporttask DROP COLUMN content_bytes;

ALTER TABLE ctscontent RENAME COLUMN data_ TO data_bytes;
ALTER TABLE ctscontent ADD COLUMN data_ OID;
UPDATE ctscontent SET data_ = lo_from_bytea(0, data_bytes::bytea), data_bytes = NULL;
ALTER TABLE ctscontent DROP COLUMN data_bytes;

ALTER TABLE dlcontent RENAME COLUMN data_ TO data_bytes;
ALTER TABLE dlcontent ADD COLUMN data_ OID;
UPDATE dlcontent SET data_ = lo_from_bytea(0, data_bytes::bytea), data_bytes = NULL;
ALTER TABLE dlcontent DROP COLUMN data_bytes;
