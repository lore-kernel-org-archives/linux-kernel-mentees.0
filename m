Return-Path: <SRS0=XTMy=CH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF0CC433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Aug 2020 12:41:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E320120CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Aug 2020 12:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imNiGgPS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E320120CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C0A7285F83;
	Sat, 29 Aug 2020 12:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSaaoxbcJtDH; Sat, 29 Aug 2020 12:41:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 134F085F6C;
	Sat, 29 Aug 2020 12:41:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDAA4C016F;
	Sat, 29 Aug 2020 12:41:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43480C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 12:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 32D1F20348
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 12:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2DR3fj+JBP1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 12:41:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 5289020334
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 12:41:24 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id mt12so805417pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=inoIGbEpmdL0eBcL/eTYO9DUL34BzxMhEi+RCO4Fy4w=;
 b=imNiGgPSNVHTgkyR65Ye2n6UFzxVcj5PC00bxL6M6q+QkbrDpme8p5sIT/vyPhC0Rq
 0dxinnsMKJVrNE1SjLHFTOoDLbD1QJAJZgdZ3q7qrbzNPv7wsToS3KpU7tXAgXsx6d1E
 oGa7IGk95kJJO22t/7UEbQd4W/4bxQnhJ7C4gFsmzsBXs12xF+b81gdBj12E5pj/pevH
 LESYfR8XTlIGXcMgStlwbMpa9g4bRSFoRk6K96cbLnXn/LPyt0WVKA3l57KQszLvmq8g
 8oqjDCEIMWiNb/uix5TTs2dt3S9LwISoMi/yF4JWed9HPyN3HW3zdWEttVexG7zGeSiM
 4gVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=inoIGbEpmdL0eBcL/eTYO9DUL34BzxMhEi+RCO4Fy4w=;
 b=Pg6zFomRV2SY1ZK0Ew3f+N9WXQCAczPCWubrtB+1oPqAhCQYywMIdGq7iNn5vRbGfA
 6Dcs8HikwZept71UL1lTOLJmxUP91VwHyUJR3wQBMLf5NAvnoRFIqqmD5v6GevrCU3Iq
 /0RQU3DRpmN6ZlwFKrvfYtDBKcNZuiXGDxart7GD8a4KmmOab4KnUPezLZjzH8PXarWm
 sG3mOWeFqpAu5pbyXZ0Wjg2LNCbpOnulsSWvciZWyB9zSn26VQAUaQrRKmyBWOv76m/p
 H8f6yoXcu7n0sYJihEjvmMtaLJi36glmwzWRulHbUX9aInFMSNgZ5iu+l0AXbl6i52dK
 BPag==
X-Gm-Message-State: AOAM531b2/DjC7oilQp5IyeqOffccK96BmTq4aizwegwQA1dbJR7dMdA
 T6tm8Farfy9kSDa6mUFHATE=
X-Google-Smtp-Source: ABdhPJz+NLb7HIW5P9DPG54Uwcs3btCpwTqxKPO7aqvpyIgUfuoteTuwfpl4q5WoZwqSBATciOhjNw==
X-Received: by 2002:a17:902:123:: with SMTP id
 32mr2619323plb.143.1598704883743; 
 Sat, 29 Aug 2020 05:41:23 -0700 (PDT)
Received: from localhost.localdomain ([45.118.165.148])
 by smtp.googlemail.com with ESMTPSA id t25sm2496901pfe.76.2020.08.29.05.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 05:41:22 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com
Date: Sat, 29 Aug 2020 18:11:12 +0530
Message-Id: <20200829124112.227133-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 syzbot+0bef568258653cff272f@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: [Linux-kernel-mentees] [PATCH] net: bluetooth: Fix null pointer
	deref in hci_phy_link_complete_evt
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

Fix null pointer deref in hci_phy_link_complete_evt, there was no checking there for
the hcon->amp_mgr->l2cap_conn->hconn, and also in hci_cmd_work, for
hdev->sent_cmd. 

To fix this issue Add pointer checking in hci_cmd_work and
hci_phy_link_complete_evt.
[Linux-next-20200827]

Reported-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=0d93140da5a82305a66a136af99b088b75177b99
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 net/bluetooth/hci_core.c  | 4 ++++
 net/bluetooth/hci_event.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 68bfe57b6625..533048d2a624 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4922,6 +4922,10 @@ static void hci_cmd_work(struct work_struct *work)
 
 		kfree_skb(hdev->sent_cmd);
 
+		if(hdev->sent_cmd) {
+			hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
+		}
+
 		hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
 		if (hdev->sent_cmd) {
 			if (hci_req_status_pend(hdev))
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4b7fc430793c..c621c8a20ea4 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4941,6 +4941,10 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
 		hci_dev_unlock(hdev);
 		return;
 	}
+	if(!(hcon->amp_mgr->l2cap_conn->hcon)) {
+		hci_dev_unlock(hdev);
+		return;
+	}
 
 	bredr_hcon = hcon->amp_mgr->l2cap_conn->hcon;
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
