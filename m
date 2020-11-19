Return-Path: <SRS0=/60u=EZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E9FC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 19:11:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D311B208D5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 19:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9O64TUO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D311B208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4573D86BB3;
	Thu, 19 Nov 2020 19:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EBwiOezYiuK; Thu, 19 Nov 2020 19:11:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B08286BB2;
	Thu, 19 Nov 2020 19:11:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23701C1825;
	Thu, 19 Nov 2020 19:11:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8551FC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 19:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 73FC627428
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 19:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id itKGXPHDiERZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 19:11:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 7960A203D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 19:11:00 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y7so5381819pfq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 11:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ET473FpFp3FzmBYHYLYam48z0xHPg334N2d9XOKTrpI=;
 b=M9O64TUOsf61++A5YWBgorUTqsUhConEUSLgnhF2hmpRoMo9gbHMK0Y5lS02yWOQMn
 xrFztSbuLNQ+ucnJjCg73QRIECuWEG+UR2GOfVP2Mi+rJVZf9I83c8TB9KF9Mx0DCQIA
 S5xL24QjlB8rFTuwVcmUY0UFBOak89hVYYiTrzQTOcOr09VZvuHUqOPNvaTHx/uOSWzr
 y5ZKb595uyBSpRpNI0CZNInd4rqqkQmzLNBTRx/yGjwDlJzPes7Gmth90pGXMZKrnfRh
 FJxt8mxU95GAFuC0N0CG+/whmIcWoGZUPxlmWUy8+JWcC8kzHnkSMrOxTotefn/d24i1
 cF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ET473FpFp3FzmBYHYLYam48z0xHPg334N2d9XOKTrpI=;
 b=mGoblHW8IOe4U7N2C+HXAVy3Dev1RZTN6vZfS4S2SRZUXIt1W8m2AQ4yNcf3O4F05o
 bq9jwx0lsqH0dSB2364sP8Exd3+/a9wqNIOCcTos4AWEP/UJGmjYyi7p/kVDjA/DOVrE
 rlY5Y1GiwqEB9128BNtXma/shBAWLWdWwdlwvzWpEG2kUulo6hVczRsaS4E5A4NWlIrm
 VA6fV8GS3wVsNmbomc9H0mebzF5kjdFo9iUbFE5rVvS46UnCbPNgpVOzjPm5JadblgIg
 fBIPjGkqbPhBhvvX9TgfFQ6ZcMngMcNjHPIJqgvKS/RLfaXpPjGUn+j0KhoW4sXmyk6e
 gKvg==
X-Gm-Message-State: AOAM531dgM7aBDcUx18gOL8fVSRZWaFBbl6h+/Nskq3QqpS5c2U233O4
 +mY5qDM6uJl+b5mmEkY31N8=
X-Google-Smtp-Source: ABdhPJypWIrTZZnDbwimuxmJITaEMB9QJgxNpUGeZf5bAuv3w+zqFXccFDnDvw5F0qjTUHsJf5qQlQ==
X-Received: by 2002:aa7:8105:0:b029:18e:c8d9:2c24 with SMTP id
 b5-20020aa781050000b029018ec8d92c24mr10267432pfi.49.1605813059959; 
 Thu, 19 Nov 2020 11:10:59 -0800 (PST)
Received: from localhost.localdomain ([45.118.167.196])
 by smtp.googlemail.com with ESMTPSA id x3sm452245pjk.17.2020.11.19.11.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 11:10:58 -0800 (PST)
From: Anmol Karn <anmol.karan123@gmail.com>
To: ralf@linux-mips.org,
	davem@davemloft.net,
	kuba@kernel.org
Date: Fri, 20 Nov 2020 00:40:43 +0530
Message-Id: <20201119191043.28813-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115114448.GA40574@Thinkpad>
References: <20201115114448.GA40574@Thinkpad>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com, saeed@kernel.org,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v5 net] rose: Fix Null pointer
	dereference in rose_send_frame()
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

rose_send_frame() dereferences `neigh->dev` when called from
rose_transmit_clear_request(), and the first occurrence of the
`neigh` is in rose_loopback_timer() as `rose_loopback_neigh`,
and it is initialized in rose_add_loopback_neigh() as NULL.
i.e when `rose_loopback_neigh` used in rose_loopback_timer()
its `->dev` was still NULL and rose_loopback_timer() was calling
rose_rx_call_request() without checking for NULL.

- net/rose/rose_link.c
This bug seems to get triggered in this line:

rose_call = (ax25_address *)neigh->dev->dev_addr;

Fix it by adding NULL checking for `rose_loopback_neigh->dev`
in rose_loopback_timer().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
Changes in v5:
	- Free `dev` in rose_rx_call_request() and add NULL check for `dev` before freeing it.
	(Suggested-by: Jakub Kicinski <kuba@kernel.org>)
Changes in v4:
	- Free `dev`(on dev_hold()), when neigh->dev is NULL. (Suggested-by: Jakub Kicinski <kuba@kernel.org>)
Changes in v3:
        - Corrected checkpatch warnings and errors (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
        - Added "Fixes:" tag (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
Changes in v2:
        - Added NULL check in rose_loopback_timer() (Suggested-by: Greg KH <gregkh@linuxfoundation.org>)

 net/rose/rose_loopback.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..11c45c8c6c16 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,10 +96,19 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}

 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
-				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
-					kfree_skb(skb);
-			} else {
+			if (!rose_loopback_neigh->dev) {
+				kfree_skb(skb);
+				continue;
+			}
+
+			dev = rose_dev_get(dest);
+			if (!dev) {
+				kfree_skb(skb);
+				continue;
+			}
+
+			if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0) {
+				dev_put(dev);
 				kfree_skb(skb);
 			}
 		} else {
--
2.29.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
