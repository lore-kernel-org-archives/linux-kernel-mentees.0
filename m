Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20059C11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 09:19:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF0061413
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 09:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF0061413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86DD84023D;
	Fri,  2 Jul 2021 09:19:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOKqgzxPdt7b; Fri,  2 Jul 2021 09:19:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 95FC74002B;
	Fri,  2 Jul 2021 09:19:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 817B0C0010;
	Fri,  2 Jul 2021 09:19:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCB07C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC20A60629
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfO8lJO9F5jX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:19:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0FA56061F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:19:06 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y4so8412987pfi.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Jul 2021 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dy1wiJWCUbzzuhF4ayH4yFxHIlEj9ymL/XTMpQPprYI=;
 b=E2z6L2MQkh9yQU2Fs2u0eB41ZEhaYkoYJVT2vk/82L6ktkv2YiXQU1B+OLq1j1cSJp
 7Ww8QzmuEWd2nFtDgUfLuhf6w87904MrcHcERagKgpHa8PcEvnZCtxQjV44ZrdY3UYgo
 1VNgnXN3WlqhJI8Wxk6u3Q0lJXTdyEB7DGrzVLFhZN18byWdg8WdIzc4N12s2EyZ/TLx
 sRHEaRRy+Ew6QP2BqEEgQ/C+VZOGQd0FOz5IvTfT5dgdCJ2hluBKXo6nutg1dz4b/vDE
 oL5z30yqwb2jGiearr/vfUdD+QxBf8WVuOoBd+PZgqC2oEAKnd7r3+fvhv/eMG5E6ki+
 Xy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dy1wiJWCUbzzuhF4ayH4yFxHIlEj9ymL/XTMpQPprYI=;
 b=bPSRR3dQEBNJf9JP7XR+q6HQwCbJpqmisGw9+VDC5wOiAejxdufsKFgt7P8vqOMJp2
 pVaE7oW/BiQ7my23/xNuTY7OkAxjl1i5YhpzPfgxE45UF6o8x7M4dz1H+kVnqURvQE/2
 BuCvwyIcp31MkcxO12xihjQ8U7hsQh00veTRWa/G0bHsAMSBQ4u2x+wijf6BeKaFSj2j
 A9V3V6sALAEeS6YT5aSmjCs91UTZ9dv0ldsqSiNt3mRiEmdjzRyGAIdrncFOIVPTv5II
 ki3Psl8kHAtO6R8vjhBJJF1e6nrpWGo9bGvjWb//l2WeBai+kSq2azQKxJoiovplmPfp
 3vhg==
X-Gm-Message-State: AOAM531KZjVrs2fso3FYGltaLkQ/OFWKytO4FaEANFfRI1S2XxZEfcby
 9Kd5dVo1YDRek8dgb97xPVA=
X-Google-Smtp-Source: ABdhPJyqkq1cqysNRGDWKIxi7V8bbsjUMVEe72P4kL57YqOA9/DfditjSH4QED/veTfo3SPL0kZ73A==
X-Received: by 2002:a63:1226:: with SMTP id h38mr4228823pgl.376.1625217546255; 
 Fri, 02 Jul 2021 02:19:06 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id y3sm3023918pga.72.2021.07.02.02.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:19:05 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: jlayton@kernel.org,
	bfields@fieldses.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 1/2] fcntl: fix potential deadlocks for &fown_struct.lock
Date: Fri,  2 Jul 2021 17:18:30 +0800
Message-Id: <20210702091831.615042-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702091831.615042-1-desmondcheongzx@gmail.com>
References: <20210702091831.615042-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Syzbot reports a potential deadlock in do_fcntl:

========================================================
WARNING: possible irq lock inversion dependency detected
5.12.0-syzkaller #0 Not tainted
--------------------------------------------------------
syz-executor132/8391 just changed the state of lock:
ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: f_getown_ex fs/fcntl.c:211 [inline]
ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: do_fcntl+0x8b4/0x1200 fs/fcntl.c:395
but this lock was taken by another, HARDIRQ-safe lock in the past:
 (&dev->event_lock){-...}-{2:2}

and interrupts could create inverse lock ordering between them.

other info that might help us debug this:
Chain exists of:
  &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock

 Possible interrupt unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&f->f_owner.lock);
                               local_irq_disable();
                               lock(&dev->event_lock);
                               lock(&new->fa_lock);
  <Interrupt>
    lock(&dev->event_lock);

 *** DEADLOCK ***

This happens because there is a lock hierarchy of
&dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
from the following call chain:

  input_inject_event():
    spin_lock_irqsave(&dev->event_lock,...);
    input_handle_event():
      input_pass_values():
        input_to_handler():
          evdev_events():
            evdev_pass_values():
              spin_lock(&client->buffer_lock);
              __pass_event():
                kill_fasync():
                  kill_fasync_rcu():
                    read_lock(&fa->fa_lock);
                    send_sigio():
                      read_lock_irqsave(&fown->lock,...);

However, since &dev->event_lock is HARDIRQ-safe, interrupts have to be
disabled while grabbing &f->f_owner.lock, otherwise we invert the lock
hierarchy.

Hence, we replace calls to read_lock/read_unlock on &f->f_owner.lock,
with read_lock_irq/read_unlock_irq.

Reported-and-tested-by: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 fs/fcntl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index dfc72f15be7f..cf9e81dfa615 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -150,7 +150,8 @@ void f_delown(struct file *filp)
 pid_t f_getown(struct file *filp)
 {
 	pid_t pid = 0;
-	read_lock(&filp->f_owner.lock);
+
+	read_lock_irq(&filp->f_owner.lock);
 	rcu_read_lock();
 	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type)) {
 		pid = pid_vnr(filp->f_owner.pid);
@@ -158,7 +159,7 @@ pid_t f_getown(struct file *filp)
 			pid = -pid;
 	}
 	rcu_read_unlock();
-	read_unlock(&filp->f_owner.lock);
+	read_unlock_irq(&filp->f_owner.lock);
 	return pid;
 }
 
@@ -208,7 +209,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
 	struct f_owner_ex owner = {};
 	int ret = 0;
 
-	read_lock(&filp->f_owner.lock);
+	read_lock_irq(&filp->f_owner.lock);
 	rcu_read_lock();
 	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type))
 		owner.pid = pid_vnr(filp->f_owner.pid);
@@ -231,7 +232,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
 		ret = -EINVAL;
 		break;
 	}
-	read_unlock(&filp->f_owner.lock);
+	read_unlock_irq(&filp->f_owner.lock);
 
 	if (!ret) {
 		ret = copy_to_user(owner_p, &owner, sizeof(owner));
@@ -249,10 +250,10 @@ static int f_getowner_uids(struct file *filp, unsigned long arg)
 	uid_t src[2];
 	int err;
 
-	read_lock(&filp->f_owner.lock);
+	read_lock_irq(&filp->f_owner.lock);
 	src[0] = from_kuid(user_ns, filp->f_owner.uid);
 	src[1] = from_kuid(user_ns, filp->f_owner.euid);
-	read_unlock(&filp->f_owner.lock);
+	read_unlock_irq(&filp->f_owner.lock);
 
 	err  = put_user(src[0], &dst[0]);
 	err |= put_user(src[1], &dst[1]);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
