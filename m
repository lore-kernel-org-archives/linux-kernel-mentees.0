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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FD0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jul 2020 13:04:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090D82073A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jul 2020 13:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdQvfSnD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 090D82073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF64F86E07;
	Thu,  9 Jul 2020 13:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zb_dgsJUYDTM; Thu,  9 Jul 2020 13:04:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 781E386DD2;
	Thu,  9 Jul 2020 13:04:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 634A8C077B;
	Thu,  9 Jul 2020 13:04:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A840C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 13:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A412587E57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 13:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQ9snbKJIEvy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 13:04:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E320687EE0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 13:04:09 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id u12so1520215qth.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jul 2020 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGEwhK7+HOB5UDgh/+KiU6/EDHzIv+5VNqxy139wdGM=;
 b=sdQvfSnDRAJBUsy+ESk4398OyprIdU0M5hUcZa+PA922C/+M4v0Z9UQNrEC4+TYTfA
 tYneGiD04EOzzYC+Wkznu3Illuf9QZVpbClghcgrU7TSFQQyCuPQpLR/6axtrYtHm8nN
 LhQNtvhdmlwyLWO1ggwMrTITgwSXREje0yQ7kTRWIE0N7pr1c9LgHgsaetzb0pTI8cA1
 12xew+zGAloXiRL9HDVvy3Tn8A1y0+bpLIgG0SGtaA8Q89Zyosc3trGCo5iDVkGV3D49
 TQWx0H/rl1dGETXFQgt7j2/rY/bO/iPkk4a7Qv7syqb8RycQ7I7GRnsXSDomWmElG3Hf
 ditw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QGEwhK7+HOB5UDgh/+KiU6/EDHzIv+5VNqxy139wdGM=;
 b=idNLm0/tJSgkAg39XZ7MGNRIqMvkOuixT9+JbVmtZeoYXvaj3YqKOi5sbC5rBJVaE1
 lHUZS4U48NXpLE4o2HKCqlZlM2E5KJ2IiH7+HxwjxbaMcDxXJ6L2oaqNppf+ld88XntA
 IISTdmCuqb32MwTmjpioDXZzQSEyOWjsMpMRzjhCgrav6kHZMDNLhYTVs+b2gS2Tb7qq
 gmwJ9mSReN52VCdgB0GkfkSQjLD988fPIdAJ/PE57jh6RsD29YjGR0QivEH4uh1jj0F/
 EcbeeOAEEW135ozC75VAIlVlCu0vqlgiHENHrSBq/heOmo1Jcgle3yiM1Gj63jBmc2Sz
 Vjlw==
X-Gm-Message-State: AOAM530KFZYG7CGqfHHTH+ZqckgsZn8g+k42nGkeXM1NJKBmy2/5iHAw
 WkXiQI06kcoaUt3G8A6GjQ==
X-Google-Smtp-Source: ABdhPJw73GzxPHh95KuS+8iUpcn45BCe3CRu5/OTi7CJ2JO0fCvf4YVaQIXayVOeIH8DOPuKW38axQ==
X-Received: by 2002:ac8:47d0:: with SMTP id d16mr65906935qtr.349.1594299848927; 
 Thu, 09 Jul 2020 06:04:08 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id v62sm3882456qkb.81.2020.07.09.06.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 06:04:08 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Date: Thu,  9 Jul 2020 09:02:24 -0400
Message-Id: <20200709130224.214204-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709051802.185168-1-yepeilin.cs@gmail.com>
References: <20200709051802.185168-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>,
 linux-bluetooth@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] net/bluetooth: Fix
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
of bounds. Fix it.

This patch fixes the following syzbot bug:

    https://syzkaller.appspot.com/bug?id=4bf11aa05c4ca51ce0df86e500fce486552dc8d2

Reported-by: syzbot+d8489a79b781849b9c46@syzkaller.appspotmail.com
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Changes in v2:
    - Use `skb->len` instead of `skb->truesize` as the length limit.
    - Leave `num_rsp` as of type `int`.

 net/bluetooth/hci_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 03a0759f2fc2..91cb3707d20a 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4375,7 +4375,7 @@ static void hci_extended_inquiry_result_evt(struct hci_dev *hdev,
 
 	BT_DBG("%s num_rsp %d", hdev->name, num_rsp);
 
-	if (!num_rsp)
+	if (!num_rsp || skb->len < num_rsp * sizeof(*info))
 		return;
 
 	if (hci_dev_test_flag(hdev, HCI_PERIODIC_INQ))
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
