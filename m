Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FF4C07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 07:44:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7669961C17
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 07:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7669961C17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C47F607FE;
	Wed,  7 Jul 2021 07:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8CFuqGYUNy6; Wed,  7 Jul 2021 07:44:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2EE9260665;
	Wed,  7 Jul 2021 07:44:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 096A9C0010;
	Wed,  7 Jul 2021 07:44:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C4A8C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 07:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B6BF607FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 07:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0eJdegUVUV6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 07:44:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6766F60750
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 07:44:44 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so3161403pjl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Jul 2021 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mnaKooiXJs6zXYO5+MRv0r+1pvlB1aCOce0LmiWEYEQ=;
 b=gV9bJFmoma8pntKDpIj40dn6InHYTtTt98wAIjVmMtj+3PAZQVAghhOixxM87Xai/e
 xopDw7TLWc3rVWyJWXvWP652wWT2Z/y7yf3OLHtBGK+FRg/kih02RPBj3IdVnlMVhAPj
 yUu7ebtwsMQfAtATIYFIlUrzmgJOOouydyF7VGzLImEENlUbRsa1zuw5RdJflesOvHjh
 PlSdsJTvLDMf4yP3OyaI+oLbnhQBBsd1+W+ZqdFqhHz18MD7VC1SOdSynXMI+Hukpre4
 IyGTi50k/co14g7Sk620psXXd3gzNv6Gz03C4fXm3qLzishZxMYbpn1pREvq0WLtwuQ8
 1D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mnaKooiXJs6zXYO5+MRv0r+1pvlB1aCOce0LmiWEYEQ=;
 b=BTkFrPF0gx9q+XQbrwDzEyVcR83mAFPXy2wJSYdAg6SSkiSQTdnjGdahWJtD7kY1sa
 VVDvhETevocQQSH4Sb2MbQIoLg88vGXE+o/O+L9P7bPf+yB51VUpzCS0VsNw5Z/aD7Hz
 3uCMmp3ffZ4bcX/zq0KtxsUWXVF51Yf8UBBIDMhDRmHwoDJs/N4vYQL76BJWoOYzzTBq
 q7kPVyd4ppeqGOpAAIDJswukU4S1jQXYH81lZUVm+SSfYC4gPGvctoYtQOnxSOSCl1pr
 xkGd38OSTvJ08fD2mp+A7rKyEUrMcYdb5/loe2b2zcWBColqGb7XsVBHx3nmPYV4J+JW
 FF3Q==
X-Gm-Message-State: AOAM532hQcelX22X13rkijWAZcCWnjGuizlonbbsAZOvxZn8TM7nRnsd
 wKJUHs1aCasqV4vVDOIWiO0=
X-Google-Smtp-Source: ABdhPJzeDWM2Gk6BNldI1iz00CBhgRtOpmFH3MyLkzFrwILjwCiXlBgjkIPZNr1pkhd+RFIj13efWw==
X-Received: by 2002:a17:902:8c83:b029:129:17e5:a1cc with SMTP id
 t3-20020a1709028c83b029012917e5a1ccmr20378088plo.49.1625643883878; 
 Wed, 07 Jul 2021 00:44:43 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id x39sm12958519pfu.81.2021.07.07.00.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 00:44:43 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: jlayton@kernel.org,
	bfields@fieldses.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v3 1/2] fcntl: fix potential deadlocks for &fown_struct.lock
Date: Wed,  7 Jul 2021 15:44:00 +0800
Message-Id: <20210707074401.447952-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707074401.447952-1-desmondcheongzx@gmail.com>
References: <20210707074401.447952-1-desmondcheongzx@gmail.com>
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

Here read_lock_irq/read_unlock_irq are safe to use because the
functions f_getown_ex and f_getowner_uids are only called from
do_fcntl, and f_getown is only called from do_fnctl and
sock_ioctl. do_fnctl itself is only called from syscalls.

For sock_ioctl, the chain is
  compat_sock_ioctl():
    compat_sock_ioctl_trans():
      sock_ioctl()

Interrupts are not disabled on either path.

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
