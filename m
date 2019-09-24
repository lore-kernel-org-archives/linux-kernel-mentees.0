From: madhuparnabhowmik04 at gmail.com (Madhuparna Bhowmik)
Date: Tue, 24 Sep 2019 17:49:25 +0530
Subject: [Linux-kernel-mentees] [PATCH] fs: direct-io: Fixed a Documentation
	build warn
Message-ID: <20190924121920.GA4593@madhuparna-HP-Notebook>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

warning: Excess function parameter 'offset' description in 
'dio_complete'.
This patch removes offset from the list of arguments from the function
header as it not an argument to the function. Adds the description about
offset within the code.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>
---
 fs/direct-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index ae196784f487..a9cb770f0bc1 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -243,7 +243,6 @@ void dio_warn_stale_pagecache(struct file *filp)
 
 /**
  * dio_complete() - called when all DIO BIO I/O has been completed
- * @offset: the byte offset in the file of the completed operation
  *
  * This drops i_dio_count, lets interested parties know that a DIO operation
  * has completed, and calculates the resulting return code for the operation.
@@ -255,6 +254,7 @@ void dio_warn_stale_pagecache(struct file *filp)
  */
 static ssize_t dio_complete(struct dio *dio, ssize_t ret, unsigned int flags)
 {
+	/* offset: the byte offset in the file of the completed operation */
 	loff_t offset = dio->iocb->ki_pos;
 	ssize_t transferred = 0;
 	int err;
-- 
2.17.1
