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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D67BC433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Aug 2020 16:57:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4400D20791
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Aug 2020 16:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNYxsNt6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4400D20791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1AE678574F;
	Sat, 29 Aug 2020 16:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rq5q5nzWk-7e; Sat, 29 Aug 2020 16:57:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 94C8A85550;
	Sat, 29 Aug 2020 16:57:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A25BC016F;
	Sat, 29 Aug 2020 16:57:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16173C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 02DE720348
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 16:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzSSU4+cfp5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 16:57:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 48DB720347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 16:57:23 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id i13so984430pjv.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Aug 2020 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNi5HVcJ7yBT6DVF4xqHEm9pH1OJge9gkwZUJEYG2kc=;
 b=MNYxsNt6X9itvJUV8tku0XRaO2RkCQBN/mLZewjUf+5xA4M+6/yPPdjtQMeC03rKJ9
 /vBExQZIZEJ/8mNV+ATN2E3odhetvXRn7l9QyHP8+42rI56Lfe/pZyP7hzOJcp7nviGZ
 eV2wAYm2MIa0odEJKZOwYx5+dWqyhYy7c7gfzZvpF+6sArgdZWX43/5Td5xSSdadBQAI
 UqLS7vU+WQBQB33Y+fG73wRdTYAzCwZC6P+Cw3zj6uciFZgLsWtKw3pLiKGDy0tPj18t
 HZYa8ri3GqKOo9xgNfDTnVzZPj5A3ouYyVOBecWIQ3cHMy6md3gCkWSEW7fZ2M+731WJ
 st0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNi5HVcJ7yBT6DVF4xqHEm9pH1OJge9gkwZUJEYG2kc=;
 b=GboeLnvYRhITV7wpP3f7bABfOYwzAuBNcODMj4c9GfD6X4o1ShYvhRe3xGN99AV+N6
 bMC6TkRtc3KvPtOD7js0zhJRY3nxOrdbqcyIT6pBybX35pIeD5qwy2Uu0Nn7Ln/1JbVQ
 obJH+O8vtJKKd9E+W/CiPo/fJ8ASecG5DYeknT0fZfDB/txZ/nvn//fevgJZHyrsI20Y
 pWBKiO0Qw9XKINbbUsB3aNhKvro6TA6FSt7ofQf/sPaY+nd4dR8lVkezWVMtjLApCj5a
 S7DOEH99LTEZP2hO2NLc7+ns/O6P3MxQgJmhvtsok6TT5b8uF5+Hcxnmeqo/LlOzrI+Q
 3kBA==
X-Gm-Message-State: AOAM533/tqyliQkQQBKIe/+kyuofZvZ5a278BAhlwS6YWyhO1cjqj7fo
 I7IhfMa0N+Aad70iypWcXaA=
X-Google-Smtp-Source: ABdhPJyJ2xh7VLE9WxChS1XpbZ+c5kNddCKSHHWbjfZPxZl64QPAKow+8XMyVaErBkNl9etlMM2aog==
X-Received: by 2002:a17:90b:238d:: with SMTP id
 mr13mr3474738pjb.132.1598720242628; 
 Sat, 29 Aug 2020 09:57:22 -0700 (PDT)
Received: from localhost.localdomain ([45.118.165.144])
 by smtp.googlemail.com with ESMTPSA id
 a200sm3217970pfd.182.2020.08.29.09.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 09:57:21 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com
Date: Sat, 29 Aug 2020 22:27:12 +0530
Message-Id: <20200829165712.229437-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200829124112.227133-1-anmol.karan123@gmail.com>
References: <20200829124112.227133-1-anmol.karan123@gmail.com>
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

Fix null pointer deref in hci_phy_link_complete_evt, there was no 
checking there for the hcon->amp_mgr->l2cap_conn->hconn, and also 
in hci_cmd_work, for hdev->sent_cmd.

To fix this issue Add pointer checking in hci_cmd_work and
hci_phy_link_complete_evt.
[Linux-next-20200827]

This patch corrected some mistakes from previous patch.

Reported-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=0d93140da5a82305a66a136af99b088b75177b99
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 net/bluetooth/hci_core.c  | 5 ++++-
 net/bluetooth/hci_event.c | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 68bfe57b6625..996efd654e7a 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4922,7 +4922,10 @@ static void hci_cmd_work(struct work_struct *work)
 
 		kfree_skb(hdev->sent_cmd);
 
-		hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
+		if (hdev->sent_cmd) {
+			hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
+		}
+
 		if (hdev->sent_cmd) {
 			if (hci_req_status_pend(hdev))
 				hci_dev_set_flag(hdev, HCI_CMD_PENDING);
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4b7fc430793c..1e7d9bee9111 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4941,6 +4941,10 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
 		hci_dev_unlock(hdev);
 		return;
 	}
+	if (!(hcon->amp_mgr->l2cap_conn->hcon)) {
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
