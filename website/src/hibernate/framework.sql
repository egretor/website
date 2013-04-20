-----------------------------------------------------
-- Export file for user FRAMEWORK                  --
-- Created by Administrator on 2013/4/20, 10:42:08 --
-----------------------------------------------------

spool framework.log

prompt
prompt Creating table MANAGE_CATALOG
prompt =============================
prompt
create table MANAGE_CATALOG
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  NAME           VARCHAR2(4000) not null,
  SERIAL         NUMBER(32) not null
)
;
comment on table MANAGE_CATALOG
  is '����';
comment on column MANAGE_CATALOG.UUID
  is '���';
comment on column MANAGE_CATALOG.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_CATALOG.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_CATALOG.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_CATALOG.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_CATALOG.REMARK
  is '��ע';
comment on column MANAGE_CATALOG.NAME
  is '����';
comment on column MANAGE_CATALOG.SERIAL
  is '���';
alter table MANAGE_CATALOG
  add constraint MANAGE_CATALOG_PK_UUID primary key (UUID);
alter table MANAGE_CATALOG
  add constraint MANAGE_CATALOG_UQ_NAME unique (NAME);

prompt
prompt Creating table MANAGE_FUNCTION
prompt ==============================
prompt
create table MANAGE_FUNCTION
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  ACTION         VARCHAR2(1000) not null,
  EXECUTE        VARCHAR2(1000) not null
)
;
comment on table MANAGE_FUNCTION
  is '����';
comment on column MANAGE_FUNCTION.UUID
  is '���';
comment on column MANAGE_FUNCTION.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_FUNCTION.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_FUNCTION.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_FUNCTION.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_FUNCTION.REMARK
  is '��ע';
comment on column MANAGE_FUNCTION.ACTION
  is '�';
comment on column MANAGE_FUNCTION.EXECUTE
  is 'ִ��';
alter table MANAGE_FUNCTION
  add constraint MANAGE_FUNCTION_PK_UUID primary key (UUID);
alter table MANAGE_FUNCTION
  add constraint MANAGE_FUNCTION_UQ_AE unique (ACTION, EXECUTE);

prompt
prompt Creating table MANAGE_GROUP
prompt ===========================
prompt
create table MANAGE_GROUP
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  NAME           VARCHAR2(4000) not null,
  SERIAL         NUMBER(32) not null
)
;
comment on table MANAGE_GROUP
  is '��';
comment on column MANAGE_GROUP.UUID
  is '���';
comment on column MANAGE_GROUP.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_GROUP.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_GROUP.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_GROUP.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_GROUP.REMARK
  is '��ע';
comment on column MANAGE_GROUP.NAME
  is '����';
comment on column MANAGE_GROUP.SERIAL
  is '���';
alter table MANAGE_GROUP
  add constraint MANAGE_GROUP_PK_UUID primary key (UUID);
alter table MANAGE_GROUP
  add constraint MANAGE_GROUP_UQ_NAME unique (NAME);

prompt
prompt Creating table MANAGE_MENU
prompt ==========================
prompt
create table MANAGE_MENU
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  CATALOG_ID     VARCHAR2(32) not null,
  NAME           VARCHAR2(4000) not null,
  SERIAL         NUMBER(32) not null
)
;
comment on table MANAGE_MENU
  is '�˵�';
comment on column MANAGE_MENU.UUID
  is '���';
comment on column MANAGE_MENU.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_MENU.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_MENU.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_MENU.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_MENU.REMARK
  is '��ע';
comment on column MANAGE_MENU.CATALOG_ID
  is '������';
comment on column MANAGE_MENU.NAME
  is '����';
comment on column MANAGE_MENU.SERIAL
  is '���';
alter table MANAGE_MENU
  add constraint MANAGE_MENU_PK_UUID primary key (UUID);
alter table MANAGE_MENU
  add constraint MANAGE_MENU_UQ_CN unique (CATALOG_ID, NAME);
alter table MANAGE_MENU
  add constraint MANAGE_MENU_FK_CATALOG foreign key (CATALOG_ID)
  references MANAGE_CATALOG (UUID);

prompt
prompt Creating table MANAGE_LINK
prompt ==========================
prompt
create table MANAGE_LINK
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  MENU_ID        VARCHAR2(32) not null,
  NAME           VARCHAR2(4000) not null,
  URL            VARCHAR2(4000) not null,
  SERIAL         NUMBER(32) not null
)
;
comment on table MANAGE_LINK
  is '����';
comment on column MANAGE_LINK.UUID
  is '���';
comment on column MANAGE_LINK.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_LINK.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_LINK.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_LINK.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_LINK.REMARK
  is '��ע';
comment on column MANAGE_LINK.MENU_ID
  is '�˵����';
comment on column MANAGE_LINK.NAME
  is '����';
comment on column MANAGE_LINK.URL
  is '��ַ';
comment on column MANAGE_LINK.SERIAL
  is '���';
alter table MANAGE_LINK
  add constraint MANAGE_LINK_PK_UUID primary key (UUID);
alter table MANAGE_LINK
  add constraint MANAGE_LINK_UQ_MN unique (MENU_ID, NAME);
alter table MANAGE_LINK
  add constraint MANAGE_LINK_FK_MENU foreign key (MENU_ID)
  references MANAGE_MENU (UUID);

prompt
prompt Creating table MANAGE_GROUP_LINK
prompt ================================
prompt
create table MANAGE_GROUP_LINK
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  GROUP_ID       VARCHAR2(32) not null,
  LINK_ID        VARCHAR2(32) not null
)
;
comment on table MANAGE_GROUP_LINK
  is '������';
comment on column MANAGE_GROUP_LINK.UUID
  is '���';
comment on column MANAGE_GROUP_LINK.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_GROUP_LINK.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_GROUP_LINK.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_GROUP_LINK.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_GROUP_LINK.REMARK
  is '��ע';
comment on column MANAGE_GROUP_LINK.GROUP_ID
  is '����';
comment on column MANAGE_GROUP_LINK.LINK_ID
  is '���ӱ��';
alter table MANAGE_GROUP_LINK
  add constraint MANAGE_GROUP_LINK_PK_UUID primary key (UUID);
alter table MANAGE_GROUP_LINK
  add constraint MANAGE_GROUP_LINK_UQ_GL unique (GROUP_ID, LINK_ID);
alter table MANAGE_GROUP_LINK
  add constraint MANAGE_GROUP_LINK_FK_GROUP foreign key (GROUP_ID)
  references MANAGE_GROUP (UUID);
alter table MANAGE_GROUP_LINK
  add constraint MANAGE_GROUP_LINK_FK_LINK foreign key (LINK_ID)
  references MANAGE_LINK (UUID);

prompt
prompt Creating table MANAGE_MODULE
prompt ============================
prompt
create table MANAGE_MODULE
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  NAME           VARCHAR2(4000) not null,
  SERIAL         NUMBER(32) not null
)
;
comment on table MANAGE_MODULE
  is 'ģ��';
comment on column MANAGE_MODULE.UUID
  is '���';
comment on column MANAGE_MODULE.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_MODULE.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_MODULE.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_MODULE.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_MODULE.REMARK
  is '��ע';
comment on column MANAGE_MODULE.NAME
  is '����';
comment on column MANAGE_MODULE.SERIAL
  is '���';
alter table MANAGE_MODULE
  add constraint MANAGE_MODULE_PK_UUID primary key (UUID);
alter table MANAGE_MODULE
  add constraint MANAGE_MODULE_UQ_NAME unique (NAME);

prompt
prompt Creating table MANAGE_GROUP_MODULE
prompt ==================================
prompt
create table MANAGE_GROUP_MODULE
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  GROUP_ID       VARCHAR2(32) not null,
  MODULE_ID      VARCHAR2(32) not null
)
;
comment on table MANAGE_GROUP_MODULE
  is '��ģ��';
comment on column MANAGE_GROUP_MODULE.UUID
  is '���';
comment on column MANAGE_GROUP_MODULE.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_GROUP_MODULE.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_GROUP_MODULE.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_GROUP_MODULE.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_GROUP_MODULE.REMARK
  is '��ע';
comment on column MANAGE_GROUP_MODULE.GROUP_ID
  is '����';
comment on column MANAGE_GROUP_MODULE.MODULE_ID
  is 'ģ����';
alter table MANAGE_GROUP_MODULE
  add constraint MANAGE_GROUP_MODULE_PK_UUID primary key (UUID);
alter table MANAGE_GROUP_MODULE
  add constraint MANAGE_GROUP_MODULE_UQ_GM unique (GROUP_ID, MODULE_ID);
alter table MANAGE_GROUP_MODULE
  add constraint MANAGE_GROUP_MODULE_FK_GROUP foreign key (GROUP_ID)
  references MANAGE_GROUP (UUID);
alter table MANAGE_GROUP_MODULE
  add constraint MANAGE_GROUP_MODULE_FK_MODULE foreign key (MODULE_ID)
  references MANAGE_MODULE (UUID);

prompt
prompt Creating table MANAGE_USER
prompt ==========================
prompt
create table MANAGE_USER
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  NAME           VARCHAR2(4000) not null,
  ACCOUNT        VARCHAR2(4000) not null,
  PASSWORD       VARCHAR2(4000) not null,
  PREROGATIVE    NUMBER(1) not null
)
;
comment on table MANAGE_USER
  is '�û�';
comment on column MANAGE_USER.UUID
  is '���';
comment on column MANAGE_USER.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_USER.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_USER.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_USER.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_USER.REMARK
  is '��ע';
comment on column MANAGE_USER.NAME
  is '����';
comment on column MANAGE_USER.ACCOUNT
  is '�ʺ�';
comment on column MANAGE_USER.PASSWORD
  is '����';
comment on column MANAGE_USER.PREROGATIVE
  is '��Ȩ';
alter table MANAGE_USER
  add constraint MANAGE_USER_PK_UUID primary key (UUID);
alter table MANAGE_USER
  add constraint MANAGE_USER_UQ_ACCOUNT unique (ACCOUNT);

prompt
prompt Creating table MANAGE_GROUP_USER
prompt ================================
prompt
create table MANAGE_GROUP_USER
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  GROUP_ID       VARCHAR2(32) not null,
  USER_ID        VARCHAR2(32) not null
)
;
comment on table MANAGE_GROUP_USER
  is '���û�';
comment on column MANAGE_GROUP_USER.UUID
  is '���';
comment on column MANAGE_GROUP_USER.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_GROUP_USER.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_GROUP_USER.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_GROUP_USER.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_GROUP_USER.REMARK
  is '��ע';
comment on column MANAGE_GROUP_USER.GROUP_ID
  is '����';
comment on column MANAGE_GROUP_USER.USER_ID
  is '�û����';
alter table MANAGE_GROUP_USER
  add constraint MANAGE_GROUP_USER_PK_UUID primary key (UUID);
alter table MANAGE_GROUP_USER
  add constraint MANAGE_GROUP_USER_UQ_GU unique (GROUP_ID, USER_ID);
alter table MANAGE_GROUP_USER
  add constraint MANAGE_GROUP_USER_FK_GROUP foreign key (GROUP_ID)
  references MANAGE_GROUP (UUID);
alter table MANAGE_GROUP_USER
  add constraint MANAGE_GROUP_USER_FK_USER foreign key (USER_ID)
  references MANAGE_USER (UUID);

prompt
prompt Creating table MANAGE_MODULE_FUNCTION
prompt =====================================
prompt
create table MANAGE_MODULE_FUNCTION
(
  UUID           VARCHAR2(32) not null,
  INSERT_USER_ID VARCHAR2(32) not null,
  INSERT_TIME    TIMESTAMP(6) not null,
  UPDATE_USER_ID VARCHAR2(32) not null,
  UPDATE_TIME    TIMESTAMP(6) not null,
  REMARK         CLOB,
  MODULE_ID      VARCHAR2(32) not null,
  FUNCTION_ID    VARCHAR2(32) not null
)
;
comment on table MANAGE_MODULE_FUNCTION
  is 'ģ�鹦��';
comment on column MANAGE_MODULE_FUNCTION.UUID
  is '���';
comment on column MANAGE_MODULE_FUNCTION.INSERT_USER_ID
  is '���������û����';
comment on column MANAGE_MODULE_FUNCTION.INSERT_TIME
  is '����ʱ��';
comment on column MANAGE_MODULE_FUNCTION.UPDATE_USER_ID
  is '�޸Ĳ����û����';
comment on column MANAGE_MODULE_FUNCTION.UPDATE_TIME
  is '�޸�ʱ��';
comment on column MANAGE_MODULE_FUNCTION.REMARK
  is '��ע';
comment on column MANAGE_MODULE_FUNCTION.MODULE_ID
  is 'ģ����';
comment on column MANAGE_MODULE_FUNCTION.FUNCTION_ID
  is '���ܱ��';
alter table MANAGE_MODULE_FUNCTION
  add constraint MANAGE_MODULE_FUNCTION_PK_UUID primary key (UUID);
alter table MANAGE_MODULE_FUNCTION
  add constraint MANAGE_MODULE_FUNCTION_UQ_MF unique (MODULE_ID, FUNCTION_ID);
alter table MANAGE_MODULE_FUNCTION
  add constraint MANAGE_MODULE_FUNCTION_FK_F foreign key (FUNCTION_ID)
  references MANAGE_FUNCTION (UUID);
alter table MANAGE_MODULE_FUNCTION
  add constraint MANAGE_MODULE_FUNCTION_FK_M foreign key (MODULE_ID)
  references MANAGE_MODULE (UUID);


spool off
