DROP DATABASE IF EXISTS `DKDeTai`;
create database `DKDeTai`;

USE `DKDeTai`;

CREATE TABLE `Person` (
    person_id CHAR(12), -- 1
    full_name NVARCHAR(255) NOT NULL,
    gender BIT DEFAULT(0) NOT NULL,-- 0: nữ, 1: nam
    `address` NVARCHAR(255),
    phonenumber CHAR(10) NOT NULL,
    email CHAR(255) NOT NULL,
	`role` CHAR(50) NOT NULL,-- admin/student/lecturer/head_lecturer
    `description` NVARCHAR(255),
    PRIMARY KEY `PK_Person`(`person_id`)
);
create table major(
	major_id CHAR(12),
	major_name NVARCHAR(255) NOT NULL,
 	`description` NVARCHAR(255),
	PRIMARY KEY `PK_major`(`major_id`)
);

create table lecturer(
	lecturer_id CHAR(12),
    person_id CHAR(12),
    is_head BIT DEFAULT(0),
    major_id CHAR(12),
    PRIMARY KEY `PK_lecturer`(`lecturer_id`),
    CONSTRAINT `FK_lecturer_Person` FOREIGN KEY (person_id) REFERENCES Person(person_id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        CONSTRAINT `FK_lecturer_Major` FOREIGN KEY (major_id) REFERENCES `major`(major_id) ON DELETE
    SET
        NULL
);

create table head_lecturer(
	headlecturer_id char(12),
    person_id char(12),
    major_id CHAR(12),
    PRIMARY KEY `PK_Hlecturer`(`headlecturer_id`),
    CONSTRAINT `FK_headlecturer_Person` FOREIGN KEY (person_id) REFERENCES Person(person_id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        CONSTRAINT `FK_headLecturer_Major` FOREIGN KEY (major_id) REFERENCES `major`(major_id) ON DELETE
    SET
        NULL
);

CREATE TABLE `Admin` (
    admin_id CHAR(12),
    person_id CHAR(12),
    PRIMARY KEY `PK_Admin`(`admin_id`),
    CONSTRAINT `FK_Admin_Person` FOREIGN KEY (person_id) REFERENCES Person(person_id) ON UPDATE CASCADE ON DELETE
    SET
		NULL
);


Create Table Lecturer_Critical(
	lecturer_id CHAR(12),
    person_id CHAR(12),
    PRIMARY KEY `PK_lecturer`(lecturer_id),
    CONSTRAINT `FK_lecuterCritical_Lecturer` FOREIGN KEY (lecturer_id) REFERENCES lecturer(lecturer_id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE `committe` (
    committe_id CHAR(12),
    committe_name NVARCHAR(255),
    num_member INT,-- sô lượng thành viên trong hội đồng
    `description` NVARCHAR(255),
    PRIMARY KEY `PK_committe`(`committe_id`)
);
CREATE TABLE `lecturer_committe` (
    lecturer_id CHAR(12),
    committe_id CHAR(12),
    PRIMARY KEY `PK_lecturer`(lecturer_id, committe_id),
    CONSTRAINT `FK_lecturerCommitte_lecturer` FOREIGN KEY (lecturer_id) REFERENCES lecturer(lecturer_id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `FK_lecturerCommitte_Committe` FOREIGN KEY (committe_id) REFERENCES committe(committe_id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE `GroupStudent` (
    group_id CHAR(12),
    leader_id CHAR(12),
    `description` NVARCHAR(255),
    is_full BIT DEFAULT(0),-- 0: chưa full, 1: đã full.
    current_number INT DEFAULT(1), -- Khi tạo nhóm thành công thì số lượng là 1. Group chứa trưởng nhóm
    topic_id CHAR(10),-- nếu topic_id bằng null thì trưởng nhóm mới có thể đăng kí được đề tài. Nếu khách null tức
    -- tức đã đăng kí đề tài thì trưởng nhóm cần hủy chọn để tài cũ để chọn đề tài mới
    PRIMARY KEY `PK_Group`(`group_id`)
	-- CONSTRAINT `FK_Group_Topic` FOREIGN KEY (topic_id)  REFERENCES `Topic` (topic_id) ON DELETE NO ACTION ON UPDATE CASCADE
);

create table major(
	major_id CHAR(12),
	major_name NVARCHAR(255) NOT NULL,
 	`description` NVARCHAR(255),
	PRIMARY KEY `PK_major`(`major_id`)
);

create table Student(
	student_id CHAR(12),
    school_year CHAR(10), -- Niên khóa: 2020, 2021, 2022
    person_id CHAR(10),
    group_id CHAR(12),-- trường này cho biết sinh viên đã có group hay chưa. Mặc định là null --> chưa có group
    PRIMARY KEY `PK_Student`(`student_id`),
	major_id CHAR(12),
    CONSTRAINT `FK_Student_Person` FOREIGN KEY (person_id) REFERENCES Person(person_id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
	CONSTRAINT `FK_Student_Group` FOREIGN KEY (group_id) REFERENCES `GroupStudent`(group_id) ON DELETE
    SET
        NULL,
	CONSTRAINT `FK_Student_Major` FOREIGN KEY (major_id) REFERENCES `major`(major_id) ON DELETE
    SET
        NULL
);


create table Topic(
	topic_id CHAR(12),
    topic_name NVARCHAR(255),
    `status` BIT DEFAULT(0),-- Kiểm tra xem trưởng bộ môn có duyệt đề tài này hay chưa.
    `description` NVARCHAR(255),
    is_selected BIT DEFAULT(0),-- khi có người chọn đề tài thì chuyển is_selected thành 1. Nếu ng đk hủy chọn thì chuyển is_selected về 0
    is_full BIT DEFAULT(0),
    max_mo_member INT,-- số thành viên tối đa của một topic
    lecturer_id CHAR(12),
    student_id CHAR(12),
    PRIMARY KEY `PK_Topic`(`topic_id`),
        CONSTRAINT `FK_Topic_lecturer` FOREIGN KEY (lecturer_id) REFERENCES lecturer(lecturer_id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        CONSTRAINT `FK_Topic_student` FOREIGN KEY (student_id) REFERENCES student(student_id) ON UPDATE CASCADE ON DELETE
    SET
        NULL
);



CREATE TABLE `Account` (
    account_id CHAR(12),
    username CHAR(255) UNIQUE NOT NULL,
    `password` CHAR(255) NOT NULL,
    `description` NVARCHAR(255),
    person_id CHAR(12),-- Phân chia luồng user
    PRIMARY KEY `PK_Account`(`account_id`),
    CONSTRAINT `FK_Person_Account` FOREIGN KEY (person_id) REFERENCES Person(person_id) ON UPDATE CASCADE ON DELETE
    SET
        NULL
);

ALTER TABLE
    `GroupStudent`
ADD
    CONSTRAINT `FK_Group_Topic` FOREIGN KEY (topic_id) REFERENCES `Topic` (topic_id) ON DELETE NO ACTION ON UPDATE CASCADE;


INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00001', 'Vũ Hoàng Anh', b'1', 'Quận Thủ Đức, TP.HCM', '0367421332', 'hoanganh@gmail.com', 'admin');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00002', 'Huỳnh Xuân Phụng', b'1', 'Quận 1, TP.HCM', '0367422311', 'phunghx@hcmute.edu.vn', 'head_lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00003', 'Nguyễn Thành Sơn', b'1', 'Quận 2, TP.HCM', '0367421231', 'sonnt@hcmute.edu.vn', 'head_lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00004', 'Nguyễn Thị Thanh Vân', b'0', 'Quận Bình Chánh, TP.HCM', '0367421122', 'vanntth@hcmute.edu.vn', 'head_lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00005', 'Nguyễn Trần Thi Văn', b'1', 'Quận Hoóc Môn, TP.HCM', '0367421122', 'thivannt@hcmute.edu.vn', 'lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00006', 'Mai Anh Thơ', b'0', 'Cao Lãnh, Đồng Tháp', '0367412323', 'thoma@hcmute.edu.vn', 'lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00007', 'Lê Thị Minh Châu', b'0', 'Quận Cần Giờ, TP.HCM', '0367123332', 'chaultm@hcmute.edu.vn', 'lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00008', 'Quách Đình Hoàng', b'1', 'Ninh Kiều, TP.Cần Thơ', '0361232332', 'hoanganh@gmail.com', 'lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00009', 'Đinh Công Đoan', b'1', 'Quận 8, TP.HCM', '0312232332', 'doandc@hcmute.edu.vn', 'lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00010', 'Huỳnh Nguyên Chính', b'1', 'Quận Củ Chi, TP.HCM', '0312235432', 'chinhhn@hcmute.edu.vn', 'lecturer');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00011', 'Kiều Thị Bích Tuyền', b'0', 'Bà Rịa Vũng Tàu', '0312221322', 'bichtuyen@student.hcmute.edu.vn', 'student');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00012', 'Hà Hữu Quy', b'1', 'Quận 2, TP.HCM', '0312230032', 'quyhh@student.hcmute.edu.vn', 'student');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00013', 'Nguyễn Quốc Bình', b'1', 'Quận 5, TP.HCM', '0332232332', 'quocbinh@student.hcmute.edu.vn', 'student');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00014', 'Nguyễn Hoàng Quyên', b'0', 'Chợ Mới, An Giang', '0312440032', 'quyenhn@student.hcmute.edu.vn', 'student');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00015', 'Trần Trung Kiên', b'0', 'Chợ Mới, An Giang', '0319930032', 'kientt@student.hcmute.edu.vn', 'student');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00016', 'Hoàng Vũ Trường Sơn', b'1', 'Xuân Lộc, Đồng Nai', '0319930032', 'namhvt@student.hcmute.edu.vn', 'student');
INSERT INTO `dkdetai`.`person` (`person_id`, `full_name`, `gender`, `address`, `phonenumber`, `email`, `role`) VALUES ('p00017', 'Vũ Hoàng Nam', b'1', 'Cẩm Mỹ, Đồng Nai', '0319930011', 'namhv@student.hcmute.edu.vn', 'student');

INSERT INTO `dkdetai`.`admin` (`admin_id`, `person_id`) VALUES ('ad01', 'p00001');

INSERT INTO `dkdetai`.`lecturer` (`lecturer_id`, `person_id`, `is_head`) VALUES ('lec01', 'p00002', b'1');
INSERT INTO `dkdetai`.`lecturer` (`lecturer_id`, `person_id`, `is_head`) VALUES ('lec02', 'p00003', b'1');
INSERT INTO `dkdetai`.`lecturer` (`lecturer_id`, `person_id`, `is_head`) VALUES ('lec03', 'p00004', b'1');
INSERT INTO `dkdetai`.`lecturer` (`lecturer_id`, `person_id`, `is_head`) VALUES ('lec04', 'p00005', b'0');
INSERT INTO `dkdetai`.`lecturer` (`lecturer_id`, `person_id`, `is_head`) VALUES ('lec05', 'p00006', b'0');
INSERT INTO `dkdetai`.`lecturer` (`lecturer_id`, `person_id`, `is_head`) VALUES ('lec06', 'p00007', b'0');
INSERT INTO `dkdetai`.`lecturer` (`lecturer_id`, `person_id`, `is_head`) VALUES ('lec07', 'p00008', b'0');
INSERT INTO `dkdetai`.`lecturer` (`lecturer_id`, `person_id`, `is_head`) VALUES ('lec08', 'p00009', b'0');

INSERT INTO `dkdetai`.`major` (`major_id`, `major_name`) VALUES ('st', 'Công nghệ phần mềm');
INSERT INTO `dkdetai`.`major` (`major_id`, `major_name`) VALUES ('is', 'Hệ thống thông tin');
INSERT INTO `dkdetai`.`major` (`major_id`, `major_name`) VALUES ('nw', 'Mạng và An ninh mạng');

INSERT INTO `dkdetai`.`student` (`student_id`, `school_year`, `person_id`, `major_id`) VALUES ('20110001', '2020', 'p00011', 'st');
INSERT INTO `dkdetai`.`student` (`student_id`, `school_year`, `person_id`, `major_id`) VALUES ('20110002', '2020', 'p00012', 'st');
INSERT INTO `dkdetai`.`student` (`student_id`, `school_year`, `person_id`, `major_id`) VALUES ('20110003', '2020', 'p00013', 'is');
INSERT INTO `dkdetai`.`student` (`student_id`, `school_year`, `person_id`, `major_id`) VALUES ('20110004', '2020', 'p00014', 'is');
INSERT INTO `dkdetai`.`student` (`student_id`, `school_year`, `person_id`, `major_id`) VALUES ('20110005', '2020', 'p00015', 'nw');
INSERT INTO `dkdetai`.`student` (`student_id`, `school_year`, `person_id`, `major_id`) VALUES ('20110006', '2020', 'p00016', 'nw');
INSERT INTO `dkdetai`.`student` (`student_id`, `school_year`, `person_id`, `major_id`) VALUES ('20110007', '2020', 'p00017', 'st');

INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00001', 'admin', '12345678', 'p00001');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00002', 'phunghx', '12345678', 'p00002');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00003', 'sonnt', '12345678', 'p00003');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00004', 'vanntth', '12345678', 'p00004');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00005', 'thivannt', '12345678', 'p00005');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00006', 'thoma', '12345678', 'p00006');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00007', 'chaultm', '12345678', 'p00007');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00008', 'hoangqd', '12345678', 'p00008');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00009', 'doandc', '12345678', 'p00009');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00010', 'chinhhn', '12345678', 'p00010');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00011', 'bichtuyen', '12345678', 'p00011');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00012', 'quyhh', '12345678', 'p00012');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00013', 'quocbinh', '12345678', 'p00013');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00014', 'quyenhn', '12345678', 'p00014');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00015', 'kientt', '12345678', 'p00015');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00016', 'sonhvt', '12345678', 'p00016');
INSERT INTO `dkdetai`.`account` (`account_id`, `username`, `password`, `person_id`) VALUES ('acc00017', 'namhv', '12345678', 'p00017');




