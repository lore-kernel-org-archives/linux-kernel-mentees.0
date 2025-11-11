Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B294361DB2
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874034; cv=none; b=JB4YEDgc/N52r7KGlmiuiEaTaU4FL+2wU80yCRBhim3RM0cxln3tK1YgJhd9LOw6mOmf5xMp3kvAgr0Fy8V6CYgzP2K6ivFW28ntT7l8bFbaI8xoMkOZhVvBPEp7y0F5ea65H3G5/EoetErbGcPmjUJ/NmF0JEJGCm7tYm6kbhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874034; c=relaxed/simple;
	bh=dtUjLOdH30HZ7lq2Yut9cRbOFxg6eVSJ7fh2zMthlpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1ODceTuNRqVDvz39ibdX95n5VLlYSWWCKLx4BOncm1JXezUFuMloEIAjqzCJFjHfRl/vNpYU3BOKEIbmi5GRYnoTqbv24CXTG/bADozZgK0yEgv67TyogHPZ1u0uUcAL0pUz9swxR6vABsAE8AgTYDFaCi0dNdE+F45CiYDJ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6iDjTy2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6iDjTy2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2956d816c10so45768765ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 07:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874033; x=1763478833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUyh9ZW3/kLx88s0Qv7t672gbmKqLdg3BEyz6Kj12UI=;
        b=k6iDjTy2ZDpVmYPaW+2m9m5f6C+N2IB1Qhj+85/YsznNwi6GHTblsqi46zt1BIy1L/
         s30hVMOSFjh/ZUsPPGR4QdqQKpdR1K9PgQqdIQDjp27LRy39km0yOkQalrnofXpBmiaK
         o5H4UHY9iNd1zKH5v1C5zQ1aIa/R8kdo7ruTD4mVbcUYLyVdEd7s+hg4sSwPwP8cReVR
         83gHNoKdbUNaqW/goO0eDxw9bIU+czZCYvbT0vww/A1qms8Gs8BkvL3clwghlgkiDMVk
         Cui4iXP6evTF6rdiyRDkupCZbjTp5i9v114f3H9ILmdf7vsCl8Dlqs7FcVROmulJxOvJ
         EDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874033; x=1763478833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CUyh9ZW3/kLx88s0Qv7t672gbmKqLdg3BEyz6Kj12UI=;
        b=tNtkK8p/M6McOwzPEYirK4/wmW4qVJTWQxVLtYTy0r0WL6rI2TZEFCbLiv3odQBKcE
         lvCGWWrwFi/kJggrVv8pBnVGwyxtS5SLRkCdh3C81hxfM+OJYLdmyIZn70+87llkkbnc
         a+ACg1MU/e1DSPZhrfamvc68AwxfAIXvyCp2Qb2Dxfl8/l1YPT+maCuCRbNq4ynobmc6
         xYMdrYr3ZNg4Vq3/OztcW31cHPxuNBxjvvx2kPWtwh9ksBK+EPg8i48XHQQVuJjYHCJc
         ssBPwNkHFh075KrFsyYbn03QmGCMQlqhd1wuU1jL6oWsCwTX5c85B1W63TPDl8OY5gG/
         NryQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFfwqX8QdKaIwBRnDIecrzx+Axtd0CKwHIp/s71yje9x6itT5oei4qZIflf7GyrJ01AsCSTcqDtxEuQsTnr4FAfCTckQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvo82XzeSFanQNsb9uLXyqPXGGSy0nez1Qt72cDbXAhIxPkC48
	64FauIt9IqrlggC8p0ozGtpgvyAzxMJJrePtRflMJ5gp5GIYgQeHDuzL
X-Gm-Gg: ASbGncsVLVdLXBLHOXfgAxVgthOEwqcpyyb105arFhTMmjH2jzTeMIEjRodPVKYks5B
	uqwM3kjbI3ip/rEaUtRpkEV+62HNlYTIxQlsMJN+w0y4aQ5Ou5EyIxhgLgNI8NHP7uIrutRMZe0
	iTrh8BiuGhguOSqVjAXNPZwjPZnMiQVRlv06X7A0emLuMGrfiRcawCb5Qf5j5jp3/iN2XngzAr7
	48DcFqHAk5FahYOivEcuB5fNvuQKMTsx3xAk2i7poF2nql5V8DhL+MpL5lcSRaC92eS1hb28/4z
	32hhCTdUWMl0t4zSjPwUXMg6GtO680gKTnTc9e3JNFyh01aCJkfLlU65xfJ1jqR2VC47LV53yBc
	fi6tTgclCehmUHrYtxGmhq/JcySMrFHeS0q++yyW9zfJ4lCpKqsM7kUL9xoD4WPd1dDmin6DxO7
	3hZNMECVje3hAhZLfOFa5VR4Sx
X-Google-Smtp-Source: AGHT+IFZEnI8fZnhodv8vqzdFTSs7qYOInfMTTdTV9hrb6S4aEfRvMyAWau29LKKOvYeIyEUaRpJdA==
X-Received: by 2002:a17:903:32c7:b0:295:8c51:6505 with SMTP id d9443c01a7336-297e56aea5dmr158213485ad.33.1762874032711;
        Tue, 11 Nov 2025 07:13:52 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd050asm43325ad.81.2025.11.11.07.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:13:52 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	clintbgeorge@gmail.com,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 1/3] hangcheck-timer: replace printk(KERN_CRIT) with pr_crit
Date: Tue, 11 Nov 2025 20:43:38 +0530
Message-ID: <20251111151340.9162-2-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111151340.9162-1-clintbgeorge@gmail.com>
References: <2025110649-elves-steadying-a4d0@gregkh>
 <20251111151340.9162-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace printk(KERN_CRIT ...) with pr_crit(...) and printk() with
pr_debug(). The change aims to make logging more consistent and
readable.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/char/hangcheck-timer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/char/hangcheck-timer.c b/drivers/char/hangcheck-timer.c
index 497fc167c..21ef8a6a0 100644
--- a/drivers/char/hangcheck-timer.c
+++ b/drivers/char/hangcheck-timer.c
@@ -126,23 +126,23 @@ static void hangcheck_fire(struct timer_list *unused)
 
 	if (tsc_diff > hangcheck_tsc_margin) {
 		if (hangcheck_dump_tasks) {
-			printk(KERN_CRIT "Hangcheck: Task state:\n");
+			pr_crit("Hangcheck: Task state:\n");
 #ifdef CONFIG_MAGIC_SYSRQ
 			handle_sysrq('t');
 #endif  /* CONFIG_MAGIC_SYSRQ */
 		}
 		if (hangcheck_reboot) {
-			printk(KERN_CRIT "Hangcheck: hangcheck is restarting the machine.\n");
+			pr_crit("Hangcheck: hangcheck is restarting the machine.\n");
 			emergency_restart();
 		} else {
-			printk(KERN_CRIT "Hangcheck: hangcheck value past margin!\n");
+			pr_crit("Hangcheck: hangcheck value past margin!\n");
 		}
 	}
 #if 0
 	/*
 	 * Enable to investigate delays in detail
 	 */
-	printk("Hangcheck: called %Ld ns since last time (%Ld ns overshoot)\n",
+	pr_debug("Hangcheck: called %Ld ns since last time (%Ld ns overshoot)\n",
 			tsc_diff, tsc_diff - hangcheck_tick*TIMER_FREQ);
 #endif
 	mod_timer(&hangcheck_ticktock, jiffies + (hangcheck_tick*HZ));
@@ -152,7 +152,7 @@ static void hangcheck_fire(struct timer_list *unused)
 
 static int __init hangcheck_init(void)
 {
-	printk("Hangcheck: starting hangcheck timer %s (tick is %d seconds, margin is %d seconds).\n",
+	pr_debug("Hangcheck: starting hangcheck timer %s (tick is %d seconds, margin is %d seconds).\n",
 	       VERSION_STR, hangcheck_tick, hangcheck_margin);
 	hangcheck_tsc_margin =
 		(unsigned long long)hangcheck_margin + hangcheck_tick;
@@ -168,7 +168,7 @@ static int __init hangcheck_init(void)
 static void __exit hangcheck_exit(void)
 {
 	timer_delete_sync(&hangcheck_ticktock);
-        printk("Hangcheck: Stopped hangcheck timer.\n");
+        pr_debug("Hangcheck: Stopped hangcheck timer.\n");
 }
 
 module_init(hangcheck_init);
-- 
2.43.0

