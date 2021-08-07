Return-Path: <SRS0=6//p=M6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FEAC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Aug 2021 19:05:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C043061042
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Aug 2021 19:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C043061042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CDEB402EC;
	Sat,  7 Aug 2021 19:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BzxnEpZMa9TJ; Sat,  7 Aug 2021 19:05:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6E9EC402D1;
	Sat,  7 Aug 2021 19:05:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44E5CC001A;
	Sat,  7 Aug 2021 19:05:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D514C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Aug 2021 19:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 002D760586
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Aug 2021 19:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rJQKBwfEcSq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Aug 2021 19:05:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51A1A60640
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Aug 2021 19:05:19 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so18868475pjn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Aug 2021 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LDzr9j6jDQymvAZrQvh0mEZMgeOS0DQq/WzD3far9AM=;
 b=J2fkjjsuWNeHerOTcP8G/YG86fcP61VGCTe67t+htJCPDhbK4SpXkO8uXCozE3UU8z
 pZ/y/GDU1jdoV+vx3geGIb4nwo+yUe9S5Y+jlzxN46DUb/Wx9m/mqJ40h61hYUEnDWOG
 5rLAhFNVsOH0mrGF8/0ztqDQeMi3urRXLQsQokYzNDYs9FqkgAiELj/+zNRIYxXF0FRS
 x0Kb5rtMpUsegprUY0SWWuhBUA8IGwlzDYJdcPmZaBmf9uQq1MR+WXr5RplKS9EXhL+F
 gU0zvgOEE25YwjsjveGRNtktbH7RGCZd1L3BNYv4OsThvYQWNM4w5ZZnOoPUKj284dpy
 l9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LDzr9j6jDQymvAZrQvh0mEZMgeOS0DQq/WzD3far9AM=;
 b=QgpXdL0E1AUYVHrGkSpX64Nq3v8m+a50OeVrKpnD2bwY/xjkR9N/T+MJgj2c839ID3
 cU9xBwtk4i21pbUL4dUEJyYTAcOrEKbU/OttgAokleNloZkx2A5KLzdB44IcczT4Ij5f
 Arwh90uQd0CLew5rWzwsfefEsIpSa7b2ZnoeRsbrtuG+eODG93EAjYYGXB9wVfwVPHws
 0KBPv/bR1jNkbJKxv9btO/vTx39E6cdKx9SwWj5YU8AHzWSzIfrUV0zOPhv/0ioUljIu
 vvFQVPcq6PYFixmcaO41a8TA3ln88bHw89gJierAhvwjBpNhM5YB1bm10hb5377ciyHl
 alCw==
X-Gm-Message-State: AOAM5316mjLaDkdkal6zbpslcDta5efhUfj1tXC5FwY2Lb680NM5ninl
 FHdUIe90yf/CHJ8QCFBCpgY=
X-Google-Smtp-Source: ABdhPJwLpYFtek7YvpqTwxl/4Qq+Nuz2NdUl0gVBdSJPakAfLwkU4B3FHdFl7I8X6nr0bt8E4YLdHA==
X-Received: by 2002:a17:90a:ce05:: with SMTP id
 f5mr27351733pju.93.1628363118743; 
 Sat, 07 Aug 2021 12:05:18 -0700 (PDT)
Received: from localhost.localdomain (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id i13sm14859090pfr.79.2021.08.07.12.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 12:05:18 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Subject: [PATCH] tty: Fix data race between tiocsti() and flush_to_ldisc()
Date: Sun,  8 Aug 2021 03:05:13 +0800
Message-Id: <20210807190513.3810821-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

The ops->receive_buf() may be accessed concurrently from these two
functions.  If the driver flushes data to the line discipline
receive_buf() method while tiocsti() is using the ops->receive_buf(),
the data race will happen.

For example:
tty_ioctl                       |tty_ldisc_receive_buf
 ->tioctsi                      | ->tty_port_default_receive_buf
                                |  ->tty_ldisc_receive_buf
   ->hci_uart_tty_receive       |   ->hci_uart_tty_receive
    ->h4_recv                   |    ->h4_recv

In this case, the h4 receive buffer will be overwritten by the
latecomer, and it cause a memory leak.

Hence, change tioctsi() function to use the exclusive lock interface
from tty_buffer to avoid the data race.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
Reported-by: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com
---
 drivers/tty/tty_io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index e8532006e960..746fe13a2054 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2307,8 +2307,10 @@ static int tiocsti(struct tty_struct *tty, char __user *p)
 	ld = tty_ldisc_ref_wait(tty);
 	if (!ld)
 		return -EIO;
+	tty_buffer_lock_exclusive(tty->port);
 	if (ld->ops->receive_buf)
 		ld->ops->receive_buf(tty, &ch, &mbz, 1);
+	tty_buffer_unlock_exclusive(tty->port);
 	tty_ldisc_deref(ld);
 	return 0;
 }
--
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
