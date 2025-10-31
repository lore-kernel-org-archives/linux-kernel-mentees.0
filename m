Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D042FD1B1
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Oct 2025 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761929819; cv=none; b=BYDT4Jf0J136YhG/n/jugjSwGSd8Np3pKGq4I53XS81zr1Hc+9w8tlctpFLm2lG60LujTpavcZubQ46gp6hyVvEGHf/0ZhA5F4ioCqwjKSLIw21PF7z7zG4zxxBi2pwhbzbk3DB+N6yHH0ENo6pK5oouUJRUwby0lsfz/0kS78w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761929819; c=relaxed/simple;
	bh=WWnQxq9MvOz5vophT5mh709wnc18gU/QGh7BlY7BU44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rWhXg1K9V6+K/zDUNWGS6WMYhUg61lVZ4s/eshaJJ76JxGOVAdh2+8Xqtznl7Q9KOEcizplfdIz/Q+ZJMKx0OSOA2zhQP4YN2vg9hHLSucgPjy3UG644ncD/0dEBSMVrasBhj+6MfhRuS+4IxOhr1Ow6y6REEm3Ikb1hKC14+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtWOHX3n; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtWOHX3n"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-793021f348fso2294147b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Oct 2025 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761929817; x=1762534617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75H06cNN6UuN6pp1+AJHS92a14vydasjYoMYY7ki7eY=;
        b=jtWOHX3na0iJp5rDd7dUZ6cJOtQ2XIRDgj2dhWtTH5BAKTQPYoVKoOs68Tgi6pWLzu
         82ze9IlDBg8W8c67Gt5wWNqfhDdrUbuhDKQriOBwdzI85TGq/pdpRMyqWtI+P8v11MYN
         WoQuw9bMptQE8ct1PVi0Q6dKnFdbtOSm7JzcHvcl9dqMYi9AskEkArzkiTK4PPJeSm8t
         DMNp5feGk9m5tGHtEUo1mkC41ObEmnOHuaB7xHlx5e+Lt9yLScHjPFv2ZxK0rxbIQrj9
         IuY2ufJSAhDOoq2aGmCE7cmQcevIDMjRiDV8qlMXyG8Pxk30AWqSvmwiB/WZMw59C7pn
         LgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761929817; x=1762534617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75H06cNN6UuN6pp1+AJHS92a14vydasjYoMYY7ki7eY=;
        b=P9KAymWlBUmeh7eZNINMtuBGhjVdQNUgKUTFaZVkXgz/Pshe0EQ2XTiSTdprw26+1O
         KAFyaCL8SKz10VlUGdRxjy/yEAS8aOGP5k21/3fG8/TBMdehsul/Nl7VUpwBsiZaGvgl
         6f2ByJjeZ7Q+5140Wx/42BtGd8yFBe9DwEbWsO6r2pcsMoOR+LywUsKfp/tYF1MtwISH
         OJ7vKEMh7Qs9Ap1Ts+E1G3INZ5vGbCqEamXr/I616WpFPtdcwciCQJahbP6lSpoBd5WQ
         tK6jlN+HdN/MGoP9+novEyVj710i5Qw0GOfcip6PU/+9Ugt8plyX5bpy/i7ZJhyyWMZp
         DfYg==
X-Forwarded-Encrypted: i=1; AJvYcCWmNvFkxXAd41ARGbOBYv0WeYhIQW1rqFChpMGC+ENyrnYd2m57niN+miGS0Ve2VfRckJY2iurb3wM80hTsw+T1cju/+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy+AKWzQEnyL6yuhMswFq7Eoc5o9NtSt2G9mcfLa2yQziBgme/
	DQIwt3ARnXg4MHwQA/yyGwLaCzup0pRS6BnenKBmBs83oiCWxYd/891l
X-Gm-Gg: ASbGncvtbdiwoi0MEHBYK8VbEyYKR/xoQ8Ry5DBH8gUmYEBnM0DwKqBZ96Q2XXEg2C2
	sjzntBctSZjb6iPmMVzrmGy6Zcd0RV9qO0HswSigOnTiKknphQ80TBKYMyonsP7v7hZzaBqxRAj
	zZQYOZDwNb99st4wMWQ7sKtPQHFLgHEXrpBUXZwwkrvtafaDdObVugdgOMvDu2lMGZeTiBAoTfg
	NHFxsZk7b+V0Hsj0PHTDDjxGad8CuW2R4Zk8pqpMtSw52qR3efBsWWfqs8vWCvQA1SpS4M66pUq
	0NecQ5DMGgJIOncEC4CjbIrfQAo0qimbOogf7+xPueFH1VKqFE2gucBROhoiBG++7GPo1cwxDaK
	4wa8r6/mFBuutZBVUKxh44p8doQ0bYuSJjUOPAj7tQ6ii0AdvTkB3B9NXnHrViWyrVgkN05TElt
	CYohU=
X-Google-Smtp-Source: AGHT+IEn9mRaFriZ4w42iWzEpFpTJw3pAZ5gIf/TLvCs2205ZF0F+XXD+dUdH9vCvuvbHC5KOkO2jw==
X-Received: by 2002:a05:6a00:3e24:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-7a776d97ed2mr4632190b3a.3.1761929817335;
        Fri, 31 Oct 2025 09:56:57 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7dbc5aa56sm2745572b3a.68.2025.10.31.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 09:56:56 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [RFC PATCH v3] media: saa6588: Remove dprintk macro and use v4l2_info()
Date: Fri, 31 Oct 2025 22:26:45 +0530
Message-ID: <20251031165645.6217-1-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing 'dprintk' macro used an unwrapped 'if' statement which was
flagged by checkpatch, but instead of wrapping it, the debug handling
can be simplified.

This patch removes the 'dprintk' macro entirely and replaces all its
usages with v4l2_info() helper. The unused 'PREFIX' macro is also
removed.

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
---
Changelog:
Changes since v2:
- Fixed indentation issue reported by media CI robot.

Link to v2:
https://lore.kernel.org/all/20251025124107.4921-1-raskar.shree97@gmail.com/
---
 drivers/media/i2c/saa6588.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
index fb09e4560d8a..90ae4121a68a 100644
--- a/drivers/media/i2c/saa6588.c
+++ b/drivers/media/i2c/saa6588.c
@@ -49,8 +49,6 @@ MODULE_LICENSE("GPL");
 /* ---------------------------------------------------------------------- */
 
 #define UNSET       (-1U)
-#define PREFIX      "saa6588: "
-#define dprintk     if (debug) printk
 
 struct saa6588 {
 	struct v4l2_subdev sd;
@@ -144,14 +142,14 @@ static bool block_from_buf(struct saa6588 *s, unsigned char *buf)
 
 	if (s->rd_index == s->wr_index) {
 		if (debug > 2)
-			dprintk(PREFIX "Read: buffer empty.\n");
+			v4l2_info(&s->sd, "Read: buffer empty.\n");
 		return false;
 	}
 
 	if (debug > 2) {
-		dprintk(PREFIX "Read: ");
+		v4l2_info(&s->sd, "Read: ");
 		for (i = s->rd_index; i < s->rd_index + 3; i++)
-			dprintk("0x%02x ", s->buffer[i]);
+			v4l2_info(&s->sd, "0x%02x ", s->buffer[i]);
 	}
 
 	memcpy(buf, &s->buffer[s->rd_index], 3);
@@ -162,7 +160,7 @@ static bool block_from_buf(struct saa6588 *s, unsigned char *buf)
 	s->block_count--;
 
 	if (debug > 2)
-		dprintk("%d blocks total.\n", s->block_count);
+		v4l2_info(&s->sd, "%d blocks total.\n", s->block_count);
 
 	return true;
 }
@@ -222,11 +220,11 @@ static void block_to_buf(struct saa6588 *s, unsigned char *blockbuf)
 	unsigned int i;
 
 	if (debug > 3)
-		dprintk(PREFIX "New block: ");
+		v4l2_info(&s->sd, "New block: ");
 
 	for (i = 0; i < 3; ++i) {
 		if (debug > 3)
-			dprintk("0x%02x ", blockbuf[i]);
+			v4l2_info(&s->sd, "0x%02x ", blockbuf[i]);
 		s->buffer[s->wr_index] = blockbuf[i];
 		s->wr_index++;
 	}
@@ -242,7 +240,7 @@ static void block_to_buf(struct saa6588 *s, unsigned char *blockbuf)
 		s->block_count++;
 
 	if (debug > 3)
-		dprintk("%d blocks total.\n", s->block_count);
+		v4l2_info(&s->sd, "%d blocks total.\n", s->block_count);
 }
 
 static void saa6588_i2c_poll(struct saa6588 *s)
@@ -257,7 +255,7 @@ static void saa6588_i2c_poll(struct saa6588 *s)
 	   SAA6588 returns garbage otherwise. */
 	if (6 != i2c_master_recv(client, &tmpbuf[0], 6)) {
 		if (debug > 1)
-			dprintk(PREFIX "read error!\n");
+			v4l2_info(&s->sd, "read error!\n");
 		return;
 	}
 
@@ -267,7 +265,7 @@ static void saa6588_i2c_poll(struct saa6588 *s)
 	blocknum = tmpbuf[0] >> 5;
 	if (blocknum == s->last_blocknum) {
 		if (debug > 3)
-			dprintk("Saw block %d again.\n", blocknum);
+			v4l2_info(&s->sd, "Saw block %d again.\n", blocknum);
 		return;
 	}
 
@@ -370,12 +368,13 @@ static void saa6588_configure(struct saa6588 *s)
 		break;
 	}
 
-	dprintk(PREFIX "writing: 0w=0x%02x 1w=0x%02x 2w=0x%02x\n",
-		buf[0], buf[1], buf[2]);
+	if (debug)
+		v4l2_info(&s->sd, "writing: 0w=0x%02x 1w=0x%02x 2w=0x%02x\n",
+			  buf[0], buf[1], buf[2]);
 
 	rc = i2c_master_send(client, buf, 3);
 	if (rc != 3)
-		printk(PREFIX "i2c i/o error: rc == %d (should be 3)\n", rc);
+		v4l2_info(&s->sd, "i2c i/o error: rc == %d (should be 3)\n", rc);
 }
 
 /* ---------------------------------------------------------------------- */

base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
-- 
2.43.0

