/*
 Navicat Premium Data Transfer

 Source Server         : CHAOS_MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50703
 Source Host           : localhost:3306
 Source Schema         : teen

 Target Server Type    : MySQL
 Target Server Version : 50703
 File Encoding         : 65001

 Date: 29/05/2019 11:42:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `movie_id` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activity_id` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('10011', '致我们暖暖的小时光', '3');
INSERT INTO `activity` VALUES ('10012', '绅探', '3');
INSERT INTO `activity` VALUES ('10013', '都挺好', '3');
INSERT INTO `activity` VALUES ('10014', '我只喜欢你', '3');
INSERT INTO `activity` VALUES ('10015', '封神榜', '3');
INSERT INTO `activity` VALUES ('10019', '权力的游戏（第八季）', '1');
INSERT INTO `activity` VALUES ('10020', '爱，死亡，机器人', '1');
INSERT INTO `activity` VALUES ('10021', '魔法师（第四季）', '1');
INSERT INTO `activity` VALUES ('10022', '绑定（第一季）', '1');
INSERT INTO `activity` VALUES ('10023', '性爱自修室', '1');
INSERT INTO `activity` VALUES ('10024', '我，到点下班', '2');
INSERT INTO `activity` VALUES ('10025', '昨日的美食', '2');
INSERT INTO `activity` VALUES ('10026', '别扭合租房', '2');
INSERT INTO `activity` VALUES ('10027', '非自然死亡', '2');
INSERT INTO `activity` VALUES ('10028', '轮到你了', '2');

-- ----------------------------
-- Table structure for activity_map
-- ----------------------------
DROP TABLE IF EXISTS `activity_map`;
CREATE TABLE `activity_map`  (
  `activity_id` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activity_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of activity_map
-- ----------------------------
INSERT INTO `activity_map` VALUES ('1', '热门美剧');
INSERT INTO `activity_map` VALUES ('2', '最新日剧');
INSERT INTO `activity_map` VALUES ('3', '国产热剧');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `movie_id` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('10001', '比悲伤更悲伤的故事', 'http://mydatabase.com/banner/BLUE2.jpg');
INSERT INTO `banner` VALUES ('10006', '我的英雄学院', 'http://mydatabase.com/banner/MYHERO.jpg');
INSERT INTO `banner` VALUES ('10029', '惊奇队长', 'http://mydatabase.com/banner/captain_marvel.jpg');

-- ----------------------------
-- Table structure for collect_movie
-- ----------------------------
DROP TABLE IF EXISTS `collect_movie`;
CREATE TABLE `collect_movie`  (
  `movie_id` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collect_movie
-- ----------------------------
INSERT INTO `collect_movie` VALUES ('10019', '100523');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `movie_id` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_time` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('10005', '100523', '这是一条测试评论', '2019-05-11');
INSERT INTO `comment` VALUES ('10005', '100523', '笨蛋爱上天才，会有结果吗？平凡女孩原湘琴（林允饰）喜欢上了天才少年江直树（王大陆饰），在她表白失败准备放弃之际，爸爸居然带着自己搬进了直树家里？！一个猛追，一个猛逃，热闹欢腾的纯真高中生活就此上演。朝夕相处中，直树渐渐被湘琴乐观的无畏精神吸引，他开始怀疑：湘琴究竟是人生偏差、还是自己的命中注定?', '2019-05-10');
INSERT INTO `comment` VALUES ('10005', '100524', '这个电影也太无聊了吧，改变不是乱编，差评', '2019-05-02');
INSERT INTO `comment` VALUES ('100523', '100045', 'dddddddddddddddddddddddd', '2019-05-25');
INSERT INTO `comment` VALUES ('100523', '1000', 'dddddddddddddddddddddddd', '2019-05-25');
INSERT INTO `comment` VALUES ('100523', '10019', 'dddddddddddddddddddddddd', '2019-05-25');
INSERT INTO `comment` VALUES ('100523', '10019', 'dddddddddddddddddddddddd', '2019-05-25');
INSERT INTO `comment` VALUES ('10019', '100523', 'dddddddddddddddddddddddd', '2019-05-25');
INSERT INTO `comment` VALUES ('10019', '100523', 'dddddddddddddddddddddddd', '2019-05-25');
INSERT INTO `comment` VALUES ('10019', '100523', '这个电影也挺好看的，我很喜欢，嘻嘻嘻嘻嘻，好好好好o(￣▽￣)ｄ（*^▽^*)w(ﾟДﾟ)w', '2019-05-25');
INSERT INTO `comment` VALUES ('10020', '100523', '123123123123', '2019-05-25');
INSERT INTO `comment` VALUES ('10020', '100523', '好看的呀！真真好看', '2019-05-25');
INSERT INTO `comment` VALUES ('10020', '100523', '123123123123', '2019-05-25');
INSERT INTO `comment` VALUES ('10004', 'ced65e6c4ea20b85a47aa7bbda7f0569', '4444444444444444444444', '2019-05-26');
INSERT INTO `comment` VALUES ('10020', 'ced65e6c4ea20b85a47aa7bbda7f0569', '123123123', '2019-05-26');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `movie_id` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10011',
  `movie_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_des` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_tags` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_slogan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appear_time` date NULL DEFAULT NULL,
  `movie_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` float(2, 1) NULL DEFAULT NULL,
  `trailer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('10001', '比悲伤更悲伤的故事', 'http://mydatabase.com/movie/c10010.jpg', '唱片制作人张哲凯(刘以豪)和王牌作词人宋媛媛(陈意涵)相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有 成温柔体贴的医生(张书豪)适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤......', '感动,牛逼,哭了三分之一,爱,6666', '唯一观影建议：请带着纸巾', '2019-04-25', '电影 / 动画', 8.2, NULL);
INSERT INTO `movie` VALUES ('10002', '小偷家族', 'http://mydatabase.com/movie/j10007.jpg', '东京的都市丛林中央，残存着一栋古旧寒酸的老房子，这里局促地生活着柴田一家五口人。在工地当临时工的男人阿治（Lily Franky 饰）经常带着儿子祥太（城桧吏 饰）到超市盗窃生活用品，这一天，他们回家路上遇到了独自待在户外的四岁女孩由里（佐佐木美结 饰）。妻子信代（安藤樱 饰）起初极力主张将女孩送回父母身边，但当看到女孩原生家庭的状况时又心生恻隐。原本柴田家就靠着老奶奶初枝（树木希林 饰）的养老金度日，而今多了一口人，自然更艰辛了几分。包括信代的妹妹亚纪（松冈茉优 饰）在内，虽然一家人游走在贫困和违法的边缘，但笃深的羁绊将他们紧紧联系在一起，使他们的心不会随着冰冷的都市而寒冷下去…… ', '感动,家人,人性，比家人还亲', '漫威最强女性英雄', '2019-04-03', '电影 / 动画', 7.5, NULL);
INSERT INTO `movie` VALUES ('10003', '毒液', 'http://mydatabase.com/movie/f10009.jpg', '艾迪（汤姆·哈迪 Tom Hardy 饰）是一位深受观众喜爱的新闻记者，和女友安妮（米歇尔·威廉姆斯 Michelle Williams 饰）相恋多年，彼此之间感情十分要好。安妮是一名律师，接手了生命基金会的案件，在女友的邮箱里，艾迪发现了基金会老板德雷克（里兹·阿迈德 Riz Ahmed 饰）不为人知的秘密。为此，艾迪不仅丢了工作，女友也离他而去。 \r\n　　之后，生命基金会的朵拉博士（珍妮·斯蕾特 Jenny Slate 饰）找到了艾迪，希望艾迪能够帮助她阻止德雷克疯狂的罪行。在生命基金会的实验室里，艾迪发现了德雷克进行人体实验的证据，并且在误打误撞之中被外星生命体毒液附身。回到家后，艾迪和毒液之间形成了共生关系，他们要应对的是德雷克派出的一波又一波杀手。', 'sony大法好,基情十足,反英雄', '漫威最强女性英雄', '2019-04-05', '电影 / 动画', 6.4, NULL);
INSERT INTO `movie` VALUES ('10004', '超级破坏王2', 'http://mydatabase.com/movie/f10008.jpg', '这一次，破坏王拉尔夫（约翰·C·赖利 John C. Reilly 配音）和云妮洛普（萨拉·丝沃曼 Sarah Silverman 配音）又闯祸了，导致了云妮洛普所在的游戏《甜蜜冲刺》的游戏机方向盘遭到了损坏。这是一台非常古老的街机，在整个互联网中，只有一只备用方向盘正在销售，然而它的售价实在是非常昂贵，老板决定放弃这台机器，将它解体变卖。这也就意味着，《甜蜜冲刺》里的角色们将永远失去他们的家园。 \r\n　　为了避免这一悲剧的发生，拉尔夫和云妮洛普决定亲自到互联网里去走一遭，买回方向盘。一路上，他们惹了无数的笑料，犯了无数令人啼笑皆非的错误。为了赚钱，拉尔夫不惜亲自出马成为视频网站的网红赚取点击量变现，而云妮洛普则在另一款赛车游戏《狂野飙车》里找到了真正的自我。', '还行吧,迪士尼水平', '玩转全球网络新世界', '2019-04-26', '电影 / 动画', 9.2, NULL);
INSERT INTO `movie` VALUES ('10005', '一吻定情', 'http://mydatabase.com/movie/c10012.jpg', '笨蛋爱上天才，会有结果吗？平凡女孩原湘琴（林允饰）喜欢上了天才少年江直树（王大陆饰），在她表白失败准备放弃之际，爸爸居然带着自己搬进了直树家里？！一个猛追，一个猛逃，热闹欢腾的纯真高中生活就此上演。朝夕相处中，直树渐渐被湘琴乐观的无畏精神吸引，他开始怀疑：湘琴究竟是人生偏差、还是自己的命中注定?', '厉害,牛逼,太强了吧,女权电影', '漫威最强女性英雄', '2019-04-18', '电影 / 动画', 8.6, NULL);
INSERT INTO `movie` VALUES ('10006', '我的英雄学院', 'http://mydatabase.com/movie/j10006.jpg', '继《海贼王》、《火影忍者》、《死神》三大巨作后，日本第一漫画刊《周刊少年JUMP》近十年力推巨作，《我的英雄学院》创造了一系列绝佳成绩，引人注目。这个讲述大多数人都有超能力的未来，一个毫无能力的少年如何成为英雄的故事，在日本、美国、中国等地引发绝佳成绩和好评。作为该作首 部剧场版，在海外取得令人称道的成绩和好评，以主角绿谷出久与师傅欧鲁迈特联手对敌的新故事，讲述了一个简单又热血激昂的青春战斗故事，传承少年热血漫传统的同时，大胆创新、场面激烈、有笑有泪，令人瞩目。', '燃,热血,日系,高水准打斗', '海王', '2019-04-02', '电影 / 动画', 3.6, NULL);
INSERT INTO `movie` VALUES ('10007', '下一任，前任', 'http://mydatabase.com/movie/c10001.png', '林心恬（郭采洁 饰）的爱情路一直不顺，总是不能在对的时间遇到对的人。正当她心灰意冷时，缘份使她邂逅了多情暖男吾川（郑恺 饰），吾川对心恬展开狂热追求，最终心恬被打动。然而意料之外的是，心恬自学生时期就暗恋的学霸男神黄克群（李东学 饰）又出现了。是该选择近在眼前的幸福，还是多年前梦寐以求的白马王子？当心恬做出决定后才发现，原来爱情在冥冥中早已注定！', NULL, NULL, NULL, '电影', 4.6, NULL);
INSERT INTO `movie` VALUES ('10008', '悟空奇遇记', 'http://mydatabase.com/movie/c10002.png', '成佛后无所事事的孙悟空在玉帝授意下来到人间，偶遇迷路的小鹿和收留它的小女孩晶晶，三人各带着不同目的出发。旅途中发生很多趣事和误会，三人渐渐加深了友谊。悟空逐渐意识到节日不论中外，都代表着对亲情的期待，他不仅解开晶晶心结，还为保护孩子的爱与期待，不惜与天庭一战。', NULL, NULL, NULL, '电影', 7.2, NULL);
INSERT INTO `movie` VALUES ('10009', '过春天', 'http://mydatabase.com/movie/c10003.png', '单亲家庭出身的16岁女学生佩佩（黄尧 饰），她的城市既是香港、也是深圳，白天在香港上学，晚上回到深圳跟妈妈（倪虹洁 饰）住在一起，频繁地穿梭于两地。为了和闺蜜Joe（汤加文 饰）一起旅行的约定，为了自己的存在感，为了对Joe男友阿豪（孙阳 饰）懵懂的好感，她内心的冲动被点燃，“水客”成为了她的另一个身份，一段颇有“冒险”感的青春故事就此开始。', NULL, NULL, NULL, '电影', 5.5, NULL);
INSERT INTO `movie` VALUES ('10010', '飞驰人生', 'http://mydatabase.com/movie/c10004.png', '曾经在赛车界叱咤风云、如今却只能经营炒饭大排档的赛车手张驰（沈腾饰）决定重返车坛挑战年轻一代的天才。然而没钱没车没队友，甚至驾照都得重新考，这场笑料百出不断被打脸的复出之路，还有更多哭笑不得的窘境在等待着这位过气车神……', NULL, NULL, NULL, '电影', 5.2, NULL);
INSERT INTO `movie` VALUES ('10011', '致我们暖暖的小时光', 'http://mydatabase.com/movie/c10005.png', NULL, NULL, NULL, NULL, '电影', 6.1, NULL);
INSERT INTO `movie` VALUES ('10012', '绅探', 'http://mydatabase.com/movie/c10006.png', NULL, NULL, NULL, NULL, '电影', 8.4, NULL);
INSERT INTO `movie` VALUES ('10013', '都挺好', 'http://mydatabase.com/movie/c10007.png', NULL, NULL, NULL, NULL, '电影', 7.6, NULL);
INSERT INTO `movie` VALUES ('10014', '我只喜欢你', 'http://mydatabase.com/movie/c10008.png', NULL, NULL, NULL, NULL, '电影', 7.7, NULL);
INSERT INTO `movie` VALUES ('10015', '封神榜', 'http://mydatabase.com/movie/c10009.png', NULL, NULL, NULL, NULL, '电影', 8.1, NULL);
INSERT INTO `movie` VALUES ('10016', '新喜剧之王', 'http://mydatabase.com/movie/c10011.jpg', NULL, NULL, NULL, NULL, '电影', 7.1, NULL);
INSERT INTO `movie` VALUES ('10017', '何以为家', 'http://mydatabase.com/movie/f10001.png', NULL, NULL, NULL, NULL, '电影', 6.3, NULL);
INSERT INTO `movie` VALUES ('10018', '调音师', 'http://mydatabase.com/movie/f10002.png', NULL, NULL, NULL, NULL, '电影', 6.4, NULL);
INSERT INTO `movie` VALUES ('10019', '权力的游戏（第八季）', 'http://mydatabase.com/movie/f10003.png', 'HBO剧集《权力的游戏》第八季将于2019年4月14日播出，本季共6集。 \r\n　　故事发展至第八季，重返临冬城的琼恩·雪诺（基特·哈灵顿 Kit Harington 饰）在布兰·史塔克（伊萨克·亨普斯特德-怀特 Isaac Hempstead-Wright 饰）口中得知了自己身世的秘密，让他与丹妮莉丝·塔格利安（艾米莉亚·克拉克 Emilia Clarke 饰）的关系蒙上了一层冰霜。 \r\n　　詹姆·兰尼斯特（尼古拉·科斯特-瓦尔道 Nikolaj Coster-Waldau 饰）试图召集河间地驻军北伐异鬼，却发现艾德慕·徒利（托比亚斯·门基斯 Tobias Menzies 饰）已经包围了奔流城。 \r\n　　攸伦·葛雷乔伊（皮鲁·埃斯贝克 Pilou Asbæ 饰）将黄金团带至君临获取了瑟曦（琳娜·海蒂 Lena Headey 饰）的信任，而实际上，他已经与无面者贾昆·赫加尔（汤姆·拉斯齐哈 Tom Wlaschiha 饰）私下达成了秘密协议。', ' ', '问君能有几多愁，恰似八季过后无权游。', '2019-05-02', '电影', 8.6, NULL);
INSERT INTO `movie` VALUES ('10020', '爱，死亡，机器人', 'http://mydatabase.com/movie/f10004.png', NULL, NULL, NULL, NULL, '电影', 7.3, NULL);
INSERT INTO `movie` VALUES ('10021', '魔法师（第四季）', 'http://mydatabase.com/movie/f10005.png', NULL, NULL, NULL, NULL, '电影', 7.6, NULL);
INSERT INTO `movie` VALUES ('10022', '绑定（第一季）', 'http://mydatabase.com/movie/f10006.png', NULL, NULL, NULL, NULL, '电影', 2.3, NULL);
INSERT INTO `movie` VALUES ('10023', '性爱自修室', 'http://mydatabase.com/movie/f10007.png', NULL, NULL, NULL, NULL, '电影', 6.6, NULL);
INSERT INTO `movie` VALUES ('10024', '我，到点下班', 'http://mydatabase.com/movie/j10001.png', NULL, '日剧,治愈,很温情,吹爆', NULL, NULL, '电影', 8.9, NULL);
INSERT INTO `movie` VALUES ('10025', '昨日的美食', 'http://mydatabase.com/movie/j10002.png', NULL, '女主很美,拖沓,唯美，写实,日剧,治愈,很温情,吹爆', NULL, NULL, '电影', 9.1, NULL);
INSERT INTO `movie` VALUES ('10026', '别扭合租房', 'http://mydatabase.com/movie/j10003.png', NULL, NULL, NULL, NULL, '电影', 7.3, NULL);
INSERT INTO `movie` VALUES ('10027', '非自然死亡', 'http://mydatabase.com/movie/j10004.png', NULL, NULL, NULL, NULL, '电影', 7.1, NULL);
INSERT INTO `movie` VALUES ('10028', '轮到你了', 'http://mydatabase.com/movie/j10005.png', NULL, NULL, NULL, NULL, '电影', 8.3, NULL);
INSERT INTO `movie` VALUES ('10029', '惊奇队长', 'http://mydatabase.com/movie/f10010.png', '在围剿斯克鲁人的战斗中，克里人星际战队成员弗斯（布丽·拉尔森 Brie Larson 饰）不幸成为对方的俘虏。斯克鲁人尝试探究弗斯的记忆，最终发现连弗斯本人都不知道的一段往事，进而也得知名为温迪•劳森博士的女子掌握着他们急于得到的时空引擎。趁对方不备，拥有强大超能力的弗斯摆脱束缚，逃到了代号为C-53的地球，而这里也正是她那段失落的记忆的发生地。未过多久，神盾局探员弗瑞特工（塞缪尔·杰克逊 Samuel L. Jackson 饰）找上门来，而紧随其后的斯克鲁人更是引发了地球人前所未见的大骚动。 \r\n　　在这一过程中，弗瑞特工意识到事态的严重性，并且帮助弗斯认清本来的自己。倔强的弗斯，终于找到了真正需要保护的东西', '日剧,治愈,很温情,吹爆', '唯一观影建议：请带着纸巾', '2019-05-29', '电影 / 科幻', 8.6, NULL);
INSERT INTO `movie` VALUES ('10030', '哆啦A梦：大雄的月球探险记', 'http://mydatabase.com/movie/j10008.jpg', '月球探测器在月亮上捕捉到了白影，大雄认为这道白影是月亮上的兔子，惹来了大家的耻笑，于是哆啦A 梦为了帮助大雄，利用道具“异说俱乐部徽章”，在月球背面制造了一个兔子王国。一天，神秘少年露卡转学而来，与大雄和伙伴们一同前往月亮上的月兔王国展开了一场别开生面的浪漫想象力之旅。', '暗黑寓言,煽情,情怀', '纪念第一部在电影院看的哆啦A梦，主题曲一响整个人都快哭出来了', '2019-06-01', '电影 / 动画', 9.0, 'http://mydatabase.com/video/doraamen.mp4');
INSERT INTO `movie` VALUES ('10031', 'X战警：黑凤凰', 'http://mydatabase.com/movie/f10011.png', '影片剧情围绕X战警中最受欢迎成员之一的琴·葛蕾展开，讲述她逐渐转化为黑凤凰的故事。在一次危及生命的太空营救行动中，琴被神秘的宇宙力量击中，成为最强大的变种人。此后琴·葛蕾不仅要设法掌控日益增长、极不稳定的力量，更要与自己内心的恶魔抗争，她的失控让整个X战警大家庭分崩离析，也让整个星球陷入毁灭的威胁之中。《X战警：黑凤凰》是迄今为止气氛最紧张、情感最丰富的一部《X战警》电影，是《X战警》系列20年来的集大成之作，大家非常熟悉和热爱的变种人大家庭即将面对最为强大的敌人——而她恰恰还是他们中的一员。', '黑化,漫威,特效爆炸', '漫威宇宙即将加入X战警宇宙', '2019-06-03', '电影 / 科幻', 0.0, 'http://mydatabase.com/video/xman.mp4');

-- ----------------------------
-- Table structure for movie_diary
-- ----------------------------
DROP TABLE IF EXISTS `movie_diary`;
CREATE TABLE `movie_diary`  (
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_id` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `diary_time` date NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movie_diary
-- ----------------------------
INSERT INTO `movie_diary` VALUES ('100523', '10012', '2019-04-20');
INSERT INTO `movie_diary` VALUES ('100523', '10011', '2019-04-10');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_num` int(11) NOT NULL,
  `like_num` int(11) UNSIGNED ZEROFILL NOT NULL,
  `img_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_tm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 'hhhhhh', 10, 00000000010, NULL, '100524', '1557663020521', '1');
INSERT INTO `post` VALUES (2, 'kkkkkk', 0, 00000000000, NULL, '100523', '15576630201000', '1');
INSERT INTO `post` VALUES (3, 'dfdddfdfgfgf', 0, 00000000000, NULL, NULL, NULL, NULL);
INSERT INTO `post` VALUES (4, 'fdgfdgf', 0, 00000000000, NULL, '100524', NULL, NULL);
INSERT INTO `post` VALUES (5, 'dfdsfdf', 0, 00000000000, NULL, '100524', '1557759882907', NULL);
INSERT INTO `post` VALUES (6, 'dfdds', 0, 00000000000, NULL, '100524', '1557759992137', '1');
INSERT INTO `post` VALUES (7, 'dfdds', 0, 00000000000, NULL, '100524', '1557760013239', '1');
INSERT INTO `post` VALUES (9, 'dfdsfgfd', 0, 00000000000, NULL, '100524', '1557800597252', '1');
INSERT INTO `post` VALUES (10, '多对多', 0, 00000000000, NULL, '100524', '1557929490313', '0');
INSERT INTO `post` VALUES (21, '\n        多对多\n    ', 0, 00000000000, NULL, '100524', '1557930556393', '0');
INSERT INTO `post` VALUES (23, '\n        多对多\n    ', 0, 00000000000, NULL, '100524', '1557930624266', '0');
INSERT INTO `post` VALUES (28, '\n        de\n    ', 0, 00000000000, NULL, '100524', '1558017109540', '1,23');
INSERT INTO `post` VALUES (29, '\n        de\n    ', 0, 00000000000, NULL, '100524', '1558017618030', '1,24');
INSERT INTO `post` VALUES (30, '\n        de\n    ', 0, 00000000000, NULL, '100524', '1558017628053', '1,25');
INSERT INTO `post` VALUES (32, '\n        \n        de\n    \n    ', 0, 00000000000, NULL, '100524', '1558017662445', '1');
INSERT INTO `post` VALUES (33, '\n        \n        \n        \n        \n        \n        \n        de\n    \n    \n    \n    \n    \n    \n    ', 0, 00000000000, NULL, '100524', '1558018713892', '1,3,18,18,27');
INSERT INTO `post` VALUES (34, '\n        de\n    ', 0, 00000000000, NULL, '100524', '1558019226860', '20,28');
INSERT INTO `post` VALUES (35, '\n        \n    ', 0, 00000000000, NULL, '100524', '1558098623404', '1');
INSERT INTO `post` VALUES (36, '\n        \n    ', 0, 00000000000, NULL, '100524', '1558098647514', '1');
INSERT INTO `post` VALUES (37, '\n        \n    ', 0, 00000000000, NULL, '100524', '1558102141208', '1');

-- ----------------------------
-- Table structure for post_reply
-- ----------------------------
DROP TABLE IF EXISTS `post_reply`;
CREATE TABLE `post_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `post_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `topic_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_time` date NOT NULL,
  `attention_num` int(11) NULL DEFAULT NULL,
  `post_num` int(10) NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_tm` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES (1, '', '', NULL, '0000-00-00', 450, 0, NULL, '0000-00-00 00:00:00', '肖申克的救赎');
INSERT INTO `topic` VALUES (2, '', '', NULL, '0000-00-00', 150, 0, NULL, NULL, '是枝裕和');
INSERT INTO `topic` VALUES (3, '', '', NULL, '0000-00-00', 800, 0, NULL, '2019-05-12 16:34:21', '大侦探皮卡丘');
INSERT INTO `topic` VALUES (5, '', '', NULL, '0000-00-00', NULL, NULL, NULL, '0000-00-00 00:00:00', '哈哈哈');
INSERT INTO `topic` VALUES (8, '', '', NULL, '0000-00-00', NULL, NULL, NULL, '0000-00-00 00:00:00', '欧克');
INSERT INTO `topic` VALUES (17, '', '', NULL, '0000-00-00', NULL, NULL, NULL, '0000-00-00 00:00:00', '哈哈哈哈哈');
INSERT INTO `topic` VALUES (20, '', '', NULL, '0000-00-00', NULL, NULL, NULL, '0000-00-00 00:00:00', 'de');
INSERT INTO `topic` VALUES (28, '', '', NULL, '0000-00-00', NULL, NULL, NULL, '0000-00-00 00:00:00', 'hhh');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'http://mydatabase.com/user/corn.png',
  `watched_movie` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('chaos', '100525', 'chaos', '5284792zxc.', 'http://mydatabase.com/user/corn.png', 0);
INSERT INTO `user_info` VALUES ('lymn', 'ced65e6c4ea20b85a47aa7bbda7f0569', 'lymn', '5284792zxc.', 'http://mydatabase.com/user/E2.png', 0);
INSERT INTO `user_info` VALUES ('何超豪', '100524', '5284792@qq.com', '5284792', 'http://mydatabase.com/user/xiaoxin.jpg', 42);
INSERT INTO `user_info` VALUES ('血小板', '100523', '1414249719@qq.com', '5284792', 'http://mydatabase.com/user/xiaoxin.jpg', 23);

-- ----------------------------
-- Table structure for watched_movie
-- ----------------------------
DROP TABLE IF EXISTS `watched_movie`;
CREATE TABLE `watched_movie`  (
  `movie_id` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of watched_movie
-- ----------------------------
INSERT INTO `watched_movie` VALUES ('10001', '100523');
INSERT INTO `watched_movie` VALUES ('10004', '100523');
INSERT INTO `watched_movie` VALUES ('10005', '100523');
INSERT INTO `watched_movie` VALUES ('10001', '');
INSERT INTO `watched_movie` VALUES ('10004', '');
INSERT INTO `watched_movie` VALUES ('10019', '100523');

SET FOREIGN_KEY_CHECKS = 1;
