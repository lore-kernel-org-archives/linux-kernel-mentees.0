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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE16C35DE1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:08:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA4A42176D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uvN6kIxK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA4A42176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 387FC87592;
	Tue, 25 Feb 2020 13:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSvQY8pazlPZ; Tue, 25 Feb 2020 13:08:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA541875D8;
	Tue, 25 Feb 2020 13:08:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5776C089F;
	Tue, 25 Feb 2020 13:08:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D2C5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3B1BB20370
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMjJm7dVpPqn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:08:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 83A6920348
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:08:19 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 7so4790310pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1bjATN5yUQRktfOaoPKCC0Tyl9TIao9QDPF9Tp8wgtM=;
 b=uvN6kIxK9vk6GbegcH4Kbd7p2T9YC5SqOl4mUP7VZYonTQTCsZzdM5Wb/iD3AGteau
 sUjlLSX5mg48I8NaR6m8Ls4t45N+CXdESz1LJ8pYWP9VIVGHPbEjt7vKINgMQoHR8k/N
 S4c5mu7Boh49/asjAfxDsrczi3xkcjA5TmYu7C3zhAZTjnOfimGQXGlJKHIIo6vHMNfY
 5HWx5XVpCFys9o4JmQk0u0V9zsev1jLeTU3aTJu0DIA6z3e66IwQ0y7+T4ta0v/RQVYE
 HFYzLyR4QjxCcPPaH3z6pVIjTRcZPXr0tyojGCk5PZkeDuTnnU61zGtj1aX9wuHta89S
 hTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1bjATN5yUQRktfOaoPKCC0Tyl9TIao9QDPF9Tp8wgtM=;
 b=ii1DhWxdoA8uE9OZuD4Xiy/1pQM2F7Hm23ldY4C1CWzXidgwwBpGE5xXHcAlMhvsqB
 CO7EKrS1N8XOYcCr4+oHVr8oe1WuyFQ3x6ljq+rTfrKtMN7DlwPM19ilDk26MjVymAYe
 JMvVrCHlOKCS1o59+HN2XtOWCyWOirhL2rXUrEysdc6A9ay5e3mHzX3/TRLPa/LeWa9a
 mvZUbnrhaRlGyblKinSXR2lHoFupPM9SM/NyfOYohwihvyKcz8OPxI6/4wjnkDJYAEPO
 6QO4E4lHd7FCrKZNi7Osk252EWFubmkjjNMxb10bJPiKrh5xV03rwWZTkaDQSqdLdTkW
 VNgg==
X-Gm-Message-State: APjAAAVHb0OtQcwHCF5uf/45hS6FBlHuulVUQA32mBDYaqPoV5UGiMlF
 H53Pk21QOT/OTrg034Dl1g==
X-Google-Smtp-Source: APXvYqwaimesWPD/s9AtUlqC9UWr76llfcjVPJ/inH6Pf263cKIywJYT06l587vdDDb+Q4G/RHQ4Uw==
X-Received: by 2002:a63:cf4f:: with SMTP id b15mr34802096pgj.287.1582636099106; 
 Tue, 25 Feb 2020 05:08:19 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee1:f355:dcbb:6353:6580:5d41])
 by smtp.gmail.com with ESMTPSA id 5sm17241541pfx.163.2020.02.25.05.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 05:08:18 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: marcel@holtmann.org, johan.hedberg@gmail.com, davem@davemloft.net,
 kuba@kernel.org
Date: Tue, 25 Feb 2020 18:38:09 +0530
Message-Id: <20200225130809.32750-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
