
/* Drop Tables */

DROP TABLE board2 CASCADE CONSTRAINTS;
DROP TABLE JOINS CASCADE CONSTRAINTS;




/* Create Tables */
CREATE TABLE board2
(
	num number(20) NOT NULL,
	id varchar2(20) NOT NULL,
	place varchar2(100),
	date1 date,
	files varchar2(500),
	btype varchar2(20),
	subtype varchar2(10),
	content varchar2(500),
	subject varchar2(100),
  readcnt number(4),
  ref number(4),
  reflevel number(4),
  refstep number(4),
	PRIMARY KEY (num)
);


CREATE TABLE board2
(
	-- �Խù���ȣ
	num number(100) NOT NULL,
	id varchar2(20) NOT NULL,
	-- ���
	place varchar2(100),
	date1 date,
	-- ÷������
	files varchar2(500),
	-- 1.ȣ�ڼҰ�
	-- 2.�ı�Խ���
	-- 3.Q&A
	-- 4.�����Խ���
	btype varchar2(20),
	-- 1.����
	-- 2.����
	-- 3.����
	-- 4.����
	subtype varchar2(10),
	-- �۳���
	-- 
	content varchar2(500),
	-- ����
	-- 
	subject varchar2(100),
	PRIMARY KEY (num)
);


CREATE TABLE JOINS
(
	-- ���̵�
	ID varchar2(20) NOT NULL,
	-- ȸ������ �̸�
	NAME varchar2(10) NOT NULL,
	-- ȸ������ �г���
	NICKNAME varchar2(20) NOT NULL,
	-- ȸ������ ��й�ȣ
	PASSWORD number(20) NOT NULL,
	-- ��￡ ���� ���
	PLACE varchar2(20) NOT NULL,
	-- ��ȭ��ȣ �Է�
	NUMBER number(20) NOT NULL,
	PRIMARY KEY (ID)
);



/* Comments */

COMMENT ON COLUMN board2.num IS '�Խù���ȣ';
COMMENT ON COLUMN board2.place IS '���';
COMMENT ON COLUMN board2.files IS '÷������';
COMMENT ON COLUMN board2.btype IS '1.ȣ�ڼҰ�
2.�ı�Խ���
3.Q&A
4.�����Խ���';
COMMENT ON COLUMN board2.subtype IS '1.����
2.����
3.����
4.����';
COMMENT ON COLUMN board2.content IS '�۳���
';
COMMENT ON COLUMN board2.subject IS '����
';
COMMENT ON COLUMN JOINS.ID IS '���̵�';
COMMENT ON COLUMN JOINS.NAME IS 'ȸ������ �̸�';
COMMENT ON COLUMN JOINS.NICKNAME IS 'ȸ������ �г���';
COMMENT ON COLUMN JOINS.PASSWORD IS 'ȸ������ ��й�ȣ';
COMMENT ON COLUMN JOINS.PLACE IS '��￡ ���� ���';
COMMENT ON COLUMN JOINS.NUMBER IS '��ȭ��ȣ �Է�';



