Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56DEC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 03:17:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 402D920706
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 03:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moDwNx4L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 402D920706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F22A920492;
	Mon,  2 Nov 2020 03:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QE7pBsPFYhuI; Mon,  2 Nov 2020 03:17:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D0BDC20116;
	Mon,  2 Nov 2020 03:17:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B99C1C0889;
	Mon,  2 Nov 2020 03:17:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40A2EC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 03:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 258FD86963
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 03:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aG3b+sL+e8wZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 03:17:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6684E86998
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 03:17:22 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n16so9553505pgv.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 19:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fwNRxDnv+UtvNXDA29/weyHf8Kk1GunaCJV8fEWqD00=;
 b=moDwNx4LCqS6nBHsZeSVmXTK7hi5PDEiX/2Ee5/gjcBkkr8ffzRYKmAzS/r94rU8jv
 wqlHqNRKB8TfixhOD9Y2hAFZUorR0jTtVSYmB7j9nwlr4fHz5skVdWqamOY6fImILhIi
 1i2g9iAvjHe261r6LvUli9CB6uxQsQMWTvzsikIiF3CTG42fZFIMXfcOjRdSwKaR2sIH
 aV0BfClvm24o8PIQsGPk4qhvOVsRByL8MWKTceTkyp2wTJ52YhNcZtXLXGaeESsyJJgI
 NlN2BKveQDh9wpwFtgbRgtrNF8HCh9LT4ok2un/jDeR3Znj3dvCnwHWyuUR8d/fqy7lu
 Dr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fwNRxDnv+UtvNXDA29/weyHf8Kk1GunaCJV8fEWqD00=;
 b=HQYA++QrBpgJqELal4bxnclKtvYrUEhSsmx+coLmj6ZpXdwLCrsWqWrX+2RJV5+e8o
 mV86fyx39plXntUg8RMiCuT4KJJsZb+RfdNZ1Z/GtutijRs81++5IYxR1y5WRssPxJmW
 SKxUpnvRW9tz6xojgKgEtHk6SjgwNhXndIeP3tQmF6Mu4XKgfRLIl+bUz3x8lU7Xyi55
 Yi6upOeO0sJr859ojBR+QVzY2eOQUAZGvsc+dYqUR1QrYQhKXCvKAdgu7x7Nvf1zerGk
 +u3J+0Lhpu3S0136mgTiw9KWu6maVT/uz71uHgIVWu5RjMekp1av/UNuwSAdqUuj330b
 1Rfg==
X-Gm-Message-State: AOAM533k72WOuV2Xp83DblMYL04eTXdJ4A4H2rxkkcVWdeYrlzxweTd0
 kqGOdDLDkSRjXWchE3r2swo=
X-Google-Smtp-Source: ABdhPJzu3S6EJ0BwebnAPDMGQJr3fjjOnF+/krfTEZHvdPjaYsImqQwJpQ6j3dDh4/g/frpjJgX90g==
X-Received: by 2002:a62:dd56:0:b029:155:8165:c6c2 with SMTP id
 w83-20020a62dd560000b02901558165c6c2mr19488885pff.3.1604287041702; 
 Sun, 01 Nov 2020 19:17:21 -0800 (PST)
Received: from localhost.localdomain ([49.207.221.93])
 by smtp.gmail.com with ESMTPSA id o22sm10997076pgb.83.2020.11.01.19.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 19:17:20 -0800 (PST)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon,  2 Nov 2020 08:43:26 +0530
Message-Id: <20201102031326.430048-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 syzbot+9bcb0c9409066696d3aa@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: can: prevent potential access
	of uninitialized value in canfd_rcv()
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

In canfd_rcv(), cfd->len is uninitialized when skb->len = 0, and this
uninitialized cfd->len is accessed nonetheless by pr_warn_once().

Fix this uninitialized variable access by checking cfd->len's validity
condition (cfd->len > CANFD_MAX_DLEN) separately after the skb->len's
condition is checked, and appropriately modify the log messages that
are generated as well.
In case either of the required conditions fail, the skb is freed and
NET_RX_DROP is returned, same as before.

Reported-by: syzbot+9bcb0c9409066696d3aa@syzkaller.appspotmail.com
Tested-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
This patch was locally tested using the reproducer and .config file 
generated by syzbot.

 net/can/af_can.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/net/can/af_can.c b/net/can/af_can.c
index ea29a6d97ef5..1b9f2e50f065 100644
--- a/net/can/af_can.c
+++ b/net/can/af_can.c
@@ -694,16 +694,25 @@ static int canfd_rcv(struct sk_buff *skb, struct net_device *dev,
 {
 	struct canfd_frame *cfd = (struct canfd_frame *)skb->data;
 
-	if (unlikely(dev->type != ARPHRD_CAN || skb->len != CANFD_MTU ||
-		     cfd->len > CANFD_MAX_DLEN)) {
-		pr_warn_once("PF_CAN: dropped non conform CAN FD skbuf: dev type %d, len %d, datalen %d\n",
+	if (unlikely(dev->type != ARPHRD_CAN || skb->len != CANFD_MTU)) {
+		pr_warn_once("PF_CAN: dropped non conform CAN FD skbuff: dev type %d, len %d\n",
+			     dev->type, skb->len);
+		goto free_skb;
+	}
+
+	// This check is made separately since cfd->len would be uninitialized if skb->len = 0.
+	else if (unlikely(cfd->len > CANFD_MAX_DLEN)) {
+		pr_warn_once("PF_CAN: dropped non conform CAN FD skbuff: dev type %d, len %d, datalen %d\n",
 			     dev->type, skb->len, cfd->len);
-		kfree_skb(skb);
-		return NET_RX_DROP;
+		goto free_skb;
 	}
 
 	can_receive(skb, dev);
 	return NET_RX_SUCCESS;
+
+free_skb:
+	kfree_skb(skb);
+	return NET_RX_DROP;
 }
 
 /* af_can protocol functions */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
