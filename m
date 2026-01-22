Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E8D4418D1
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 Jan 2026 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096466; cv=none; b=GzWh9v7qclcH1GDL7kYg8ZNn+77RJKLUVxYxeI9NHRvpydlx7Va69YljmbDLFUC8098EnLEja5giP42AuInOAlcMA+N3OQQxp1ML7uoCOXJKQdh160AISvUUuB+KRvPcV53YQl/ntxT0dF45P66n8XMOpZs2qmvxegrpA3CsvGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096466; c=relaxed/simple;
	bh=uONlpUsG6B+1SJNCDttGGY2DFAbNfSVv6+TjnGPV9Ro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lOnPfjEszbi8jHsQMoRtjiU6nMnD+TzsiethFEZwTnLCdCulPU2sGMh/AcxDUt1pWYVyT7Jlgvj4ikvfHjyPxz+z3CFipMYtkN7UrMl7TY54diJUf9AU1BAQj9IK6N+nlyJwTpvRDXJppyBTr+Za0jV84Ws8Mme/pV1XWBPreFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL2sghSS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL2sghSS"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso1065238b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 Jan 2026 07:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769096462; x=1769701262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iC3BQrsx4m1KIySd6SGYfoOdN/kOmKuZK6JhgQwLLwU=;
        b=NL2sghSS6dnyJKFzjDQtIBSEolrf68rJ6ofUzV85RENpm75UGjlY++og/jNB7oc0Rd
         rkZ8+RCmdo6+h7i7oUtGLNautJUSrEKiSEeRRbtUug18T8XNnYqny18y93ElkoY6iDfB
         /OyBA1ajcH+xJgo9PBa9vq3jnye0F3zR+IdGVkXcawA+rPyX2TfbEWLIeKTHCv1vKV0L
         Fk6iJ4coP5HpA70ckEKgGpt6NZ3RbOmPbKZZ7ebFeLoXV+opdXor7u4myURUo9+8/Y/E
         44nvUxMtbWXJIxEyXrmcovro7cqmlecV2YkzsZS5+PrK2g0M5popEDQCPrLbeyTNa1es
         Pdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096462; x=1769701262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iC3BQrsx4m1KIySd6SGYfoOdN/kOmKuZK6JhgQwLLwU=;
        b=bQFqNDuskO7QX7UkAA8seQIxi8gTNLyIrnC6N5nFPc8QkaEK3xk/+xLRaBN9kjBMiC
         aUPqET6uV4Aki3XOQtYcUA6z4Dps+83EZN9K1sGf1+ct03XK5zg6H2+lfyJhDXAz2cbt
         UYfh+RvFumM5+oRkie5GtQc8cLak7P3omHzs1LCjpZVimKwmVDIYSPYL6yhb7NsXc1Jh
         NKiiohvBfdgYk3zTkC3EN11MLcoynJWBxpq9pD7sysUXM1YETbK1rynE0yBx2okc4Nh1
         nivs4+36zr0B60enhJMFhtQ/37665S0mPzsMd33yYUgUIy8GWKMmBkw08HSw72jUVQAu
         k/jg==
X-Forwarded-Encrypted: i=1; AJvYcCX1p1HkknobH4bFr3Ha6pZINh0UFyJuxmSz0bcVhBN9ESFUzqr40WPavxm+7E1NWina9M5AvmWrzWHJlRQpoefDLRDv+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVSCYj4qShNnf6XdQIjqIMegJzrJkM/3MQcmtgFxbDAoksPcYC
	ztxvRkP/QAABWEakrU5c13QwBV6OAF/rQPws9lldjjbppbWRslLXdLj0
X-Gm-Gg: AZuq6aIom6t2RWmw1dnDZjBwWGPkA3uUI4EicGKTWnoVg0f4FSRpPQgP3wkSsl39Qx0
	8NPbn3OEaNn1Fl4dGilStztX1wQfPJDnqLD5yN2UsYS5L3OBZ6SiE+5wOEnO5DXC0dpQ20agvMX
	a7O2rGSdNlvsgsgiOBO4bcuJ8MeZOVwhafCMJN+CRg5VnSoRqOmQxoIXPL6cn+W8p1dvEtKHLbC
	/+iWxjFj04COEQmjNlqLFfNwgV2VHeOn9mST6QgUhFvz0FZNz2SDXojSBFghjXlKnMfKG+Rmc6b
	0b/KMYXWQKSysOYTGqy873OiYtL/IgfSyFtK76KidvNYsUwC69KKwhR4tdKebhew3KzezMZisMA
	hO5xaQZUbS5bie+CNO4AWkXsDToOwKZxYaO3fwXfkzgWA3rfIQzIC9SQJn1SV9DHq9l/o56AJCL
	8D/WStEYqZMo6dK1ZUQBfQT+YlsL2d
X-Received: by 2002:a05:6a00:1302:b0:823:1117:39e6 with SMTP id d2e1a72fcca58-82311173ef0mr798121b3a.33.1769096462238;
        Thu, 22 Jan 2026 07:41:02 -0800 (PST)
Received: from localhost.localdomain ([111.125.231.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82181d6f7f7sm3474462b3a.50.2026.01.22.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:41:01 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: martin.petersen@oracle.com,
	d.bogdanov@yadro.com,
	bvanassche@acm.org
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] scsi: target: fix recursive locking in __configfs_open_file()
Date: Thu, 22 Jan 2026 21:10:51 +0530
Message-Id: <20260122154051.64132-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In flush_write_buffer, &p->frag_sem is acquired and then the loaded store
function is called, which, here, is target_core_item_dbroot_store().
This function called filp_open(), following which these functions were
called (in reverse order), according to the call trace:

down_read
__configfs_open_file
do_dentry_open
vfs_open
do_open
path_openat
do_filp_open
file_open_name
filp_open
target_core_item_dbroot_store
flush_write_buffer
configfs_write_iter

target_core_item_dbroot_store() tries to validate the new file path by
trying to open the file path provided to it; however, in this case,
the bug report shows:

db_root: not a directory: /sys/kernel/config/target/dbroot

indicating that the same configfs file was tried to be opened, on which
it is currently working on. Thus, it is trying to acquire frag_sem
semaphore of the same file of which it already holds the semaphore obtained
in flush_write_buffer(), leading to acquiring the semaphore in a nested
manner and a possibility of recursive locking.

Fix this by modifying target_core_item_dbroot_store() to use kern_path()
instead of filp_open() to avoid opening the file using filesystem-specific
function __configfs_open_file(), and further modifying it to make this
fix compatible.

Reported-by: syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f6e8174215573a84b797
Tested-by: syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
Changes since v1:
 - Update commit message to reflect the fact that same file, which code was 
   currently operating on, was tried to be opened again, leading to 
   acquiring the same semaphore in nested manner & possibility of recursive
   locking.

v1 link: https://lore.kernel.org/all/20260108191523.303114-1-activprithvi@gmail.com/T/ 

 drivers/target/target_core_configfs.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index b19acd662726..f29052e6a87d 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -108,8 +108,8 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
 					const char *page, size_t count)
 {
 	ssize_t read_bytes;
-	struct file *fp;
 	ssize_t r = -EINVAL;
+	struct path path = {};
 
 	mutex_lock(&target_devices_lock);
 	if (target_devices) {
@@ -131,17 +131,18 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
 		db_root_stage[read_bytes - 1] = '\0';
 
 	/* validate new db root before accepting it */
-	fp = filp_open(db_root_stage, O_RDONLY, 0);
-	if (IS_ERR(fp)) {
+	r = kern_path(db_root_stage, LOOKUP_FOLLOW, &path);
+	if (r) {
 		pr_err("db_root: cannot open: %s\n", db_root_stage);
 		goto unlock;
 	}
-	if (!S_ISDIR(file_inode(fp)->i_mode)) {
-		filp_close(fp, NULL);
+	if (!d_is_dir(path.dentry)) {
+		path_put(&path);
 		pr_err("db_root: not a directory: %s\n", db_root_stage);
+		r = -ENOTDIR;
 		goto unlock;
 	}
-	filp_close(fp, NULL);
+	path_put(&path);
 
 	strscpy(db_root, db_root_stage);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);

base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.34.1

