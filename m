Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F19CC4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941C1223C7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQl2kssQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941C1223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 048C720532;
	Wed,  4 Nov 2020 06:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBK7Ba7pdZqw; Wed,  4 Nov 2020 06:47:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2F97120404;
	Wed,  4 Nov 2020 06:47:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 144B9C088B;
	Wed,  4 Nov 2020 06:47:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02ABCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE15187493
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJwoXdLFTlF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E09B18746C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:29 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id o3so15721573pgr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1l065BLgxWbxhplgeNpVsx8uBEVKvB/dIxgH9PkcSoY=;
 b=VQl2kssQL/MA4gCfSeHZLVdP/r3A7uu837GRvD5zvddRgqDdxBnMQTQFoq6e9CO0vW
 cHMbvrgrcW7axHSoSjMfQmKny+YF6wAJeyCpojWhlzWv0GFagFUVQ8c09D56NQhV0+8E
 3r80DFulSqTmM+hBOUImyWXu5PPXL3Ho6nTY0OG8cL+KGGNICd7dK2XuEou4a0w8SJvE
 Ax8Bn//3jgjJZ6+WBumalr/7pabCsetmwVfDzC+0ga0qvMnZ2QBeOLbuJlNtmrz69POX
 ktycWACXUUMLkczZIXeGneDCy0zVqoPcEsWBW1uuepMwULE9p5lIU0N2k7Fw/LzyADo8
 4qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1l065BLgxWbxhplgeNpVsx8uBEVKvB/dIxgH9PkcSoY=;
 b=GWM/dQB1tCXA+/WPl/LNm5uOcFRLP+xCXA4MHC1JGptZmq8eSX2numXYelaq8pF+7u
 uufcvP7DK5GixHB9wHQRHLus/vLRxvj4KcOkacEswk7H+UoCBaA2Fz+va/CfAPwBSqC4
 5UmZSwSTooXzVpWaz+98ziiW6NRqCPQd0I9OE6nPXgti/cWSAH/53xKdM+Kwi9CZ9gF3
 MVy6712u3pUAvu87Z71pt6wz5OgTJJy2OX68SPmtTqnTGJfnoaJtjv/gJwrogdCMmLYr
 gG8kZBZkaWmfIVb6hEqifBn5j/sqGUE6fuCiuPDg3W18wZhOSSwJ2RaLpG+OQB8WhJtu
 dUoQ==
X-Gm-Message-State: AOAM533dW6ue+W3sHVInD+2MarPQqrn6mbRbUxZaJPgahj/gCUnXRJZ0
 MO0kytGg5UfCkIf5ddTEgho=
X-Google-Smtp-Source: ABdhPJwRTaBboM6XKpBofRBwuq6f3rthm1CtkTdW9rvytiGCkEjVhU8h6//nXU/hjUWY/T2LcdqQdw==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr16241224pgr.335.1604472449308; 
 Tue, 03 Nov 2020 22:47:29 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:28 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:48 +0530
Message-Id: <20201104064703.15123-1-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/15] usb: serial: avoid using
	usb_control_msg() directly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

There are many usages of usb_control_msg() that can use the new wrapper
functions usb_contro_msg_send() & usb_control_msg_recv() for better
error checks on short reads and writes. Hence use them whenever possible
and avoid using usb_control_msg() directly.

Himadri Pandya (15):
  usb: serial: ark3116: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: belkin_sa: use usb_control_msg_send()
  usb: serial: ch314: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: cp210x: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: cypress_m8: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: f81232: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: f81534: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: ftdi_sio: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: io_edgeport: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: io_ti: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: ipaq: use usb_control_msg_send()
  usb: serial: ipw: use usb_control_msg_send()
  usb: serial: iuu_phoenix: use usb_control_msg_send()
  usb: serial: keyspan_pda: use usb_control_msg_recv() and
    usb_control_msg_send()
  usb: serial: kl5kusb105: use usb_control_msg_recv() and
    usb_control_msg_send()

 drivers/usb/serial/ark3116.c     |  29 +----
 drivers/usb/serial/belkin_sa.c   |  35 +++---
 drivers/usb/serial/ch341.c       |  45 +++-----
 drivers/usb/serial/cp210x.c      | 148 +++++++------------------
 drivers/usb/serial/cypress_m8.c  |  38 ++++---
 drivers/usb/serial/f81232.c      |  88 +++------------
 drivers/usb/serial/f81534.c      |  63 +++--------
 drivers/usb/serial/ftdi_sio.c    | 182 +++++++++++++------------------
 drivers/usb/serial/io_edgeport.c |  73 +++++--------
 drivers/usb/serial/io_ti.c       |  28 ++---
 drivers/usb/serial/ipaq.c        |   9 +-
 drivers/usb/serial/ipw.c         | 107 ++++++------------
 drivers/usb/serial/iuu_phoenix.c |   5 +-
 drivers/usb/serial/keyspan_pda.c | 172 ++++++++++++-----------------
 drivers/usb/serial/kl5kusb105.c  |  94 ++++++++--------
 15 files changed, 406 insertions(+), 710 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
