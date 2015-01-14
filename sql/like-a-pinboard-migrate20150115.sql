## mysqldiff 0.43
## 
## Run on Thu Jan 15 01:45:22 2015
## Options: password=root, user=root, debug=0
##
## ---   db: pinbaord_dump (user=root)
## +++   db: pinboard (user=root)

ALTER TABLE pb_urls DROP COLUMN readed; # was tinyint(1) NOT NULL DEFAULT '0'
ALTER TABLE pb_urls ADD COLUMN is_private tinyint(1) NOT NULL DEFAULT '0';
ALTER TABLE pb_users ADD COLUMN salt varchar(64) DEFAULT NULL;
ALTER TABLE pb_users ADD COLUMN password varchar(64) DEFAULT NULL;
CREATE TABLE pb_rss_categories (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  user_id int(11) NOT NULL,
  created_at datetime NOT NULL,
  PRIMARY KEY (id),
  KEY user_id (user_id)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE pb_rss_entries (
  id int(11) NOT NULL AUTO_INCREMENT,
  rss_id int(11) NOT NULL,
  entiry_url varchar(255) NOT NULL,
  is_read tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE pb_rss_urls (
  id int(11) NOT NULL AUTO_INCREMENT,
  url varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  category_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  created_at datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY url (url)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE pb_user_emails (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL DEFAULT '0',
  email varchar(255) NOT NULL,
  activation_code varchar(64) DEFAULT NULL,
  is_activated tinyint(1) NOT NULL DEFAULT '0',
  expired_at datetime NOT NULL,
  primary_use tinyint(1) NOT NULL DEFAULT '0',
  activated_at datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY user_id (user_id),
  KEY activation_code (activation_code),
  KEY primary_use (primary_use)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

