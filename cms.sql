/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 01/10/2018 22:51:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `modify_time` datetime(0) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, '', '2018-09-29 02:16:12', '2018-09-29 02:16:12', 7, 1);
INSERT INTO `comments` VALUES (2, '我知道', '2018-09-29 02:19:27', '2018-09-29 02:19:27', 7, 1);
INSERT INTO `comments` VALUES (3, '你真的知道吗', '2018-09-29 02:21:28', '2018-09-29 02:21:28', 7, 1);
INSERT INTO `comments` VALUES (4, 'adaad', '2018-09-29 03:32:17', '2018-09-29 03:32:17', 5, 1);
INSERT INTO `comments` VALUES (5, '怎么可能呢', '2018-09-29 04:04:59', '2018-09-29 04:04:59', 5, 1);
INSERT INTO `comments` VALUES (6, '我是李四', '2018-09-29 10:07:22', '2018-09-29 10:07:22', 5, 3);
INSERT INTO `comments` VALUES (7, '哎呀', '2018-09-29 05:59:14', '2018-09-29 05:59:14', 4, 2);
INSERT INTO `comments` VALUES (8, 'aas', '2018-09-29 06:16:36', '2018-09-29 06:16:36', 4, 2);
INSERT INTO `comments` VALUES (9, '我好想是张吴丹', '2018-09-29 11:27:31', '2018-09-29 11:27:31', 5, 9);
INSERT INTO `comments` VALUES (10, '阿达', '2018-09-30 02:36:30', '2018-09-30 02:36:30', 4, 1);

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `modify_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES (4, '今天天气不错', '可以学习', 1, '2018-09-26 10:49:30', '2018-09-29 10:31:03');
INSERT INTO `topics` VALUES (5, '啊啊啊啊啊', '哦哦哦哦哦', 1, '2018-09-26 10:50:26', '2018-09-26 10:50:26');
INSERT INTO `topics` VALUES (7, '怎么会事', '我也不知道', 1, '2018-09-26 10:50:33', '2018-09-28 09:31:51');
INSERT INTO `topics` VALUES (8, 'omgd', 'hahahah', 1, '2018-09-26 11:03:47', '2018-09-26 11:03:47');
INSERT INTO `topics` VALUES (9, '不是undefined', '不是undefined', 1, '2018-09-26 06:47:59', '2018-09-28 09:30:57');
INSERT INTO `topics` VALUES (10, '今天天气不错', '可以学习', 5, '2018-09-26 06:56:54', '2018-09-26 08:07:26');
INSERT INTO `topics` VALUES (13, '你好', '我不好', 5, '2018-09-26 08:08:11', '2018-09-26 08:08:43');
INSERT INTO `topics` VALUES (14, '今天天气不错', '不错', 1, '2018-09-28 03:32:22', '2018-09-28 03:32:22');
INSERT INTO `topics` VALUES (15, '今天天气不错', '不错', 1, '2018-09-28 03:33:43', '2018-09-28 03:33:43');
INSERT INTO `topics` VALUES (16, '今天天气不错', '阿斯达四大多', 1, '2018-09-28 03:36:51', '2018-09-28 03:36:51');
INSERT INTO `topics` VALUES (17, '今天天气不错', '阿斯达四大多', 1, '2018-09-28 03:37:07', '2018-09-28 03:37:07');
INSERT INTO `topics` VALUES (18, '今天天气不错', '阿斯达四大多', 1, '2018-09-28 03:37:24', '2018-09-28 03:37:24');
INSERT INTO `topics` VALUES (19, '今天天气不错', '阿斯达四大多', 1, '2018-09-28 03:37:36', '2018-09-28 03:37:36');
INSERT INTO `topics` VALUES (20, '今天天气不错', '阿斯达四大多', 1, '2018-09-28 03:37:43', '2018-09-28 03:37:43');
INSERT INTO `topics` VALUES (21, '吃饭', '不吃了，省钱', 1, '2018-09-28 05:05:13', '2018-09-28 05:05:13');
INSERT INTO `topics` VALUES (22, '呵呵', '不错呦', 2, '2018-09-28 07:34:12', '2018-09-28 07:34:12');
INSERT INTO `topics` VALUES (23, '阿达', '啊实打实', 2, '2018-09-28 07:35:16', '2018-09-28 07:35:16');
INSERT INTO `topics` VALUES (24, '不是undefined', '哈哈哈哈', 3, '2018-09-29 10:44:42', '2018-09-29 10:44:42');
INSERT INTO `topics` VALUES (25, '测试', '看看', 3, '2018-09-30 02:54:51', '2018-09-30 02:54:51');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `modify_time` datetime(0) NOT NULL,
  `bio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1@qq.com', '李海珠', 'default-avatar.png', 1, '2018-09-26 09:43:49', '2018-09-30 02:29:07', '哎呀啊');
INSERT INTO `users` VALUES (2, '11@qq.com', '14e1b600b1fd579f47433b88e8d85291', '11@qq.com', '李', 'default-avatar.png', -1, '2018-09-26 09:50:29', '2018-09-29 10:42:39', '谁啊');
INSERT INTO `users` VALUES (3, '112@qq.com', '14e1b600b1fd579f47433b88e8d85291', '112@qq.com', '李小狗', 'default-avatar.png', 0, '2018-09-26 09:50:51', '2018-09-30 02:54:13', '三流');
INSERT INTO `users` VALUES (4, '1127@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1127@qq.com', '李', 'default-avatar.png', -1, '2018-09-26 09:52:46', '2018-09-29 10:42:39', '谁啊');
INSERT INTO `users` VALUES (5, '11270@qq.com', '14e1b600b1fd579f47433b88e8d85291', '11270@qq.com', '牛逼', 'default-avatar.png', 0, '2018-09-29 11:17:42', '2018-09-29 11:17:42', '这个人很懒,什么都没有做');
INSERT INTO `users` VALUES (6, '112702@qq.com', '14e1b600b1fd579f47433b88e8d85291', '112702@qq.com', '张大胆', 'default-avatar.png', 0, '2018-09-29 11:21:48', '2018-09-29 11:21:48', '这个人很懒,什么都没有做');
INSERT INTO `users` VALUES (7, '1127025@qq.com', '14e1b600b1fd579f47433b88e8d85291', '1127025@qq.com', '吴丹', 'default-avatar.png', 0, '2018-09-29 11:23:35', '2018-09-29 11:23:35', '这个人很懒,什么都没有做');
INSERT INTO `users` VALUES (8, '11270252@qq.com', '14e1b600b1fd579f47433b88e8d85291', '11270252@qq.com', '失恋', 'default-avatar.png', 0, '2018-09-29 11:25:19', '2018-09-29 11:25:19', '这个人很懒,什么都没有做');
INSERT INTO `users` VALUES (9, '112702524@qq.com', '14e1b600b1fd579f47433b88e8d85291', '112702524@qq.com', '张无胆', 'default-avatar.png', 0, '2018-09-29 11:26:25', '2018-09-29 11:26:25', '这个人很懒,什么都没有做');

SET FOREIGN_KEY_CHECKS = 1;
