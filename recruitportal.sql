/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : recruitportal

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-07-04 19:11:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for coursegroupmemberphoto
-- ----------------------------
DROP TABLE IF EXISTS `coursegroupmemberphoto`;
CREATE TABLE `coursegroupmemberphoto` (
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursegroupmemberphoto
-- ----------------------------
INSERT INTO `coursegroupmemberphoto` VALUES ('1561196233512.');
INSERT INTO `coursegroupmemberphoto` VALUES ('1561196233518.');
INSERT INTO `coursegroupmemberphoto` VALUES ('1561196612800.');
INSERT INTO `coursegroupmemberphoto` VALUES ('1561196612801.');
INSERT INTO `coursegroupmemberphoto` VALUES ('1561196711943.');
INSERT INTO `coursegroupmemberphoto` VALUES ('1561196807283.');
INSERT INTO `coursegroupmemberphoto` VALUES ('1561196910483.');

-- ----------------------------
-- Table structure for courseresourse
-- ----------------------------
DROP TABLE IF EXISTS `courseresourse`;
CREATE TABLE `courseresourse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `resourse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseresourse
-- ----------------------------
INSERT INTO `courseresourse` VALUES ('1', '数据结构', '1561431407533.', 'resourse/处理机管理习题.ppt');
INSERT INTO `courseresourse` VALUES ('2', '高级java', '1561431480595.', 'resourse/存储管理习题.ppt');
INSERT INTO `courseresourse` VALUES ('3', 'JDBC基础', '1561431515420.', 'resourse/第1章操作系统引论.ppt');
INSERT INTO `courseresourse` VALUES ('5', '难受', '1561533665996.', 'resourse/第2章进程管理.ppt');

-- ----------------------------
-- Table structure for courseresoursetype
-- ----------------------------
DROP TABLE IF EXISTS `courseresoursetype`;
CREATE TABLE `courseresoursetype` (
  `type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseresoursetype
-- ----------------------------
INSERT INTO `courseresoursetype` VALUES ('1', '教学课件');
INSERT INTO `courseresoursetype` VALUES ('2', '视频资源');

-- ----------------------------
-- Table structure for introductions
-- ----------------------------
DROP TABLE IF EXISTS `introductions`;
CREATE TABLE `introductions` (
  `introductionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `type` bigint(20) NOT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`introductionID`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of introductions
-- ----------------------------
INSERT INTO `introductions` VALUES ('51', '      数据结构量款件工程专业的基石。数据结构是计算机存健、组织数据的方式。数据结构是指相互之间存在种或多种特关系的暂据元案的集合。通常情况下，精心选择的数据结构可以需来更篙的送行或著存储效率。数据结构往往同高效的检索算法和素引技术有关。\r\n      Sstaj Ssbni在他的《数据结构、算法与应用》一书中称:“数据结构是数据对象，以及存在于该对象的实例和组成实例的数据元素之间的各种联系。这些联系可以通过定义相关的函数来给出。”他将数据对象(data object)定义为“一个数据对象是实例或值的集合”。\r\n      clifford A. Shaffer在《数据结构与算法分析》一书中的定义是:“ 数据结构是AdT (抽象数据类型Abstract Data Type)的物理实现。”\r\n      Lobert L. Kase在《数据结构与程序设计》-书中，将一个数据结构的设计过程分成抽象层、数据结构层和实现层。其中，抽象层是指抽象数类型层，它讨论数据的逻辑结构及其运算，数据结构层和实现层讨论一个数据结构的表示和在计算机内的存储细节以及运算的实现。\r\n      数据结构具体指同类数据元素中，各元素之间的相互关系，包括三个组成成分，数据的逻辑结构，数据的存储结构和数据运算结构。', '1', null);
INSERT INTO `introductions` VALUES ('52', '      数据的物理结构是数据结构在计算机中的表示（又称映像），它包括数据元素的机内表示和关系的机内表示。由于具体实现的方法有顺序、链接、索引、散列等多种，所以，一种数据结构可表示成一种或多种存储结构。\r\n数据元素的机内表示（映像方法）： 用二进制位（bit）的位串表示数据元素。通常称这种位串为节点（node）。当数据元素有若干个数据项组成时，位串中与个数据项对应的子位串称为数据域（data field）。因此，节点是数据元素的机内表示（或机内映像）。\r\n关系的机内表示（映像方法）：数据元素之间的关系的机内表示可以分为顺序映像和非顺序映像，常用两种存储结构：顺序存储结构和链式存储结构。顺序映像借助元素在存储器中的相对位置来表示数据元素之间的逻辑关系。非顺序映像借助指示元素存储位置的指针（pointer）来表示数据元素之间的逻辑关系。', '2', null);
INSERT INTO `introductions` VALUES ('53', '      一般认为，一个数据结构是由数据元素依据某种逻辑联系组织起来的。对数据元素间逻辑关系的描述称为数据的逻辑结构；数据必须在计算机内存储，数据的存储结构是数据结构的实现形式，是其在计算机内的表示；此外讨论一个数据结构必须同时讨论在该类数据上执行的运算才有意义。一个逻辑数据结构可以有多种存储结构，且各种存储结构影响数据处理的效率。\r\n在许多类型的程序的设计中，数据结构的选择是一个基本的设计考虑因素。许多大型系统的构造经验表明，系统实现的困难程度和系统构造的质量都严重的依赖于是否选择了最优的数据结构。许多时候，确定了数据结构后，算法就容易得到了。有些时候事情也会反过来，我们根据特定算法来选择数据结构与之适应。不论哪种情况，选择合适的数据结构都是非常重要的。\r\n选择了数据结构，算法也随之确定，是数据而不是算法是系统构造的关键因素。这种洞见导致了许多种软件设计方法和程序设计语言的出现，面向对象的程序设计语言就是其中之一。', '3', null);
INSERT INTO `introductions` VALUES ('54', '     在计算机科学中，数据结构是一门研究非数值计算的程序设计问题中计算机的操作对象（数据元素）以及它们之间的关系和运算等的学科，而且确保经过这些运算后所得到的新结构仍然是原来的结构类型。\r\n“数据结构”作为一门独立的课程在国外是从1968年才开始设立的。 1968年美国唐纳德·克努特（Donald Ervin Knuth）教授开创了数据结构的最初体系，他所著的《计算机程序设计艺术》第一卷《基本算法》是第一本较系统地阐述数据的逻辑结构和存储结构及其操作的著作。“数据结构”在计算机科学中是一门综合性的专业基础课，数据结构是介于数学、计算机硬件和计算机软件三者之间的一门核心课程。数据结构这一门课的内容不仅是一般程序设计（特别是非数值性程序设计）的基础，而且是设计和实现编译程序、操作系统、数据库系统及其他系统程序的重要基础。', '4', null);
INSERT INTO `introductions` VALUES ('55', '     而信息的表示和组织又直接关系到处理信息的程序的效率。随着计算机的普及，信息量的增加，信息范围的拓宽，使许多系统程序和应用程序的规模很大，结构又相当复杂。因此，为了编写出一个“好”的程序，必须分析待处理的对象的特征及各对象之间存在的关系，这就是数据结构这门课所要研究的问题。众所周知，计算机的程序是对信息进行加工处理。在大多数情况下，这些信息并不是没有组织，信息（数据）之间往往具有重要的结构关系，这就是数据结构的内容。数据的结构，直接影响算法的选择和效率。', '5', null);

-- ----------------------------
-- Table structure for introductiontype
-- ----------------------------
DROP TABLE IF EXISTS `introductiontype`;
CREATE TABLE `introductiontype` (
  `introductionTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`introductionTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of introductiontype
-- ----------------------------
INSERT INTO `introductiontype` VALUES ('1', '课程简介');
INSERT INTO `introductiontype` VALUES ('2', '教学方法');
INSERT INTO `introductiontype` VALUES ('3', '课程安排');
INSERT INTO `introductiontype` VALUES ('4', '课程大纲');
INSERT INTO `introductiontype` VALUES ('5', '课程理念与目标');

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `linkID` bigint(20) NOT NULL AUTO_INCREMENT,
  `linkName` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`linkID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('2', '重庆理工大学', 'www.123.com');
INSERT INTO `links` VALUES ('3', '百度', 'www.baidu.com2');

-- ----------------------------
-- Table structure for modulecolumn
-- ----------------------------
DROP TABLE IF EXISTS `modulecolumn`;
CREATE TABLE `modulecolumn` (
  `columnID` bigint(20) NOT NULL AUTO_INCREMENT,
  `columnName` varchar(100) NOT NULL,
  `content` longtext,
  `newModuleID` bigint(20) NOT NULL,
  PRIMARY KEY (`columnID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modulecolumn
-- ----------------------------
INSERT INTO `modulecolumn` VALUES ('1', '课程介绍', '数据结构是软件工程专业的基石。数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。Sartaj Sahni在他的《数据结构、算法与应用》-书中称:“ 数据结构是数据对象，以及存在于该对象的实例和组成实例的数据元素之间的各种联系。这些联系可以通过定义相关的函数来给出。”他将数据对象(data object) 定义为“_个数据对象是..', '1');
INSERT INTO `modulecolumn` VALUES ('2', '课程负责人', '马化腾，英文名Pony，1971年10月29日出生， 广 东省汕头潮南区人，毕业于深圳大学计算机系。中国企业家，现代潮商代表人物之一，广东深圳腾讯公司董事会主席兼首席执行官。历年上榜胡润百富榜及福布斯中国富豪榜等，2013年以620亿元人民币名列胡润百富榜第3位，以622亿元人民币名..\r\n', '1');
INSERT INTO `modulecolumn` VALUES ('3', '课程研究', '     《课程研究》杂志创办于1994年，是教育部主管、中央教育科学研究所主办的课程理论学术内刊。从2006年起，《课程研究》杂志作为中国教育学会课程专业委员会的会刊，刊发课程教学研究领域的前沿成果和学术动态，为课程教学理论研究工作者、从事课程改革实践的一线教师及教育行政管理人员搭建交流沟通的平台，提供学术争鸣、观点交锋的园地。设计一个实现①顺序查找②二分查找（折半查找）、④二叉排序树、⑤平衡二叉树、③哈希查找算法的程序，并具有人机交互界面。建立链表结构，综合运用队列的相关知识，实现二叉树的排序。', '7');

-- ----------------------------
-- Table structure for newmodule
-- ----------------------------
DROP TABLE IF EXISTS `newmodule`;
CREATE TABLE `newmodule` (
  `newModuleid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`newModuleid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newmodule
-- ----------------------------
INSERT INTO `newmodule` VALUES ('1', '首页');
INSERT INTO `newmodule` VALUES ('2', '课程介绍');
INSERT INTO `newmodule` VALUES ('3', '教学团队');
INSERT INTO `newmodule` VALUES ('4', '课程建设');
INSERT INTO `newmodule` VALUES ('5', '课程资源');
INSERT INTO `newmodule` VALUES ('6', '问题与答疑');
INSERT INTO `newmodule` VALUES ('7', '课程研究');

-- ----------------------------
-- Table structure for newmoduletype
-- ----------------------------
DROP TABLE IF EXISTS `newmoduletype`;
CREATE TABLE `newmoduletype` (
  `newModuletypeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `newModuleID` bigint(20) NOT NULL,
  `newstypeID` bigint(20) NOT NULL,
  PRIMARY KEY (`newModuletypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newmoduletype
-- ----------------------------
INSERT INTO `newmoduletype` VALUES ('1', '7', '31');
INSERT INTO `newmoduletype` VALUES ('2', '7', '32');
INSERT INTO `newmoduletype` VALUES ('3', '7', '19');
INSERT INTO `newmoduletype` VALUES ('4', '7', '17');
INSERT INTO `newmoduletype` VALUES ('5', '7', '10');
INSERT INTO `newmoduletype` VALUES ('7', '2', '21');
INSERT INTO `newmoduletype` VALUES ('8', '2', '22');
INSERT INTO `newmoduletype` VALUES ('9', '4', '41');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsID` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `publishTime` datetime NOT NULL,
  `deadLine` datetime DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `operator` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `status` smallint(2) DEFAULT NULL COMMENT '1.新建 2.已发布 3.取消发布',
  PRIMARY KEY (`newsID`),
  KEY `new_operator` (`operator`),
  KEY `news_newsType` (`type`),
  KEY `News_title` (`title`) USING BTREE,
  CONSTRAINT `new_operator` FOREIGN KEY (`operator`) REFERENCES `operator` (`operatorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `news_newsType` FOREIGN KEY (`type`) REFERENCES `newstype` (`newsTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('8', '我校成功承办“高端装备传动系统共性基础问题研讨会”', '        由国家自然科学基金委员会工程与材料科学部主办、我校与北京工业大学、重庆大学联合承办的“高端装备传动系统共性基础问题研讨会”，于2014年1月10日—12日在重庆天宇大酒店隆重举行。精密机械和微纳机械专家王立鼎院士、齿轮协会名誉会长王声堂教授级高工、合肥工业大学副校长赵韩教授、北京工业大学长江学者石照耀教授、西安交通大学毛世明教授、重庆大学秦大同教授等传动领域知名学者，以及国家自然科学基金委员会工程与材料科学部二处赖一楠主任出席了会议。我校石晓辉校长、许洪斌副校长，机械工程学院、车辆工程学院、汽车零部件先进制造技术教育部重点实验室、机械检测技术与装备教育部工程中心、科研处等部门领导和教师代表出席了会议。会议聚集了全国齿轮行业高端人才80余人。\r\n\r\n        本次会议从国家重大工程需求和行业发展的高度，梳理研究现状，分析我国的差距与特色优势，探讨高端装备中传动系统的共性基础问题，侧重齿轮传动新原理及新方法等方面研讨。会议主要由大会主题报告与分组讨论两阶段构成。\r\n\r\n        石晓辉校长在致辞中热情欢迎王立鼎院士及国家自然科学基金委领导，感谢他们对重庆理工大学各项工作的支持。王立鼎院士做了题为“关于精密圆柱齿轮加工与测试技术的思考”的报告，提出了精密圆柱齿轮加工的新思路；王声堂会长做了题为“齿轮共性技术平台的市场化建设问题”的报告，畅想了科技与市场相结合的新模式；赵韩副校长详尽剖析了国内齿轮的研究情况；许洪斌副校长做了题为“齿轮表面工程新技术及研究进展”报告，共享了齿轮表面工程的新技术，并提出了下一步工作的新方向；北京工业大学石照耀教授探讨了齿轮测量的前沿问题；西安交通大学毛世明教授介绍了英国齿轮传动技术的研究现状。与会代表踊跃发言，为我国高端传动领域今后的发展献言献策。新年伊始，国家自然科学基金委将全年召开的为数不多的学术研讨会，首先定位在“高端传动领域”，并由我校承办，足见基金委对传动研究领域的重视以及对我校科研工作的肯定。\r\n\r\n        最后，基金委领导就高端传动领域下一步的研究工作做出了重要指示：要从注重传动单元技术转向关注传动系统整体集成技术；从国家重大需求出发，站在理论研究前沿实现传动机理的突破；从行业需求的角度，从下至上梳理科学问题，进行学科交叉，实现理论与实践的完美结合。\r\n\r\n（机械工程学院、车辆工程学院、科研处供稿并提供图片       责编/钟世潋）\r\n\r\n3国家自然科学基金委领导做报告\r\n\r\n由国家自然科学基金委员会工程与材料科学部主办、我校与北京工业大学、重庆大学联合承办的“高端装备传动系统共性基础问题研讨会”，于2014年1月10日—12日在重庆天宇大酒店隆重举行\r\n\r\n2王立鼎院士做报告\r\n\r\n王立鼎院士做报告\r\n\r\n4王声堂会长做报告\r\n\r\n王声堂会长做报告\r\n\r\n5合肥工业大学副校长赵韩教授做报告\r\n\r\n合肥工业大学副校长赵韩教授做报告\r\n\r\n6重庆理工大学副校长许洪斌教授做报告\r\n\r\n重庆理工大学副校长许洪斌教授做报告\r\n\r\n7石耀照教授做报告\r\n\r\n石耀照教授做报告\r\n\r\n8西安交通大学毛世明教授做报告\r\n\r\n西安交通大学毛世明教授做报告\r\n\r\n9王立鼎院士与学校领导交流合影\r\n\r\n王立鼎院士与学校领导交流合影\r\n', '2014-01-15 13:45:12', null, '8', '2', '19', '2');
INSERT INTO `news` VALUES ('25', '视频监控显成效 我校破获一起学生寝室笔记本电脑盗窃案件', '    2014年1月13日11时20分，车辆学院学生张某报案称：8时30分寝室四名同学参加考试离开寝室（榕轩），11时15分回寝室时发现四台笔记本电脑被盗，随即向保卫处报案。\r\n    接到报案后，保卫处高度重视，立即成立专案组，组织力量进行侦破。通过相关技术侦查手段和调取视频监控录像，于当天下午14时左右锁定了犯罪嫌疑人，并完整再现了嫌疑人进出校区的所有活动轨迹。并在1月14日上午开展的抓捕行动中成功将该嫌疑人抓获，并配合地方公安机关立即开展追赃行动，成功将四台笔记本电脑追回，挽回了学生损失，目前该嫌疑人已移交公安机关刑拘，等待的将是法律的严惩。\r\n    本次案件的快速侦破，我校视频监控系统发挥了积极地作用，虽然嫌疑人进行了伪装作案，但法网恢恢，疏而不漏，电子眼全天候监控，将尽最大力度保障师生生命财产安全。\r\n    保卫处在此提醒：春节寒假将至，也是每年的案件高发时期，同学们应妥善保管好自身财物，避免财产意外损失。同时，保卫处设立举报电话，对无学籍却违规滞留在学生宿舍的校漂族（本次作案嫌疑人即为无学籍却违规滞留在学生宿舍的校漂族）进行举报，举报电话：023-62563110。\r\n（保卫处供稿并提供图片     责编/钟世潋）\r\n \r\n8QW`TQD[H27QAM7I6KYMJ55\r\n保卫处向公安机关移交犯罪嫌疑人', '2014-01-16 15:04:32', null, '23', '2', '19', '2');
INSERT INTO `news` VALUES ('26', '我校科技人才队伍建设取得显著成效', '    2013年，我校坚持实施人才强校战略，不断推进科技人才队伍建设工作，取得了显著成效。\r\n    在科研创新团队建设方面，继续抓好已有市级高校创新团队的建设工作，在科学研究、标志性成果打造、人才培养、带头人塑造、体制创新性探索等方面均取得了较好成绩，其中，“精密检测技术与智能传感器”和“汽车传动系统零部件制造与检测技术”2个首批团队在国内已凸显了一定的科研优势和社会影响；通过积极谋划和精心组织，择优遴选推荐的“高性能齿轮先进制造技术及传动系统”、“企业战略与技术创新”和“汽车性能CAE开发技术”3个团队成功入选了第三批重庆市高校创新团队建设计划。目前我校已累计获得8个创新团队建设计划支持，在市属高校中名列前茅。\r\n    在科技人才培养方面，通过政策的引领，营造人才成长的良好环境。同时依托校级、市级科研创新团队建设计划、校级青年英才等人才队伍建设工程，形成了定位明确、层次清晰、衔接紧密、促进优秀人才可持续发展的培养和支持体系。于2013年获得了一批省部级科技人才支持计划。如：刘小康教授获得了教育部新世纪人才支持计划；林治华教授入选首批重庆市科技创新领军人才；全学军教授获得了重庆市百名工程技术高端人才培养计划；蒋成约博士、但远宏博士、胡学步博士和杨朝龙博士获得了首批重庆市新产品创新青年科技人才培养项目支持。\r\n    2014年是我校实现“十二五”规划发展目标的攻坚之年，我校将进一步推进人才强校战略，培养一批青年科技人才，建设一批高水平的科研创新团队，为提升学校科研水平起到积极推动作用。\r\n（科研处供稿       责编/钟世潋）', '2014-01-16 15:05:37', null, '18', '2', '19', '2');
INSERT INTO `news` VALUES ('635', '雅虎COO离职获$1.09亿 梅耶尔被讽帅位难保', '    凤凰科技讯 北京时间1月20日消息，据Mashable网站报道，自2012年走马上任以来，梅耶尔的在雅虎连珠炮似的收购令人瞠目结舌，业界对梅耶尔的“掌舵”能力一直质疑不断。上周，雅虎COO亨利奎·迪卡斯特罗(Henrique De Castro)被解雇，可能会获得雅虎提供的天价补偿金，梅耶尔再次遭到业界炮轰，甚至有苹果前高管警告称，梅耶尔离下课已经不远。\r\n\r\n    迪卡斯特罗的离职补偿金数额并无官方数字，美国高管补偿与公司管理数据公司Equilar称，迪卡斯特罗被炒所获得的补偿，总数可能达到1.09亿美元。\r\n\r\n    同样在上周，雅虎刚刚以8000万美元收购了一家创业公司，金额不及“补偿款”。去年11月，谷歌投资8000万美元，兴建六座太阳能发电站。美国收入最高的职业运动员老虎·伍兹，去年一年仅入手7810万美元。2011年，雅虎前CEO巴茨女士离职时，也只获得了1000万美元补偿金。\r\n\r\n    苹果前任高管让路易斯·卡西（Jean-Louis Gassée）在Twitter上用一个商业寓言，讽刺梅耶尔：她有三个的信封，第一个信封，是指责前任，第二个信封是指责下属（炒掉卡斯特罗），梅耶尔现在需要准备第三个信封。这个寓言的原意是，一个离职的CEO,给接班人留下了三个信封。第三封信的内容就是“给接任者留下三个信封”，意为做好被炒鱿鱼准备。\r\n\r\n    虽然，此次用人失察和天价补偿金，还不会直接导致梅耶尔雅虎CEO生涯的终结。但是，如果雅虎在今年因此蒙受更多损失，迪卡斯特罗解聘事件，将被视为梅耶尔最大失误之一。（编译/暮成雪）', '2014-01-20 13:48:11', '2020-01-21 13:47:32', '3', '2', '30', '2');
INSERT INTO `news` VALUES ('636', '亚马逊电子商务负责人布莱恩·瓦伦丁将离职', '    亚马逊公司高级副总裁、电子商务业务负责人布莱恩·瓦伦丁\r\n\r\n　　据《华尔街日报》网站报道，亚马逊公司高级副总裁、电子商务业务负责人布莱恩·瓦伦丁(Brian Valentine)将于2月份离职。亚马逊公司发言人暂未透露其离职原因。\r\n\r\n　　据了解，布莱恩于2006年加盟亚马逊，已经在亚马逊工作了七年多时间。在此之前，布莱恩曾在微软工作了近20年，曾任微软公司Windows业务部门高级副总裁。\r\n\r\n　　亚马逊公司发言人表示，现年54岁的布莱恩已经决定离职，但该发言人未透露布莱恩即将离职的具体原因。亚马逊发言人表示，在布莱恩离职之后，公司其他高管将暂时接管布莱恩职务相关的业务。(文刀) ', '2014-01-20 13:49:18', '2014-01-22 13:48:54', '5', '2', '30', '2');
INSERT INTO `news` VALUES ('637', '日本将研发军用监视卫星 加强探测中朝导弹', '【环球网综合报道】新加坡《联合早报》网站1月20日报道称，日本的宇航研究项目，开始向军用方向挺进。日本国家宇航研发机构日前受命，制造能探测导弹的监视卫星。消息指出，这一项研究计划，目的在于提升日本的防空监控力，“应对拥有导弹发射技术的中国和朝鲜”。\r\n\r\n　　据日本《读卖新闻》披露，日本政府准备在今年的财政预算中，继续扩大在宇航研发领域的费用。当局拟定的宇航基本计划包括，制造一台价值高达3000亿到5000亿日元(约合174亿到290亿元人民币)的紫外线感应器监视卫星。\r\n\r\n　　据了解，这项计划早在2009年就已经敲定，但因日本的宇航事业规定不准与战事挂钩而不得不搁置。目前，这一束缚已被松绑，意味着宇宙研发部门此后能进行研发具有军用意图的项目。\r\n\r\n　　目前，日本用于收集情报的卫星一共有四个，两个搭配的光导感应器，另两架是雷达。四台监视卫星每24小时轮流环绕地球一周，足以覆盖和监视地球上的一切。然而，在应对导弹上却有局限。2013年12月12日，朝鲜发射长距离导弹，日本是从美国那里取得发射消息。日本执政党自民党内对此存在隐忧，认为若不是获得美国情报，日本就只有坐以待毙。\r\n\r\n　　报道指出，日本当局决定研制高感应能力的监视卫星，不仅是为了自身的安保需要，也能为日美导弹防御系统出点力。\r\n\r\n　　在应对导弹上，具备高感应的监视卫星，效率要比一般卫星高出50倍。它能在3.6万公里高度的轨道内运行。在日美的导弹防御机制里，日本扮演的是监视角色。预估，日本今后所能收集的太空情报量会增加。\r\n\r\n　　此外，日本当局也在筹备研制“低高度卫星”，希望制造低飞的卫星，拍摄更为清晰的地表图片。 ', '2014-01-20 13:52:24', null, '4', '3', '32', '2');
INSERT INTO `news` VALUES ('638', '美军方测试“智能步枪” 可令初学者媲美神枪手', '【环球时报特约记者 候涛】通常培养一名神枪手，需要耗费成千上万发子弹进行长期训练。不过美国应用科技企业“跟踪点公司”日前宣布，美国军方已经开始测试其所制造的多种“智能步枪”。这种先进武器配备有内置电脑系统及传感器，可以让初学者的命中率也媲美甚至超越专业狙击手。美国《华盛顿时报》17日称，这种“智能步枪”能成为“改变游戏规则者”。\r\n\r\n　　据“今日俄罗斯”新闻网17日报道，美陆军已购买6支“智能步枪”进行测试，每支售价在1万美元-2.7万美元之间。尽管价格远比单价数百美元的M16步枪或M4卡宾枪昂贵，不过“跟踪点公司”宣称“物有所值”。该公司在内华达州博尔德城举行的年度射击展览大会上展示了这种武器。美国福克斯新闻网称，“跟踪点公司”市场部负责人奥伦·朔伊布勒证实，最近几个月来，美国军方正在对此类武器进行评估。几十名没有经验的新枪手验证了这种武器的性能。测试中，这些人只有一枪或两枪未能射中1000码(约合914.4米)外的靶子。他说：“可以这么讲，在1000码距离内，对于缺乏经验的枪手而言，已具备约70%的第一枪命中率。”相比之下，即便是军队狙击手和专业枪手，他们使用普通步枪时第一枪命中率也只在20%-30%之间，通常需要根据第一枪的命中情况进行修正后，才能在随后的射击中达到70%的命中率。“跟踪点公司”强调，现代战场正变得日益复杂和网络化，内置电脑能自动收集弹道数据、战场图像和天气条件。“智能步枪”具备先进瞄准技术，使用者只需标记屏幕上的可视目标，内置电脑系统就会告诉枪手究竟如何握住枪以及何时扣动扳机。朔伊布勒还表示，美国军方测试旨在确定普通部队如何使用这种武器，但尚不清楚这种“智能步枪”会得到何种程度的欢迎。\r\n\r\n　　雅虎英国新闻网17日称，这种“智能步枪”可以使任何人都成为神枪手。然而，美国越战老兵克里斯·弗兰德森警告说，这家公司应该禁止让“智能枪”流向民间，因为罪犯可能会利用这种枪作案，并且可以潜在不被发现的地方。 (来源：环球时报)', '2014-01-20 13:55:08', null, '7', '3', '32', '2');
INSERT INTO `news` VALUES ('639', '金正恩指导朝军队夜间训练 强调实战训练重要性', '　　中新网1月20日电 据朝中社20日报道，朝鲜劳动党第一书记、国防委员会第一委员长、人民军最高司令官金正恩，日前前往朝鲜人民军空降兵部队，对夜间训练进行了指导。金正恩指出，军人要想圆满完成战斗任务，就要心怀高度的思想觉悟，在实战气氛中进行训练。\r\n\r\n　　据报道，金正恩在听取了训练指挥官对训练计划的汇报后，下令开始训练。随后一批载有空降兵的运输机陆续飞抵训练场上空，接着空降兵从天而降，完成了平时磨练的战法和动作，并向金正恩展示了正确着陆指定地点，占领“敌阵”的场面。\r\n\r\n　　金正恩就此高度评价称，训练做得不错，尽管夜间条件不利，但空降兵和飞行员们都出色地完成了艰难的任务。此外，金正恩还会了完成定点降落训练的空降兵，并对他们进行了鼓励。\r\n\r\n　　金正恩表示，朝鲜人民军需要抓紧完成战斗准备，以加强朝鲜军事力量。 此外，金正恩还就大力掀起训练热潮作了重要指示。金正恩指出，同敌人的对决可能会在最恶劣的条件下进行。军人要想在可能遭遇的任何情况和条件下，都能圆满完成战斗任务，就要心怀高度的思想觉悟，在实战气氛中进行训练。\r\n\r\n　　据报道，崔龙海、李永吉、张正男、边仁善、金格植、金秀吉、李炳哲、朴正川、黄炳誓陪同观摩训练。(完)', '2014-01-20 13:56:13', null, '3', '3', '32', '3');
INSERT INTO `news` VALUES ('640', '苏宁与中国移动合作 全国铺设4G体验厅', '晨报讯（记者 刘映花）1月17日起，中国移动TD-LTE版iPhone 5S在苏宁门店、乐购仕门店及苏宁易购同步销售。\r\n\r\n　　据介绍，4G移动版iPhone 5S在北京苏宁线上线下仅先期预定量就超过3000台。北京苏宁工作人员表示，高销量除了苹果一直以来的超高人气外，还得益于4G网络的应用。苏宁与中国移动签署了2014年TD终端销售渠道战略合作协议，明确了全年200%的增长目标。针对2014年4G元年，未来苏宁还将与中国移动合作，在北京、上海、广州、南京等全国一二线城市，基于苏宁互联网门店、超级店和地区旗舰店，全面铺设4G产品体验厅。', '2014-01-20 13:57:51', null, '2', '3', '31', '3');
INSERT INTO `news` VALUES ('641', '天价手机靓号身价飙升至百万元 一个号值一套房', ' 　　“我做梦也想不到，自己的一串11位数字竟然会值10多万元……”家住河南登封的刘向前，用近乎喊的方式告诉记者这个令他难以置信的消息，而这11位数字就是他的手机号码。如今，一些被称为“优号”、“吉祥号”、“靓号”的老号段手机号码，身价从几万元飙升至几十万甚至百万元。11位普通数字特殊组合在一起的价值，有时竟相当于北京四环内的一套住房。“靓号”如何成了价值不菲的“宝贝”？手机号码“炒号热”为何卷土重来？记者对此进行了调查。\r\n\r\n　　尾号“9527”：因周星驰的电影而身价倍增\r\n\r\n　　在手机还是“奢侈品”时，单一的数字如“8”与“6”受到很多人追捧。随着手机用户的不断增加，单一的数字发展为重叠数字等“特殊号码”。后来，手机逐渐普及，“特殊数字”已经不能够满足人们需求，因此组合被列入其中，越特殊的组合号码就越“珍贵”。\r\n\r\n　　据刘向前介绍，他尾号为“9527”的手机号码卖出了16万元高价。为了证实他的说法，记者致电一位电话为“15×××666666”的王姓买主，表示有意购买他新购置的尾号为“9527”的电话号码。\r\n\r\n　　王姓买主回应称：“多少钱都不卖。 ”同时表示，他是香港影星周星驰的粉丝，“9527”是周星驰在《唐伯虎点秋香》中华府的家奴编号，同时也是他在《逃学威龙》里扮演的警察的编号，找到这个号码是缘分，不能卖。不仅如此，这位王姓买主还表示，记者拨打的这个尾数为6个“6”的电话号码，是他用一套房子换来的。“现在一个号码值一套房子，哪里还是新鲜事！ ”', '2014-01-20 13:59:28', null, '1', '3', '31', '2');
INSERT INTO `news` VALUES ('642', '心理学家研究：1月20日是2014年最感伤的一天', '   中国网1月20日讯 据俄罗斯《共青团真理报》网站1月18日报道, 1月的第三个星期一几乎成为了节日。因为今年的1月20号将被大家注意。即使这一天是最压抑的日子。\r\n\r\n   英国卡迪夫大学的心理学家克里夫穆考虑到现在天气不好，假期过去,不得不上班，需要规划自己的未来。更糟糕的是，我们的钱花完了，但醉酒的状态似乎还没完全结束。距离下一个节日——5月1号需要漫长的等待。\r\n\r\n   心理学的分割法和乘法特别系数反映出人类心灵状态在1月中旬最糟糕, 卡迪夫大学的心理学家通过计算得出相应具体日期——1月的第三个星期一。\r\n\r\n   欧洲称星期一为蓝色星期一，忧郁的星期一。俄罗斯更愿意“庆祝”这一天。因为俄罗斯在一月的自然条件更糟糕。由于冬令时取消，俄罗斯的冬天早上很黑，比欧洲黑暗多了。\r\n\r\n   心理学家早已在科学的基础上认识到这一点，虽然起初她是为了使一些旅游公司给最悲伤的一天——一月的第三个星期提供有趣的活动。也许，该把这一天变为休息日了。（实习编译：陈敬敬）', '2014-01-20 14:01:24', null, '1', '3', '31', '2');
INSERT INTO `news` VALUES ('643', '中国自研操作系统欲破垄断 未知研发成本', '    比特网(ChinaByte)1月20日消息，中科院软件研究所携上海联彤日前发布了一款自主开发的智能手机操作系统：COS，宣称要打破谷歌、苹果和微软系统在中国的垄断地位。\r\n\r\n　　这是继同洲960之后第二款号称拥有自主产权的智能终端操作系统。目前，微博上已经曝光了搭载该系统的首款手机谍照，以及其UI界面。\r\n\r\n　　据美国《纽约时报》网站1月17日报道，15日在北京举行的一个发布会上，中国科学院和上海联彤网络通讯技术有限公司发布了自主开发的“中国操作系统”(COS)，这款操作系统可应用于智能手机、个人电脑等许多设备。\r\n\r\n　　报道称，中科院称COS系统是维护国家安全的一款战略性产品，在美国曝出监控丑闻和微软宣布将停止对Windows XP提供进一步支持的消息后，中国急需这样一款自主研发的操作系统。\r\n\r\n　　中科院网站上刊登的一篇文章称，COS系统从底层代码到用户界面构建“完全”是独立演进的;目前基于开源的操作系统在安全性上存在很多问题，国外公司主导的操作系统存在“水土不服”的情况，COS的出现将同时解决这两方面的问题。\r\n\r\n　　中科院软件研究所所长李明树15日表示，研究人员打算继续改进COS系统，以便让它赶上甚至超越如今垄断中国市场的其他操作系统。\r\n\r\n　　事实上，COS系统并不是唯一自主开发的国产操作系统。最近，中国科技公司深圳同洲电子股份有限公司宣布开发了拥有独立知识产权的国内首款智能手机操作系统。据同洲电子董事长袁明表示，这款名为960 OS的手机操作系统前后开发了15年。\r\n\r\n　　COS系统花了多长时间开发、其研发成本有多高尚未公布。', '2014-01-20 14:03:14', null, '15', '2', '30', '2');
INSERT INTO `news` VALUES ('644', '淘宝发布县域网购发展报告 颠覆你的认知', '　  让你意想不到的事正在发生。\r\n\r\n　　当城市里的你享受着“当日达”的服务时，这个国度的西北角，有快递员正在使用骆驼、马来运货。当你正高呼“再买就剁手”时，在某个不知名的小县城里，却已经有人轻松超越了你的网购花费。你以为只有一二线城市的人才会懂享受国际大牌，可事实上，县城用户买起大牌来更疯狂。\r\n\r\n　　这些颠覆你想象的结论，并不是凭空而来的假设，而是通过实际的数据得出来的。7月29日，淘宝发布《县域网购发展报告》(xc.taobao.com)，统计分析了包括县、县级市、旗、自治旗、自治县、林区和县级特区在内共计2006个县域地区的网购数据。\r\n\r\n　　在这份报告里，我们看到了县域网购力量的巨大释放：2012年，县域地区共有超过3000万人上淘宝购物，花费达1790亿元，比上一年增长了87%。平均下来，每个人网购花费近6000元。这个数字，比一二线城市还要高。\r\n\r\n　　我们也看到了，县域地区用户对于网购的渴求，这不仅表现在他们不停吐槽偏远地区物流费用比“江浙沪”更高，还表现在，他们一年人均网购54次，远远超过了一二线城市的39次。\r\n\r\n　　除此之外，我们还看到了……\r\n\r\n　　疯狂的名牌 每百元成交近半来自县城\r\n\r\n　　抽取的44个品牌中有32个县城人均购买额高于一二线\r\n\r\n　　一边是雅诗兰黛、mango、vans等国际名品，另外一边是拖拉机、牛羊、麦田之类的农村情景，你能想象，他们放在同一副画面中吗?是的，这的确有些奇怪。但这一幕，正每天上演。\r\n\r\n　　淘宝《县域网购发展报告》抽取了天猫上的44个品牌数据，就有32个品牌的县城用户人均购买金额高于一二线城市。这其中，就包括了雅诗兰黛、耐克、优衣库、倩碧、vans等。\r\n\r\n　　以雅诗兰黛为例，这个即使是在一二线城市，也还永远只属于高档专柜的国际大牌，几乎没有进驻过县城。传统渠道的不足，导致大部分县里的人只能在电视里看到广告，却不能在身边的商场买到。\r\n\r\n　　但是，即便如此，县域地区用户却能通过网购来释放他们对于大牌的消费欲望。淘宝数据显示，2012年县域地区的用户平均每个人花了765块钱在天猫上购买雅诗兰黛，而一二线用户，平均每个人只花了652块钱。这说明，县域用户对于国际大牌具有较强的消费能力。\r\n\r\n　　无法在线下买到的国际大牌尚且如此，而像红蜻蜓、九牧王等覆盖相对较广的国内品牌，更是受到县域用户的热捧，其在县域地区的成交规模比一二线都要高。以红蜻蜓为例，在它通过网购销售出去的每100元中，就有42元来自于县城，来自一二线城市的仅有31元，其余27元则来自于三四线以及海外、港澳台用户。', '2014-01-20 14:13:44', null, '5', '4', '17', '2');
INSERT INTO `news` VALUES ('651', '通知公告', '通知公告的内容', '2019-06-20 16:17:50', null, '1', '4', '10', '2');
INSERT INTO `news` VALUES ('652', '数据结构设计大赛', '      这是数据结构设计大赛的内容', '2013-11-01 00:00:00', null, '25', '2', '21', '2');
INSERT INTO `news` VALUES ('653', '数据结构研讨大会', '      这是数据结构设计大赛的研讨大会', '2013-10-10 00:00:00', null, '5', '2', '21', '2');
INSERT INTO `news` VALUES ('654', 'test', 'test内容', '2019-06-22 00:00:00', null, '2', '2', '22', '2');
INSERT INTO `news` VALUES ('655', 'jhjh', 'asdzf', '2019-06-24 17:04:44', '2024-01-15 00:20:17', '0', '2', '19', '1');
INSERT INTO `news` VALUES ('656', '课程建设目标', '一、课程的性质和目的\r\n\r\n      数据结构是计算机学科的核心专业基础课程，是计算机程序设计的重要理论和实践基础。本课程讨论了软件设计中经常遇到的线性表、堆栈、队列、串、数组、二叉树、图等典型数据结构的设计方法以及各种典型排序和查找算法的性能和设计方法，并介绍了各种典型数据结构的应用。通过本课程的学习，学生对软件设计的基本要素和软件的基本结构有了深入理解，并通过算法设计方法学习和上机编程实践，编程能力有了进一步提高。\r\n\r\n \r\n\r\n二、课程教学内容\r\n第一章  绪论\r\n\r\n基本内容：\r\n\r\n       1．了解数据结构的基本概念；\r\n\r\n       2．了解数据类型和抽象数据类型的概念；\r\n\r\n       3．理解算法的设计目标；\r\n\r\n       4．掌握算法的时间复杂度概念和算法的时间复杂度分析方法。\r\n\r\n教学难点：\r\n\r\n       1．算法的时间复杂度概念；\r\n\r\n       2．算法的时间复杂度分析方法。 \r\n\r\n第二章  线性表\r\n\r\n基本内容：\r\n\r\n       1．了解线性表的逻辑结构和基本操作；\r\n\r\n       2．理解线性表的顺序存储结构和实现方法；\r\n\r\n       3．理解线性表的链式存储结构和实现方法；\r\n\r\n       4．了解单循环链表和双向链表的概念和基本设计方法。\r\n\r\n教学重点：\r\n\r\n       1．顺序存储结构和顺序表的设计方法；\r\n\r\n       2．链式存储结构和单链表的设计方法。\r\n教学难点：\r\n\r\n单链表的设计方法，主要是单链表操作实现的算法语句学生理解有困难。\r\n\r\n第三章  堆栈和队列\r\n\r\n基本内容：\r\n\r\n       1．理解堆栈的概念、顺序堆栈和链式堆栈的设计方法；\r\n\r\n       2．理解队列的概念、顺序循环队列和链式队列的设计方法；\r\n\r\n       3．了解堆栈和队列的应用方法。\r\n\r\n教学重点：\r\n\r\n       1．顺序堆栈和链式堆栈的设计方法；\r\n\r\n       2．顺序循环队列和链式队列的设计方法。\r\n教学难点：\r\n\r\n顺序循环队列的几种典型队空和队满判断方法。\r\n\r\n第四章  串\r\n\r\n基本内容：\r\n\r\n       1．理解串的概念和串的基本操作；\r\n\r\n       2．理解串的静态存储结构、动态存储结构和链式存储结构；\r\n\r\n       3．了解串基本操作的实现方法；\r\n\r\n       4．了解串的BF模式匹配方法。\r\n\r\n教学重点：\r\n\r\n       串的动态存储结构。\r\n\r\n第五章  数组\r\n\r\n基本内容：\r\n\r\n      1．理解数组的概念和数组的静态、动态存储结构；\r\n\r\n      2．了解特殊矩阵的压缩存储方法；\r\n\r\n      3．了解稀疏矩阵的基本压缩存储方法，包括稀疏矩阵的三元组概念，以及稀疏矩阵三元组的顺序表、单链表和十字链表存储结构。\r\n\r\n教学重点：\r\n\r\n       数组的动态存储结构。\r\n\r\n第六章  递归\r\n\r\n基本内容：\r\n\r\n       1．理解递归的概念、递推公式的归纳方法和递归算法的执行过程；\r\n\r\n       2．掌握递归算法的问题分析和算法设计方法；\r\n\r\n       3．了解递归算法时间效率低的原因；\r\n\r\n教学重点：\r\n\r\n      1．递推公式的归纳；\r\n\r\n      2．递归算法的执行过程；\r\n\r\n      3．递归算法的设计方法。\r\n\r\n教学难点：\r\n\r\n      设计递归算法的问题分析方法。\r\n\r\n第七章  树和二叉树\r\n\r\n基本内容：\r\n\r\n       1．了解树的定义、树的表示方法和树的几种典型存储结构；\r\n\r\n       2．理解二叉树的定义、二叉树的性质、二叉树的存储结构和二叉树操作的实现方法；\r\n\r\n       3．掌握二叉树的遍历算法和二叉树问题的遍历算法设计分析和实现；\r\n\r\n       4．理解哈夫曼树的概念和哈夫曼树在编码方面的应用方法；\r\n\r\n       5．理解树与二叉树的转换方法；\r\n\r\n       6．理解树的遍历方法。\r\n\r\n教学重点：\r\n\r\n      1．二叉树的性质、二叉树的存储结构；\r\n\r\n      2．二叉树的遍历算法和二叉树遍历算法的应用；\r\n\r\n      3．哈夫曼树在编码方面的应用方法。\r\n\r\n教学难点：\r\n\r\n      1．二叉树的性质以及利用这些性质分析问题的方法；\r\n\r\n      2．二叉树问题的遍历算法设计分析和实现。', '2019-06-24 22:03:57', null, '0', '2', '41', '1');

-- ----------------------------
-- Table structure for newstype
-- ----------------------------
DROP TABLE IF EXISTS `newstype`;
CREATE TABLE `newstype` (
  `newsTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`newsTypeID`),
  UNIQUE KEY `NewsType_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newstype
-- ----------------------------
INSERT INTO `newstype` VALUES ('30', '互联网');
INSERT INTO `newstype` VALUES ('22', '其他');
INSERT INTO `newstype` VALUES ('32', '军事');
INSERT INTO `newstype` VALUES ('19', '学生新闻');
INSERT INTO `newstype` VALUES ('17', '学院新闻');
INSERT INTO `newstype` VALUES ('18', '实验室新闻');
INSERT INTO `newstype` VALUES ('31', '科技');
INSERT INTO `newstype` VALUES ('21', '课程动态');
INSERT INTO `newstype` VALUES ('41', '课程建设');
INSERT INTO `newstype` VALUES ('10', '通知公告');

-- ----------------------------
-- Table structure for operator
-- ----------------------------
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator` (
  `operatorID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `account` varchar(16) NOT NULL COMMENT '登录时候用{3,16}',
  `password` varchar(18) NOT NULL COMMENT '{6,18}位',
  `type` bigint(20) NOT NULL COMMENT '普通用户、管理员、系统管理员',
  `email` varchar(100) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL COMMENT '男或者女',
  `photo` varchar(100) DEFAULT NULL COMMENT '保存头像文件的相对路径',
  PRIMARY KEY (`operatorID`),
  UNIQUE KEY `Operator_account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operator
-- ----------------------------
INSERT INTO `operator` VALUES ('1', '胡均', 'hujun', '123', '1', '456@qq.com', '男', '1561431515420.');
INSERT INTO `operator` VALUES ('2', '徐传运', 'ddd', '123', '2', '289@qq.vom', '男', '1561431515420.');
INSERT INTO `operator` VALUES ('3', '王宝强', 'xxoo', '123', '2', 'hehehe@qq.com', '女', '1389605680151.');
INSERT INTO `operator` VALUES ('4', '趴在墙头等红杏', 'tellme', '123', '2', '90909803333@126.com', '男', '1389605714021.');
INSERT INTO `operator` VALUES ('5', '今天', 'tiantian', '123', '9', '110@123.cop', '女', '1561532619026.jpg');
INSERT INTO `operator` VALUES ('6', 'oneNote', 'one', '123', '9', '2378@qq.com', '男', '1389605737877.');
INSERT INTO `operator` VALUES ('8', '我是超人', 'superman', '123', '9', 'super@1.com', '男', '1389605754804.');
INSERT INTO `operator` VALUES ('10', '贵州茅台', '123', '123', '9', '234234@qq.com', '女', '1389605776490.');
INSERT INTO `operator` VALUES ('16', '杨格格', 'gege', '123', '9', 'gege@123.com', '女', '1390119230129.');

-- ----------------------------
-- Table structure for operatortype
-- ----------------------------
DROP TABLE IF EXISTS `operatortype`;
CREATE TABLE `operatortype` (
  `operatorTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`operatorTypeID`),
  UNIQUE KEY `OperatorType_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operatortype
-- ----------------------------
INSERT INTO `operatortype` VALUES ('10', 'test1');
INSERT INTO `operatortype` VALUES ('9', '普通用户');
INSERT INTO `operatortype` VALUES ('2', '管理员');
INSERT INTO `operatortype` VALUES ('1', '系统管理员');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permissionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `operator` bigint(20) NOT NULL COMMENT '登录时候用{3,16}',
  `newstype` bigint(20) NOT NULL COMMENT '一个管理员可以分配多个类型的新闻，管理员只能发布自己有权限的类型的新闻。',
  PRIMARY KEY (`permissionID`),
  KEY `permission_operator` (`operator`),
  KEY `permission_newsType` (`newstype`),
  CONSTRAINT `permission_newsType` FOREIGN KEY (`newstype`) REFERENCES `newstype` (`newsTypeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_operator` FOREIGN KEY (`operator`) REFERENCES `operator` (`operatorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('35', '4', '30');
INSERT INTO `permission` VALUES ('36', '4', '19');
INSERT INTO `permission` VALUES ('37', '4', '17');
INSERT INTO `permission` VALUES ('38', '4', '31');
INSERT INTO `permission` VALUES ('39', '3', '32');
INSERT INTO `permission` VALUES ('40', '3', '17');
INSERT INTO `permission` VALUES ('41', '3', '31');
INSERT INTO `permission` VALUES ('59', '2', '19');
INSERT INTO `permission` VALUES ('60', '2', '17');
INSERT INTO `permission` VALUES ('61', '2', '18');

-- ----------------------------
-- Table structure for recordrownumber
-- ----------------------------
DROP TABLE IF EXISTS `recordrownumber`;
CREATE TABLE `recordrownumber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lineNumber` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recordrownumber
-- ----------------------------
INSERT INTO `recordrownumber` VALUES ('1', '10', 'messageManagement');
INSERT INTO `recordrownumber` VALUES ('2', '10', 'passageManagement');

-- ----------------------------
-- Table structure for teacherteam
-- ----------------------------
DROP TABLE IF EXISTS `teacherteam`;
CREATE TABLE `teacherteam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `teachAge` int(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `introduce` longtext,
  `titletype` varchar(100) DEFAULT NULL,
  `collega` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `titletype` (`titletype`)
) ENGINE=InnoDB AUTO_INCREMENT=20190007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacherteam
-- ----------------------------
INSERT INTO `teacherteam` VALUES ('20190001', '王富贵', '3', '1561431407533.', '工学博士、北京大学教授、博士生导师 [1]  ，国家“万人计划”首批入选专家，科技部“国家中青年科技创新领军人才”、国家重点研发计划“智能机器人”总体组专家。兼任中国人工智能学会副理事长，全国智能机器人创新联盟副理事长，深圳市政协委员（科学技术界）。现任北京大学深圳研究生院科研处处长、智能机器人开放实验室主任。计算机科学学士（1990年）、计算机科学硕士（1993年）、机电控制及自动化博士（1996年），计算机科学博士后出站（1998年），先后师从蔡鹤皋院士、王选院士、石青云院士等著名专家。1996年起在北京大学任教，先后担任“长江学者”团队核心成员、视觉与听觉信息处理国家重点实验室副主任、北京大学智能科学系副主任、北京大学深圳研究生院教务处处长、科研处处长。', '教授', '人工智能学院');
INSERT INTO `teacherteam` VALUES ('20190002', '李麻子', '4', '1561431480595.', '男，福建省龙岩师范高等专科学校副教授。1938年11月出生。1954年9月—1959年8月福建省永定一中读书。1959年9月—1964年8月华东师范大学历史系五年制专业就读：1964年8月—1983年1月上海市陕北中学任教；1983年2月至今福建省龙岩师专任教。主要著作：《胡文虎及其家族》（专著）厦门大学出版社1993年已月：《道德生活评析》（副主编）南京大学出版社1991年6月；《法律基础》（副主编）黑龙江教育出版社1993年5月：《古今中外思想政治工作概要》（编委）华艺出版社1990年9月：《大学生思想修养导论》（编委）福建教育出版社1991年8月；《学校教育伦理学》（参编）学林出版社1991年3月；《中学思想政治教育理论与实践》（参编）南京大学出版社1991年4月：论文《给青年教师工作注入激励机制》（《龙岩师专学报》1992年第10卷一期）。该文已被中国社会科学院文献信息中心收入《青年塑造未来》一书，该书是受联合国科教文组织委托，由中国社会科学院文献信息中心组织编撰，采用中英文对照，在全国1500多种社科报刊中摘选600篇收录进册，可谓精华之萃。', '讲师', '经融管理学院');
INSERT INTO `teacherteam` VALUES ('20190003', '张大笑', '1', '1561431515420.', '教授，博士生导师，2009年获得国家杰出青年科学基金。主要研究方向为纳米能源材料、组织工程与干细胞分化、人工晶体材料等。近十年来承担了包括863、973、自然基金重大项目在内的十余项国家级科研项目，取得了重要进展。2004年至今，在包括Adv. Mater., Nano Letters，ACS Nano，J. Am. Chem. Soc, Adv. Fun. Mater，Envir. Eng. Sci.等学术期刊上发表SCI文章200余篇，通讯作者164篇。其中，影响因子大于10的近30篇，个人文章总被引次数超过10050次，H因子为52，17篇文章被Web of Science的ESI', '副教授', '外国语学院');
INSERT INTO `teacherteam` VALUES ('20190004', '哈哈', '2', '1561431515420.', '教授，博士生导师，2009年获得国家杰出青年科学基金。主要研究方向为纳米能源材料、组织工程与干细胞分化、人工晶体材料等。近十年来承担了包括863、973、自然基金重大项目在内的十余项国家级科研项目，取得了重要进展。2004年至今，在包括Adv. Mater., Nano Letters，ACS Nano，J. Am. Chem. Soc, Adv. Fun. Mater，Envir. Eng. Sci.等学术期刊上发表SCI文章200余篇，通讯作者164篇。其中，影响因子大于10的近30篇，个人文章总被引次数超过10050次，H因子为52，17篇文章被Web of Science的ESI', '副教授', '人工智能学院');
INSERT INTO `teacherteam` VALUES ('20190005', '呵呵', '3', '1561431515420.', '男，福建省龙岩师范高等专科学校副教授。1938年11月出生。1954年9月—1959年8月福建省永定一中读书。1959年9月—1964年8月华东师范大学历史系五年制专业就读：1964年8月—1983年1月上海市陕北中学任教；1983年2月至今福建省龙岩师专任教。主要著作：《胡文虎及其家族》（专著）厦门大学出版社1993年已月：《道德生活评析》（副主编）南京大学出版社1991年6月；《法律基础》（副主编）黑龙江教育出版社1993年5月：《古今中外思想政治工作概要》（编委）华艺出版社1990年9月：《大学生思想修养导论》（编委）福建教育出版社1991年8月；《学校教育伦理学》（参编）学林出版社1991年3月；《中学思想政治教育理论与实践》（参编）南京大学出版社1991年4月：论文《给青年教师工作注入激励机制》（《龙岩师专学报》1992年第10卷一期）。该文已被中国社会科学院文献信息中心收入《青年塑造未来》一书，该书是受联合国科教文组织委托，由中国社会科学院文献信息中心组织编撰，采用中英文对照，在全国1500多种社科报刊中摘选600篇收录进册，可谓精华之萃。', '讲师', '外国语学院');
INSERT INTO `teacherteam` VALUES ('20190006', '啦啦啦', '1', '1561431407533.', '工学博士、北京大学教授、博士生导师 [1]  ，国家“万人计划”首批入选专家，科技部“国家中青年科技创新领军人才”、国家重点研发计划“智能机器人”总体组专家。兼任中国人工智能学会副理事长，全国智能机器人创新联盟副理事长，深圳市政协委员（科学技术界）。现任北京大学深圳研究生院科研处处长、智能机器人开放实验室主任。计算机科学学士（1990年）、计算机科学硕士（1993年）、机电控制及自动化博士（1996年），计算机科学博士后出站（1998年），先后师从蔡鹤皋院士、王选院士、石青云院士等著名专家。1996年起在北京大学任教，先后担任“长江学者”团队核心成员、视觉与听觉信息处理国家重点实验室副主任、北京大学智能科学系副主任、北京大学深圳研究生院教务处处长、科研处处长。', '讲师', '经融管理学院');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `questionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` bigint(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `question` longtext,
  `time` datetime DEFAULT NULL,
  `answer` longtext,
  `status` int(1) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `quesTime` datetime DEFAULT NULL,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1781707873', '拾年', ' 111', null, '1', '1', null, '2019-06-24 10:15:56');
INSERT INTO `user` VALUES ('5', '1041299668', 'ex', '测试', '2019-06-23 00:00:00', '444', '1', 'http://q.qlogo.cn/headimg_dl?dst_uin=1041299668&spec=100', '2019-06-24 10:15:09');
INSERT INTO `user` VALUES ('7', '873291419', '美丽', '1111', '2019-06-24 10:13:52', '33', '1', 'http://q.qlogo.cn/headimg_dl?dst_uin=873291419&spec=100', '2019-06-21 10:15:31');
INSERT INTO `user` VALUES ('8', '313107957', 'S.C.S', '哈哈', null, '', '0', 'http://q.qlogo.cn/headimg_dl?dst_uin=313107957&spec=100', '2019-06-24 10:15:35');
INSERT INTO `user` VALUES ('21', '873291419', '美丽', '111', null, ' ', '0', 'http://q.qlogo.cn/headimg_dl?dst_uin=873291419&spec=100', null);
INSERT INTO `user` VALUES ('22', '873291419', '美丽', ' 111', null, '22', '1', 'http://q.qlogo.cn/headimg_dl?dst_uin=873291419&spec=100', null);

-- ----------------------------
-- Table structure for webindexinformation
-- ----------------------------
DROP TABLE IF EXISTS `webindexinformation`;
CREATE TABLE `webindexinformation` (
  `webName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webindexinformation
-- ----------------------------
INSERT INTO `webindexinformation` VALUES ('数据结构精品课程');
