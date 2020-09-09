Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD0BC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 07:18:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5B921741
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 07:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOZkXJ6/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE5B921741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A54472E12E;
	Wed,  9 Sep 2020 07:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maUvEvcARSAw; Wed,  9 Sep 2020 07:18:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0902E2E11D;
	Wed,  9 Sep 2020 07:18:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5540C0859;
	Wed,  9 Sep 2020 07:18:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27B5FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 07:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 16B782E136
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 07:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 32ttHzdlvF1V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 07:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 86F152E12E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 07:17:58 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id o20so1346280pfp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64Bt6kd9gxNJLRVuqcxKj5M+pb5+qbe839Gm0r/zIvo=;
 b=BOZkXJ6/UZfd/Smz8exM0/GCMabLwdZY0S7okls6rxu14xZzEAcX+7DHmsZISbkkg1
 yI+W8ytZ2T8AY61EhOAtxyLw/FXWXvZ8zE3VvXxr0LX0FbUVdMosXzPdv7nuDZzbWrkz
 Mq+leo06/a5x3b+9W+6QJAP+RWsyDJrKakDSaqjR+ch+HTVPMwA9vL25n4E5ufexmJfx
 5RuG0VmZbBZydIVVUfcO+9WXm3igrUCRTWEIvanjZY4RmigvsMwz8KyfXu7TDXj/DuGZ
 6uQ8GIDFcht7e76ccDGhc/3kIpHbgTIfiJpCWNpM8Bqdg88VJuTWxAKDS8rVfZYDUBLN
 YyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64Bt6kd9gxNJLRVuqcxKj5M+pb5+qbe839Gm0r/zIvo=;
 b=gUnaafkaClMe3nwbcs834+LBl3Kf+oeJ9qjlYQFkfPOjZzLAgV0RI3jvXCx0dcEpGp
 MaceIUPTAx7OidfQUFZGXZeI1V8UgnK92Pnqg65rjNzFkDRX0AtuPLKYuGz8KqS+5l+R
 oYC0Yb6jxP04PbBPrWw+huBS57qVoNaCv3S82Sr2EGHgLr+cGXskaqCi/VYdVpBgl2ea
 uegKjdQFGjNgzYdCPaBvaWxFIrb5L2BuLnOwcgwgg3esVflUarB88ZT2R/rB2RdGQOIm
 ssynNmuyoV6i06JYNuC1nyF2gznkQcOB1Wrf4J5zzoPfWxWH3PXQFBQItAkk+8IQJ0oM
 ODzA==
X-Gm-Message-State: AOAM533Ce2e2+hw5rOYYlZsu1RO/g4hFB7I8bCRNyRcbkw46PGaYhm/j
 G37Ukg2en5auMCWupDN55A==
X-Google-Smtp-Source: ABdhPJxuGhKjFWPHlV7tWVd/A6dvlcDQsvdVZO4mWSI4b/JsVgqaXXITNfUrG/50JWsRL7CjUveweg==
X-Received: by 2002:a17:902:7203:b029:d0:cbe1:e73a with SMTP id
 ba3-20020a1709027203b02900d0cbe1e73amr2786781plb.21.1599635878103; 
 Wed, 09 Sep 2020 00:17:58 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id y3sm1699661pfb.18.2020.09.09.00.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 00:17:57 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Date: Wed,  9 Sep 2020 03:17:00 -0400
Message-Id: <20200909071700.1100748-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200805180902.684024-1-yepeilin.cs@gmail.com>
References: <20200805180902.684024-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net v2] Bluetooth: Fix
	slab-out-of-bounds read in hci_le_direct_adv_report_evt()
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

`num_reports` is not being properly checked. A malformed event packet with
a large `num_reports` number makes hci_le_direct_adv_report_evt() read out
of bounds. Fix it.

Cc: stable@vger.kernel.org
Fixes: 2f010b55884e ("Bluetooth: Add support for handling LE Direct Advertising Report events")
Reported-and-tested-by: syzbot+24ebd650e20bd263ca01@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=24ebd650e20bd263ca01
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - add "Cc: stable@" tag.

 net/bluetooth/hci_event.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4b7fc430793c..aec43ae488d1 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5863,21 +5863,19 @@ static void hci_le_direct_adv_report_evt(struct hci_dev *hdev,
 					 struct sk_buff *skb)
 {
 	u8 num_reports = skb->data[0];
-	void *ptr = &skb->data[1];
+	struct hci_ev_le_direct_adv_info *ev = (void *)&skb->data[1];
 
-	hci_dev_lock(hdev);
+	if (!num_reports || skb->len < num_reports * sizeof(*ev) + 1)
+		return;
 
-	while (num_reports--) {
-		struct hci_ev_le_direct_adv_info *ev = ptr;
+	hci_dev_lock(hdev);
 
+	for (; num_reports; num_reports--, ev++)
 		process_adv_report(hdev, ev->evt_type, &ev->bdaddr,
 				   ev->bdaddr_type, &ev->direct_addr,
 				   ev->direct_addr_type, ev->rssi, NULL, 0,
 				   false);
 
-		ptr += sizeof(*ev);
-	}
-
 	hci_dev_unlock(hdev);
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
