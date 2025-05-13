Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315D18E1A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101302; cv=none; b=LERs4Eqe0ei00JdhCcbRFPC0hBv/3/Fl9qy7CswIDw2dM+qsFwz//UMEQuGuHm3TslfST6yL5Pvhl0/02oLEV6yVFD/jY9uzraVi76cTdADhsqZdZeTOBzNEq7v5Az7BPqp75i5tyXVcQdRWPd1V+Yed5uY6/3bcXSGqdaKDj3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101302; c=relaxed/simple;
	bh=Lzse6LpsfmjPCxHAw25TMkpoFLEQK6aNnxdLc61WhvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4lSKUs5sg4Ei87DpXGYe6/hYQRUP0iCt5E0lBq1Kz8ZWed2wwQUt9iGIeJMZyYXoa3USMs0rZ59UOsFkAaQWKw6gpLupLtIMNfDVmfeZmVfjSaRbX9X7Qr6H3w7leFfgv0B05mxywQb4j6tRlCBQkYYFnQwxJsvUL7zcMhR1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZYE2aTh; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZYE2aTh"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476ae781d21so61062721cf.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 12 May 2025 18:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747101299; x=1747706099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrmp34maV+5CJrub1fqE5o5oKE0u33rB5QJqF+9oIzo=;
        b=aZYE2aThmG5AnQWifTfaUyomvuKD+n/wNiYIsaMrvQY/m3CN4Sex3FbVO1y/nZAC/F
         z7Ruva+punlZTu7FYjBhd6Zk3Rf/ZrxSzfylu1XZ/9YDjWokpDS1nAXHtBUCGejah7+R
         qqL54rn03BzaU7ue4r6Lds+tcdqT+HF75yD8eRjvZ8cYPRSnbxJhI7ORLkK4jEbhr+ig
         I5i5vPOQ4ULXm4wosdgZ+pJx1jHIephwFsmdW69Xz866IBbTm8M54PpWOHN3iK7SNYy8
         JhKTBRHPIkN3FZSnZnTiBNU3sPu3AtbtqeWimQpwBBaHG5NqcZDxnp06CHW0S7UNoTpy
         TZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747101299; x=1747706099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrmp34maV+5CJrub1fqE5o5oKE0u33rB5QJqF+9oIzo=;
        b=YFj8UsmYfJG/a6izBKZqwFwZgsvAcaZ1J195m8vdOZel5ARc95tpF04+aCHVnsB1pL
         aBH+5iGxgVRU+SsJxRkzMVcPTPzilSfgl24/0jYroKMPgefAKb1eUYgrmzIfwTscIior
         tyxMua0KDAm54hODnk3tBBuP4DuQAUS9mfGIj6ScCjuUmoZ8tjDy2KcaTE+OT0NGKLi3
         orKHopT7OQw6srILpUipII3fm3ToDdriWnH8iONSlJhi2bGEgLIZBGlyZrD+8Ss9fzSK
         6tYMvqLBbyXM4Mq6mvMFBCGB8Fgdn2Yqh2JGhbFRmw0v/mlPChxJmAkIVnGlK2MFdnTq
         8EDA==
X-Forwarded-Encrypted: i=1; AJvYcCUmq7K0rkdnsrS3fuvRWABWKPgy4qq7ULZ0ts20/Wi4keTqgvIn4iTPSH5JrpNlo3rT5g/ohiFw7caiX5BRyu0EMtDT9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqcGXUqMAx97ZP4pl6Wg1i7yxZAE8K/Zf7WxtAO2P7Kf00IyiT
	/TknQ3MKAjfazXpimV0MmhBCAp+5r6r/hV4BhdKS0ocoANcHeSJT
X-Gm-Gg: ASbGncvuE8Sc4GqGGLnXTQ1JP6zTBzBuuudfX31VpkqIYxxy9CVKIe5ZEIHyUPiBpKr
	mVzOvJlCwAp4saqmqRbuLnSlj9dm1B/ZgiVutourkmcOItD7SN9M+cDKchWzeQ3BGUNzuj5XIB2
	SooAZ9BwjK8g4XQ1s8ejy4h1nWco67qKf9/tmvu4Tegy3efVjWA/Itfv05d7DFuUhjH1sR5Ncfn
	KlSQzNdIsd6s6t6yOPB2eX//AQeARUK7lTP3hgEZu6OamAlVsFftcLWlReWEPLmdDYx9eakd3Ht
	UHIpaFOiuVaxNuzyVCRP0aM9KKtL4IRE7n1Yq5P5qogLsGgToGk=
X-Google-Smtp-Source: AGHT+IHXujBhknGKYXu+3zqtXoBJw59paSUC9d1k4V/EEAXbsu/8/DE0TCswHmauBk+p0M1JMwzehg==
X-Received: by 2002:a05:6214:268e:b0:6e4:4194:df35 with SMTP id 6a1803df08f44-6f6e479573fmr268630366d6.9.1747101299450;
        Mon, 12 May 2025 18:54:59 -0700 (PDT)
Received: from iman-pc.home ([142.186.8.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a47311sm60064036d6.73.2025.05.12.18.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 18:54:58 -0700 (PDT)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] cpufreq: drop redundant cpus_read_lock() from store_local_boost()
Date: Mon, 12 May 2025 21:57:26 -0400
Message-ID: <20250513015726.1497-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep reports a possible circular locking dependency[1] when
cpu_hotplug_lock is acquired inside store_local_boost(), after
policy->rwsem has already been taken by store().

However, the boost update is strictly per-policy and does not
access shared state or iterate over all policies. Since policy->rwsem
is already held, this is enough to serialize against concurrent
topology changes for the current policy.

Remove the cpus_read_lock() to resolve the lockdep warning and
avoid unnecessary locking.

 [1]
 ======================================================
 WARNING: possible circular locking dependency detected
 6.15.0-rc6-debug-gb01fc4eca73c #1 Not tainted
 ------------------------------------------------------
 power-profiles-/588 is trying to acquire lock:
 ffffffffb3a7d910 (cpu_hotplug_lock){++++}-{0:0}, at: store_local_boost+0x56/0xd0

 but task is already holding lock:
 ffff8b6e5a12c380 (&policy->rwsem){++++}-{4:4}, at: store+0x37/0x90

 which lock already depends on the new lock.

 the existing dependency chain (in reverse order) is:

 -> #2 (&policy->rwsem){++++}-{4:4}:
        down_write+0x29/0xb0
        cpufreq_online+0x7e8/0xa40
        cpufreq_add_dev+0x82/0xa0
        subsys_interface_register+0x148/0x160
        cpufreq_register_driver+0x15d/0x260
        amd_pstate_register_driver+0x36/0x90
        amd_pstate_init+0x1e7/0x270
        do_one_initcall+0x68/0x2b0
        kernel_init_freeable+0x231/0x270
        kernel_init+0x15/0x130
        ret_from_fork+0x2c/0x50
        ret_from_fork_asm+0x11/0x20

 -> #1 (subsys mutex#3){+.+.}-{4:4}:
        __mutex_lock+0xc2/0x930
        subsys_interface_register+0x7f/0x160
        cpufreq_register_driver+0x15d/0x260
        amd_pstate_register_driver+0x36/0x90
        amd_pstate_init+0x1e7/0x270
        do_one_initcall+0x68/0x2b0
        kernel_init_freeable+0x231/0x270
        kernel_init+0x15/0x130
        ret_from_fork+0x2c/0x50
        ret_from_fork_asm+0x11/0x20

 -> #0 (cpu_hotplug_lock){++++}-{0:0}:
        __lock_acquire+0x10ed/0x1850
        lock_acquire.part.0+0x69/0x1b0
        cpus_read_lock+0x2a/0xc0
        store_local_boost+0x56/0xd0
        store+0x50/0x90
        kernfs_fop_write_iter+0x132/0x200
        vfs_write+0x2b3/0x590
        ksys_write+0x74/0xf0
        do_syscall_64+0xbb/0x1d0
        entry_SYSCALL_64_after_hwframe+0x56/0x5e

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
 drivers/cpufreq/cpufreq.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 731ecfc17..759dd178a 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -622,10 +622,7 @@ static ssize_t store_local_boost(struct cpufreq_policy *policy,
 	if (!policy->boost_supported)
 		return -EINVAL;
 
-	cpus_read_lock();
 	ret = policy_set_boost(policy, enable);
-	cpus_read_unlock();
-
 	if (!ret)
 		return count;
 
-- 
2.49.0

