Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D65AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 18:10:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F2120656
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 18:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkEWqptL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F2120656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B57088306;
	Wed,  5 Aug 2020 18:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkqqxERZCOIM; Wed,  5 Aug 2020 18:10:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DAC5E87ADB;
	Wed,  5 Aug 2020 18:10:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C71F1C0050;
	Wed,  5 Aug 2020 18:10:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DF4EC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 18:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8A9F18789F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 18:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DtewxN-4hqXT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 18:10:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C95E386489
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 18:10:32 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id x6so15340663qvr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Aug 2020 11:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CSOoq3zhF6z2fZ+X97MfanJIRrTuyK8BNIkdVGDMQEQ=;
 b=WkEWqptLDy3R6ioOulhs9LCTz33DYC1YwZpUJavPXOLVGV2Oh1GCAetOfpDiAicnfC
 bnnTTBfinXKPD8zwEhxTo3jAr1u6b1KivySeOrU9BiBn/I6UQAqhjBJCNsMKvG0hkImf
 ALAyJ0TBul74xRJlxBK0ORqfKLnd46HXDgh18AjaR8DPqu0fHH8ldssbfQi1trX6tRB7
 5UW7Vc1V2K2qydneRegNu1wCNbnVqa8s8SaDMEMPNS65YHhlNkvARMGJz77FYBEcMec3
 v1SU3F9ISIdfIyZiYpIFsVgMAzZcO+5s6AMfJZRSIANi/QySkiAvuVZebvBhIVj14HNN
 KJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CSOoq3zhF6z2fZ+X97MfanJIRrTuyK8BNIkdVGDMQEQ=;
 b=fZvLvb6ByfigW4TuiZMSb1V3L1KMtc7I8n+HeQorO2cqPYd4tKmQEsSwbiAEcFWRze
 GNclmpGP5GCrfewls6L4tj8Xbxdf+m77MZFcvxo4+nr6oqCqdlGs+01bo0SoBv44ubeK
 CoExNjUCaeI14YphXaBiWqxbDY6MgBmbWehlCYHuDSQPMuIPu1MQyo4Mi5oOBvhRX9n8
 +iv/dxt1+eiOEI3lTnmHuiXd6gPHT8gT/MBn5xgHSaxmWFJO9qNKttS2xshRmvilxdTt
 6IIhp4GXs9RX6LTOQDAUE8ZFAJkB/aOQ3vskaskoeH3900w+FslmyHyov8AlXAozGL/2
 fYYA==
X-Gm-Message-State: AOAM5300rtq5Pu7i62YFbWdWJh+nrteVka9AcklVqqOpqimznDJkBvR2
 QpmR5VTCAKIy2hGZPD8wUg==
X-Google-Smtp-Source: ABdhPJybD0CTplQH9PaqhvAh94r4pvrJHLy/2Cb1rWWuo+HcvlxTLUJMXYleqq82a0Jy8907RV108g==
X-Received: by 2002:ad4:438f:: with SMTP id s15mr5142142qvr.164.1596651031728; 
 Wed, 05 Aug 2020 11:10:31 -0700 (PDT)
Received: from localhost.localdomain
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id i7sm2571560qtb.27.2020.08.05.11.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:10:31 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Date: Wed,  5 Aug 2020 14:09:02 -0400
Message-Id: <20200805180902.684024-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net] Bluetooth: Fix
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

Reported-and-tested-by: syzbot+24ebd650e20bd263ca01@syzkaller.appspotmail.com
Fixes: 2f010b55884e ("Bluetooth: Add support for handling LE Direct Advertising Report events")
Link: https://syzkaller.appspot.com/bug?extid=24ebd650e20bd263ca01
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
I moved the initialization of `ev` out of the loop and restructured the
function a bit, since otherwise the check would look like:

	if (!num_reports || skb->len < num_reports * sizeof(struct hci_ev_le_direct_adv_info) + 1)
		return;

Therefore I used the similar structure with hci_inquiry_result_evt() etc.

hci_le_adv_report_evt() and hci_le_ext_adv_report_evt() also have the
same issue with `num_reports`, but I'm not sure how to perform the check
for them, since they use variable-length reports. Should we do something
like this? (take hci_le_adv_report_evt() as example:)

	if (!num_reports ||
	    skb->len < num_reports * (sizeof(*ev) + HCI_MAX_AD_LENGTH + 1) + 1)
		return;

Then how about hci_le_ext_adv_report_evt()? There is no such
`HCI_MAX_AD_LENGTH` restrictions on `ev->length` for it, I assume?

Would like to hear your opinion. Thank you!

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
