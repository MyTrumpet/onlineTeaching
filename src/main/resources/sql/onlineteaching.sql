/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : onlineteaching

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 19/10/2020 08:12:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `idcard` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo`  (
  `class_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL COMMENT '教师id',
  `course_id` bigint(255) NOT NULL,
  `classcode` bigint(255) NOT NULL COMMENT '班级代码',
  `classname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `term` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `classinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `common_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classinfo_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` int(20) NOT NULL,
  `context` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `puserId` int(20) NULL DEFAULT NULL,
  `pcontext` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for common_user
-- ----------------------------
DROP TABLE IF EXISTS `common_user`;
CREATE TABLE `common_user`  (
  `user_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(255) NULL DEFAULT NULL,
  `user_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idcard` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adress` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(2) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `studentId` int(255) NULL DEFAULT NULL,
  `teacherId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `common_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `semester` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coursetype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start` datetime(0) NULL,
  `end` datetime(0) NULL,
  `coursecode` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `department` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `id`(`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course_team
-- ----------------------------
DROP TABLE IF EXISTS `course_team`;
CREATE TABLE `course_team`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `CId` int(20) NOT NULL,
  `teamId` int(20) NOT NULL,
  `teamName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SId` int(20) NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for courseware
-- ----------------------------
DROP TABLE IF EXISTS `courseware`;
CREATE TABLE `courseware`  (
  `courseware_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `pcourseware_id` bigint(255) NOT NULL,
  `course_id` bigint(255) NOT NULL,
  `user_id` bigint(255) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseware_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_parent` int(20) NOT NULL,
  `createtime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `sort` int(20) NOT NULL,
  PRIMARY KEY (`courseware_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `courseware_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courseware_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `common_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for courseware_user
-- ----------------------------
DROP TABLE IF EXISTS `courseware_user`;
CREATE TABLE `courseware_user`  (
  `c_user_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `courseware_id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `url_path` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `watch_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `download` bigint(255) NOT NULL,
  PRIMARY KEY (`c_user_id`) USING BTREE,
  INDEX `courseware_id`(`courseware_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `courseware_user_ibfk_1` FOREIGN KEY (`courseware_id`) REFERENCES `courseware` (`courseware_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courseware_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `common_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coursework_log
-- ----------------------------
DROP TABLE IF EXISTS `coursework_log`;
CREATE TABLE `coursework_log`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `SId` int(20) NOT NULL,
  `CId` int(20) NOT NULL,
  `coursefileid` int(20) NULL DEFAULT NULL,
  `filetype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `readtimes` int(20) NOT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` int(20) NOT NULL,
  `CId` int(20) NOT NULL,
  `createtime` datetime(0) NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `dTitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `discuss_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `context` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `CId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `opentime` datetime(0) NULL,
  `closetime` datetime(0) NULL,
  `duration` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attemps` int(2) NOT NULL,
  `overduehanding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gradeinfo
-- ----------------------------
DROP TABLE IF EXISTS `gradeinfo`;
CREATE TABLE `gradeinfo`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `SId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `term` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` int(20) NOT NULL,
  `uperformance` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `final_grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for homeworkinfo
-- ----------------------------
DROP TABLE IF EXISTS `homeworkinfo`;
CREATE TABLE `homeworkinfo`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isallowupload` smallint(20) NULL DEFAULT NULL,
  `studenttype` int(20) NULL DEFAULT NULL,
  `urlpath` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CId` int(20) NOT NULL,
  `TId` int(20) NOT NULL,
  `classes` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start` datetime(0) NULL,
  `end` datetime(0) NULL,
  `state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `material_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `urlpath` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`material_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `material_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `common_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for material_user
-- ----------------------------
DROP TABLE IF EXISTS `material_user`;
CREATE TABLE `material_user`  (
  `m_user_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `material_id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `url_path` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `watch_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `download` bigint(255) NOT NULL,
  PRIMARY KEY (`m_user_id`) USING BTREE,
  INDEX `material_id`(`material_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `material_user_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `material_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `common_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `CId` int(20) NOT NULL,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `questiondesc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TId` int(20) NOT NULL,
  `createtime` datetime(0) NULL,
  `utId` int(20) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `context` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fraction` decimal(20, 0) NOT NULL,
  `questionId` int(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionId`(`questionId`) USING BTREE,
  CONSTRAINT `question_answer_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `questionid` int(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionid`(`questionid`) USING BTREE,
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quiz_layout
-- ----------------------------
DROP TABLE IF EXISTS `quiz_layout`;
CREATE TABLE `quiz_layout`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `quizid` int(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `attempt` int(20) NOT NULL,
  `questionlayout` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `quizid`(`quizid`) USING BTREE,
  CONSTRAINT `quiz_layout_ibfk_1` FOREIGN KEY (`quizid`) REFERENCES `quiz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quizing
-- ----------------------------
DROP TABLE IF EXISTS `quizing`;
CREATE TABLE `quizing`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL,
  `answerlayout` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `maxmark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gotmark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roletype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `power` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_function
-- ----------------------------
DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function`  (
  `roleid` int(20) NOT NULL,
  `functionId` int(20) NOT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stu_course
-- ----------------------------
DROP TABLE IF EXISTS `stu_course`;
CREATE TABLE `stu_course`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `SId` int(20) NOT NULL,
  `CId` int(20) NOT NULL,
  `term` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classId` int(20) NOT NULL,
  `credit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarks` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stu_examination
-- ----------------------------
DROP TABLE IF EXISTS `stu_examination`;
CREATE TABLE `stu_examination`  (
  `id` int(20) NOT NULL,
  `SId` int(20) NOT NULL,
  `EId` int(20) NOT NULL,
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `SId`(`SId`) USING BTREE,
  CONSTRAINT `stu_examination_ibfk_1` FOREIGN KEY (`SId`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stu_homework
-- ----------------------------
DROP TABLE IF EXISTS `stu_homework`;
CREATE TABLE `stu_homework`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `classId` int(20) NOT NULL,
  `SId` int(20) NOT NULL,
  `hId` int(20) NOT NULL,
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `idcard` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '41703532', '李李', '女', '计算机', '13881170695', '本科35', '123654');

-- ----------------------------
-- Table structure for tea_course
-- ----------------------------
DROP TABLE IF EXISTS `tea_course`;
CREATE TABLE `tea_course`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `TId` int(20) NOT NULL,
  `CId` int(20) NOT NULL,
  `remarks` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idcard` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `degress` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarks` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
