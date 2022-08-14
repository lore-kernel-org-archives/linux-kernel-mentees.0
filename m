Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FC9C25B0D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Aug 2022 01:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54CE840AB7;
	Sun, 14 Aug 2022 01:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54CE840AB7
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FnPMYv53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7PsWsKMXMN-1; Sun, 14 Aug 2022 01:55:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4016F4014A;
	Sun, 14 Aug 2022 01:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4016F4014A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B969C0033;
	Sun, 14 Aug 2022 01:55:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1BE8C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 01:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90C3682883
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 01:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C3682883
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FnPMYv53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJW6Phnkt-Wg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 01:55:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A4F82865
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1A4F82865
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 01:55:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e27so468951wra.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Aug 2022 18:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=TNitijqiLWD8N0q+QjMXs+eaMvvzYslxu1nXPHeU+Ic=;
 b=FnPMYv53dzLScK8FwJaJSD6pM5/QMCnzb8PSymP17lig+ulpqphrfTK2MAtdzAuNfA
 kLZiHwqJpmi2lIUCgXjQaJeg9pk/M5cWuP0qo4nR4zX8qJaIweMI+4l/yidgA73Uq0bk
 oVEJOEhFQ8fPaV3G1qk7zi0vzv+j/hWN/djRGHS10xXc4+WQvd0RGrJVXoggVnTwoQg7
 WHoVk0mzVGtaYYfs3K7jDLsL/hHqtS1VECCmz0RQlvdCzo5LCGg/1JgFw8iItP9mQaRY
 c5VMlFdOr21yzIMfIEsc/9OSi8WfBf7UN4GxOBuq+pZkGZmSpEpvvW7BHkQXdzzm3nDg
 kWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=TNitijqiLWD8N0q+QjMXs+eaMvvzYslxu1nXPHeU+Ic=;
 b=WGSq4bgnW2ICC4Hwt5ixSf+seVW4Oqk6XEQp7HzDPYXHxtr+LKPz06AJB/44+OjeSi
 Iqd23R1gE7Lq+5MMRyC3N72PRntwFjo9uF+MLMyX9q3NaXEBo+/kKBx/FM15mG5kLRIs
 eWmVeIzNRfFFC+Q7PhDGoyLbmKmx3Rv1bhW/ZhmkacWnj1vVjO2dysetxTIOtJ9UtWMK
 KTVVRKo2Dcrmi4a5zt9VglVpm/OJhNWjB8/9MfzW5hN35bB1RN6MRjbVhQAqH3+udcgm
 BUR/UTQuqVU7adkxBnMC0E1j0mqVeHbPGZnk5EZ3Y9XnkCdVbMxOWYnVto80s7gY0WDn
 XBaA==
X-Gm-Message-State: ACgBeo2//iyFbdSLmnlqhFo2WD81uIMb/UV9xBxtaXDFuy90nWv5jTNa
 nKZmHBh1bh39xPRVbAvlXKM=
X-Google-Smtp-Source: AA6agR4YBcFca/UDOlp8gjODh6JVGCJykTj6AJCW21OE2srC/zsZpZzUt9pGZd2DCjb887IpZnLr2Q==
X-Received: by 2002:a05:6000:381:b0:221:7542:61bb with SMTP id
 u1-20020a056000038100b00221754261bbmr5264691wrf.305.1660442133117; 
 Sat, 13 Aug 2022 18:55:33 -0700 (PDT)
Received: from localhost.localdomain ([84.255.184.228])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d5609000000b0021f1ec8776fsm3247558wrv.61.2022.08.13.18.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 18:55:32 -0700 (PDT)
From: Mazin Al Haddad <mazinalhaddad05@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2] tty: n_gsm: add sanity check for gsm->receive in
 gsm_receive_buf()
Date: Sun, 14 Aug 2022 04:52:12 +0300
Message-Id: <20220814015211.84180-1-mazinalhaddad05@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: daniel.starke@siemens.com, jirislaby@kernel.org, paskripkin@gmail.com,
 syzbot+e3563f0c94e188366dbb@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Mazin Al Haddad <mazinalhaddad05@gmail.com>
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

A null pointer dereference can happen when attempting to access the
"gsm->receive()" function in gsmld_receive_buf(). Currently, the code
assumes that gsm->recieve is only called after MUX activation.
Since the gsmld_receive_buf() function can be accessed without the need to
initialize the MUX, the gsm->receive() function will not be set and a
NULL pointer dereference will occur.

Fix this by avoiding the call to "gsm->receive()" in case the function is
not initialized by adding a sanity check.

Call Trace:
 <TASK>
 gsmld_receive_buf+0x1c2/0x2f0 drivers/tty/n_gsm.c:2861
 tiocsti drivers/tty/tty_io.c:2293 [inline]
 tty_ioctl+0xa75/0x15d0 drivers/tty/tty_io.c:2692
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Fixes: 01aecd917114 ("tty: n_gsm: fix tty registration before control channel open")
Link: https://syzkaller.appspot.com/bug?id=bdf035c61447f8c6e0e6920315d577cb5cc35ac5
Reported-and-tested-by: syzbot+e3563f0c94e188366dbb@syzkaller.appspotmail.com
Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
---
v1->v2:
- Change commit title and description, removing unneeded and 
unclear references to syzbot bug.
- Use a sanity check instead of reinitializing gsm->receive in
	gsmld_attach_gsm() 

 drivers/tty/n_gsm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index caa5c14ed57f..38688cb16c20 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -2858,7 +2858,8 @@ static void gsmld_receive_buf(struct tty_struct *tty, const unsigned char *cp,
 			flags = *fp++;
 		switch (flags) {
 		case TTY_NORMAL:
-			gsm->receive(gsm, *cp);
+			if (gsm->receive)
+				gsm->receive(gsm, *cp);
 			break;
 		case TTY_OVERRUN:
 		case TTY_BREAK:
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
