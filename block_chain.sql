/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : block_chain

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 29/04/2024 16:11:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view user', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add role', 8, 'add_role');
INSERT INTO `auth_permission` VALUES (30, 'Can change role', 8, 'change_role');
INSERT INTO `auth_permission` VALUES (31, 'Can delete role', 8, 'delete_role');
INSERT INTO `auth_permission` VALUES (32, 'Can view role', 8, 'view_role');
INSERT INTO `auth_permission` VALUES (33, 'Can add user role', 9, 'add_userrole');
INSERT INTO `auth_permission` VALUES (34, 'Can change user role', 9, 'change_userrole');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user role', 9, 'delete_userrole');
INSERT INTO `auth_permission` VALUES (36, 'Can view user role', 9, 'view_userrole');
INSERT INTO `auth_permission` VALUES (37, 'Can add menu', 10, 'add_menu');
INSERT INTO `auth_permission` VALUES (38, 'Can change menu', 10, 'change_menu');
INSERT INTO `auth_permission` VALUES (39, 'Can delete menu', 10, 'delete_menu');
INSERT INTO `auth_permission` VALUES (40, 'Can view menu', 10, 'view_menu');
INSERT INTO `auth_permission` VALUES (41, 'Can add role menu', 11, 'add_rolemenu');
INSERT INTO `auth_permission` VALUES (42, 'Can change role menu', 11, 'change_rolemenu');
INSERT INTO `auth_permission` VALUES (43, 'Can delete role menu', 11, 'delete_rolemenu');
INSERT INTO `auth_permission` VALUES (44, 'Can view role menu', 11, 'view_rolemenu');
INSERT INTO `auth_permission` VALUES (45, 'Can add block', 12, 'add_block');
INSERT INTO `auth_permission` VALUES (46, 'Can change block', 12, 'change_block');
INSERT INTO `auth_permission` VALUES (47, 'Can delete block', 12, 'delete_block');
INSERT INTO `auth_permission` VALUES (48, 'Can view block', 12, 'view_block');
INSERT INTO `auth_permission` VALUES (49, 'Can add mental messages', 13, 'add_mentalmessages');
INSERT INTO `auth_permission` VALUES (50, 'Can change mental messages', 13, 'change_mentalmessages');
INSERT INTO `auth_permission` VALUES (51, 'Can delete mental messages', 13, 'delete_mentalmessages');
INSERT INTO `auth_permission` VALUES (52, 'Can view mental messages', 13, 'view_mentalmessages');
INSERT INTO `auth_permission` VALUES (53, 'Can add picture model', 14, 'add_picturemodel');
INSERT INTO `auth_permission` VALUES (54, 'Can change picture model', 14, 'change_picturemodel');
INSERT INTO `auth_permission` VALUES (55, 'Can delete picture model', 14, 'delete_picturemodel');
INSERT INTO `auth_permission` VALUES (56, 'Can view picture model', 14, 'view_picturemodel');
INSERT INTO `auth_permission` VALUES (57, 'Can add home icon', 15, 'add_homeicon');
INSERT INTO `auth_permission` VALUES (58, 'Can change home icon', 15, 'change_homeicon');
INSERT INTO `auth_permission` VALUES (59, 'Can delete home icon', 15, 'delete_homeicon');
INSERT INTO `auth_permission` VALUES (60, 'Can view home icon', 15, 'view_homeicon');
INSERT INTO `auth_permission` VALUES (61, 'Can add order', 16, 'add_order');
INSERT INTO `auth_permission` VALUES (62, 'Can change order', 16, 'change_order');
INSERT INTO `auth_permission` VALUES (63, 'Can delete order', 16, 'delete_order');
INSERT INTO `auth_permission` VALUES (64, 'Can view order', 16, 'view_order');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for block
-- ----------------------------
DROP TABLE IF EXISTS `block`;
CREATE TABLE `block`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `index` int(0) NULL DEFAULT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `transactions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `timestamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `previous_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nonce` int(0) NULL DEFAULT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of block
-- ----------------------------
INSERT INTO `block` VALUES (11, 0, 0, '[]', '0', '0', 0, '7d87457db790fce734d5d70be20c409dcf76a1964c09af7a37b7043d899f47a2');
INSERT INTO `block` VALUES (44, 1, 0, '[{\'id\': 73, \'name\': \'皮卡丘\', \'sex\': 1, \'age\': 18, \'class_name\': \'1班\', \'phone\': \'15947562863\', \'emotion\': \'正向\', \'mind_score\': None, \'mind_issue\': \'没有问题\', \'mind_advice\': \'没有建议\', \'tutor_log\': \'没有记录\', \'grade_time\': \'2024-04-19T21:22:42+08:00\'}]', '1713532963.116088', '7d87457db790fce734d5d70be20c409dcf76a1964c09af7a37b7043d899f47a2', 432, '00fa89ca93cfb152f2a2e0e94059c120e7745163b57b0115f22550c078d9f4cc');
INSERT INTO `block` VALUES (45, 2, 0, '[{\'id\': 74, \'name\': \'皮卡丘2\', \'sex\': 1, \'age\': 21, \'class_name\': \'6班\', \'phone\': \'15642258255\', \'emotion\': \'负向\', \'mind_score\': None, \'mind_issue\': \'会好的\', \'mind_advice\': \'没有建议哟\', \'tutor_log\': \'没有记录嘞\', \'grade_time\': \'2024-04-19T21:28:02+08:00\'}]', '1713533282.1873834', '00fa89ca93cfb152f2a2e0e94059c120e7745163b57b0115f22550c078d9f4cc', 500, '0017756fd9f4f2da6ae3a5c4ded068fda6f19cc4b5684e2f9443a8126bfce6de');
INSERT INTO `block` VALUES (54, 3, 0, '[{\'id\': 76, \'name\': \'张三\', \'sex\': 1, \'age\': 15, \'class_name\': \'一班\', \'phone\': \'15978945612\', \'emotion\': \'正向\', \'mind_score\': None, \'mind_issue\': \'没有\', \'mind_advice\': \'没有\', \'tutor_log\': \'没有\', \'grade_time\': \'2024-04-27T16:15:36+08:00\'}]', '1714205736.4621787', '0017756fd9f4f2da6ae3a5c4ded068fda6f19cc4b5684e2f9443a8126bfce6de', 25, '001b076e5c2c70d021b79eaef5323591d629734c61e53b593f08b6d39251c476');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (12, 'blockchain', 'block');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (10, 'menu', 'menu');
INSERT INTO `django_content_type` VALUES (11, 'menu', 'rolemenu');
INSERT INTO `django_content_type` VALUES (8, 'role', 'role');
INSERT INTO `django_content_type` VALUES (9, 'role', 'userrole');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (13, 'student', 'mentalmessages');
INSERT INTO `django_content_type` VALUES (15, 'upload_common', 'homeicon');
INSERT INTO `django_content_type` VALUES (16, 'upload_common', 'order');
INSERT INTO `django_content_type` VALUES (14, 'upload_common', 'picturemodel');
INSERT INTO `django_content_type` VALUES (7, 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-12-23 13:03:33.098551');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-12-23 13:03:33.268554');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-12-23 13:03:33.317423');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-12-23 13:03:33.323573');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-23 13:03:33.328684');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-12-23 13:03:33.366969');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-12-23 13:03:33.389752');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-12-23 13:03:33.403979');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-12-23 13:03:33.408965');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-12-23 13:03:33.431196');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-12-23 13:03:33.432194');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-12-23 13:03:33.437954');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-12-23 13:03:33.465956');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-12-23 13:03:33.487828');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-12-23 13:03:33.500786');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-12-23 13:03:33.504890');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-12-23 13:03:33.530340');
INSERT INTO `django_migrations` VALUES (18, 'menu', '0001_initial', '2023-12-23 13:03:33.550663');
INSERT INTO `django_migrations` VALUES (19, 'role', '0001_initial', '2023-12-23 13:03:33.571866');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2023-12-23 13:03:33.586367');
INSERT INTO `django_migrations` VALUES (21, 'user', '0001_initial', '2023-12-23 13:03:33.596683');
INSERT INTO `django_migrations` VALUES (22, 'blockchain', '0001_initial', '2023-12-24 07:00:58.768599');
INSERT INTO `django_migrations` VALUES (23, 'student', '0001_initial', '2023-12-24 07:00:58.775577');
INSERT INTO `django_migrations` VALUES (24, 'upload_common', '0001_initial', '2023-12-24 07:00:58.785048');
INSERT INTO `django_migrations` VALUES (25, 'upload_common', '0002_homeicon_order', '2023-12-24 07:00:58.800243');
INSERT INTO `django_migrations` VALUES (26, 'upload_common', '0003_remove_order_id_order_order_id_alter_homeicon_id_and_more', '2023-12-24 07:00:58.853332');
INSERT INTO `django_migrations` VALUES (27, 'blockchain', '0002_alter_block_options', '2023-12-24 07:07:08.649501');
INSERT INTO `django_migrations` VALUES (28, 'student', '0002_alter_mentalmessages_options', '2023-12-24 07:07:08.652629');
INSERT INTO `django_migrations` VALUES (29, 'student', '0003_alter_mentalmessages_id', '2024-01-12 05:50:14.134365');
INSERT INTO `django_migrations` VALUES (30, 'student', '0004_alter_mentalmessages_table', '2024-01-12 05:50:14.156231');
INSERT INTO `django_migrations` VALUES (31, 'blockchain', '0003_mysqlblock_delete_block', '2024-03-08 07:26:25.701354');
INSERT INTO `django_migrations` VALUES (32, 'student', '0005_alter_mentalmessages_options', '2024-03-08 07:26:25.704354');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '张三', '男', '1', '123@qq.com', '实习生', '1', '1594561231');
INSERT INTO `doctor` VALUES (3, '张三', '男', '1', '123@qq.com', '实习生', '1', '1594561232');
INSERT INTO `doctor` VALUES (4, '李四', '男', '1', '123@qq.com', '实习生', '1', '1594561233');
INSERT INTO `doctor` VALUES (5, '王五', '男', '1', '123@qq.com', '实习生', '1', '1594561234');
INSERT INTO `doctor` VALUES (6, '6666', '男', '1', '123@qq.com', '实习生', '1', '1594561235');
INSERT INTO `doctor` VALUES (7, '2', '男', '1', '123@qq.com', '实习生', '1', '1594561236');
INSERT INTO `doctor` VALUES (8, '3', '男', '1', '123@qq.com', '实习生', '1', '1594561237');
INSERT INTO `doctor` VALUES (9, '4', '男', '1', '123@qq.com', '实习生', '1', '1594561239');
INSERT INTO `doctor` VALUES (10, '5', '男', '1', '123@qq.com', '实习生', '1', '1594561238');
INSERT INTO `doctor` VALUES (13, '8', '男', '1', '123@qq.com', '实习生', '1', '1594561233');
INSERT INTO `doctor` VALUES (14, '9', '男', '1', '123@qq.com', '实习生', '1', '1594561236');
INSERT INTO `doctor` VALUES (15, '9', '男', '1', '123@qq.com', '实习生', '1', '1594561235');

-- ----------------------------
-- Table structure for home_icon
-- ----------------------------
DROP TABLE IF EXISTS `home_icon`;
CREATE TABLE `home_icon`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_icon
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` int(0) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` int(0) NOT NULL,
  `status` int(0) NOT NULL,
  `perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hidden` int(0) NULL DEFAULT NULL,
  `menu_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_num` int(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (3, '请求路径', '组件', '重定向', '名字', NULL, '图标', 2, 1, '权限标识符', 0, 'F', 0, '备注', NULL, NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_time` datetime(0) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `doc_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (3, '张三', '小四', '2023-02-22 16:00:00', '1', '', '', NULL, '159455623', '153574282');
INSERT INTO `order` VALUES (4, '张三', '阿拉蕾', '2024-04-24 16:00:00', '1', '', '', NULL, '1594561231', '1865423315');
INSERT INTO `order` VALUES (6, '金卡水电费', '近来可好撒', '2024-04-30 02:08:12', '1', NULL, NULL, NULL, '1164541512', '1978962445');
INSERT INTO `order` VALUES (7, '范德萨发', '水电费噶', '2024-04-21 16:00:00', '1', NULL, NULL, NULL, '2168152152', '1549264126');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `apple` int(0) NOT NULL,
  `vivo` int(0) NOT NULL,
  `oppo` int(0) NOT NULL,
  `meizu` int(0) NOT NULL,
  `samsung` int(0) NOT NULL,
  `order_id` int(0) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (1, 'public/img/2024/02/04/7eab589811ba4e25bba9f1a14d058d1a.jpg', '微信图片_20211231112736.jpg', '97717');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int(0) NOT NULL,
  `del_flag` int(0) NOT NULL,
  `updata_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '用户', 'img/2022/08/04/afb8f9c192d2aa800cd30a9bff723e83.jpg', '用户', 1, 1, '2024-01-12 06:13:10.751011', '2024-01-12 06:12:52.841289');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NOT NULL,
  `menu_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_menu_role_id_menu_id_c692b7c4_uniq`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for student_log
-- ----------------------------
DROP TABLE IF EXISTS `student_log`;
CREATE TABLE `student_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` int(0) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `negative_prob` float NULL DEFAULT NULL,
  `positive_prob` float NULL DEFAULT NULL,
  `confidence` float NULL DEFAULT NULL,
  `sentiment` int(0) NULL DEFAULT NULL,
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_log
-- ----------------------------
INSERT INTO `student_log` VALUES (1, 'admin3', '我今天不开心', '1', 0, '18288498161', '啦啦啦啦啦啦啦啦啦啦', 0.924411, 0.0755886, 0.832025, 0, '2', '2024-03-29 13:16:02', '2024-04-18 08:43:45');
INSERT INTO `student_log` VALUES (2, 'admin3', '我今天不开心', '1', 0, '18288498162', NULL, 0.924411, 0.0755887, 0.832025, 0, '2', '2024-03-29 13:32:22', '2024-04-18 08:41:32');
INSERT INTO `student_log` VALUES (3, 'admin3', '我今天开心', '1', 0, '18288498163', NULL, 0.00116454, 0.998835, 0.997412, 2, NULL, '2024-03-29 13:49:21', '2024-03-29 13:49:21');
INSERT INTO `student_log` VALUES (4, 'admin3', '我今天很开心', '1', 0, '18288498164', NULL, 0.000122619, 0.999877, 0.999727, 2, NULL, '2024-04-11 13:03:23', '2024-04-11 13:03:23');
INSERT INTO `student_log` VALUES (5, 'admin3', '我今天很开心', '1', 0, '18288498165', NULL, 0.000122619, 0.999877, 0.999727, 2, NULL, '2024-04-11 13:03:24', '2024-04-11 13:03:24');
INSERT INTO `student_log` VALUES (6, 'admin3', '我今天很开心', '1', 0, '18288498166', NULL, 0.000122619, 0.999877, 0.999727, 2, '1', '2024-04-15 12:56:14', '2024-04-15 12:56:14');
INSERT INTO `student_log` VALUES (7, 'admin3', '我今天很开心', '1', 1, '18288498167', NULL, 0.000122619, 0.999877, 0.999727, 2, NULL, '2024-04-15 12:57:34', '2024-04-15 12:57:34');
INSERT INTO `student_log` VALUES (8, 'admin3', '我今天很开心', '大数据班', 1, '18288498168', NULL, 0.000122619, 0.999877, 0.999727, 2, NULL, '2024-04-15 12:58:26', '2024-04-15 12:58:26');
INSERT INTO `student_log` VALUES (9, 'admin3', '我今天很开心', '大数据班', 1, '18288498169', NULL, 0.000122619, 0.999877, 0.999727, 2, NULL, '2024-04-16 13:14:45', '2024-04-16 13:14:45');
INSERT INTO `student_log` VALUES (10, 'admin3', '我今天很不开心', '大数据班', 1, '18288498112', NULL, 0.987264, 0.0127362, 0.971697, 0, ' ', '2024-04-17 07:55:16', '2024-04-17 07:55:16');
INSERT INTO `student_log` VALUES (11, 'admin3', '我今天很开心', '大数据班', 1, '18288498111', NULL, 0.000122619, 0.999877, 0.999727, 2, '', '2024-04-17 12:57:42', '2024-04-17 12:57:42');
INSERT INTO `student_log` VALUES (12, 'admin3', '我今天很开心', '大数据班', 1, '18288498113', NULL, 0.000122619, 0.999877, 0.999727, 2, '1', '2024-04-17 12:57:46', '2024-04-17 12:57:46');
INSERT INTO `student_log` VALUES (13, 'admin3', '我今天很开心', '', 1, '19174560823', NULL, 0.000122619, 0.999877, 0.999727, 2, '1', '2024-04-19 07:16:31', '2024-04-19 07:16:31');
INSERT INTO `student_log` VALUES (14, 'admin3', '不开心', '', 1, '19174560823', NULL, 0.992231, 0.00776917, 0.982735, 0, '1', '2024-04-19 07:17:42', '2024-04-19 07:17:42');
INSERT INTO `student_log` VALUES (15, 'admin3', '今天天气真好', '', 1, '19174560823', NULL, 0.00201416, 0.997986, 0.995524, 2, '1', '2024-04-19 07:17:57', '2024-04-19 07:17:57');
INSERT INTO `student_log` VALUES (16, 'admin3', '今天天气真差', '', 1, '19174560823', NULL, 0.981872, 0.0181277, 0.959716, 0, '1', '2024-04-19 07:18:13', '2024-04-19 07:18:13');
INSERT INTO `student_log` VALUES (17, 'admin3', '今天掉头发了', '', 1, '19174560823', NULL, 0.631048, 0.368952, 0.180106, 0, '1', '2024-04-19 07:18:26', '2024-04-19 07:18:26');
INSERT INTO `student_log` VALUES (18, 'admin3', '我今天好难过啊', '', 1, '19174560823', NULL, 0.508336, 0.491664, 0.833286, 1, '1', '2024-04-19 07:18:37', '2024-04-19 07:18:37');
INSERT INTO `student_log` VALUES (19, 'admin3', '淡淡的，又是一天。没有太阳，也没有乌云。还记得那个早晨，也是这样静默的坐着，一个人，在没有雾的时候。', '', 1, '19174560823', NULL, 0.0978808, 0.902119, 0.782487, 2, '1', '2024-04-19 07:22:59', '2024-04-19 07:22:59');
INSERT INTO `student_log` VALUES (20, 'admin3', '今天，我就要考试了，当我走进考场时，心理紧绷绷的，像一只小兔子在我心里乱撞，拿到试卷的那一刻起，我已经做好了充分的准备，迎接将要到来的挑战。', '', 1, '19174560823', NULL, 0.00134527, 0.998655, 0.99701, 2, '1', '2024-04-19 07:23:27', '2024-04-19 07:23:27');
INSERT INTO `student_log` VALUES (21, 'admin3', '啊！太好了！终于全部考完了，我终于解放了！我才发现，原来世界的一切是那么美好，虽然我现在心情特别舒畅，可我心里还有一块大石头在心头悬着，那就是考试分数。', '', 1, '19174560823', NULL, 0.0000814989, 0.999918, 0.999819, 2, '1', '2024-04-19 07:23:43', '2024-04-19 07:23:43');
INSERT INTO `student_log` VALUES (22, 'admin3', '今天，将是我的末日或福日，老天爷求你保佑我吧！可我说这话有什么用呢？算了，听天由命吧！老师念到了我的成绩，语文：98数学100英语：88综合：100，英语成绩犹如晴天霹雳击坏了我的美梦，唉，无奈，这就是命啊！', '', 1, '19174560823', NULL, 0.983242, 0.0167579, 0.96276, 0, '1', '2024-04-19 07:23:58', '2024-04-19 07:23:58');
INSERT INTO `student_log` VALUES (23, 'admin3', '我的小表姐在加油站上班，和我的关系特别的好。好久没有联系了，我挺想念她的。我决定骑车去看她。在一个阳光明媚的日子里，我骑着车出发了，虽然自行车有点破旧，但并没有影响我的心情。一路上，迎着和煦的阳光、温暖的春风，我的心情是多么的舒畅！看那湛蓝的天空，飘浮着乳白色的云；再看那田野上冒出的新绿，如同春天一样，越发的生机勃勃，活力四射。四周的田园风光好似一幅淡淡的水墨，是那样的清新；路边一丛丛的野花，争研斗艳，在努力的吐露芬芳，空气里也充满着淡淡的花香。', '', 1, '19174560823', NULL, 0.0000156488, 0.999984, 0.999965, 2, '1', '2024-04-19 07:24:25', '2024-04-19 07:24:25');
INSERT INTO `student_log` VALUES (24, 'admin3', '2月14号的夜晚，天空下起了小雨，刚被家人批评了一顿的我，心情无比落寞。', '', 1, '19174560823', NULL, 0.973855, 0.0261454, 0.941899, 0, '1', '2024-04-19 07:24:46', '2024-04-19 07:24:46');
INSERT INTO `student_log` VALUES (25, 'admin3', '我的心情失落到了极点。抬头望望天，灰蒙蒙的，凛冽的寒风刮在脸上，却感觉不到冷。心里酸酸的，一种说不出的痛苦感，有想哭的冲动，却哭不出来，想笑，却也笑不出来。也许坦然面对才是最好的选择，我想。但那令人伤心的结果却无论如何也让我接受不了，如果时光能倒流，我宁愿不去投稿，以致换来这令人伤心的结果。', '', 1, '19174560823', NULL, 0.99989, 0.000110068, 0.999756, 0, '1', '2024-04-19 07:25:09', '2024-04-19 07:25:09');
INSERT INTO `student_log` VALUES (26, 'admin3', 'XX年1月16日星期1晴天天有不测风云，今天下午我和姐姐闹翻了。姐姐就一个劲骂我：“nightstool!nightstool!nightstool!”(马桶!马桶!马桶!)妈妈在一旁笑,姐姐和妈妈一个鼻孔出气,我不和她们玩了！', '', 1, '19174560823', NULL, 0.985537, 0.014463, 0.96786, 0, '1', '2024-04-19 07:26:11', '2024-04-19 07:26:11');
INSERT INTO `student_log` VALUES (27, 'admin3', '我今天很开心', '', 1, '19174560823', NULL, 0.000122619, 0.999877, 0.999727, 2, '1', '2024-04-27 14:33:03', '2024-04-27 14:33:03');

-- ----------------------------
-- Table structure for student_mentalmessages
-- ----------------------------
DROP TABLE IF EXISTS `student_mentalmessages`;
CREATE TABLE `student_mentalmessages`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` int(0) NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emotion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mind_score` int(0) NULL DEFAULT NULL,
  `mind_issue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `mind_advice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `tutor_log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `grade_time` datetime(0) NULL DEFAULT NULL,
  ` stu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_mentalmessages
-- ----------------------------
INSERT INTO `student_mentalmessages` VALUES (55, '小', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-12 07:07:29', NULL);
INSERT INTO `student_mentalmessages` VALUES (56, '小杨', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-12 07:08:25', NULL);
INSERT INTO `student_mentalmessages` VALUES (57, 'admin3', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-12 07:14:37', NULL);
INSERT INTO `student_mentalmessages` VALUES (58, 'admin', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-12 07:18:54', NULL);
INSERT INTO `student_mentalmessages` VALUES (59, 'admin1', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-12 07:19:04', NULL);
INSERT INTO `student_mentalmessages` VALUES (60, 'admin2', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-12 07:19:12', NULL);
INSERT INTO `student_mentalmessages` VALUES (61, 'xiaoyang', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-12 07:19:24', NULL);
INSERT INTO `student_mentalmessages` VALUES (62, '1', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-12 07:38:00', NULL);
INSERT INTO `student_mentalmessages` VALUES (63, '11', 1, 18, '大数据班', '18288498161', '正向', 90, '精神分裂症：此类患者存在异常思维、幻觉、妄想，社会功能受损，好发于青壮年，是常见的精神疾病之一。临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '临床上常使用盐酸氯丙嗪片、奥氮平片等抗精神病药物进行治疗，也可配合电休克治疗、心理疏导治疗等综合治疗，并且建议家属需要配合医生，不要刺激患者，以免加重患者病情。', '以上健康科普知识仅供参考，具体情况需到正规医院进行检查，由专业医师进行判断，在医生指导下用药，请勿自行诊断、治疗。', '2024-04-13 08:25:42', NULL);
INSERT INTO `student_mentalmessages` VALUES (73, '皮卡丘', 1, 18, '1班', '15947562863', '正向', NULL, '没有问题', '没有建议', '没有记录', '2024-04-19 13:22:42', NULL);
INSERT INTO `student_mentalmessages` VALUES (74, '皮卡丘2', 1, 21, '6班', '15642258255', '负向', NULL, '会好的', '没有建议哟', '没有记录嘞', '2024-04-19 13:28:02', NULL);
INSERT INTO `student_mentalmessages` VALUES (75, '皮卡丘3', 1, 19, '一班', '1894567824', '正向', NULL, '没有问题', '没有建议', '没有记录', '2024-04-27 07:16:05', NULL);
INSERT INTO `student_mentalmessages` VALUES (76, '张三', 1, 15, '一班', '15978945612', '正向', NULL, '没有', '没有', '没有', '2024-04-27 08:15:36', NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `number` int(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '男', '李四', 20, '123@qq.com', '1223252285', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (3, '男', '张三', 20, '123@qq.com', '19156231526', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (6, '男', '王五', 20, '123@qq.com', '19156231526', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (7, '女', '4', 20, '123@qq.com', '19156231526', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (8, '男', '5', 20, '123@qq.com', '19156231526', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (9, '女', '6', 20, '123@qq.com', '19156231526', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (10, '男', '7', 20, '123@qq.com', '19156231526', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (11, '女', '8', 20, '123@qq.com', '19156231526', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (12, '女', '9', 20, '123@qq.com', '19156231526', '教授', '12', '', '', '');
INSERT INTO `teacher` VALUES (15, NULL, '邢傲伟', 14, '159@qq.com', '1594563214', '讲师', '12', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (16, '女', '1', 1512, '15666@qq.com', '1559215495', '教授', '一班', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (17, '男', '王五', 20, '123@qq.com', '19156231526', '教授', '12', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  `gender` int(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `picture_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int(0) NOT NULL,
  `role_id` int(0) NOT NULL,
  `del_flag` int(0) NOT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pho` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin3', 'e10adc3949ba59abbe56e057f20f883e', '小杨', '', '19174560823', 18, 1, 'taoyang@qq.com', 'img/2022/08/04/f7a8c94d81b20ccc1f74b2118a5fb901.jpg', 1, 2, 1, '2024-04-27 14:21:25.958988', '2023-12-23 13:16:05.036770', 'eyJ5f6b0cb595a0dd6d92c88e322ed2e80f2fd0f4be46adc7d1628a9c7a173a95b46285cb8a5ab329f3365cbdea2775ac0161fd8735c1ca6fcdf435dace7d6c0e3a', NULL);
INSERT INTO `user` VALUES (2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '小杨', '11', '1597894523', 18, 1, '321@qq.com', 'img/2022/08/04/f7a8c94d81b20ccc1f74b2118a5fb901.jpg', 1, 0, 1, '2024-04-27 08:41:30.850154', '2023-12-23 13:16:19.413403', 'eyJ80a87571ffdd322ebf5716090c7cd5a87e523e7f4fd4b5f3f544b7b49c0757620bfd036786f1b256602d663d05911668895226f8490c177b84da743b0ae2360e', NULL);
INSERT INTO `user` VALUES (3, 'root', 'e10adc3949ba59abbe56e057f20f883e', '小杨', '三班', '654123258', 18, 1, 'taoyang@qq.com', 'img/2022/08/04/f7a8c94d81b20ccc1f74b2118a5fb901.jpg', 1, 1, 1, '2024-04-19 12:57:02.556490', '2024-04-19 12:57:02.556490', 'eyJ7b6b0180901ed8f07cc773a5aed577c68232adb18766b9f77645d05c462d5c2f40972fc129ed881bb597f1dd8bc23223b2468eea05dbcbabd37e8bd561165bef', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `role_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_role_user_id_role_id_a1d0951e_uniq`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);

SET FOREIGN_KEY_CHECKS = 1;
