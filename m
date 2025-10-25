Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B71F2F5A35
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 25 Oct 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761396083; cv=none; b=S/oqfSCkS2tWwqlFcsAEWwNNoZaob4/a4xB938XJ2BtjAKEzNOhXG64uN4P6dGPONdUsiekcgJCiXwEJLt6FD5DO3JpQDG16+554YoH74sC+VcvaD141RC7eOuQT3tyU5rztnm4gB7EygrUfYiICmQsfwD9JCSBs3EYrIPYUwyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761396083; c=relaxed/simple;
	bh=DbhyxMxq4lUaU8IP69H+5X/6jxTC3W56/g+TqGuwKpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cowmOS+uvwMRe3C7Bcy0votKI4XkWrb6DnceA7KwchLsgOQ25g8Tpgr98XOMFTfauzL7CAK8yWj0JECRMXMUE7CCurplvYz8RguI5o3fseowFBcgVC3Hou5IEabtrg9c9lTostk7meo5vyqPKPMcqQ6QiMNsdLvaL0k7r0x/6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFMVZZD5; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFMVZZD5"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-292322d10feso25856155ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 25 Oct 2025 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761396081; x=1762000881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wmZntVTHHXX7vvT4or3/vlXQkt3zScSQQ5D3QkdreyU=;
        b=FFMVZZD5g2xukb7bWBV+lWM/jkkVt0kYU8Bw/F3cWkkjJcmijMPoltlhNkFmIFoGta
         Goog+VoykmWs2+ISBzXfTv17fhB982KtmoYwbMo/ALECskiPCNn+dkwaYqxJLE9JNRbq
         HsraN2FGRX1Zcn54/dRgB4oEfxgoBRo6Lk21XIo76fsR2c7aZK9G2+GE0/uewvRniLfg
         kJoYqGe0nxSSmRc2qB0bdjuDLQA8rDT52fsEuqX+7KrJTCfCM66JMj2N53T+HSND+UTP
         uZAUdvKmFTHuEQ3nXExi7djVFLdMOTExKq9AzlRfaWY1y5cLZzfD5Ke15Tiqcno6Sp31
         EAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761396081; x=1762000881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmZntVTHHXX7vvT4or3/vlXQkt3zScSQQ5D3QkdreyU=;
        b=eDdH5k+DZFIkDIAXsb81Im08xv5y0FJBpEOngUPhHaVAMHnjPK1bvFxPtwCE4RmQ7T
         dRw0ibuEbQoAE2xdnY+WqX1y8trEgFt5WNG5jd0CWZvcJu01ncjK0D6P4bdxWvVYk4te
         zYsTvVcyxorAzjcqf6ACjNjrCQ94NETJk9fWP6x8JH8+2OPiBHfenY7aMIOzXwkD647q
         lGfbLr8mWUv8CEtEemQLOEmx0LbGIMSrqU5rxen+hmErT2jwNDNYN/Wjv4fv/g58ccCZ
         QTHRXh/K5HR4o8ZJC3C21Y5zzkBipFU6AIN0r4N7hUOlrGdc19C2G9wtRXwo13RNtR3U
         bbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6QGwb0nW04kaWNoHIHRCpZ8l4dY2gidPw1KV8Et2EJvDGWapW9b4z033fsi/LHTTEbO5dWj48sibbt9vJFJfjPjfWuA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz50vF7uV0UNwh5ZYAxyHOeR1t8Xbty5v+1/Z+/IO0/xYOhyRSk
	F+iKJArSGpeBWeYvJnAkhOUJmApcAZEW4ZMpfXSwmG8rdhT5ZAvedXfa
X-Gm-Gg: ASbGncvtev336geD27HI6RjowOKoPZTvAZaCCvOxtX8Sd0aLQM1BlOn1SDY3g8i/o+X
	cjiFkQmvzZxdLEmZXhG8ZdEsgQQI+nMBt3nFkNtLwyaOdcYHHxmWxaMixt/S5ipS/H+yMbbH9Dq
	fBRnZ628tBpp8ZQP8XA2nhRbdWy8+0MecI/muWV4Trpy6J5GQdJet1zqgHRKjujlRUJGVg2HU8C
	YldhIO9HUoqLfDXbXfauUhI72Glu8cAci+mphJFC1NoYCPotDSanMGfbRcnKbslpfYLbafRci+2
	Y5KhdS6stzcjWdGh0zLlfH8Cg/MjPaoAeiPxLMrikRs4OO/TYkhhrFpYj0DrySZxf6aX9p3yRh3
	y2lCDA5lvcfu5Of9gDdF4P6ErsG3w2PXWSAoxh2kc6pTCnRjIcPR4u3R499JWOGw/XKFGHlNBXX
	OGKEaB+wA=
X-Google-Smtp-Source: AGHT+IHzNs/eLQNOngxeYDWlhwSANW/kUwt/EM86jh34NmnaHE0YhhBpGRAv70D0RhfuygrVqhJNRg==
X-Received: by 2002:a17:902:d547:b0:273:ef4c:60f3 with SMTP id d9443c01a7336-29489d70d8bmr73531765ad.4.1761396081179;
        Sat, 25 Oct 2025 05:41:21 -0700 (PDT)
Received: from Ubuntu24.. ([157.32.121.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f5csm22263395ad.104.2025.10.25.05.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 05:41:20 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [RFC PATCH v2] media: saa6588: Remove dprintk macro and use v4l2_info()
Date: Sat, 25 Oct 2025 18:11:07 +0530
Message-ID: <20251025124107.4921-1-raskar.shree97@gmail.com>
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
- Removed dprintk macro
- Replaced 'dprintk' with v4l2_info(). 
- Removed PREFIX macro.

Link to v1:
https://lore.kernel.org/all/20250923175927.4380-1-raskar.shree97@gmail.com/
---
 drivers/media/i2c/saa6588.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
index fb09e4560d8a..d2cb85a2d226 100644
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
+			buf[0], buf[1], buf[2]);
 
 	rc = i2c_master_send(client, buf, 3);
 	if (rc != 3)
-		printk(PREFIX "i2c i/o error: rc == %d (should be 3)\n", rc);
+		v4l2_info(&s->sd, "i2c i/o error: rc == %d (should be 3)\n", rc);
 }
 
 /* ---------------------------------------------------------------------- */

base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
-- 
2.43.0

