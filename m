Return-Path: <SRS0=WoZ7=NO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C745C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 00:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C92B61247
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 00:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C92B61247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF026070D;
	Mon, 23 Aug 2021 00:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUV_MU-ekj2z; Mon, 23 Aug 2021 00:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7D892606E6;
	Mon, 23 Aug 2021 00:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56486C001A;
	Mon, 23 Aug 2021 00:06:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F93FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 00:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3921280D46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 00:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITldMhKa4UKa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 00:06:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D608180D44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 00:06:48 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e1so2186986plt.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MACcnjEV3XfzLLGrs9YK33EN0PE/psaIlWJd2jzwxSU=;
 b=EKI/7FX1mTDvEBFaBdLEPJx6k7BSEGx0ZAktrsBRQjEOYXa/iZKeNnj/JxlYosrdUz
 5G5BKFjETXu+MCNwmMyuVDnLhvsnviCucwA7DKte6c1wRJwTpHUU55guBMpsLn6Qt0SW
 +M5T6ZTBHb/KBonCrJeho/M9aIir85mmW2gPgz81F5aYHF7mmrxa3pHf1mSpAq6bkvR3
 IfmNoet+vbJdcYYo+wasPQefBB2K8CN0Ca0kkXhxtE14P/cZ1DG1liXn5YXOc0znV1TD
 EmazPeoBxlEH8oQVqq+Zse2EY0zsmOF+kuFJanbIVNHqjkyAeZsa7+crvYetXlwWEuUU
 insA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MACcnjEV3XfzLLGrs9YK33EN0PE/psaIlWJd2jzwxSU=;
 b=jpEw3GwkYyf1zBrpFZOUOTmcBKt3gPhdGebDCkJJLipum3r9T3cUDN9Cfy2JE6kduB
 22eYHN36jpJHE65rWlCHBdY9CppRxlCJYa6VrmfUB/l0Ppr8YOo37EoNFkJJW3WFBrlt
 a/UU95i9OUcm1xuKkAmrUSDOnCPNEHRz0LOSqwvc3lc043JKCnk3LXeIImqQHhzrAn/p
 DEP9wtzNbLWRg8dYnFPiOqGvLzizjPM+aKXrA7gaOHeYwiUAVbc033d19JT842jVSWGg
 tCSGAbqk4q2RUyBSkMGv4U4HHBCa7XgISOfIutQNv3OsngEJzRNEvN4EY7fBW3BVThex
 gdHg==
X-Gm-Message-State: AOAM532s/FA9TFj0m+DlxOSPwbAfLKKoLd60air/QWrii9pNUvgD3IPq
 jpDXUjBhqZHbQ9CDxfjTw+g=
X-Google-Smtp-Source: ABdhPJyfnJ/2FrbLL41XFfGAjFZHY579ZnQ88qWqrJZlc3aqXXoFUvz4BjpaQdEErlJfZFEAqGJkoQ==
X-Received: by 2002:a17:902:d709:b0:130:6b05:be3e with SMTP id
 w9-20020a170902d70900b001306b05be3emr14368901ply.21.1629677208015; 
 Sun, 22 Aug 2021 17:06:48 -0700 (PDT)
Received: from localhost.localdomain (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id y14sm13408002pfi.82.2021.08.22.17.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 17:06:47 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Subject: [PATCH v2] tty: Fix data race between tiocsti() and flush_to_ldisc()
Date: Mon, 23 Aug 2021 08:06:41 +0800
Message-Id: <20210823000641.2082292-1-phind.uet@gmail.com>
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
receive_buf() method while tiocsti() is waiting for the
ops->receive_buf() to finish its work, the data race will happen.

For example:
tty_ioctl			|tty_ldisc_receive_buf
 ->tioctsi			| ->tty_port_default_receive_buf
				|  ->tty_ldisc_receive_buf
   ->hci_uart_tty_receive	|   ->hci_uart_tty_receive
    ->h4_recv                   |    ->h4_recv

In this case, the h4 receive buffer will be overwritten by the
latecomer, and we will lost the data.

Hence, change tioctsi() function to use the exclusive lock interface
from tty_buffer to avoid the data race.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
Reported-by: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com
---
V2:
	- Remove FIXME comment.

 drivers/tty/tty_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index e8532006e960..6616d4a0d41d 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2290,8 +2290,6 @@ static int tty_fasync(int fd, struct file *filp, int on)
  *	Locking:
  *		Called functions take tty_ldiscs_lock
  *		current->signal->tty check is safe without locks
- *
- *	FIXME: may race normal receive processing
  */

 static int tiocsti(struct tty_struct *tty, char __user *p)
@@ -2307,8 +2305,10 @@ static int tiocsti(struct tty_struct *tty, char __user *p)
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
