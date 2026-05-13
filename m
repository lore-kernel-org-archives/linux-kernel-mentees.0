Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A780E3D811A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 May 2026 09:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663440; cv=none; b=Rttl0l5qlIifobs863iPIxDwbYpHvwXalHeR0IjdeLTKgqcVF9Q3Wvrxo6mZBKdfRn2stqUIRe6oAJU3AQFhfgKJT08IBZ3apukdJ0enzrD58JdSuegxRImmjDpizrgJ8K86vksGwtO7LJN2rty9UcTegYbYOuBkl1LlSbtfpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663440; c=relaxed/simple;
	bh=rC7nG2+GpOdgcnUjLzX1d00FpSLVoi1YuxHiT2V+/I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rT1l376WVen2MnDZG/dwHGEnjpWKM4wuZ5YoQnIv7CFO2CBI5nT78NiVzN+eCd1mIJRQxbmjz7SuZ0QWPHqYT5h89V8wqsS3HOMyGT3GZFedioBunDohKbZCZkDYLOW6ZykIDYSYOwfSQYqlOeMn3j7mOZWXeRPdNpD8d7uOi/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffJLv4UN; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffJLv4UN"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C90A4094B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 May 2026 09:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyHn_WaZ5_NL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2026 09:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D55340928
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D55340928
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ffJLv4UN
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8D55340928
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 May 2026 09:10:37 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba4a1a0325so45444925ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 May 2026 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778663437; x=1779268237; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDkyCdkfOQyq4nl3ME+VrFeCYaGPzyVj4zyQTMVwELs=;
        b=ffJLv4UN65d2ORs/zjJXWMM3XvndrN1mAZqovdjXTH4nIqyJ1Mnwu3EjVaSryAr0Nt
         1hpg8UnZwjGN6dh88XulOLqz6elBQWLsq4YZVEP5xN0RVoMoWQALQ+eK3vSyew276ZVG
         OTd3DBuzq0E3rfJ/bK6GC6/SECSiE+idJTmf+NYa81993E0kUGAUXnVRCJtR51xerxYy
         EskG5cAPjU5JrImfnmn96Q8+ng4TnKJ2qXb1hcQtoipwBfMzCdyB/eZar0dIpSH95A8G
         m3fAAwTzy/RjA1uSllYhHlE40u301KLe7CZfAh7jwEgMtV/x08D16nkO0jEUI/0+JkTZ
         La1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663437; x=1779268237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDkyCdkfOQyq4nl3ME+VrFeCYaGPzyVj4zyQTMVwELs=;
        b=LdtRYD4Eunno9Lpm4GtSkPd+yDtoX1arM5uloRx0tzDC0jU1btxAkeo2tG1SAMNEgk
         10XpzAVF4KwqPgfMkhsWbXT7f8BKDsnnOtLiDFh8jwkRoO4kKbYMsBEENqVZOJpZSiFV
         3HDzm4zEe9lsVsBNnFvBmdSDb1nzOS6+MAQeHZccg0epMdKWo2DElzAuFHJkyte2RATz
         yoc6AvBPH9A2Ddlcx6U79Wgr0pIIN+nsdQ/KpI58CbnRXMLphPfrn2zk3wOL5RC7dYrR
         WkeXM+j1nYASaF4iZclCeLz8EeMfkhGSqjN+lPmCihGs6yk5vv4fQNAG5LO+gj8bFGkE
         KqNw==
X-Forwarded-Encrypted: i=1; AFNElJ8cRf4wQqGU6T6BaiSFpcrWzSsLcJbgAZ4qqVNHgIz5iMHIVR0LXS/qErwlvSj/lhtpsFFehfMWSHEc/QH5PfkrHUh3Hg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzsC3mL2S3disSPBjvtAOEchyLH7YHgsx5nbIVsbjlNRyqiDwWQ
	ClFnoaxmRpJ4HJi2R7ngxQJYmcE0ASN1bPvnbhWN616F3nUYlD9IpmW2
X-Gm-Gg: Acq92OHjetoKOqVmPtl3OSXxKEuFAbUjDhtp+NLzZtlbZs1K+uLFNyxVAdbje5dK0J6
	taiklpe8ssV0TaMfYmCVDXsZH7chI4Wj61M1Bjdlwkg0uHMPUC3gR8f36phHgubuiLS05WH3F5P
	6K+0ZGtiwoco9pLUVCE6Jzjd4SA+B9Jslg41PsuGU2NXf1RNktsZHNI9E5ssH4uKy0WSymYLp3U
	HbM4GabD/+qy1rHSxJqWRK5ZSJrhUZNipTf3I8DD2xm+qjN/Ekf/FadL3fn+Znrtc247j+Gla5j
	1BNjn4CWFNBKZcNdtdCly8LDJvOdiNssU7582RCxMm+NdHPaAW5x65nE1zwTthNPDrnEt26BSsw
	GKaFZv5RFz/bWQTRZ2yzu9GjAOzIzwjFAbqCBb2KXxoEi/WoxBcwkQiQZWA9qevBHvcImHzFUBS
	qn/sSwKBWHY0WneE/+V8saRWe/sTgTRj0WrC9Bew==
X-Received: by 2002:a17:903:3e25:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2bd2718bf33mr20560465ad.7.1778663436624;
        Wed, 13 May 2026 02:10:36 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e66970sm160480945ad.56.2026.05.13.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:10:36 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: amirreza.zarrabi@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()
Date: Wed, 13 May 2026 16:10:31 +0700
Message-ID: <20260513091031.145826-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcomtee_object_user_init() is a variadic function and when the function
return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
case, there's no va_end to cleanup "ap" object initialized by va_start
and that can cause undefined behavior. So make sure to use va_end before
returning the error code when there's no dispatch callback.

This is reported by Coverity Scan as "Missing varargs init or cleanup".

Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I don't have the device, so I am not sure how to test this change.
Thank you.

 drivers/tee/qcomtee/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b1cb50e434f0..901a31e8201f 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
 		break;
 	case QCOMTEE_OBJECT_TYPE_CB:
 		object->ops = ops;
-		if (!object->ops->dispatch)
-			return -EINVAL;
+		if (!object->ops->dispatch) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		/* If failed, "no-name". */
 		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
@@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
 	default:
 		ret = -EINVAL;
 	}
+
+out:
 	va_end(ap);
 
 	return ret;

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0

