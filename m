Return-Path: <SRS0=poiC=AU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A9CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jul 2020 05:20:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CEFF2053B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jul 2020 05:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rR8wMB0W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CEFF2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 20DEC87899;
	Thu,  9 Jul 2020 05:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anfl4SZ6IWpQ; Thu,  9 Jul 2020 05:20:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B569E87876;
	Thu,  9 Jul 2020 05:20:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8942EC077B;
	Thu,  9 Jul 2020 05:20:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28AF3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 05:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 24C6B88703
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 05:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NrOqsofw4lC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 05:20:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4E6928864D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 05:20:00 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id e3so427529qvo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 08 Jul 2020 22:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2ey5u0rQyusT9d/zc6U5JsDDVWxF+R85sT24kpAB5c=;
 b=rR8wMB0WbQzJVmK1fG6vrA9QgvikGKfYsQl+iy+CoUKQ+prDnqBeSkuG178FVewnNR
 n7PpgaXv02dMHyYy29chR5Ui46SVLx5QcQvAiSauy9uNwq9Tzt47WxTO3BVMOODMgwaL
 6MHRhl0+ZwymBPoWbQqUVhWwbqvIjmy86Et/RPKmPJ/ZSKZBZTT/KXXhnS+A6U4IDEfw
 INW6hYTuqzC+srHq80xDOjEV1TEzQbZ1QSWcY9DZzOLwcZzmJDfvKjHy5KbAP3Ll8FgO
 2aWwhwUq9duT2DQ7p5SbWR3qalA0C9DtOShUzl2J76jUBmG+sDac0gyA0cTw6Y45/Pm4
 yLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2ey5u0rQyusT9d/zc6U5JsDDVWxF+R85sT24kpAB5c=;
 b=mkmqZt23xK0aHyxSBLbCmtuKNRzNmSp8d+pnzh9tOaM/HP8QtRf3alSIGKFrSIjg5Z
 cLWqLZZCH1TMtMKZiZjOQtaPEfjs+BAF9XLgjBzIwmPFdeslKnwpmgr37+a2/W4uUHCN
 HQjqvN/dUtnDhJ+7+MLoa3v7EjMWoh7kmTiTHAJ1KymYM5bCylK/74smo/6M56El/Rfy
 S2Mi7QyeFHbkZ2Ht/KTqUemtm2envdrDjvQikXc99VuHmXYHOkLOvSrjzHbZzyIBnALI
 s3dKVf8sIq34DPKy245xzaX3+zLJHdElUTe0jLFAE8p2qPbckhklYaq1dwQx6ZAuBS9Q
 nRDg==
X-Gm-Message-State: AOAM531fBNy4ahvVQcM7XB2jNB2p68eBcWU/P6/4C2OI8dE4xteqUujd
 V1ZCJ0VPqasdeDN7Wn54EA==
X-Google-Smtp-Source: ABdhPJysCYkfIBcts8kENFrUYmdr3eXiSmrlK8fWILE44f0rLD8RRzITYv0N2MTnGAM7xAIdtT++8g==
X-Received: by 2002:a05:6214:4c4:: with SMTP id
 ck4mr59679790qvb.202.1594271999346; 
 Wed, 08 Jul 2020 22:19:59 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id p7sm2502952qki.61.2020.07.08.22.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 22:19:58 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Date: Thu,  9 Jul 2020 01:18:02 -0400
Message-Id: <20200709051802.185168-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>,
 linux-bluetooth@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] net/bluetooth: Fix
	slab-out-of-bounds read in hci_extended_inquiry_result_evt()
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

Check upon `num_rsp` is insufficient. A malformed event packet with a
large `num_rsp` number makes hci_extended_inquiry_result_evt() go out
of bounds. Fix it. Also, make `num_rsp` unsigned.

This patch fixes the following syzbot bug:

    https://syzkaller.appspot.com/bug?id=4bf11aa05c4ca51ce0df86e500fce486552dc8d2

Reported-by: syzbot+d8489a79b781849b9c46@syzkaller.appspotmail.com
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/bluetooth/hci_event.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 03a0759f2fc2..29aff5e7dec2 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4369,13 +4369,13 @@ static void hci_extended_inquiry_result_evt(struct hci_dev *hdev,
 					    struct sk_buff *skb)
 {
 	struct inquiry_data data;
-	struct extended_inquiry_info *info = (void *) (skb->data + 1);
-	int num_rsp = *((__u8 *) skb->data);
+	struct extended_inquiry_info *info = (void *)(skb->data + 1);
+	__u8 num_rsp = *((__u8 *)skb->data);
 	size_t eir_len;
 
 	BT_DBG("%s num_rsp %d", hdev->name, num_rsp);
 
-	if (!num_rsp)
+	if (!num_rsp || num_rsp * sizeof(*info) > skb->truesize)
 		return;
 
 	if (hci_dev_test_flag(hdev, HCI_PERIODIC_INQ))
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
