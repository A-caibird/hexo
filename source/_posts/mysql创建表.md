---
title: mysql创建表
date: 2023-11-21 14:14:18
tags:
  - Mysql
categories:
 - Mysql
summary: Mysql创建表的相关命令以及字段条件约束
---
这段代码可能有以下原因导致错误：

1. 表名和列名使用了单引号，正确的写法应该是使用反引号。

2. 'uersname' 应该是 'username' 才正确。

3. 指定了字符集为 utf8，但是未指定排序规则。

下面是修正后的代码：

```mysql
CREATE TABLE IF NOT EXISTS `user` (
   `id` INT UNSIGNED AUTO_INCREMENT,
   `username` VARCHAR(100) NOT NULL,
   `host` VARCHAR(40) NOT NULL,
   `password` VARCHAR(40) NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

在这个修正后的代码中，表名和列名使用了反引号，`username` 被修正了拼写，同时字符集被指定为 `utf8mb4`，并且指定了排序规则。
`ENGINE=InnoDB` 表示创建的表使用 InnoDB 引擎，这是 MySQL 中一种流行的事务性存储引擎，具有 ACID（原子性、一致性、隔离性、持久性）特性，支持 MVCC 并发控制。

`CHARSET=utf8mb4` 指定了字符集为 `utf8mb4`，它是一种支持更广泛的 Unicode 字符集的 UTF-8 编码方式。与传统的 `utf8` 相比，`utf8mb4` 可以存储更多的字符，包括一些 Emoji 等特殊字符。

`COLLATE=utf8mb4_unicode_ci` 是排序规则，指定了在比较和排序时使用的字符集和排序方式。`utf8mb4_unicode_ci` 是一种基于 Unicode 的排序规则，支持多语言，比如中文、日语、韩语等，能够确保不同语言之间的字符串比较正确。
