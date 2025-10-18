Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD171E9906
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760803223; cv=none; b=cx0KdesnzwT/Ys6ma2MT2q5GatS8NuuL6ZsEbJfOuJ5Mzn4u8QeS80XwCtjfpZCdqY+Wv40wYlF5eUYkNO+NurfVrcnWPfsabcwvO4foyo2u4ViO6q7GTijpvZDvMPa+ZuDg74xqnten57ZZ30eSjmuSgfvLzCreQft9DR7iHQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760803223; c=relaxed/simple;
	bh=E0eC7uG/x6tJxe6dYLW/d2DLNMtZcn+NWrDu5wrGPfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FksFVQjeebiRXV4RX5AgPBdGsAMuXY9prYbQIqbpKbhhhn7hwKMMtNoCV1ihUhT9UT2Q+PehoiML693aW58a4zKHVKilbUiefeU40oXkqbLMSl1Tek5l/M856jgZRw+Nx2JLySLD4erAiIHl/a5cxwCL5WJONirn03jAbOv2YsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUpF32hI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUpF32hI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f898fso41570495ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760803221; x=1761408021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYDknAsVSqw6J+lGB8wIuCLduYid3HSa/x4btmLS4Wg=;
        b=WUpF32hIwIersgckMeYxVsM0noiqZ1jge3oTYb4HZiMw+ki+KM4MDY+ZtEf+BIRrFM
         lYJmXIBHXhskadd1VVihq3z4WZ+haSIVBZQO1dnZrOO7RBjwcQn0ePF0fLztlsFLeNso
         ctyroFGwZD0ONjoyFQ4YRC8HK4PZfeegaHv2AGdkVe5MO8JNKxemtxM0hLpQmryLpZFa
         tM58KF7F9ez5isEf4EAPUgTbWsuvcuN2lWet+Eig7bupVtlMLYRAEFBQJnoZi7UnDJbV
         6F8Vc3aBtP84DOy15x714jd4nSMlPNprt1uDplEx0Fo9R7dqKEg394RIjxtPAlvqxTQr
         HlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760803221; x=1761408021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYDknAsVSqw6J+lGB8wIuCLduYid3HSa/x4btmLS4Wg=;
        b=M+Pmz25/KSkfgPr51Ms5DRc3EpTq07LIc10mX7CL+HcENqeGZmRt8+QJmoKP5GTCV1
         IJn5w5mDGk8ovUoZ9jlujv7hJRgsweEnExLPTTZPnM9gTF5n+t3Tx66XXCEDbzvQzkFg
         +oCY7SUkzzaDEf5oEGkeex0WKmgVrkl5ak3gTb3xWY2es6v0E/vJGbo2VmcbGTZ5FntP
         vHyBRX9jqwrsf05mcKSL2GFFQJHxd/aiBVD2kP4LZW1dYUVV7WKFFoTtaxAPxhFP2nXB
         jGKU+T3BMlcWB1qmkLkpS4j9k3nMjpl+sCizibGQOuMQtDIIftJFaHHEoEgDtv/lkob0
         aBkw==
X-Gm-Message-State: AOJu0YywvDBKpZLl9OWrBejH3OlDAPiT4yyJ5GY2qVi+KzuWa4pcpOS8
	qYGMA4TIXydEqwB6V6qpJbiPFtGsn9JP2IcIipLCoE/JVbyFVs4cmGopsOjwCJ1g
X-Gm-Gg: ASbGncvtN6aEkovdlp4pg/9yCseyF2UU70HLJuvfsSsrSoZVdF4D0JcDMCg0IuYTOJu
	33lyqi4a+GQjXhzCB1ht5vW9Kb5IcKQNfrvJ3rzh2L7ijCMdEfsjpFUquXJWrvqukWdUK+zn9Wk
	XFprTik+Zfxsyt0LDXUVjhyx6wPTQ8SGRQnUs2apVVwOt3pjbdjizIPxcGgspaJNUNHBaXW4HXR
	g3GEJn/G/XE+eZTmxTZ9p0MG4tbM1BrFwdD3C1+CzQRDxb9LedXjTOInkFX+kKppvHK0H1zzOsE
	XZOQO5IuUn0hDCvznbA3dAPePBewRuxmkDSm3ghbwmAh8oNJ+ez+Sqed9WJU2z8ZjylgcugYuFz
	4UTz8s+SGjsVyKRvASHlmKEyxKWR2KUp75AMN2b6zDdJUsQ7EIdLdSVLL0MLCouhlYOcFopakMF
	+vN69i1OIdQBY4ZITtfJw=
X-Google-Smtp-Source: AGHT+IFOIgF4lT9R10ESTtG5+rcyNpNmXq7m99NQqmlBtUgsKKib02QLILgBTl9DDyZJhdwSkTtIZQ==
X-Received: by 2002:a17:902:d510:b0:267:776b:a31a with SMTP id d9443c01a7336-290ca121a37mr97752865ad.29.1760803220895;
        Sat, 18 Oct 2025 09:00:20 -0700 (PDT)
Received: from clint-Latitude-7390.. ([110.226.183.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcc83esm30113195ad.38.2025.10.18.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 09:00:20 -0700 (PDT)
From: Clint George <clintbgeorge@gmail.com>
To: david.hunter.linux@gmail.com
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH] hangcheck-timer: use pr_crit and fix coding style
Date: Sat, 18 Oct 2025 21:30:10 +0530
Message-Id: <20251018160010.12215-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style issues and improve logging in hangcheck-timer such as replace printk(KERN_CRIT ...) to pr_crit(...) where applicable and replace non-standard %Ld with %lld in debug prints and use proper pr_debug/pr_crit for kernel logging.

No functional changes were made to hangcheck logic.

Testing:
- Verified timer firing and margin detection using "hangtest" module that i created (I will paste the code below for reference) and checked dmesg logs for expected output: "Hangcheck: hangcheck value past margin!".
- Used Static Analysis tools
- Ensured module builds and inserts cleanly after changes.

Let me know if you want me to do more testing on this module.

[] hangtest.c (testing module i created to test hangcheck-timer module):

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Clint George");
MODULE_DESCRIPTION("Hang test for testing hangcheck-timer");

static int hang_duration = 20;
module_param(hang_duration, int, 0644);

static int __init hangtest_init(void) {
    unsigned long timeout;

    printk(KERN_INFO "hangtest: Disabling interrupts for %d seconds...\n", hang_duration);

    local_irq_disable();
    preempt_disable();

    timeout = jiffies + (hang_duration * HZ);
    while (time_before(jiffies, timeout)) {
        cpu_relax();
        barrier();
    }

    preempt_enable();
    local_irq_enable();

    printk(KERN_INFO "hangtest: Interrupts re-enabled\n");
//    return 0;
    return -EINVAL; // Return error so module doesn't stay loaded
}

static void __exit hangtest_exit(void) {
    printk(KERN_INFO "hangtest: Exit\n");
}

module_init(hangtest_init);
module_exit(hangtest_exit);

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/char/hangcheck-timer.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/char/hangcheck-timer.c b/drivers/char/hangcheck-timer.c
index 497fc167c..a95e6d608 100644
--- a/drivers/char/hangcheck-timer.c
+++ b/drivers/char/hangcheck-timer.c
@@ -69,7 +69,8 @@ MODULE_VERSION(VERSION_STR);
 static int __init hangcheck_parse_tick(char *str)
 {
 	int par;
-	if (get_option(&str,&par))
+
+	if (get_option(&str, &par))
 		hangcheck_tick = par;
 	return 1;
 }
@@ -77,7 +78,8 @@ static int __init hangcheck_parse_tick(char *str)
 static int __init hangcheck_parse_margin(char *str)
 {
 	int par;
-	if (get_option(&str,&par))
+
+	if (get_option(&str, &par))
 		hangcheck_margin = par;
 	return 1;
 }
@@ -85,7 +87,8 @@ static int __init hangcheck_parse_margin(char *str)
 static int __init hangcheck_parse_reboot(char *str)
 {
 	int par;
-	if (get_option(&str,&par))
+
+	if (get_option(&str, &par))
 		hangcheck_reboot = par;
 	return 1;
 }
@@ -93,7 +96,8 @@ static int __init hangcheck_parse_reboot(char *str)
 static int __init hangcheck_parse_dump_tasks(char *str)
 {
 	int par;
-	if (get_option(&str,&par))
+
+	if (get_option(&str, &par))
 		hangcheck_dump_tasks = par;
 	return 1;
 }
@@ -126,23 +130,24 @@ static void hangcheck_fire(struct timer_list *unused)
 
 	if (tsc_diff > hangcheck_tsc_margin) {
 		if (hangcheck_dump_tasks) {
-			printk(KERN_CRIT "Hangcheck: Task state:\n");
+			pr_crit("Hangcheck: Task state:\n");
+
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
+	pr_debug("Hangcheck: called %lld ns since last time (%lld ns overshoot)\n",
 			tsc_diff, tsc_diff - hangcheck_tick*TIMER_FREQ);
 #endif
 	mod_timer(&hangcheck_ticktock, jiffies + (hangcheck_tick*HZ));
@@ -152,7 +157,7 @@ static void hangcheck_fire(struct timer_list *unused)
 
 static int __init hangcheck_init(void)
 {
-	printk("Hangcheck: starting hangcheck timer %s (tick is %d seconds, margin is %d seconds).\n",
+	pr_debug("Hangcheck: starting hangcheck timer %s (tick is %d seconds, margin is %d seconds).\n",
 	       VERSION_STR, hangcheck_tick, hangcheck_margin);
 	hangcheck_tsc_margin =
 		(unsigned long long)hangcheck_margin + hangcheck_tick;
@@ -168,7 +173,7 @@ static int __init hangcheck_init(void)
 static void __exit hangcheck_exit(void)
 {
 	timer_delete_sync(&hangcheck_ticktock);
-        printk("Hangcheck: Stopped hangcheck timer.\n");
+	pr_debug("Hangcheck: Stopped hangcheck timer.\n");
 }
 
 module_init(hangcheck_init);
-- 
2.34.1

