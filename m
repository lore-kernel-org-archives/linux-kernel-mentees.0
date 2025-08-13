Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E32E3703
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755070937; cv=none; b=iaB6+I8wU82N5Gzw+OmHGaIJM249CZw298P/8+QJPq8C76VdnyaJKVkqCiqe6BqkmUMH58NYlK/W4iUoRiRtbwlHdxhrKm5eBDhcHGgIIvpeLc+ANHYe/iRXCCvLNovjkPmHOPhSAbzPo6x3Y6T6aKFjEj+mzT6Xhn085uUpQvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755070937; c=relaxed/simple;
	bh=jNrPDQvQa2z4vNt3ufQEDRvtq+3fqOqeCCF0Oy37Po8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tSR5Qe/kpbujNGfzrFVK7qw7hPkhRNReAIPNMC17R9bZy7n+Gi6ONJTr+92Bh3OLTTyWDNW6j8uX1hYP84/NnuHPhOLiNLsYyKgPvQuORecN8t8IRQeowRwZotiyyqMohDHFVNx0Fz9jMtJ0XFtypiFkJgFRvTCN6C3ZdMFisyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6JyYEaU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6JyYEaU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76b6422756fso8792488b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 00:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755070934; x=1755675734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CavdXOJmDoQ4WcQwQ9VbtE22m77hvVOEvRLARCsCyWk=;
        b=Y6JyYEaUxEhJm2Q/hcokuKhRb2HbIyEaQ8MKoB/LcQ6eGtTNNipurdmvpxYZObqO36
         GUf9rZQ0z9MPxuC5z/jDtS3dVDa3IYi3uZ6GxjefP+gPuH/FRidZfuozOrkCfm4rVzuc
         sHK2ltC0bOM1nNa6X8AMgfsV4QmmqrXpEjR1CyFd5lKase9GDN4+On9rcnHSacHRpXdm
         KUeh2IglCg7JXk0LKDySwtx2bI4pHmOLKw4ZHeLozGSYnP7GF9YX5sriqPwtSihos6hl
         WmpC5KaxKiu8ZSDsfa1wsTDxY20yQirZk5hEcYRU8LDEP9NGJA8cCUF679AyYNZ8fOCi
         BL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755070934; x=1755675734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CavdXOJmDoQ4WcQwQ9VbtE22m77hvVOEvRLARCsCyWk=;
        b=Mez/TM3jkndvpryMZLzzUi6IjU2BzOgXCky1CnM1ckSgR+8jIFZdDcOg2Rxf9ThIoB
         hIZ5fFohMqgX0IDpTZdIiDAzRn3HSeaidT2b6fY/Kbh064pBSncB6QUqU1TdVRuWMfbC
         saT8SOj5nzrOtiThWDIBlYFt0TDABoYSOCoYXnyNiPMp5AJUdJWOnPvlXLylNA5c0LRo
         HxxAVb29cE/XgBUzuSmpK+bx22n+kimhq/AxIDl5OmgiL+0kaB+52MubyHjUDfOp7Jke
         CNxfcLPSe5nJGCq2MWxuRzt5cWJEarxvZAZLk1Ap8+A1xbGvj6qMJDC3GRSycW8CNcjs
         rX+g==
X-Forwarded-Encrypted: i=1; AJvYcCU4zyWXm57fDh0uZSAvs3N092FOmENc48kzYHefzvoMNA7yjxFmgIBXFGZe79ksEX7T+8pQkq/6LUSQUNQFM7E7wwWPdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ft1i17cTq2yEwpHSfJgrTY+s1xPlQFReoo6cCW8SV/NrAX+O
	/iZd34RzFMMkrx9QGwRO6SMRCw6yV/IG0E6O7TK8hJ6aBHLPHDCtQIMJ
X-Gm-Gg: ASbGncsz+EgIPXxhFs+8DGGgtNMAxOgC5XEBriNfYH/FXjZKnRrSNV2hYRb8DhLSpaO
	dxrjnhr4lN8yRes3RE/0oM52xu8U/HqJAAgG7+OQrDr1euidMX0inaL0JBarZfn3Fv96hOBTa3+
	PJpD/dVEBPp2Ri5XtETiXgaNl8vdYmBAMoee29ZP4w6372C3b7X2g68nSwDIlIlmjQz9lW48KHQ
	StZ3PUqKf1LHbHOk0J3Cb6cTlv5nBzafnKNmJh9z/uziRQdcZDJoA+HoZdBcEfEh3scoEvOi+Kv
	g/51JILo8ZW7KNQ671bg353es/ocNpQg9dCzdy8f4uvMDcB6FtEWivWoNRPwDTO0mOU9qg7jTWO
	dOJo7Ivv2vTIcTTyfsMa7Ji39pqqfyDbxWTiTlmxgqA==
X-Google-Smtp-Source: AGHT+IEhXNLhtUUwKSRp3Vr5YDOo/ZWfk9UUDwj9HJead4EPelMA7p/o0JPy4Z3dFA1LWs8XaMo84Q==
X-Received: by 2002:a05:6a21:3381:b0:23d:4777:49bd with SMTP id adf61e73a8af0-240a8b0cf5bmr3533433637.21.1755070934344;
        Wed, 13 Aug 2025 00:42:14 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:b9e1:95d4:9448:4c04:c914])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f474sm30819811b3a.4.2025.08.13.00.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:42:13 -0700 (PDT)
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
Subject: [PATCH v4] futex: don't leak robust_list pointer on exec race
Date: Wed, 13 Aug 2025 13:12:01 +0530
Message-ID: <20250813074201.6253-1-pranav.tyagi03@gmail.com>
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
changed in v4:
- added task_robust_list() function
changed in v3:
- replaced RCU with scoped_guard(rcu)
- corrected error return type cast
- added IS_ENABLED(CONFIG_COMPAT) for ensuring compatability
- removed stray newlines and unnecessary line breaks
changed in v2:
- improved changelog
- helper function for common part of compat and native syscalls

 kernel/futex/syscalls.c | 108 +++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 50 deletions(-)

diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
index 4b6da9116aa6..0da33abc2f17 100644
--- a/kernel/futex/syscalls.c
+++ b/kernel/futex/syscalls.c
@@ -39,6 +39,58 @@ SYSCALL_DEFINE2(set_robust_list, struct robust_list_head __user *, head,
 	return 0;
 }
 
+static inline void __user *task_robust_list(struct task_struct *p, bool compat)
+{
+#ifdef CONFIG_COMPAT
+	if (compat)
+		return p->compat_robust_list;
+#endif
+	return p->robust_list;
+}
+
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
+	head = task_robust_list(p, compat);
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
@@ -49,36 +101,14 @@ SYSCALL_DEFINE3(get_robust_list, int, pid,
 		struct robust_list_head __user * __user *, head_ptr,
 		size_t __user *, len_ptr)
 {
-	struct robust_list_head __user *head;
-	unsigned long ret;
-	struct task_struct *p;
-
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
+	struct robust_list_head __user *head = get_robust_list_common(pid, false);
 
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
@@ -455,36 +485,14 @@ COMPAT_SYSCALL_DEFINE3(get_robust_list, int, pid,
 			compat_uptr_t __user *, head_ptr,
 			compat_size_t __user *, len_ptr)
 {
-	struct compat_robust_list_head __user *head;
-	unsigned long ret;
-	struct task_struct *p;
-
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
+	struct compat_robust_list_head __user *head = get_robust_list_common(pid, true);
 
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

