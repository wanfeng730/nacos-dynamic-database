-- public.config_info definition

-- Drop table

-- DROP TABLE public.config_info;

CREATE TABLE public.config_info (
        id bigserial NOT NULL, -- id
        data_id varchar(255) NOT NULL, -- data_id
        group_id varchar(255) NULL,
        "content" text NOT NULL, -- content
        md5 varchar(32) NULL, -- md5
        gmt_create timestamp(6) NOT NULL, -- 创建时间
        gmt_modified timestamp(6) NOT NULL, -- 修改时间
        src_user text NULL, -- source user
        src_ip varchar(20) NULL, -- source ip
        app_name varchar(128) NULL,
        tenant_id varchar(128) NULL, -- 租户字段
        c_desc varchar(256) NULL,
        c_use varchar(64) NULL,
        effect varchar(64) NULL,
        "type" varchar(64) NULL,
        c_schema text NULL,
        encrypted_data_key text NOT NULL, -- 秘钥
        CONSTRAINT config_info_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX uk_configinfo_datagrouptenant ON public.config_info USING btree (data_id, group_id, tenant_id);
COMMENT ON TABLE public.config_info IS 'config_info';

-- Column comments

COMMENT ON COLUMN public.config_info.id IS 'id';
COMMENT ON COLUMN public.config_info.data_id IS 'data_id';
COMMENT ON COLUMN public.config_info."content" IS 'content';
COMMENT ON COLUMN public.config_info.md5 IS 'md5';
COMMENT ON COLUMN public.config_info.gmt_create IS '创建时间';
COMMENT ON COLUMN public.config_info.gmt_modified IS '修改时间';
COMMENT ON COLUMN public.config_info.src_user IS 'source user';
COMMENT ON COLUMN public.config_info.src_ip IS 'source ip';
COMMENT ON COLUMN public.config_info.tenant_id IS '租户字段';
COMMENT ON COLUMN public.config_info.encrypted_data_key IS '秘钥';


-- public.config_info_aggr definition

-- Drop table

-- DROP TABLE public.config_info_aggr;

CREATE TABLE public.config_info_aggr (
             id bigserial NOT NULL, -- id
             data_id varchar(255) NOT NULL, -- data_id
             group_id varchar(255) NOT NULL, -- group_id
             datum_id varchar(255) NOT NULL, -- datum_id
             "content" text NOT NULL, -- 内容
             gmt_modified timestamp(6) NOT NULL, -- 修改时间
             app_name varchar(128) NULL,
             tenant_id varchar(128) NULL, -- 租户字段
             CONSTRAINT config_info_aggr_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX uk_configinfoaggr_datagrouptenantdatum ON public.config_info_aggr USING btree (data_id, group_id, tenant_id, datum_id);
COMMENT ON TABLE public.config_info_aggr IS '增加租户字段';

-- Column comments

COMMENT ON COLUMN public.config_info_aggr.id IS 'id';
COMMENT ON COLUMN public.config_info_aggr.data_id IS 'data_id';
COMMENT ON COLUMN public.config_info_aggr.group_id IS 'group_id';
COMMENT ON COLUMN public.config_info_aggr.datum_id IS 'datum_id';
COMMENT ON COLUMN public.config_info_aggr."content" IS '内容';
COMMENT ON COLUMN public.config_info_aggr.gmt_modified IS '修改时间';
COMMENT ON COLUMN public.config_info_aggr.tenant_id IS '租户字段';


-- public.config_info_beta definition

-- Drop table

-- DROP TABLE public.config_info_beta;

CREATE TABLE public.config_info_beta (
             id bigserial NOT NULL, -- id
             data_id varchar(255) NOT NULL, -- data_id
             group_id varchar(128) NOT NULL, -- group_id
             app_name varchar(128) NULL, -- app_name
             "content" text NOT NULL, -- content
             beta_ips varchar(1024) NULL, -- betaIps
             md5 varchar(32) NULL, -- md5
             gmt_create timestamp(6) NOT NULL, -- 创建时间
             gmt_modified timestamp(6) NOT NULL, -- 修改时间
             src_user text NULL, -- source user
             src_ip varchar(20) NULL, -- source ip
             tenant_id varchar(128) NULL, -- 租户字段
             encrypted_data_key text NOT NULL, -- 秘钥
             CONSTRAINT config_info_beta_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX uk_configinfobeta_datagrouptenant ON public.config_info_beta USING btree (data_id, group_id, tenant_id);
COMMENT ON TABLE public.config_info_beta IS 'config_info_beta';

-- Column comments

COMMENT ON COLUMN public.config_info_beta.id IS 'id';
COMMENT ON COLUMN public.config_info_beta.data_id IS 'data_id';
COMMENT ON COLUMN public.config_info_beta.group_id IS 'group_id';
COMMENT ON COLUMN public.config_info_beta.app_name IS 'app_name';
COMMENT ON COLUMN public.config_info_beta."content" IS 'content';
COMMENT ON COLUMN public.config_info_beta.beta_ips IS 'betaIps';
COMMENT ON COLUMN public.config_info_beta.md5 IS 'md5';
COMMENT ON COLUMN public.config_info_beta.gmt_create IS '创建时间';
COMMENT ON COLUMN public.config_info_beta.gmt_modified IS '修改时间';
COMMENT ON COLUMN public.config_info_beta.src_user IS 'source user';
COMMENT ON COLUMN public.config_info_beta.src_ip IS 'source ip';
COMMENT ON COLUMN public.config_info_beta.tenant_id IS '租户字段';
COMMENT ON COLUMN public.config_info_beta.encrypted_data_key IS '秘钥';


-- public.config_info_tag definition

-- Drop table

-- DROP TABLE public.config_info_tag;

CREATE TABLE public.config_info_tag (
            id bigserial NOT NULL, -- id
            data_id varchar(255) NOT NULL, -- data_id
            group_id varchar(128) NOT NULL, -- group_id
            tenant_id varchar(128) NULL, -- tenant_id
            tag_id varchar(128) NOT NULL, -- tag_id
            app_name varchar(128) NULL, -- app_name
            "content" text NOT NULL, -- content
            md5 varchar(32) NULL, -- md5
            gmt_create timestamp(6) NOT NULL, -- 创建时间
            gmt_modified timestamp(6) NOT NULL, -- 修改时间
            src_user text NULL, -- source user
            src_ip varchar(20) NULL, -- source ip
            CONSTRAINT config_info_tag_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX uk_configinfotag_datagrouptenanttag ON public.config_info_tag USING btree (data_id, group_id, tenant_id, tag_id);
COMMENT ON TABLE public.config_info_tag IS 'config_info_tag';

-- Column comments

COMMENT ON COLUMN public.config_info_tag.id IS 'id';
COMMENT ON COLUMN public.config_info_tag.data_id IS 'data_id';
COMMENT ON COLUMN public.config_info_tag.group_id IS 'group_id';
COMMENT ON COLUMN public.config_info_tag.tenant_id IS 'tenant_id';
COMMENT ON COLUMN public.config_info_tag.tag_id IS 'tag_id';
COMMENT ON COLUMN public.config_info_tag.app_name IS 'app_name';
COMMENT ON COLUMN public.config_info_tag."content" IS 'content';
COMMENT ON COLUMN public.config_info_tag.md5 IS 'md5';
COMMENT ON COLUMN public.config_info_tag.gmt_create IS '创建时间';
COMMENT ON COLUMN public.config_info_tag.gmt_modified IS '修改时间';
COMMENT ON COLUMN public.config_info_tag.src_user IS 'source user';
COMMENT ON COLUMN public.config_info_tag.src_ip IS 'source ip';


-- public.config_tags_relation definition

-- Drop table

-- DROP TABLE public.config_tags_relation;

CREATE TABLE public.config_tags_relation (
                 id bigserial NOT NULL, -- id
                 tag_name varchar(128) NOT NULL, -- tag_name
                 tag_type varchar(64) NULL, -- tag_type
                 data_id varchar(255) NOT NULL, -- data_id
                 group_id varchar(128) NOT NULL, -- group_id
                 tenant_id varchar(128) NULL, -- tenant_id
                 nid bigserial NOT NULL,
                 CONSTRAINT config_tags_relation_pkey PRIMARY KEY (nid)
);
CREATE INDEX idx_tenant_id ON public.config_tags_relation USING btree (tenant_id);
CREATE UNIQUE INDEX uk_configtagrelation_configidtag ON public.config_tags_relation USING btree (id, tag_name, tag_type);
COMMENT ON TABLE public.config_tags_relation IS 'config_tag_relation';

-- Column comments

COMMENT ON COLUMN public.config_tags_relation.id IS 'id';
COMMENT ON COLUMN public.config_tags_relation.tag_name IS 'tag_name';
COMMENT ON COLUMN public.config_tags_relation.tag_type IS 'tag_type';
COMMENT ON COLUMN public.config_tags_relation.data_id IS 'data_id';
COMMENT ON COLUMN public.config_tags_relation.group_id IS 'group_id';
COMMENT ON COLUMN public.config_tags_relation.tenant_id IS 'tenant_id';


-- public.group_capacity definition

-- Drop table

-- DROP TABLE public.group_capacity;

CREATE TABLE public.group_capacity (
           id bigserial NOT NULL, -- 主键ID
           group_id varchar(128) NOT NULL, -- Group ID，空字符表示整个集群
           quota int4 NOT NULL, -- 配额，0表示使用默认值
           "usage" int4 NOT NULL, -- 使用量
           max_size int4 NOT NULL, -- 单个配置大小上限，单位为字节，0表示使用默认值
           max_aggr_count int4 NOT NULL, -- 聚合子配置最大个数，，0表示使用默认值
           max_aggr_size int4 NOT NULL, -- 单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值
           max_history_count int4 NOT NULL, -- 最大变更历史数量
           gmt_create timestamp(6) NOT NULL, -- 创建时间
           gmt_modified timestamp(6) NOT NULL, -- 修改时间
           CONSTRAINT group_capacity_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX uk_group_id ON public.group_capacity USING btree (group_id);
COMMENT ON TABLE public.group_capacity IS '集群、各Group容量信息表';

-- Column comments

COMMENT ON COLUMN public.group_capacity.id IS '主键ID';
COMMENT ON COLUMN public.group_capacity.group_id IS 'Group ID，空字符表示整个集群';
COMMENT ON COLUMN public.group_capacity.quota IS '配额，0表示使用默认值';
COMMENT ON COLUMN public.group_capacity."usage" IS '使用量';
COMMENT ON COLUMN public.group_capacity.max_size IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN public.group_capacity.max_aggr_count IS '聚合子配置最大个数，，0表示使用默认值';
COMMENT ON COLUMN public.group_capacity.max_aggr_size IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN public.group_capacity.max_history_count IS '最大变更历史数量';
COMMENT ON COLUMN public.group_capacity.gmt_create IS '创建时间';
COMMENT ON COLUMN public.group_capacity.gmt_modified IS '修改时间';


-- public.his_config_info definition

-- Drop table

-- DROP TABLE public.his_config_info;

CREATE TABLE public.his_config_info (
            id int8 NOT NULL,
            nid bigserial NOT NULL,
            data_id varchar(255) NOT NULL,
            group_id varchar(128) NOT NULL,
            app_name varchar(128) NULL, -- app_name
            "content" text NOT NULL,
            md5 varchar(32) NULL,
            gmt_create timestamp(6) DEFAULT '2010-05-05 00:00:00'::timestamp without time zone NOT NULL,
            gmt_modified timestamp(6) NOT NULL,
            src_user text NULL,
            src_ip varchar(20) NULL,
            op_type bpchar(10) NULL,
            tenant_id varchar(128) NULL, -- 租户字段
            encrypted_data_key text NOT NULL, -- 秘钥
            CONSTRAINT his_config_info_pkey PRIMARY KEY (nid)
);
CREATE INDEX idx_did ON public.his_config_info USING btree (data_id);
CREATE INDEX idx_gmt_create ON public.his_config_info USING btree (gmt_create);
CREATE INDEX idx_gmt_modified ON public.his_config_info USING btree (gmt_modified);
COMMENT ON TABLE public.his_config_info IS '多租户改造';

-- Column comments

COMMENT ON COLUMN public.his_config_info.app_name IS 'app_name';
COMMENT ON COLUMN public.his_config_info.tenant_id IS '租户字段';
COMMENT ON COLUMN public.his_config_info.encrypted_data_key IS '秘钥';


-- public.permissions definition

-- Drop table

-- DROP TABLE public.permissions;

CREATE TABLE public.permissions (
        "role" varchar(50) NOT NULL,
        resource varchar(512) NOT NULL,
        "action" varchar(8) NOT NULL
);
CREATE UNIQUE INDEX uk_role_permission ON public.permissions USING btree (role, resource, action);


-- public.roles definition

-- Drop table

-- DROP TABLE public.roles;

CREATE TABLE public.roles (
  username varchar(50) NOT NULL,
  "role" varchar(50) NOT NULL
);
CREATE UNIQUE INDEX uk_username_role ON public.roles USING btree (username, role);


-- public.tenant_capacity definition

-- Drop table

-- DROP TABLE public.tenant_capacity;

CREATE TABLE public.tenant_capacity (
            id bigserial NOT NULL, -- 主键ID
            tenant_id varchar(128) NOT NULL, -- Tenant ID
            quota int4 NOT NULL, -- 配额，0表示使用默认值
            "usage" int4 NOT NULL, -- 使用量
            max_size int4 NOT NULL, -- 单个配置大小上限，单位为字节，0表示使用默认值
            max_aggr_count int4 NOT NULL, -- 聚合子配置最大个数
            max_aggr_size int4 NOT NULL, -- 单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值
            max_history_count int4 NOT NULL, -- 最大变更历史数量
            gmt_create timestamp(6) NOT NULL, -- 创建时间
            gmt_modified timestamp(6) NOT NULL, -- 修改时间
            CONSTRAINT tenant_capacity_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX uk_tenant_id ON public.tenant_capacity USING btree (tenant_id);
COMMENT ON TABLE public.tenant_capacity IS '租户容量信息表';

-- Column comments

COMMENT ON COLUMN public.tenant_capacity.id IS '主键ID';
COMMENT ON COLUMN public.tenant_capacity.tenant_id IS 'Tenant ID';
COMMENT ON COLUMN public.tenant_capacity.quota IS '配额，0表示使用默认值';
COMMENT ON COLUMN public.tenant_capacity."usage" IS '使用量';
COMMENT ON COLUMN public.tenant_capacity.max_size IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN public.tenant_capacity.max_aggr_count IS '聚合子配置最大个数';
COMMENT ON COLUMN public.tenant_capacity.max_aggr_size IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN public.tenant_capacity.max_history_count IS '最大变更历史数量';
COMMENT ON COLUMN public.tenant_capacity.gmt_create IS '创建时间';
COMMENT ON COLUMN public.tenant_capacity.gmt_modified IS '修改时间';


-- public.tenant_info definition

-- Drop table

-- DROP TABLE public.tenant_info;

CREATE TABLE public.tenant_info (
        id bigserial NOT NULL, -- id
        kp varchar(128) NOT NULL, -- kp
        tenant_id varchar(128) NULL, -- tenant_id
        tenant_name varchar(128) NULL, -- tenant_name
        tenant_desc varchar(256) NULL, -- tenant_desc
        create_source varchar(32) NULL, -- create_source
        gmt_create int8 NOT NULL, -- 创建时间
        gmt_modified int8 NOT NULL -- 修改时间
);
CREATE UNIQUE INDEX uk_tenant_info_kptenantid ON public.tenant_info USING btree (kp, tenant_id);
COMMENT ON TABLE public.tenant_info IS 'tenant_info';

-- Column comments

COMMENT ON COLUMN public.tenant_info.id IS 'id';
COMMENT ON COLUMN public.tenant_info.kp IS 'kp';
COMMENT ON COLUMN public.tenant_info.tenant_id IS 'tenant_id';
COMMENT ON COLUMN public.tenant_info.tenant_name IS 'tenant_name';
COMMENT ON COLUMN public.tenant_info.tenant_desc IS 'tenant_desc';
COMMENT ON COLUMN public.tenant_info.create_source IS 'create_source';
COMMENT ON COLUMN public.tenant_info.gmt_create IS '创建时间';
COMMENT ON COLUMN public.tenant_info.gmt_modified IS '修改时间';


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
  username varchar(50) NOT NULL,
  "password" varchar(500) NOT NULL,
  enabled bool NOT NULL
);