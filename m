Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF46309DC0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764792017; cv=none; b=rbpkYw6ZexYy06QHDrZs6WWUkgBTxBo72RXoyw86JMPUUvUKYQxqO9MAgmcGok6KGC5EONsa4bn7ncmtHGnYox94Symp2Si1ek5scePZnvsbv4Thnz8jfOG3ORbvb8eXFlN0rYOJZrvwVNul4gkkTzZY/gpdRDeUW9ydwk/9PTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764792017; c=relaxed/simple;
	bh=sZIcKW/T5PZgkl5ARVMAWUKwmfgWq7+GpC0yhv+i7w4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LrSKr8vohp/TWLLjMFP21le4O02JjDNsgOGUIEMVu+5n1uagw2zSobXnWI8R/qwUqrufxTmq2w1on5GibAQpflTw9w4P4S/+606ijI4HuQqmeU/wCxrNRsUkPha0pnEPCYjGbRpCUh897otu1z5FHs4qvAvKHQKQYfoOQ0UPI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQbMd/wJ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQbMd/wJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6409A411A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wY1wyeeyMCVZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 20:00:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B61B84119C
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B61B84119C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SQbMd/wJ
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B61B84119C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:00:15 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2953ad5517dso1779105ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 12:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764792014; x=1765396814; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfIa03Xp92u7l2cg7bQJgZlLGAJnEQNJLF5pQf42J/0=;
        b=SQbMd/wJXYD49DvGpxPhKr/xSNm25nuROfOk+XxCX6Al8ugs0qwDDIoQ0k2ZP/BEMP
         OHnYqdrhjYRdfUq01KLpnUxW/q1qV9OJf32Jn7ayHuTlklH+MBOUL6tsqxek/84IO3Rd
         NyUc2GNVsjIloD2Sj4ML8TWWXXvErQ/PAULSqmT/JnCmxjyCLWgz2i79xN0lUHsS3rQ9
         Yphv4iFjkK8L4byW6E/vJrOe2qGAr+7R7Rqjnrg8yWH//k0j7tCO24S7nJnvb5045jkV
         WLcfiCrWq03m630dNnoqTvhERpKvoiBZE+1t/HG1j8dTzilbpXSINns03IpMNN96v4u4
         UXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764792014; x=1765396814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfIa03Xp92u7l2cg7bQJgZlLGAJnEQNJLF5pQf42J/0=;
        b=Z+HBQXpYXV6FwcW6/t0gSXKSaWtVIpuPxXlwKy5BqEus9NxPgqSQvm6BcGXWrdsXSU
         MGdTDEEec4KLWIRu/uEPeuN4ega4+vMbMiialfmGNczoyp+O6ULFRSmnspxxQcpp0SqI
         JYwINrtT6XPvChlk/UoM2j2kMVkdz22M2xglyW2hRsup7hqWw7ViNlJPat9BSyUZVSJE
         rPFGq54SUCK3PFQRyj1GnfE2dvH5Dhrn3H81pEEmCBjl4QP4/rKVzXjvglS37O4Q7uQq
         evX4RIfMt7zxE9H0WpuyLC4E6I5RMwf8zfT9dONED9YhrlMWlf26uR+zoC7KHW7XM/Hn
         gwYw==
X-Gm-Message-State: AOJu0YxXuFWam8b+mjHBQ6UPvyVvowBXVEHRwAJOmUnOuIW6BKFoKz+t
	dUdKdPMYClQtsMkdi3ZhINSg88ci+8uAGWiW9dKt/WXBcRQv1D6Y7GNa9ueTIJdA
X-Gm-Gg: ASbGnctWng1n34V3yXPneQaFyABMO08IqvcrK3iBCPQGrv/I6fAu0wec0znCeyoZJcR
	T3tCSyfMez0IT8lFcuO9pruf77aFGuqcbFnvoeo/5jqF9LIndLpOEq7hJNOANs6AfXp2UsNGCFp
	CUTItHMlePZOVa9Ce1/ot7ocQtg1HMbTnMjH1Xv0xqBi6epudn7zea4PVEHoCxF1N9joISi7yBZ
	OxRhJ9OgTdh+xAcmqT8mOqOtfLdcNyRti1NZY7kLQ0SXLdYpZ9FZMpctVFb8BH/W5OuJ9iLftle
	NbWF/hLIy2lDRweW8mAJfjjTX6BzTxH/cPon2Mxurwxkacv9kNdMAq/2UPZgO8IRufH+Z7DHiRq
	Bu8oFRZ3k5l4ZxqIWOjIneRekqwBs73/Ta5fC0WTDo5un7MmBCzPGxQxbuGuB4qOuqRm2Ugh4pg
	vCraBNffabADk7pQ6CDrrY
X-Google-Smtp-Source: AGHT+IG80PhhUB1WpnX/RnsPWkyt+KFq3CR4s+c6uaobJyTf0Xeo85EfkCvlZg1EU2Wlb0roiFV8EQ==
X-Received: by 2002:a17:903:240d:b0:295:7454:34fd with SMTP id d9443c01a7336-29da1c92094mr4570955ad.39.1764792013995;
        Wed, 03 Dec 2025 12:00:13 -0800 (PST)
Received: from soham-laptop.. ([2409:40c2:116e:6f1c:ab6e:2f5d:e763:cc6c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910a7ef18sm3604815a91.0.2025.12.03.12.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 12:00:13 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] clocksource/drivers/armada-370-xp: Fix dead link to timer binding
Date: Thu,  4 Dec 2025 01:28:59 +0530
Message-Id: <20251203195859.65835-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old text binding 'marvell,armada-370-xp-timer.txt' was replaced by a 
DT schema in commit '4334d83904fc' 
("dt-bindings: timer: Convert marvell,armada-370-timer to DT schema").

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
No functional changes.

 drivers/clocksource/timer-armada-370-xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-armada-370-xp.c b/drivers/clocksource/timer-armada-370-xp.c
index 54284c1c0651..2221148e2de2 100644
--- a/drivers/clocksource/timer-armada-370-xp.c
+++ b/drivers/clocksource/timer-armada-370-xp.c
@@ -22,7 +22,7 @@
  *     doing otherwise leads to using a clocksource whose frequency varies
  *     when doing cpufreq frequency changes.
  *
- * See Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
+ * See Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
  */
 
 #include <linux/init.h>
-- 
2.34.1

