Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060163A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKJZq/6e"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E2B54016B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 09:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E2B54016B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DKJZq/6e
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHpEa3cq1zmn
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 09:03:07 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8D713400C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 09:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D713400C5
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6cbe5b6ec62so1980696b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 01:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700902987; x=1701507787; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO9T1f7+xQGxacGqr4UGfolgAcK+nTqINcLwMQXMAsg=;
        b=DKJZq/6e9g46sHwHrCpvePyjQNafOcmPhGroIEg7Ld4sjlUuZ4VHQDwdA/DH65u1nM
         QYpP64GQy+GiBF/v1oYax9wSmOOr0mrqat6SjP5UAA2xveiwTS5QUqL2L/mP7LPQABWE
         eBCJoNbsJ0Hntf03XbaNAe7gvP6RHaqISKduTLjsICr9MPqCsJCMh9GuKKsInogJiEvV
         dWUdxGgC9z/XqSMrhBZRV8GfXWr7vr7IP6hJt3lHbKUBCbWHSCS86AnQI+/M4oIX3Rl+
         4l9tk64/cSpFk9R7+SwjnR7mM55zcsMrcGrbVww181TAa231v9yqLCbXCLwgQgyPDxTN
         dk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700902987; x=1701507787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO9T1f7+xQGxacGqr4UGfolgAcK+nTqINcLwMQXMAsg=;
        b=E4W0e3iRvGZrYxoxr8+3suH3bpJPmPLkaaBJpymjUEMuSIW27X3h6olKZB57mVh6xx
         U7hKDYJEcTsowXPRXL7YTKvvHC4wdkC8MbfJmpPOFUOLPTU09RUCepiRaOtzrwRz/K3D
         4/RMENxLYZ6uAge8pJxfS0WDQsKTknvkcBARG78JEb7XXmDcwK8jgbXrKqEQNYr0jrZ5
         KflPGzDWZJludEfz0adPVX0iAtutrj2i0gPlHO6LgfbJguXIc+RPoG1TGlbCakAgJlgn
         HvUBwYYejg8dYnzvYLDx9dQA4WWHPRzoZk7F1d8CNoukEWISn0K0VCMLY6i++dE+gqGG
         RUQw==
X-Gm-Message-State: AOJu0YxU76otFLSoJE+guKOr7QzYad9bUOfdXJNxag5miXcVJ/O3iBuZ
	A5jx/k1hMHonM6Ec4/8gRqQ=
X-Google-Smtp-Source: AGHT+IHzHe+EX24z8BHIjaM3k4H/XwNhsDntn0KLOhQQwYivmHfHFxBAmxTh6FhgpXNa1WfjFYXxJQ==
X-Received: by 2002:a05:6a20:6a22:b0:18c:346c:d59f with SMTP id p34-20020a056a206a2200b0018c346cd59fmr1985559pzk.62.1700902986672;
        Sat, 25 Nov 2023 01:03:06 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:716a:b035:7b6d:4b79:e0d7:1a84])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090a3d4a00b0027dafa55306sm4511646pjf.40.2023.11.25.01.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 01:03:06 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Phillip Potter <phil@philpotter.co.uk>
Subject: [PATCH V4] media: stk1160: Fixed high volume of stk1160_dbg messages
Date: Sat, 25 Nov 2023 14:32:36 +0530
Message-Id: <20231125090236.654605-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with printk_ratelimited.

Suggested-by: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
V4:
Updated printk_ratelimited to KERN_DEBUG level instead of
KERN_WARNING level since the original function in use,
stk1160_dbg, uses KERN_DEBUG level.

V3:
Fixed the issue with my patch needing previous versions being applied
first.

Used printk_ratelimited instead of dev_warn_ratelimited because
of compiler error "incompatible pointer type".

V2:
To add KERN_WARNING in printk_ratelimited, and later as per warning by
the checkpatch script, replaced  printk_ratelimited with
dev_warn_ratelimited.

V1:
The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with dev_warn_ratelimited.

 drivers/media/usb/stk1160/stk1160-video.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 4e966f6bf608..366f0e4a5dc0 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -107,8 +107,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/*
 	 * TODO: These stk1160_dbg are very spammy!
-	 * We should 1) check why we are getting them
-	 * and 2) add ratelimit.
+	 * We should check why we are getting them.
 	 *
 	 * UPDATE: One of the reasons (the only one?) for getting these
 	 * is incorrect standard (mismatch between expected and configured).
@@ -151,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/* Let the bug hunt begin! sanity checks! */
 	if (lencopy < 0) {
-		stk1160_dbg("copy skipped: negative lencopy\n");
+		printk_ratelimited(KERN_DEBUG "copy skipped: negative lencopy\n");
 		return;
 	}
 
-- 
2.25.1

