Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB00BC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 21:48:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E7120772
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 21:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXA0dnkh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87E7120772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A11D78750E;
	Fri, 10 Jul 2020 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdC-gspvY26V; Fri, 10 Jul 2020 21:47:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F6D98742D;
	Fri, 10 Jul 2020 21:47:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BF68C0890;
	Fri, 10 Jul 2020 21:47:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA908C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D6F7A89C89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IpD1Tdv9rlJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:47:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 687EF89C52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:47:25 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id t11so3308562qvk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H4BIXM/X/4TDwBaDfHH2qeLVBAs7PCGQrZDucm3WMQA=;
 b=lXA0dnkhWEzo+ZcE67jH+G1OgotEBlFxSKDTrTSdVqYCG25rP2YQDQjX8ZX2ow1Q1/
 XlzIEgUG9K6iyMLvNZFTuxDS7VSBtmGBdcVsjPM+2I8UX3K5VAsatr9rnxB9FfBvjsJq
 hABIVqaZYYjcKtikl3YtQSstw1Iv512kGKS/L21/Yro9jRmyD8t/OtRiByiwvlFiixgz
 9C1CnWBNmZQfAm3+g2JVCaxPmzfqZIPr2DvRSCA3EonhzUW4Z3W1oS46s/06jAky2TW1
 IH0hvL3WhTD98VFnr3vKykPgI2eZVcLjZz8PgsVx1H7itedHXLhQm2hRbCUkxOqFFFll
 6KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H4BIXM/X/4TDwBaDfHH2qeLVBAs7PCGQrZDucm3WMQA=;
 b=G9QPTj1OdilMnrCzMIdANTXiMisOvLLBd86LctPbVHhSuRGb+HJcx6mWyuaxj/mz6h
 UowJDsUgH53kTtgGml+xXyayQoptGRV/LZGBSuQFIXQwE6Hn53rUFmRCMk8zCM/+ccDD
 VT9KJwnl9QFPtvhyX9M57HDW1nOSgCTcIsqaW4TVR0a2N/wMTyGmDrDkuHndPrOogsCo
 p93ReNRE+Wsk+8X4knY9dAJoiRcLijZZIMZGAeC5bgu2AzezRE5hSNvus3kMLbVq/sGv
 y6iD25Pk0olE0TGetpdEtNvDa5/2SOTMju3FyLIEtW23jES7RVdD9968CzJo3DG0T2eU
 S8RQ==
X-Gm-Message-State: AOAM532gfEuY0+gaBmfCSO55pCq36vX5SxGJ9RFFfh/HXokT5k6oOsMG
 IdbducX+Czo6Emj3vS3rWQ==
X-Google-Smtp-Source: ABdhPJy+8ouNnOFsAjWlZGUPZPhMenwY4SizL6H6mf4dXiIltgFw3gi7pzw+NnH3gWcRNGhFtiNNMA==
X-Received: by 2002:a0c:f109:: with SMTP id i9mr66510402qvl.154.1594417644040; 
 Fri, 10 Jul 2020 14:47:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id p66sm8930426qkf.58.2020.07.10.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 14:47:23 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Date: Fri, 10 Jul 2020 17:45:26 -0400
Message-Id: <82c4e719b7615f5333444bdc2b5cc243a693eeb1.1594414498.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3f69f09d6eb0bc1430cae2894c635252a1cb09e1.1594414498.git.yepeilin.cs@gmail.com>
References: <3f69f09d6eb0bc1430cae2894c635252a1cb09e1.1594414498.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] net/bluetooth: Prevent
	out-of-bounds read in hci_inquiry_result_with_rssi_evt()
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

Check `num_rsp` before using it as for-loop counter. Add `unlock` label.

Cc: stable@vger.kernel.org
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/bluetooth/hci_event.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 8b3736c83b8e..f9f4262414b3 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4159,6 +4159,9 @@ static void hci_inquiry_result_with_rssi_evt(struct hci_dev *hdev,
 		struct inquiry_info_with_rssi_and_pscan_mode *info;
 		info = (void *) (skb->data + 1);
 
+		if (skb->len < num_rsp * sizeof(*info) + 1)
+			goto unlock;
+
 		for (; num_rsp; num_rsp--, info++) {
 			u32 flags;
 
@@ -4180,6 +4183,9 @@ static void hci_inquiry_result_with_rssi_evt(struct hci_dev *hdev,
 	} else {
 		struct inquiry_info_with_rssi *info = (void *) (skb->data + 1);
 
+		if (skb->len < num_rsp * sizeof(*info) + 1)
+			goto unlock;
+
 		for (; num_rsp; num_rsp--, info++) {
 			u32 flags;
 
@@ -4200,6 +4206,7 @@ static void hci_inquiry_result_with_rssi_evt(struct hci_dev *hdev,
 		}
 	}
 
+unlock:
 	hci_dev_unlock(hdev);
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
