From: madhuparnabhowmik04 at gmail.com (Madhuparna Bhowmik)
Date: Tue, 24 Sep 2019 02:33:25 +0530
Subject: [Linux-kernel-mentees] Fwd: [PATCH] fs: direct-io: Fixed a
	Documentation build warn
In-Reply-To: <CAF65HP3W3OM-Euc28fpZc_EPcG9KzEt8==UOC0fgS8ODoWRXiA@mail.gmail.com>
References: <20190923123701.GA9627@madhuparna-HP-Notebook>
	<CAF65HP3W3OM-Euc28fpZc_EPcG9KzEt8==UOC0fgS8ODoWRXiA@mail.gmail.com>
Message-ID: <CAF65HP0CViR_Dw=xEhSAY++o=UUxtDAv2ZkAHjVkmOMiNTEeBA@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fixed Excess function parameters warning.
warning: Excess function parameter 'offset' description in
'dio_complete'.
Removed the description of the local variable offset from the
description for arguments of a function and added it with the
declaration of the variable.

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
  * This drops i_dio_count, lets interested parties know that a DIO
operation
  * has completed, and calculates the resulting return code for the
operation.
@@ -255,6 +254,7 @@ void dio_warn_stale_pagecache(struct file *filp)
  */
 static ssize_t dio_complete(struct dio *dio, ssize_t ret, unsigned int
flags)
 {
+       /* offset: the byte offset in the file of the completed operation */
        loff_t offset = dio->iocb->ki_pos;
        ssize_t transferred = 0;
        int err;
-- 
2.17.1

?
?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20190924/d297bba5/attachment.html>
