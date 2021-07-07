Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EE6C07E96
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 02:36:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13F9161CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 02:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13F9161CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B34833CA;
	Wed,  7 Jul 2021 02:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7-Gpy36P5G9; Wed,  7 Jul 2021 02:36:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5B3538340C;
	Wed,  7 Jul 2021 02:36:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38CBDC0010;
	Wed,  7 Jul 2021 02:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08958C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 02:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF7E7605A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 02:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpRp2AllA8z5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 02:36:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49B98605B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 02:36:35 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id s18so714515pgg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Jul 2021 19:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6TB8onvnOdRzBhXcM0BQxnCfpEzao9xlhXPQShnXVkY=;
 b=g8aCcFIC4UnDaHpMFdQPMsUmGeXYoWo+7Lkht6pyNVOZdMraW2EjxneFt5ZgncJvi/
 QGmTYR58g7gFH9/ssjNR/v+fpEyf7QQL3zxlASkqwuKA9jGtXkRCzxmPyb4pKc9DZX9Y
 a+Uv5s5Ft8pxfQ1xP/pt8sAHaQ9ExEIhzSr1GSRWdoA046NSxFC5CPWGECl/JOUMRz66
 kYBd3+41pkT0HS1bhoV7JXyJYsA3jXjZD2MxpeVC79KY3/UlqhVkWDdcFVwIX31Cjqp6
 NVnd/Gg0pUzH36PoPhoIyCGGBdR8pJjJ6aQ7s9TGcLwKiCSzHvrHzcA0OzN3TP0E86bg
 +0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6TB8onvnOdRzBhXcM0BQxnCfpEzao9xlhXPQShnXVkY=;
 b=QfHry8ghSvzi5H4JsTNMJzOdMvvwR4LRPP50NCNhtNNJKAz/KLVl1j1e+RJJOzmOQ4
 249O8DDjeY88tGBPDFlS97/9doZVMeAG04xLWyRMlzJscNc29JI3ICqzsODqdu9S88kZ
 6sUDduEIk3T5eBkihFcZ1mnjTyKHUwyhrC0XKxRKdWGJMD+nw0EtLWMGP4BVeLHWpYN6
 LdqVaBY7+ifdvpT3p9wY2O4n07JYitqHwWrffpa+L8FmmCfUn0m8Ug8O15OS313OdCEu
 H1NP4u6PmEQHXxMTa93dhAFX8MYAZFIaD9tQ5RD31RrgPY6/tGKXDnClmsTKIz+1vsJJ
 Ec3g==
X-Gm-Message-State: AOAM5331BgJ1OAnGmhtyw7mxTFGkg4xsmN7kpN0qusUo5Sv6hkC+6QxW
 0YnX5dWLinFIgs0bjKtuIQY=
X-Google-Smtp-Source: ABdhPJz6kHl6mX2vacuql778ra9vfxn/94P2SoCpqLrH8HpAQ5Mv95lEbRrFEzJxmCKGvefAlgVxsQ==
X-Received: by 2002:a63:5616:: with SMTP id k22mr23821959pgb.211.1625625394789; 
 Tue, 06 Jul 2021 19:36:34 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id r14sm20589446pgm.28.2021.07.06.19.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:36:34 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: jlayton@kernel.org,
	bfields@fieldses.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v2 2/2] fcntl: fix potential deadlock for
 &fasync_struct.fa_lock
Date: Wed,  7 Jul 2021 10:35:48 +0800
Message-Id: <20210707023548.15872-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707023548.15872-1-desmondcheongzx@gmail.com>
References: <20210707023548.15872-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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

There is an existing lock hierarchy of
&dev->event_lock --> &fasync_struct.fa_lock --> &f->f_owner.lock
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

&dev->event_lock is HARDIRQ-safe, so interrupts have to be disabled
while grabbing &fasync_struct.fa_lock, otherwise we invert the lock
hierarchy. However, since kill_fasync which calls kill_fasync_rcu is
an exported symbol, it may not necessarily be called with interrupts
disabled.

As kill_fasync_rcu may be called with interrupts disabled (for
example, in the call chain above), we replace calls to
read_lock/read_unlock on &fasync_struct.fa_lock in kill_fasync_rcu
with read_lock_irqsave/read_unlock_irqrestore.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 fs/fcntl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index 262235e02c4b..fd9c895d704c 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -1008,13 +1008,14 @@ static void kill_fasync_rcu(struct fasync_struct *fa, int sig, int band)
 {
 	while (fa) {
 		struct fown_struct *fown;
+		unsigned long flags;
 
 		if (fa->magic != FASYNC_MAGIC) {
 			printk(KERN_ERR "kill_fasync: bad magic number in "
 			       "fasync_struct!\n");
 			return;
 		}
-		read_lock(&fa->fa_lock);
+		read_lock_irqsave(&fa->fa_lock, flags);
 		if (fa->fa_file) {
 			fown = &fa->fa_file->f_owner;
 			/* Don't send SIGURG to processes which have not set a
@@ -1023,7 +1024,7 @@ static void kill_fasync_rcu(struct fasync_struct *fa, int sig, int band)
 			if (!(sig == SIGURG && fown->signum == 0))
 				send_sigio(fown, fa->fa_fd, band);
 		}
-		read_unlock(&fa->fa_lock);
+		read_unlock_irqrestore(&fa->fa_lock, flags);
 		fa = rcu_dereference(fa->fa_next);
 	}
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
