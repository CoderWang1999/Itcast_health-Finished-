/*
 Navicat Premium Data Transfer

 Source Server         : CoderWang
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 192.168.23.129:3306
 Source Schema         : health

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 21/10/2020 21:33:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for break
-- ----------------------------
DROP TABLE IF EXISTS `break`;
CREATE TABLE `break`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of break
-- ----------------------------
INSERT INTO `break` VALUES (5, '入职无忧体检套餐（男女通用）', '0001', 'RZTJ', '0', '18-60', 300, '入职体检套餐', NULL, '6ed05c1a-5397-4552-9129-3682b18c9f455.jpg');
INSERT INTO `break` VALUES (6, '粉红珍爱(女)升级TM12项筛查体检套餐', '0002', 'FHZA', '2', '18-60', 1200, '本套餐针对宫颈(TCT检查、HPV乳头瘤病毒筛查）、乳腺（彩超，癌抗125），甲状腺（彩超，甲功验血）以及胸片，血常规肝功等有全面检查，非常适合女性全面疾病筛查使用。', NULL, '3995c770-b78e-4f4b-b1cb-5ecced9f00562.jpg');
INSERT INTO `break` VALUES (7, '阳光爸妈升级肿瘤12项筛查（男女单人）体检套餐', '0003', 'YGBM', '0', '55-100', 1400, '本套餐主要针对常见肿瘤筛查，肝肾、颈动脉、脑血栓、颅内血流筛查，以及风湿、颈椎、骨密度检查。', NULL, 'd70741da-5283-452f-8e12-baaf62fa90e30.jpg');
INSERT INTO `break` VALUES (12, '', '', '', '', '', NULL, '', '', '');
INSERT INTO `break` VALUES (13, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `break` VALUES (14, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '');

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
INSERT INTO `t_address` VALUES (4, '合肥第二人民医院', '1731111111', '117.278028,31.878349', '7cbc9520-5107-43fc-856e-02c08d4973fb.jpg', NULL, '安徽省合肥市庐阳区阜南西路238号');
INSERT INTO `t_address` VALUES (6, '第三医院', '17356535908', '117.315828,31.760817', '18393cb2-91ea-4a8a-ad57-3baa31f70a4d.jpg', NULL, '安徽省合肥市包河区');
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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_checkgroup
-- ----------------------------
INSERT INTO `t_checkgroup` VALUES (5, '0001', '一般检查', 'YBJC', '0', '一般检查', '无');
INSERT INTO `t_checkgroup` VALUES (6, '0002', '视力色觉', 'SLSJ', '0', '视力色觉', NULL);
INSERT INTO `t_checkgroup` VALUES (7, '0003', '血常规', 'XCG', '0', '血常规', NULL);
INSERT INTO `t_checkgroup` VALUES (8, '0004', '尿常规', 'NCG', '0', '尿常规', NULL);
INSERT INTO `t_checkgroup` VALUES (9, '0005', '肝功三项', 'GGSX', '0', '肝功三项', NULL);
INSERT INTO `t_checkgroup` VALUES (10, '0006', '肾功三项', 'NGSX', '0', '肾功三项', NULL);
INSERT INTO `t_checkgroup` VALUES (11, '0007', '血脂四项', 'XZSX', '0', '血脂四项', NULL);
INSERT INTO `t_checkgroup` VALUES (12, '0008', '心肌酶三项', 'XJMSX', '0', '心肌酶三项', NULL);
INSERT INTO `t_checkgroup` VALUES (13, '0009', '甲功三项', 'JGSX', '0', '甲功三项', NULL);
INSERT INTO `t_checkgroup` VALUES (14, '0010', '子宫附件彩超', 'ZGFJCC', '2', '子宫附件彩超', NULL);
INSERT INTO `t_checkgroup` VALUES (15, '0011', '胆红素三项', 'DHSSX', '0', '胆红素三项', NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 37);
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
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 57);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 58);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 59);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 60);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 61);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 62);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 63);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 64);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 65);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 66);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 67);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 68);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 69);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 70);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 71);
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
INSERT INTO `t_checkgroup_checkitem` VALUES (14, 88);
INSERT INTO `t_checkgroup_checkitem` VALUES (14, 89);
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
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `t_checkitem` VALUES (37, '0010', '色觉', '0', '0-100', 5, '1', '无', '色觉');
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
INSERT INTO `t_checkitem` VALUES (88, '0061', '子宫', '2', '0-100', 10, '2', NULL, '子宫');
INSERT INTO `t_checkitem` VALUES (89, '0062', '附件', '2', '0-100', 10, '2', NULL, '附件');
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
  `healthmanager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES (82, '8848', '小明', '1', '123456789000999999', '18811679442', '2019-03-08', NULL, NULL, NULL, NULL, '仲飞');
INSERT INTO `t_member` VALUES (83, '2341', '王美丽', '2', '132333333333333', '13412345678', '2019-03-11', NULL, NULL, '1999-10-05', '', '仲飞');
INSERT INTO `t_member` VALUES (86, '34123', '徐熙', '2', '1234124321342134', '13988888888', '2019-04-04', NULL, NULL, '2020-10-12', '', '盛杰');
INSERT INTO `t_member` VALUES (89, '1212', '任晨', '1', '1212122341234123', '13912345678', '2018-12-01', NULL, NULL, '2020-10-20', NULL, '盛杰');
INSERT INTO `t_member` VALUES (90, NULL, NULL, NULL, NULL, NULL, '2018-12-02', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (93, '1123', '廖代', '1', '123423423423423', '18155719219', '2020-10-20', NULL, NULL, '2020-10-11', 'no', '盛杰');
INSERT INTO `t_member` VALUES (94, '123421', '小狗子', '2', '3452345234521234', '13411111111', '2020-10-20', NULL, NULL, '2020-10-05', '1234124', '秀姐');

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
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`parentMenuId`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `t_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `t_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`setmeal_id`) REFERENCES `break` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (2, 83, '2020-09-17', '电话预约', '已到诊', 13, '香蕉,苹果', '背部拉伸', 'admin', '564456', NULL);
INSERT INTO `t_order` VALUES (3, 84, '2020-09-17', '电话预约', '未到诊', 14, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (15, 82, '2020-09-22', '微信预约', '已到诊', 13, '香蕉,火龙果', '跑步', '李茂文', 'test', NULL);
INSERT INTO `t_order` VALUES (16, 83, '2020-09-23', '电话预约', '已到诊', 14, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (17, 84, '2020-09-25', '微信预约', '已到诊', 13, '苹果,香蕉', '背部拉伸,碾压脊柱', 'admin', 'aaa', NULL);
INSERT INTO `t_order` VALUES (19, 86, '2020-09-26', '微信预约', '已到诊', 15, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (23, 90, '2020-09-28', '电话预约', '未到诊', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (86, 111, '2020-09-30', '电话预约', '已到诊', 12, '苹果,香蕉,葡萄', '背部拉伸,碾压脊柱', 'test', '12321321321', NULL);
INSERT INTO `t_order` VALUES (88, 113, '2020-09-27', '微信预约', '未到诊', 12, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (89, 114, '2020-09-29', '电话预约', '已到诊', 13, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (93, 101, '2020-09-27', '微信预约', '已到诊', 13, '苹果,香蕉', '背部拉伸,碾压脊柱', 'test', 'vvvv', NULL);
INSERT INTO `t_order` VALUES (95, 94, '2020-10-21', '电话预约', '未到诊', NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ordersetting
-- ----------------------------
INSERT INTO `t_ordersetting` VALUES (13, '2019-03-04', 100, 100);
INSERT INTO `t_ordersetting` VALUES (14, '2019-03-05', 200, 0);
INSERT INTO `t_ordersetting` VALUES (15, '2019-03-06', 300, 0);
INSERT INTO `t_ordersetting` VALUES (16, '2019-03-07', 200, 0);
INSERT INTO `t_ordersetting` VALUES (17, '2019-03-08', 200, 1);
INSERT INTO `t_ordersetting` VALUES (18, '2019-03-09', 200, 0);
INSERT INTO `t_ordersetting` VALUES (19, '2019-03-10', 200, 0);
INSERT INTO `t_ordersetting` VALUES (20, '2019-03-11', 200, 3);
INSERT INTO `t_ordersetting` VALUES (21, '2019-03-13', 300, 1);
INSERT INTO `t_ordersetting` VALUES (22, '2019-03-14', 600, 0);
INSERT INTO `t_ordersetting` VALUES (23, '2019-03-15', 500, 1);
INSERT INTO `t_ordersetting` VALUES (24, '2019-03-16', 500, 0);
INSERT INTO `t_ordersetting` VALUES (25, '2019-03-17', 400, 0);
INSERT INTO `t_ordersetting` VALUES (26, '2019-03-19', 300, 1);
INSERT INTO `t_ordersetting` VALUES (27, '2019-04-01', 300, 0);
INSERT INTO `t_ordersetting` VALUES (28, '2019-04-02', 300, 0);
INSERT INTO `t_ordersetting` VALUES (29, '2019-04-19', 300, 0);
INSERT INTO `t_ordersetting` VALUES (30, '2019-03-20', 200, 1);
INSERT INTO `t_ordersetting` VALUES (31, '2019-05-01', 400, 0);
INSERT INTO `t_ordersetting` VALUES (32, '2019-03-28', 200, 1);
INSERT INTO `t_ordersetting` VALUES (33, '2019-04-03', 400, 0);
INSERT INTO `t_ordersetting` VALUES (34, '2019-09-30', 800, 0);
INSERT INTO `t_ordersetting` VALUES (35, '2019-04-04', 400, 0);
INSERT INTO `t_ordersetting` VALUES (36, '2019-04-05', 300, 0);
INSERT INTO `t_ordersetting` VALUES (37, '2020-10-21', 11111, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', 'ROLE_ADMIN', NULL);
INSERT INTO `t_role` VALUES (3, '安全管理大师', 'SAFE_SYSTEM', '国家6A认证');
INSERT INTO `t_role` VALUES (7, '健康管理师', 'HEALTH_MANAGER', '2');
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
  CONSTRAINT `t_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK_Reference_12`(`permission_id`) USING BTREE,
  CONSTRAINT `t_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_setmeal
-- ----------------------------
INSERT INTO `t_setmeal` VALUES (12, '入职无忧体检套餐（男女通用）', '0001', 'RZTJ', '0', '18-60', 300, '入职体检套餐', NULL, 'd3cd86d0-d23b-4aaf-ae1b-862cdc98658b8.jpg');
INSERT INTO `t_setmeal` VALUES (13, '粉红珍爱(女)升级TM12项筛查体检套餐', '0002', 'FHZA', '2', '18-60', 1200, '本套餐针对宫颈(TCT检查、HPV乳头瘤病毒筛查）、乳腺（彩超，癌抗125），甲状腺（彩超，甲功验血）以及胸片，血常规肝功等有全面检查，非常适合女性全面疾病筛查使用。', NULL, '455d86cc-e808-41e8-a09f-ba4576916288.jpg');
INSERT INTO `t_setmeal` VALUES (14, '阳光爸妈升级肿瘤12项筛查（男女单人）体检套餐', '0003', 'YGBM', '0', '55-100', 1400, '本套餐主要针对常见肿瘤筛查，肝肾、颈动脉、脑血栓、颅内血流筛查，以及风湿、颈椎、骨密度检查', NULL, 'bd5c4e29-6c92-4e42-9374-8bc83b4f32a41.jpg');
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
  CONSTRAINT `t_setmeal_checkgroup_ibfk_1` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_setmeal_checkgroup_ibfk_2` FOREIGN KEY (`setmeal_id`) REFERENCES `t_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
INSERT INTO `t_syslog` VALUES ('0c740861-a09e-4ee4-bee0-030da5f84ee2', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('0ec26ce1-b0d2-44fc-97cf-3869ddcb3b37', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '4', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('1005a8a6-aa17-497a-a00a-a686a8a9b4d7', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findUpdate', '5', '[类]com.itheima.controller.AddressController[方法]findUpdate');
INSERT INTO `t_syslog` VALUES ('11a9ee6a-e3e8-4a86-8218-d0ba92e2e721', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage.do', '5', '[类]com.itheima.controller.CheckitemController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('180caede-fb32-4854-8e14-9e575c8b2cc1', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/setmealupload', '105', '[类]com.itheima.controller.SetmealController[方法]upload');
INSERT INTO `t_syslog` VALUES ('1d393806-1f0c-43b8-afa6-410aaf4d8b60', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '8', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('1fb53ab7-8abf-4965-9364-b5502f9d2ed8', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/role/findPage', '20', '[类]com.itheima.controller.RoleController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('205b43fc-9e89-44cf-9d41-e0baffde46cf', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '7', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('23f618f8-c6e2-4565-81c7-e08114663e0f', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/upload', '106', '[类]com.itheima.controller.AddressController[方法]upload');
INSERT INTO `t_syslog` VALUES ('2a1aef5c-1b43-43a7-bb97-f85a759ad0ff', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '5', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('2a6afa8d-a85e-48f8-9839-8351bbfdfee5', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '20', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('2e1489e0-94fa-4e5a-8a84-393fd7c5f05e', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage.do', '3', '[类]com.itheima.controller.CheckitemController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('2f83b714-a0f2-4d16-a8e5-12eaebc9c21a', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage.do', '15', '[类]com.itheima.controller.CheckitemController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('360ae6ca-4199-40e5-989a-098e0916bd51', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('3fcf8c18-e480-42ef-b4e7-38d9ccfb758d', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/upload', '159', '[类]com.itheima.controller.AddressController[方法]upload');
INSERT INTO `t_syslog` VALUES ('4136f93c-d434-4244-9b6f-b0aa6d358108', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/menu/findPage', '51', '[类]com.itheima.controller.MenuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('43831177-8d7c-4903-920e-e70664b909c7', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('45094ab0-8843-4343-ae6d-f938e5b34568', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('46cea63e-4f97-422d-9218-d97311e81490', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '7', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('4936b811-d3b9-49f1-a18f-a48605928b90', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.itheima.controller.SetmealController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('50a92cbd-c750-45e4-b9d7-18e9eb92e1d9', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('5980faba-3e1c-4370-9185-6774026735a8', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage.do', '7', '[类]com.itheima.controller.CheckitemController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('69860d8e-8069-455a-b214-907289e4adbd', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '6', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('6a1283f4-2af7-4922-a2e1-aad3ce12bf48', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('6bf158b8-6d17-4dd0-83fc-782973e0f569', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('6caa9cb5-8870-4de9-9013-9710b2e20f01', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.itheima.controller.SetmealController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7a4767e1-ffe2-4db9-88ea-101b706a4fbf', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('7a50f983-6311-4ea1-bdea-56608062fe8a', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '8', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('7c2f91e9-2e54-4626-9e02-ded10f7e8c98', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '6', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('7c8c5d28-4f0d-4718-a1bf-abf66f5647a4', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '4', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('84a8da49-1395-4a88-b3b1-3ae70a525bab', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findUpdate', '13', '[类]com.itheima.controller.AddressController[方法]findUpdate');
INSERT INTO `t_syslog` VALUES ('87205ce7-ca57-4436-a5a7-12d4c2948804', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '4', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('93fcdd3c-fed5-4e09-ab8b-7e12301f4c73', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('968c3012-504d-4d35-87a4-f0535c7a4821', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('9c8af0f4-0a73-4ada-bf88-15f2c3776efc', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/user/findPage', '6', '[类]com.itheima.controller.UserController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('a6f711b5-6d75-4943-9d19-4c20b0bcc370', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '7', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b327c1a7-3832-4514-b3d6-ef7734d0d6b7', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/spuLog/findAll', '6', '[类]com.itheima.controller.LogSpuController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b3813924-2cef-4892-a4c7-abe7c69f4eb5', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '9', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b583aaab-9708-4203-a1d5-82bda140fcbb', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '4', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('b5e4f2f5-111c-4889-8e0c-750aba8bfc8a', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findIdInMiddleTable', '4', '[类]com.itheima.controller.SetmealController[方法]findIdInMiddleTable');
INSERT INTO `t_syslog` VALUES ('b634cefb-94c7-4225-a6a3-58411115d537', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.itheima.controller.SetmealController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('b9f79c6d-732f-4311-9fb8-f873148990ef', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '9', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('be69ce63-b66b-4208-b510-d6e2c0b24348', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/setmeal/edit', '53', '[类]com.itheima.controller.SetmealController[方法]edit');
INSERT INTO `t_syslog` VALUES ('bead5f26-7269-4c02-acc7-04018c13b38c', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findPage.do', '5', '[类]com.itheima.controller.CheckGroupController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('bf99c5c4-bf13-4f68-ab8e-0d9e196bef08', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '6', '[类]com.itheima.controller.AddressController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('c1a39540-874a-4e64-a3b7-1252d7146190', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '20', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('c1f2cc4d-1af8-485e-9a49-b62b0295bd3b', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/edit', '5', '[类]com.itheima.controller.AddressController[方法]edit');
INSERT INTO `t_syslog` VALUES ('c35a6391-d0dd-4799-b0df-142bbccdd24a', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('c66f71b5-7da7-4632-a853-598de6eea903', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/sport/findAllSport', '19', '[类]com.itheima.controller.SportController[方法]findAllSport');
INSERT INTO `t_syslog` VALUES ('c68068cf-cdb3-4397-b5a8-475b00184803', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findUpdate', '7', '[类]com.itheima.controller.AddressController[方法]findUpdate');
INSERT INTO `t_syslog` VALUES ('c8cce4df-3fad-466b-9c40-be07b2030c70', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/setmeal/findPage', '5', '[类]com.itheima.controller.SetmealController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('cbed1c55-e8f9-431d-a444-0de56ea0c2e2', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('cd36a9ca-a23e-47c1-8b59-b4e22700e802', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '5', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('cf9930cd-0276-445e-8e86-5c094ad3207d', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitem/delete.do', '5', '[类]com.itheima.controller.CheckitemController[方法]deltetByid');
INSERT INTO `t_syslog` VALUES ('d157f18b-a74f-49ea-b440-edd2657492f1', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage.do', '5', '[类]com.itheima.controller.CheckitemController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('d2e74755-a633-45e3-af69-3caf970e7e91', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('d9b33bbf-7365-474b-9510-7119e83ebddb', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitemfindPage.do', '6', '[类]com.itheima.controller.CheckitemController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('e254d201-ecf2-4367-9133-673f2c468cef', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e436046c-375e-4476-87fa-d644ff5e7f6b', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '6', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('e4cff08f-b3b2-4505-82ed-e64e9e892aa0', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/order/findByPageAndCondition', '7', '[类]com.itheima.controller.OrderController[方法]findByPageAndCondition');
INSERT INTO `t_syslog` VALUES ('ef9a1a2d-4209-4601-a42a-d2d13a91b9e7', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/edit', '6', '[类]com.itheima.controller.AddressController[方法]edit');
INSERT INTO `t_syslog` VALUES ('f14fdca0-baee-4d49-944b-200a8c15d95d', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkgroup/findAll.do', '3', '[类]com.itheima.controller.CheckGroupController[方法]findAll');
INSERT INTO `t_syslog` VALUES ('f7f7cb3a-a9b4-4b9c-94a4-af8416416aec', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/user/getAllMenus', '108', '[类]com.itheima.controller.UserController[方法]getAllMenus');
INSERT INTO `t_syslog` VALUES ('f826e764-c345-47f0-894d-e2817f9cd3ca', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '6', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f850cbab-0d02-4566-8a77-67b8546668d3', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findPage', '5', '[类]com.itheima.controller.AddressController[方法]findPage');
INSERT INTO `t_syslog` VALUES ('f8f3e93c-352e-4b0e-b486-9e1275221b6a', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/user/getUsername', '0', '[类]com.itheima.controller.UserController[方法]getUsername');
INSERT INTO `t_syslog` VALUES ('faf4dfd3-7b7e-4517-a71b-5c630fcdf5c7', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/checkitem/add.do', '5', '[类]com.itheima.controller.CheckitemController[方法]add');
INSERT INTO `t_syslog` VALUES ('fcfd7af0-e94f-4bd8-b5c0-9effd756a363', 'admin', 'pighome', '2020-10-21', NULL, '0:0:0:0:0:0:0:1', '/address/findAll', '4', '[类]com.itheima.controller.AddressController[方法]findAll');

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '1999-04-07', '0', 'admin', '$2a$10$LPbhiutR34wKvjv3Qb8zBu7piw5hG3.IlQMAI3e/D1Y0DJ/mMSkYa', '超级管理员', '1', '18188888888');
INSERT INTO `t_user` VALUES (4, '2020-09-01', '0', '仲飞', '$2a$10$rIML9.fC3MK6IatXVH7py.M0WMDxGksyBZln4MWwUZbhUiM6T81Da', 'Big bos', '1', '13812345678');
INSERT INTO `t_user` VALUES (5, '2020-09-23', '0', '陈博', '$2a$10$e.O2inV580v8McPN78gq8ed4gtxwdRTIs0MgV6SgyKIoCG5hQp25m', '会员管理员', '0', '12312311231');
INSERT INTO `t_user` VALUES (6, '2020-09-20', '0', '刘浩亮', '$2a$10$jb9z/tsEX8PMuMz8kDOI0.EbZ2g81UCmMRdQzbNx2Ie3UywJITvVi', 'pighome健康推广大使', '0', '13312312344');
INSERT INTO `t_user` VALUES (7, '2020-09-20', '0', '孙志伟', '$2a$10$TUStlX4sF1qmVW5LHouFNuVrWh2d.24mlsKYSoUNLn2y5fKRZeJ4C', '数据报表管理员', '0', '13833333333');
INSERT INTO `t_user` VALUES (8, '2020-09-14', '0', '李茂文', '$2a$10$5mf/1thIBe.3Ss4znRP1L.YDrg2ZWveyeqr7ePmWC5aqmORrqQRTa', '健康管理', '0', '13855555555');
INSERT INTO `t_user` VALUES (11, '2020-09-21', '0', '万家鑫', '$2a$10$nznm.V/ODWFULyXz..Oe5OTBWYXp.EBzdVdK.RD/AMUJ2/1e6nN4a', 'HR', '0', '12321414322');
INSERT INTO `t_user` VALUES (16, '2011-09-20', '1', '周宏斌', '$2a$10$VbUjM7tjrzv9vWtSzxVvQuKmlgvMr0ovztfi4m80aE8YA5mhQU0Sm', '后台系统管理员', '1', '15855424029');
INSERT INTO `t_user` VALUES (17, '2020-09-30', '1', '秀姐', '$2a$10$w/LhDC/iTvSYETy9OLFL.us4I0Nicw7C/uLbdz5.Klu9MnM/5Zava', '班主任', '1', '19856506030');
INSERT INTO `t_user` VALUES (18, '1999-03-10', '1', '盛杰', '$2a$10$9T01nXkWHx9La/fOf1wm3OfPmGcZc04t3tP/w4LdIa4TjTmUaZB/K', '健康管理大师', NULL, '18988888888');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK_Reference_8`(`role_id`) USING BTREE,
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (4, 7);
INSERT INTO `t_user_role` VALUES (17, 7);
INSERT INTO `t_user_role` VALUES (18, 7);
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
