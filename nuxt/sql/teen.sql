/*
Navicat MySQL Data Transfer

Source Server         : film
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : teen

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-05-29 14:47:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `movie_id` char(6) NOT NULL,
  `movie_name` varchar(10) NOT NULL,
  `activity_id` varchar(3) NOT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
CREATE TABLE `activity_map` (
  `activity_id` varchar(3) NOT NULL,
  `activity_name` varchar(10) NOT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
CREATE TABLE `banner` (
  `movie_id` char(6) NOT NULL,
  `movie_name` varchar(10) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
CREATE TABLE `collect_movie` (
  `movie_id` char(6) NOT NULL,
  `uid` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of collect_movie
-- ----------------------------
INSERT INTO `collect_movie` VALUES ('10019', '100523');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `movie_id` char(6) NOT NULL,
  `uid` char(6) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `comment_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('10005', '100523', '这是一条测试评论', '2019-05-11');
INSERT INTO `comment` VALUES ('10005', '100523', '笨蛋爱上天才，会有结果吗？平凡女孩原湘琴（林允饰）喜欢上了天才少年江直树（王大陆饰），在她表白失败准备放弃之际，爸爸居然带着自己搬进了直树家里？！一个猛追，一个猛逃，热闹欢腾的纯真高中生活就此上演。朝夕相处中，直树渐渐被湘琴乐观的无畏精神吸引，他开始怀疑：湘琴究竟是人生偏差、还是自己的命中注定?', '2019-05-10');
INSERT INTO `comment` VALUES ('10005', '100524', '这个电影也太无聊了吧，改变不是乱编，差评', '2019-05-02');
INSERT INTO `comment` VALUES ('10004', '100526', '22222222222222222222222', '2019-05-29');

-- ----------------------------
-- Table structure for graphic
-- ----------------------------
DROP TABLE IF EXISTS `graphic`;
CREATE TABLE `graphic` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `img_list` varchar(1000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cover_img` varchar(255) DEFAULT NULL,
  `detail_img` varchar(255) DEFAULT NULL,
  `view_num` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graphic
-- ----------------------------
INSERT INTO `graphic` VALUES ('1', '喜剧、爱情', '169cm，95kg，她的身材完全可以到摔跤场上比试一下。但她其实只是一个想得到爱情的普通女子，她叫康汉娜。上帝赋予她的唯一礼物就是天籁般的嗓音，但是因为肥胖的体型，她只能在幕后帮美女歌手亚美假唱。亚美的制作人韩尚俊是唯一肯定她音乐实力的人，但是尚俊也一直利用着汉娜，不知不觉汉娜暗恋上了韩尚俊。在韩尚俊的生日派对上汉娜终于如愿的被邀请过去，她兴奋的很努力的想表现自己，但是，从那晚以后她突然消失了，自从汉娜突然消失后歌手亚美不得不中止了她的音乐活动，而制作人尚俊这时则遇到了救世主珍妮。珍妮的美丽可以让过路的人目不转睛，而她的歌唱实力也是与容貌一样很吸引人，一点都不逊于消失的汉娜。 更可爱的是她经常帮助路边需要帮助的人。她的善良和朴实让人觉得奇怪。歌手亚美对此非常的嫉妒和疑惑，她意识到自己的歌坛地位越来越受到威胁，于是亚美开始着手调查美女珍妮的背景，终于，在珍妮的一次舞会上，亚美把珍妮的爸爸——个精神病患者带到了舞会上，尚俊从中得知，珍妮是康汉娜，而第二天，珍妮的第一次演唱会前，亚美以珍妮是康汉娜的理由要挟尚俊取消演唱会，尚俊不肯。演唱会上，珍妮的爸爸又来了，珍妮向大众曝光，自己是康汉娜，歌迷们原谅了她。康汉娜成为了韩国点击率最高的歌手。', 'http://teen.com/nuxt/images/graphic/1.jpg,http://teen.com/nuxt/images/graphic/2.jpg,http://teen.com/nuxt/images/graphic/3.jpg,http://teen.com/nuxt/images/graphic/4.jpg,http://teen.com/nuxt/images/graphic/5.jpg,http://teen.com/nuxt/images/graphic/6.jpg,http://teen.com/nuxt/images/graphic/7.jpg,http://teen.com/nuxt/images/graphic/8.jpg', '丑女大翻身', 'http://teen.com/nuxt/images/graphic/cover1.jpg', 'http://teen.com/nuxt/images/graphic/detail1.jpg', '0');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `movie_id` char(6) NOT NULL DEFAULT '10011',
  `movie_name` varchar(10) NOT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  `movie_des` varchar(500) DEFAULT NULL,
  `movie_tags` varchar(100) DEFAULT NULL,
  `movie_slogan` varchar(50) DEFAULT NULL,
  `appear_time` date DEFAULT NULL,
  `movie_type` varchar(10) DEFAULT NULL,
  `score` float(2,1) DEFAULT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('10001', '比悲伤更悲伤的故事', 'http://mydatabase.com/movie/c10010.jpg', '唱片制作人张哲凯(刘以豪)和王牌作词人宋媛媛(陈意涵)相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有 成温柔体贴的医生(张书豪)适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤......', '感动,牛逼,哭了三分之一,爱,6666', '唯一观影建议：请带着纸巾', '2019-04-25', '电影 / 动画', '8.2');
INSERT INTO `movie` VALUES ('10002', '小偷家族', 'http://mydatabase.com/movie/j10007.jpg', '东京的都市丛林中央，残存着一栋古旧寒酸的老房子，这里局促地生活着柴田一家五口人。在工地当临时工的男人阿治（Lily Franky 饰）经常带着儿子祥太（城桧吏 饰）到超市盗窃生活用品，这一天，他们回家路上遇到了独自待在户外的四岁女孩由里（佐佐木美结 饰）。妻子信代（安藤樱 饰）起初极力主张将女孩送回父母身边，但当看到女孩原生家庭的状况时又心生恻隐。原本柴田家就靠着老奶奶初枝（树木希林 饰）的养老金度日，而今多了一口人，自然更艰辛了几分。包括信代的妹妹亚纪（松冈茉优 饰）在内，虽然一家人游走在贫困和违法的边缘，但笃深的羁绊将他们紧紧联系在一起，使他们的心不会随着冰冷的都市而寒冷下去…… ', '感动,家人,人性，比家人还亲', '漫威最强女性英雄', '2019-04-03', '电影 / 动画', '7.5');
INSERT INTO `movie` VALUES ('10003', '毒液', 'http://mydatabase.com/movie/f10009.jpg', '艾迪（汤姆·哈迪 Tom Hardy 饰）是一位深受观众喜爱的新闻记者，和女友安妮（米歇尔·威廉姆斯 Michelle Williams 饰）相恋多年，彼此之间感情十分要好。安妮是一名律师，接手了生命基金会的案件，在女友的邮箱里，艾迪发现了基金会老板德雷克（里兹·阿迈德 Riz Ahmed 饰）不为人知的秘密。为此，艾迪不仅丢了工作，女友也离他而去。 \r\n　　之后，生命基金会的朵拉博士（珍妮·斯蕾特 Jenny Slate 饰）找到了艾迪，希望艾迪能够帮助她阻止德雷克疯狂的罪行。在生命基金会的实验室里，艾迪发现了德雷克进行人体实验的证据，并且在误打误撞之中被外星生命体毒液附身。回到家后，艾迪和毒液之间形成了共生关系，他们要应对的是德雷克派出的一波又一波杀手。', 'sony大法好,基情十足,反英雄', '漫威最强女性英雄', '2019-04-05', '电影 / 动画', '6.4');
INSERT INTO `movie` VALUES ('10004', '超级破坏王2', 'http://mydatabase.com/movie/f10008.jpg', '这一次，破坏王拉尔夫（约翰·C·赖利 John C. Reilly 配音）和云妮洛普（萨拉·丝沃曼 Sarah Silverman 配音）又闯祸了，导致了云妮洛普所在的游戏《甜蜜冲刺》的游戏机方向盘遭到了损坏。这是一台非常古老的街机，在整个互联网中，只有一只备用方向盘正在销售，然而它的售价实在是非常昂贵，老板决定放弃这台机器，将它解体变卖。这也就意味着，《甜蜜冲刺》里的角色们将永远失去他们的家园。 \r\n　　为了避免这一悲剧的发生，拉尔夫和云妮洛普决定亲自到互联网里去走一遭，买回方向盘。一路上，他们惹了无数的笑料，犯了无数令人啼笑皆非的错误。为了赚钱，拉尔夫不惜亲自出马成为视频网站的网红赚取点击量变现，而云妮洛普则在另一款赛车游戏《狂野飙车》里找到了真正的自我。', '还行吧,迪士尼水平', '玩转全球网络新世界', '2019-04-26', '电影 / 动画', '9.2');
INSERT INTO `movie` VALUES ('10005', '一吻定情', 'http://mydatabase.com/movie/c10012.jpg', '笨蛋爱上天才，会有结果吗？平凡女孩原湘琴（林允饰）喜欢上了天才少年江直树（王大陆饰），在她表白失败准备放弃之际，爸爸居然带着自己搬进了直树家里？！一个猛追，一个猛逃，热闹欢腾的纯真高中生活就此上演。朝夕相处中，直树渐渐被湘琴乐观的无畏精神吸引，他开始怀疑：湘琴究竟是人生偏差、还是自己的命中注定?', '厉害,牛逼,太强了吧,女权电影', '漫威最强女性英雄', '2019-04-18', '电影 / 动画', '8.6');
INSERT INTO `movie` VALUES ('10006', '我的英雄学院', 'http://mydatabase.com/movie/j10006.jpg', '继《海贼王》、《火影忍者》、《死神》三大巨作后，日本第一漫画刊《周刊少年JUMP》近十年力推巨作，《我的英雄学院》创造了一系列绝佳成绩，引人注目。这个讲述大多数人都有超能力的未来，一个毫无能力的少年如何成为英雄的故事，在日本、美国、中国等地引发绝佳成绩和好评。作为该作首 部剧场版，在海外取得令人称道的成绩和好评，以主角绿谷出久与师傅欧鲁迈特联手对敌的新故事，讲述了一个简单又热血激昂的青春战斗故事，传承少年热血漫传统的同时，大胆创新、场面激烈、有笑有泪，令人瞩目。', '燃,热血,日系,高水准打斗', '海王', '2019-04-02', '电影 / 动画', '3.6');
INSERT INTO `movie` VALUES ('10007', '下一任，前任', 'http://mydatabase.com/movie/c10001.png', '林心恬（郭采洁 饰）的爱情路一直不顺，总是不能在对的时间遇到对的人。正当她心灰意冷时，缘份使她邂逅了多情暖男吾川（郑恺 饰），吾川对心恬展开狂热追求，最终心恬被打动。然而意料之外的是，心恬自学生时期就暗恋的学霸男神黄克群（李东学 饰）又出现了。是该选择近在眼前的幸福，还是多年前梦寐以求的白马王子？当心恬做出决定后才发现，原来爱情在冥冥中早已注定！', null, null, null, '电影', '4.6');
INSERT INTO `movie` VALUES ('10008', '悟空奇遇记', 'http://mydatabase.com/movie/c10002.png', '成佛后无所事事的孙悟空在玉帝授意下来到人间，偶遇迷路的小鹿和收留它的小女孩晶晶，三人各带着不同目的出发。旅途中发生很多趣事和误会，三人渐渐加深了友谊。悟空逐渐意识到节日不论中外，都代表着对亲情的期待，他不仅解开晶晶心结，还为保护孩子的爱与期待，不惜与天庭一战。', null, null, null, '电影', '7.2');
INSERT INTO `movie` VALUES ('10009', '过春天', 'http://mydatabase.com/movie/c10003.png', '单亲家庭出身的16岁女学生佩佩（黄尧 饰），她的城市既是香港、也是深圳，白天在香港上学，晚上回到深圳跟妈妈（倪虹洁 饰）住在一起，频繁地穿梭于两地。为了和闺蜜Joe（汤加文 饰）一起旅行的约定，为了自己的存在感，为了对Joe男友阿豪（孙阳 饰）懵懂的好感，她内心的冲动被点燃，“水客”成为了她的另一个身份，一段颇有“冒险”感的青春故事就此开始。', null, null, null, '电影', '5.5');
INSERT INTO `movie` VALUES ('10010', '飞驰人生', 'http://mydatabase.com/movie/c10004.png', '曾经在赛车界叱咤风云、如今却只能经营炒饭大排档的赛车手张驰（沈腾饰）决定重返车坛挑战年轻一代的天才。然而没钱没车没队友，甚至驾照都得重新考，这场笑料百出不断被打脸的复出之路，还有更多哭笑不得的窘境在等待着这位过气车神……', null, null, null, '电影', '5.2');
INSERT INTO `movie` VALUES ('10011', '致我们暖暖的小时光', 'http://mydatabase.com/movie/c10005.png', null, null, null, null, '电影', '6.1');
INSERT INTO `movie` VALUES ('10012', '绅探', 'http://mydatabase.com/movie/c10006.png', null, null, null, null, '电影', '8.4');
INSERT INTO `movie` VALUES ('10013', '都挺好', 'http://mydatabase.com/movie/c10007.png', null, null, null, null, '电影', '7.6');
INSERT INTO `movie` VALUES ('10014', '我只喜欢你', 'http://mydatabase.com/movie/c10008.png', null, null, null, null, '电影', '7.7');
INSERT INTO `movie` VALUES ('10015', '封神榜', 'http://mydatabase.com/movie/c10009.png', null, null, null, null, '电影', '8.1');
INSERT INTO `movie` VALUES ('10016', '新喜剧之王', 'http://mydatabase.com/movie/c10011.jpg', null, null, null, null, '电影', '7.1');
INSERT INTO `movie` VALUES ('10017', '何以为家', 'http://mydatabase.com/movie/f10001.png', null, null, null, null, '电影', '6.3');
INSERT INTO `movie` VALUES ('10018', '调音师', 'http://mydatabase.com/movie/f10002.png', null, null, null, null, '电影', '6.4');
INSERT INTO `movie` VALUES ('10019', '权力的游戏（第八季）', 'http://mydatabase.com/movie/f10003.png', 'HBO剧集《权力的游戏》第八季将于2019年4月14日播出，本季共6集。 \r\n　　故事发展至第八季，重返临冬城的琼恩·雪诺（基特·哈灵顿 Kit Harington 饰）在布兰·史塔克（伊萨克·亨普斯特德-怀特 Isaac Hempstead-Wright 饰）口中得知了自己身世的秘密，让他与丹妮莉丝·塔格利安（艾米莉亚·克拉克 Emilia Clarke 饰）的关系蒙上了一层冰霜。 \r\n　　詹姆·兰尼斯特（尼古拉·科斯特-瓦尔道 Nikolaj Coster-Waldau 饰）试图召集河间地驻军北伐异鬼，却发现艾德慕·徒利（托比亚斯·门基斯 Tobias Menzies 饰）已经包围了奔流城。 \r\n　　攸伦·葛雷乔伊（皮鲁·埃斯贝克 Pilou Asbæ 饰）将黄金团带至君临获取了瑟曦（琳娜·海蒂 Lena Headey 饰）的信任，而实际上，他已经与无面者贾昆·赫加尔（汤姆·拉斯齐哈 Tom Wlaschiha 饰）私下达成了秘密协议。', ' ', '问君能有几多愁，恰似八季过后无权游。', '2019-05-02', '电影', '8.6');
INSERT INTO `movie` VALUES ('10020', '爱，死亡，机器人', 'http://mydatabase.com/movie/f10004.png', null, null, null, null, '电影', '7.3');
INSERT INTO `movie` VALUES ('10021', '魔法师（第四季）', 'http://mydatabase.com/movie/f10005.png', null, null, null, null, '电影', '7.6');
INSERT INTO `movie` VALUES ('10022', '绑定（第一季）', 'http://mydatabase.com/movie/f10006.png', null, null, null, null, '电影', '2.3');
INSERT INTO `movie` VALUES ('10023', '性爱自修室', 'http://mydatabase.com/movie/f10007.png', null, null, null, null, '电影', '6.6');
INSERT INTO `movie` VALUES ('10024', '我，到点下班', 'http://mydatabase.com/movie/j10001.png', null, '日剧,治愈,很温情,吹爆', null, null, '电影', '8.9');
INSERT INTO `movie` VALUES ('10025', '昨日的美食', 'http://mydatabase.com/movie/j10002.png', null, '女主很美,拖沓,唯美，写实,日剧,治愈,很温情,吹爆', null, null, '电影', '9.1');
INSERT INTO `movie` VALUES ('10026', '别扭合租房', 'http://mydatabase.com/movie/j10003.png', null, null, null, null, '电影', '7.3');
INSERT INTO `movie` VALUES ('10027', '非自然死亡', 'http://mydatabase.com/movie/j10004.png', null, null, null, null, '电影', '7.1');
INSERT INTO `movie` VALUES ('10028', '轮到你了', 'http://mydatabase.com/movie/j10005.png', null, null, null, null, '电影', '8.3');
INSERT INTO `movie` VALUES ('10029', '惊奇队长', 'http://mydatabase.com/movie/f10010.png', null, null, null, null, '电影 / 科幻', '8.6');

-- ----------------------------
-- Table structure for movie_diary
-- ----------------------------
DROP TABLE IF EXISTS `movie_diary`;
CREATE TABLE `movie_diary` (
  `uid` char(6) NOT NULL,
  `movie_id` char(6) NOT NULL,
  `diary_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of movie_diary
-- ----------------------------
INSERT INTO `movie_diary` VALUES ('100523', '10012', '2019-04-20');
INSERT INTO `movie_diary` VALUES ('100523', '10011', '2019-04-10');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `reply_num` int(11) NOT NULL,
  `like_num` int(11) unsigned zerofill NOT NULL,
  `img_list` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_tm` varchar(255) DEFAULT NULL,
  `topic_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', 'hhhhhh', '10', '00000000010', null, '100524', '1557663020521', '1');
INSERT INTO `post` VALUES ('28', '\n        de\n    ', '4', '00000000000', null, '100524', '1558017109540', '1,23');
INSERT INTO `post` VALUES ('29', '\n        de\n    ', '0', '00000000000', null, '100524', '1558017618030', '1,24');
INSERT INTO `post` VALUES ('30', '\n        de\n    ', '0', '00000000000', null, '100524', '1558017628053', '1,25');
INSERT INTO `post` VALUES ('32', '\n        \n        de\n    \n    ', '0', '00000000000', null, '100524', '1558017662445', '1');
INSERT INTO `post` VALUES ('33', '\n        \n        \n        \n        \n        \n        \n        de\n    \n    \n    \n    \n    \n    \n    ', '0', '00000000000', null, '100524', '1558018713892', '1,3,18,18,27');
INSERT INTO `post` VALUES ('34', '\n        de\n    ', '0', '00000000000', null, '100524', '1558019226860', '20,28');
INSERT INTO `post` VALUES ('35', '\n        \n    ', '0', '00000000000', null, '100524', '1558098623404', '1');
INSERT INTO `post` VALUES ('36', '\n        \n    ', '0', '00000000000', null, '100524', '1558098647514', '1');
INSERT INTO `post` VALUES ('37', '\n        \n    ', '0', '00000000000', null, '100524', '1558102141208', '1');
INSERT INTO `post` VALUES ('38', '\n        的\n    ', '0', '00000000000', null, '100524', '1558168174037', '1,5');
INSERT INTO `post` VALUES ('39', '\n        的\n    ', '0', '00000000000', null, '100524', '1558186425443', '1,5');
INSERT INTO `post` VALUES ('40', '\n        \n        \n        哈哈哈哈\n    \n    \n    ', '0', '00000000000', null, '100524', '1558186552141', '1,2');
INSERT INTO `post` VALUES ('41', '\n        \n        \n        哈哈哈哈\n    \n    \n    ', '0', '00000000000', null, '100524', '1558188853580', '1,2');
INSERT INTO `post` VALUES ('42', '', '0', '00000000000', null, '100524', '1558244215451', '');
INSERT INTO `post` VALUES ('43', '', '0', '00000000000', null, '100524', '1558244219153', '');
INSERT INTO `post` VALUES ('44', '的', '0', '00000000000', null, '100524', '1558244227769', '1');
INSERT INTO `post` VALUES ('45', '', '0', '00000000000', null, '100524', '1558259040934', '');
INSERT INTO `post` VALUES ('46', '多对多', '0', '00000000000', null, '100524', '1558358305312', '1');
INSERT INTO `post` VALUES ('47', '多对多', '0', '00000000000', null, '100524', '1558360158746', '1');
INSERT INTO `post` VALUES ('48', '多对多', '0', '00000000000', '', '100524', '1558360509657', '1');
INSERT INTO `post` VALUES ('49', '多对多', '0', '00000000000', 'Array', '100524', '1558360530796', '1');
INSERT INTO `post` VALUES ('50', '多对多', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905201357581528.jpg,http://teen.com/nuxt/images/post/201905201358072243.jpg', '100524', '1558360689697', '1');
INSERT INTO `post` VALUES ('51', '多对多', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905201436136168.jpg,http://teen.com/nuxt/images/post/201905201436153673.jpg', '100524', '1558362978522', '1');
INSERT INTO `post` VALUES ('52', '多对多', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905201436252266.jpg', '100524', '1558362986195', '1');
INSERT INTO `post` VALUES ('53', '多对多', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905201436306954.jpg', '100524', '1558362991683', '1');
INSERT INTO `post` VALUES ('54', '多对多', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905201437003220.jpg', '100524', '1558363021514', '1');
INSERT INTO `post` VALUES ('55', '多对多', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905201437433010.jpg,http://teen.com/nuxt/images/post/201905201437466506.jpg', '100524', '1558363067323', '1');
INSERT INTO `post` VALUES ('56', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558364492514', '1');
INSERT INTO `post` VALUES ('57', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558364494411', '1');
INSERT INTO `post` VALUES ('58', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558364500027', '1');
INSERT INTO `post` VALUES ('59', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558364738690', '1');
INSERT INTO `post` VALUES ('60', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558364739802', '1');
INSERT INTO `post` VALUES ('61', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558365053115', '1');
INSERT INTO `post` VALUES ('62', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558365053787', '1');
INSERT INTO `post` VALUES ('63', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', 'http://teen.com/nuxt/images/post/20190520143805127.jpg,http://teen.com/nuxt/images/post/201905201442214639.jpg,http://teen.com/nuxt/images/post/201905201442233070.jpg,http://teen.com/nuxt/images/post/201905201442403930.jpg,http://teen.com/nuxt/images/post', '100524', '1558365074595', '1');
INSERT INTO `post` VALUES ('64', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558365079842', '1');
INSERT INTO `post` VALUES ('65', '\n        \n        \n        \n        多对多\n    \n    \n    \n    ', '0', '00000000000', '', '100524', '1558365087083', '1');
INSERT INTO `post` VALUES ('118', 'の', '0', '00000000000', '', '100524', '1558445158702', '81');
INSERT INTO `post` VALUES ('119', 'の', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905211326097130.jpg', '100524', '1558445181107', '82');
INSERT INTO `post` VALUES ('120', '哈哈哈', '0', '00000000000', '', '100524', '1558445241157', '1');
INSERT INTO `post` VALUES ('121', '哈哈哈', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905211327257379.jpg', '100524', '1558445255051', '1');
INSERT INTO `post` VALUES ('122', '', '0', '00000000000', null, '0', '', '');
INSERT INTO `post` VALUES ('123', '', '0', '00000000000', null, '0', '', '');
INSERT INTO `post` VALUES ('124', '', '0', '00000000000', null, '0', '', '');
INSERT INTO `post` VALUES ('125', '\n        的是你的', '0', '00000000000', null, '100524', '1558883433811', '1');
INSERT INTO `post` VALUES ('126', '得的', '0', '00000000000', null, '100524', '1558883460051', '1');
INSERT INTO `post` VALUES ('127', '', '0', '00000000000', null, '100524', '1558883873717', '');
INSERT INTO `post` VALUES ('128', '得的', '0', '00000000000', null, '100524', '1558883885780', '1');
INSERT INTO `post` VALUES ('129', '得的', '0', '00000000000', null, '100524', '1558884361516', '1');
INSERT INTO `post` VALUES ('130', '我是血小板', '0', '00000000000', null, '100523', '1558885076029', '3');
INSERT INTO `post` VALUES ('131', '图片呢', '0', '00000000000', null, '100524', '1558885157253', '3');
INSERT INTO `post` VALUES ('132', '大大', '0', '00000000000', null, '100524', '1558885282069', '3');
INSERT INTO `post` VALUES ('133', '的', '0', '00000000000', null, '100524', '1558885346926', '3');
INSERT INTO `post` VALUES ('134', '图片图片', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905261543184362.jpg', '100524', '1558885399749', '3');
INSERT INTO `post` VALUES ('135', '我是血小板', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905280237439641.jpg', '100523', '1559011065307', '3');
INSERT INTO `post` VALUES ('136', '', '1', '00000000000', 'http://teen.com/nuxt/images/post/201905280503374748.jpg,http://teen.com/nuxt/images/post/201905280503388327.jpg,http://teen.com/nuxt/images/post/201905280503405098.jpg,http://teen.com/nuxt/images/post/201905280503428809.jpg,http://teen.com/nuxt/images/pos', '100524', '1559020029283', '1');
INSERT INTO `post` VALUES ('137', '', '0', '00000000000', '', '100523', '1559024489068', '');
INSERT INTO `post` VALUES ('138', '', '0', '00000000000', '', '100523', '1559025980396', '1');
INSERT INTO `post` VALUES ('139', '', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905280646233717.jpg', '100523', '1559025985116', '1');
INSERT INTO `post` VALUES ('140', '', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905280648336902.jpg', '100524', '1559026114259', '1');
INSERT INTO `post` VALUES ('141', '多对多', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905280701347127.jpg', '100524', '1559026896203', '1');
INSERT INTO `post` VALUES ('142', '顶顶顶顶顶', '0', '00000000000', '', '100523', '1559027100458', '1');
INSERT INTO `post` VALUES ('143', '顶顶顶顶顶', '0', '00000000000', '', '100523', '1559027366522', '1');
INSERT INTO `post` VALUES ('144', '得的', '0', '00000000000', '', '100523', '1559027387667', '3');
INSERT INTO `post` VALUES ('145', '得的', '0', '00000000000', '', '100524', '1559027420339', '3');
INSERT INTO `post` VALUES ('146', '灌灌灌灌灌', '0', '00000000000', '', '100523', '1559027443122', '3');
INSERT INTO `post` VALUES ('147', '得的', '0', '00000000000', '', '100523', '1559027525491', '3');
INSERT INTO `post` VALUES ('148', '得的', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905280711516672.jpg', '100524', '1559027572157', '3');
INSERT INTO `post` VALUES ('149', '酷酷酷酷酷酷酷酷酷酷酷酷酷', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905280713164863.jpg', '100524', '1559027607330', '3');
INSERT INTO `post` VALUES ('150', '多对多', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905280714472131.jpg', '100524', '1559027757393', '1');
INSERT INTO `post` VALUES ('151', '哈哈哈', '0', '00000000000', '', '100523', '1559027806521', '1');
INSERT INTO `post` VALUES ('152', '哈哈哈', '0', '00000000000', '', '100523', '1559027843738', '1');
INSERT INTO `post` VALUES ('153', '哈哈哈', '0', '00000000000', '', '100524', '1559028010218', '1');
INSERT INTO `post` VALUES ('154', '哈哈哈', '0', '00000000000', '', '100524', '1559028029690', '1');
INSERT INTO `post` VALUES ('155', '\n        \n    ', '0', '00000000000', '', '100524', '1559028136402', '1,3');
INSERT INTO `post` VALUES ('156', 'd\n        \n    ', '0', '00000000000', '', '100523', '1559028923649', '1');
INSERT INTO `post` VALUES ('157', 'dede', '0', '00000000000', '', '100523', '1559028931529', '1,20');
INSERT INTO `post` VALUES ('158', 'dede', '0', '00000000000', '', '100523', '1559028945337', '1,3');
INSERT INTO `post` VALUES ('159', '得得得', '6', '00000000000', 'http://teen.com/nuxt/images/post/201905280735495212.jpg,http://teen.com/nuxt/images/post/201905280735511412.jpg', '100523', '1559028955408', '1');
INSERT INTO `post` VALUES ('160', '新的话题', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905280832483277.jpg', '100523', '1559032574061', '21');
INSERT INTO `post` VALUES ('161', '灵能百分百', '0', '00000000000', '', '100523', '1559032648263', '22');
INSERT INTO `post` VALUES ('162', '灵能百分百', '0', '00000000000', '', '100523', '1559032696111', '23');
INSERT INTO `post` VALUES ('163', '肖申克的救赎真的很好看', '1', '00000000000', 'http://teen.com/nuxt/images/post/201905281053155477.jpg', '100523', '1559040808127', '1,24');
INSERT INTO `post` VALUES ('164', 'ded', '0', '00000000000', 'http://teen.com/nuxt/images/post/201905290253246350.jpg', '100526', '1559098411273', '24');

-- ----------------------------
-- Table structure for post_reply
-- ----------------------------
DROP TABLE IF EXISTS `post_reply`;
CREATE TABLE `post_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `create_tm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_reply
-- ----------------------------
INSERT INTO `post_reply` VALUES ('1', 'dede', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('2', 'dede', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('3', 'dede', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('4', '哈哈哈哈', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('5', '哦空空', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('6', '是的', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('7', '弟弟', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('8', '红红火火恍恍惚惚', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('9', 'hhh', '100523', '2', null);
INSERT INTO `post_reply` VALUES ('10', '啦啦啦', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('11', '多对多', '100523', '0', null);
INSERT INTO `post_reply` VALUES ('12', '顶顶顶顶', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('13', '的', '100523', '0', null);
INSERT INTO `post_reply` VALUES ('14', '的', '100523', '0', null);
INSERT INTO `post_reply` VALUES ('15', '多对多', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('16', '添加', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('17', '添加', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('18', '知道', '100523', '28', null);
INSERT INTO `post_reply` VALUES ('19', '是的', '100523', '136', null);
INSERT INTO `post_reply` VALUES ('20', '我来评论一下', '100523', '159', null);
INSERT INTO `post_reply` VALUES ('21', '评论', '100523', '159', null);
INSERT INTO `post_reply` VALUES ('22', '哈哈哈', '100523', '159', '1559029847792');
INSERT INTO `post_reply` VALUES ('23', '看看看看', '100523', '159', '1559030554345');
INSERT INTO `post_reply` VALUES ('24', '来了', '100523', '159', '1559030592952');
INSERT INTO `post_reply` VALUES ('25', '又来了', '100523', '159', '1559040476312');
INSERT INTO `post_reply` VALUES ('26', '我也觉得不错', '100523', '163', '1559040825752');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(6) NOT NULL,
  `topic_des` varchar(255) NOT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `topic_time` date NOT NULL,
  `attention_num` int(11) DEFAULT NULL,
  `post_num` int(10) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `create_tm` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '', '', null, '0000-00-00', '450', '0', 'http://teen.com/nuxt/images/post/1.jpg', '2019-05-28 16:17:58', '肖申克的救赎');
INSERT INTO `topic` VALUES ('2', '', '', null, '0000-00-00', '150', '0', 'http://teen.com/nuxt/images/post/2.jpg', '2019-05-28 16:18:04', '是枝裕和');
INSERT INTO `topic` VALUES ('3', '', '', null, '0000-00-00', '800', '0', 'http://teen.com/nuxt/images/post/3.jpg', '2019-05-28 16:18:07', '大侦探皮卡丘');
INSERT INTO `topic` VALUES ('5', '', '', null, '0000-00-00', null, null, 'http://teen.com/nuxt/images/post/default.jpg', '2019-05-28 16:20:28', '哈哈哈');
INSERT INTO `topic` VALUES ('8', '', '', null, '0000-00-00', null, null, 'http://teen.com/nuxt/images/post/default.jpg', '2019-05-28 16:20:30', '欧克');
INSERT INTO `topic` VALUES ('17', '', '', null, '0000-00-00', null, null, 'http://teen.com/nuxt/images/post/default.jpg', '2019-05-28 16:20:32', '哈哈哈哈哈');
INSERT INTO `topic` VALUES ('20', '', '', null, '0000-00-00', null, null, 'http://teen.com/nuxt/images/post/default.jpg', '2019-05-28 16:20:33', 'de');
INSERT INTO `topic` VALUES ('21', '', '', null, '0000-00-00', null, null, 'http://teen.com/nuxt/images/post/201905280832483277.jpg', '0000-00-00 00:00:00', '夏目友人帐');
INSERT INTO `topic` VALUES ('23', '', '', null, '0000-00-00', null, null, 'http://teen.com/nuxt/images/post/default.jpg', '0000-00-00 00:00:00', '灵能百分百');
INSERT INTO `topic` VALUES ('24', '', '', null, '0000-00-00', null, null, 'http://teen.com/nuxt/images/post/201905281053155477.jpg', '0000-00-00 00:00:00', '经典电影');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_name` varchar(10) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `account` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `avator` varchar(100) DEFAULT NULL,
  `watched_movie` int(4) DEFAULT NULL,
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('123456', '100525', '123456', '123456', 'http://mydatabase.com/user/corn.png', '0');
INSERT INTO `user_info` VALUES ('何超豪', '100524', '5284792@qq.com', '5284792', 'http://mydatabase.com/user/E1.png', '42');
INSERT INTO `user_info` VALUES ('啦啦啦啦啦啦啦', '100526', '啦啦啦啦啦啦啦', 'a123456', 'http://mydatabase.com/user/corn.png', '0');
INSERT INTO `user_info` VALUES ('血小板', '100523', '1414249719@qq.com', '5284792', 'http://mydatabase.com/user/D1.png', '23');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `film_name` varchar(255) DEFAULT '' COMMENT '电影名字',
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `vide_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', '我，到点下班', '2019-05-29 12:00:00', '2019-05-29 13:00:00', 'http://teen.com/nuxt/videos/1.mp4', '3342');

-- ----------------------------
-- Table structure for viewd_graphic
-- ----------------------------
DROP TABLE IF EXISTS `viewd_graphic`;
CREATE TABLE `viewd_graphic` (
  `id` int(11) NOT NULL,
  `graphic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of viewd_graphic
-- ----------------------------
INSERT INTO `viewd_graphic` VALUES ('0', '1', '100523', '86.99938027300696');

-- ----------------------------
-- Table structure for watched_movie
-- ----------------------------
DROP TABLE IF EXISTS `watched_movie`;
CREATE TABLE `watched_movie` (
  `movie_id` char(6) DEFAULT NULL,
  `uid` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of watched_movie
-- ----------------------------
INSERT INTO `watched_movie` VALUES ('10001', '100523');
INSERT INTO `watched_movie` VALUES ('10004', '100523');
INSERT INTO `watched_movie` VALUES ('10019', '100523');
INSERT INTO `watched_movie` VALUES ('10005', '100523');
INSERT INTO `watched_movie` VALUES ('10019', '100524');
