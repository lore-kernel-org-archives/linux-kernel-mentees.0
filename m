Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8A24315F
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Feb 2026 06:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771222829; cv=none; b=t0pAuI4hAzPgwYsl/BCNJGTvCEVwdZ5z3XdFl/L66ju1EuEhIeYf7aL9fMlu1RBcuZmftcgWJ5PBazuXo/W5+zyZk3q2p8/pF8I5IDJEAR21CJ7vphnaTe4yWL8+96oCxTL/WQw5UeuXUm8n0NlupLMhR2RaMIjvD2IV5+T1LYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771222829; c=relaxed/simple;
	bh=lweh5wTqdn5NyXCEB1iITaZxpjD9zsXuEt4pDx+EBK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DLQyXdc0/KrmYc8+74/i+5PVBtUYB6EFasHmN9+QppeyyCOgBc05yA0UdDO6P+Xty25punySKk5CTctIZnWmLWcmNNaopahS7QkTOp24NhZY8/Zb55wJwUA2isCaZL92Mkd3vCol2cgPr9QYzNQmSp4kfKKlgYbNOEAg3IG/jFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTJlTa5m; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTJlTa5m"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824af5e5c81so2694238b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Feb 2026 22:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771222826; x=1771827626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gq3u6/pH6XaIhkLYyxC209miQpGjF2eS8OFp0J3cin8=;
        b=kTJlTa5m2jooY1viLimAhMs0FwtoNWzqh5J3ZTjwlxSx5k4C8Mwt/EPvv0npw/wwRk
         aQEAJYncxD3QcEz6IUUa1pomuwMalhbwHM8MV5HhDo33g48ZzL5l5Z29kg+zRL0WzuIX
         s3ZyVBiZ4w5BHx9l2H5IS5WznC5eFC6W8MtCw5Pf39fW0yxX9A1++gH7/NBCg7JIrquu
         OUHS2gm+ZS9WHp5MLIbn9B3qyFdsLDwChzInzxPSHMzPb2W+AOwfQuGGoaDJ/qv2llEe
         x4vv2LY+2vJIqX/A7pEbPKjz91ALGvPcJrPKUbnjt3WRpLk+j1VOFqT0xz12EkGZBEXE
         ZHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771222826; x=1771827626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gq3u6/pH6XaIhkLYyxC209miQpGjF2eS8OFp0J3cin8=;
        b=wvWixD8IRzJrEXGQKSFtsyuDTNOFpFSc3J16Mt1/8D4miaX4IgpM+Yk+0jp7R9TsAO
         e8sh/jAmZimEbJq0Gmm85vjHGxcQjTJjApRk/aKyyNyYFUPhWFum6WIm67WuW4LNx3Tc
         nLwi7C4jABXEc20OKjYpwnOndVo4lsOOtJtixFAMPcR0REmB6pCjJl/Ov3Qn9lgi9sJz
         TFZ+liIc3x1CvIx5SB1Tk5AwwObruOeZng1lRzmyPFiNASh6geQBfmb+dEzDSr0+g0he
         zAEkUkyswlQxOipx2aFEpJWgJnUH+yLfZwHiHRzHSfz9xR7egwivvFRv8eNvadv86N7P
         f2xg==
X-Forwarded-Encrypted: i=1; AJvYcCXfcaNCcuYZ3Et7RFpeD4UtdwmWu3GfA7J9lU2P9/uOHn4jvwAGRomCA4yQTqOGB3WM4XeFc16gAa+Ta4QkzNo/1JIVOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAIVAuC6HWYfKGhTaFKy6Dqbop/JTCRrl/+66x7Ibh6p/zo7IO
	zpu5skLuw0Fshe/zsmxGGt754DtK0lGKVn8qfV/GA2YDOPiYZk9Nlg1H
X-Gm-Gg: AZuq6aJvIi1kzfAduc9bdxxrNnBz68/eGmVFvF4r3JefbUMBE8siTFLsu12m241osGZ
	vS3mAEuvjJRR/EITfWngpuqKWJbK/XuPD1xThLaxxOx/N/xBmIQ8XodQTFG6XqXFqC4rZYscJEB
	h9Rbdr1TsQQFF98HhuHfh8UFYsBE+3hoMcgM7xQNPD50r8Ijp6O7kjtkd4f+CgKdCVul3AC7qhe
	grN8sBFWQ9ZTiWDpsumQrY6zhi8lUMT4wxSnUeLjL6nqrLv1Tu32zSub5+3qMsrYhP53cgzV575
	2ud2bY3KTBhgmoJhLj+tXspO+w6L7yIHWuUeOhP5cJJT4D0smb/4Dv0CeIIZ0Da008N2cJ1vSdI
	btXGTu9mrXKTBgujJ90eHv4UsRzI/z9n1ScD4qVlnpQ4bA1kEiAqcPV8lbxW2aC/lfDy1sguCab
	yJsibm9fyrBTOdj+rj/kSjXsKfrE6Y2vOlXm3pBw==
X-Received: by 2002:a05:6a00:7543:b0:81e:12f1:d83 with SMTP id d2e1a72fcca58-824c6102ba1mr7161063b3a.42.1771222826432;
        Sun, 15 Feb 2026 22:20:26 -0800 (PST)
Received: from localhost.localdomain ([114.79.136.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a626bfsm8992768b3a.28.2026.02.15.22.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 22:20:26 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: martin.petersen@oracle.com,
	d.bogdanov@yadro.com,
	bvanassche@acm.org,
	viro@zeniv.linux.org.uk
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
Subject: [PATCH v4] scsi: target: fix recursive locking in __configfs_open_file()
Date: Mon, 16 Feb 2026 11:50:02 +0530
Message-Id: <20260216062002.61937-1-activprithvi@gmail.com>
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
Reviewed-by: Dmitry Bogdanov <d.bogdanov@yadro.com>
---
Changes since v3:
 - Add LOOKUP_DIRECTORY flag in call to kern_path() so as to check presence 
   of directory checks more efficiently

v3 link: https://lore.kernel.org/all/20260205162624.117957-1-activprithvi@gmail.com/T/#m175d152067817dd6e9dc1821b6fbf626e47a4007


Note:
I checked out and found that when I try to test on commit 3a8660878839faadb4f1a6dd72c3179c1df56787
(latest commit on which bug dashboard reports the bug on, in upstream repository) 
syzbot uses, in its kernel config:

CONFIG_CC_VERSION_TEXT="gcc (Debian 12.2.0-14+deb12u1) 12.2.0"

Ref: https://syzkaller.appspot.com/x/.config?x=e854293d7f44b5a5
Syzbot Reply: https://lore.kernel.org/all/6767d8ea.050a0220.226966.0021.GAE@google.com/T/#m62bc76de5549460ae98e843bb120712548489794

While when #syz test (i.e. on HEAD commit of upstream) is used, it uses, in
its kernel config:

CONFIG_CC_VERSION_TEXT="gcc (Debian 14.2.0-19) 14.2.0"

Ref: https://syzkaller.appspot.com/x/.config?x=99ac58566e9eb044
Syzbot reply: https://lore.kernel.org/all/6767d8ea.050a0220.226966.0021.GAE@google.com/T/#me8b79610e4c18a8d8a7d8d6bc249d1c7cf2f8819

However in both cases it uses:

gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Probably due to mismatch in compiler version which syzbot actually uses and 
whats present in kernel config, the build fails for the first case. However, 
the patch succeeds in fixing the bug in second case.

Earlier for v1 patch (sine v2 patch involved minor change to commit message 
and v3 involved adding a missed out Reviewed-by tag) patch the kernel builds 
as well as testing succeeded since syzbot used this in its kernel config:

CONFIG_CC_VERSION_TEXT="gcc (Debian 12.2.0-14+deb12u1) 12.2.0"

as well as used the compiler:

gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40 

Changes since v2:
 - Add Reviewed-by tag received from Dmitry Bogdanov, which was accidentally
   left to be added in v2 patch.

v2 link: https://lore.kernel.org/linux-scsi/20260122154051.64132-1-activprithvi@gmail.com/T/#u
Reference for Reviewed-by Tag: https://lore.kernel.org/all/20260108191523.303114-1-activprithvi@gmail.com/T/#mb22d0fc06e747e2b2df8320a15afd2a0670fd0e7


Changes since v1:
 - Update commit message to reflect the fact that same file, which code was 
   currently operating on, was tried to be opened again, leading to 
   acquiring the same semaphore in nested manner & possibility of recursive
   locking.

v1 link: https://lore.kernel.org/all/20260108191523.303114-1-activprithvi@gmail.com/T/

 drivers/target/target_core_configfs.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index b19acd662726..f94c242eff97 100644
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
@@ -131,17 +131,14 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
 		db_root_stage[read_bytes - 1] = '\0';
 
 	/* validate new db root before accepting it */
-	fp = filp_open(db_root_stage, O_RDONLY, 0);
-	if (IS_ERR(fp)) {
+	r = kern_path(db_root_stage, LOOKUP_FOLLOW | LOOKUP_DIRECTORY, &path);
+	if (r) {
 		pr_err("db_root: cannot open: %s\n", db_root_stage);
+		if (r == -ENOTDIR)
+			pr_err("db_root: not a directory: %s\n", db_root_stage);
 		goto unlock;
 	}
-	if (!S_ISDIR(file_inode(fp)->i_mode)) {
-		filp_close(fp, NULL);
-		pr_err("db_root: not a directory: %s\n", db_root_stage);
-		goto unlock;
-	}
-	filp_close(fp, NULL);
+	path_put(&path);
 
 	strscpy(db_root, db_root_stage);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);

base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.34.1

