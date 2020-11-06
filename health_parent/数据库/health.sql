/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50649
 Source Host           : 47.99.56.214:3306
 Source Schema         : health

 Target Server Type    : MySQL
 Target Server Version : 50649
 File Encoding         : 65001

 Date: 06/11/2020 15:34:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addressName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lngAndLat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `map` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detailaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (4, '合肥第二人民医院', '1731111111', '117.28269909,31.86694226', '857bf9f7-7a0b-4520-a306-4933aa95392e.jpg', NULL, '安徽省合肥市庐阳区');
INSERT INTO `t_address` VALUES (6, '第三医院', '17356535908', '117.315828,31.760817', '6d086275-07de-4b16-9550-1494494b75ba.jpg', NULL, '安徽省合肥市包河区');
INSERT INTO `t_address` VALUES (7, '精神病院', '1234567894513', '117.223914,31.866984', '352aa2b7-c624-4f2a-b85b-56b0a06b03e8.jpg', NULL, '安徽省合肥市蜀山区');
INSERT INTO `t_address` VALUES (11, '骨科医院', '12345678910', '117.429374,31.903716', 'b3fb4dbf-d344-4868-97ac-77690bf3f1f8.jpg', NULL, '安徽省合肥市瑶海区');
INSERT INTO `t_address` VALUES (12, '市二院', '123456', '117.404657,31.973398', '423cdc6e-6fe0-4e00-84fc-935442f22bb4.jpg', NULL, '安徽省合肥市瑶海区魏武路');
INSERT INTO `t_address` VALUES (13, '门诊部', '13453733473', '117.112236,31.84944', 'b6d53601-3c83-4419-8c3a-c90e13f1ba7f.jpg', NULL, '安徽省合肥市蜀山区');
INSERT INTO `t_address` VALUES (14, '省医院', '5463753737', '117.288764,31.888727', '6b5588c0-407f-4f9c-9047-b72f1fc12b79.jpg', NULL, '安徽省合肥市庐阳区阜阳路95号');

-- ----------------------------
-- Table structure for t_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_checkgroup`;
CREATE TABLE `t_checkgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `helpCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_checkgroup
-- ----------------------------
INSERT INTO `t_checkgroup` VALUES (5, '0001', '一般检查', 'YBJC', '0', '一般检查', '无');
INSERT INTO `t_checkgroup` VALUES (6, '0002', '视力色觉', 'SLSJ', '0', '视力色觉', '无');
INSERT INTO `t_checkgroup` VALUES (7, '0003', '血常规', 'XCG', '0', '血常规', '无');
INSERT INTO `t_checkgroup` VALUES (9, '0005', '肝功三项', 'GGSX', '0', '肝功三项', '无');
INSERT INTO `t_checkgroup` VALUES (10, '0006', '肾功三项', 'NGSX', '0', '肾功三项', '无');
INSERT INTO `t_checkgroup` VALUES (11, '0007', '血脂四项', 'XZSX', '0', '血脂四项', '无');
INSERT INTO `t_checkgroup` VALUES (12, '0008', '心肌酶三项', 'XJMSX', '0', '心肌酶三项', '无');
INSERT INTO `t_checkgroup` VALUES (13, '0009', '甲功三项', 'JGSX', '0', '甲功三项', '无');
INSERT INTO `t_checkgroup` VALUES (14, '0010', '子宫附件彩超', 'ZGFJCC', '2', '子宫附件彩超', '无');
INSERT INTO `t_checkgroup` VALUES (15, '0011', '胆红素三项', 'DHSSX', '0', '胆红素三项', '无');

-- ----------------------------
-- Table structure for t_checkgroup_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `t_checkgroup_checkitem`;
CREATE TABLE `t_checkgroup_checkitem`  (
  `checkgroup_id` int(11) NOT NULL DEFAULT 0,
  `checkitem_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`checkgroup_id`, `checkitem_id`) USING BTREE,
  INDEX `item_id`(`checkitem_id`) USING BTREE,
  CONSTRAINT `group_id` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_id` FOREIGN KEY (`checkitem_id`) REFERENCES `t_checkitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_checkgroup_checkitem
-- ----------------------------
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 28);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 29);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 30);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 31);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 32);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 33);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 34);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 35);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 36);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 38);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 39);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 40);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 41);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 42);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 43);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 44);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 45);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 46);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 47);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 48);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 49);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 50);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 51);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 52);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 53);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 54);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 55);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 56);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 72);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 73);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 74);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 75);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 76);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 77);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 78);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 79);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 80);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 81);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 82);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 83);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 84);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 85);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 86);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 87);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 90);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 91);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 92);

-- ----------------------------
-- Table structure for t_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `t_checkitem`;
CREATE TABLE `t_checkitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查检项类型,分为检查和检验两种',
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_checkitem
-- ----------------------------
INSERT INTO `t_checkitem` VALUES (28, '0001', '身高', '0', '0-100', 5, '1', '无', '身高');
INSERT INTO `t_checkitem` VALUES (29, '0002', '体重', '0', '0-100', 5, '1', '无', '体重');
INSERT INTO `t_checkitem` VALUES (30, '0003', '体重指数', '0', '0-100', 5, '1', '无', '体重指数');
INSERT INTO `t_checkitem` VALUES (31, '0004', '收缩压', '0', '0-100', 5, '1', '无', '收缩压');
INSERT INTO `t_checkitem` VALUES (32, '0005', '舒张压', '0', '0-100', 5, '1', '无', '舒张压');
INSERT INTO `t_checkitem` VALUES (33, '0006', '裸视力（右）', '0', '0-100', 5, '1', '无', '裸视力（右）');
INSERT INTO `t_checkitem` VALUES (34, '0007', '裸视力（左）', '0', '0-100', 5, '1', '无', '裸视力（左）');
INSERT INTO `t_checkitem` VALUES (35, '0008', '矫正视力（右）', '0', '0-100', 5, '1', '无', '矫正视力（右）');
INSERT INTO `t_checkitem` VALUES (36, '0009', '矫正视力（左）', '0', '0-100', 5, '1', '无', '矫正视力（左）');
INSERT INTO `t_checkitem` VALUES (38, '0011', '白细胞计数', '0', '0-100', 10, '2', '无', '白细胞计数');
INSERT INTO `t_checkitem` VALUES (39, '0012', '红细胞计数', '0', '0-100', 10, '2', NULL, '红细胞计数');
INSERT INTO `t_checkitem` VALUES (40, '0013', '血红蛋白', '0', '0-100', 10, '2', NULL, '血红蛋白');
INSERT INTO `t_checkitem` VALUES (41, '0014', '红细胞压积', '0', '0-100', 10, '2', NULL, '红细胞压积');
INSERT INTO `t_checkitem` VALUES (42, '0015', '平均红细胞体积', '0', '0-100', 10, '2', NULL, '平均红细胞体积');
INSERT INTO `t_checkitem` VALUES (43, '0016', '平均红细胞血红蛋白含量', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白含量');
INSERT INTO `t_checkitem` VALUES (44, '0017', '平均红细胞血红蛋白浓度', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白浓度');
INSERT INTO `t_checkitem` VALUES (45, '0018', '红细胞分布宽度-变异系数', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-变异系数');
INSERT INTO `t_checkitem` VALUES (46, '0019', '血小板计数', '0', '0-100', 10, '2', NULL, '血小板计数');
INSERT INTO `t_checkitem` VALUES (47, '0020', '平均血小板体积', '0', '0-100', 10, '2', NULL, '平均血小板体积');
INSERT INTO `t_checkitem` VALUES (48, '0021', '血小板分布宽度', '0', '0-100', 10, '2', NULL, '血小板分布宽度');
INSERT INTO `t_checkitem` VALUES (49, '0022', '淋巴细胞百分比', '0', '0-100', 10, '2', NULL, '淋巴细胞百分比');
INSERT INTO `t_checkitem` VALUES (50, '0023', '中间细胞百分比', '0', '0-100', 10, '2', NULL, '中间细胞百分比');
INSERT INTO `t_checkitem` VALUES (51, '0024', '中性粒细胞百分比', '0', '0-100', 10, '2', NULL, '中性粒细胞百分比');
INSERT INTO `t_checkitem` VALUES (52, '0025', '淋巴细胞绝对值', '0', '0-100', 10, '2', NULL, '淋巴细胞绝对值');
INSERT INTO `t_checkitem` VALUES (53, '0026', '中间细胞绝对值', '0', '0-100', 10, '2', NULL, '中间细胞绝对值');
INSERT INTO `t_checkitem` VALUES (54, '0027', '中性粒细胞绝对值', '0', '0-100', 10, '2', NULL, '中性粒细胞绝对值');
INSERT INTO `t_checkitem` VALUES (55, '0028', '红细胞分布宽度-标准差', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-标准差');
INSERT INTO `t_checkitem` VALUES (56, '0029', '血小板压积', '0', '0-100', 10, '2', NULL, '血小板压积');
INSERT INTO `t_checkitem` VALUES (57, '0030', '尿比重', '0', '0-100', 10, '2', NULL, '尿比重');
INSERT INTO `t_checkitem` VALUES (58, '0031', '尿酸碱度', '0', '0-100', 10, '2', NULL, '尿酸碱度');
INSERT INTO `t_checkitem` VALUES (59, '0032', '尿白细胞', '0', '0-100', 10, '2', NULL, '尿白细胞');
INSERT INTO `t_checkitem` VALUES (60, '0033', '尿亚硝酸盐', '0', '0-100', 10, '2', NULL, '尿亚硝酸盐');
INSERT INTO `t_checkitem` VALUES (61, '0034', '尿蛋白质', '0', '0-100', 10, '2', NULL, '尿蛋白质');
INSERT INTO `t_checkitem` VALUES (62, '0035', '尿糖', '0', '0-100', 10, '2', NULL, '尿糖');
INSERT INTO `t_checkitem` VALUES (63, '0036', '尿酮体', '0', '0-100', 10, '2', NULL, '尿酮体');
INSERT INTO `t_checkitem` VALUES (64, '0037', '尿胆原', '0', '0-100', 10, '2', NULL, '尿胆原');
INSERT INTO `t_checkitem` VALUES (65, '0038', '尿胆红素', '0', '0-100', 10, '2', NULL, '尿胆红素');
INSERT INTO `t_checkitem` VALUES (66, '0039', '尿隐血', '0', '0-100', 10, '2', NULL, '尿隐血');
INSERT INTO `t_checkitem` VALUES (67, '0040', '尿镜检红细胞', '0', '0-100', 10, '2', NULL, '尿镜检红细胞');
INSERT INTO `t_checkitem` VALUES (68, '0041', '尿镜检白细胞', '0', '0-100', 10, '2', NULL, '尿镜检白细胞');
INSERT INTO `t_checkitem` VALUES (69, '0042', '上皮细胞', '0', '0-100', 10, '2', NULL, '上皮细胞');
INSERT INTO `t_checkitem` VALUES (70, '0043', '无机盐类', '0', '0-100', 10, '2', NULL, '无机盐类');
INSERT INTO `t_checkitem` VALUES (71, '0044', '尿镜检蛋白定性', '0', '0-100', 10, '2', NULL, '尿镜检蛋白定性');
INSERT INTO `t_checkitem` VALUES (72, '0045', '丙氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '丙氨酸氨基转移酶');
INSERT INTO `t_checkitem` VALUES (73, '0046', '天门冬氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '天门冬氨酸氨基转移酶');
INSERT INTO `t_checkitem` VALUES (74, '0047', 'Y-谷氨酰转移酶', '0', '0-100', 10, '2', NULL, 'Y-谷氨酰转移酶');
INSERT INTO `t_checkitem` VALUES (75, '0048', '尿素', '0', '0-100', 10, '2', NULL, '尿素');
INSERT INTO `t_checkitem` VALUES (76, '0049', '肌酐', '0', '0-100', 10, '2', NULL, '肌酐');
INSERT INTO `t_checkitem` VALUES (77, '0050', '尿酸', '0', '0-100', 10, '2', NULL, '尿酸');
INSERT INTO `t_checkitem` VALUES (78, '0051', '总胆固醇', '0', '0-100', 10, '2', NULL, '总胆固醇');
INSERT INTO `t_checkitem` VALUES (79, '0052', '甘油三酯', '0', '0-100', 10, '2', NULL, '甘油三酯');
INSERT INTO `t_checkitem` VALUES (80, '0053', '高密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '高密度脂蛋白胆固醇');
INSERT INTO `t_checkitem` VALUES (81, '0054', '低密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '低密度脂蛋白胆固醇');
INSERT INTO `t_checkitem` VALUES (82, '0055', '磷酸肌酸激酶', '0', '0-100', 10, '2', NULL, '磷酸肌酸激酶');
INSERT INTO `t_checkitem` VALUES (83, '0056', '磷酸肌酸激酶同工酶', '0', '0-100', 10, '2', NULL, '磷酸肌酸激酶同工酶');
INSERT INTO `t_checkitem` VALUES (84, '0057', '乳酸脱氢酶', '0', '0-100', 10, '2', NULL, '乳酸脱氢酶');
INSERT INTO `t_checkitem` VALUES (85, '0058', '三碘甲状腺原氨酸', '0', '0-100', 10, '2', NULL, '三碘甲状腺原氨酸');
INSERT INTO `t_checkitem` VALUES (86, '0059', '甲状腺素', '0', '0-100', 10, '2', NULL, '甲状腺素');
INSERT INTO `t_checkitem` VALUES (87, '0060', '促甲状腺激素', '0', '0-100', 10, '2', NULL, '促甲状腺激素');
INSERT INTO `t_checkitem` VALUES (90, '0063', '总胆红素', '0', '0-100', 10, '2', NULL, '总胆红素');
INSERT INTO `t_checkitem` VALUES (91, '0064', '直接胆红素', '0', '0-100', 10, '2', NULL, '直接胆红素');
INSERT INTO `t_checkitem` VALUES (92, '0065', '间接胆红素', '0', '0-100', 10, '2', NULL, '间接胆红素');

-- ----------------------------
-- Table structure for t_food
-- ----------------------------
DROP TABLE IF EXISTS `t_food`;
CREATE TABLE `t_food`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `foodname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_food
-- ----------------------------
INSERT INTO `t_food` VALUES (1, '苹果', '水果类', '个', '0-100');
INSERT INTO `t_food` VALUES (2, '香蕉', '水果类', '千克', '0-100');
INSERT INTO `t_food` VALUES (3, '葡萄', '水果类', '克', '0-100');
INSERT INTO `t_food` VALUES (16, '火龙果', '水果类', '千克', '0-100');
INSERT INTO `t_food` VALUES (17, '火龙果(进口)', '大豆类', '个', '0-100');

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileNumber` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regTime` date NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `healthmanager` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_member_user`(`healthmanager`) USING BTREE,
  CONSTRAINT `fk_member_user` FOREIGN KEY (`healthmanager`) REFERENCES `t_user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES (82, '', '仲飞', '1', '123456789000999999', '13035059310', '2019-03-08', 'e10adc3949ba59abbe56e057f20f883e', '3161758940@qq.com', '1997-05-26', NULL, '李茂文');
INSERT INTO `t_member` VALUES (83, '', '周宏', '1', '123456789000999999', '18956101526', '2019-03-11', NULL, '3161758940@qq.com', '1998-09-15', NULL, 'admin');
INSERT INTO `t_member` VALUES (84, '', '孙志伟', '1', '177988455322885', '18256589787', '2019-03-13', NULL, NULL, '1934-07-01', '', 'admin');
INSERT INTO `t_member` VALUES (85, NULL, '12313', '2', '541254897854265897', '12334344343', '2019-03-06', NULL, NULL, '2019-10-01', '', 'test');
INSERT INTO `t_member` VALUES (86, NULL, '王尼玛', '1', '1231312414342324', '42242323422', '2019-04-04', NULL, NULL, '2019-09-25', NULL, NULL);
INSERT INTO `t_member` VALUES (87, NULL, '美国队长', '2', '31313131433424', '13856513229', '2019-02-06', NULL, NULL, '1999-06-24', NULL, '仲飞');
INSERT INTO `t_member` VALUES (88, '147', '345353', '1', '23422342313131', '13856513229', '2019-04-10', NULL, NULL, '1984-06-24', '8799879', '仲飞');
INSERT INTO `t_member` VALUES (89, NULL, 'jone', '1', '31442324311111', '45643522423', '2018-12-01', NULL, NULL, '1970-06-24', NULL, NULL);
INSERT INTO `t_member` VALUES (90, NULL, NULL, '1', '79797685567565', '36346457765', '2018-12-02', NULL, NULL, '1983-09-24', NULL, NULL);
INSERT INTO `t_member` VALUES (101, NULL, '蓝莫', NULL, NULL, '99999999999', '2020-09-26', NULL, NULL, NULL, NULL, 'test');
INSERT INTO `t_member` VALUES (111, '1346', '陈伯', '1', '134679', '13856513229', '2020-09-26', NULL, NULL, '2020-09-02', NULL, 'test');
INSERT INTO `t_member` VALUES (113, NULL, '2131', '1', '340602199705260617', '17688825511', NULL, NULL, '932045210@qq.com', NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (114, NULL, 'sssssrrrrr', NULL, NULL, '13855055184', '2020-09-26', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (116, NULL, NULL, NULL, NULL, '13035059310', '2020-09-27', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (117, NULL, NULL, NULL, NULL, '18355784189', '2020-10-06', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentMenuId` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_13`(`parentMenuId`) USING BTREE,
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`parentMenuId`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '会员管理', NULL, '2', 1, 'fa-user-md', '', NULL, 1);
INSERT INTO `t_menu` VALUES (2, '会员档案', 'member.html', '/2-2', 1, NULL, NULL, 1, 2);
INSERT INTO `t_menu` VALUES (5, '预约管理', NULL, '3', 2, 'fa-tty', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (7, '预约设置', 'ordersetting.html', '/3-2', 2, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (8, '套餐管理', 'setmeal.html', '/3-3', 3, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (9, '检查组管理', 'checkgroup.html', '/3-4', 4, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (10, '检查项管理', 'checkitem.html', '/3-5', 5, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (13, '统计分析', NULL, '5', 4, 'fa-heartbeat', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (14, '会员数量', 'report_member.html', '/5-1', 1, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (15, '系统设置', NULL, '6', 5, 'fa-users', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (16, '菜单管理', 'menu.html', '/6-2', 2, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (17, '权限管理', 'permission.html', '/6-1', 1, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (18, '角色管理', 'role.html', '/6-4', 4, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (19, '用户管理', 'user.html', '/6-3', 3, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (20, '套餐占比', 'report_setmeal.html', '/5-2', 2, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (21, '运营数据', 'report_business.html', '/5-3', 3, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (29, '预约订单管理', 'order.html', '/3-6', 1, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (30, '健康干预信息管理', 'booking.html', '/3-7', 1, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (32, '体检机构', NULL, '7', 6, 'fa-stethoscope', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (33, '体检机构预览', 'map.html', '/7-1', 1, NULL, NULL, 32, 2);
INSERT INTO `t_menu` VALUES (34, '体检机构管理', 'address.html', '/7-2', 2, NULL, NULL, 32, 2);
INSERT INTO `t_menu` VALUES (35, '日志管理', 'syslog.html', '/8-1', 1, NULL, NULL, 15, 4);
INSERT INTO `t_menu` VALUES (36, '知识库', NULL, '8', 7, 'fa-book', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (37, '饮食库', 'food.html', '/8-1', 1, NULL, NULL, 36, 2);
INSERT INTO `t_menu` VALUES (38, '运动库', 'sport.html', '/8-2', 2, NULL, NULL, 36, 2);
INSERT INTO `t_menu` VALUES (39, '年龄分布统计', 'report_age.html', '/3-4', 4, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (41, '黑马', '123.html', '/8-1', 1, NULL, NULL, 15, 1);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL COMMENT '员会id',
  `orderDate` date NULL DEFAULT NULL COMMENT '约预日期',
  `orderType` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '约预类型 电话预约/微信预约',
  `orderStatus` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约状态（是否到诊）',
  `setmeal_id` int(11) NULL DEFAULT NULL COMMENT '餐套id',
  `food` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sport` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `healthName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suggestion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_member_id`(`member_id`) USING BTREE,
  INDEX `key_setmeal_id`(`setmeal_id`) USING BTREE,
  INDEX `key_address_id`(`address_id`) USING BTREE,
  CONSTRAINT `key_address_id` FOREIGN KEY (`address_id`) REFERENCES `t_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `key_member_id` FOREIGN KEY (`member_id`) REFERENCES `t_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `key_setmeal_id` FOREIGN KEY (`setmeal_id`) REFERENCES `t_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (2, 83, '2020-09-17', '电话预约', '已到诊', 13, '香蕉,苹果', '背部拉伸', 'admin', '564456', NULL);
INSERT INTO `t_order` VALUES (3, 84, '2020-09-17', '电话预约', '未到诊', 14, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (15, 82, '2020-09-22', '微信预约', '已到诊', 13, '香蕉,火龙果', '跑步', '李茂文', 'test', NULL);
INSERT INTO `t_order` VALUES (16, 83, '2020-09-23', '电话预约', '已到诊', 14, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (17, 84, '2020-09-25', '微信预约', '已到诊', 13, '苹果,香蕉', '背部拉伸,碾压脊柱', 'admin', 'aaa', NULL);
INSERT INTO `t_order` VALUES (19, 86, '2020-09-26', '微信预约', '已到诊', 15, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (21, 88, '2020-09-27', '微信预约', '未到诊', 15, NULL, NULL, '仲飞', NULL, NULL);
INSERT INTO `t_order` VALUES (22, 89, '2020-09-28', '微信预约', '未到诊', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (23, 90, '2020-09-28', '电话预约', '未到诊', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (86, 111, '2020-09-30', '电话预约', '已到诊', 12, '苹果,香蕉,葡萄', '背部拉伸,碾压脊柱', 'test', '12321321321', NULL);
INSERT INTO `t_order` VALUES (88, 113, '2020-09-27', '微信预约', '未到诊', 12, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (89, 114, '2020-09-29', '电话预约', '已到诊', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (93, 101, '2020-09-27', '微信预约', '已到诊', 13, '苹果,香蕉', '背部拉伸,碾压脊柱', 'test', 'vvvv', NULL);

-- ----------------------------
-- Table structure for t_ordersetting
-- ----------------------------
DROP TABLE IF EXISTS `t_ordersetting`;
CREATE TABLE `t_ordersetting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NULL DEFAULT NULL COMMENT '约预日期',
  `number` int(11) NULL DEFAULT NULL COMMENT '可预约人数',
  `reservations` int(11) NULL DEFAULT NULL COMMENT '已预约人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_ordersetting
-- ----------------------------
INSERT INTO `t_ordersetting` VALUES (13, '2020-09-23', 100, 0);
INSERT INTO `t_ordersetting` VALUES (14, '2020-09-24', 200, 0);
INSERT INTO `t_ordersetting` VALUES (15, '2020-09-25', 300, 0);
INSERT INTO `t_ordersetting` VALUES (16, '2020-09-26', 200, 1);
INSERT INTO `t_ordersetting` VALUES (17, '2020-09-27', 200, 3);
INSERT INTO `t_ordersetting` VALUES (18, '2020-09-28', 200, 0);
INSERT INTO `t_ordersetting` VALUES (19, '2020-09-29', 200, 4);
INSERT INTO `t_ordersetting` VALUES (20, '2020-09-30', 200, 6);
INSERT INTO `t_ordersetting` VALUES (21, '2020-10-01', 300, 0);
INSERT INTO `t_ordersetting` VALUES (22, '2020-10-02', 600, 0);
INSERT INTO `t_ordersetting` VALUES (23, '2020-10-03', 500, 0);
INSERT INTO `t_ordersetting` VALUES (24, '2020-10-04', 500, 0);
INSERT INTO `t_ordersetting` VALUES (25, '2020-10-05', 400, 0);
INSERT INTO `t_ordersetting` VALUES (26, '2020-10-06', 300, 0);
INSERT INTO `t_ordersetting` VALUES (27, '2020-10-07', 300, 1);
INSERT INTO `t_ordersetting` VALUES (28, '2020-10-08', 300, 0);
INSERT INTO `t_ordersetting` VALUES (29, '2020-10-09', 300, 0);
INSERT INTO `t_ordersetting` VALUES (30, '2020-10-10', 200, 0);
INSERT INTO `t_ordersetting` VALUES (31, '2020-10-11', 300, 0);
INSERT INTO `t_ordersetting` VALUES (32, '2020-10-12', 200, 0);
INSERT INTO `t_ordersetting` VALUES (33, '2020-10-13', 400, 0);
INSERT INTO `t_ordersetting` VALUES (34, '2020-10-14', 800, 0);
INSERT INTO `t_ordersetting` VALUES (69, '2020-10-09', 500, 0);
INSERT INTO `t_ordersetting` VALUES (70, '2020-10-14', 300, 0);
INSERT INTO `t_ordersetting` VALUES (71, '2020-10-15', 200, 0);
INSERT INTO `t_ordersetting` VALUES (72, '2020-10-16', 300, 0);
INSERT INTO `t_ordersetting` VALUES (73, '2020-10-17', 400, 0);

-- ----------------------------
-- Table structure for t_peopleclass
-- ----------------------------
DROP TABLE IF EXISTS `t_peopleclass`;
CREATE TABLE `t_peopleclass`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_peopleclass
-- ----------------------------
INSERT INTO `t_peopleclass` VALUES (1, 95, '高血压');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cretime` date NULL DEFAULT NULL,
  `station` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '新增检查项', 'CHECKITEM_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (2, '删除检查项', 'CHECKITEM_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (3, '编辑检查项', 'CHECKITEM_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (4, '查询检查项', 'CHECKITEM_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (5, '新增检查组', 'CHECKGROUP_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (6, '删除检查组', 'CHECKGROUP_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (7, '编辑检查组', 'CHECKGROUP_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (8, '查询检查组', 'CHECKGROUP_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (9, '新增套餐', 'SETMEAL_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (10, '删除套餐', 'SETMEAL_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (11, '编辑套餐', 'SETMEAL_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (12, '查询套餐', 'SETMEAL_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (13, '预约设置', 'ORDERSETTING', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (14, '查看统计报表', 'REPORT_VIEW', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (15, '新增菜单', 'MENU_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (16, '删除菜单', 'MENU_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (17, '编辑菜单', 'MENU_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (18, '查询菜单', 'MENU_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (19, '新增角色', 'ROLE_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (20, '删除角色', 'ROLE_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (21, '编辑角色', 'ROLE_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (22, '查询角色', 'ROLE_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (23, '新增用户', 'USER_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (24, '删除用户', 'USER_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (25, '编辑用户', 'USER_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (26, '查询用户', 'USER_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (27, '初始化套餐', 'SETMEAL_INIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (28, '初始化套餐', 'SETMEAL_INIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (29, '预约模板下载', 'ORDER_DOWM', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (30, '预约模板上传', 'ORDER_UPLOAD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (31, '查询会员', 'MEMBER_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (32, '编辑会员', 'MEMBER_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (33, '删除会员', 'MEMBER_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (34, '查询会员', 'MEMBER_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (35, '会员模板下载', 'MEMBER_DOWN', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (36, '新增体检机构', 'ADDRESS_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (37, '查询体检机构', 'ADDRESS_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (38, '修改体检机构', 'ADDRESS_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (39, '删除体检机构', 'ADDRESS_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (40, '饮食库模板下载', 'FOOD_DOWN', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (41, '饮食库模板上传', 'FOOD_UPLOAD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (42, '查询食物', 'FOOD_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (43, '新增食物', 'FOOD_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (44, '修改食物', 'FOOD_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (45, '删除食物', 'FOOD_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (46, '运动库模板下载', 'SPORT_DOWN', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (47, '运动库模板上传', 'SPORT_UPLOAD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (48, '新增运动', 'SPORT_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (49, '修改运动', 'SPORT_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (50, '删除运动', 'SPORT_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (51, '查询运动', 'SPORT_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (52, '新增权限', 'PERMISSION_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (53, '编辑权限', 'PERMISSION_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (54, '删除权限', 'PERMISSION_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (55, '查询权限', 'PERMISSION_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (60, '查询预约', 'ORDER_QUERY', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (61, '添加预约', 'ORDER_ADD', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (62, '编辑预约', 'ORDER_EDIT', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (63, '删除预约', 'ORDER_DELETE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (64, '电话预约', 'ORDER_BY_TELEPHONE', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (66, '查看健康干预', 'HEALTH_LOOK', NULL, NULL, '1');
INSERT INTO `t_permission` VALUES (67, '新增健康干预', 'HEALTH_ADD', NULL, NULL, '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', 'ROLE_ADMIN', NULL);
INSERT INTO `t_role` VALUES (3, '安全管理大师', 'SAFE_SYSTEM', '国家6A认证');
INSERT INTO `t_role` VALUES (7, '健康管理师', 'HEALTH_MANAGER', '2');
INSERT INTO `t_role` VALUES (12, '1233', 'kkk', NULL);
INSERT INTO `t_role` VALUES (14, '后台系统管理员', 'SYSTEMBK_MANAGER', '后台系统管理员');
INSERT INTO `t_role` VALUES (15, '会员管理大师', 'MEMBER_MANAGER', NULL);
INSERT INTO `t_role` VALUES (16, '推广大使', 'PROMONTION_MANAGER', '体检机构管理');
INSERT INTO `t_role` VALUES (17, '数据管理师', 'DATA_ADMINISTRATOR', '后台数据报表');
INSERT INTO `t_role` VALUES (18, '人事主管', 'H_R', '人事牛皮');
INSERT INTO `t_role` VALUES (19, '健康管理员', 'HEALTHER_MANAGER', '健康干预');
INSERT INTO `t_role` VALUES (20, 'PERSON', 'LOOK_ALL', 'COMMON_EVERY');
INSERT INTO `t_role` VALUES (22, '讲师', 'CHENG', NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FK_Reference_10`(`menu_id`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (3, 1);
INSERT INTO `t_role_menu` VALUES (14, 1);
INSERT INTO `t_role_menu` VALUES (15, 1);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (3, 2);
INSERT INTO `t_role_menu` VALUES (14, 2);
INSERT INTO `t_role_menu` VALUES (15, 2);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (3, 5);
INSERT INTO `t_role_menu` VALUES (7, 5);
INSERT INTO `t_role_menu` VALUES (14, 5);
INSERT INTO `t_role_menu` VALUES (18, 5);
INSERT INTO `t_role_menu` VALUES (19, 5);
INSERT INTO `t_role_menu` VALUES (20, 5);
INSERT INTO `t_role_menu` VALUES (1, 7);
INSERT INTO `t_role_menu` VALUES (3, 7);
INSERT INTO `t_role_menu` VALUES (14, 7);
INSERT INTO `t_role_menu` VALUES (19, 7);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (3, 8);
INSERT INTO `t_role_menu` VALUES (14, 8);
INSERT INTO `t_role_menu` VALUES (19, 8);
INSERT INTO `t_role_menu` VALUES (20, 8);
INSERT INTO `t_role_menu` VALUES (1, 9);
INSERT INTO `t_role_menu` VALUES (3, 9);
INSERT INTO `t_role_menu` VALUES (14, 9);
INSERT INTO `t_role_menu` VALUES (19, 9);
INSERT INTO `t_role_menu` VALUES (20, 9);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (3, 10);
INSERT INTO `t_role_menu` VALUES (14, 10);
INSERT INTO `t_role_menu` VALUES (19, 10);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (3, 13);
INSERT INTO `t_role_menu` VALUES (14, 13);
INSERT INTO `t_role_menu` VALUES (17, 13);
INSERT INTO `t_role_menu` VALUES (20, 13);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (3, 14);
INSERT INTO `t_role_menu` VALUES (14, 14);
INSERT INTO `t_role_menu` VALUES (17, 14);
INSERT INTO `t_role_menu` VALUES (20, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (3, 15);
INSERT INTO `t_role_menu` VALUES (14, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (3, 16);
INSERT INTO `t_role_menu` VALUES (14, 16);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (3, 17);
INSERT INTO `t_role_menu` VALUES (14, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (3, 18);
INSERT INTO `t_role_menu` VALUES (14, 18);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (3, 19);
INSERT INTO `t_role_menu` VALUES (14, 19);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (3, 20);
INSERT INTO `t_role_menu` VALUES (14, 20);
INSERT INTO `t_role_menu` VALUES (17, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);
INSERT INTO `t_role_menu` VALUES (3, 21);
INSERT INTO `t_role_menu` VALUES (14, 21);
INSERT INTO `t_role_menu` VALUES (17, 21);
INSERT INTO `t_role_menu` VALUES (1, 29);
INSERT INTO `t_role_menu` VALUES (3, 29);
INSERT INTO `t_role_menu` VALUES (14, 29);
INSERT INTO `t_role_menu` VALUES (18, 29);
INSERT INTO `t_role_menu` VALUES (1, 30);
INSERT INTO `t_role_menu` VALUES (3, 30);
INSERT INTO `t_role_menu` VALUES (14, 30);
INSERT INTO `t_role_menu` VALUES (19, 30);
INSERT INTO `t_role_menu` VALUES (1, 32);
INSERT INTO `t_role_menu` VALUES (3, 32);
INSERT INTO `t_role_menu` VALUES (14, 32);
INSERT INTO `t_role_menu` VALUES (16, 32);
INSERT INTO `t_role_menu` VALUES (20, 32);
INSERT INTO `t_role_menu` VALUES (1, 33);
INSERT INTO `t_role_menu` VALUES (3, 33);
INSERT INTO `t_role_menu` VALUES (14, 33);
INSERT INTO `t_role_menu` VALUES (16, 33);
INSERT INTO `t_role_menu` VALUES (20, 33);
INSERT INTO `t_role_menu` VALUES (1, 34);
INSERT INTO `t_role_menu` VALUES (3, 34);
INSERT INTO `t_role_menu` VALUES (14, 34);
INSERT INTO `t_role_menu` VALUES (16, 34);
INSERT INTO `t_role_menu` VALUES (20, 34);
INSERT INTO `t_role_menu` VALUES (1, 35);
INSERT INTO `t_role_menu` VALUES (3, 35);
INSERT INTO `t_role_menu` VALUES (14, 35);
INSERT INTO `t_role_menu` VALUES (1, 36);
INSERT INTO `t_role_menu` VALUES (14, 36);
INSERT INTO `t_role_menu` VALUES (19, 36);
INSERT INTO `t_role_menu` VALUES (20, 36);
INSERT INTO `t_role_menu` VALUES (22, 36);
INSERT INTO `t_role_menu` VALUES (1, 37);
INSERT INTO `t_role_menu` VALUES (14, 37);
INSERT INTO `t_role_menu` VALUES (19, 37);
INSERT INTO `t_role_menu` VALUES (20, 37);
INSERT INTO `t_role_menu` VALUES (1, 38);
INSERT INTO `t_role_menu` VALUES (14, 38);
INSERT INTO `t_role_menu` VALUES (19, 38);
INSERT INTO `t_role_menu` VALUES (20, 38);
INSERT INTO `t_role_menu` VALUES (1, 39);
INSERT INTO `t_role_menu` VALUES (14, 39);
INSERT INTO `t_role_menu` VALUES (17, 39);
INSERT INTO `t_role_menu` VALUES (20, 39);
INSERT INTO `t_role_menu` VALUES (14, 41);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK_Reference_12`(`permission_id`) USING BTREE,
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (1, 1);
INSERT INTO `t_role_permission` VALUES (14, 1);
INSERT INTO `t_role_permission` VALUES (19, 1);
INSERT INTO `t_role_permission` VALUES (1, 2);
INSERT INTO `t_role_permission` VALUES (14, 2);
INSERT INTO `t_role_permission` VALUES (19, 2);
INSERT INTO `t_role_permission` VALUES (1, 3);
INSERT INTO `t_role_permission` VALUES (14, 3);
INSERT INTO `t_role_permission` VALUES (19, 3);
INSERT INTO `t_role_permission` VALUES (1, 4);
INSERT INTO `t_role_permission` VALUES (7, 4);
INSERT INTO `t_role_permission` VALUES (14, 4);
INSERT INTO `t_role_permission` VALUES (19, 4);
INSERT INTO `t_role_permission` VALUES (1, 5);
INSERT INTO `t_role_permission` VALUES (3, 5);
INSERT INTO `t_role_permission` VALUES (14, 5);
INSERT INTO `t_role_permission` VALUES (19, 5);
INSERT INTO `t_role_permission` VALUES (1, 6);
INSERT INTO `t_role_permission` VALUES (3, 6);
INSERT INTO `t_role_permission` VALUES (14, 6);
INSERT INTO `t_role_permission` VALUES (19, 6);
INSERT INTO `t_role_permission` VALUES (1, 7);
INSERT INTO `t_role_permission` VALUES (3, 7);
INSERT INTO `t_role_permission` VALUES (14, 7);
INSERT INTO `t_role_permission` VALUES (19, 7);
INSERT INTO `t_role_permission` VALUES (1, 8);
INSERT INTO `t_role_permission` VALUES (3, 8);
INSERT INTO `t_role_permission` VALUES (14, 8);
INSERT INTO `t_role_permission` VALUES (19, 8);
INSERT INTO `t_role_permission` VALUES (1, 9);
INSERT INTO `t_role_permission` VALUES (3, 9);
INSERT INTO `t_role_permission` VALUES (14, 9);
INSERT INTO `t_role_permission` VALUES (19, 9);
INSERT INTO `t_role_permission` VALUES (1, 10);
INSERT INTO `t_role_permission` VALUES (3, 10);
INSERT INTO `t_role_permission` VALUES (14, 10);
INSERT INTO `t_role_permission` VALUES (19, 10);
INSERT INTO `t_role_permission` VALUES (1, 11);
INSERT INTO `t_role_permission` VALUES (3, 11);
INSERT INTO `t_role_permission` VALUES (14, 11);
INSERT INTO `t_role_permission` VALUES (19, 11);
INSERT INTO `t_role_permission` VALUES (1, 12);
INSERT INTO `t_role_permission` VALUES (3, 12);
INSERT INTO `t_role_permission` VALUES (14, 12);
INSERT INTO `t_role_permission` VALUES (19, 12);
INSERT INTO `t_role_permission` VALUES (1, 13);
INSERT INTO `t_role_permission` VALUES (3, 13);
INSERT INTO `t_role_permission` VALUES (14, 13);
INSERT INTO `t_role_permission` VALUES (1, 14);
INSERT INTO `t_role_permission` VALUES (3, 14);
INSERT INTO `t_role_permission` VALUES (14, 14);
INSERT INTO `t_role_permission` VALUES (1, 15);
INSERT INTO `t_role_permission` VALUES (3, 15);
INSERT INTO `t_role_permission` VALUES (14, 15);
INSERT INTO `t_role_permission` VALUES (1, 16);
INSERT INTO `t_role_permission` VALUES (3, 16);
INSERT INTO `t_role_permission` VALUES (14, 16);
INSERT INTO `t_role_permission` VALUES (1, 17);
INSERT INTO `t_role_permission` VALUES (3, 17);
INSERT INTO `t_role_permission` VALUES (14, 17);
INSERT INTO `t_role_permission` VALUES (1, 18);
INSERT INTO `t_role_permission` VALUES (3, 18);
INSERT INTO `t_role_permission` VALUES (14, 18);
INSERT INTO `t_role_permission` VALUES (1, 19);
INSERT INTO `t_role_permission` VALUES (3, 19);
INSERT INTO `t_role_permission` VALUES (14, 19);
INSERT INTO `t_role_permission` VALUES (1, 20);
INSERT INTO `t_role_permission` VALUES (3, 20);
INSERT INTO `t_role_permission` VALUES (14, 20);
INSERT INTO `t_role_permission` VALUES (1, 21);
INSERT INTO `t_role_permission` VALUES (3, 21);
INSERT INTO `t_role_permission` VALUES (14, 21);
INSERT INTO `t_role_permission` VALUES (1, 22);
INSERT INTO `t_role_permission` VALUES (3, 22);
INSERT INTO `t_role_permission` VALUES (14, 22);
INSERT INTO `t_role_permission` VALUES (1, 23);
INSERT INTO `t_role_permission` VALUES (3, 23);
INSERT INTO `t_role_permission` VALUES (14, 23);
INSERT INTO `t_role_permission` VALUES (1, 24);
INSERT INTO `t_role_permission` VALUES (3, 24);
INSERT INTO `t_role_permission` VALUES (14, 24);
INSERT INTO `t_role_permission` VALUES (1, 25);
INSERT INTO `t_role_permission` VALUES (3, 25);
INSERT INTO `t_role_permission` VALUES (14, 25);
INSERT INTO `t_role_permission` VALUES (1, 26);
INSERT INTO `t_role_permission` VALUES (3, 26);
INSERT INTO `t_role_permission` VALUES (14, 26);
INSERT INTO `t_role_permission` VALUES (1, 27);
INSERT INTO `t_role_permission` VALUES (3, 27);
INSERT INTO `t_role_permission` VALUES (14, 27);
INSERT INTO `t_role_permission` VALUES (1, 28);
INSERT INTO `t_role_permission` VALUES (3, 28);
INSERT INTO `t_role_permission` VALUES (14, 28);
INSERT INTO `t_role_permission` VALUES (19, 28);
INSERT INTO `t_role_permission` VALUES (1, 29);
INSERT INTO `t_role_permission` VALUES (3, 29);
INSERT INTO `t_role_permission` VALUES (14, 29);
INSERT INTO `t_role_permission` VALUES (19, 29);
INSERT INTO `t_role_permission` VALUES (1, 30);
INSERT INTO `t_role_permission` VALUES (3, 30);
INSERT INTO `t_role_permission` VALUES (14, 30);
INSERT INTO `t_role_permission` VALUES (19, 30);
INSERT INTO `t_role_permission` VALUES (1, 31);
INSERT INTO `t_role_permission` VALUES (3, 31);
INSERT INTO `t_role_permission` VALUES (14, 31);
INSERT INTO `t_role_permission` VALUES (15, 31);
INSERT INTO `t_role_permission` VALUES (1, 32);
INSERT INTO `t_role_permission` VALUES (3, 32);
INSERT INTO `t_role_permission` VALUES (14, 32);
INSERT INTO `t_role_permission` VALUES (15, 32);
INSERT INTO `t_role_permission` VALUES (1, 33);
INSERT INTO `t_role_permission` VALUES (3, 33);
INSERT INTO `t_role_permission` VALUES (14, 33);
INSERT INTO `t_role_permission` VALUES (15, 33);
INSERT INTO `t_role_permission` VALUES (1, 34);
INSERT INTO `t_role_permission` VALUES (3, 34);
INSERT INTO `t_role_permission` VALUES (14, 34);
INSERT INTO `t_role_permission` VALUES (15, 34);
INSERT INTO `t_role_permission` VALUES (19, 34);
INSERT INTO `t_role_permission` VALUES (1, 35);
INSERT INTO `t_role_permission` VALUES (3, 35);
INSERT INTO `t_role_permission` VALUES (14, 35);
INSERT INTO `t_role_permission` VALUES (15, 35);
INSERT INTO `t_role_permission` VALUES (1, 36);
INSERT INTO `t_role_permission` VALUES (3, 36);
INSERT INTO `t_role_permission` VALUES (14, 36);
INSERT INTO `t_role_permission` VALUES (16, 36);
INSERT INTO `t_role_permission` VALUES (1, 37);
INSERT INTO `t_role_permission` VALUES (3, 37);
INSERT INTO `t_role_permission` VALUES (14, 37);
INSERT INTO `t_role_permission` VALUES (16, 37);
INSERT INTO `t_role_permission` VALUES (1, 38);
INSERT INTO `t_role_permission` VALUES (3, 38);
INSERT INTO `t_role_permission` VALUES (14, 38);
INSERT INTO `t_role_permission` VALUES (16, 38);
INSERT INTO `t_role_permission` VALUES (1, 39);
INSERT INTO `t_role_permission` VALUES (3, 39);
INSERT INTO `t_role_permission` VALUES (14, 39);
INSERT INTO `t_role_permission` VALUES (16, 39);
INSERT INTO `t_role_permission` VALUES (1, 40);
INSERT INTO `t_role_permission` VALUES (3, 40);
INSERT INTO `t_role_permission` VALUES (14, 40);
INSERT INTO `t_role_permission` VALUES (19, 40);
INSERT INTO `t_role_permission` VALUES (1, 41);
INSERT INTO `t_role_permission` VALUES (3, 41);
INSERT INTO `t_role_permission` VALUES (14, 41);
INSERT INTO `t_role_permission` VALUES (19, 41);
INSERT INTO `t_role_permission` VALUES (1, 42);
INSERT INTO `t_role_permission` VALUES (3, 42);
INSERT INTO `t_role_permission` VALUES (14, 42);
INSERT INTO `t_role_permission` VALUES (19, 42);
INSERT INTO `t_role_permission` VALUES (1, 43);
INSERT INTO `t_role_permission` VALUES (3, 43);
INSERT INTO `t_role_permission` VALUES (14, 43);
INSERT INTO `t_role_permission` VALUES (19, 43);
INSERT INTO `t_role_permission` VALUES (1, 44);
INSERT INTO `t_role_permission` VALUES (3, 44);
INSERT INTO `t_role_permission` VALUES (14, 44);
INSERT INTO `t_role_permission` VALUES (19, 44);
INSERT INTO `t_role_permission` VALUES (1, 45);
INSERT INTO `t_role_permission` VALUES (3, 45);
INSERT INTO `t_role_permission` VALUES (14, 45);
INSERT INTO `t_role_permission` VALUES (19, 45);
INSERT INTO `t_role_permission` VALUES (1, 46);
INSERT INTO `t_role_permission` VALUES (3, 46);
INSERT INTO `t_role_permission` VALUES (14, 46);
INSERT INTO `t_role_permission` VALUES (19, 46);
INSERT INTO `t_role_permission` VALUES (1, 47);
INSERT INTO `t_role_permission` VALUES (3, 47);
INSERT INTO `t_role_permission` VALUES (14, 47);
INSERT INTO `t_role_permission` VALUES (19, 47);
INSERT INTO `t_role_permission` VALUES (1, 48);
INSERT INTO `t_role_permission` VALUES (3, 48);
INSERT INTO `t_role_permission` VALUES (14, 48);
INSERT INTO `t_role_permission` VALUES (19, 48);
INSERT INTO `t_role_permission` VALUES (1, 49);
INSERT INTO `t_role_permission` VALUES (3, 49);
INSERT INTO `t_role_permission` VALUES (14, 49);
INSERT INTO `t_role_permission` VALUES (19, 49);
INSERT INTO `t_role_permission` VALUES (1, 50);
INSERT INTO `t_role_permission` VALUES (3, 50);
INSERT INTO `t_role_permission` VALUES (14, 50);
INSERT INTO `t_role_permission` VALUES (19, 50);
INSERT INTO `t_role_permission` VALUES (1, 51);
INSERT INTO `t_role_permission` VALUES (3, 51);
INSERT INTO `t_role_permission` VALUES (14, 51);
INSERT INTO `t_role_permission` VALUES (19, 51);
INSERT INTO `t_role_permission` VALUES (1, 52);
INSERT INTO `t_role_permission` VALUES (3, 52);
INSERT INTO `t_role_permission` VALUES (14, 52);
INSERT INTO `t_role_permission` VALUES (1, 53);
INSERT INTO `t_role_permission` VALUES (3, 53);
INSERT INTO `t_role_permission` VALUES (14, 53);
INSERT INTO `t_role_permission` VALUES (1, 54);
INSERT INTO `t_role_permission` VALUES (3, 54);
INSERT INTO `t_role_permission` VALUES (14, 54);
INSERT INTO `t_role_permission` VALUES (1, 55);
INSERT INTO `t_role_permission` VALUES (3, 55);
INSERT INTO `t_role_permission` VALUES (14, 55);
INSERT INTO `t_role_permission` VALUES (1, 60);
INSERT INTO `t_role_permission` VALUES (3, 60);
INSERT INTO `t_role_permission` VALUES (14, 60);
INSERT INTO `t_role_permission` VALUES (18, 60);
INSERT INTO `t_role_permission` VALUES (19, 60);
INSERT INTO `t_role_permission` VALUES (1, 61);
INSERT INTO `t_role_permission` VALUES (3, 61);
INSERT INTO `t_role_permission` VALUES (14, 61);
INSERT INTO `t_role_permission` VALUES (18, 61);
INSERT INTO `t_role_permission` VALUES (1, 62);
INSERT INTO `t_role_permission` VALUES (3, 62);
INSERT INTO `t_role_permission` VALUES (14, 62);
INSERT INTO `t_role_permission` VALUES (18, 62);
INSERT INTO `t_role_permission` VALUES (1, 63);
INSERT INTO `t_role_permission` VALUES (3, 63);
INSERT INTO `t_role_permission` VALUES (14, 63);
INSERT INTO `t_role_permission` VALUES (18, 63);
INSERT INTO `t_role_permission` VALUES (1, 64);
INSERT INTO `t_role_permission` VALUES (3, 64);
INSERT INTO `t_role_permission` VALUES (14, 64);
INSERT INTO `t_role_permission` VALUES (18, 64);
INSERT INTO `t_role_permission` VALUES (1, 66);
INSERT INTO `t_role_permission` VALUES (3, 66);
INSERT INTO `t_role_permission` VALUES (14, 66);
INSERT INTO `t_role_permission` VALUES (19, 66);
INSERT INTO `t_role_permission` VALUES (1, 67);
INSERT INTO `t_role_permission` VALUES (3, 67);
INSERT INTO `t_role_permission` VALUES (14, 67);
INSERT INTO `t_role_permission` VALUES (19, 67);

-- ----------------------------
-- Table structure for t_scheme
-- ----------------------------
DROP TABLE IF EXISTS `t_scheme`;
CREATE TABLE `t_scheme`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'd',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `people` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statue` int(10) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_scheme
-- ----------------------------
INSERT INTO `t_scheme` VALUES (2, '高血脂干预方案', '高血脂', '中度肥胖', '吃低糖食物', 2, '注意饮食和运动');
INSERT INTO `t_scheme` VALUES (3, '高血糖干预方案', '高血糖', '中度肥胖', '吃低糖食物', 2, '注意饮食和运动');

-- ----------------------------
-- Table structure for t_scheme_food_sport
-- ----------------------------
DROP TABLE IF EXISTS `t_scheme_food_sport`;
CREATE TABLE `t_scheme_food_sport`  (
  `id` int(10) NOT NULL DEFAULT 0,
  `food_id` int(10) NOT NULL DEFAULT 0,
  `sport_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `food_id`, `sport_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_scheme_food_sport
-- ----------------------------
INSERT INTO `t_scheme_food_sport` VALUES (2, 1, 1);
INSERT INTO `t_scheme_food_sport` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for t_setmeal
-- ----------------------------
DROP TABLE IF EXISTS `t_setmeal`;
CREATE TABLE `t_setmeal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `helpCode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_setmeal
-- ----------------------------
INSERT INTO `t_setmeal` VALUES (12, '入职无忧体检套餐（男女通用）', '0001', 'RZTJ', '0', '18-60', 300, '入职体检套餐', NULL, 'bab42621-07bd-42ef-b745-d6f6071074c0.jpg');
INSERT INTO `t_setmeal` VALUES (13, '粉红珍爱(女)升级TM12项筛查体检套餐', '0002', 'FHZA', '2', '18-60', 1200, '本套餐针对宫颈(TCT检查、HPV乳头瘤病毒筛查）、乳腺（彩超，癌抗125），甲状腺（彩超，甲功验血）以及胸片，血常规肝功等有全面检查，非常适合女性全面疾病筛查使用。', NULL, '455d86cc-e808-41e8-a09f-ba4576916288.jpg');
INSERT INTO `t_setmeal` VALUES (14, '阳光爸妈升级肿瘤12项筛查（男女单人）体检套餐', '0003', 'YGBM', '0', '55-100', 1400, '本套餐主要针对常见肿瘤筛查，肝肾、颈动脉、脑血栓、颅内血流筛查，以及风湿、颈椎、骨密度检查', NULL, '1527a8b1-f35d-429a-a1a7-77f209a58cbd.jpg');
INSERT INTO `t_setmeal` VALUES (15, '珍爱高端升级肿瘤12项筛查（男女单人）', '0004', 'ZAGD', '0', '14-20', 2400, '本套餐是一款针对生化五项检查，心，肝，胆，胃，甲状腺，颈椎，肺功能，脑部检查（经颅多普勒）以及癌症筛查，适合大众人群体检的套餐', NULL, 'cdf491a4-2b18-4182-acc2-e1d81eea15d7.jpg');

-- ----------------------------
-- Table structure for t_setmeal_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_setmeal_checkgroup`;
CREATE TABLE `t_setmeal_checkgroup`  (
  `setmeal_id` int(11) NOT NULL DEFAULT 0,
  `checkgroup_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`setmeal_id`, `checkgroup_id`) USING BTREE,
  INDEX `checkgroup_key`(`checkgroup_id`) USING BTREE,
  CONSTRAINT `checkgroup_key` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `setmeal_key` FOREIGN KEY (`setmeal_id`) REFERENCES `t_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_setmeal_checkgroup
-- ----------------------------
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 6);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 12);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 13);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 13);
INSERT INTO `t_setmeal_checkgroup` VALUES (13, 14);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 14);
INSERT INTO `t_setmeal_checkgroup` VALUES (13, 15);

-- ----------------------------
-- Table structure for t_sport
-- ----------------------------
DROP TABLE IF EXISTS `t_sport`;
CREATE TABLE `t_sport`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `helpCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sportname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sporttime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sport
-- ----------------------------
INSERT INTO `t_sport` VALUES (1, 'YD3108', '背部拉伸', '3-5次/周', '30-60分钟/次');
INSERT INTO `t_sport` VALUES (2, 'YD3107', '碾压脊柱', '1-2次/周', '30-60分钟/次');
INSERT INTO `t_sport` VALUES (3, 'YD3106', '扭转脊柱的坐位拉伸', '3-5次', '30-60分钟/次');
INSERT INTO `t_sport` VALUES (4, 'YD3105', '跑步', '每天一次', '每次半个小时');

-- ----------------------------
-- Table structure for t_syslog
-- ----------------------------
DROP TABLE IF EXISTS `t_syslog`;
CREATE TABLE `t_syslog`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consumerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visitTime` date NULL DEFAULT NULL,
  `visit_timestr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_syslog
-- ----------------------------
INSERT INTO `t_syslog` VALUES ('0071dda8-9ecf-4711-8242-403a60e8f6bb', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('013c3ad5-c6f6-4a00-a4ec-d1580f7b2357', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '740', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('0154e139-3379-4f91-a0de-888a46c4b3ae', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '241', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('01c9437c-aa69-456f-a6ec-8f81f71f5f8d', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('02201a20-8e02-48db-876e-ecf3180c9bbb', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '92', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('036a59e1-2378-42d2-9a1c-e3f7eb8da324', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '279', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('03ac8e51-9b8c-4c9d-975a-6d38daa93540', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '0', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('03e823a6-77c4-42af-bffa-4dcd71b70e8c', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '313', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('0417e1c0-9d54-4617-946b-ff2496489150', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '79', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('046e8446-e3d7-47c1-bfde-61ba610d15be', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '0', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('056e5053-ba07-4683-be30-591b784d0857', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '340', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('061b341d-1327-4904-aa7d-2308cebb68ff', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '0', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('0653285e-45e9-4beb-b614-e9dc4ef49f67', 'test', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '186', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('0675ad6e-369a-469d-ba65-b3e5546d3131', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findRoleByPmId', '653', '[类]com.itheima.controller.PermissionController[方法]findRoleByPmId');
INSERT INTO `t_syslog` VALUES ('07d822de-a3dd-4ebd-b2c8-088a32d4ea2a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '261', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('089df9a3-fba4-454c-a108-e09df6e6ebc2', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '301', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('08cd27f8-616b-48f1-a687-953034dfbe9a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '249', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('08d01428-947d-4f19-b8ff-ea57a2e3feea', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '739', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('08e57397-075b-4d53-a9a0-1e20c353b05f', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '815', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('0a212b6a-fd50-483e-9b35-472784f2ca7f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '749', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('0a553e6b-f5d6-4764-b142-759e4d1b3600', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '1993', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('0b0174c8-8539-4655-a4eb-cf0ccc2ecbb8', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '112', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('0b6e4378-a668-4e2e-9934-7f1d49a70470', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '283', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('0b89e267-eb0f-4ef2-beae-aee5c67e4006', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '256', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('0c508dcb-5e7c-49b0-a666-bbed92e15a4a', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '177', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('0ca0dc8e-7e24-4a51-8632-cf87b9b2530e', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('0dab24d8-4599-4533-ab67-cc60072aceb3', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('0dc6e1f9-a731-42ef-b7fd-f88e82fac3e0', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '0', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('0ef9f497-ad5a-4142-bb79-1fcaedde7010', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '109', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('0fdfc4f9-b7e3-4ea6-915d-623adce55276', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('0fe56074-a872-4710-955f-bb93d17a8224', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1058a682-bdd9-443b-a0f3-b64dff615f5c', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '78', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('10b12386-0fb8-4e84-8163-946d21026f7f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '247', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('119aa788-3379-4196-a334-20fbf2624f2a', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '400', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('11ad9789-6454-440b-a35e-13c5b1e524cc', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '312', '[类]com.itheima.controller.MenuController[方法]add');
INSERT INTO `t_syslog` VALUES ('11ae5052-fc01-4d79-b2d4-31e7010f8c64', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '281', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('11b22654-cc34-4d38-a834-094cda080c62', 'xiaoming', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '110', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('120b8193-b437-4d86-83a9-06e2c574f29f', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '99', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('129c3d31-40e6-427b-a75b-f76762c86b72', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('12f7f29b-975c-4026-a347-9c404185a787', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '245', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('1339110d-56e1-4544-ac82-e3ef033b00de', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '241', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('142b3749-f36a-4032-a4eb-6ea239598382', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '333', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('145113ad-82e7-4264-bdc8-e60f1ec035c0', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '131', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('14aa446f-35c7-40ac-adeb-4ac40ab8ceb9', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1508d12f-ef29-4c81-aab5-2a43109991dd', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1291', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('1590d649-179d-4708-9519-90ed674414bc', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '123', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('15aafa6c-395c-4db1-8047-2f8058022267', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '600', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('15c3c6f1-e404-4a8d-b533-5c1933c4ac11', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '83', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('15ede766-3d82-4dbc-bd9e-58d5c02fbfc4', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '26623', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('164f4cac-4d93-4519-bebc-649358376cba', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1428', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('169b4cf1-2119-4f8d-8974-634365342228', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '293', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('16c6ce6f-5498-404a-957b-005eacb41832', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '293', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('17888167-0973-4617-9d08-8e2ca4b53312', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '252', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('17cca0ba-c9fc-44b0-8e84-70fd11a79301', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findOrderById', '264', '[类]com.itheima.controller.OrderController[方法]findOrderById');
INSERT INTO `t_syslog` VALUES ('18508734-5588-429e-8da5-ce848297c527', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '286', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1876e1eb-d268-4983-99e3-ef887fd3f67d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1272', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('19a5f637-6b84-44a9-a96f-f029b205abe4', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1a3d1e5c-6ffb-433d-b9a4-ac0461af29fd', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '266', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1a4e35cf-3686-4eaa-b932-f7c3bd6c8441', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1a663869-d108-4418-9176-04b2935a3453', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '346', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('1a6a8175-3add-4116-9ceb-61a2cbd20680', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1a6d0949-b17e-4e62-88f4-0448b86fab3f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '317', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('1a8e3d6a-87e1-4c82-8ab9-7ef0c7979e57', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '279', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1ae3dba2-e04a-4716-99b6-dcb307c0b3dd', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1b9d66b7-9c9b-48cf-9094-8466efe20dbd', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '324', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1bd4cb31-4d64-4677-9e0a-53cc92aeb8df', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1158', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('1bea99bb-9f28-42a9-8083-4f044de10b77', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '289', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('1c1ca781-b4d5-40af-91fb-2bbbf20af0ba', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '322', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1c588d66-9a1e-474d-9a23-49e96e25cbdf', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '264', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1cd400e3-d44a-4574-a915-6a15770dd891', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/delete', '487', '[类]com.itheima.controller.AddressController[方法]delete');
INSERT INTO `t_syslog` VALUES ('1cf14314-4a0a-4739-97da-f4f81a6e493f', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1d125896-487f-4652-b0db-17285f866808', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '293', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('1d1bafc3-b7c7-4a8d-86bc-6c6a69bf482f', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '3058', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('1d1d24fd-aebc-4e91-a9ac-b958b9a871e6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '274', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('1d24d9e7-c5f7-4989-9aeb-82a8e16ecf76', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1025', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('1d6f0100-e337-461a-8f1b-eec6c98f287e', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '105', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('1de79ee0-2c02-446f-a701-a87198beb4f6', 'xiaoming', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '536', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('1e445a5b-5624-4b96-8efb-e93eacba5e50', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '325', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('1e8b8e9c-1eb4-424d-8f83-87087f1ce429', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1176', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('1ec59e92-ed48-44e3-a9b1-6095619b5f64', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1f147508-3153-4f6d-b91e-f8e3edc3ea91', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '8479', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1f63ebcd-3f56-43be-85c1-0a98def9138c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '268', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('1f9606a3-1595-4a99-a974-74634e39bff7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '237', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('203ae82c-2ff8-4b7f-bc0b-b408e2537323', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '314', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('206a325d-5bc7-4c5f-b4c4-2f361f2bac21', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '280', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('20e302b7-5f8c-4b8b-b604-4b8e81fd8f67', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '4455', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('21b0b7d7-6fa8-4208-a959-183a6ae5979f', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '268', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('21e3265b-27e6-469e-97f3-a95b055aed09', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '230', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('21e4e855-d08b-4925-891e-b3d1afb234df', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '240', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('21fb8954-d1ad-499e-b1ed-eac858f84ad9', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1340', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('2202a45a-5d58-4f37-ad6b-0b91af4a49d8', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '409', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('2273aae7-1fdb-4bac-b1f9-3856c49ccf68', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '81', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('22ce1304-bf1e-4ec7-aecf-f74db7e1e237', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '262', '[类]com.itheima.controller.MemberController[方法]deleteMember');
INSERT INTO `t_syslog` VALUES ('22de8422-5041-41c3-aafe-64990fb0a657', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '344', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('22e681d2-be74-4b7c-8276-c8c246608595', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '395', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('22ea5d96-063f-4143-8349-37a2fe753fa5', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '1', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('231c686f-40e2-453d-83e2-0c81061bb2c1', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '73', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('23c0da82-ab7e-4fc0-98f2-c97d67b04cf0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1184', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('23e3a9d3-78cc-4868-a1b3-6b3d3d2246b5', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '241', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('24a54e5f-d5a2-4758-8d10-d855976a13b5', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '605', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('2560704b-6526-4138-825c-65241977c52a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '736', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('2640c3ba-8e3d-4834-a5e5-555b555d51be', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1258', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('26927027-b79b-4fd9-b9cd-02141db143f3', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '287', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('26ca347e-725b-4e6e-b805-0193a4e354ae', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '259', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('26d3dba2-3a55-4288-87d9-b267ab7cee10', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('28972b11-f9fa-416d-b777-f163233add04', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '336', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('290d8ba6-9058-4fb3-ace0-86aee898c674', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '285', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('2920b6fa-506c-4fd1-84fb-f538a7a98b1e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '333', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('293a1df1-11d5-48ae-8311-eb7010f6f2f5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '305', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('293db46d-2f4c-4466-956b-5a8c4674648c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '215', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('293eb204-8ed3-46d2-8c73-000069ad7612', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '252', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('29401feb-488d-4fcf-936f-af35ab493636', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '2279', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('2944194b-9c0d-4dad-a919-ed3a2a066f0d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '277', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('29472990-095b-427e-b015-e736be16306a', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '356', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('29704ca6-0fdc-4fd8-aa16-7e1406bf1862', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '433', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('29742e8b-f30e-4384-87d0-529047566655', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '296', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('297c4dab-6efc-471a-bca9-1370e54b81a0', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '228', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('29991674-faa3-4cba-a30a-baece236a366', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('29a25279-3fab-456c-88b7-13662d2cb647', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '248', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('29ba8ac4-f820-4f72-9aae-d2fa95c2055d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '385', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('2a402e9d-5257-44e1-b8b8-23866ceac725', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '3257', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('2a564765-764f-45dc-9be0-b70936fb735d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '698', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('2a5d0e7c-cc31-434d-9fae-cfc2b0331815', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/statusEdit', '340', '[类]com.itheima.controller.OrderController[方法]statusEdit');
INSERT INTO `t_syslog` VALUES ('2a5d7022-2f58-4f17-8723-bf124a396d4b', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '340', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('2a5e46a0-5a48-4d28-a017-df1d5d4afb06', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '663', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('2a8a6ca3-7fda-4bab-b1d1-91bc84497181', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/add', '2733', '[类]com.itheima.controller.RoleController[方法]add');
INSERT INTO `t_syslog` VALUES ('2a9b84bb-4ea8-4572-aa99-dd2abfeaa476', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '239', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('2af684af-4889-4a55-b673-901802091639', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '311', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('2b933c52-77b4-439e-93b5-930fb52d8de4', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '255', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('2c114d13-4180-4d5b-b4f4-25401320cadb', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '741', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('2c2d3aaa-53a7-4cea-b571-3ce4f4a91d88', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '2986', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('2c8f8205-f2fb-4a57-b8b6-2501a2730c27', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/add', '324', '[类]com.itheima.controller.AddressController[方法]add');
INSERT INTO `t_syslog` VALUES ('2cb69275-9bc6-453c-8014-6ebfd7fe4022', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '236', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('2cbad785-eae7-4fa3-a5b4-fbc88c9e8e8c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '261', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('2cbc1082-44cf-45e8-ad78-3e62a34bd479', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '308', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('2e2a2e06-4644-4b1e-a1a1-e5afa261295d', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '125', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('2e898ea6-c46a-4280-bdb5-bd937817a28f', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '605', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('2e913888-3138-43ca-8077-cd82326a3fe7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '418', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('2ebe7034-c222-475a-8cad-7fb003543f94', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/add', '492', '[类]com.itheima.controller.PermissionController[方法]add');
INSERT INTO `t_syslog` VALUES ('2efc9eb0-426a-4f47-8b7a-94c550c29311', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '387', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('2f0a1224-f350-4f33-804d-dc819facb2e6', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('2f567dac-4383-4d58-9c77-c7653939a83c', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '449', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('2fd3a1da-68d0-45c2-a6f1-33255e94570f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '303', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('303f87db-3526-437d-8e7f-50ebcac86afb', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '384', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('310d0b81-9a12-44d5-ac12-986e840d8b43', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '200', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('31148671-006d-48f4-adb5-215a2e7dcdd8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '309', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3123012d-934e-49bc-8aca-8816b08b93e3', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '367', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('31776f51-e338-43d9-9a43-200994d34574', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '171', '[类]com.itheima.controller.MemberController[方法]editMember');
INSERT INTO `t_syslog` VALUES ('327d2b2b-12db-4088-9c62-f363d9484358', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '296', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('32a79ff7-1154-47fb-8485-c1c058b3c6f0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '1778', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('32bfed67-ca78-4ab9-9517-ca563c2bb504', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '797', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('32cf6983-8d4d-4af1-b007-5b6dc5ae5fd8', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '0', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('3321ed61-6b38-4784-bfcc-a078695e9bb4', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('341ce62f-4ac5-462b-abe5-1a9d9994b651', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '348', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('342044c5-a87e-4c01-8d80-0f11b158e7ea', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '311', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('347f5a12-5e3f-452e-93aa-459e02a30bb8', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1168', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('34813c1e-b395-4f0b-8c29-75dad071990c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '204', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('35b9bd4b-5bc7-4916-86d7-06f30539bdc0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1966', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('35d77bc0-4cc7-41d2-9d27-c8175fe73e63', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/edit', '242', '[类]com.itheima.controller.PermissionController[方法]edit');
INSERT INTO `t_syslog` VALUES ('35dd8e89-469d-4036-9888-72be7bf3cab0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '132', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('36f81aab-9800-42a1-8e53-e3b387589a89', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findByPageAndCondition', '0', '[类]com.itheima.controller.PermissionController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('370b8682-7837-48b8-b93d-bd720e4d4af5', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '107', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('37187928-f59d-4047-bc3e-58ab5bca4b5a', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '140', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('3785a76e-7133-4f35-91ec-612cf1130518', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '321', '[类]com.itheima.controller.MemberController[方法]addMember');
INSERT INTO `t_syslog` VALUES ('37989d6e-c36c-4e9f-8b05-6871d2eecc82', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '115', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('37f0314d-e89d-4152-99d8-f128055ec4ae', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '229', '[类]com.itheima.controller.SetMealController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('38162827-128c-46eb-ac36-2e4465cc6da3', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '113', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('38285545-2e37-439d-9069-db48dea58b5d', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '315', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('382e8fc5-c872-4eff-bdfb-89d850e750e5', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '139', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('387eb497-f742-453e-8191-d7de391e3d0c', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '0', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('389d9a62-c656-4043-9ab8-35f08f2eedbd', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '98', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('38ba6094-de77-4342-a88a-6144c233c360', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '46934', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('38e5b0ef-b3d4-4fe9-8c52-efea9bf39257', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1151', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('3958b298-dfc2-4747-b572-adec9e3c64b6', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '240', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('396aa6f4-8d01-4621-a703-c8edb57b0d04', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findFoodById', '201', '[类]com.itheima.controller.FoodController[方法]findFoodById');
INSERT INTO `t_syslog` VALUES ('399028e6-59c7-4c07-b26a-07dc3a3f3bdf', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '205', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('399ee0be-3a9a-412e-898a-dc76e2192853', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '292', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('39e63348-4427-45a2-aa19-66593ed8d189', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '266', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('3a9546ba-46bf-4ce6-8962-dee2fe9d2ede', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '320', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('3ab4ac47-7829-49bf-ad0c-5907239697a4', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '238', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3ab883c0-f6d7-46c4-a36c-eacb1b9ab4e7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '239', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('3b060327-7595-4211-882c-dc3e2b8c09d8', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '735', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('3b080e67-0259-4010-a349-feca16687c29', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '130', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3b2f913b-5490-4d2b-9c2d-4defa0fed67f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '312', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('3be68757-cf2c-4f4a-8e01-eaaa75db24d4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '353', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('3bf4d8c6-e9c0-4f13-a1cd-e87dbe80718b', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3d45a48b-76d0-4a6d-b8a4-501d5768d96e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '345', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3e8cf0a4-a275-4ba1-aaef-ea78d65b4abe', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findAllSetmeal', '0', '[类]com.itheima.controller.OrderController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('3ecf01a7-92da-4a42-9b76-606ba1730467', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3eea6d17-2eeb-4b2d-b8d3-1dd945f6e5eb', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '0', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('3ef85744-bbfb-44fc-9950-ab74fff490b3', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '455', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('3fb4bc85-7ea9-498e-9cdb-e156c1d4581f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '281', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('400658a0-c7b3-4290-830c-a226d96c3c8d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '565', '[类]com.itheima.controller.MenuController[方法]add');
INSERT INTO `t_syslog` VALUES ('4094fac8-265a-4f1c-bc15-b4ae418d4d02', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '312', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4149c8d6-e555-431e-ae12-4409547abca0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1129', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('4190d3a6-eb9e-4984-963c-41c1510de4b6', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '293', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('41fcf4ee-05c6-4e2b-b384-8e42d8d789d7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '446', '[类]com.itheima.controller.AdviceController[方法]add');
INSERT INTO `t_syslog` VALUES ('4288df5e-f802-4e26-86b2-5787b62920b7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '631', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('42965c4a-aed8-40b6-83cd-b765700da28c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '411', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('42c80006-2892-4e43-aed9-f93ad4e8a8fc', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '0', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('438097a0-ce24-459d-9036-1173407a41d4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '256', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('4383704d-313c-4016-96c1-469e9b114f4e', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '292', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('43a93e19-0cb6-48c4-b2f5-b6a0efa2fee5', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '455', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('44af1f29-de2b-458b-886a-bc1a1185fbeb', 'xiaoming', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '116', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('44c7f620-b352-4288-b0cb-64da2bb61856', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '340', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('454de39a-515f-4402-aa88-aa65e5fcbb45', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '344', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('45732af0-6a75-4b10-a432-25ec15d7ef3c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '80', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4675ae06-d090-40dc-9a9e-5d2b006c087d', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('479009fe-f857-41bd-b81f-d258c879118c', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '103', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('47ba1add-2db4-4fd9-9d98-a9ca576f3132', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '252', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('47c969f0-c7b6-47ac-89aa-2c333d264ad5', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '134', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('47d3bada-d306-4dcb-a1c3-de3cbfb9760c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '323', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('47de381d-2b7a-4cfe-af00-198cd5fc45c0', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '813', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('47efe41f-935e-48c6-afc6-fc27942f1947', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '2674', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('47f5477d-c7b5-4566-a54b-8b1107aae37e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '317', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4886ee04-7fff-4293-8bf9-b47579deb5a4', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '258', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('48895f6b-64da-47e3-84d2-366aa98d8f1e', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '501', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('48c18b14-463c-431d-8f59-3066d63919e5', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '245', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('48c44095-7441-444c-ad0c-13dc441db488', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '279', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('48c45400-c099-4c0b-9aa6-bf4ca048b058', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '279', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('48cb4089-1aee-4211-acd3-eb16f47bcf24', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('490b6118-46a3-4693-be87-c18fd04f126f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/delete', '363', '[类]com.itheima.controller.UserController[方法]delete');
INSERT INTO `t_syslog` VALUES ('4942207a-d518-476a-80b7-db435e845c2e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '320', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('497748e4-6c4c-418d-a9d7-04677f852d22', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '258', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('49c47aed-81a9-4519-a705-fb5d07ba5141', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '257', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('49ceb69a-dc63-43d7-9df8-59e48e2c5b52', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('49ea10fe-a51c-4e5e-b0c9-269d043e8614', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1088', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('4a3d4599-7ecc-4a27-90fc-001713654d98', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '299', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('4a4ab0e8-ed1c-4cfe-bfb9-ab95850c09f9', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '214', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('4a9f980e-4aed-4ce0-98da-1d01b14cc54c', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '293', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4aaebfe3-5bed-4da2-b3dc-4867ef99482b', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '338', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4ac19171-f715-4457-992a-ea9143c90284', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '297', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4b32369b-0f15-48af-bd57-735c2ba4fa83', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '135', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4b76e8f8-8de9-4619-b82a-a80368297730', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '131', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4be8014f-7cb4-492d-b67a-4cc053bd35eb', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '306', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4c01c361-1fc2-4ee3-a288-e6b87356ccc8', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '38828', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4c0dbfbf-a80a-44ac-91ee-2a370d3c9b8b', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '865', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('4c129e9f-5dac-482c-bf8f-3068f9b4b990', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '359', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4c34699c-bfa6-40b9-bef7-176b5e6f1de2', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '29073', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('4c43162a-bda0-4610-b063-da21d05ac8e7', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4cc9e351-4d2e-4b6a-9d17-112adafdab05', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '288', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('4ccbb3c2-ccba-4f21-9bf8-6b5e9b40759f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '2004', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('4cfcc279-82ee-495b-9b97-0f11cde230e8', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '107', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4d184420-3282-450c-8df1-f3d8377d19b4', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '118', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('4d3c80e9-c55b-4ef0-877a-3657fed01482', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '133', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4d7cbd40-2b10-40df-969c-ed68d613e22c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '280', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('4d8eefa9-ff1a-4fe0-92d6-c87e37a858ae', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '248', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('4dba823d-6e44-491d-9683-1948eb1da55e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '359', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4dc11f89-2476-4436-a962-2fb645179909', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '306', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4dc5fe3d-af4b-4cca-825a-f09f08fa070d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '354', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4dc6b138-b305-4657-801e-58932ffeac54', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '755', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('4de0f152-cc8f-4072-96bf-44544b8d809a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1242', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('4dfe6c64-54ec-42f5-8a5b-c692a125fdd9', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '93', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4e29120c-334f-469a-85af-2ff1de458362', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '246', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4e85fa25-e5b2-4716-8d1b-ac2cc9687021', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '291', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('4e915a44-5028-46c0-9990-272fa0639334', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '296', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('4eab6c77-1ff0-468f-81ce-7a3d2677742a', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '217', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('4eac2959-0421-45c9-9ab6-5159db6e5ac9', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1261', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('4ecc0341-1007-4644-b833-71b316de1c1f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/deleterole', '504', '[类]com.itheima.controller.RoleController[方法]deleterole');
INSERT INTO `t_syslog` VALUES ('4eddd9fa-ae68-4647-8558-27abd4cc9981', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '224', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('4ee359ba-f2af-4191-930f-64cfb8765eb1', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '0', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('4f16c5db-4262-4680-96f1-a5dee40e5c62', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '753', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('4f19f0e0-e9ab-4c7b-ae06-2006f425d8dd', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '350', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4f3aa215-5a0a-4d50-bca3-80dec843d81d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '308', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4fdd9ea9-f9d4-49d4-a058-148bbe8587e7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '228', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('4ff25e66-e411-43e1-bcd2-baec0044ba40', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '166', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4ff8c096-74d1-4a07-b996-526e1fd76ee2', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '157', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('5025b08d-2d97-4d0f-80d3-4e99b2c49f41', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '819', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5025f2b5-cf41-4ee7-8f9c-bb9df4414664', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('503b838f-1db3-4da6-9f3e-10eb039c7997', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '350', '[类]com.itheima.controller.MenuController[方法]findAllMenu');
INSERT INTO `t_syslog` VALUES ('504a9105-3e1a-48bd-a72b-c2d0e771db9f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '261', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('506ba0f7-1273-47e8-a558-064f59b0df1b', '122', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '646', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('50acdf60-459e-4129-8605-23ea1350d4d7', 'xiaoming', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '340', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('50d2ade2-1a24-4e7a-88d9-e6b1973cf27c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '351', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('51144f18-edfc-4701-b1e3-fa852cda6d67', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '293', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('5176ca62-7ca9-4fc3-b213-967b4f0deff0', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '358', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('51998339-13de-4da0-bb02-3ed0b37063e8', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '115', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('51caa8be-3474-4c15-ba78-1ced387709a7', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '145', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('51da3808-c420-462b-8679-38d9c46e5414', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '261', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('521f2f85-ed42-4e83-a225-46e5717915b5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1859', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('52519832-548d-4052-bd1f-0deddda82bf1', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '443', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('526d7d90-42f2-406b-8b6d-22153634a327', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '187', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('526ebc42-debb-42fe-8e6c-41220b7dd7cd', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '239', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5285b734-c58e-4341-88d4-7911ade5381f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '227', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('529b39d1-94f9-4080-b870-12ddaf47a5f7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '89', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('52bab4f2-0305-4bf6-b750-07cb676725c3', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('52ee8c51-e8f9-462d-be8d-adb44fcc99af', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '1', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5304d192-1540-4fc9-b766-ada34d7b536b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '21653', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('530b447c-0c99-43e4-898e-00d3b29061cb', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '144', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5318805d-9823-421d-ab59-ba91711a43a0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '0', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('53430aa2-053d-4ea6-8908-0d85e41b2e25', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '270', '[类]com.itheima.controller.SetMealController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('53677749-bd4f-4e67-93bd-c7f99c670723', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '227', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('53695950-1563-4162-a6e8-526d4e7f81ac', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1753', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('53736a05-2c12-4ce1-b1c0-476f49da97fb', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '8357', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('53f9f9d4-4703-4f32-b5e8-d7aa709bc92e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '296', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('540fda78-e9e4-449b-b11e-b893f4746979', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('542d18dd-f483-460c-9dc5-db6c2882dce8', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '842', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5455cee1-e8cb-4d64-9717-ef20aa9d420f', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '246', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('548eb5b1-a8b6-4b64-b4e5-383a3f239b9d', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '201', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('54b6cd95-e16f-4e94-b2df-45877f5d31db', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '700', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('54d76954-b3b2-42cf-8ac3-aa2c75400695', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1718', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('54e87f9b-6d1f-4a68-b9fa-a5e577d1f113', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '1582', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('54ebf1f5-7e5d-4c75-b88b-4cca3a84e32b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '504', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5504fc1a-54c5-444b-bc71-0c97829966be', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '533', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('558be004-2026-45b5-94d3-8af8002202c8', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '237', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('559ef228-9912-4758-a7fc-2b720fd487b0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '269', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('55aaa074-89d1-4f34-bd44-9b615dbc605f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '673', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('55c0d336-2d44-43c7-8b8a-9444e5649e71', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '218', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('55d63cb7-86f6-48aa-98a7-a71f85586546', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '410', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('55d83c69-8b70-4bf6-882a-63861ef90aef', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '520', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('56039eae-16c5-4ecd-ba56-8ab694713fa2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '273', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5612f37a-ff49-43f7-83eb-58820ac4c077', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '240', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('562309e8-3fee-411e-aeec-53dac8644546', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '264', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('562589c5-e836-476d-b046-6715e2169ea1', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '248', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5636fade-de3e-4f37-b7d6-e6a992cff78a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1360', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('56472db4-aae0-4fc3-a0df-33b9f8799fda', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findUsById', '86', '[类]com.itheima.controller.RoleController[方法]findUsById');
INSERT INTO `t_syslog` VALUES ('564cbbd4-155c-4146-8e2b-4943c3cf314b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1197', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('565a481c-800c-4fb2-a28b-4759188f7aa3', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '197', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('566fbac3-4be3-46ed-9215-d7296004fff2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/add', '692', '[类]com.itheima.controller.UserController[方法]add');
INSERT INTO `t_syslog` VALUES ('56870e53-bbaa-4683-9363-518063ddb505', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '0', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('56915cc0-3073-4c60-a4a8-dcce41d6836b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '1870', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('569abcce-d5a5-4174-a933-c1a927f1c9eb', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '97', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('56ae2c2e-a8d8-486c-8537-db36eeab7f73', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '322', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('56b7ff18-e647-4781-89fd-ae383e73bc8b', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '121', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('56d35b1d-da0f-4bf9-8342-1a3481412097', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '105', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('56ec35f8-6cc5-4e24-8ad6-7cedf74ecbf3', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '100', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('56fa6171-8b4c-45db-b6a8-59c4573ff2e6', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '357', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('570b7f38-d08f-4f98-bf44-9fbd4a964af4', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '675', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('572f97d8-e9d6-4630-bf0a-16f6ea9bf830', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getOrderReport', '0', '[类]com.itheima.controller.PermissionController[方法]report');
INSERT INTO `t_syslog` VALUES ('573309cf-c02d-403b-9fe7-98dc33d8a2c9', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '267262', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('573664cc-0d2d-4666-a7af-1b8efe95c674', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('57750979-bb23-4c7e-afa6-bfe17db0b1f1', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '226', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('578e1ba4-164d-414e-b1da-00ffbd0e5780', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('57a2defc-611d-477a-ac69-ecd3e503b491', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '260', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('57a32100-284e-4c79-8214-2ca7060520d5', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '6954', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('57b8598f-0cc5-4f7b-a0c1-701555a9af95', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '148', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('57b87aa4-3618-4b08-9151-185eb2f17812', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '342', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('57c4e826-7e16-43e0-98a1-177f7bb6d76f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '0', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('57d82655-4b52-446c-a053-d7e03401f2a1', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '273', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('57f12a14-b4aa-4e0b-aea2-dbc1bda95e79', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '291', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('580c6c36-f019-4084-897b-201b034d2b20', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '804', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('582cebd9-b9fa-4ef0-8703-898dcb57f12d', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '3507', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('583f75ba-59ed-4a32-8b6e-f6bcee16c653', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '300', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('584dee1c-9774-4743-b65b-7aa4f9fe80c7', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '149', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('58761f6d-3183-4faf-ae0d-5c12d006ead8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '898', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('587a83f7-74cd-4772-b956-844b42e4c4f1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '386', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('587d3327-a6e3-4303-92e1-ab95f1f3c44d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '310', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('58a20b2a-51be-44de-bd8d-ca089862496b', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '1', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('58bda7ad-188a-4894-9790-b873b20ee72d', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '298', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('58d10e1b-48be-454b-8ce3-46e1296c39c6', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '381', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('58f85338-5d04-4a5a-8985-04cb88b1dc87', '122', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '482', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5925b219-8748-4fac-8184-3f3f921ec5f8', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '99', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('59694b80-606c-4723-a6f4-2ab1b8deb4bc', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '256', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('596e19ce-1714-4228-939c-987f3fd51195', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '1963', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('59816d08-50b1-40dc-aa89-73e282b41fa7', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '5387', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('59849c9e-cbba-4e46-b598-5b34d9e93489', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '663', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5988c706-a288-4291-bb1b-50b96c252615', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '4887', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('598fbdbe-c1a2-44c0-a013-06221d7c68a3', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '651', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('599cde93-fd8a-41ad-b979-c3d47918aae9', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '81', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('59d49ea6-f4c6-4c29-b6a9-283275e955ee', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '53863', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('59dc0337-8712-4b38-bd99-08f4c7746e79', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '171', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5a085e9b-5ab0-40ed-9ee7-330b0b7d2dd3', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '277', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('5a09d089-c098-4589-a103-a9c7248e575c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '255', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5a1c4435-e203-4825-9fe7-5914b62eea03', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '258', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('5a2e3c36-2002-4c15-b146-6cc80c9e7bc1', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '264', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('5a56734e-f7d8-41c9-8146-bc8a9f36d9cd', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '286', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('5a6cdbee-af8c-4794-89c2-07a43eb2ddc6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '325', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5a73700c-4ec1-4e3d-87f6-ea12ea5e9ecd', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '871', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('5ac37052-20f2-4285-8e62-a99dc5840869', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '90', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5ae5975f-92c9-4e1d-a086-dcf307c29ddb', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '316', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5afd0c76-93ac-4512-a643-09c9f8b5010b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '265', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('5b1bfcc9-81f4-4885-90e3-f6a3323d2089', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '274', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('5b7469ce-4057-4a16-b9d7-2a51910e6c90', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '564', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('5b751e94-2217-436e-bcd8-f104be82da73', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '241', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('5b86b8c7-55d9-46a3-9037-998cf31cb8e9', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5b9b36ae-8b74-4164-903e-372b114e2028', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '0', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('5bd88c87-b8b3-4fd9-bf6d-4df57214a6e8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '245', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('5be78b54-5694-4964-bce5-67c637e47865', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '94', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5bf1443d-d89d-4aaf-8d45-84f7e8ab2f3e', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '239', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5c0b8fd1-b733-4d6f-a6b3-aa4b9b3a44d8', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '122', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5c31c9f6-7f03-408b-be78-ab061b0f4202', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '218', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('5c412788-3759-4490-87c2-f2d5c426b6cc', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '234', '[类]com.itheima.controller.MenuController[方法]findAllMenu');
INSERT INTO `t_syslog` VALUES ('5c43f64f-2d03-4950-bb7b-090326047311', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '103', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5c4c87f7-a977-476f-a5e9-4506bb5fc1b8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '234', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5c9b131a-1310-4d3f-9fe0-1a746ce22747', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '323', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5ca0f483-e317-4044-baef-43a8139fbdae', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '314', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5ca171e8-a3d3-481c-8318-b549c92c714c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1822', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5cab0401-1b44-4d84-a368-700bc18c610a', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '737', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5cced58b-0537-4981-a6ae-c711e3976da9', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '0', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('5cd9d7f7-2ae9-4c5d-ba45-e7920990e038', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '612', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('5d06e09a-0da0-4f16-bbf8-59bf8e33a654', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '278', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5d0cfb8b-f12a-47ab-96e6-de89a48c6942', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '295', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('5d5cc979-a54d-4be2-a352-82e8eed52fdf', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5e18fca0-9857-4d61-b4a9-0713f7beca57', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5e2a60d9-c6c8-401d-9b25-f5e16385d5b0', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '165', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5e2c1a10-4399-444d-ace9-eeb187fb1241', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '186', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5e39cb1b-ff25-47b8-8995-2d544f1ebe69', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '259', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('5e5d1d42-5c2d-4941-ba5f-bda585a9c242', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '400', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('5e720297-93eb-4f13-87b9-d1a3f0ddb0dd', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '613', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('5e8ce277-3204-4eda-928e-c974023fa669', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '337', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5eae0032-3d26-46e6-995f-d54bfcc43e3b', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '131', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5ec8ebee-707d-4db7-b156-420e4b89a295', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5eef52fa-5d86-4c79-8ba5-65c9f8a8a8dc', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5ef61070-ae69-4d50-a0a7-6b2faa535ff8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '292', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5ef852e8-362e-4d07-a93a-9a24ad0c03fc', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '661', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5f07bf12-ff6c-46ce-99a1-8d5b8f212ca7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '284', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5f174bae-f2e2-4b1d-a93f-968375d2b2ef', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '311', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5f19d41c-e61f-49a8-8637-364f3d258261', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '242', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('5f36e9b8-edfc-45e7-a669-d4dee16e39a2', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5f652262-0918-4658-b49f-ceb024994f7a', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '258', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('5f700592-b870-473a-95a5-d9d20fd17fe6', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '370', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('5f73ebeb-c6d9-4014-8d84-2f6a7c21a4eb', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '297', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('5f7e8ad7-04f7-4e11-85fd-7ba3065c5aa6', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '293', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('5f94032b-0213-4117-a89f-5e835a6f43be', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '596', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('5fa5d015-7fe1-4d4e-9a5d-f189953ee426', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '708', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('5fc14a46-62a5-4d26-b998-f2a8d316e5cc', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '272', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6013cf7e-382c-4c34-8251-e55a643e5d62', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '107', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6065c418-ead8-4ba9-ada6-9401ea272237', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '444', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('606f3742-a671-418e-8871-4119b23c6bb4', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1571', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('60b756b9-a63f-464d-892a-2f73f5b0d53f', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '256', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('60c01c5d-b5f6-4e3c-a3ef-bf094c69747f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1229', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('60d19bd8-073b-4614-83cb-5077923a24de', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('60f166d0-977a-473d-9383-232b5f995d9c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '932', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('60f3e60d-ada2-48ca-8e9a-06283ec7aa19', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '263', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('6157e930-8d9d-4277-bb27-8490af59ad13', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '379', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('61640015-7cef-43b3-9699-abcbda855bc6', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '230', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('616c7a03-4743-4080-9093-c57c7f08147a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '84', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('6173a834-49b6-4e3d-9160-f17b6f543a1e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '86', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('619cc048-8c3a-4ede-ba0e-3c3f5312d93b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '269', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('61a36ca8-4270-4be1-b7e2-45b42b44bf8e', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '772', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('61b2be8f-7f6f-4234-98e2-4994c4b6ac9d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '282', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('61c018b9-1752-42e0-85a9-46882afbcb18', 'xiaoming', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '486', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('61d132e5-74b4-4c5e-8bf5-45e426e04801', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '98', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('61d1ca1a-4625-4aaf-87d2-fa0d5c6fab50', '122', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1356', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('61ed7abf-17b8-4dda-857f-015b9d2c7fee', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1730', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('61fedb34-bbd6-4df4-b79a-7c1e9634d291', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '341', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6218ae63-efbb-4c94-96fa-bdd8b9ef4690', NULL, NULL, '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '172', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('623c30bd-05e3-445a-b2b1-dc063284413e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '237', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('623faedf-40a0-44a7-af8d-7d10e0609deb', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '91', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('62621f00-42c8-457e-93fa-8ad9c217ff27', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '236', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('62b44ed3-2066-4cc8-a2d8-defce39659ce', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '921', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('6308acdf-3df5-43ed-ae79-d38fd2220d62', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '275', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6309b781-8cca-4019-80c3-5b037b6eb118', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '156', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('632328ab-3066-411b-8121-3ae28148fad1', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '229', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('635483b4-3a73-4c39-814e-5f150a188892', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '127', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('635cda6e-7dd3-4d64-b105-e7009e160121', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '296', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('636b5e65-52cb-40b6-a215-17ad2ed60f6f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '85', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('636ba894-324d-46cd-b2ea-f29015185668', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '215', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('63701f44-8342-4c37-b253-1899f3ddb365', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '321', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('638baddd-050c-41ba-8c06-46722e11aa18', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '2518', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('639c0541-c0d5-4c57-944a-3cfebe4420a1', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '471', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('63eb25a6-7dc1-4ef5-b79b-cd1ba8261a31', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '87', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6405005d-3ed2-42ca-9c45-0945708eca01', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '192', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6443d1ea-2b44-46d9-b247-3bfd08577fbd', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '336', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6448d0fd-b6f0-4dc7-8e6a-f8856ef744a6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '286', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('6461bbca-d03d-42b4-8e0b-9aff632dcf76', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '0', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('64701ccd-e6e0-4c15-881e-e9347133fbd8', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '599', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('64708c75-cabd-4970-b141-0e9b8e33f3c4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '389', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('647236e6-4414-4b11-8bbb-ee68e069e213', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '249', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('64a95f34-0490-4a3e-a176-603fbd709f73', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '220', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('64b132fa-4a17-4479-a7d5-b7c69a5f0a3e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '1', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('64b429de-203e-4d97-b059-f4abc1420cae', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '246', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('64c15831-2acc-4083-91d3-307b0ac89cf5', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '864', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('64c953e6-0512-45b4-bf69-cf2a9ee11bb4', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '340', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('64f553b8-1ba6-4802-86fb-a3ca8168ce03', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/add', '265', '[类]com.itheima.controller.PermissionController[方法]add');
INSERT INTO `t_syslog` VALUES ('650d1cc1-2368-40fe-8a42-0c5dc5ae69be', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '248', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('651ce427-6906-4f69-af46-2652024f3c8b', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '209', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('659ea2d2-df66-4506-b16f-513fdfd4ff27', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '347', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('65ed61db-5a27-48a0-bc0b-d33af6fba78b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findSportById', '211', '[类]com.itheima.controller.SportController[方法]findSportById');
INSERT INTO `t_syslog` VALUES ('65f5870b-a741-46a6-a2ff-4e82e41b615d', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '817', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('660f9ee0-f4a2-40fe-9262-9682616b0e1c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '235', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('6654c9e5-82bd-4e77-840f-0ee26755434f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '901', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('667c289d-eeb7-4eec-87b2-06d9cb09b0ad', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '148', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('669b7b28-9e46-492a-8da0-312484240a7e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '136', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('66b3d580-359a-428a-8305-381556bf86e5', 'test', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '221', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('66b8b8d6-7aa3-4f21-b261-0e58d5a2bd03', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '250', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('67058d8f-f071-4787-8dfb-cbbd00b44e05', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '307', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('671dff8c-dc5f-4d9e-9eae-cbc4d99f69e7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '2508', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('672ac7df-a737-4079-b60e-730c0006e565', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '443', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('674f97d8-980b-4d10-a071-907278ef0ba8', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '801', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('67602f8f-c2e3-41bd-a4cf-366666237592', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '289', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('6795cf43-246a-40e7-8719-4784b1603522', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '69', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('67cb1815-eb2a-411e-a819-9af2c1e94001', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '692', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('67d0aa7a-890b-437b-aace-e96a70400b89', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('67eaedd3-ed71-4600-901f-43aca566e4dc', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '0', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('67f89985-0a42-4488-bb36-bbccf1969908', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1052', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('685826cc-ee35-4c83-b62c-9d193d7a757e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '99', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('68593ba5-0db8-4aac-ab06-d1583385a0a4', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '132', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('68596803-7bb9-45b9-91b2-3d6aa9d942b5', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '259', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('685bac63-55e0-4605-b722-009a1ab2296c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '347', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('687435c3-a675-47aa-a368-bd114e928140', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '325', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('688d0d88-6b3c-411b-b8c2-6b0f724a4d44', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '489', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('68a509a2-04f3-4603-a830-2aeef31facab', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '270', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('68ae91ed-4abc-409f-90c8-cab59037e38b', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '218', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('68bf4d0c-b4df-4ed9-86b9-5179d380aa37', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '379', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('68cb399e-ac83-4ba7-8bc0-10e836488e44', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '357', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('68f8d81b-fe6b-44b4-a4dc-14f652ff1575', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '77', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('690c3bcf-a133-4787-ba47-c0c4f6641e9b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '122', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('69157970-9a8f-484f-b4ea-77813dcb8e7c', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '286', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('69167a9a-57d2-43cf-a372-bc892e9c8669', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '461', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('6938e236-5cdb-44ba-b26a-102a7ad30670', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '276', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('696d0e96-6b41-4f82-bb79-0e6f01b1814e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '318', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('697b62ed-176a-433a-b534-32b14565ee68', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '268', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('697c2ffa-a85c-4cf4-9305-2377355fdda7', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '138238', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('697ea548-1b44-42bd-8562-7664d4929678', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '122', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('698b97b3-61ee-4237-9c27-91380d7cec90', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '99710', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('69af1ab9-e247-4177-ad05-f4b59db717b3', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/getUsername', '0', '[类]com.itheima.controller.PermissionController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('69c0878c-59c6-423e-b4f4-f7476a7b621e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '276', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('69cfaf05-7659-43bc-ac97-ae43ed780bc6', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/getUsername', '1', '[类]com.itheima.controller.PermissionController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('69d04d94-1c62-4281-b649-4f27dc6d5307', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '29', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('69fd2cb4-6055-4f37-a8e2-2c3c5a6d93b4', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '241', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('69ffa71d-c2d4-4afa-97cc-a4a6cb95d069', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '402', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6a2284d1-cb18-4a6d-8855-a410a28b7a1f', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6a2500b6-d760-4513-9c56-674c14cf5357', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1306', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('6a2f24c6-2e55-4559-92f9-77715230e3a3', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/delete', '367', '[类]com.itheima.controller.PermissionController[方法]delete');
INSERT INTO `t_syslog` VALUES ('6a2f4124-2ee0-4fad-8b1e-8932bd91efeb', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '203', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6a42083b-6a18-4639-8031-5cae853897f6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '259', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('6a4606df-74ee-4c24-80b9-38abc86a8c30', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '468', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6a6402be-9443-4de9-9181-0d3ae6e8b96e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '156', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('6aaf1b9f-280a-4c6c-8336-900673101363', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '342', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6af39192-a499-4745-b0cc-0922b5be24d8', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '89', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6b1ded84-0616-4cc3-8402-fd11884471fb', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '319', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6b32271a-a17e-4a2b-a161-d2c29f0e51c5', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '435', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('6b6acdd0-0314-46ba-97f3-7cb5686318e6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '251', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('6b98822d-579d-42a4-94ea-89310f51382a', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '89', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6baebadb-c7de-498b-acf5-37f728fb9cd6', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '218', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('6be38cd1-dd3b-4f06-8079-18163ce2a985', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '74', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('6bfa215b-0ecf-477c-ad22-118f77b7f016', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '374', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6bff1a5f-d075-40c9-b0d1-c67cbd9748b2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '114', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('6c3e1256-178d-41a3-a85e-23d43e7d5bfa', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6c6bbbdc-603b-418f-a359-93c317c447d2', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '176', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('6c823971-da95-47ae-a00e-2494240c5ce5', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '2388', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6c8336e2-8717-4619-9fec-a918c60413ff', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '312', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6c8b5e1c-4733-4778-be4e-eeac0dd4ebf7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '289', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6cad13ff-0819-48f1-83f0-a10274fa938d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '274', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6cd7c11c-79b1-4528-996e-289c02c03557', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '1275', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6ce6fcdb-d02d-4203-8e47-cb368c110e0c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6d192772-9918-4de3-bc89-345014f339f3', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '743', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('6d213720-6347-4851-a67f-de2f9c51b6b2', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '306', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6d60da5d-b134-49af-a2a7-cfff35641271', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '631', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6d6c998f-27c0-4b53-b6ab-a8aa1f42e37f', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '38', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6d6f1aed-9cad-4c59-bca4-d5643fc87a7e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '142', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6d7ad5f0-3520-41cc-8f88-45a26625d7c0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '101', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6d909639-c536-411e-bc0f-e1b58203a827', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '123', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6da71758-8143-40cc-8848-7415bc83c794', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '137', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6db96575-6e30-4edd-aaa1-ab39b6ff561f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '320', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6dc5266f-7be0-42cd-9a94-00838fc47424', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '363', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6dce1f06-8cef-442c-bc51-75f2ab550b63', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '654', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('6dd1672f-d42d-4f45-a081-8b3b4339ca2e', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '103', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6df796f1-26cc-4817-b9f7-4d0854c4326f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '114', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6e06675d-c444-4aba-876e-7462d0771b08', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '2563', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('6e238288-d9c9-4406-a423-b4372cc9edf4', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '135', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6e399526-d763-4e5b-b9c6-ea6830118876', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '130', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6e4407ef-84c5-43b5-9e96-2dba2b8e0f5c', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '750', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('6e5784f6-e452-4499-b284-3209334a0bf6', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '84', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('6e587dcd-e332-449c-9fdc-fb3422ab3bf6', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '111', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6e62bf70-03e6-4796-9601-831543e78a1a', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '83', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('6e75bfed-d95e-4c3a-84cb-19ce0770932f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '371', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('6e953d25-0dd7-4ea7-8c31-af4026a63613', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '126', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6e9b446a-ff6f-4364-9bfd-c1ffc94a8641', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '287', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6ec41c0a-9774-4ba2-98b2-17fc0022402e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '329', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6f0a79df-07bc-4d8e-bc70-6f7ceeafbe14', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/getOrderSettingByMonth', '0', '[类]com.itheima.controller.PermissionController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('6f10a266-bf31-43c0-b25c-20d2adbf5ba7', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '371', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6f17d09d-d0e4-4028-8711-979d6cf097e0', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '231', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('6f2d9c35-5187-4755-ba8b-3f365c162624', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1135', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('6f3f4333-607c-43ef-8ee2-64d1e8773f96', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/delete', '137', '[类]com.itheima.controller.UserController[方法]delete');
INSERT INTO `t_syslog` VALUES ('6f49d971-02ba-441a-9df7-299c9148443e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '218', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('6f8d74ad-9d7f-4872-836e-d8d5208cb3f2', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6fb12af7-cafc-4981-9bda-5e78575a3921', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '115', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6fbe7ae1-a7c6-4b93-954a-eb7091e1e49e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '885', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('6fc010cb-570e-4f2e-9bd3-35351252ce0c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '467', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('6fc1d1e2-a5d1-4b20-ba73-0045244acc87', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '289', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('6fc1ecd1-ce8b-476d-9625-1dda5ea901b9', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '256', '[类]com.itheima.controller.FoodController[方法]findAllFood');
INSERT INTO `t_syslog` VALUES ('700a7d1c-4a52-4d63-a715-94b9d6fa8f87', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1029', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('701242e0-a9ca-4a6d-9bc4-fd27965a7dfe', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1000', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7026cdb3-eba3-4b42-98e6-b2a1445e2f8e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '107', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7047fb49-f3a6-429b-92ad-1fbe5d9a8380', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '303', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('708b84b6-91d4-4447-8945-6499007d5a6c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '381', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('70a07598-07e5-4fb0-b82b-d7e79396c0f7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '2773', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('70c34c80-4361-4e36-904e-de3d9960730f', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '236', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('70c37935-ea38-4d90-8ffc-d127efeb3d25', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '393', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('70f1a9bb-9f3e-43e7-9449-8985a66b76be', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '302', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('70f45eb6-7714-4f16-800e-c42839ad0a26', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '152', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7100c33f-b15e-4e6a-af36-c1276d81a6d6', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findFoodById', '196', '[类]com.itheima.controller.FoodController[方法]findFoodById');
INSERT INTO `t_syslog` VALUES ('71054931-c9ea-4e75-a553-866e558eecc5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '108', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7120c332-e515-4fac-b4f8-f6de0df2a658', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '106', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('71566a2c-59ee-40fc-9d81-9e36dc9dc1fd', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '299', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('7162df37-737d-4416-8349-65f50e772729', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '152', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('71abb4c5-2611-464e-b94e-96ab62c6dd88', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '220', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('71c2b13c-ad32-4eda-bb0f-2b1c7a740a52', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '476', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('71ca4219-9390-4180-bb7e-14ef5816555e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '770', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('71dce249-936f-4e27-98ef-1facab7607ad', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '280', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('7213ad36-9d1d-484d-9932-88da4e510d5e', '122', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '435', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('723804af-57da-4575-b6e0-27ba7389013d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '234', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('7244336c-5cb2-42b0-a111-e468a01c33c7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '105', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('72703615-20b9-4928-8ceb-be556d4f2914', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '335', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('72821f81-ba8b-47ca-90ad-0692b865e00a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '352', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('72860aca-d968-41eb-a192-4ae74875ab69', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '4944', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('728ed2a6-b893-4151-889e-3d3c93a8d223', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '274', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('72bd34e1-42b8-49f4-8a2a-51b7ed54e343', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '123', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('72c7db6e-693d-412d-a29f-62cb70cb1f1e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '1498', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('72d42e45-12d9-45f6-bb20-67216e71cece', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '244', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('72d8ca31-2f62-4636-b1f8-6554385039fb', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '283', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('72e911e4-8b98-4929-aa3a-3abfea9259a2', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '308', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('72e98555-d62c-4aef-af2c-b4317745d458', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '1958', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('72fb72d0-b6b9-4e92-9193-9ba27dfb809b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '727', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('732d2f22-27cc-4889-b8c1-2b37f32cdd5c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '215', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7398c9e2-b33f-49ac-867d-216d0ba1f18c', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '342', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('73d80f49-f46c-4055-802d-5998e5b69557', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '105', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('73dfc1db-14e5-4e4b-b2ca-4bb97bbe2195', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '243', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('73f300f3-09d7-4dc1-9966-29eb702d64eb', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '783', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('7431bac6-768a-427c-ad9d-42135be106ce', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1151', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('745f13d7-ff0e-4e9c-8c9b-9017d4e7568d', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '97', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('746bee9a-12f5-47e8-a3bb-cc855d551722', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '112', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('74783117-f509-4d86-93f4-735e61a7f995', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '314', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('74866f23-cbba-436c-a8f2-423baddc14ec', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '711', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('749366c0-36aa-4912-9948-36a144867216', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '248', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('74ab8613-b0fb-47e3-a7be-b0b9ea76c82f', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '210', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('74e66b37-24cc-4594-8e79-10095fa7890a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '223', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('74fd6efc-ea4a-494e-b135-079a10e19fe2', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '319', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('75094606-2615-4dad-b82d-148444fe2e61', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '851', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('75180fd3-ca63-4307-a86e-cb9733476015', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('753cc628-4d33-4963-96cb-d054380b32cb', 'TEST', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '0', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('757e3903-d9b8-4575-b569-a397f1460fbc', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('75ae5f59-c553-4715-91a8-7bec0a306a81', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '620', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('75c1008e-e606-44f1-92f3-79e5d46afec1', 'xiaoming', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '108', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('75c751ec-7385-48d9-9084-05136677804a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '199', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('75d58e91-f7c6-4554-a6b5-ab379ef96d77', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '688', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('75fe234d-f2d0-4088-8272-184a3f472351', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '264', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('76020de0-be2e-4029-97a3-f77c5e6cce51', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '239', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('7616ab0f-988c-4641-a62a-b68a6456616e', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '253', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('763b7d7d-d57d-4283-bd93-ead5dc9ca8c3', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '894', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('763dbcaa-05b9-4621-aca8-ac54cac2c760', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '4914', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('764c3ce8-66be-421f-860a-4f7bf4dca783', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '614', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('7683dad0-ff7b-4db5-bcff-36383930d733', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '263', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('769514db-f07d-4b64-86b4-7dd4052cc7a5', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '695', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('76af7a2d-934a-4116-8bd6-0afb6f47a554', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '1963', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('76b71a21-c4eb-439d-a58f-004e0eb8aade', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '256', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('76bd5477-6bdc-47c0-907a-76d3c58696e0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '4006', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('76ea8d39-bc98-4ed8-8273-6f07e6d46905', 'TEST', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '311', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('76f2e0be-f269-4e6d-9a2b-3bd83e7876f6', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '381', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('77073c0a-99f2-4fac-9839-455b6c6695c5', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '323', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('770d0f12-78a4-4c27-a938-655ba9995b9d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '156', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('771c59ac-4e8b-4cda-a657-dabf00430f18', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '681', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('773fbb5b-a6f8-4c0b-a2fb-6d5590d97208', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1997', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('774bc795-4e6f-449f-8a45-4e6cda47fb00', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '0', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('774d2fcf-48f1-4f27-9749-e4c8787a3d70', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '199', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('77580597-b0b9-4601-a159-da662d758430', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '321', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('775892b5-bb08-4eb3-808a-6c9f2f3ca484', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '259', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('775e7cdf-af2e-49b4-a4b7-3795647dccb9', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '211', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('778cdb81-2530-4f23-b438-818ff109a4a6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '286', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('77bb9c6e-a0b6-46c1-8569-1781e0a18681', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '490', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('77ca11cb-2dad-4de3-b148-2fb16eaaaaeb', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '739', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('783b6e8b-e162-42ac-b3c0-b8c2c545214f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '266', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('78911019-6b0c-4677-8e8b-efe0ee6d3270', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '375', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('789df800-2734-44da-bffa-225bdb776c01', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '294', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('78d7749b-9d3f-427d-bf01-87a0eb674b85', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '300', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('78fb74a5-efdb-4875-ae02-b01166e8e6ae', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '220', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('78fe52df-7ce2-40d7-bd1b-601a0309c911', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '327', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7907ad0a-9a9d-4f1b-a28c-6aac6109c4ed', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1086', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('79198c4d-fe93-4f9c-9aee-5acdf5b0c0dd', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1097', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('791d2c19-6f41-46e9-9a2b-1bc49830b21b', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '151', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7922b304-8ce6-4f62-bb0c-66347f3c71db', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '791', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('7938abe5-2887-46ac-b80a-d4c01d7a3927', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '273', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('7949aeb4-36ac-4c5d-9058-3b6f5a3ec2d6', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '319', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('796c366f-1482-49b7-b374-bc25b3c4576d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '313', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7972ea9b-8274-4375-8fab-ada12ad8cd85', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '11477', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('79c3cfaa-a404-4c56-aecd-e29ae4e45383', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '304', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('79d5e7f9-7e86-4db3-ac84-9d004c25ce44', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '334', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('79ddf9b4-41f0-4be1-81ee-7a0cc311b13f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '207', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7a063bca-aa5c-45a6-a1ac-de4d78a0bda9', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '3483', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('7a06993f-b02a-44a3-aa52-b076d7c324d4', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '244', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('7a28dfae-6c58-47cb-b134-e8a8e81fd80f', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '254', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('7a5ea7c8-4506-4ede-b387-8a22bf8b3801', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '90', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('7a8c807c-eb64-48db-9c2b-dd5f82b70daa', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '289', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7a9bb491-fab1-44ff-a4ee-f39f7a3107f7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '277', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('7ab98664-abad-47b8-b697-6aef5ae717c3', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '254', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('7b0df90c-b655-40ff-9304-4a6f70d869c2', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '143', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7b17f7a7-3094-44dd-84ec-6dfe5ef180dd', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '141', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7b2087f9-8e69-455b-8446-66e89b96bbf5', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '309', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7b3d667f-4041-4f61-8644-607c5c3c8b74', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '203', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('7b492afe-0bbb-4bbf-bfcb-bbb62ebd23e6', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '328', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7b984f41-0a3a-4d3d-b2cd-097fe3858de0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '254', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('7ba42835-5aad-4de3-bf03-7464564f7dfd', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '3407', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('7bc21567-4607-4385-a607-93477ba5564e', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '765', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('7bceb43c-5a88-4376-97fb-76c9cda0a185', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '321', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('7bf56494-d808-4672-9684-b7b1619362e9', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1087', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('7c4c0e82-2e0b-4baa-945f-2d02db8de25c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1135', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7c5ed8da-88aa-40e7-a704-014eb288242b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '273', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7c741643-dfec-4d3e-a184-5390dfd327ac', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '734', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('7c86e6a4-3c6a-45c3-9002-a0a79e483a4a', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '301', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7c9793ca-d083-4187-8199-f3de5d84bf9e', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '116', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('7c97ec74-c487-4f5b-b025-6eba109c00c1', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1301', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7ca02e83-8dc8-4b84-815f-2d0f1f82e469', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7cbdbd2f-84b5-477f-a54e-084225ce684f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1147', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7d0afbef-a025-4c76-9471-88420a4bf022', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '284', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7d1439d6-71ad-4443-917a-b05876bc06fa', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '309', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('7d3dfc1f-7449-44c4-a3cf-5efa692c8488', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '271', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7d5817eb-f576-4492-90ef-93622ca444aa', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '740', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('7d96a218-1926-40b4-9837-325462c35f5c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '273', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7dad0bae-b2cc-40b6-beaa-6fff7dfa1f9b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '114', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7dadf2b6-1006-4de7-8a67-e6c5d7f4edad', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1111', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('7de6a2b6-20cd-41b8-a31d-502dca1ea02f', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '283', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7df72240-ed38-47f4-8f2c-bb82a9a57f4c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '2867', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('7e0a7960-a7c2-42d0-b625-ed0394b7916b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '247', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7e0cc60a-b108-439f-983c-10f4b33fc40e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '345', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7e0dbf0f-a08b-4aee-b40e-e6ebba5bc76e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '1569', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7e1b5145-1984-4d26-b324-96565dc7ce09', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '304', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('7e4a1c41-12fe-4e0c-b373-181a09c89d83', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '1', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7e796f7f-daa7-4bce-8b3e-f85c58307292', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '82', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7eb07863-75a4-4b9f-9742-a142733d8548', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '43', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7ec80d70-9dd0-4cf9-99b8-e9d7bfe234fa', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '95', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('7ec869c5-a606-4573-84d6-e34e38ee9005', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '909', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7ecf9397-a66f-4010-af85-ea470ad4029d', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '299', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7f042052-8322-4cad-8f92-f144fff8a815', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '244', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('7f06c112-fc20-4da4-aac2-b6b9842ab908', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '392', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7f07fb30-a00a-4a43-9ce0-b66203ed383d', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '224', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('7f0dc9d0-d5e1-4986-bef1-e7dc047f4fcc', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '82', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7f1fe21d-03e6-4f88-aac9-2c3ac59d03df', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '233', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7f2fb061-9ae1-4af0-89b9-c99569c907df', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '180', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7f8556b4-66a1-424a-8e0d-db6dca7be4be', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '201', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('7fa9063b-24cc-4ab9-b040-c03a3109f8fc', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '997', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7fb0bba9-1b4e-467b-8420-cdaea0f06222', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('7ff7c1f5-01f0-4e9a-9037-131ea0cedc70', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '99', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8002e319-3607-4d5d-bc52-db8a0a6a9660', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '194', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('801ad8b5-72b5-45a0-85ce-36a5a6fad3c3', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '103', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('803c5cfe-17a4-4d6b-88fa-694475092e6d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1381', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('804d8449-162b-4183-86f5-9697cefdb7e6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '311', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('80575eb4-ed8d-46d9-beac-dbf2bfe98c09', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '744', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('80b8c225-11a3-448a-a956-abc09cf801dc', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '307', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('80fb8f6e-9bc3-4a43-b028-70307e87a5b0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '205', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('810a14aa-e30a-403c-acec-708b60e2422f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '199', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('8148a864-a25a-4008-8f7d-77b5991f2135', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '321', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('81614bac-663f-47bb-bf42-a73320af140c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '288', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('81888c50-1a7d-4363-8d8a-6aa5d1953c7a', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '756', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('818a0003-f564-4654-abc6-0a857f30546d', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '98', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('818e27d4-f00d-493e-b451-d9c1f0298784', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1659', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('819998c8-80eb-4b9b-ae34-c24b4ae7c2f0', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '259', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('819ab4e3-071f-4248-8da3-6cdd4f2e294f', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('81a2abc4-5eb6-4411-98a8-5981744bcecd', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('81bf567d-23a5-49a0-acdd-79137c049a77', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '136', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('8205f313-7ddc-40c3-8c4d-57b1e83b0277', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '443', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('821c66d5-3490-4b8f-b5ee-594e398092f7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '102', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('82202977-225b-43fd-b4ce-998d5cabe2b3', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '249', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('8220396d-a4e0-4eef-8179-4de7384d66b7', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '195', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('824fd944-75aa-477a-ba8a-33ac4596bd8b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '407', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('82520fb9-3f8e-4e6d-bc4a-7238d591fe9c', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '300', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('82a7c7ac-0592-4789-ae21-183622362d9b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '5410', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('82aeb555-a54c-42cb-89a7-8c9c6d12fcd8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '288', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('82c9b9ef-966a-422f-9c82-711559980b87', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '625', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('82ceaba9-3b6b-43ea-b358-a642ab8e4edb', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '78', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('831ce707-c5bb-4610-85bf-e6870cc66119', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '200', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('832af345-600c-4bda-9967-4ed0d83916c8', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '285', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('838c5a49-6fe5-403e-82ec-eb418b232a98', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '300', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('83951f1e-56a9-4615-bab5-30034f370719', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '776', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('83dc9637-c7c3-46bf-aa58-66a4d136fe7a', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '86', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('83e54d0b-150f-4269-9a2f-d990adc76ec3', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '310', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('84030e39-b274-4b03-bedf-b105192a6805', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '432', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8412a2c4-bba1-417e-88bd-c2dbdd9aa8ce', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '422', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('843ad312-6d1d-45a4-a2eb-52624ff7cca9', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '104', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('843ef2aa-3645-4c97-bc8d-d3e5efece824', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '635', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('84467120-7721-4720-8519-88e47f1dd4dd', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('844950f7-fbcb-4e06-ba3a-1d23ad413a1b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1690', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('847a5b66-c9eb-4f75-8863-f2263866d313', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '362', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('847c9078-c27f-477e-a7e1-06e5f3b65621', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '255', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('84c578e9-a9b9-4c3c-838a-5285bbe8e79e', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '562', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('84f4b91f-af53-43af-abff-0cde8bef60d9', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '286', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('8509046c-e85e-437a-832f-f71f946506a0', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('852bfe25-c367-4507-a04d-e2035f6d4f36', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '269', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8532ca62-f4c4-4001-95ef-65aaa006d3c4', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '73', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('856574b7-6d74-4faa-8593-e8213801ce14', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '198', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('8574c21e-8ec2-4e40-ab65-9b82793787ec', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '284', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('858966b1-b2e1-4846-8982-eed61db1a8cd', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '140', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('85dfafa0-cd65-46ed-9073-2449515d483d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '327', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8638a8b3-9abd-4e6c-bdb9-f7fead2aa826', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '342', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('868c6e83-50cc-4a04-8a54-67ecfaf25553', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '304', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8698c3f4-ca15-44d4-b7a4-ebfd781a3dc6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '738', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('86a06524-d524-4215-95f4-fd7b240a06e4', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '87', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('86a86675-f44e-46c5-bb44-8f55ec53b25b', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '274', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('86b05608-7f99-4f5d-8d80-667b3122aeee', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '241', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('86d3e41d-3c92-4cb7-a096-5cc11a2a633a', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '147', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('86d70297-299b-407b-adcb-e84051e4281a', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '295', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('86f13f12-1b3b-4023-a3b0-f026b71a39e0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1526', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('87070456-e601-4523-bb01-24b134f1ba18', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '315', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('873067c1-138c-4f17-a7d8-a47a593b71ea', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '244', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8752a628-0671-48f3-b918-78f7edfefbab', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '0', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('877a73fa-f96e-459d-a21b-b5d428dec702', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/edit', '309', '[类]com.itheima.controller.FoodController[方法]edit');
INSERT INTO `t_syslog` VALUES ('87943185-f747-48ec-9033-7119a830d009', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('87ee92e6-3f3d-49b7-97f0-ac20f1a6c635', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1556', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('87f52034-e174-45fc-94a6-aed618eb5151', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '374', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('885743cd-9e98-4d5d-875d-7dfc55da670d', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '134', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('886d40ab-459a-4f16-ad3a-64d9252b6892', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1263', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('888845f2-e3da-4ca9-aa0c-9f19fb681fde', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '252', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('889e8a21-cc7e-4d8e-9c1e-4c384bffa4d8', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findByPageAndCondition', '0', '[类]com.itheima.controller.PermissionController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('88b4e7e0-0158-4c03-a221-546314f6cf0e', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '651', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('88d29f39-c66d-439d-81a1-7333f4131509', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '375', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('88df53ba-b7e0-46bf-a53d-9845b758efcd', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '0', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('88e6a0bd-aa7e-470b-92dc-aaaef99fe86e', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1202', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('88e8abe5-6d37-4ee0-8d95-3366ffc58b88', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '135', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('88eaf622-4e38-43fc-ac62-307bf83b72ca', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '294', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('891d0967-4691-4c66-ad47-80d6e5abd8d6', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '790', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('89467e61-073b-4902-8925-312becb0fbdd', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '71', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('89650c6f-7e71-4b88-a2a6-e8c9ef59ed47', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '242', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8972de77-089a-433c-a999-5c9402278bae', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '386', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('8995416c-6ca9-4592-80cc-00208536646f', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '324', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('89b5f313-54d4-4a8b-97b0-87d28e999f59', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1490', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('89bbc26e-254d-40b2-81bd-5b113b2e3397', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '251', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('89ce9c5f-2bd0-4a6a-aa10-8e2cb3d7dd9d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '199', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('89d97cbb-1f77-42c7-9bd2-1e6c3fe44574', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('89edaf40-ccea-451f-88ff-8e28a466c2e6', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '156', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8a053b9c-dfec-4df0-a6ce-25c16b0e6ce3', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '347', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8a10b433-3fae-45ab-b7d5-c158856b81a6', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '327', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('8a117223-5284-4e9f-a046-4a73bd417a01', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8a360b52-7777-49ff-8a02-0c3a9188644e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1188', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('8a5ac639-5a45-4f28-8b0a-b7435f7be5e7', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '241', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8a73fa44-85aa-41a2-9afb-7a0a4bd49481', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '94', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8ab61082-a355-4cdb-b526-36efc50d9101', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1086', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('8abe6afe-5830-40dd-a397-32f0df2edf11', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1300', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('8b0c6a58-2e85-4ca4-b481-377d78fe4d08', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '121', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('8b57d5ac-9cdd-4a44-bf18-a076278bf7b7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '718', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('8b72919f-8905-4892-a712-f9690a372320', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '210', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8b8ca98b-ee58-44a1-a5f9-ee40db72a2cc', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '224', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8bb7f81f-7e21-4e8f-a628-9662ae227248', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '351', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('8bb7f867-5758-4d3b-b87d-9607ea4932b4', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '243', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('8bc68ff6-4b9b-4055-9643-2c659b1ac205', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '96', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('8bdb0beb-529c-47a0-84cc-f1eb4a87b2f4', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '289', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8bee104f-8db8-4e3f-82e0-a2df3bf851d2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1643', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8c2e8275-f700-4a6b-b0c4-9776cb4b8701', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '231', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('8c50b444-b8a3-42ca-9433-dc3bff8fcbba', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '206', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('8c6c2947-aeb7-4e5f-bf29-f6de89829580', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '219', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8c8909d1-ce48-45a9-baf9-467954a4131a', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '260', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8cb0b0d0-491f-4c44-9e05-bdcccb0d33c7', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '190', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8cd34804-8134-4f15-aaa7-aa4e9dc0a19e', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '71', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('8cefb796-a816-49d9-959b-43398fd19e69', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '91', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8d60d0fa-273d-4e39-b436-7a9fcb51598a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '430', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('8d785e18-7974-4dda-a013-b41959a6b2aa', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '429', '[类]com.itheima.controller.SetMealController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('8d7a43b1-29b9-4cee-8d48-c97dbfe34817', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8d7fba11-20ce-48f6-8ec9-164cf11d7a7b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '462', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('8da63d10-db22-4098-bdbb-47d8884bd5c2', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '486', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('8dbf2492-97aa-4c84-81a8-769a9caf9752', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '355', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('8df92779-1bee-4604-8b78-9a58d1465dcd', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '328', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8dfc3a0b-9927-4cd3-a6b2-1b944ef6214a', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '337', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8e085a1f-d43b-4ba5-9959-5fa024665f92', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '153', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8e1c3d9d-c122-433e-b54e-4ee06042673c', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '134', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8e1d48cd-2a14-410b-a226-a136f52513d4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '225', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('8e3d4fca-a6ff-4060-9980-369f4b2f5739', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '730', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('8e5fea93-7dab-4191-bd94-63456cc7e217', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '378', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8e676309-3cc5-40ae-8eef-bfcad81aaada', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/addFood', '274', '[类]com.itheima.controller.FoodController[方法]addFood');
INSERT INTO `t_syslog` VALUES ('8e761b7e-7c09-46ac-8174-e4ae20716a99', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '1683', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('8eac0a11-cdd2-4f5c-8f1b-b20e5ecce642', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '856', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8eb8e0b9-48e3-44f4-8980-298690d4c2b1', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '332', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('8ecaeef6-18bd-4a8a-90d7-b4cbdb427d91', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '180', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8ed73b8b-0884-4b4f-b55f-e1acc2dca4f5', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '191', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8edb1fe9-8097-47ac-b73c-360470b16742', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '380', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('8eed9a65-7974-4174-a750-c998bef5f473', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '283', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('8f11d6dd-21c5-430d-a6fd-595fc39a6275', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '112', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('8f1355da-4569-4d7a-8a9a-f75ce1440059', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '90', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('8f16fb95-7729-4ed2-aef6-3ade48a2bbeb', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '236', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('8f3c8b17-a996-495c-8f60-7efcc5653b90', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '234', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('8f891d68-6601-4331-b3a2-784b417ac476', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/add', '1471', '[类]com.itheima.controller.RoleController[方法]add');
INSERT INTO `t_syslog` VALUES ('8f9248c2-3d30-4435-8a4d-a416167431a2', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '344', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('8fb5795b-a2a9-428c-a786-c88886067480', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '132', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('8fc66374-e07f-4288-9de5-2c9cd64bd1a0', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '344', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9003a7b6-5194-459c-aad1-740b51cc4a2c', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '245225', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('901c6acc-dbff-4341-b3b8-d092a0f48a3d', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9026fdba-ec68-4171-a877-2c3fbf107950', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '164', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('902a5eba-614b-4967-8559-6d4410326413', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '46932', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('90506333-29fa-4abe-84f6-bab563756cfe', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '304', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('90841da3-378e-4457-8627-6e5a42ff594e', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '310', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('90a40c48-f800-4523-a3be-525648227ab5', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '389', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('90bfeb2b-f5a4-4079-83c5-e258cf6b21f2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '174', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('90fc3c27-4ed8-4cd7-aa8b-ffb27790841e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '2069', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('90ff610b-157a-45c7-9808-8e0150a69c49', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1372', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('912a38f7-93c4-417b-9266-6d22cbe9801d', 'xiaoming', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '254', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('915497e8-d03a-4245-ba2b-851d2e7ea982', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('915c920d-f863-4546-ad0a-e32128475049', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '149', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('917b22fa-830f-4006-91b9-50f5b5261731', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '218', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('919d491c-1774-430e-9f5c-a5cf1f7c633e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '351', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('91c504ca-3a76-4b34-b0df-9b72771b2eb7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '227', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('91ccdce3-3316-4e1d-bb23-da49f8aec61d', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '92', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('91d58993-4344-4cd1-8f90-8ae4da5d6cc0', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findAllSetmeal', '0', '[类]com.itheima.controller.OrderController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('91fd21e0-e209-4ad9-82f1-b5e55d0bdbcf', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '8310', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('922c2af5-c121-40ef-8259-4f70ec35c065', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '2457', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('92323100-b501-4a2b-82e1-2c4b1d669183', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '432', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9261889f-8573-4eb5-8af8-db87e397ea19', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '146', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('928c2977-578d-4593-8e22-8584ce37cd34', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('92c06fb7-f8c6-4c21-bfd0-4171c6cdb10e', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '229', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('92e20f44-5a88-4500-80b6-2bd52a1b1c37', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '158', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('92e2eb3a-3fbb-4704-a6b9-05fe93d14632', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '59704', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('930a04b1-84d8-4dd1-9279-fe17c023c717', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '338', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('935051ea-c326-4a91-a1da-d7fe1a1b0f4c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '296', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('9371e907-84bb-4891-ba5f-b6b1e3f2911d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '320', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('937fe518-e7d6-4b2e-afa4-aad312339d40', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '389', '[类]com.itheima.controller.MemberController[方法]deleteMember');
INSERT INTO `t_syslog` VALUES ('93dc0cb3-31b1-43ad-bb87-a9eb09a2d39c', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '213', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('93eb95ee-d1e8-414b-a176-7e3715a0eb0e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '378', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('944d2de0-17df-41f2-987a-8374fcef3d82', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '293', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('94cbdfe0-cd1e-4f7f-8f1a-b0a0fd46a3e4', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('94d75d9c-2dfc-42f2-959f-fd8ba1c43d8a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '300', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('94e25fe3-33c1-4439-80b3-4afd64cf9c07', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '178', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('94fe7c0e-049e-484b-9b62-508efc8324a7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '110', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('952d4798-5cb8-4fe4-822a-3b9fc6bf4f5e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '268', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9583b7e4-0b2d-4d77-8092-3a0154bfdcc8', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '347', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('958bdd81-d1ea-4339-a709-adfdda6934c6', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '983', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('9617a500-014c-47bb-885e-b1b08f8df829', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '270', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9629c32a-e6e4-4a8f-8a73-2ad9848606cc', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/addMember', '355', '[类]com.itheima.controller.MemberController[方法]addMember');
INSERT INTO `t_syslog` VALUES ('9647b674-440b-4232-ae83-2c403a83afb7', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '215', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('967fbaeb-65bd-4850-9d90-3368a84e41ba', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '0', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('96cc6917-2421-48c6-a306-51d010eb1418', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '233', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('96ecc912-5bb7-4cd0-b0fd-83de97a3e23b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/edit', '163', '[类]com.itheima.controller.MenuController[方法]edit');
INSERT INTO `t_syslog` VALUES ('970bb93c-fb85-4d05-9fe4-2764f3085ff9', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '108', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('97155629-57d4-4e38-8e01-4a16433cbd38', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '86', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('9726f1f6-f2a4-475d-8bb5-6ff7be9a7bec', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '106', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('97291178-c8b0-4c23-abf5-6fb32ad0690c', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '288', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('972f8e3f-ced3-472b-b8d1-1897ac0aaadc', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '113', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('978f348b-880d-46ee-9694-9f171497dce5', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '252', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('97a9ac6b-6996-4589-9505-7b3b44d643b2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '159', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('97eb870b-09d9-48f9-9984-3272fdb926c1', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '259', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('98118335-e9e6-4bba-be04-e5031a46bb49', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '354', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('981752e5-b12e-4327-901a-099f58b2b811', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '310', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('982daf8c-f47c-4054-8d0d-70887d91b90e', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '301', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9865ae44-f9c8-444f-ac66-689a2a3cf615', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '173', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('98a47055-e55b-46b7-84bd-1be0a31e9fa5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '665', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('98c3e5ee-3201-44e3-8019-c922521198e7', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '655', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('98dd5491-6fa1-4a08-8a1f-8223bd04fdfd', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/getMemberAgeReport', '0', '[类]com.itheima.controller.PermissionController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('98e59e1b-09f4-4c0f-b95f-e9c50910b8c3', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '274', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('98f90450-4853-4db7-bee7-30125180ea21', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '109148', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('991b6639-c951-49bb-b5d7-7c384ff705da', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '380', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('991bf2fc-acf4-4dd5-b887-599be5bad1ff', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '702', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('994340f2-8f9d-4d94-9920-482de670f0ce', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9990d274-320f-424f-acea-32062754fca2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '288', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('99cad951-ce39-47c4-aa79-546325fecde6', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '406', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('99f20326-93a7-4c01-a224-505d9d4fd7dd', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9a08274a-197a-4935-9de9-ef78821ef842', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1001', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9a25260f-8926-4fd6-9643-948d3a7a620b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1446', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9a30c4a7-4633-49c6-880b-90a5858ffdf3', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '184', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9a80da8e-932b-4821-924f-1c21f075cdca', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '542', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9ab02065-7562-4ecd-96fd-d19e87b2efcd', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '85', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('9ab0b76e-6b51-4bbc-a008-bdcacd23bdfc', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '216', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9acde499-ed71-4944-8ab6-90a244fae62d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '257', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('9afdf21b-145a-4946-b0a1-1cff4ed41862', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '280', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('9b4f5d1d-e9af-408f-ae71-e275814e3f78', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '488', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('9b53e90b-d8ae-4799-98ac-0c7307d6d6f0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '2961', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9b651c11-c88c-45c5-92af-89e558af4098', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '326', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9b9ca8bd-99fc-4990-b6c6-3433314f0e3c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '247', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9bc1dcd0-e30a-41b8-9c7b-5e6aa4c3b756', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '242', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('9bd7fac9-a573-4517-8119-2628e603d69b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '271', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9be9e256-b7ca-46d0-b14a-20759d5f67d8', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '37699', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9c4066c0-ca7c-4f62-84b7-48c0b4bd36ed', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9c4a496c-c25f-44f7-bbbd-ca6b4c38b5ad', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '179', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9c532e65-4efc-4c16-951f-d4bea72f8ea8', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '147', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9c822bea-18c2-4fd2-afbd-7a73f5755662', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '239', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('9c90b693-882e-4ce2-b55c-c3fcf26f1d0d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '237', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('9cb30148-a589-468a-b47d-039d40830d16', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '355', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9cb3ceca-3791-4ff1-be4e-3594b801f769', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '292', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9cc7d654-9045-4499-91b5-4289896fa671', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '271', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('9cf2f60c-bcf9-40ae-af39-110848870c52', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '272', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('9d050d9c-762e-40bc-be85-db6420ffea7c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '243', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('9d0710c4-e7cb-4ba3-bfc7-636ef9a30d17', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '139', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9d2a047b-1874-431f-b8b0-e56f7c45669b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '2559', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('9d529c63-d43f-4c48-81c1-1882738fee44', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '135', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9d8322fa-245f-4c36-b78a-0da437e004d4', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '115', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('9d8d56cc-34da-445f-bb96-4be9fa9008fa', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '303', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9d8ee93b-a5ab-4751-abce-4edc0b5e5259', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '319', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('9d9a63f9-7e65-4570-9811-b4e89420ae46', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '1082', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('9d9f2875-cb24-4e58-bbad-9ce5509863bc', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '88', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('9db3e4d6-c4be-466a-9c84-97c2746fa11b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '89', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('9dbfa259-22db-423d-b140-7d551818deb5', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '101', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9de9cf63-ad48-4c32-9592-c4d7defa6843', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1107', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('9dee31a8-4743-4bbb-974b-22971057d063', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '857', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9dfa2a4d-0681-475c-ab51-99b1fc9a60ed', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '257', '[类]com.itheima.controller.MenuController[方法]findAllMenu');
INSERT INTO `t_syslog` VALUES ('9dfc97b9-c64d-418d-88c6-3d79d1b496da', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '591', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9e54e662-ebac-48f9-95cf-ef8a60e0b005', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '85', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('9e69a162-3d38-46e3-8514-308e18b376a1', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '309', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('9e79f2d9-a2b8-4743-bb00-149c9393143e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '251', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('9eee6f97-f6b1-405d-8008-655158ccf255', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '98', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9f19dabe-5705-4f31-871b-26a09f8d961d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '246', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('9f234798-e17b-480f-a3bc-3ebd999b8f8d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '375', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9f2ee552-e649-4541-aecb-b601c2837bdf', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/delete', '265', '[类]com.itheima.controller.FoodController[方法]delete');
INSERT INTO `t_syslog` VALUES ('9f33ed8d-d67a-44a6-aa3f-5b1fd0a65652', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/delete', '266', '[类]com.itheima.controller.FoodController[方法]delete');
INSERT INTO `t_syslog` VALUES ('9f5af962-5971-464a-8d74-c452e245d491', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '279', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('9f6272ed-454c-4dba-91ed-c4631f13ab5a', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '160', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('9f719096-2d64-4c0b-8ac5-f220b4643734', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '2336', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('9fe5c7ac-64a4-4424-a1ee-2348cb61e74b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '247', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('a032c82e-db15-4f6a-b37f-4ef0cb980b58', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '235', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('a04f3411-c179-4e65-ade2-34b6a18b3810', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '235', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a05cad34-65f5-45ac-82d5-9cb17e63c5d8', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '651', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a067444e-bfc6-4590-bbd1-13da1d5c0d39', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '2110', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a067bdd9-b5f9-4a18-8b95-85f9d370588e', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/deleteMember', '279', '[类]com.itheima.controller.MemberController[方法]deleteMember');
INSERT INTO `t_syslog` VALUES ('a0861613-c21a-41d0-b08c-2ef252f360f0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '121', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a0a924e3-178f-45b1-8565-38cdf0c220d9', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/addFood', '233', '[类]com.itheima.controller.FoodController[方法]addFood');
INSERT INTO `t_syslog` VALUES ('a0ab9dba-75cc-4b0b-853a-8f48a76cc9f4', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '221', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a0bae4f6-c885-488c-aa76-fba25612b3ce', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '85', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('a11330ca-3351-4c2e-95e2-43e77302aed4', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '134', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a123199e-6d77-42e8-a06b-66bcda586bd5', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '350', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a128850b-966f-4909-998d-7b4cdb25de62', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '259', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a18d5b67-e17c-4f03-8700-01f6b34ae101', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '314', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('a1975442-7a8c-4c91-9a4a-0b3678e8c9a1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '224', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a19c66ac-6554-4f83-a348-f35b9411773b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '408', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('a1a73f8d-fd28-4a23-989c-4c30a23c6a8d', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '198', '[类]com.itheima.controller.MemberController[方法]findHealthManager');
INSERT INTO `t_syslog` VALUES ('a1c1edb7-4be3-4cec-a4b0-8f6d10e42930', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '917', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a1f42e9a-ba54-4f73-ac8e-910f7c0dace8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '290', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a24c8c75-1676-4b59-a07e-554214fd4bf3', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '282', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('a25e6da4-d989-40da-a4d8-895685b20f13', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '2507', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('a2c7655c-3e90-423e-a463-2822ba07ca63', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '133', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a2cca33a-b5d1-4917-ab87-79ab79af873a', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '424', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a30a393d-21b0-4799-a038-277d9d7aaa0f', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '396', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a30c715b-f176-40a4-b1e2-29574f48ddc2', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '296', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a30f5308-8459-4294-90d7-a68344bd73ce', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '293', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a348a964-1bcb-4a65-b3a3-7a16f09977e8', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '605', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a3bfdc1e-d07c-4950-abf6-1872ef25641b', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '102', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a3d2fb25-cbdf-43a6-bcde-7867b494dd22', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '443', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a41565d3-3db6-4519-a50b-19855f3e1c15', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '137', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a41d194e-1ee7-4110-8192-4bba1ad2c82f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '501', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a4242484-90e8-45ad-890e-ab2c8a6f151c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '252', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a450672b-3386-4beb-b925-eeea71a63a01', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '123', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('a45420f5-3d06-4039-8462-751fb7a12b8f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '239', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('a45c3820-c884-4fed-9963-62746be40069', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '373', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a46c606b-ca08-4fcb-8858-91c5c568baa4', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '488', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a46c738b-0fa7-4534-b132-001dbf878a40', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '299', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a46f0296-0543-4a82-af74-1ee31c3f87ba', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1463', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a470575e-bb96-4ca4-bca5-1d1301816554', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '307', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('a475806f-a2a5-4a0e-8e49-eb9c72fe8721', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '742', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('a48c518e-44bb-4cfb-ace9-a4e7090909f2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/add', '3573', '[类]com.itheima.controller.RoleController[方法]add');
INSERT INTO `t_syslog` VALUES ('a4ac840a-6fb8-441f-80e3-239f3cc40156', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '403', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a4bb64bf-b49a-4527-b94f-e753c21904dd', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '765', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('a4f0c2a3-c98d-4e2b-a2bb-80c95d27b43d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '462', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a50b4ef5-64c0-4c49-b160-b551597026db', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '231', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a5142677-8639-46a7-85d3-be217c1198ed', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1295', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('a51e8ce5-7060-4028-bcce-7d5b12108868', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '217', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('a552d56d-79b7-413f-a5d1-dcba3fd64fb6', '122', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '148', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a55872f4-3466-44b0-905b-7c49397b6334', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '306', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a56af2c6-3aa2-412c-b89f-0d3c1f2a2e8d', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '314', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a56dc54e-3db5-4746-a58e-4b75cff814b1', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1077', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('a57d654a-2d06-48f3-bf30-43c7a650b61c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '97', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a5ac894b-e23b-4ad8-8573-a5b2cceccd1e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '291', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('a5cebc2d-06a2-4524-a62a-02b92dd7dfc2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '927', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('a5df5ac8-56db-421d-9b13-40158e54fa11', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '395', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('a5e570d0-2a4d-4dcc-8723-3935c33f192c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '278', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a5e859bf-b7bf-4377-8782-622e47e0f767', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '248', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a5fc99ed-c934-4cf5-a9e8-493951fa96a5', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '176', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a60e4150-03d3-45ea-84dc-9578dc0b2a9e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '306', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a653e6ae-d655-49d5-9706-2fcda0e7e91a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '299', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a6684509-366e-40ac-9a57-aab2363aaa89', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '49', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a681731a-98bd-4b3b-bc28-c1503e93375d', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '226', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('a692d8e3-1938-460d-92eb-008200181c5e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '336', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a69c301b-1c36-48bd-be31-e81879212d1d', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '331', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a69f6db4-b459-4ab8-97f4-3320c95b1126', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '271', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('a6a1f8cb-753b-4e34-a49b-1b9f27e4e506', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '300', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('a6a8f33d-7bf4-41e3-9ebe-7d1f66104cdc', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '932', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a6c62ef6-288e-45ee-a97c-b843793f0dfc', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '1', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a6d1204c-9104-489f-b76b-51319117d2d0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '280', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('a6e3a804-1799-4b35-8b22-38f63e66bac0', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '252', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a6fc8562-19ac-4525-81b2-c6e56b5600b7', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findOrderById', '0', '[类]com.itheima.controller.OrderController[方法]findOrderById');
INSERT INTO `t_syslog` VALUES ('a72b6da7-6d64-49fb-bb41-420207d73158', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '307', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a7321acb-068f-4856-8df4-46be94e3abe2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '328', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a74fbee7-9080-46d1-8ac6-34435191cfe9', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '375', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a753506b-c0ae-4d4f-b7c5-b61dc9e24564', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '244', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('a76de96b-e4e9-4082-b5bb-3318ca4fe53d', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '0', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('a7b8e708-6dca-4a06-908a-15895eae115f', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '349', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('a8060f28-de4f-48bf-b1da-ac44f7b802d7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '271', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('a82f645c-82dc-463f-b205-6cb5df377a5d', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a8571df4-4737-4dcf-a3b1-8de4c6d15e60', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1128', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a85903ee-4e73-4c27-9df7-eaf529e5198b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1310', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a85f8a3a-731b-476c-a6fc-a7bbde75feb0', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '360', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a86ec1b5-2e42-4a64-a060-f35bcd3df6dd', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '298', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a898c5ce-fcef-4f4b-878d-97b0ce362087', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1318', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('a89bdd2d-1511-4674-94df-f8f746bc7731', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '307', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('a8b87a3b-dc5a-4381-b2ad-12c859ade106', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getUsername', '22651', '[类]com.itheima.controller.PermissionController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('a92a983c-8112-4f78-9fa1-f687bef17657', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '442', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('a9369610-e91d-404a-bd27-cd2688d7b2e5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1084', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('a9381248-8295-463d-889c-9749179da641', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/findHealthMessageById', '474', '[类]com.itheima.controller.AdviceController[方法]findHealtMessageById');
INSERT INTO `t_syslog` VALUES ('a9841e7b-1505-4bb6-a2f6-140197871edb', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '134', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a990f601-f03e-4c04-bfc8-30269f3395b8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '395', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('aa012b4a-b36f-40c6-87d4-58e33fe26c3f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/add', '913', '[类]com.itheima.controller.RoleController[方法]add');
INSERT INTO `t_syslog` VALUES ('aa1b5fb1-3cbf-4032-8d4e-f7aca32f2721', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '240', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('aa631fd6-1380-4091-8277-0b18d48a7ea8', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '1', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('aa6ff927-4dce-448d-a808-258dedd84e36', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '152', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('aa92b592-ece2-414b-a04a-5e2805c01de6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '374', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('aab49a45-4c63-4f67-bb7a-626c6d7d7b19', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '293', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('aab72eaf-8e63-4627-88ba-ed556a9a2c99', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '223', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('aae53e8a-f22c-4fe4-a87f-1e2baa542a3d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '1095', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('aaf15189-ed80-4436-a79d-2ee091b0bc88', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '784', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('aafce4a2-4d10-4996-8536-9e79ddbee622', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '375', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ab0b484c-538b-4bef-9741-dd3c3a653744', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '170', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ab19b2c5-14d8-42b6-aa84-927ad2d3d674', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '113', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ab2574c8-a7d2-44fa-afc3-7759467f93ae', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/statusEdit', '89', '[类]com.itheima.controller.OrderController[方法]statusEdit');
INSERT INTO `t_syslog` VALUES ('ab34a550-304b-4a7c-8703-5577e6bdf245', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '211', '[类]com.itheima.controller.MenuController[方法]add');
INSERT INTO `t_syslog` VALUES ('ab3608c1-aa3f-43a8-9ddc-650dd82101bc', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1233', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ab515016-0e74-4e10-91e5-a9a561499cea', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ab711152-d472-46af-a1db-e42d5744dd86', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/getMemberAgeReport', '1', '[类]com.itheima.controller.PermissionController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('ab8a6087-417a-44d5-a570-b48c1f2f8fee', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '103', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('abe3b176-08cd-487a-81a7-aa112d1a0b3e', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '1013', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('abefa7dd-fdaf-48ed-830d-c3bf70a2ec7d', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '709', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('abfdfeb8-86b2-4387-a256-78e97870305e', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/advice/add', '507', '[类]com.itheima.controller.AdviceController[方法]add');
INSERT INTO `t_syslog` VALUES ('ac37ca9e-22e1-4b34-9c09-bfcb825ea789', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '107', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ac5aced0-5017-4b33-990d-ddc627c11798', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '347', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ac791751-a808-4eb5-a7b3-f4a8e12ff13a', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '166', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ac7b390a-e080-4fec-a662-7edb3f2dd860', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '426', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ac815144-3f96-4243-aae8-a67d3e00822a', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '178', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('ac880017-371a-406b-a85a-783dd5caa76c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '240', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('ac9234b2-4958-40db-9a75-4a8463e0c15c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/add', '816', '[类]com.itheima.controller.UserController[方法]add');
INSERT INTO `t_syslog` VALUES ('ac97f2c2-4d5e-4209-ac16-595aae014806', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '232', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('acaf43bb-66dc-481d-8b52-d5ded9517f59', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '893', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('ad33f9bb-c05d-44c5-89f4-092becb6d67e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '809', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ad343320-0214-42ea-8f6c-305df011bc0e', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ad477c33-d086-486a-b064-888d7fa00d4e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '504', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ad4a2f31-0a80-41f3-a358-603cc507059c', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '284', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('ad73a9af-7cc1-4fbc-9df5-3b2c780aa922', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '303', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ad9e67d1-e139-48e7-9105-138b0183609b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '332', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('ade4017c-fb97-422b-a45f-2f4ddb5adeb3', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '252', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ae1c58bb-d4ef-455f-8af5-63b1ad2189aa', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '5', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ae43c73b-8d51-4f36-8c41-ea58ad0f7619', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '263', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ae54ce99-2aef-45eb-a19e-266c45e907b0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '415', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ae7b73db-f82b-4e36-b2e8-306b93a36f07', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '744', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('ae8eddd1-4515-45f8-b657-bcb6f8abd92a', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/permission/findAllPermission', '7', '[类]com.itheima.controller.PermissionController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('aea39e4e-8468-4b30-97ad-2053b83cad90', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '321', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('aefec98c-9f2d-4bd8-a4db-795d18ff945d', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '2051', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('af481285-efad-4963-a195-affdf3dc89e5', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '135', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('afb93be5-2b8c-4523-a63d-ffcb4f8b035e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '239', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('aff7a254-e8ca-4031-837e-2384944b533b', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '119', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('b004d00d-6713-4237-b5cd-705c4d57bf3e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '462', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('b08be0c1-f2cf-4de3-ac65-7ed12c9d6ceb', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAllSetmeal', '1', '[类]com.itheima.controller.PermissionController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('b0c9292d-3589-4a4a-a69b-7efcf3faefc8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '809', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('b0d1a0dd-c720-48f0-98c9-6fb73da18b8d', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b0d24595-2297-4b87-bf99-a1b4b53d271b', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '34024', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('b0e1b0f7-0284-4eb2-a52b-6ae193ef2bae', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b0f0b20f-3b9e-4a7d-84e2-1171d8295e6b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '0', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b1293287-9271-4c61-805d-5b6a2d98e9ff', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '467', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b1300ad4-93e1-480b-b0a9-e3616fbc2712', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '227', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b13a939c-ea41-4cc9-97f5-f9b2941e0355', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '671', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('b147a505-beb9-427a-a71b-bdc19119c7d2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '209', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('b1492d5f-96dc-4800-969a-1aef8fb8bba7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '252', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b14935e1-e79b-4b6e-8141-9f77778d35a2', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '121', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('b16189c0-f191-4104-afc0-50666040745d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '396', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b1719195-8702-4129-a1ce-fe0179e3bb2d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '271', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('b1a52f25-0868-4ade-a6b3-4950b4ea9f0c', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '240', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('b1cabd6e-6e48-4944-a75a-0b8b724dbb7d', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b1d5a66f-bbdf-4292-ac16-2010049862bf', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '303', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b1edc14f-1229-4e75-8b14-5fd873c6c787', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '295', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b220cda5-6270-4974-a9cc-6c1b04566554', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '116', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b229c2a4-8037-4c4d-ace0-6bca8fd09088', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '339', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('b248540c-c753-4ce8-b320-2dc00285e419', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '298', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b24b43fe-e497-4afc-8475-4f9bf6d6fde9', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '127', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('b2576b20-a436-4a25-8338-316cd2d45b46', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '412', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('b2865bd7-b56f-4ae1-9ce8-eaeb007995be', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '509', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b29207c9-7b35-49f4-b0fc-7e701f1a6671', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/add', '228', '[类]com.itheima.controller.PermissionController[方法]add');
INSERT INTO `t_syslog` VALUES ('b2b860d4-adec-49d9-b679-d2793e3b6b8a', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '792', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('b2c06fb8-ca71-4320-a790-d9321a4bb2c5', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '270', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b2ef5f4d-9c00-4039-a542-d7a8a8772379', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '289', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('b314f5d8-e283-4ddc-a6cd-2785673faa0e', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '124', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('b3212d7b-2a83-4652-bad5-fe05506e6212', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '294', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('b325d154-1271-4d0d-b8bd-84f674ae2e6a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1131', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('b36e0487-13a3-4c01-a98b-94f8b7fd4e89', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '95', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b36f6a4e-b53f-4238-9253-9f438fbc6003', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '310', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b3b13c68-f285-43f7-ae57-970d205bc48c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '414', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('b3e99abb-f83d-4beb-9dfa-416d6e029e8a', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '74', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('b41ae6d6-c760-4c43-91ff-f26087cc92ca', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '30', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b41ee726-8bc0-4fe5-809e-ea80c040c180', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '740', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b443dfbe-5105-4352-95d8-7739e947e071', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '233', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('b478c863-706e-4b63-8743-04679da4b3f8', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '317', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b488855d-fb3a-41a6-89e1-dc054a5b03e6', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '302', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b491ae84-82b6-4b58-a6d6-2cbe4dc22762', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '3098', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('b4dd6214-11ef-4b2b-b5ae-a465b3e069c1', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b4dee50b-402d-4ee1-9432-cb3d97a949bf', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '0', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b5075104-126f-4853-9e75-bbc5b0ebffcc', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '774', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b5496c3a-32f6-4d97-a30a-91230ee587f9', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '248', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b56d6809-13d0-46ba-90d8-bb5a5e8e8036', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '290', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b5cd962b-f868-42af-8cab-106b0e1310f7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '477', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b5cfc9be-6d75-4e78-839a-6d54dcb3dfeb', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '271', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('b5d5bbac-857c-4ca5-afda-02bb0620fd42', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '441', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b5f54320-6799-46b8-8662-dea95aab0502', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '258', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b649288a-d7a9-4611-9d6c-23dbd7290df2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '115', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b661d1c0-4f3d-4151-8bf5-0e706a845a0e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '73', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('b67ee00d-b705-490a-aa09-78800bd90082', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '328', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('b68e5ea3-7b26-4194-a0e6-b69b12eeb7bf', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '300', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b6998d46-3fd9-401b-a00c-a8e91645e9d1', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '470', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b6b45403-9ac9-4094-9173-6429074805e2', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '292', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('b6b5028f-1fe7-46a7-94d0-b660b3743579', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '36864', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('b6faa9ed-3b50-436f-90f8-e5e3875c770d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '423', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('b71aed46-9f13-43ab-88fd-0d9d79bd5c9c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '95', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('b7335425-6337-4f29-9319-fe6c706437a7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '225', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('b750b7bb-0a30-43ab-b2cc-7375cfa1e984', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '313', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b7644132-ba73-4b1d-92df-9ded15382c19', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '0', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('b790f75e-d44e-46a7-b376-d0cc13882669', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '230298', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('b79d4a72-6fe6-4048-b8c3-89320b08fadf', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '318', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b7c26a78-f0a5-43b2-920b-f2c30a78c8c2', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '807', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('b7d62e72-52b3-4ecf-bdbb-e6bc75990bfe', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '305', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b7efbd37-4d08-4f7a-a7b4-2ce1efa87abf', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '819', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b7f611f5-6f77-43fc-b7b0-c1f8749aa4d9', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '260', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('b8085da1-0786-4f03-ba9a-c4d76d78b6fc', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '321', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b80d5086-1f94-422b-8fa8-69b73f8d20a8', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '107', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b8484dca-674b-4651-acef-6036412bd3d4', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '364', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('b875e004-df1e-4c20-8d63-a30330edc783', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '306', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b8fe881c-2c5a-4202-bd6e-4564155a5b24', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '3103', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('b90612a6-4cb9-48e6-a4f8-f91182d6ca28', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '332', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b91f1985-04ba-4702-bf74-889b8c96efc5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '217', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b93b2aa0-8430-4eae-9f7f-d7be67e2aef4', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '257', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('b96fa598-5f23-4dde-9f4b-2fa3be65bdb9', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '294', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b99e0352-a85d-4854-9812-b5b655b08c0b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '305', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('b9ae5127-8e27-4f0b-b318-228f6e7c74b4', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '188', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('b9b56f4a-f3bd-4cc6-bccc-b40e8aad65fa', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b9cd2b8c-050c-4bd4-9063-f8595faa3cb2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '290', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('b9ea13bf-004c-4e0c-a11c-dae0e72ed7e2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '326', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('ba0cccc1-adac-46f1-8259-d9b0bf9b29fd', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '237', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('ba1991c5-a5af-4cd3-be99-46e8081d5d96', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '263', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ba447f31-fea4-4517-bc0a-4c82ee67f328', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '0', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('ba64bbd2-0e02-438e-9a2d-94670f0591b5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '308', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ba679a1c-a99a-4b05-a591-b3c86bf0c00d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '103', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ba74712c-ae2e-4815-803f-208b613feb05', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '114', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('ba84a8d7-6ea8-4350-9571-1496eb29fb05', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ba94937e-9a2a-436d-897b-27818662dc28', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '288', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('baa508d6-e769-41d2-8fed-f4a668b07a14', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '386', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bac8cb53-761e-44a9-bf4d-65a16bff4b94', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '318', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bad0b08d-0a5a-4b8a-b372-59417590a3bc', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '2170', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bb017ac0-525c-4917-bdb5-4bd75d4643f7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '85', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('bb15c65e-b598-4d28-bd0a-7032a7b92b4c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '345', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('bb2c4ff6-6818-4a77-aaf9-10be58614d87', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '282', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('bb340f60-30f4-4f25-84b0-4b7b0ebefb53', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '1', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('bb40ac3c-9fbb-45ff-9ad4-46796eab6293', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '102', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bb4764ad-26fd-4ff2-b8b6-63a0c1b4d8c8', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1363', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('bb63256e-2a8e-4ff4-9f1f-c936a2d79d82', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '353', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bb753747-26fa-4d9a-97a2-5aaf0a2d3548', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '290', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('bb7d92c1-104d-48a2-9378-9d5870a34b0a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '256', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('bb8a6ca6-e764-4222-8045-a293a6d8380e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '433', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('bb99e799-a2b6-4a4a-a11e-63f0dbf6475b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '255', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('bbb488b8-4ef3-423a-a3b8-9f61d5d635d2', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '113', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bbbcdf3b-f9b5-4a8a-877c-1d16b17b8f97', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '558', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('bbd5c06d-37a7-4544-a1c1-6e21cc5904dd', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '275', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('bc17e0a3-5082-4261-a824-c9dcd411522b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '250', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('bc2de488-9c91-4add-9b5d-d885903efd2a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1786', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bc7fa26d-3f37-491b-ad33-fbc834323d55', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '241', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('bc8e5b37-c4ff-43a4-b996-502e90b32cc6', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bca81864-bc21-4fe4-83ce-427d2524125d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '698', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('bcc3f7f3-c3a5-4983-a737-2e08e905fa4c', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '273', '[类]com.itheima.controller.MemberController[方法]findHealthManager');
INSERT INTO `t_syslog` VALUES ('bd0032c0-a00d-439d-b3da-0cb4cc87394f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '243', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('bd10b613-bbef-413f-87a9-31ffb30f1890', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '280', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('bd126656-7e19-4bf1-9d4d-53b8880e4f05', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '311', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bd1ebe25-1e4e-4909-9535-2d43393ac4e7', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '281', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('bd33184d-641d-49a9-abc2-7182264de061', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '307', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bd33de64-e54e-4c44-96e3-06458a2d4e90', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '86', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('bd33ff6b-001c-4598-9bda-3bc8634e3ead', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '15', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('bd35ab8b-fc3b-44ca-b3e3-7d6105ed879d', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '644', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('bd8be5ab-da2c-4581-9902-8c6b37a1c708', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '368', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('bd8d3b18-b3ab-455f-b474-f296695d5db0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '783', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('bdb07118-6b71-4876-a248-cc862e88d2fc', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '256', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bdce72bb-c4b8-4624-8975-64ed4d4c03cd', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '241', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('bde07610-17dc-4719-a3db-eaa9dd883b4a', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findHealthManager', '209', '[类]com.itheima.controller.MemberController[方法]findHealthManager');
INSERT INTO `t_syslog` VALUES ('be123d8c-fb72-42db-8ba3-8c8efecf3ebd', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findByPageAndCondition', '0', '[类]com.itheima.controller.PermissionController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('be1dc16f-9775-40fc-ae63-0329125c2ccd', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '0', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('be232897-e777-4894-aa84-9cdd3314ec3e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '1', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('be3ed99c-efbc-4479-a252-c7741b5a3ca1', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('be3f07a5-e6f4-4511-92cd-91cb5a838917', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '727', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('be41aa3d-2763-4a94-b95e-4f1f59da345e', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '300', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('be56ae11-3172-4143-abb6-babdcae90706', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '1', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('be844f51-c321-450b-919b-fe1708d35cae', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '1104', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('beabe2de-1e98-4354-b894-3c6d49bcc672', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '799', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('bec82233-5d0b-4285-b91b-24b35d6c424a', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '66', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('bec8ca83-2ccd-4dfb-b227-944c7dba5645', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '889', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('bef406bd-3303-4bae-af55-1005494fd147', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '333', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('bf05147d-3b27-4542-a6a8-803a1b84eba7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '995', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('bf090f57-05c4-43e5-b6cd-754c2014ec23', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '301', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bf32f3ec-8a37-4726-88f0-83b697aff380', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1375', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('bf53acfb-0400-483c-b1a1-2748389f0297', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '342', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bf58fef0-e255-43ac-9e8e-d4e9d987d682', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '109', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bf6074c4-74ae-4c2b-8adb-51cdac3d7073', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '224', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('bf7864ea-9aa8-4751-8a31-929cd60e3614', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '309', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('bfb8b63e-6fee-4799-9afa-71a2d0fe3bbe', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '276', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bff4e646-9916-40ac-8f33-9cc65be87ecb', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '94', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c0162081-eaa3-4000-9835-c3c07e743c6b', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '1067', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('c03df3fa-1b5b-4feb-a594-02c3f707134c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1167', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('c046775f-531c-4f7f-ae1c-2c9e7b50159d', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '108', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c052104a-32a0-4052-9e02-0af6446bc596', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '311', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c0540812-e4e9-4c4d-a4e5-692f16408f46', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '118', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c06a5eaa-68b0-4a31-b12b-8eba3f0d2636', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '272', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c075d6fe-c673-42f2-9034-7d4c343871e1', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '87', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('c0972003-b472-4641-8c1a-8d1729f04312', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '345', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c0c0c1e8-410b-4a81-814a-bc886fa085f2', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '88', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('c0c4991d-5103-4313-9719-0f88d9cf35aa', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '409', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c0c81b42-724d-4a38-bb0c-620568e3afcb', NULL, NULL, '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '390', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c0f3b7f7-0530-47a5-afae-3f6c974e9a61', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '853', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('c1028530-fc06-4f05-a467-9ddb883b4e1d', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '275', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c15051e2-2f33-4cb3-841f-b9526639fdc6', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1204', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('c172afb6-0436-4d28-833a-516a6987b129', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '2676', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('c17a9184-a20e-4875-8f01-fe36e14036fd', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '240', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('c19243de-fe4d-40f3-b0ff-7eef90804f72', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '362', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c19632ab-0dce-46eb-b27e-0d7d9dee207c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '236', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('c1c853d1-93af-4e06-bd4a-8d5538ef4052', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '306', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('c1ea4b9c-2ac1-42de-beb8-8fb9327ffffd', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '267', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('c1ee263d-7610-4966-adb8-183513ae9781', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1267', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c20025c1-7a59-4d79-a7a5-02f40ef056cf', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '523', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c209ff75-a4ab-49d4-94a7-48dfbaa62fce', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '241', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('c23abb6e-491d-4162-9d03-6005637900d0', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '270', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c249a24f-b1aa-4185-9ba5-89e7bb7a5f49', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '326', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c25b5803-a2ee-4074-bf26-b6fdbfc285e4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '939', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('c273d5af-0958-4056-8e96-ae7d18c8d482', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '264', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c29ca6bf-0dc5-4dd4-bb7c-aa5c7101e2f5', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '275', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c2a0fe5f-c935-4661-8551-5ac7aef6756a', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c2ac369b-9a5b-4237-8cfa-a299f7ae3de2', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '281', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c2b1ee85-6cb0-4651-bbf0-3b1d06a0a21a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '231', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c2e4b05b-c027-4c00-84a5-2eaa5c3e2073', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '94', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('c301c4a4-5a24-45c6-be4a-0a473432de1b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '339', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c324cfc9-0132-49b9-b46c-3a20b3858ff0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '157', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c330a9ca-b7d7-480e-bc5b-e8c1111910f6', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '399', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('c33f0817-530c-47a2-a81d-e05d1b5308e4', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '1', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c34dfa40-5bcb-41ce-ba0b-f94a216aaa49', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1681', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c3525a01-c064-4999-8837-ad1fe6163c91', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/delete', '294', '[类]com.itheima.controller.OrderController[方法]delete');
INSERT INTO `t_syslog` VALUES ('c353f616-d89f-4d7a-9fe7-dd12f5c46467', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1424', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c35c2d2f-d36b-4baa-8205-703632ee3567', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '256', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c3600645-6bc0-4148-a639-936e062161f7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '255', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('c36bf0cd-391d-494a-a814-0b051e9f9cf1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '342', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c371428f-d3f8-4610-902d-3300215a194e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '274', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('c37d97d7-9efa-484d-b5cf-47af95309135', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '109', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c38c7c54-10c7-4a4e-8f7e-aca1348b6d35', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '211', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('c397f40b-456f-4b61-bc78-0ace5727da9d', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findAll', '0', '[类]com.itheima.controller.OrderController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c3c279be-eb20-4f30-adeb-3a2f45943d16', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findOrderById', '222', '[类]com.itheima.controller.OrderController[方法]findOrderById');
INSERT INTO `t_syslog` VALUES ('c3c7bc21-eb5b-408c-8cf6-634264dffef6', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '189', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c3cf14b2-5812-479d-8b74-bf6614571d98', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '0', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c3dd468a-8cd6-465f-94a5-e995624e886c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '340', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c3e0ce6e-8a87-4af4-9680-88f1de7f361e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '258', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c4134b50-9024-4d59-81ca-ee62eafe8472', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '150', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c41f41f9-76bf-44ef-af22-a09cae6a1d08', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1332', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('c4397ba3-479c-4897-9f87-50facfa1a449', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '118', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c445ccda-e035-4011-9641-d8030b830582', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c448adf5-ff68-4d5b-afc0-7702fb2df2d7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '317', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c45c7978-5c87-4723-8c5d-33ffdad367b2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '211', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('c4847cf7-6d32-4630-b5e7-aed79a0e1309', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findAllFood', '256', '[类]com.itheima.controller.FoodController[方法]findAllFood');
INSERT INTO `t_syslog` VALUES ('c490f8ab-4d08-454b-83d7-11e26c84cf8c', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '85', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('c4b8ab0e-a6c4-4984-a646-e862fcc8b704', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '24263', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('c4d76155-b584-44fa-ba95-4a6108007485', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '1', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c4e471b3-0f06-4b88-8d78-0d2f18611bd9', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '319', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c4ed1f64-2f88-46fb-a59c-e3143ecdb5db', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '692', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('c4ef66cc-0d7a-42d8-a1ee-34614123908b', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '760', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('c4f25ff4-9957-4ef3-b36f-66e50ac6c15e', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '522', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('c5447fa1-01dc-4f77-9016-e6e45b79aecf', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '2395', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c56379bc-63cf-4065-b637-8230043d0749', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '319', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c579f4d9-b614-45d6-9758-4f6c5950f245', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '0', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c5d3c8fb-391e-4f4b-b8aa-81ea865b1e4b', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '1', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('c61d80ee-4ee1-4a8e-957f-84116bbbae0c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '246', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('c6562152-a3df-43dd-98a9-0327d6532245', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '7', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c6ae3041-87d1-401c-bddc-110427b98a14', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '283', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c721b463-8c2b-4d61-9d4a-529ae59ad16c', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '250', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c73e43ac-7d18-4eb5-900a-c020b381cec7', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '1', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c771a717-a8f9-4695-a28f-7492ef99807f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '3825', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('c77f7e4f-c2e2-4e6d-812d-ba0e34efa2a0', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '268', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c780fa0d-6393-4277-8348-4007aea1ea0a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '1086', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('c7ccc031-4748-4c19-a9bd-9ff1ed37d27d', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '254', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c7d7da1a-118b-40fc-90a6-d38a390d65f6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1928', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c7f22da8-954e-4160-8628-a22ccd78cb0e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '627', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c7f91e80-2c6b-4750-82b0-494a2f0b649d', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '259', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c80c438e-69d8-4154-993d-ce6431b05def', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '237', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c81639a3-98b8-4ecc-8213-d949e9b7c837', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '213', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('c823d130-a819-4a1e-9880-0b8a01080f1a', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '0', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c8330c26-0fa7-44e3-9948-cfb45567f1b6', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c83db063-838d-4dc4-84a3-8adad38b7908', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '224', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c852c057-fc7c-4cae-8298-501249754375', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c85c67d2-a2ab-412b-bf0a-61f90e271e34', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '598', '[类]com.itheima.controller.MenuController[方法]add');
INSERT INTO `t_syslog` VALUES ('c865e3d3-228b-4daf-8055-7e07270938fd', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '740', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('c87ef8e1-c006-482f-8a77-bed18d6409b5', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '137', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c8a2788f-37d4-4057-8b6c-77f703eb542f', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '91', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c8a5aac3-f0d7-4ef5-953e-518680cf21c9', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '280', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('c8aba014-b0e0-4b27-bc43-f6b07e1b46c2', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '109', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c8af93db-28e0-4ea1-8fd9-02ebeb9cd708', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '171', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c8d0621b-f94e-4bec-a731-7b1db4a0bc88', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '83', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('c926317b-4c95-445f-9766-807c07b0f322', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '343', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c92b5746-4797-4d1e-ae96-63de7c17404c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '220', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('c92bb7e7-8398-42d4-abec-2710d6ad1252', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '85', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('c9318246-4c07-4546-88e6-98161839c8a2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '322', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c936e252-46fe-42e3-aef8-6aa927f2e003', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '333', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('c9523f8f-2266-4577-9e50-17ea2fa30bf4', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1846', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c9577f7d-22c1-4f2f-b6c9-dcd3c3e0db1d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1796', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c9634a17-e49b-4ada-89ef-413358813335', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '417', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c96a4d61-df86-4536-bfa6-1fa5515613e2', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1064', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c9714988-a8cc-44a0-8efc-9b51e97e570c', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c97fd189-a5ae-4a99-b829-cc4908216aef', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '670', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('c9888d50-7e8e-4d21-afc1-90fef3247022', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c98ccafc-0219-4f19-b297-5d82db4516f7', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c99d2b39-602b-45d8-9383-54db8ea95e71', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '118', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('c9dd5423-41f0-4bb8-9eda-90780e6f8e1f', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '782', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('c9e07592-6335-41d9-b13c-fd4167a5a919', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '84', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('ca05a677-e4a4-461a-8c97-afd9d532f769', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '236', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('ca39f18e-5f8d-49e7-add6-55f331f9ca71', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '360', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('ca47e16b-47f5-413d-a1eb-9ae1c693c2c3', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/add', '267', '[类]com.itheima.controller.RoleController[方法]add');
INSERT INTO `t_syslog` VALUES ('ca6889d7-01ae-4e24-bfcf-bb70569d6d99', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '295', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ca7c6edb-43ef-4118-bb08-9da7c40c77df', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '249', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ca92c051-01a4-4e04-84d6-654943325a23', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '329', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('ca92c544-265b-4a0e-8077-92f0277e863c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '743', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('ca970fe2-86a2-49ae-90df-f9d5cc9095a0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '106', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cac554e8-f623-40bb-9d49-3ad6317c7598', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '85', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('cb007f68-3fba-4fd6-ac0b-69c36b403be7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '219', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('cb5bda3f-6bd4-4297-bcce-e868edf84c6d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '254', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('cb807e81-421b-46c1-b366-0adddf74081c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '113', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cb82fcb7-82a9-470a-817a-52029e62271b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '8487', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('cb9b48d9-1957-4bd3-8a34-8ff876c69643', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1392', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cb9ca72c-987c-4116-9055-6570ab06e40c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '303', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cba16440-2fa0-4d57-ad4c-cd9973309516', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '210', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('cbc01103-b03d-4d7e-9c21-776b1d64a017', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '101', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cbe04cca-6182-481e-9709-c899c639eb25', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '336', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cbf58082-1740-4ea1-9eae-7e5b9a3b8004', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '90', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cc0675a7-d2ab-4f42-b18c-8b414a6938af', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '187', '[类]com.itheima.controller.SetMealController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('cc0b7c54-ea33-4a7b-a843-b33ead402d2e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '350', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cc21af2b-5489-463f-b901-be58196ef60e', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '280', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('cc23a4b3-3f4a-4569-84f4-9332e1a24bd0', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '246', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cc258bb5-89dc-4835-97f1-39dbfdfd8134', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '61', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('cc28a51a-88e9-41c9-8213-4c921e861538', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '1882', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('cc4ad15d-7701-49d9-8367-99a1f4308159', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cc4b8c89-8486-4931-9d87-6ee2576aba80', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '220', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('cc5aa9e7-dd4a-442a-be00-916c448975ff', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '232', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('cc621147-969c-4787-bf73-2ec09e6b3ea4', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '0', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('cc7aeba9-83c7-4bca-a701-189a97501f17', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cc9d67b0-9eb1-4787-a6a9-bbcc141a7e99', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '141', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('ccb58d2c-5cac-4431-9178-56d1ffb3dd9c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '272', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('cce901e4-382a-4501-bdaa-874d57bd9e32', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '76', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('cceb372d-9c7a-4480-a386-362444a96749', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '76', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('ccebb093-c78a-48f8-aca9-79bfa4159825', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '213', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ccecedcb-1092-40f1-8a31-8d994bdffa97', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1868', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cd03dc5b-30b6-4fec-8562-63c37ff5b32b', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '355', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('cd1866f6-9a75-4bce-9fe3-9ec73fe77256', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '787', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('cd2f45dc-14e2-45fa-994e-85e941f24cbe', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/add', '349', '[类]com.itheima.controller.MenuController[方法]add');
INSERT INTO `t_syslog` VALUES ('cd49047b-9dad-4c68-ba54-909a59594dc8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '248', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('cd727e01-3f12-4956-8a0b-f06bb17acc62', 'xiaoming', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '245', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('cd86725d-342c-46bb-86be-b4fa0f637c9a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '364', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cdbd34fe-01af-465b-bdf5-1e198738ff63', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '170', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('cdd09c3b-3a56-400e-ab29-a3fde99ad0bb', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '362', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cdd547f3-19dc-412c-a7e0-61b7da0a259e', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '1', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('ce0d7db8-6ae7-49de-a738-35a88dcae37d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '332', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ce503bc3-5bbc-4a44-8f50-ec6eef358e70', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '397', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('ceba0eaa-45dc-4e08-b4f7-5705621500bc', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '128', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('cec18cf7-5756-4d9c-b021-4d7d7577fd98', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '798', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('cec2441f-6140-4def-a6f6-3a6b7933d58b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '227', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('cec8218e-b6db-4fd0-b547-2e84a8d4ae3f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '653', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ceed7ee9-0c4a-47d0-97de-d855b12739cc', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '314', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cf012d32-5306-4cec-b86d-2492c5e914ea', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '304', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cf2878ed-342c-4df7-9983-0d21676bb17f', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '631', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('cf3c5941-c8ec-4103-a1e0-7229fa5fa6ff', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '274', '[类]com.itheima.controller.MenuController[方法]findAllMenu');
INSERT INTO `t_syslog` VALUES ('cf5c8674-5869-497a-ab65-7eb3809924af', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '104', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('cf6a65a9-6700-41ef-bd8e-6f237da0a10b', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '92', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cf92411c-3d9d-4d6b-9e52-a064c83cd124', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1141', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('cf9c30b7-78bb-48b5-a4dc-84834aef880a', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '111', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('cf9e162f-a71c-4eed-ab29-a2db57314ac5', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '1984', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('d0114f7b-d84b-42b5-bb65-59901d9e0603', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/delete', '494', '[类]com.itheima.controller.AddressController[方法]delete');
INSERT INTO `t_syslog` VALUES ('d082ba2d-de4d-47a4-a6a5-1e6622194303', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '2028', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d094fae6-0613-42dc-b4ed-4c625c53efc2', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '127', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d0a7f902-d287-4d8f-a1b5-9a0d8bc005a9', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '837', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d0d2e658-8f35-4417-8be0-ab55ee36f63a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '266', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('d0e0389a-459d-4142-a30d-75f0b02926ed', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '942', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('d123d6b1-5c73-447c-9318-952920662e8d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '206', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('d144996d-3311-4304-b393-446d7cd18cf3', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '267', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d1a16b51-7117-499a-bb20-4a749338208f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '295', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('d2084130-47a6-47b9-96f2-f62b467be048', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '0', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('d20e1ca1-c85b-48a7-bc0f-05772a765f99', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '302', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d221f5d1-63ed-43d3-99c7-2b9f3fac68c8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '456', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d2421654-79bc-4600-b68d-c51720cbdd56', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '867', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d25afb18-2469-46bb-8d84-75417b9caac9', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '285', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('d28f08d2-5ef1-40b5-8f0e-7eb3f478bc24', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '193', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d2bd2887-87ea-48c4-b947-5b3c0518827c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '236', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d2bdffe6-82e0-453e-982d-fadf184bb664', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '332', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d2c3b483-f3a0-40c9-baa1-9d7f4f8586a1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '863', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d2e62d54-4219-43b5-bac5-ba44580fcf3b', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d2e904a4-90da-46c0-84f9-29fd11650d4c', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '916', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d2fde9a0-e4b0-4ef7-888d-70159caa53de', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '3402', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('d30bf5c3-5c32-44ad-89f3-40e6a3407d1b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '814', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d3173798-546c-417a-9118-d4d2a299697a', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '749', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('d321f575-bb13-4284-bc96-f30f36b6bdd7', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '351', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d3546e6b-a41d-4732-b7e7-cd7fcae3a2cb', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d36ff060-35f8-483f-ab53-94ece7137d7f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '255', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('d3825e96-4848-47c4-a433-e28cc4249ba1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '168', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d390f7a5-638d-4a9f-a455-82636de17cba', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '245', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d3bb3620-b31e-4201-b7cb-721b8e021976', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '396', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d3cd9353-27b3-450a-8f85-b1f2837715d6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '471', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('d3d39712-b803-4114-b01a-eb37a354279c', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '110', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('d3d3c584-ae69-43df-ac93-6249efee61be', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '323', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d3dcccde-b826-4ac5-877d-3f9749116961', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '97', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('d44cd9b8-cadd-4913-be90-a53c6d1897cb', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '100', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('d4592f9a-cf30-4094-80ed-d9e4352054bc', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '249', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('d4618a8a-c560-41a2-9df9-9b7b91021e08', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '246', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d4637ccf-7ba8-43be-8993-9e8c4e64e14d', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '740', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d47c697f-fd88-4f7c-aa98-69601f7e13b8', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '142', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d48c81d9-59d1-4e25-aa75-2bf796cb0179', NULL, NULL, '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '136', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d490ba2e-a99c-4e6a-ba36-aad021e62be2', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '265', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('d4c1f0eb-b6e6-42c4-a8a8-3d45cb70e8bb', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '129', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d4cae14a-d108-47e4-a4ce-26572a83b53b', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '153', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d4d9080a-6d88-4fba-b09c-4a484d3de4f0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '261', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('d4eb9e88-f430-4281-82c0-782e466923a9', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '846', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('d5337af9-a841-4042-9c02-d0d7d3f0e493', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '560', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('d56ba743-15ee-4e48-91c6-3bdabed6a3a1', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '299', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d5923d75-08d4-44d5-9358-0fe4d28af7ad', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '113', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d5a09547-7f5e-4f8c-ba81-db428c9f7066', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '318', '[类]com.itheima.controller.MenuController[方法]findAllMenu');
INSERT INTO `t_syslog` VALUES ('d5ab5ce6-3020-4353-bc55-d50a2ce2021a', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '182', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('d5b0893b-3a2e-4a7f-8dfc-9636eff31759', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '285', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('d5caad3b-31c3-4f6b-9a72-630bf3ad953f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '305', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d5cc0485-4f46-4711-8ca3-5af399e01159', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '296', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d5f78e2f-37e8-4c5b-8732-279d4f1997e2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1146', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d5ff33af-d652-4e6d-9a38-3a0c3a0b0f74', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d617380d-850f-488e-b1f2-7dce6072eba0', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '288', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d657288d-27f5-480d-a55c-23df713355bf', '秀姐', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1076', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('d6b24118-6a9c-4d30-abf2-b4793f5af526', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '268', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('d6dd2cd0-b61c-41b2-b404-cdca57c94f9b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '544', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d6f31875-4984-47f8-a51c-58d835c1a69a', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '767', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('d7104b7c-5928-4a45-be0d-2488c979b966', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '273', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('d72a2c77-9b8c-44c2-8058-c0c9f3d8200a', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '226', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d742bf8a-b375-40e6-a3db-52dbd1b07b8e', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d769abf4-b5f9-4c4b-b97b-738b4dfdf1b0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '219', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d76d471e-d95f-44dd-8e64-514906840e72', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '298', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d782d0ab-45ca-40c3-b47c-d9b63ae2d9a6', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '305', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('d78e0f62-9e7a-4629-a3ff-6a2fc1468740', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '250', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('d79459ff-e0c5-4f7e-bdfb-0e6e3d96e9a4', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '705', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d7977e3f-a6c7-4a06-a4ce-b31c4c0e510d', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '239', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('d797b0e2-f8ac-4316-90da-5d8df6e3615c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '260', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('d79a1877-18ee-48e1-bc03-a828bc31000c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '338', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d7a5f06b-ea1c-422f-8b3f-1c7c1d2f1c7f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '90', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d7b4c906-8e5c-4503-8ff1-3ff383ae9ae3', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '90', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('d7c93f95-5866-4045-bff1-0c69c9f0bcd5', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '69', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('d7d0a74e-dc71-41b3-a593-b96e76e49201', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '371', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d7f0f259-1492-465a-8085-0a257088cd82', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '126', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d7f2897b-1035-4b9b-9177-fd78a2472ba8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '278', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d7f575af-986b-415f-bdfa-6e841a93d6f9', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '0', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('d7fcf0a3-c64b-47a8-bfcc-a7a443cae4ed', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '277', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('d8243ec1-412d-4bab-a637-4a58685456a1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '270', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('d82b11f2-d4d4-4093-9ec6-510901f1bcf8', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '432', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d83243e6-1dd1-4f39-9db0-7c4cf178e51a', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '484', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d8351b5e-7ec2-4ff7-b118-0b42585a8606', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '196', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('d844f88c-150f-4eab-9bdd-92513c285b98', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findRoleByPmId', '545', '[类]com.itheima.controller.PermissionController[方法]findRoleByPmId');
INSERT INTO `t_syslog` VALUES ('d871cef5-245f-4cf8-a6b8-f423a792083b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '85', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('d890688a-10b1-4d4d-88d1-2cb94f967e96', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '118', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d8a3c4c0-0cc5-4d86-a61a-7feb8c09ffc7', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '420', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d8a69b4c-523f-400e-8ac0-856e64727d7c', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/editMember', '170', '[类]com.itheima.controller.MemberController[方法]editMember');
INSERT INTO `t_syslog` VALUES ('d8aa6d9b-d110-4525-9219-5b75a1226a2d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/edit', '351', '[类]com.itheima.controller.PermissionController[方法]edit');
INSERT INTO `t_syslog` VALUES ('d8af3889-b69f-4f5d-aba9-853df0510b99', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '850', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('d8c02435-0d60-4a6c-be51-8c44df991171', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '108', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d8d938c9-4219-4393-90b3-5d0d1b35a471', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '264', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('d8f08035-81d4-4a46-9f17-27d1d57b8bc4', '122', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '146', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d9239aa2-f44a-4266-95f3-4491c043d23c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '882', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('d9266872-be3f-46f6-91f9-37d8c62ab161', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '269', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('d945a08a-f9f2-499e-bc88-cdc8a233bcd4', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '118', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('d976c968-d64d-4769-88c2-315e665a942a', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '282', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('d97aa0fd-ca51-4dfa-927a-f2218cc9e738', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '293', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d9878e25-d6be-4770-b0d2-0c678e7bcb2c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '251', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('d9d12c0d-c96f-485e-b1a1-c6f1bc1cb40f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '291', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('da3e7986-679e-4408-bd6a-7867791709e5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '292', '[类]com.itheima.controller.MenuController[方法]findAllMenu');
INSERT INTO `t_syslog` VALUES ('da4fedf6-2917-4125-a2a4-eb81b7d94af5', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '0', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('da6378de-2736-4a10-bb40-63e2a2baab05', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '281', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('da722f6c-4f90-49a0-af1e-311c58ace013', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '277', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('da8e971a-3d1a-4509-9aa6-244ed5ff05e5', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '143', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('da9c0df6-f98d-4d1b-9415-38fcd500a533', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '64', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('daa4fd7a-429c-48c7-92c2-699ca1cbc772', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '122', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dadb1e3e-eef4-4779-a852-e2ab5412722d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '250', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('daf8e378-441e-4f8a-a753-331d2fcde3a2', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '308', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('db0dc120-de4b-4e85-b3d7-c4ed5dcb84c4', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '216', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('db3f42fb-a590-4160-a2d6-191118f18422', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '2500', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('db47ab25-cf95-4ebf-9646-0c2c17be7ba0', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '119', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('db791046-a40d-4672-be36-cb7c21d79535', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '242', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('db8357b1-3392-4fc2-b7cd-d2c9b8f69a8d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '295', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('db902152-281e-49ae-9b8e-cf250fc49179', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '289', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dbcaa1de-6e83-4509-affd-596ca1c60c3c', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '825', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('dc293af4-59a6-419f-9e9a-c6fff2a5ac79', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '219', '[类]com.itheima.controller.SetMealController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('dc47db93-fe32-42c8-90cf-eb2dad11f540', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '282', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('dc4ceee4-e761-436f-b5d0-0fb7de08c0bc', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '332', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('dc4eb204-a6a4-4f6a-965e-413159eb2d20', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '104', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dc6a7cd4-d803-42f0-95da-4a07cd0c889e', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dc735c69-4d99-41e0-affd-4a8b79b576e0', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '263', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dc9a3e5b-7e0e-4055-a427-9df331ffbebe', NULL, NULL, '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getUsername', '0', '[类]com.itheima.controller.PermissionController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('dc9c5d38-07aa-4750-8bf3-449d549f4cf2', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1420', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('dc9e041a-ab07-4ee2-a8f5-e8f20b54e5a9', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '307', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dcdbb15c-8733-4efc-884c-bcc4f7253615', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '76', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('dcf0a4f1-46f6-4f39-b260-038ea5815c35', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '329', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dd1cbf99-9cba-4002-97b7-f6a0f553d2cf', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findByPageAndCondition', '0', '[类]com.itheima.controller.PermissionController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('dd394235-a905-4269-8f9e-c6676f1cffed', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '220', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('dd4e1090-68d2-4aff-b911-df7a5c33898c', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '301', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dd6189d6-d008-4f33-8632-1e97b93a0849', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dd8f1aeb-2c3d-4a44-955f-3dd3bf21ffdc', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '956', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ddca2794-e4ed-42ac-9dea-8d41880d9435', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ddcf158a-fa1b-4226-b44e-15e6a4c173ec', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '267', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('dde03d8c-11b2-415b-ab0f-36f32fbca687', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getMemberAgeReport', '216', '[类]com.itheima.controller.ReportController[方法]getMemberAgeReport');
INSERT INTO `t_syslog` VALUES ('dde0a0a0-a8fa-46a6-9d21-12946f308547', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '797031', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('de467062-2185-4ae5-a0ef-a5342239821e', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '249', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('de4e4954-f8f9-4f06-9a71-319a0b9a0370', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '271', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('de8d60c1-f84e-4d70-83e1-c0c8dc53ca04', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '402', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('dea5b6e4-e38f-4ba8-93cf-1e6b1f9e33f6', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '107', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('dea92f61-afa1-4866-be71-b6848c823c00', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '838', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('debd8fb7-a824-423b-968c-8b3b699ae756', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '817', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('dee6d108-9be1-480f-ab91-70a30ad533da', 'admin', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '164', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('df06f8e7-e3fc-4000-b743-d965443d9931', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '313', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('df1e2730-5e4c-4916-824c-b6df525f6b3f', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '353', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('df33ffba-960c-4b73-8c61-fd134ce98156', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '213', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('df342ecc-6afd-4312-ac8b-e9889745dca1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '118', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('df3fefb5-6032-473d-bfaa-f53db3e73be6', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '290', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('df6072df-9c7b-40ed-8e45-aac48235e032', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '668', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('df61fa64-0817-4934-8c87-7aac0dd5c42a', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '630', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('df7d8386-3423-474e-be89-ab55204f4f14', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '977', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('df85d828-1499-4aa3-9288-5608a8fa6e66', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '348', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('df88b3ee-d886-46d3-9f8d-18ad205027f0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '671', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('dfa4b1c3-7e4f-45de-b9be-ac30aee12168', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '873', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('dfa91b92-0f21-4aa4-9ab9-cab9b668ae19', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '266', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('dfb6b937-bbd8-4795-865b-f7fbc8deaef3', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '416', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('dff6ed01-983a-4b06-b5ad-eb35459a5da1', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1898', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e02bff8c-b3ac-412b-9d05-5dc6a05a4d5f', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '582', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e0597c11-0dc2-493a-86ce-e5c6f4321160', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '294', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('e095c5f2-0df9-4cd2-9928-92307c3bcfba', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '1', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e0a9d19d-942f-4c0c-9da3-3b916ee6ab29', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '98', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e0acaf41-92fc-45dc-80bd-99611de7f848', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '237', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e0daa6d2-237d-4b49-af5b-5171185fab98', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/add', '1438', '[类]com.itheima.controller.RoleController[方法]add');
INSERT INTO `t_syslog` VALUES ('e1119d60-4620-44b2-8e26-2b7952c8a980', NULL, NULL, '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '226', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e113e6a7-4e9e-4baf-9b10-6e7ca0685238', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '379', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e14d4a46-061e-4c0d-89bd-672fb16b5d6f', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '306', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e16048e7-924a-4fc8-8169-2bc8a1d2164b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '281', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e1685e90-d29c-49d3-abaf-abcb0495b425', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '207', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('e1748d3f-16e9-4ddd-9a38-2d4527c7fe6f', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '155', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e18fe44c-3406-4544-b8b0-dd6a6dcb980c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '315', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('e1a39a7c-107b-44d4-851f-64e24f37b3df', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '176', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('e1e8f8cc-c9e0-457f-a9f2-f6ee28babd3e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '862', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('e1ec4cad-8247-4613-85ec-ac4c5d6ecbce', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '222', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e1fb1353-bd9e-42bd-a974-0f6bf55217f1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '311', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e20cbaa7-18aa-44e9-9d59-c257c5d2628a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/add', '322', '[类]com.itheima.controller.UserController[方法]add');
INSERT INTO `t_syslog` VALUES ('e2101b0a-bfbc-481c-b292-1f3b0251e65a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '277', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e231c543-9e0f-4e1a-bf71-e8ab657c7b48', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '99', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e2609045-0db7-4e3a-8c41-178dc6de0145', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '268', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e27ce51d-0b71-4636-ba79-eeddb6065995', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '112', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('e3251958-83e8-4086-84ef-bc5918d96419', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1220', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e3675082-548e-4981-ba66-e7f26629f734', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '85', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('e392b469-901d-4d04-8efb-ddb2dc1fb21c', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '299', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e3d93852-96d1-4f80-b151-af6e61dbf7a0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '278', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('e3e93c39-17ab-4c33-9ca3-960461ef7874', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '779', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('e45f06f7-c1e4-48eb-8cd6-bb05afe82b68', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '441', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e4748f2d-5fe4-4009-a8d0-0bfd4a5cd978', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '152', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e486c49f-42a4-47ef-8189-6f8264449f5f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '244', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e48c61f0-4461-4012-aa62-e33898608141', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '386', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e48cf0bc-e159-4937-8591-1568ce211dc9', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '548', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e49b94c3-b516-4971-8aa2-82091b583926', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '403', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e4c370b0-08de-4bfc-862e-33d1a8aa7219', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '244', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e52364a1-0e8c-4f27-bc6d-4f404bd90587', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAll', '304', '[类]com.itheima.controller.SetMealController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e523712d-9b55-40ba-b3c5-49e5d0df4a17', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '312', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e54d4592-57bf-42b8-9e3c-94d41b75a039', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1163', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('e57f5429-a77d-4b56-bf4b-1c54eb1eb0ed', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/role/findAll', '0', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e5826e21-d0ac-4e67-8f72-cdeb728f1914', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '297', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e587835c-ead7-4d9c-9be5-03adcfd8ae57', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '591', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('e598a115-5c04-4cea-8c8a-8fb7e8b70bdd', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '374', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e5ba110f-2d7e-4c26-80e8-cbd964944537', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '232', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e5d0fccd-b8a6-41d4-868f-83af16aff7e0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '210', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e5f39d11-1dff-4bf8-8807-22244aef1d99', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '3487', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e603e7a8-7ca6-4356-8926-a601ec6fa0b7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '257', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e60b9625-4fce-4b7c-8bc1-d2ad76b82a10', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '118', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e60fda59-3bfb-4cb3-9485-4b0636675b6e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '109', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('e61bf705-06f5-48b5-98c5-1ed9b09a8586', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '277', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e6250782-9c1b-45d3-ab79-d561e8fccb9e', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '729', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('e63a3c0d-f5ee-41e5-a595-41e3ff8f07ea', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '212', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('e653799b-00e7-48da-bfe0-f92a91d35c4f', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findUsById', '246', '[类]com.itheima.controller.RoleController[方法]findUsById');
INSERT INTO `t_syslog` VALUES ('e655d4be-8900-4951-a3ee-28e1d499fc4e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '156', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e6799477-1540-4801-82bd-a2a56671120b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '88', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e67c2250-ac0b-411a-9865-f4899cfe7127', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '342', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e6b1c5a0-77cc-4990-a0cc-af9115708f17', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '246', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('e6ba8f5b-3ed7-4e6c-b70b-2e00bc17d303', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '84', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('e6c07bc2-792b-4292-8547-75beff072866', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/deletemenu', '648', '[类]com.itheima.controller.MenuController[方法]deletemenu');
INSERT INTO `t_syslog` VALUES ('e6c10981-448c-4307-871f-b029bdcd2b66', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1661', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e6cfb8d0-f161-441c-9f37-03f3390f2b7c', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1045', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('e6d81738-5568-4691-b5e6-059a9dbff888', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '367', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('e6f311c3-59a9-449f-9e0d-ba0a86da2129', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '317', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e6f47308-31f3-4ada-9d8e-da0a8c7e3802', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '0', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e718ea4d-33aa-43ae-9874-100ede20b8fc', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '108', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e74274c7-729f-48ce-9d03-79532950f45c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '307', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('e77ab68a-2add-414b-9f30-dd201730bcc5', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '908', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e781b893-a98f-4fcd-9c4a-b81b9cfffab1', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '106', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e787515e-0b03-4048-8cc9-6307df1d2c8b', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '0', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e7c0d0c4-ac56-4f3f-9eca-63e792999fea', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '257', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('e7d8871a-bd0e-49b3-ad5e-6e7803215750', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '310', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e7eeb440-d233-42f7-8205-4b0e7c728075', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '289', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('e8018c68-4b69-4bef-a695-190661217423', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '317', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e807ddd4-e7f2-4e41-ade3-59ea86d64b36', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1860', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e80951df-ec67-4af3-a0f7-81df0fbeac35', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findByPageAndCondition', '0', '[类]com.itheima.controller.PermissionController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e80b9b2f-23de-4c6b-8d31-dcf0ead62828', NULL, NULL, '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '1', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('e85e5524-164d-4045-9d06-340bd29d68e1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '7918', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('e87305f4-928f-4b22-8670-10cf078042f9', NULL, NULL, '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '293', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e8842f9a-6631-422d-a8a1-c5d68dd27a38', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e8a4224b-0b67-45fc-b398-5e5d02739cca', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '316', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('e8aabf77-1b55-492f-b646-72b4cf24cb95', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '83', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('e8e13834-4ad9-4b49-b886-9d1a005639c8', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '265', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('e8e4d299-0546-4699-911b-efc9b997d94c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '336', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e8e8db63-75e8-47a0-813a-bec74bbc212e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '288', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('e8ecae69-ccab-4f83-9884-15cceccced0e', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findOrderById', '262', '[类]com.itheima.controller.OrderController[方法]findOrderById');
INSERT INTO `t_syslog` VALUES ('e8fdb340-ccd9-448a-a55f-0b3b05dc1a3f', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '316', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e9005767-87e1-4260-8ced-337e376e43d6', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '537', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('e909fcf6-b300-4f11-9100-31c70da97710', 'test', 'pighome', '2020-09-30', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '811', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('e9146b04-981d-4d85-95f1-248656d534c5', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '1', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e922de73-193a-4c3e-b169-4b42d58dcfee', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e942f748-384f-4d9f-a119-acd738177be0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '87', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e944581a-b04c-4932-a76f-dba5cd523fb4', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '346', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('e94dfbef-e32c-4f87-8ca1-1c54c79682ed', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '280', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('e96ed317-cb0d-4716-9e93-951555e453a4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '11', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('e9751617-b0d9-4377-b4f8-3828e7923d7a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '303', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('e9995666-7aea-4271-9812-f2d45062823c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '264', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e9ffe60f-6106-44c5-9e4f-8bef66fc6574', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '108', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('ea7b3aaa-beea-42e5-98b6-ea6d3468881a', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '248', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('ea86b3c6-a256-4aac-abf0-85eeac17ddb7', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '1', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ea971d08-815f-481f-872e-4246b6c57d83', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '237', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('eaa36228-b561-4fa2-a160-0511d3d3d5fe', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '824', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('eaa36757-c513-4c8f-a891-51a50e5162a7', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '290', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('eaf34bf9-edb1-411d-9667-d1733b5e5f9b', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '204', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('eaf9d7e3-8724-464e-b7d1-161b65d9f95c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '310', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('eb0786aa-962d-4f54-8388-1703ce58e11f', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '990', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('eb5d5f9d-a5cb-4736-bea2-fc2f1478c1e5', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findByPageAndCondition', '0', '[类]com.itheima.controller.PermissionController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('eb89e9f0-f415-43b6-8a01-140f3d1bc689', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '399', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ebc16bf7-5d25-466c-b0e3-1453da449211', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '84', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('ebc9279a-68ac-4bb8-8708-f31f6d5b027d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '1089', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('ebd945bb-fe36-4da5-8f83-2eb63fea6324', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '359', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ebf9cb57-4da4-4425-bc97-01c358475820', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '358', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ec040cff-4ffa-4138-abef-de1b7a41ac18', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '315', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('ec15ca2f-2940-4e2f-b142-0a708be1e160', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '398', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('ec1e9eaa-1a24-4560-82f7-7073783a35a5', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '256', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('ec27961e-e07d-44cd-b3e4-98a1447e54d2', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ec3a6462-e63c-41eb-a1fd-3e091d2ba930', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '391', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('ec5764ed-7db3-443d-88bd-9d7bd0875e25', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '294', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ec5ed179-8319-4395-af03-a7a3565b0fea', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '112', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('ec742e1b-bb04-46e8-a8d9-36be68ccf59e', 'TEST', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '324482', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('ec975a9f-0ba7-4766-b629-3f2f5b2dce72', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '1964', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('ecf24c03-1d4c-4729-967b-22d636aba829', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '232', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ed05fe5a-fe91-4fc0-9d3b-4cfe98bcdd5b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '252', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ed33b35a-c7f4-43f7-9975-f2338b4fbc55', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findMenuIdByrid', '201', '[类]com.itheima.controller.RoleController[方法]findMenuIdByrid');
INSERT INTO `t_syslog` VALUES ('ed708948-192b-47cd-973b-1dffc6a769d4', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '264', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ed77913c-adca-46f8-84e6-424e00dfff48', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/edit', '2839', '[类]com.itheima.controller.RoleController[方法]edit');
INSERT INTO `t_syslog` VALUES ('edd30ef1-f9fb-453c-958b-7917f472ef01', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '749', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ede397b6-d254-487e-965d-d784a96804de', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '323', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ee3811ca-aca3-4d55-b333-ddb51f000d2b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '280', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('ee3a80bf-4ce0-4eca-a418-795904429589', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '94', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ee413a72-6691-4579-8170-e5d92037b507', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '769', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('eea633b1-d973-451f-a01a-c7f44a5b6f21', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '311', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('eea6bf9a-0bb5-441e-9161-cfc338ed4351', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '344', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('eed81d58-103d-4671-ba57-700cbc61cb5a', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '161', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('eed86c95-9558-41fa-8bd8-6283d296bdb7', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1325', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('eeee37d1-8733-4d24-9110-114c3fece200', '周宏斌', 'pighome', '2020-09-29', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '138232', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('eef6774d-98b3-4ca4-acdb-295518f50b0d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '315', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('ef154d33-0021-44a8-84ef-1fbb67aa8699', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '317', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ef1ab94c-57aa-4d25-b350-9c605759f38c', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '564', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ef2a830b-8785-4703-92fd-623a48d8e55e', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '342', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('ef3ddab0-bead-4d45-a6f3-4bd5c72ffa9c', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '1', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ef833fc4-77d2-4bec-94e2-1082d6202308', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '1252', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('efbb9630-c9c2-4bfc-a40f-9d2625f03619', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getSetmealReport', '0', '[类]com.itheima.controller.PermissionController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('efcb3e75-03aa-49b0-b91e-213f807338ca', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '291', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('efcca3d4-00d5-4933-80d5-417d9d33a5a0', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '495', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('efced211-50f5-44d1-8bc1-801869e688e2', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '196', '[类]com.itheima.controller.SetMealController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('f002043b-d3fc-4dfa-a8a0-d691023b9f5e', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '135', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f01c06bb-f996-43ba-864c-f2199af29e82', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '31', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f0213074-3f5e-4476-9122-2556a7992afa', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '394', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('f024badd-5d42-458b-b60f-2ca7a2627c6d', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '3507', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f063775c-e77e-41b4-964e-256142172333', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '303', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f0d08a3b-f2c9-4e38-a44d-fb1c8bf0d7cb', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '318', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('f0e0df48-91c4-459a-8c55-519048c8317b', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '307', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f0ed7101-9e2f-4caf-b934-f45988176f4a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '0', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('f0fcc158-eaec-4727-86f4-20118d18810f', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f11e2549-f6c5-4fc6-8bcc-0deda4e738c8', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '243', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('f12d5fed-30b4-4493-a05c-95a2a6d42e27', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '325', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f14c11ff-a46a-4851-a230-04afd13b9ab0', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '235', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('f15e4210-13ca-49da-909a-2123db3f5fe2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '347', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f16d5dfa-ef26-4716-8c18-944c8bdb28b3', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '372', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('f20a24c1-9506-431d-8d24-d79f2b7177f0', NULL, NULL, '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '319', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f20f726c-436d-4214-aca5-95afc7eee19b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1894', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f239b537-5819-4163-b5fa-ce50b91865bb', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '19', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f2546e15-b43f-4a5c-a128-c42eb34a69a9', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '257', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('f26f9bf1-ef65-4022-930b-ab249f013116', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/getAllMenus', '3538', '[类]com.itheima.controller.PermissionController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('f271f4f9-a631-4b55-93cf-3b365c1a7f3e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '128', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f2c3e30e-0cfe-4d83-90d5-ee3c192bd5cf', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '182', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f2c5a7a0-86e4-4ce6-af96-7a7cbd78fb4c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '0', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f2e999d1-5656-4bb0-8996-e3b99408a68a', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '340', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f3070f0b-c06a-4379-a979-5a91ce40d467', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '270', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f31e31fe-de1f-4a15-bfea-cc8f9761b99e', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '88', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('f358fd37-2fbf-4839-b29a-343969152734', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1383', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f35fe951-2025-4bdc-9180-9cfe3785dbf9', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1238', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('f3625016-ea1a-42ec-bc56-ab788fde712c', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/add', '671', '[类]com.itheima.controller.RoleController[方法]add');
INSERT INTO `t_syslog` VALUES ('f38294a7-cecc-4658-9c80-a686ee4d5808', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '345', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f38939b5-1376-4981-b37b-523383246132', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '258', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f3951b9b-eae4-4c21-a515-0866ff3e77f2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '214', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('f3ae1169-72b4-4ad4-8679-b510323f6ff9', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '734', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('f3ffb6e4-0c2d-4388-917e-7f7e9edf0c36', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '110', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('f4012da6-7457-4538-9a55-12ce7bba301b', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '220', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('f4206276-26a1-438f-ac13-0c47f6c18d43', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '1973', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('f4324928-bf4b-40e0-901b-835aea5ab65d', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '227', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f466c104-1ff2-41bc-985c-10b96209c2c2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '319', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f4712217-f606-4f88-94e6-79f547f8d8f4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '297', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f4b89b6b-370d-4c50-81d8-fc7ff98caef2', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '872', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('f4c8fdd6-2759-45fa-8278-0e1af81ee745', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f4f0adc8-ef28-49b6-88dd-80931b15ea41', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '332', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f4f9f609-424a-469f-8964-3a1432143b31', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '186', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f50aab80-71d9-4569-9c29-64e5edc8e770', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '206', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('f5389d74-53cd-4468-94ba-32ac5f12e98b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '286', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f5450cbf-4011-4338-8827-b5202e015938', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '228', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f5512662-7116-483b-b42c-0d9774fe3d04', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '43', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f57ff30b-34e3-4e4d-9d91-93dbf56db01d', '万家鑫', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '737', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('f5af3e7c-dfda-415e-ba6f-b70ea54be918', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '962', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f5c24ea5-5fed-4fc6-a330-01c8642a6586', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '265', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('f5e665de-9c95-479a-a42b-13097beefba3', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '1181', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('f5f1035e-31d7-4885-9e3e-2825d556fcc6', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '250', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f619a94a-d75c-453d-8343-e8d291b92da4', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '145', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f6244b3e-264d-4db8-8a34-9673ecdb2710', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '224', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('f6306f34-f771-4e6e-a2a3-77060af50d99', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '377', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('f66a5777-45f0-4bb6-bb31-8beb0986809d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '115', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f66f3258-ba30-4eef-b6f8-6b5d213ee166', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '261', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f69784e1-b586-4591-9635-3a85cdcb792d', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '343', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f6c9f384-ccd5-4102-abb1-ca5a3c882ec6', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '134', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f6df102d-1c8d-4909-bc01-14a833fa70ee', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '259', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f6e7a929-dcb3-4507-922c-5e641dffbc27', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '392', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('f701183e-ffb2-4f81-aef1-cd2c7dad26de', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/add', '1545', '[类]com.itheima.controller.RoleController[方法]add');
INSERT INTO `t_syslog` VALUES ('f70d4714-141f-4a33-81bf-0551e9eab33e', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll', '155', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f71f4d20-0587-4aef-9363-0ba13de30d14', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '180', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f744a1ff-800e-4bee-9488-66ac06769082', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '239', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('f7792a19-e79a-4636-8f89-0ed91ae63b05', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '207', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('f78c5f8c-c6db-4ca1-b72e-5a2c8f3eb471', '仲飞', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '133', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('f7af6dd8-2d6f-4ca5-96db-f3638fd8c96f', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/permission/findAllPermission', '134', '[类]com.itheima.controller.PermissionController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('f7af860c-cd93-4ec3-ab0f-87cc832f6ac6', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '272', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f7cadf20-c728-455e-906a-17352fed6cd4', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '1', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f7df932f-ad8e-4612-ab8e-3c7b3c205b2d', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '107', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('f8217f8d-1d30-447e-b9b8-dfe2e952809b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '153', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f8233757-28c4-4846-8908-c898601d2c26', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '286', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f83a0489-c95e-4099-92e3-37bdee8ddd90', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findAllSetmeal', '228', '[类]com.itheima.controller.SetMealController[方法]findAllSetmeal');
INSERT INTO `t_syslog` VALUES ('f8913e39-ef65-4ff5-bc69-7a4f5322bcc2', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '834', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f8ac49da-ee90-41f1-8ebe-8108506f8b75', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '359', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('f8b4bbc5-d8dc-4bb0-8052-739ab149e7ea', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '305', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('f8beeed9-81dc-4e10-b6c5-fda6484b1641', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '290', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f8d79dc5-5245-48c3-84c3-d4d3f948d0fc', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1401', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f8d7a606-9de6-4c43-8340-b9e72b25ae30', 'admin', 'pighome', '2020-10-02', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '568', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f8fa9cc4-89db-4a29-a9dd-1a186bd27576', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '474', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('f912a3c2-e8f4-44f4-94d4-2c8b47f1e121', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/permission/findAll', '130947', '[类]com.itheima.controller.PermissionController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f923f4de-0b5f-4b77-9645-fe2b6233d37c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '846', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f94ab89c-45b7-406b-bcaf-6e7182aca2ce', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '330', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f9700fc2-6b57-42ec-b5fc-54b2a753b8d5', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '85', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('f973a533-4f03-4270-88a9-cc78de818ea3', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '992', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f973f0ae-2b04-4a1a-8a1d-b13625d10663', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '545', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f974676f-dd5e-4273-bb03-6dc3698f162e', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findRoleIdByUid', '295', '[类]com.itheima.controller.UserController[方法]findRoleIdByUid');
INSERT INTO `t_syslog` VALUES ('f97944c6-2160-44f0-9e38-95f4f3870df1', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '57', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('f9a9f234-906a-44e1-9c96-75f7628718e0', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '225', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('f9b926f6-40b7-401e-a8eb-a71991dde0c5', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/food/findPage', '0', '[类]com.itheima.controller.FoodController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fa1120cb-60b9-425d-8629-35b3adf24e69', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/quit', '606', '[类]com.itheima.controller.UserController[方法]quit');
INSERT INTO `t_syslog` VALUES ('fa23c776-5af3-4860-a86e-ec9c075bbfde', 'xiaoming', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '620', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('fa4a7c9f-7b00-44ac-91fd-151c7805f4e4', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '303', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('fa5716ce-daa6-4be4-b44d-7f6688a51792', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '1141', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('fa64b440-34ae-4db0-b19b-c7ecd0ff6099', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '838', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('fa69165b-93c3-4172-93ee-2b5bf0643e25', '周宏斌', 'pighome', '2020-09-28', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '81', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('fa6ccc49-7d40-42dd-a2c3-0eb2ad09680c', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllMenus', '272', '[类]com.itheima.controller.RoleController[方法]findAllMenus');
INSERT INTO `t_syslog` VALUES ('fa70f186-b786-488c-a5a3-51c35e70bcd8', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/sport/findPage', '172', '[类]com.itheima.controller.SportController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fa774619-1296-494a-aea0-3c8f40cd7b41', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '456', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('fa86c7c4-c5f5-4162-817e-feaf517b5ed4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/getUsername', '2', '[类]com.itheima.controller.PermissionController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('fab5ff3d-96ac-49d7-a7e3-1b9cc17f945a', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '161', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fae09391-a686-45b8-8c07-8b64ade73f2b', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/deleteByIds', '2326', '[类]com.itheima.controller.LogSpuController[方法]deleteByIds');
INSERT INTO `t_syslog` VALUES ('fb0b3d41-e183-4599-8058-31d436d1e370', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '1239', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('fb3f1140-b9fd-40d0-84dd-f57f8530a7b1', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '366', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('fb55536a-ba79-4a1e-a0cc-134c541876d9', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '242', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('fb84a451-acce-4de1-bed2-85145c5934ee', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '367', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fba74ceb-3014-4a44-96cb-3df3e1eb0e6f', 'test', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/report/getBusinessReportData', '353', '[类]com.itheima.controller.ReportController[方法]getBusinessReportData');
INSERT INTO `t_syslog` VALUES ('fbe6d656-71cc-4707-aaba-b650d4eed248', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '262', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('fbf5e248-e57b-4632-9cf3-fbe2dbf00ed0', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getOrderReport', '0', '[类]com.itheima.controller.ReportController[方法]report');
INSERT INTO `t_syslog` VALUES ('fc3af68c-8fd4-4bf9-ab04-cbb2154dd904', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '1711', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fc587ae7-946f-498a-9ec2-5c3a782f8d99', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '298', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fc6d2d78-d9f9-4ebd-b3ae-1f52a58f7c4d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '237', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('fc81152c-b0dd-4b6d-ad2e-7ef71dc3cf8d', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '80', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('fcc18811-5ecf-485b-b6c4-64792b0f2eb4', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '110', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fcdaf7f3-6b69-4095-a881-7e81b625b55c', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '283', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fd283520-161a-4c45-835b-bbf75a2ad4c5', '刘浩亮', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/permission/findPage', '294', '[类]com.itheima.controller.PermissionController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fd390ccc-5509-4830-9bd9-9e5971e43468', 'admin', 'pighome', '2020-10-06', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '123', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fd6b1988-6baa-43aa-8831-3b005c2d0cbb', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '231', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('fd9174af-66ab-4922-9fc1-44391d36b937', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '119', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('fd96cd05-0bd6-4dc8-bbe7-59b761f521fc', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findAllPermission', '274', '[类]com.itheima.controller.RoleController[方法]findAllPermission');
INSERT INTO `t_syslog` VALUES ('fd97815b-78a5-4d91-ae3f-7470db772f62', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/user/edit', '87', '[类]com.itheima.controller.UserController[方法]edit');
INSERT INTO `t_syslog` VALUES ('fdce7034-562f-4aaf-a5ce-40066bf48593', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('fdf79452-c9b3-46eb-a471-c8e6977c2dc5', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/menu/findAllMenu', '75', '[类]com.itheima.controller.MenuController[方法]findAllMenu');
INSERT INTO `t_syslog` VALUES ('fe52d57b-0905-4674-94ea-576db770f364', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '307', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('fe5300de-5c6d-4bfa-b94d-a684a6b17830', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPermissionIdByrid', '252', '[类]com.itheima.controller.RoleController[方法]findPermissionIdByrid');
INSERT INTO `t_syslog` VALUES ('fe7cd82c-143d-42c0-a2cd-7e6feb2ebf49', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '9477', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('feab860b-ec9a-40cd-80a8-9285b60aeb84', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '320', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('feb0dd3b-0b75-4278-ad10-fbdaff5116b7', '李茂文', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/ordersetting/getOrderSettingByMonth', '218', '[类]com.itheima.controller.OrderSettingController[方法]getOrderSettingByMonth');
INSERT INTO `t_syslog` VALUES ('fedc1d95-c05c-4ee9-87cc-67b51a34b668', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findAllRoles', '216', '[类]com.itheima.controller.UserController[方法]findAllRoles');
INSERT INTO `t_syslog` VALUES ('fef192f7-14d2-4560-bf11-18fbd5818484', 'admin', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '91', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ff05f0d0-eebf-4e31-83b0-521714e9e86e', 'admin', 'pighome', '2020-09-26', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '3645', '[类]com.itheima.controller.CheckItemController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('ff09159b-ac9e-426c-84c1-ee45caf96e39', '孙志伟', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/report/getSetmealReport', '232', '[类]com.itheima.controller.ReportController[方法]getSetmealReport');
INSERT INTO `t_syslog` VALUES ('ff19e9b3-94a6-4d92-ae4a-31c1f7a163a8', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '335', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ff286b7b-ccc2-4882-90b8-5757f0f3fd8d', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '141', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ff2ad3d8-27d3-40ab-b050-a17f8cbffc6b', 'test', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '419', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ff2baaeb-bf24-4166-ad11-0cdb813d7606', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findMemberById', '258', '[类]com.itheima.controller.MemberController[方法]findMemberById');
INSERT INTO `t_syslog` VALUES ('ff7f62f7-cd20-4137-9c00-61360604ef3c', '陈博', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/member/findPage', '0', '[类]com.itheima.controller.MemberController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('ffad471d-2d61-4e87-a9d0-94c97a54d86d', '周宏斌', 'pighome', '2020-09-27', NULL, '0:0:0:0:0:0:0:1', '/checkitem/findAll', '1488', '[类]com.itheima.controller.CheckItemController[方法]findAll');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` date NULL DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `station` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, NULL, NULL, 'admin', '$2a$10$BZPjhWKVupE109YC9iDVMOI1ARqJULxOirr57OR7AJwHmvElk5N7u', NULL, '1', NULL);
INSERT INTO `t_user` VALUES (2, NULL, NULL, 'xiaoming', '$2a$10$3xW2nBjwBM3rx1LoYprVsemNri5bvxeOd/QfmO7UDFQhW2HRHLi.C', NULL, '1', NULL);
INSERT INTO `t_user` VALUES (3, NULL, NULL, 'test', '$2a$10$sYnPAadtZw5LGZF7uSaV2.pgZjYO8XN/fYK72..21BEGnDz.8Vj1.', NULL, '0', NULL);
INSERT INTO `t_user` VALUES (4, '2020-09-01', '0', '仲飞', '$2a$10$rIML9.fC3MK6IatXVH7py.M0WMDxGksyBZln4MWwUZbhUiM6T81Da', NULL, '1', '13812345678');
INSERT INTO `t_user` VALUES (5, '2020-09-23', '0', '陈博', '$2a$10$e.O2inV580v8McPN78gq8ed4gtxwdRTIs0MgV6SgyKIoCG5hQp25m', '会员管理员', '0', '12312311231');
INSERT INTO `t_user` VALUES (6, '2020-09-20', '0', '刘浩亮', '$2a$10$jb9z/tsEX8PMuMz8kDOI0.EbZ2g81UCmMRdQzbNx2Ie3UywJITvVi', 'pighome健康推广大使', '0', '13312312344');
INSERT INTO `t_user` VALUES (7, '2020-09-20', '0', '孙志伟', '$2a$10$TUStlX4sF1qmVW5LHouFNuVrWh2d.24mlsKYSoUNLn2y5fKRZeJ4C', '数据报表管理员', '0', '13833333333');
INSERT INTO `t_user` VALUES (8, '2020-09-14', '0', '李茂文', '$2a$10$5mf/1thIBe.3Ss4znRP1L.YDrg2ZWveyeqr7ePmWC5aqmORrqQRTa', '健康管理', '0', '13855555555');
INSERT INTO `t_user` VALUES (11, '2020-09-21', '0', '万家鑫', '$2a$10$nznm.V/ODWFULyXz..Oe5OTBWYXp.EBzdVdK.RD/AMUJ2/1e6nN4a', 'HR', '0', '12321414322');
INSERT INTO `t_user` VALUES (15, '2020-09-14', '1', '122', '$2a$10$29FYbVmNuo82qw2DtA0Ty.Oqh5NyEHbfMnxkad17v/Lu0SoCqXl4q', '12', '0', '21');
INSERT INTO `t_user` VALUES (16, '2011-09-20', '1', '周宏斌', '$2a$10$VbUjM7tjrzv9vWtSzxVvQuKmlgvMr0ovztfi4m80aE8YA5mhQU0Sm', '后台系统管理员', '1', '15855424029');
INSERT INTO `t_user` VALUES (17, '2020-09-30', '1', '秀姐', '$2a$10$w/LhDC/iTvSYETy9OLFL.us4I0Nicw7C/uLbdz5.Klu9MnM/5Zava', NULL, '0', '19856506030');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK_Reference_8`(`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (3, 1);
INSERT INTO `t_user_role` VALUES (3, 3);
INSERT INTO `t_user_role` VALUES (4, 7);
INSERT INTO `t_user_role` VALUES (16, 14);
INSERT INTO `t_user_role` VALUES (5, 15);
INSERT INTO `t_user_role` VALUES (6, 16);
INSERT INTO `t_user_role` VALUES (7, 17);
INSERT INTO `t_user_role` VALUES (11, 18);
INSERT INTO `t_user_role` VALUES (8, 19);
INSERT INTO `t_user_role` VALUES (5, 20);
INSERT INTO `t_user_role` VALUES (7, 20);
INSERT INTO `t_user_role` VALUES (8, 20);
INSERT INTO `t_user_role` VALUES (11, 20);

SET FOREIGN_KEY_CHECKS = 1;
