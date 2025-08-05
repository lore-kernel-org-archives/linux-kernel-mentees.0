Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8310017E0
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  5 Aug 2025 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754408860; cv=none; b=WGawNlsrdxz/9Zjj3jdGdMe0+tesRj+IOxJL83sTqo9NjV94aFJswPunILJV2HLTaximupkGAc3qvFloKiLEM/LIeznEucxJNOIcJ8tXTiT6N2Z7VCNbIMMvbhAQKbuqs++6wTtjZWgsdTd1VoA3OLpJAcbquvc+A7qbYfZx2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754408860; c=relaxed/simple;
	bh=r1ZNtVzkV46tgwYdkFFJqca2KpFO/4Xqj8AgnYiL/ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehc7IxN6RaViJOaFJXm0XPRKfKsHW+p60Vb+UwgX3HmgTfYyOl661zdjsRgaCc+A1Cpfk3n5ZqjflK/i43V+vP8rElNCC5yUUdHffKvdtx2sY69wojOJj6dQ2G+6uf8y83mnZdNfjKh1dOfNOjOl8tgt+3CHu4Rc9p1s6DAQy70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfPTCFRV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfPTCFRV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2400f746440so44654615ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 05 Aug 2025 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754408858; x=1755013658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBa/zrBHVKKChl/K3snAlz7daAzVsSWKAZ9bPTQlz2g=;
        b=DfPTCFRV/fa8rVILAQIORwQAhKWf/WHKCrlEQ3tVsLY4n94BGwv4k+rQkauePZQCkV
         JvOnUbard1pjRRBS0m6GHOhWA3PAeHDvptDauANH5+k+cO7mHNfo2QFgv/vqRLd09iOD
         eD0LYAit0sjLGamnDpqCsrCQT355wIiqCengIYj542bu3mCrfZXn/CDSUe/p8Jj/5sMy
         n2KA7w8PCrdmkOq0DkWJE2Zqw4nvHc0ktQX/J3J1BFU8SYC24MsD0xq0lT641VxwvRCa
         /htwSM150uvmetZscNQGtJ5yaf92t+ZaNtEUJDRuDloxKGJp6T30qQfLjQGsdoDgNVSq
         M5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754408858; x=1755013658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBa/zrBHVKKChl/K3snAlz7daAzVsSWKAZ9bPTQlz2g=;
        b=abHRExS2G1JyDEDWey0yjUxcao1x23CbVUj6fnmcdbUnt6+5I4/7jIDlVep7dyyGOC
         vNI53YolLG9YtaTWbwXH59QMqySUHN+62kWbeDIoVT6M0v3hyzM/6ATVx70tq6bQRX27
         rJOgsI11meMsPx+P1yqzvsL1nQXLRucyMbkrdfpHOyZUc9VoZtUnmStsh+4dD7qc07bL
         JPL5Tnbw3A/dgg+9kU88LJ8Z9/OF09mrm1pQlJscShLFBDRyBRc5WYANfdl9dmb8U8p9
         6Ndai7Qx51PsXbkDcF7s4KVBKO1Lofhwh7StEETm++8/f/GdMBOIydGNc+ICcs4VAs/G
         /f4w==
X-Forwarded-Encrypted: i=1; AJvYcCUc3gFgMMBawAvATyhhiCA5xtj8ZFW5eKIcUrS7iFDGj5SnTtnWTgO00JOG8IG69bMYShekJMiPv2bj0l8ggDiW93xtsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+IzKM+KZv7n/gNNw9SLbbKAxvd7QsPWM0mVG9eEUVGh5Gt6DT
	YP8Jx8jG461LScRxdyB1EqyrnRwywL59w5K3NCnlVHqgiG5ksb9ENGtJ
X-Gm-Gg: ASbGnctjhOQUmjAwQ/tC3sdYKHkVQMwL6yjazQrTNvN7RZIP4fihqKK8+SSKGHj02gX
	/HuJ9VtzF/TYBE7BwcaWinf8D3YhIOdNkMzv1LiFV7zkQ/X2pvjGob4eDIkImQEhx55uAh3ilfh
	QbEpStqnp5wZGlM8iUhBCPyl+mH1/w1IhQMwzABjtNND1xR9IhESX31H4MNRI6a1dQvqmQCqyiD
	/jEwO2wKRD+ORhNz8etWHvPqyE0jJVfhykTl4tw7aPdreesKfEUFt+cAiMYUsBD+9DebLERvGVM
	zwoSyTXZJKY/caKHvG9xDRvwvzAZQq8D7zLrtA3+QrB0ifH8qAcdScpSHe7kniSGG8RFP9VyzIk
	LkBcBO4WTM3TQ35T0Secj9zNUtt3swlTaGd3vcb8ZRA==
X-Google-Smtp-Source: AGHT+IGRqosIMPxw9Sw/5Tt3m1euRzAovlSm4EaACj5l52jRzWo9lWCHslnHwghgGcTZRJAIc10QiQ==
X-Received: by 2002:a17:902:f652:b0:240:8cec:4823 with SMTP id d9443c01a7336-2424703a024mr201403575ad.41.1754408857698;
        Tue, 05 Aug 2025 08:47:37 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c31:41da:bdc2:5f7d:c803:6cd1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aa9055sm138305345ad.150.2025.08.05.08.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:47:37 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	peterz@infradead.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	linux-kernel@vger.kernel.org
Cc: jann@thejh.net,
	keescook@chromium.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH v3] futex: don't leak robust_list pointer on exec race
Date: Tue,  5 Aug 2025 21:17:25 +0530
Message-ID: <20250805154725.22031-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sys_get_robust_list() and compat_get_robust_list() use
ptrace_may_access() to check if the calling task is allowed to access
another task's robust_list pointer. This check is racy against a
concurrent exec() in the target process.

During exec(), a task may transition from a non-privileged binary to a
privileged one (e.g., setuid binary) and its credentials/memory mappings
may change. If get_robust_list() performs ptrace_may_access() before
this transition, it may erroneously allow access to sensitive information
after the target becomes privileged.

A racy access allows an attacker to exploit a window
during which ptrace_may_access() passes before a target process
transitions to a privileged state via exec().

For example, consider a non-privileged task T that is about to execute a
setuid-root binary. An attacker task A calls get_robust_list(T) while T
is still unprivileged. Since ptrace_may_access() checks permissions
based on current credentials, it succeeds. However, if T begins exec
immediately afterwards, it becomes privileged and may change its memory
mappings. Because get_robust_list() proceeds to access T->robust_list
without synchronizing with exec() it may read user-space pointers from a
now-privileged process.

This violates the intended post-exec access restrictions and could
expose sensitive memory addresses or be used as a primitive in a larger
exploit chain. Consequently, the race can lead to unauthorized
disclosure of information across privilege boundaries and poses a
potential security risk.

Take a read lock on signal->exec_update_lock prior to invoking
ptrace_may_access() and accessing the robust_list/compat_robust_list.
This ensures that the target task's exec state remains stable during the
check, allowing for consistent and synchronized validation of
credentials.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Suggested-by: Jann Horn <jann@thejh.net>
Link: https://lore.kernel.org/linux-fsdevel/1477863998-3298-5-git-send-email-jann@thejh.net/
Link: https://github.com/KSPP/linux/issues/119
---
changed in v3:
- replaced RCU with scoped_guard(rcu)
- corrected error return type cast
- added IS_ENABLED(CONFIG_COMPAT) for ensuring compatability
- removed stray newlines and unnecessary line breaks
changed in v2:
- improved changelog
- helper function for common part of compat and native syscalls

 kernel/futex/syscalls.c | 102 ++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 50 deletions(-)

diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
index 4b6da9116aa6..c342c16d6d00 100644
--- a/kernel/futex/syscalls.c
+++ b/kernel/futex/syscalls.c
@@ -39,6 +39,52 @@ SYSCALL_DEFINE2(set_robust_list, struct robust_list_head __user *, head,
 	return 0;
 }
 
+static void __user *get_robust_list_common(int pid, bool compat)
+{
+	struct task_struct *p;
+	void __user *head;
+	unsigned long ret;
+
+	p = current;
+
+	scoped_guard(rcu) {
+		if (pid) {
+			p = find_task_by_vpid(pid);
+			if (!p)
+				return (void __user *)ERR_PTR(-ESRCH);
+		}
+		get_task_struct(p);
+	}
+
+	/*
+	 * Hold exec_update_lock to serialize with concurrent exec()
+	 * so ptrace_may_access() is checked against stable credentials
+	 */
+	ret = down_read_killable(&p->signal->exec_update_lock);
+	if (ret)
+		goto err_put;
+
+	ret = -EPERM;
+	if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
+		goto err_unlock;
+
+	if (IS_ENABLED(CONFIG_COMPAT) && compat)
+		head = p->compat_robust_list;
+	else
+		head = p->robust_list;
+
+	up_read(&p->signal->exec_update_lock);
+	put_task_struct(p);
+
+	return head;
+
+err_unlock:
+	up_read(&p->signal->exec_update_lock);
+err_put:
+	put_task_struct(p);
+	return (void __user *)ERR_PTR(ret);
+}
+
 /**
  * sys_get_robust_list() - Get the robust-futex list head of a task
  * @pid:	pid of the process [zero for current task]
@@ -49,36 +95,14 @@ SYSCALL_DEFINE3(get_robust_list, int, pid,
 		struct robust_list_head __user * __user *, head_ptr,
 		size_t __user *, len_ptr)
 {
-	struct robust_list_head __user *head;
-	unsigned long ret;
-	struct task_struct *p;
+	struct robust_list_head __user *head = get_robust_list_common(pid, false);
 
-	rcu_read_lock();
-
-	ret = -ESRCH;
-	if (!pid)
-		p = current;
-	else {
-		p = find_task_by_vpid(pid);
-		if (!p)
-			goto err_unlock;
-	}
-
-	ret = -EPERM;
-	if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
-		goto err_unlock;
-
-	head = p->robust_list;
-	rcu_read_unlock();
+	if (IS_ERR(head))
+		return PTR_ERR(head);
 
 	if (put_user(sizeof(*head), len_ptr))
 		return -EFAULT;
 	return put_user(head, head_ptr);
-
-err_unlock:
-	rcu_read_unlock();
-
-	return ret;
 }
 
 long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
@@ -455,36 +479,14 @@ COMPAT_SYSCALL_DEFINE3(get_robust_list, int, pid,
 			compat_uptr_t __user *, head_ptr,
 			compat_size_t __user *, len_ptr)
 {
-	struct compat_robust_list_head __user *head;
-	unsigned long ret;
-	struct task_struct *p;
+	struct compat_robust_list_head __user *head = get_robust_list_common(pid, true);
 
-	rcu_read_lock();
-
-	ret = -ESRCH;
-	if (!pid)
-		p = current;
-	else {
-		p = find_task_by_vpid(pid);
-		if (!p)
-			goto err_unlock;
-	}
-
-	ret = -EPERM;
-	if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
-		goto err_unlock;
-
-	head = p->compat_robust_list;
-	rcu_read_unlock();
+	if (IS_ERR(head))
+		return PTR_ERR(head);
 
 	if (put_user(sizeof(*head), len_ptr))
 		return -EFAULT;
 	return put_user(ptr_to_compat(head), head_ptr);
-
-err_unlock:
-	rcu_read_unlock();
-
-	return ret;
 }
 #endif /* CONFIG_COMPAT */
 
-- 
2.49.0

