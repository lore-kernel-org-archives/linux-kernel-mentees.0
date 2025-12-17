Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490C10FD
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Dec 2025 19:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765998200; cv=none; b=LswvqB0b+Ilyx02kxAduvk/CotRUvGrunTrevc9mI0edJYdAcycKBLmP1LjU5yrQa+zPz7UKctBBajjeMtyIdhfDW5OYgIxffsGMohD7xt1jB803/q4nMN0JgRNGL2/e3sQnZPTIBGDdtU9XCwOwD0kF4YPVo+yp+EVinmIvwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765998200; c=relaxed/simple;
	bh=6IPbdt1L4AGkDZACFtU1zcBqo0Cbbff5QZYI76FNr+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOsYA2TGIOl3tmnvxpdC/MgNE2wPEC25GLhhJMVbCbGY/qUzfWIjIY+7Ft5YjhFhjiafx5Dw9wBBb7b/8ZeA+nq29no39U5/QcTXJQWDgwwWIT9hkAzfOM5aJYMAX+fEiv0FIJwMQwedrTSpd6z0mO4f5NCoDizHUSwc/ooHFug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTso5x8U; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTso5x8U"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f6bd3a8f4so1998068241.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Dec 2025 11:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765998197; x=1766602997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz8NDBC8rkRf0BKM+wNwYegVQjLipzJuVVp9JyHFbTo=;
        b=cTso5x8U8zZdrwR7sse1CZwuTbCQ/lqV+3X1TvJ6fNZUtpCrfw+5/HyhPwm8QCxiSn
         K5Eg0/o3K6/hIhjlJL3P/4YH+/dhyFvLoXNh43wXdlx5S6RJdxVYvOf2PJtVMHw1OSJK
         DeaUhDZgEjuvbbSRI9O06GT+FBrVlH2RXEFpaeMcxbFo8SK3FIDlb2jx1uPHk1wYDfSb
         rM2kHMlnjF7ajFU/K4SvVj4kg+63C2lCc5gCv6HPOOOjsG3GeWndt2JqpleS0cAxDXqJ
         P3G97LX2ZQZwlyWKqlGQioMi7sX0UhBQAmyjQR1+uCiVTYXdQORrtGRgBdsz+9uz52Vr
         7Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765998197; x=1766602997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oz8NDBC8rkRf0BKM+wNwYegVQjLipzJuVVp9JyHFbTo=;
        b=JoQ9glWTRubvZKvfIFTHT2qaB8iObhOoJ/eNo0ZXBDYiJGDVaF0pw3EhXkoKqVEfWC
         li05Jm1kgSly22/VfiYOMh9Qdf0w8y86D9/DCU9ew8TrmVZrFEAENiOKcC9451UD5Hv7
         nUwMp9PP3Yb/wN7ztBekSvdFw3Z48ODn1dBwVlipdZoeZi6qFCZK8qo5O5DADZht4cSh
         YHD9gKM68qul2KX13eKbaiH5PHx/wa8VdTqnIbMp/LY/8WnbJ8WNfeWcm2BJfXDsQHe4
         14d517DWGCY/86g1haOm6eRx1nb2k2wTKATCzU90zEPMnPQO/nantBJI+ihajF2DSUBQ
         hmNA==
X-Forwarded-Encrypted: i=1; AJvYcCVWPkSLALXxuG9cWEvuejROzxNLougDTdUQrnwtl2n8D/8ls9ZQy7UH8UH9nMdEX0BshN+JhlSkbSdJzo+Rl3xV398ZRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYhpzk1NfMp9Mibmup1WvqB5RrFvvpDqR3q283AiVEqeOqmVDH
	WjMPBEaoC87UuanRxMLdHYc3aMlEXoKtwo+omj9hma8PMHeLb4IaN/s5
X-Gm-Gg: AY/fxX5CTceiIx5cIGyy3zCUIhQOt5J4EgWDa+ZFLxn5nlfNL22SUKx9a6SyZKE5S84
	2F4SyQf40ogVMahS4kh7QbTPOL9kiPuEeUWiHaRMe8tbYHl3mQFdlLPukZPuEormvUguOfMCpay
	VBZKAOUyydWZWEbNKzEb9XRHZh+DOUjS5hPiUlwQF7MSkTYUGCxZlZt3IBKc5tKxgBnXVz00Mzh
	+pL9CQahPZkppCBgUft+i7rYy27iZtRW8ieVJNrYrJhXiumb6eRwKMiBPMpHIV2EoJ385Axn/Ja
	BTiEHVDybP5nv0M24ELLQGfFneNukppRrr3xnyRrX1+3khXjkJnf16Xr6utLApvCgt8TJ+EC3s+
	AWmBoS1o1++gTyWQk8FhKqEcI6QeQichsFYz0qhLWhIKj0gglnJutEkSXMsuIiIoSU4Y53YCppC
	VWZaGNeXioqpfCuvqg8oSJdMGNX0N/JdI=
X-Google-Smtp-Source: AGHT+IEtFw7PJ5j7j9LgFaSmuKm/BvvOVGHX9z+Y+/Ht/9IPYaHhHPd/iE63FBwhRQqgHyc5KvxbvQ==
X-Received: by 2002:a05:6102:4498:b0:5dd:a616:69fc with SMTP id ada2fe7eead31-5e827472567mr5852681137.9.1765998196849;
        Wed, 17 Dec 2025 11:03:16 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88c61188285sm1365616d6.44.2025.12.17.11.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 11:03:16 -0800 (PST)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: axboe@kernel.dk
Cc: jack@suse.cz,
	syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
	Yongpeng Yang <yangyongpeng@xiaomi.com>
Subject: [PATCH v2] loop: don't change loop device under exclusive opener in loop_set_status
Date: Wed, 17 Dec 2025 14:00:40 -0500
Message-ID: <20251217190040.490204-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2crvwmytxw5splvtauxdq6o3dt4rnnzuy22vcub45rjk354alr@6m66k3ucoics>
References: <2crvwmytxw5splvtauxdq6o3dt4rnnzuy22vcub45rjk354alr@6m66k3ucoics>
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
Tested-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
v2:
- added Tested-by and Reviewed-by tags for v1

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

