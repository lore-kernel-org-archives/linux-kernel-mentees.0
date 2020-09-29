Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5508C47423
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 17:32:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21DE42076B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 17:32:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3b+sbb1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21DE42076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8BA3E86508;
	Tue, 29 Sep 2020 17:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJGbFIlZOBZt; Tue, 29 Sep 2020 17:32:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17A27857CB;
	Tue, 29 Sep 2020 17:32:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 011C1C0890;
	Tue, 29 Sep 2020 17:32:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E16AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 17:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5ED7686508
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 17:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBzTJt-zbwj6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 17:32:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B2D72857CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 17:32:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x123so5243941pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 10:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xf7UYd55bBypBMw3nNJvaFu6tO4OkMryDnkxOfP4mCQ=;
 b=L3b+sbb1ZAJZvbidh3Qs2l8xQ/zyz/rGbhWqi3+dHNjqGS9VFkuw2TcY05NlVObSlS
 C7D93tqsTEzDPJzm0/8tb55prGjb/hfPt9tkKWScgCxv8xgPsJheyuFlzoy3MwPjh9++
 Uw2KIcbqIN4Gz1PPBd7Z2WvnQz7WPp7PVXx6/iRnA6OpUP7T4vpqhUzdGnnl9HCM9RoE
 8jWIA1WJilZ34mDpIlpYNTxjEiRUpC/atZuqfVDWjfjMzvVlGjZHFr/opJa9iqJYAXQ0
 4uFaYeiu89+ESDndbe10lndLfbPEiuLssadC518emRGFzU1gOf0YmI/UC7maKLgLremH
 nLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xf7UYd55bBypBMw3nNJvaFu6tO4OkMryDnkxOfP4mCQ=;
 b=B7LkvvFW1dqWcL+WAJEFh06di971NiMckSk2G0PkxaiU4slxOBUSLf48JafMVlipyh
 NxEPZS5kEubt4cw2kosHI8E8aAcSW10FT5hlKzeo8mlly2B5ABFnyThFehj7ezdpkFNF
 lZ4QROcdITrDNGwmIZmgcQb2Klo+GMek5IMyo/pSUo1OECLeSHOvGcTGl5NeUVpCpw57
 81aY1AZPJDbS8iVfFqxeFRrOi5ZytfsIKvLwTannW446qcHz+oREeLLOa7g6Yp+U2Icy
 xaymKV/9GOhYSrhwuKMFxIDPCG9iRQeX/jyIcS6+tB1x/4oSdJUMkyMKDosQnwbwxeRi
 klmw==
X-Gm-Message-State: AOAM530SJwGjos7r1tE9XAoHWCDHhs2uMRhKfMmoJ8xnYEy3N8ODUrzv
 mBJz60QNfWFzdaThAnHV2v0=
X-Google-Smtp-Source: ABdhPJwc0s8N7Xf0hxKKvWjT3DfKxAZtK9X2pcW+qM/TaWv5j/tdAoTup1/sAlPie73LycYp7I8z/g==
X-Received: by 2002:a62:93:0:b029:13e:d13d:a085 with SMTP id
 141-20020a6200930000b029013ed13da085mr4916522pfa.28.1601400768890; 
 Tue, 29 Sep 2020 10:32:48 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
 by smtp.googlemail.com with ESMTPSA id d17sm6270070pfq.157.2020.09.29.10.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 10:32:47 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com
Date: Tue, 29 Sep 2020 23:02:31 +0530
Message-Id: <20200929173231.396261-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914154405.GC18329@kadam>
References: <20200914154405.GC18329@kadam>
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

AMP_MGR is getting derefernced in hci_phy_link_complete_evt(), when called from hci_event_packet() and there is a possibility, that hcon->amp_mgr may not be found when accessing after initialization of hcon.

- net/bluetooth/hci_event.c:4945
The bug seems to get triggered in this line:

bredr_hcon = hcon->amp_mgr->l2cap_conn->hcon;

Fix it by adding a NULL check for the hcon->amp_mgr before checking the ev-status.

Fixes: d5e911928bd8 ("Bluetooth: AMP: Process Physical Link Complete evt") 
Reported-and-tested-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?extid=0bef568258653cff272f 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
Cahnge in v2:
  - Replaced IS_ERR_OR_NULL check with NULL check only (Suggested by: Dan Carpenter <dan.carpenter@oracle.com>)
  - Added "Fixes:" tag (Suggested by: Dan Carpenter <dan.carpenter@oracle.com>)


 net/bluetooth/hci_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4b7fc430793c..b084142c578e 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4936,6 +4936,11 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
 		return;
 	}
 
+	if (!hcon->amp_mgr) {
+		hci_dev_unlock(hdev);
+		return 0;
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
