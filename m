Return-Path: <SRS0=F6Pe=4N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953FDC35E01
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:07:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6628D20CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/aX2xkl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6628D20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EFDD86879;
	Tue, 25 Feb 2020 13:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Y-mAf-ANi7e; Tue, 25 Feb 2020 13:07:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C3ADA8689B;
	Tue, 25 Feb 2020 13:07:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1F6AC089F;
	Tue, 25 Feb 2020 13:07:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9AC5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 96E188689B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xnV6I0XA6Fz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:07:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DD35A86879
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:07:21 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id q4so1348016pls.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 05:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1bjATN5yUQRktfOaoPKCC0Tyl9TIao9QDPF9Tp8wgtM=;
 b=c/aX2xklwzN+KnL1Z0gS/vWAo34D7B+EVCyRXa1sgSGIxkEwXGMtnLjDb06SaW6TV4
 poMEIqGLmg1KJrMLIUiVgZS0KWPG8ctxN7CBg9Ly/OimQ1ZgN6Y6NgVj7AgdClRM+jb5
 EW0Xut8jNmTiVhGfgelmisiwJiDIwm7tuzzx2el4955WR6jKsFGeUJMrgOzeOLIvdzSJ
 itgDnFljBrFvVl9FVXN63kKDys0rdJtm/Xwkv9kEVztRae2l2+34UPgc5tjPIK3swwx4
 jnMp7VuSAmIfweh50M43NWjfak/4QtyjVk28klahBW9drhnBIsR1Ud1/0RionuTuDYhv
 yLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1bjATN5yUQRktfOaoPKCC0Tyl9TIao9QDPF9Tp8wgtM=;
 b=Bdsc2C8YBjgFtqLZbCLJr05x+K3iwThpzJOmVP5SV6g2HB6Le9lzN3RjYb8WUlLQk7
 SeiUhbD1vs9YF2jlgkSCFDv0mdcSkRnfThqPKZtPU8vKyP6lVfQ7XhWWckhcbIx7zKVe
 iyHBjvIxTz/cNCZEy3kXrNuP5qMm4P3OyoG1VxEyQoaNVy83I8J5w7lWqKaKqsO2+2pT
 yE/3vCtj2InmzL41XHcDgoAEs31164AqcoU1FvuoHvSocrlmEcttkmQAIbAiYCq5lJb4
 +ZMPsUXkpbITA5zRjG3uy3hIiknCNdBK31glh6cPxW9CxT45rWW1jLNra/rxYYUNY74M
 d06w==
X-Gm-Message-State: APjAAAWehqP0TaBNrNvjaf2COOi0oLSGtxEM0Eh7D94GK4d/NaUbyRyM
 piqdd6dQ8+M6XnSrSsU7ew==
X-Google-Smtp-Source: APXvYqx9u7699mSLH5QM5nQvKggMKDwMmVA1TGSCMDygfPwY1tQRBvHxTUNFIRyMh+PucBct8heGZA==
X-Received: by 2002:a17:902:223:: with SMTP id
 32mr55786706plc.167.1582636041493; 
 Tue, 25 Feb 2020 05:07:21 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in ([112.79.48.254])
 by smtp.gmail.com with ESMTPSA id e2sm3156979pjs.25.2020.02.25.05.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 05:07:20 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: marcel@holtmann.org, johan.hedberg@gmail.com, davem@davemloft.net,
 kuba@kernel.org
Date: Tue, 25 Feb 2020 18:36:38 +0530
Message-Id: <20200225130638.32394-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.or,
 linux-bluetooth@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, netdev@vger.kernel.org,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: bluetooth: hci_core: Fix
	Suspicious RCU usage warnings
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

The following functions in hci_core are always called with
hdev->lock held. No need to use list_for_each_entry_rcu(), therefore
change the usage of list_for_each_entry_rcu() in these functions
to list_for_each_entry().

hci_link_keys_clear()
hci_smp_ltks_clear()
hci_smp_irks_clear()
hci_blocked_keys_clear()

Warning encountered with CONFIG_PROVE_RCU_LIST:

[   72.213184] =============================
[   72.213188] WARNING: suspicious RCU usage
[   72.213192] 5.6.0-rc1+ #5 Not tainted
[   72.213195] -----------------------------
[   72.213198] net/bluetooth/hci_core.c:2288 RCU-list traversed in non-reader section!!

[   72.213676] =============================
[   72.213679] WARNING: suspicious RCU usage
[   72.213683] 5.6.0-rc1+ #5 Not tainted
[   72.213685] -----------------------------
[   72.213689] net/bluetooth/hci_core.c:2298 RCU-list traversed in non-reader section!!

[   72.214195] =============================
[   72.214198] WARNING: suspicious RCU usage
[   72.214201] 5.6.0-rc1+ #5 Not tainted
[   72.214204] -----------------------------
[   72.214208] net/bluetooth/hci_core.c:2308 RCU-list traversed in non-reader section!!

[  333.456972] =============================
[  333.456979] WARNING: suspicious RCU usage
[  333.457001] 5.6.0-rc1+ #5 Not tainted
[  333.457007] -----------------------------
[  333.457014] net/bluetooth/hci_core.c:2318 RCU-list traversed in non-reader section!!

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/bluetooth/hci_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index cbbc34a006d1..8ddd1bea02be 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2285,7 +2285,7 @@ void hci_link_keys_clear(struct hci_dev *hdev)
 {
 	struct link_key *key;
 
-	list_for_each_entry_rcu(key, &hdev->link_keys, list) {
+	list_for_each_entry(key, &hdev->link_keys, list) {
 		list_del_rcu(&key->list);
 		kfree_rcu(key, rcu);
 	}
@@ -2295,7 +2295,7 @@ void hci_smp_ltks_clear(struct hci_dev *hdev)
 {
 	struct smp_ltk *k;
 
-	list_for_each_entry_rcu(k, &hdev->long_term_keys, list) {
+	list_for_each_entry(k, &hdev->long_term_keys, list) {
 		list_del_rcu(&k->list);
 		kfree_rcu(k, rcu);
 	}
@@ -2305,7 +2305,7 @@ void hci_smp_irks_clear(struct hci_dev *hdev)
 {
 	struct smp_irk *k;
 
-	list_for_each_entry_rcu(k, &hdev->identity_resolving_keys, list) {
+	list_for_each_entry(k, &hdev->identity_resolving_keys, list) {
 		list_del_rcu(&k->list);
 		kfree_rcu(k, rcu);
 	}
@@ -2315,7 +2315,7 @@ void hci_blocked_keys_clear(struct hci_dev *hdev)
 {
 	struct blocked_key *b;
 
-	list_for_each_entry_rcu(b, &hdev->blocked_keys, list) {
+	list_for_each_entry(b, &hdev->blocked_keys, list) {
 		list_del_rcu(&b->list);
 		kfree_rcu(b, rcu);
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
