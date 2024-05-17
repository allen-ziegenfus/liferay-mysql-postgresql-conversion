CREATE RULE delete_analyticsmessage_body AS
    ON DELETE TO public.analyticsmessage DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.body))) THEN lo_unlink(old.body)
            ELSE NULL::integer
        END AS "case"
   FROM public.analyticsmessage
  WHERE (analyticsmessage.body = old.body);


CREATE RULE delete_batchengineexporttask_content AS
    ON DELETE TO public.batchengineexporttask DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.content))) THEN lo_unlink(old.content)
            ELSE NULL::integer
        END AS "case"
   FROM public.batchengineexporttask
  WHERE (batchengineexporttask.content = old.content);



CREATE RULE delete_batchengineimporttask_content AS
    ON DELETE TO public.batchengineimporttask DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.content))) THEN lo_unlink(old.content)
            ELSE NULL::integer
        END AS "case"
   FROM public.batchengineimporttask
  WHERE (batchengineimporttask.content = old.content);




CREATE RULE delete_ctscontent_data_ AS
    ON DELETE TO public.ctscontent DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.data_))) THEN lo_unlink(old.data_)
            ELSE NULL::integer
        END AS "case"
   FROM public.ctscontent
  WHERE (ctscontent.data_ = old.data_);


CREATE RULE delete_dlcontent_data_ AS
    ON DELETE TO public.dlcontent DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.data_))) THEN lo_unlink(old.data_)
            ELSE NULL::integer
        END AS "case"
   FROM public.dlcontent
  WHERE (dlcontent.data_ = old.data_);


CREATE RULE update_analyticsmessage_body AS
    ON UPDATE TO public.analyticsmessage
   WHERE ((old.body IS DISTINCT FROM new.body) AND (old.body IS NOT NULL)) DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.body))) THEN lo_unlink(old.body)
            ELSE NULL::integer
        END AS "case"
   FROM public.analyticsmessage
  WHERE (analyticsmessage.body = old.body);

CREATE RULE update_batchengineexporttask_content AS
    ON UPDATE TO public.batchengineexporttask
   WHERE ((old.content IS DISTINCT FROM new.content) AND (old.content IS NOT NULL)) DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.content))) THEN lo_unlink(old.content)
            ELSE NULL::integer
        END AS "case"
   FROM public.batchengineexporttask
  WHERE (batchengineexporttask.content = old.content);


CREATE RULE update_batchengineimporttask_content AS
    ON UPDATE TO public.batchengineimporttask
   WHERE ((old.content IS DISTINCT FROM new.content) AND (old.content IS NOT NULL)) DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.content))) THEN lo_unlink(old.content)
            ELSE NULL::integer
        END AS "case"
   FROM public.batchengineimporttask
  WHERE (batchengineimporttask.content = old.content);



CREATE RULE update_ctscontent_data_ AS
    ON UPDATE TO public.ctscontent
   WHERE ((old.data_ IS DISTINCT FROM new.data_) AND (old.data_ IS NOT NULL)) DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.data_))) THEN lo_unlink(old.data_)
            ELSE NULL::integer
        END AS "case"
   FROM public.ctscontent
  WHERE (ctscontent.data_ = old.data_);


CREATE RULE update_dlcontent_data_ AS
    ON UPDATE TO public.dlcontent
   WHERE ((old.data_ IS DISTINCT FROM new.data_) AND (old.data_ IS NOT NULL)) DO  SELECT
        CASE
            WHEN (EXISTS ( SELECT 1
               FROM pg_largeobject_metadata
              WHERE (pg_largeobject_metadata.oid = old.data_))) THEN lo_unlink(old.data_)
            ELSE NULL::integer
        END AS "case"
   FROM public.dlcontent
  WHERE (dlcontent.data_ = old.data_);