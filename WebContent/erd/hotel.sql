
/* Drop Tables */

DROP TABLE board2 CASCADE CONSTRAINTS;
DROP TABLE JOINS CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board2
(
	-- 게시물번호
	num number(100) NOT NULL,
	ID varchar2(20) NOT NULL,
	-- 장소
	place varchar2(100),
	date date,
	-- 첨부파일
	files varchar2(500),
	-- 1.호텔소개
	-- 2.후기게시판
	-- 3.Q&A
	-- 4.자유게시판
	btype number(20),
	-- 1.강남
	-- 2.강동
	-- 3.강서
	-- 4.강북
	subtype varchar2(10),
	-- 답변글
	ref varchar2(200),
	-- 글내용
	-- 
	content varchar2(500),
	-- 제목
	-- 
	subject varchar2(100),
	PRIMARY KEY (num)
);


CREATE TABLE JOINS
(
	-- 아이디
	ID varchar2(20) NOT NULL,
	-- 회원가입 이름
	NAME varchar2(10) NOT NULL,
	-- 회원가입 닉네임
	NICKNAME varchar2(20) NOT NULL,
	-- 회원가입 비밀번호
	PASSWORD number(20) NOT NULL,
	-- 기억에 남는 장소
	PLACE varchar2(20) NOT NULL,
	-- 전화번호 입력
	NUMBER number(20) NOT NULL,
	PRIMARY KEY (ID)
);



/* Comments */

COMMENT ON COLUMN board2.num IS '게시물번호';
COMMENT ON COLUMN board2.place IS '장소';
COMMENT ON COLUMN board2.files IS '첨부파일';
COMMENT ON COLUMN board2.btype IS '1.호텔소개
2.후기게시판
3.Q&A
4.자유게시판';
COMMENT ON COLUMN board2.subtype IS '1.강남
2.강동
3.강서
4.강북';
COMMENT ON COLUMN board2.ref IS '답변글';
COMMENT ON COLUMN board2.content IS '글내용
';
COMMENT ON COLUMN board2.subject IS '제목
';
COMMENT ON COLUMN JOINS.ID IS '아이디';
COMMENT ON COLUMN JOINS.NAME IS '회원가입 이름';
COMMENT ON COLUMN JOINS.NICKNAME IS '회원가입 닉네임';
COMMENT ON COLUMN JOINS.PASSWORD IS '회원가입 비밀번호';
COMMENT ON COLUMN JOINS.PLACE IS '기억에 남는 장소';
COMMENT ON COLUMN JOINS.NUMBER IS '전화번호 입력';



