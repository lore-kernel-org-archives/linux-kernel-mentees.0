Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11D2566E3
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Apr 2025 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860639; cv=none; b=Awdx34aOOzWc4cPqJVor+u3QIAgq6O/TvbjdwTDgAXNXHWssOALNWoFOLo3/QMFAOO9TLlXZySxaWd5p8FcYKLuoRqguDDT/ehMXG451SxULY+PtyaneqwgNxdAs8bkuI9gZLtDrlVRjmJ4zQPa2Aymbhut6rcHu9REs6PS+YXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860639; c=relaxed/simple;
	bh=ODSgAxWbJBt9NdiXhOPCZyDcdalY9TFRVoBNWJq/xMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kv9VD+sXNY6/SiyhoaNG8kNwjbUrSifn3c8HQXaSQIIE3oF2vNjjBuyhdUni6mggXUl+d5XtTCk/cUkfmv50JpmGQNzwoNwehMnPqGBJLipI8gyndhJquNrPBXB/FyQTBTlnl7X1qRFnnVn7MJ8i+51noBLh9cNXlP0DcZBQ7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nU51zBf8; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nU51zBf8"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so60766926d6.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Apr 2025 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860634; x=1746465434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn0Gb6p8bTLHf/Q1ND9UVncX7fPuOHXSbUhkjcvlOJQ=;
        b=nU51zBf8xI2diEn/KPt4ktNyCk828kPlqiOorw/kkZ5y1NCi0g/Xg5bhVhqLDXalkc
         3RmTj2Y7ZKhh9QVPTBXWtdz0K2dHlc+L5FlwOo85QgWSs5NxYcf9AG+mlZ3uhVBIMcco
         OpTx5okgcvx5SkkLLX3NLxgKo93+XfDVvFVxudYspC5EWiEQxF1pSSRDUHekuSsSZYNl
         r5XxqASHUI9Z4TK5C5rB++S23rULC+imEtGNISUmAbK8Q4W4IEveiyzpzsns2Lt8cVQP
         ixXZfTEYo+B5iUDsyDaN8qk+fBaOtQPwvz5yp6QT0RDQlPsx3qEv+Kf3KeXdMc90YTbw
         qVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860634; x=1746465434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gn0Gb6p8bTLHf/Q1ND9UVncX7fPuOHXSbUhkjcvlOJQ=;
        b=NhpO69smiswTH0xRi0PAM0U4wt1Laleb4LyQe7TAau1ZDGD8dRvTBfSW8DZqgd0n3C
         FXkByfwc8X0+PfDSATX0oKnd2r99LWGXbnLKYlL/7g0oSQqRY2nwWORuYZlG3K+AFkcv
         BtEDpyWKUqwLKuv8FEnMOw8R5GOGWiyBCsO7VEuN8jX3RX/QXAivWfjQwv3+TNXRhomn
         9U1Eb0ThB3c4p1Cm0W2aNQ1rGj5TSgdrM2IfituoeNfomWM6ooe6TjcN9EeNYHTr+YRy
         fn7NnSzua8uknupnDS5pl7rvabPhJhWfZiheca6+BmdhZcbZ3joqLn/bhoYAyfx+M1AI
         uKkA==
X-Forwarded-Encrypted: i=1; AJvYcCUw5gn9yfDXlDXpt9yLagLF7F9j+Y4c4ly1U5iY58vbauA8nWzJ+bmdUUvE0BtcSDa+RrFgyP7JiDmBy20Rg6p6KUhLug==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaYMt+wFrUw77wTlkPqnI2BNNOvJ155GI9cyMrCe878lSQq/7m
	1Uv7DYmCFawY5Qgz8eNANWwRV2lvKPmUR4bWetD6m6RqBMa0ixED
X-Gm-Gg: ASbGncsq7NYcmYfVphp9YfQhtv1vODGXR88Ppex4QFyue7Aq5JQRrANga8nCEDfLORF
	PT+CAOY+IRXtAVh9pAJrhsab3nM06oGD7nVKF2lMWP5M2Dtj1cPKLEB2qVeluc7Qqyy5qFGFvLg
	1kgWD8N39FYMmYGHoE8Imd9NFYNrvXdNpOBJKD4Q/xW7tqBzazC6B/MnfXaIOmECWk4GjN9YywJ
	2cIQymIKlvvha/jN3KPOps4A9arZMXubIbP7I/QcTMoMJNDuHUIku5qchORcXXsJk0dYwwWABpV
	PglWhMJHEVcuU7hGrvOBh44kWXM5jdz4wOuh05Ekzw==
X-Google-Smtp-Source: AGHT+IGxcPjNvO81CcwtPm0A1nprONnmZO2K4FxXeiwb359ItwXBCQxRnIKtwjF3TweWhQTQycGohQ==
X-Received: by 2002:a05:6214:f21:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f4f1ba9885mr140276d6.15.1745860634332;
        Mon, 28 Apr 2025 10:17:14 -0700 (PDT)
Received: from iman-pc.home ([184.148.73.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0938399sm63268506d6.40.2025.04.28.10.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:17:13 -0700 (PDT)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH v2] cpufreq: fix locking order in store_local_boost to prevent deadlock
Date: Mon, 28 Apr 2025 13:19:31 -0400
Message-ID: <20250428171931.1850-1-ImanDevel@gmail.com>
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

Acquire cpu_hotplug_lock in the store() handler *only* for the
local_boost, before taking down_write(&policy->rwsem),
and remove the cpus_read_lock/unlock() calls inside the
store_local_boost().

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
Changes in v2:
 - Restrict cpu_hotplug_lock acquisition to only
   the local_boost attribute in store() handler.

Regards,
Seyediman

 drivers/cpufreq/cpufreq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index acf19b004..5464c8487 100644
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
@@ -1045,11 +1042,17 @@ static ssize_t store(struct kobject *kobj, struct attribute *attr,
 	if (!fattr->store)
 		return -EIO;
 
+	if (fattr == &local_boost)
+		cpus_read_lock();
+
 	down_write(&policy->rwsem);
 	if (likely(!policy_is_inactive(policy)))
 		ret = fattr->store(policy, buf, count);
 	up_write(&policy->rwsem);
 
+	if (fattr == &local_boost)
+		cpus_read_unlock();
+
 	return ret;
 }
 
-- 
2.49.0

