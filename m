Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEC4171AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+R/KcTE"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC7882169
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC7882169
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O+R/KcTE
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrufJ2qa1hdq
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 12 Nov 2023 19:31:09 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 38B6782168
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B6782168
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ca85ff26afso4159405ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 11:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699817468; x=1700422268; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzFJuUGfBUEtLSbesGkaOvhbrhz4J+HNV0n1NIbu48Q=;
        b=O+R/KcTEb4rklXKd5PkhZJ6m2Km8tvOsJeA6TOrzC3ifJZi88HcxOF0afTktOFXkTD
         Hv4Sd9WdPwR9gUvvFdDurvnDOAiA0IMRVEsW9kgW3r7/LgBXck9UNVgdqq7I1RnfxxX3
         Br+/XC+87ZcNv6VN0bv8wmiDTRgPbS19lv/jKEsI04p/J/t2p70qdpVYsZlT0re3IDyJ
         Fm8K6rPbBFv36MjzIz97TPOq002C9SmfDGl8lXpUPDZjO5B/QwQUkoRv9MnqW84ibPwU
         79IbIVN/V1ZV33MrVuxggtDsow4nr259GYs3wpGBVoM30+i8o7z8oK2+ZVRTUC8MAnqu
         JBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699817468; x=1700422268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzFJuUGfBUEtLSbesGkaOvhbrhz4J+HNV0n1NIbu48Q=;
        b=lWHAAfvAmJCmnQTzl+ZPpRQqSiZsEkl33Lh0OAWR88V9lSsASkUKRmeiS3PXo3P/1X
         4rG+uT+roS13ruXaAXvXTyRlgrdzAw7D1QqN71ro993QJ5+ZzXWIRaJF0gIVTxPebD8C
         XZUuLycKCs1AdBs4fQxT1wYJ6YgFnb3ihs+bw76Ynp2QqIP3mSsCTkIQd6xCc/Gyo5J4
         JFLZDHby1KuhW3saL07+sQ9HbSDwf+AVMyOlAhI0DRr4YE/HWaluv6QEy6wGKVJDPH8N
         JOY96GFgYFd/iaIz+kLVjpHK78GuXzbItESP9ASpCzlFz8U/n272I12eCvE5E7umf2i+
         Npkg==
X-Gm-Message-State: AOJu0Yx4YhnodaokDG/RuXE37kybhDX859AR4I5puXcjUWfmK6HjT1yt
	lx+WusLogl9CB+1lzM0zVAs=
X-Google-Smtp-Source: AGHT+IFulHMIU/Yyc0thfpPh6YGQSJusSRQr9V/spq+JErFJlqd3wqRSJ4GK7+x04tyMrw5ylrvONw==
X-Received: by 2002:a17:902:ecd2:b0:1cc:27fa:1fb7 with SMTP id a18-20020a170902ecd200b001cc27fa1fb7mr6714140plh.5.1699817468534;
        Sun, 12 Nov 2023 11:31:08 -0800 (PST)
Received: from abhinav.. ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001c465bedaccsm2860248pls.83.2023.11.12.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 11:31:08 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: akpm@linux-foundation.org,
	brauner@kernel.org,
	surenb@google.com,
	mst@redhat.com,
	michael.christie@oracle.com,
	mjguzik@gmail.com,
	mathieu.desnoyers@efficios.com,
	npiggin@gmail.com,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: [PATCH v4] Fixing directly deferencing a __rcu pointer warning
Date: Mon, 13 Nov 2023 01:00:55 +0530
Message-Id: <20231112193055.2072382-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202311031320.c3ebc782-oliver.sang@intel.com>
References: <202311031320.c3ebc782-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the sparse warning with this message 
"dereference of noderef expression" , in this context 
it means about directly dereferencing a pointer tagged 
with __rcu annotation.

Dereferencing the pointers tagged with __rcu directly should
always be avoided according to the docs. There is a rcu helper
function rcu_dereference(...) to use when dereferencing a __rcu
pointer inside rcu read side critical sections. This function
returns the non __rcu tagged pointer which can be dereferenced
just like a normal pointer.

I tested with `lockdep` enabled, with these config options
`CONFIG_PROVE_RCU` and `CONFIG_PROVE_LOCKING` enabled and it 
booted just fine. To confirm if lockdep was really enabled 
I found these paths inside the qemu virtual envirnoment.
/proc/lockdep
/proc/lockdep_chains
/proc/lockdep_stat
/proc/locks
/proc/lock_stats

I tested the above kernel using qemu with this command
qemu-system-x86_64 \
        -m 2G \
        -smp 2 \
        -kernel /home/abhinav/linux_work/linux/arch/x86/boot/bzImage \
        -append "console=ttyS0 root=/dev/sda earlyprintk=serial   net.ifnames=0" \
        -drive file=/home/abhinav/linux_work/boot_images/bullseye.img,format=raw \
        -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
        -net nic,model=e1000 \
        -enable-kvm \
        -nographic \
        -pidfile vm.pid \
        2>&1 | tee vm.log

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---

Link to original patch
 https://lore.kernel.org/all/20231025222811.855336-1-singhabhinav9051571833@gmail.com/

Change from original -> v2 :
 1. removed the null check before dereferencing the dereferenced rcu
    pointer at line 2372.
 2. added rcu_dereference(...) at line 2694

Changes from v2 -> v3
 1. added rcu_dereference(...) at line 2693

Changes from v3 -> v4
 1. added rcu_read_lock() and rcu_read_unlock() before and after
rcu_defereference() function to avoid race condition.

 kernel/fork.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 10917c3e1f03..bb049b611015 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2369,9 +2369,14 @@ __latent_entropy struct task_struct *copy_process(
 
 	retval = -EAGAIN;
 	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
-		if (p->real_cred->user != INIT_USER &&
-		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
+		rcu_read_lock();
+		if (rcu_dereference(p->real_cred)->user != INIT_USER &&
+		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN)) {
+			rcu_read_unlock();
 			goto bad_fork_cleanup_count;
+		} else {
+			rcu_read_unlock();
+		}
 	}
 	current->flags &= ~PF_NPROC_EXCEEDED;
 
@@ -2690,9 +2695,11 @@ __latent_entropy struct task_struct *copy_process(
 			 * tasklist_lock with adding child to the process tree
 			 * for propagate_has_child_subreaper optimization.
 			 */
-			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
-							 p->real_parent->signal->is_child_subreaper;
-			list_add_tail(&p->sibling, &p->real_parent->children);
+			rcu_read_lock();
+			p->signal->has_child_subreaper = rcu_dereference(p->real_parent)->signal->has_child_subreaper ||
+							rcu_dereference(p->real_parent)->signal->is_child_subreaper;
+			list_add_tail(&p->sibling, &rcu_dereference(p->real_parent)->children);
+			rcu_read_unlock();
 			list_add_tail_rcu(&p->tasks, &init_task.tasks);
 			attach_pid(p, PIDTYPE_TGID);
 			attach_pid(p, PIDTYPE_PGID);
-- 
2.39.2

