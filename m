Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40480325707
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Nov 2025 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762351553; cv=none; b=f5fkwrSNFP9ejOhXAuO7bR02c/rD9Vc5Q6t8yUwcKelm2/96G+dPaoBaXAdLUhc544jhVZAtlu0LbVDnwpZp+kCAiASHFZpmJLBdnSi+IHYNKIjDarujuAGi9ZvKgr3tTzDJHRpPfL/uX5KCHOS1EDQ72dVR1QxIe6x4LScWa+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762351553; c=relaxed/simple;
	bh=JXoV6kUftFSascQFoxPb3u7Yjr5yxj8zRpvd60JJ6N4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f9l/WTj4itEs2embCqEYU4hnDRJhmFgKKp8qRpKjnuyBPIFsh9OWKeLHYY3HonAokTHl199STK05ruxXiLuVmGFZcXK2ES4JIb7yCTd7ruCxrZugYVHA04OzlS4OIoeOPgeZQC+9ZFHtFhLIzuhPCIQ5kT0yu9DxzY2ZkPsum3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1II0mx3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1II0mx3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-340c680fe8cso3855267a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Nov 2025 06:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762351550; x=1762956350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWeiWrMKd9Z/TbiJerx/2iuu0esuEkNLSPAotvZVuJU=;
        b=N1II0mx3UO5QRI1HRHGwpAG0GqK+DU8h1LTbPkMHd/MRhxeT7Plza+S9ENxHjda48V
         IoCL1re7tj840r2k/9D8mhvXKWNzObgTJDiDLaGeHAZY5KXJi7szoSJPICf5Y9EOrt/g
         YW/wb2X2CNRERImRUz+FBRklVgfRpxaAFZbvYpaLCvAgBKuIdGzE9kHybkfEkjL2SQtI
         WLdTf/FBkNW9W9ANURHK2hPRVTNUZZ5kYZnwttLm0fFJDOp9qIZS4JtMP5UUpny0/PZJ
         XoemwLY3nRaCY619w+uUTMJHLky/PTCMx/8jWJQfZ1BAszjfGQn0sTBOU6DWefar5CLd
         B4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762351550; x=1762956350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWeiWrMKd9Z/TbiJerx/2iuu0esuEkNLSPAotvZVuJU=;
        b=NXW5xGwdbSmkUNRyvW8CB7d83WhwvJ5ZZWt946KL34a4Ar49BxcpoQiz6QKW1MtkYt
         C6zRxa//Sj+2wNr7SXRQMZVishYUFX39PzMf3hHtL/n3nITLV+1St9ry2rh7ZnsNW9Rx
         u2BEp7L8+sAZzTP/nQY/2DY2K9Yjeyw6LHsk7XDSVgomIweXt4gFVeuFo2aAqKytZh6R
         nySxNX4eNzyPg31SMzz+oTVAArzn3jYKS/DJ+3JMK7c3kaspMKcrRqsbjoyaliZXsz4F
         f/bGqf4tPKQ9zHw7E6X7Vhkf5vC6oGyY8Ii2zI6W9ingc/jOyYRyXGuCYderN4zrOnpM
         MSSQ==
X-Gm-Message-State: AOJu0YyWJn42p2og1iBbw1l19JGgtsEXCYRWInN8Mw+8k0Z/LC95P1ye
	IqX9cCGLWj+5X+1LPYpTxm4k8DhCEt+SxGQo5lfHYSUb+LjbtyqGtVL0
X-Gm-Gg: ASbGncsOdPdMY16D2s/rZPsd86JWTUGtLMh8S3J3JmOTmbTx95sBTuVsGQljuC945cg
	mXuf7Z4p39klnLiopX0kvChgqPYwv21oG5xUrpQF7uNEOUFby1k6tL4tyHF34hXQjiAg2lhgDTn
	p44O3oFgb6U6/zBt5BxWzfleFfHs2YxQkHt71jMjvej2QTUGD/3gQ/aJSVRKFzc0GcTOgh7G6nV
	FhuUSAbxSNizMAjm+sPs4UswRyGRQf5qZ+nYiO18YZFPhfFEmBBDFVv7NyZzvX4aHPZwz7HE16i
	gKszEgma5J+VipV3UQapAa5eQ+PQEdfuI7FMGZP69kdf2+knyDYEnHlsrYBYqeqB+uRd/6MEq+C
	VNmvqHyFhKx95cKpjhT9KsbqWvE16f12m1UMR1grlGyppf3m9N2qf/ZTNci1tXFNHEOPHRiMw0t
	Ro0Xv6U+3L3o1s0qk=
X-Google-Smtp-Source: AGHT+IFeBlsmW8JHlbv/gntunQn7tZUm1UTAg8HQ88lVmC8OALHy9ZPLKjl5dXN7UsVJ8ikCAg+yuw==
X-Received: by 2002:a17:90b:3843:b0:340:ad5e:ca with SMTP id 98e67ed59e1d1-341a6c5e511mr4428905a91.12.1762351550331;
        Wed, 05 Nov 2025 06:05:50 -0800 (PST)
Received: from clint-Latitude-7390.. ([110.226.182.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f1a19f60sm5772433a12.3.2025.11.05.06.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:05:49 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH] hangcheck-timer: use pr_crit and fix coding style
Date: Wed,  5 Nov 2025 19:35:41 +0530
Message-Id: <20251105140541.9658-1-clintbgeorge@gmail.com>
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

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---

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

