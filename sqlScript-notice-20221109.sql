--공지사항 notice.jsp 테스트
--///////////////////////////////////////////////////
DROP TABLE IF EXISTS tb_user;
CREATE TABLE tb_user
(
	user_no serial PRIMARY KEY NOT NULL 
,	user_id varchar(100) NOT NULL 
,	user_pwd varchar(100) NOT NULL 
,	user_name varchar(100) NOT NULL 
,	user_phone varchar(100) NOT NULL 
,	user_regdate timestamp
,	user_activate char NOT NULL 
,	user_role	integer NOT NULL 
);

SELECT * FROM tb_user;

INSERT INTO tb_user
(user_id, user_pwd, user_name, user_phone, user_regdate, user_activate, user_role)
VALUES('ezen@gmail.com', '0111', 'ezen', '010-1111-2222', now(), 0, 1);

INSERT INTO tb_user
(user_id, user_pwd, user_name, user_phone, user_regdate, user_activate, user_role)
VALUES('admin@gmail.com', '0111', '관리자', '010-1111-1111', now(), 0, 0);


--///////////////////////////////////////////////////
drop table if exists tb_notice;
create table tb_notice
(
	notice_id		serial		primary KEY
,	user_id			varchar(100)	NOT NULL		
,	notice_title  	varchar(200)	not null
,	notice_context	text
,	notice_regdate	Timestamp
,	notice_category	integer	NOT NULL DEFAULT 1
,	notice_private	boolean NOT NULL DEFAULT FALSE 
,	view_cnt		int default 0
);

SELECT * FROM tb_notice;

INSERT INTO public.tb_notice
(writer, notice_title, notice_context, notice_regdate, notice_category, notice_private, view_cnt)
VALUES(1, '공지사항1', '공지사항내용1', now(), 1, FALSE, 1);

INSERT INTO tb_notice
(user_id, notice_title, notice_context, notice_regdate, notice_category, notice_private, view_cnt)
VALUES('ezen@gmail.com', '이벤트5', '이벤트입니다5', now(), 2, TRUE, 0);

ALTER TABLE tb_notice ADD FOREIGN KEY (user_id)
REFERENCES tb_user(user_id)
;

//컬럼명 변경
ALTER TABLE tb_notice RENAME COLUMN user_id TO writer;