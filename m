Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A3243637E
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  5 Feb 2026 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308799; cv=none; b=d8nszHGVv3jrTxGS/h/TD8+elYzyMVHDPQNwQfv+HJZ58KRCnaNExGanuOb8+t08tahl/oQMZkxDGlHlwrgKw7O7FWR9YauKHivrpaQTGk5LKm9F731erfRNSIWcDC8vkEzltnIcgc7vyw/CDAWe85ZX+y6dfJyS2FDbSQ3YqWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308799; c=relaxed/simple;
	bh=9r9EfnqgpePHSmknjj3jV71TCwg0Aj5TNW2hpF8F0ic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SKpKLx53EMhwkIPx7RXpxwkkCuekDlckCKu76CNa1F1K0OL+3y/yUXgTheM1Lzk3UboxEJfGjvueGPoZdu1BqiyclTZ8EEoEAXg+5xOiDN6x2GHIILn4Mca5z85o9Xtzbk0c4n75+/a8CGNwZ5xJCsYWuzO1J0D3hmdF60k7+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUY+CmMT; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUY+CmMT"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c62239decbeso422333a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 05 Feb 2026 08:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770308798; x=1770913598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JyEXpPncVH2GhAUyxHXUUpWjlgv8nEIxYO25mhp+H1s=;
        b=NUY+CmMTYo2RlMchG0B9sZyN2Squjdw+lI+05oEVFcrXN58beUZTkMeLlcsm6VeU0h
         fVBNZGeCOchMiR3/KU8Jw4eVtbdSt+e+fttEPKJYB/wVKZcyUuKOwU5/vWxdkE6WVEV3
         H+vTH3qEURSzsWxdr8Db4XcmOfZgN3Ni9druvAn86BdTWzqFlzFhmHu3xhvMrGts84fg
         laa1XuIa8Q8QrZSKXzEceD3sx9egy8vBvdGSJmixbKIP7TSEdZXlsaQADhUvUUdP5wVM
         s2QZGYs3ZWJaLxu3WUnHOV/jLU9Nwap8IvkzmxwgV6z/1uV8Pd4iT4w1MVoNQettc5EF
         djiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770308798; x=1770913598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyEXpPncVH2GhAUyxHXUUpWjlgv8nEIxYO25mhp+H1s=;
        b=bgYZ+AggKuyNzsDAhFM6Qql7bdkswBpRcP1lW5W1L/PhknOT2Wgya2iadgM5JTc7fr
         inwaXpp8xMXyvXIs1vRTReh8CD+G6XTooYPBG/tA115HMC2j/UBmNscZsWS4uG0nll8g
         v5iDDTfzXAZ/0SH6YnQZlQxhw8RszgHhcd+y/raEu/4Ly2cbiN45SYGoeIH1BdVr3STa
         PhxuHN6JV5v3zkrJWk6Vu7e3KMC2r80Ib4b3Bud1Ws/4kqCEj2FyObb7LqBCJYEUD7oE
         sqEhSczq52FSX9/Cfcodfh1gAHBBjazvD5wSokh89plnkKig1HANBwK/L0tE2hVO9vcG
         9GmA==
X-Forwarded-Encrypted: i=1; AJvYcCWhsad1ybDOgS7siPL3X7jK/3xRsYFej4DrN39FFGpe+ym5I+SoT9rhxudm+Pq9/NCMBd2gaD/X7fXbcJv3AvdIeqloVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5cbwHIykGKpu+bmMrLlABkZ+1HLzfHDd6/gylp5LOIO2FsvL+
	QsTIs549Le8arLJDT7nNR4tUowQIUoobuH3GS1kQ0F4T2OF1kQElp6Bc
X-Gm-Gg: AZuq6aLS2WKgpdIarOm0Its0Hq7xQTmfTrjhuj59XzmdySn2PufX4j86e0JlpYM3mug
	qNR5LZJCTcg4g01Ze9rcW2RvuoHq/qnZiBN4n/Jy8ALnmJScZBDdp6xPK2lnZificKRLSUm4U87
	FjP9TK6tqhlukh0TIyMTOED/4xgvY2XGMJ+GL3/VF8K6ei2E4Uf1ws9rruN9ReSLOYLEe5oJD15
	U52tODMjZnDAN+WL+7aZiYNPN+L3Juk8IhN6HmwB3yWUI5oQqPYRiv3hu1t1lMP0FiR9jt9IDJP
	Vt0O6POeC001h3xn0SUVPx47ON4/FqpsOc+QQkYTH3YN9nVvgrGp5RIlP3k3RtMLRsRsz7K+jgU
	2KIe+1KVrq8gdC40b6eV+zNw88VMP4IaKln9r68X9SfLCZFExZtlC87Ucw/0gaDMYuqRDtumNjt
	0gGwxVtw4UXlL9hDI0dP67SB0zlk/odKEvokxp
X-Received: by 2002:a17:90b:1b11:b0:340:d578:f2a2 with SMTP id 98e67ed59e1d1-354870db3e3mr6719407a91.6.1770308798217;
        Thu, 05 Feb 2026 08:26:38 -0800 (PST)
Received: from localhost.localdomain ([114.79.136.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8553e6b1sm5444208a12.32.2026.02.05.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:26:37 -0800 (PST)
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
Subject: [PATCH v3] scsi: target: fix recursive locking in __configfs_open_file()
Date: Thu,  5 Feb 2026 21:56:24 +0530
Message-Id: <20260205162624.117957-1-activprithvi@gmail.com>
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

