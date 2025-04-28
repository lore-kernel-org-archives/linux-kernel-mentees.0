Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA166757F3
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Apr 2025 04:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745814704; cv=none; b=Fh7v8Xv8au0J988435r07VR9hh+VoVSEhk9c0SKdaMXlm/4jSwTCfpjMYkrBx+3/Pku/yfLrAymnAPDqay5SWCZe8k02JsT6kn6zNxGKlFAKPbU6sMaASiOMPADDHaeuy7FVict2r/A+yMsnQ3PPzzeA0Tq6OwPr9+W0zeL4FjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745814704; c=relaxed/simple;
	bh=pM9WdbxbCoq91JlbmnwpX9YXcTrYb3eoYNw64DwXYww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHjQcbJS8jlFDwGPbkcb1+UFvLiJWvq/1BRt3iY5Tdc1Xgsz+6EpFo1Wr8/UX/SRbNkXqVgZJMiT8EGSTrgdBjsQiTGIDYv6E0AfVGIDaG2/EbbaKVObtXGGpoR46WTaqVgwjCiklaQO1p7qsjysuTkqNb9Ty19nNBQNKU4DnKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVEJyWfG; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVEJyWfG"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476a304a8edso55693621cf.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Apr 2025 21:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745814701; x=1746419501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XK0ow2yQiTSwZKmXddEqpTiG/spDXu2r2XpbRTk02SA=;
        b=MVEJyWfGKH1tUI56mlY/90CeQ6diU8gRtU8axZYYBje9wkf461sinw09msqL17Woxq
         hbZVgdz8qbF7uicX4XOG8vMfX5g/SEws67kTkVdlLvbW57Yg1wsvTmWIdSbI6nBCAjyr
         HGge1osAHqb3FlESzM+6jksI1TNHN2eCE8kW+Bguc1BIx1xiLFHeH7huP4a9ZbNR9GXH
         p01sI82pyNeoMkDVD4SAE9tIUGwn5r38CGUtQb7sIGhZkE9RefUBj2RXTzKfDpv5MkX5
         GboLqT6Di+OdMoa9AefZjfXeRsa7GtUEGfu9MOC9vo9Y0dV1eHRZNUsiSJDcbtZo/yNS
         mZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745814701; x=1746419501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK0ow2yQiTSwZKmXddEqpTiG/spDXu2r2XpbRTk02SA=;
        b=sQLPL07ZHlwt0o/hHkolcYKi335y8DJreQuNiHVc53CNX7WRMpkZemyKIHJZGHPJgc
         /X1Sk90YaBE+drVg2lRNCr9994ZbPfs359Fm22OxxXAdABDwoAFrfPyfkL9iTNtbMhLY
         DEJ8ZoQtK+hgRmIi682argJbwmBzp6Om3/ySWmqIZQSQb3fpWAieVPP51TpK49byQWD/
         NeUR1nW8qUg2OnOnDUHpPyiRKqqkiDRR0/Bepm6iI60zY+aDS0FqpZBY65j2PwJibH0I
         Z/ARv5xaHzbszI53UUwafmG3x1NHrFY0Z1QFTmjxcxQz33W1pHJTGGuZu1J7X81Tdgwc
         q+fg==
X-Forwarded-Encrypted: i=1; AJvYcCXNBMDmcFmQxaUqFlo+5spuuv7x+raHtfg0QzS2hlrmlslApDP1dPSOybkUZOTn+Bb8GCa/LT30nxUX3nVYPOj7S4/gOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzebqdSaXSXEEYbeV4lwW8daz6LCPzV+0U4Xf9gMzh5UMDN0k7G
	5EGgF/EIpunfUAX/BzXdfVkTJ2HfLrH+BEfmLdg++PHbC/6H4D//
X-Gm-Gg: ASbGncuyZvibTfFBRR/oDNm724Ck5RIgO8oPfdJnciGWt3SL7jLkSk1gFqClaj7YVOi
	tJ3NbSdWGqJDTNm0Bl+bzhhICDXCgy2TpiW40QPg8qSGPRx2oicT1VAcXSW4mS9p2gkaNcBT/sA
	6SnMlLCfxmiPZ15usHy4t/xz2dPbuGHFYzWJQFLY93H+bVG3aIMaoFsV3VtMSRbUtbWJkLR6byt
	cbOArmlSd5lbWRJ0t3yOdxacktIGsQw+1xiu3gpZKjAq4/uzXRf6sfKLLPlna0aOe1CItej62hG
	sqpeagjrmfs7Zkf+BmZ1gTHEChcKBo4WVfkmRYO5PA==
X-Google-Smtp-Source: AGHT+IFWJ3tEaTBf+jH+bBPjUDfdcAyCfgL5UKGqFyabzfonE682xDuxsGBs/Igyhpbo6VaA+QjZLw==
X-Received: by 2002:a05:622a:1b8b:b0:476:8288:9558 with SMTP id d75a77b69052e-4801eadae2dmr165843211cf.46.1745814700658;
        Sun, 27 Apr 2025 21:31:40 -0700 (PDT)
Received: from iman-pc.home ([184.148.73.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9bd6c1cbsm62593661cf.0.2025.04.27.21.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 21:31:40 -0700 (PDT)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] cpufreq: fix locking order in store_local_boost to prevent deadlock
Date: Mon, 28 Apr 2025 00:33:56 -0400
Message-ID: <20250428043356.3169-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep reports a possible circular locking dependency[1] when
writing to /sys/devices/system/cpu/cpufreq/policyN/boost,
triggered by power-profiles-daemon at boot.

store_local_boost() acquires cpu_hotplug_lock *AFTER* policy->rwsem
has already been taken by the store() handler. However, the expected
locking hierarchy is to acquire cpu_hotplug_lock before policy->rwsem.
This inverted lock order creates a *theoretical* deadlock possibility.

Take cpu_hotplug_lock in the store() before down_write(&policy->rwsem),
and remove the internal cpus_read_lock/unlock pair
inside store_local_boost().

 [1]
 ======================================================
 WARNING: possible circular locking dependency detected
 6.15.0-rc3-debug #28 Not tainted
 ------------------------------------------------------
 power-profiles-/596 is trying to acquire lock:
 ffffffffb147e910 (cpu_hotplug_lock){++++}-{0:0}, at: store_local_boost+0x6a/0xd0

 but task is already holding lock:
 ffff9eaa48377b80 (&policy->rwsem){++++}-{4:4}, at: store+0x37/0x90

 which lock already depends on the new lock.

 the existing dependency chain (in reverse order) is:

 -> #2 (&policy->rwsem){++++}-{4:4}:
        down_write+0x29/0xb0
        cpufreq_online+0x841/0xa00
        cpufreq_add_dev+0x71/0x80
        subsys_interface_register+0x14b/0x170
        cpufreq_register_driver+0x154/0x250
        amd_pstate_register_driver+0x36/0x70
        amd_pstate_init+0x1e7/0x270
        do_one_initcall+0x67/0x2c0
        kernel_init_freeable+0x230/0x270
        kernel_init+0x15/0x130
        ret_from_fork+0x2c/0x50
        ret_from_fork_asm+0x11/0x20

 -> #1 (subsys mutex#3){+.+.}-{4:4}:
        __mutex_lock+0xc2/0x930
        subsys_interface_register+0x83/0x170
        cpufreq_register_driver+0x154/0x250
        amd_pstate_register_driver+0x36/0x70
        amd_pstate_init+0x1e7/0x270
        do_one_initcall+0x67/0x2c0
        kernel_init_freeable+0x230/0x270
        kernel_init+0x15/0x130
        ret_from_fork+0x2c/0x50
        ret_from_fork_asm+0x11/0x20

 -> #0 (cpu_hotplug_lock){++++}-{0:0}:
        __lock_acquire+0x1087/0x17e0
        lock_acquire.part.0+0x66/0x1b0
        cpus_read_lock+0x2a/0xc0
        store_local_boost+0x6a/0xd0
        store+0x50/0x90
        kernfs_fop_write_iter+0x135/0x200
        vfs_write+0x2ab/0x540
        ksys_write+0x6c/0xe0
        do_syscall_64+0xbb/0x1d0
        entry_SYSCALL_64_after_hwframe+0x56/0x5e

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
 drivers/cpufreq/cpufreq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index acf19b004..6e672dcba 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -653,10 +653,7 @@ static ssize_t store_local_boost(struct cpufreq_policy *policy,
 
 	policy->boost_enabled = enable;
 
-	cpus_read_lock();
 	ret = cpufreq_driver->set_boost(policy, enable);
-	cpus_read_unlock();
-
 	if (ret) {
 		policy->boost_enabled = !policy->boost_enabled;
 		return ret;
@@ -1045,10 +1042,12 @@ static ssize_t store(struct kobject *kobj, struct attribute *attr,
 	if (!fattr->store)
 		return -EIO;
 
+	cpus_read_lock();
 	down_write(&policy->rwsem);
 	if (likely(!policy_is_inactive(policy)))
 		ret = fattr->store(policy, buf, count);
 	up_write(&policy->rwsem);
+	cpus_read_unlock();
 
 	return ret;
 }
-- 
2.49.0

