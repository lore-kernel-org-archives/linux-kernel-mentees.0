From: madhuparnabhowmik04 at gmail.com (Madhuparna Bhowmik)
Date: Thu, 26 Sep 2019 01:36:18 +0530
Subject: [Linux-kernel-mentees] [PATCH] fs: direct-io: Fixed a Documentation
	build warn
Message-ID: <20190925200614.GA30749@madhuparna-HP-Notebook>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch fixes the warning: Excess function parameter 'offset'
description in 'dio_complete'.
Removes offset from the list of arguments in the function
header as it not an argument to the function.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>
---
 fs/direct-io.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index ae196784f487..636a61036ffe 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -243,7 +243,6 @@ void dio_warn_stale_pagecache(struct file *filp)
 
 /**
  * dio_complete() - called when all DIO BIO I/O has been completed
- * @offset: the byte offset in the file of the completed operation
  *
  * This drops i_dio_count, lets interested parties know that a DIO operation
  * has completed, and calculates the resulting return code for the operation.
-- 
2.17.1
