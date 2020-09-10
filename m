Return-Path: <SRS0=Icdq=CT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE210C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 04:34:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4716C2075B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 04:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjJMhcLe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4716C2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D33262E128;
	Thu, 10 Sep 2020 04:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQyOd8fX0AoX; Thu, 10 Sep 2020 04:34:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EB57E204CA;
	Thu, 10 Sep 2020 04:34:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5558C0052;
	Thu, 10 Sep 2020 04:34:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCCF7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 04:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C178A86AB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 04:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXtfHI-EjuvZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 04:34:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5DC9B8636D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 04:34:42 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id o68so4033253pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 21:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mLWBFcBZV8fmFx5Xk0PVn4QE4aV7gSoFbhf906XUkPs=;
 b=NjJMhcLe4iQ8X5gqAeC+mPeQdB0ZCqaUU7mPw3W/D1GX/8B2q+7jyxu01ySUanM1AP
 XWLRdQ4Ygmq6foo4o51n6qzzhlMY8jt0AuBbbm5ZGfPvBftrhAlI5jR1j9d9rUgO48Zv
 3nt3vC+NKv+yMvAwRrd9oBZghO/4msxbwX1MkPD/pMaLsWI1twbeLVt0jlqh6RQjNPqv
 Q26XqLtkZuJuP/6N1v3qcx9UkIfpsRWUbMIDIHhtC5yect8TFVWqO6rRLCXAUFzUDmdd
 37JxvHGTFtLPc5FV00qdssrm+rSevrHMgr9hB4//8nNwkTrWo33AxIHH3j5/lwv5J4Sz
 UsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mLWBFcBZV8fmFx5Xk0PVn4QE4aV7gSoFbhf906XUkPs=;
 b=k9QpJm6wywoZjcdLj8d71LzQL+yr3Hq8K+coVKAZJURBdq5rO+kYPzxLQDdigQ9gpm
 PKPtNuB/WyNsmVi9+pwkpD+xJXHDPWbDyFhEKHjksFuzxtkkN9hiGW0eHezrYHp1kPsm
 FBrKu1DwRKb3H4GnbbKi9zjfd/l6kRAS8b0Nv7Q5dtk+BvZtPbbmXxHzgIWrsaPCjREO
 pab8fYqIWPvLmszGuadgPJJsDYdxZEeYJS8LzxgpWXzUAsTgCcwHcAQEXbpUjxVj7Cja
 ZcwU6O/SxBeFkilHxDP/dXWi0KkPvqUcdq5Y91HKF8VV/uy2FBYSwm6/CsB8lFXqhL6p
 cAMg==
X-Gm-Message-State: AOAM532TOm6rwCilfqcwRTy1g5tuU+QGRePzTUFB+U9corjgmVMkeLK0
 F1pIkwhk8BPMGXTCy3+QVT0=
X-Google-Smtp-Source: ABdhPJzFKv4KxelRN1MBEhwmEPGdlzS/d7UG1Dn2QL3AG6VpQwxMK6fYsIxpdOIV7ceTnSwts2E6Vw==
X-Received: by 2002:a63:471b:: with SMTP id u27mr3050649pga.139.1599712481765; 
 Wed, 09 Sep 2020 21:34:41 -0700 (PDT)
Received: from localhost.localdomain ([45.118.165.148])
 by smtp.googlemail.com with ESMTPSA id s19sm4384211pfc.69.2020.09.09.21.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 21:34:40 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com
Date: Thu, 10 Sep 2020 10:04:24 +0530
Message-Id: <20200910043424.19894-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 syzbot+0bef568258653cff272f@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: [Linux-kernel-mentees] [PATCH] net: bluetooth: Fix null pointer
	dereference in hci_event_packet()
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

Prevent hci_phy_link_complete_evt() from dereferencing 'hcon->amp_mgr'
as NULL. Fix it by adding pointer check for it.

Reported-and-tested-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=0bef568258653cff272f
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 net/bluetooth/hci_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4b7fc430793c..871e16804433 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4936,6 +4936,11 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
 		return;
 	}
 
+	if (IS_ERR_OR_NULL(hcon->amp_mgr)) {
+		hci_dev_unlock(hdev);
+		return;
+	}
+
 	if (ev->status) {
 		hci_conn_del(hcon);
 		hci_dev_unlock(hdev);
-- 
2.28.0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
