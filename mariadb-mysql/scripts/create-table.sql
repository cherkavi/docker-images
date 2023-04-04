CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(32) NOT NULL,
  `creation_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;