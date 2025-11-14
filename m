Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84947326D51
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Nov 2025 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131487; cv=none; b=gM6ijn+WSwsn0l6xEmN3H+LaSfnIaIymaSOXsfGvUekoZN04n4JQYi/8JGH1VxLXFmc7/DaMXLPTHENVtl7+Sv7ambYd+jPX3f3aApTLncJbMrJjlnyOo7xtqRsI57qB4GNOeequej28NTK4tycHkuyLe59Yo4HnCkrOihKFa9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131487; c=relaxed/simple;
	bh=ri3Ab/w8ylepNYDhS7++udAmqB7j+tQzODtC2zg91p8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaEVM/6j5/wBKjIW1cvw01ZDXzAt88E92dOfeMNaHaUDB7e55ADkb/JZkJJDQEpauwQY2tFFbEiPHJD7HtMJaZu13r2v5Q6V2THXlKSuYw7nKb4+KfhOubhqGMFUCyHKm1PtF3rcO7Yn601fzu1IP2sxDOcSnm/wa7kfOCVMDL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKfJ5xH0; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKfJ5xH0"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b1e54aefc5so179503785a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Nov 2025 06:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763131483; x=1763736283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWteGZHapM/ld2g8RPEQnKVKieUk3L8Us0utHpeCavw=;
        b=iKfJ5xH0OAspklg4nciMV3MGsTxYAmB9w07Hkdwgk8f8MnkmTyJpZIPdQxnVXbWDD7
         qYOCxriZFae5674E4pl4KMRvie7s7WvJT4D4lxIzmmk2H8K3t49kFslJvNjwB3vRcekf
         YRjKfeaOmKLZ+JIZR/x9MosSPz9/ACGy10V4NubmtO9sQ6qf2QyWg0pT7iF51Cpa5RcF
         m4xenAA/oFbLtFcF74Cn6mWItuW0YVCK3sHbHiAj5PdoE6V7FZvusPm3z2+QxzUn0KBd
         VImZppVChCw7+ZSQyqjPyb0U6WpT+8TVji5BhKR3wBQBaxvAjHH5ViB2fDIwqgemDwYR
         3+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763131483; x=1763736283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWteGZHapM/ld2g8RPEQnKVKieUk3L8Us0utHpeCavw=;
        b=ZFr2fv2emADml5dbi0aivEIs88I7BKHyGenjY/Aho9ihx8e+Jm+8djNP7qt0p9ebfQ
         Y5Kx508zrlQwMmRvYsERA+Nq/WrnIs4giPVuuHH1g96WtrpOJgUXNlHlqN3ODo1j1u0V
         pPozwRTtB7ajlyBigUz2gHp4mQedcn8a1M/zWaYDHSHfg1LUSMVwgZmQesrRGo+4o+WY
         NoH0QFT3MC8xdH9v9lXZxKM20XR9Dm7pHvMWQsOgpPXnwq8MgWEdjw/dNJCQD2NEDINp
         1FpPAu41XsXPaOHmajqSAfhHi4oKue10Hv4O5sl7LSyjtUALk3oW/0PYDGGCxrKVB0av
         UMeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXawqNG3q35e0Ap6xUKZLTiKdPZubtkd9fuCoDfjF5xnX3hX6lgLzNx2xZlqtTuL5TRMSmIFWYVFlYuiGXmxA1cPF3toA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaEkqQCwS+Cj1rKc7Isxd1TIvwSQkLL4kDf3C9qspzNEa+Otv0
	j2OhS6GhbU/FFgcc+5PUXvGka6swD5rSlwf8qzfyofpSP8gQk5upCxbD
X-Gm-Gg: ASbGncvneSPgdoRzfnmPf7kP3abl/+WXgLsbJRNMXXcpXgovrOmOnhbspUb9Axwwxu4
	ZBth2IXvpcNaMnqAQN3fbXJ6wfHNph6lZ/3qqG8Oq0D+FMA2ONtqtg/i2gnqbS0mjotPyo3klgy
	77Ft54nvpGWm36cWgeU8Jz0QRNUze8JYKTiqw+w+NPGUw3cswXBPSIZnY27nKxHqgOZFARt9F/t
	M1TGQKBNoOmKXBdbJ5+TdjuB6eU4PHawDjlscyjK361uaoPZQsHwHSeiexxemCqk64lmAyX+uL0
	1GpOuZ8rc9VmQxcFXpigXcYpKbP0VB1rvjm6eBkkOimoJQCAnr3xr3F44uO6IWWPBOdxpWey3Wm
	1+zG87cka0Zc4EvAMhaf/Y/UO4oL0FJjXMmqEnwSHpc8pJ3J6UzEfiyIilT9sqCpahhbqQz1BQX
	qHlYaJm8xIlaTGLYM/6Jujgr+WYgih/2s=
X-Google-Smtp-Source: AGHT+IFPjQlSqC/ss4lwRCrHnzgS910DC//wiBOCNwnW0xCnYqx8uCQ1I2xzaPFYMjeaq4Ndw+mQCQ==
X-Received: by 2002:a05:620a:f15:b0:8b2:7726:c7cd with SMTP id af79cd13be357-8b2c31a622amr400786885a.49.1763131483265;
        Fri, 14 Nov 2025 06:44:43 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2af048749sm344232285a.49.2025.11.14.06.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:44:42 -0800 (PST)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jack@suse.cz,
	cascardo@igalia.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Subject: [PATCH] loop: don't change loop device under exclusive opener in loop_set_status
Date: Fri, 14 Nov 2025 09:42:05 -0500
Message-ID: <20251114144204.2402336-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

loop_set_status() is allowed to change the loop device while there
are other openers of the device, even exclusive ones.

In this case, it causes a KASAN: slab-out-of-bounds Read in
ext4_search_dir(), since when looking for an entry in an inlined
directory, e_value_offs is changed underneath the filesystem by
loop_set_status().

Fix the problem by forbidding loop_set_status() from modifying the loop
device while there are exclusive openers of the device. This is similar
to the fix in loop_configure() by commit 33ec3e53e7b1 ("loop: Don't
change loop device under exclusive opener") alongside commit ecbe6bc0003b
("block: use bd_prepare_to_claim directly in the loop driver").

Reported-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3ee481e21fd75e14c397
Tested-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
ML thread for previous, misguided patch idea:
https://lore.kernel.org/all/20251112185712.2031993-2-rpthibeault@gmail.com/t/

 drivers/block/loop.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 053a086d547e..756ee682e767 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1222,13 +1222,24 @@ static int loop_clr_fd(struct loop_device *lo)
 }
 
 static int
-loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
+loop_set_status(struct loop_device *lo, blk_mode_t mode,
+		struct block_device *bdev, const struct loop_info64 *info)
 {
 	int err;
 	bool partscan = false;
 	bool size_changed = false;
 	unsigned int memflags;
 
+	/*
+	 * If we don't hold exclusive handle for the device, upgrade to it
+	 * here to avoid changing device under exclusive owner.
+	 */
+	if (!(mode & BLK_OPEN_EXCL)) {
+		err = bd_prepare_to_claim(bdev, loop_set_status, NULL);
+		if (err)
+			goto out_reread_partitions;
+	}
+
 	err = mutex_lock_killable(&lo->lo_mutex);
 	if (err)
 		return err;
@@ -1270,6 +1281,9 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
 	}
 out_unlock:
 	mutex_unlock(&lo->lo_mutex);
+	if (!(mode & BLK_OPEN_EXCL))
+		bd_abort_claiming(bdev, loop_set_status);
+out_reread_partitions:
 	if (partscan)
 		loop_reread_partitions(lo);
 
@@ -1349,7 +1363,9 @@ loop_info64_to_old(const struct loop_info64 *info64, struct loop_info *info)
 }
 
 static int
-loop_set_status_old(struct loop_device *lo, const struct loop_info __user *arg)
+loop_set_status_old(struct loop_device *lo, blk_mode_t mode,
+		    struct block_device *bdev,
+		    const struct loop_info __user *arg)
 {
 	struct loop_info info;
 	struct loop_info64 info64;
@@ -1357,17 +1373,19 @@ loop_set_status_old(struct loop_device *lo, const struct loop_info __user *arg)
 	if (copy_from_user(&info, arg, sizeof (struct loop_info)))
 		return -EFAULT;
 	loop_info64_from_old(&info, &info64);
-	return loop_set_status(lo, &info64);
+	return loop_set_status(lo, mode, bdev, &info64);
 }
 
 static int
-loop_set_status64(struct loop_device *lo, const struct loop_info64 __user *arg)
+loop_set_status64(struct loop_device *lo, blk_mode_t mode,
+		  struct block_device *bdev,
+		  const struct loop_info64 __user *arg)
 {
 	struct loop_info64 info64;
 
 	if (copy_from_user(&info64, arg, sizeof (struct loop_info64)))
 		return -EFAULT;
-	return loop_set_status(lo, &info64);
+	return loop_set_status(lo, mode, bdev, &info64);
 }
 
 static int
@@ -1546,14 +1564,14 @@ static int lo_ioctl(struct block_device *bdev, blk_mode_t mode,
 	case LOOP_SET_STATUS:
 		err = -EPERM;
 		if ((mode & BLK_OPEN_WRITE) || capable(CAP_SYS_ADMIN))
-			err = loop_set_status_old(lo, argp);
+			err = loop_set_status_old(lo, mode, bdev, argp);
 		break;
 	case LOOP_GET_STATUS:
 		return loop_get_status_old(lo, argp);
 	case LOOP_SET_STATUS64:
 		err = -EPERM;
 		if ((mode & BLK_OPEN_WRITE) || capable(CAP_SYS_ADMIN))
-			err = loop_set_status64(lo, argp);
+			err = loop_set_status64(lo, mode, bdev, argp);
 		break;
 	case LOOP_GET_STATUS64:
 		return loop_get_status64(lo, argp);
@@ -1647,8 +1665,9 @@ loop_info64_to_compat(const struct loop_info64 *info64,
 }
 
 static int
-loop_set_status_compat(struct loop_device *lo,
-		       const struct compat_loop_info __user *arg)
+loop_set_status_compat(struct loop_device *lo, blk_mode_t mode,
+		    struct block_device *bdev,
+		    const struct compat_loop_info __user *arg)
 {
 	struct loop_info64 info64;
 	int ret;
@@ -1656,7 +1675,7 @@ loop_set_status_compat(struct loop_device *lo,
 	ret = loop_info64_from_compat(arg, &info64);
 	if (ret < 0)
 		return ret;
-	return loop_set_status(lo, &info64);
+	return loop_set_status(lo, mode, bdev, &info64);
 }
 
 static int
@@ -1682,7 +1701,7 @@ static int lo_compat_ioctl(struct block_device *bdev, blk_mode_t mode,
 
 	switch(cmd) {
 	case LOOP_SET_STATUS:
-		err = loop_set_status_compat(lo,
+		err = loop_set_status_compat(lo, mode, bdev,
 			     (const struct compat_loop_info __user *)arg);
 		break;
 	case LOOP_GET_STATUS:
-- 
2.43.0

