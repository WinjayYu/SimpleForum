DROP DATABASE IF EXISTS sampledb17;
CREATE DATABASE sampledb17 DEFAULT CHARACTER SET utf8;
USE sampledb17;


/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2011-10-3 0:34:13                             */
/*==============================================================*/


drop index IDX_POST_TOPIC_ID on t_post;

drop index IDX_TOPIC_TITLE on t_topic;

drop index IDX_TOPIC_USER_ID on t_topic;

drop table if exists t_board;

drop table if exists t_board_manager;

drop table if exists t_post;

drop table if exists t_topic;

drop table if exists t_user;

drop table if exists t_login_log;

CREATE TABLE `t_board` (
  `board_id` int(11) NOT NULL auto_increment COMMENT '��̳���ID',
  `board_name` varchar(150) NOT NULL default '' COMMENT '��̳�����',
  `board_desc` varchar(255) default NULL COMMENT '��̳�������',
  `topic_num` int(11) NOT NULL default '0' COMMENT '������Ŀ',
  PRIMARY KEY  (`board_id`),
  KEY `AK_Board_NAME` (`board_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_board
#

INSERT INTO `t_board` VALUES (1,'����','�������������������������ľ����ĵ�\r\n',8);
INSERT INTO `t_board` VALUES (2,'\r\nͯ��','�ӱ���ѾѾѧ�￪ʼ�����ǻ�ð���ܶ���˼���룬���ǻ�˵��һЩ���㿪�Ĵ�Ц�Ļ���������һ���¼��һ�����',0);
INSERT INTO `t_board` VALUES (3,'����','���䴫�С����Ŵ����辫ѡ ',0);
INSERT INTO `t_board` VALUES (4,' ����','������,�����ñ���ѧ���Լ�������',3);
INSERT INTO `t_board` VALUES (7,'dddddddddddd','ddddddddddddddddddddddddddddddd',0);
INSERT INTO `t_board` VALUES (8,'����','��������~~',0);

#
# Source for table t_board_manager
#

CREATE TABLE `t_board_manager` (
  `board_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`board_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��̳����Ա';

#
# Dumping data for table t_board_manager
#

INSERT INTO `t_board_manager` VALUES (1,1);
INSERT INTO `t_board_manager` VALUES (1,2);
INSERT INTO `t_board_manager` VALUES (5,2);
INSERT INTO `t_board_manager` VALUES (5,3);

#
# Source for table t_login_log
#

CREATE TABLE `t_login_log` (
  `login_log_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `ip` varchar(30) NOT NULL default '',
  `login_datetime` varchar(14) NOT NULL,
  PRIMARY KEY  (`login_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table t_login_log
#


#
# Source for table t_post
#

CREATE TABLE `t_post` (
  `post_id` int(11) NOT NULL auto_increment COMMENT '����ID',
  `board_id` int(11) NOT NULL default '0' COMMENT '��̳ID',
  `topic_id` int(11) NOT NULL default '0' COMMENT '����ID',
  `user_id` int(11) NOT NULL default '0' COMMENT '������ID',
  `post_type` tinyint(4) NOT NULL default '2' COMMENT '�������� 1:������ 2:�ظ�����',
  `post_title` varchar(50) NOT NULL COMMENT '���ӱ���',
  `post_text` text NOT NULL COMMENT '��������',
  `create_time` date NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`post_id`),
  KEY `IDX_POST_TOPIC_ID` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='����';

#
# Dumping data for table t_post
#

INSERT INTO `t_post` VALUES (1,1,1,1,1,'����','�������������������������ľ����ĵ�\r\n','2011-05-07');
INSERT INTO `t_post` VALUES (2,1,2,1,1,'Ȥ��\r\nͯ��','�ӱ���ѾѾѧ�￪ʼ�����ǻ�ð���ܶ���˼���룬���ǻ�˵��һЩ���㿪�Ĵ�Ц�Ļ���������һ���¼��һ�����','2011-05-07');
INSERT INTO `t_post` VALUES (3,1,3,1,1,'test3','http://localhost/forum/boardManage.do?method=addTopicPage&boardId=1','2011-05-16');
INSERT INTO `t_post` VALUES (4,1,4,1,1,'test5','http://localhost/forum/boardManage.do?method=addTopicPage&boardId=1','2011-05-16');
INSERT INTO `t_post` VALUES (5,4,5,1,1,'��Ϊ���̵����¹���','��Ϊ���̵����¹���\r\n','2011-06-16');
INSERT INTO `t_post` VALUES (6,0,5,1,2,'����ĥ����','����ĥ����............\r\n','2011-06-16');
INSERT INTO `t_post` VALUES (7,4,6,1,1,'�ñ���ѧ���Լ������µ�����һ','�ñ���ѧ���Լ������µ�����\r\n','2011-06-16');
INSERT INTO `t_post` VALUES (8,4,7,1,1,'�ñ���ѧ���Լ������µ����ж�','�ñ���ѧ���Լ������µ�����','2011-06-16');
INSERT INTO `t_post` VALUES (14,5,14,1,1,'d','dddddddddddddd','2011-09-12');
INSERT INTO `t_post` VALUES (15,5,15,1,1,'dad','sdfffffffffffffffffff','2011-09-12');
INSERT INTO `t_post` VALUES (20,1,20,1,1,'���ԡ�������','���ԡ�������','2011-09-17');
INSERT INTO `t_post` VALUES (21,1,21,1,1,'���ԡ�������','���ԡ�������','2011-09-17');
INSERT INTO `t_post` VALUES (22,1,22,1,1,'��������','�������齻������','2011-09-18');
INSERT INTO `t_post` VALUES (23,1,23,1,1,'��������','�������齻������','2011-09-18');
INSERT INTO `t_post` VALUES (24,1,1,1,2,'��������','�������齻������','2011-09-18');

#
# Source for table t_topic
#

CREATE TABLE `t_topic` (
  `topic_id` int(11) NOT NULL auto_increment COMMENT '����ID',
  `board_id` int(11) NOT NULL COMMENT '������̳',
  `topic_title` varchar(100) NOT NULL default '' COMMENT '���ӱ���',
  `user_id` int(11) NOT NULL default '0' COMMENT '�����û�',
  `create_time` date NOT NULL COMMENT '����ʱ��',
  `last_post` date NOT NULL COMMENT '���ظ�ʱ��',
  `topic_views` int(11) NOT NULL default '1' COMMENT '�����',
  `topic_replies` int(11) NOT NULL default '0' COMMENT '�ظ���',
  `digest` int(11) NOT NULL COMMENT '0:���Ǿ������� 1:�Ǿ�������',
  PRIMARY KEY  (`topic_id`),
  KEY `IDX_TOPIC_USER_ID` (`user_id`),
  KEY `IDX_TOPIC_TITLE` (`topic_title`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='����';

#
# Dumping data for table t_topic
#

INSERT INTO `t_topic` VALUES (1,1,'test',1,'2011-05-07','2011-09-18',0,1,1);
INSERT INTO `t_topic` VALUES (2,1,'test2',1,'2011-05-07','2011-05-07',0,0,1);
INSERT INTO `t_topic` VALUES (3,1,'test3',1,'2011-05-16','2011-05-16',0,0,0);
INSERT INTO `t_topic` VALUES (4,1,'test5',1,'2011-05-16','2011-05-16',0,0,0);
INSERT INTO `t_topic` VALUES (5,4,'��Ϊ���̵����¹���',1,'2011-05-16','2011-05-16',0,1,1);
INSERT INTO `t_topic` VALUES (6,4,'�ñ���ѧ���Լ������µ�����һ',1,'2011-05-16','2011-05-16',0,0,0);
INSERT INTO `t_topic` VALUES (7,4,'�ñ���ѧ���Լ������µ����ж�',1,'2011-05-16','2011-05-16',0,0,0);
INSERT INTO `t_topic` VALUES (14,5,'d',1,'2011-09-12','2011-09-12',0,0,0);
INSERT INTO `t_topic` VALUES (15,5,'dad',1,'2011-09-12','2011-09-12',0,0,0);
INSERT INTO `t_topic` VALUES (20,1,'���ԡ�������',1,'2011-09-17','2011-09-17',0,0,0);
INSERT INTO `t_topic` VALUES (21,1,'���ԡ�������',1,'2011-09-17','2011-09-17',0,0,0);
INSERT INTO `t_topic` VALUES (22,1,'��������',1,'2011-09-18','2011-09-18',0,0,0);
INSERT INTO `t_topic` VALUES (23,1,'��������',1,'2011-09-18','2011-09-18',0,0,0);

#
# Source for table t_user
#

CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL auto_increment COMMENT '�û�Id',
  `user_name` varchar(30) NOT NULL COMMENT '�û���',
  `password` varchar(30) NOT NULL default '' COMMENT '����',
  `user_type` tinyint(4) NOT NULL default '1' COMMENT '1:��ͨ�û� 2:����Ա',
  `locked` tinyint(4) NOT NULL default '0' COMMENT '0:δ���� 1:����',
  `credit` int(11) default NULL COMMENT '����',
  `last_visit` datetime default NULL COMMENT '����½ʱ��',
  `last_ip` varchar(20) default NULL COMMENT '����½IP',
  PRIMARY KEY  (`user_id`),
  KEY `AK_AK_USER_USER_NAME` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_user
#

INSERT INTO `t_user` VALUES (1,'tom','1234',1,1,205,NULL,NULL);
INSERT INTO `t_user` VALUES (2,'john','1234',2,1,10,NULL,NULL);
INSERT INTO `t_user` VALUES (3,'ggg','123123',1,0,110,NULL,NULL);