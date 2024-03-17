DROP DATABASE IF EXISTS `2024_03_Spring_test_deepening`;
CREATE DATABASE `2024_03_Spring_test_deepening`;
USE `2024_03_Spring_test_deepening`;

######################################################################################################
# board 테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), QnA(질의응답) ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

######################################################################################################
# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;
ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;
######################################################################################################
# member 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL UNIQUE,
    loginPw CHAR(80) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname  CHAR(20) NOT NULL UNIQUE,
    cellphoneNum  CHAR(20) NOT NULL UNIQUE,
    email  CHAR(50) NOT NULL UNIQUE,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴여부(0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);
######################################################################################################
# Select하기
SELECT * 
FROM article;

SELECT * 
FROM board;

SELECT * 
FROM `member`;

SELECT LAST_INSERT_ID();

DESC article;

DESC board;

DESC `member`;
##############################################
# board 테이블에 데이터 넣기.
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'notice',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'free',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'qna',
`name` = '질의응답';


#############################################
# article 테이블 데이터 넣기.
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 1,
memberId = 2,
title = '동물 합창단 모집공고',
`body` = '동물이면 누구든지 가입할 수 있다냥!!';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 2,
memberId = 2,
title = '리썰컴퍼니 같이 할 사람 구함(1/4)',
`body` = '아 ㅋㅋ 요즘 리썰컴퍼니 안하는 흑우 없지? 진짜 재밌다 같이 할 사람 구함(1/4)';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 2,
memberId = 4,
title = '요즘 누가 리썰컴퍼니함 팰월드 하지 ㅋㅋ',
`body` = '팰월드 같이하고 싶으면 byack122 친추 go';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 2,
memberId = 1,
title = '마스터듀오 구함',
`body` = '마스터 원딜 탑레 748';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
boardId = 2,
title = '고양이',
`body` = '냥냥';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
boardId = 2,
title = '강아지',
`body` = '멍멍';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 4,
boardId = 3,
title = '병아리',
`body` = '삐약삐약';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
boardId = 1,
title = '수달',
`body` = '삑뺙';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
boardId = 1,
title = '고수달',
`body` = '초고수달';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 5,
boardId = 3,
title = '코끼리',
`body` = '뿌우뿌우';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = CEILING((RAND() * 9) / 3),
boardId = CEILING((RAND() * 9) / 3),
title = CONCAT('제목__', RAND()),
`body` = CONCAT('내용__',RAND());

SELECT *
FROM article
ORDER BY id DESC;

SELECT LAST_INSERT_ID();

DESC article;

##########################################
# member 테이블 데이터 INSERT

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = 'user1',
`authLevel` = 7,
`name` = '고수달',
nickname = '초고수달',
cellphoneNum = '01012341234',
email = 'sudal123@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user2',
loginPw = 'user2',
`name` = '고양이',
nickname = '고먐미',
cellphoneNum = '01011112222',
email = 'nyang22@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user3',
loginPw = 'user3',
`name` = '강아지',
nickname = '멈무이',
cellphoneNum = '01012345678',
email = 'mummu33@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user4',
loginPw = 'user4',
`name` = '병아리',
nickname = '뺙뺙',
cellphoneNum = '01065498745',
email = 'byack122@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user5',
loginPw = 'user5',
`name` = '코끼리',
nickname = '뿌우뿌우',
cellphoneNum = '01097315456',
email = 'bbubbu321@gmail.com';

SELECT *
FROM `member`
ORDER BY id DESC;