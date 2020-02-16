Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45DBC2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 14:47:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7284420857
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 14:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtDv+8SJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7284420857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 575F820446;
	Sun, 16 Feb 2020 14:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZBjLkYJRTWE; Sun, 16 Feb 2020 14:47:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1C19820407;
	Sun, 16 Feb 2020 14:47:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F8A5C08A0;
	Sun, 16 Feb 2020 14:47:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2A41C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 14:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9C0B885CD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 14:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87qfftn77M95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 14:47:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1A4E285CD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 14:47:33 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e9so6059294pjr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 06:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/yxpPs59abqNVjxSYNlOB5b7zvZlqst1mIuiTiFCWSM=;
 b=MtDv+8SJmurZEHiKTetbGWqHr1+D9ZFirpF2VAcMFMR5FKWTQUgJascjxn6wo3VSJ6
 c/8OeKK66WVHn4IZNXfBQr3kMo8VGv0asPB8ERRVQ/SNG0O+vum8rb6n5f6vD75LEWqb
 02HV7Zdv+0Nei29jy+oP6WyxVi8K/eggvooFsnN2OKc0dwphYOY+7+r6n97tcCGWxW8Z
 Z4gm4z7oY4lfEo1Jsp9HtCfTFKDF15tWFeLtF56YHmJVWrrHCE6uQNTfdGC3vFJcZUO9
 fYvMI8dtt3xVIK9DQ6uN7LaYAurOx7UtspBYpyqQ7bqPjFKHvkNSWKZUEUg3KZuysJjX
 IDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/yxpPs59abqNVjxSYNlOB5b7zvZlqst1mIuiTiFCWSM=;
 b=ACuWl7skfgYyjo3GVajtq2BgVHkIaiRcND+44gEswyBJbFn+8qXg0K3QFrxBabcHWA
 uARYw/EMMStXS9sX9FDllY2O47qEHJIcJV8tb7gJMzPQioOGklmwaC6fj5f+DwBwbkq1
 +fxBk39fJzmNwSqMzctsqMuoMCTxfPwHRP2uuYSUG0QfmTxAD0StxIHJcCbKhTII5GXE
 3KZS6LikEIri94xBmTm3+hQfL2+E2D75eCwf8wjXXAlpqm4yfPE2oR0GOSfbh9Svyyu5
 wVTrpC/muLbg2wxpxxauqUZPBESDwVUEvKewPArpW70gVIXEO1pvaMgjQDy/S5GNkmA9
 /3Lg==
X-Gm-Message-State: APjAAAUnwsL0Oj26OdVA5CmC04RFfZE45Ud57Z4SfZJrEZSEMjCpMe/d
 HG1AXmYb1exBVtihC53q/g==
X-Google-Smtp-Source: APXvYqz4n3ibLmZFW/6xgnZe1Gc126eGPEgdC06A/0OYeZxnDP8axu+/9nkB06ALCtMl7qIx0JIxlw==
X-Received: by 2002:a17:90b:3cc:: with SMTP id
 go12mr14713869pjb.89.1581864452748; 
 Sun, 16 Feb 2020 06:47:32 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:d03:50cf:55e:33bd:4fac:caa])
 by smtp.gmail.com with ESMTPSA id t15sm13683049pgr.60.2020.02.16.06.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 06:47:32 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: mareklindner@neomailbox.ch, sw@simonwunderlich.de, a@unstable.cc,
 sven@narfation.org, davem@davemloft.net
Date: Sun, 16 Feb 2020 20:17:18 +0530
Message-Id: <20200216144718.2841-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: batman-adv: Use built-in RCU
	list checking
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

hlist_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to hlist_for_each_entry_rcu() to silence
false lockdep warnings when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/batman-adv/translation-table.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 8a482c5ec67b..0e3c31cbe0e8 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -862,7 +862,8 @@ batadv_tt_prepare_tvlv_global_data(struct batadv_orig_node *orig_node,
 	u8 *tt_change_ptr;
 
 	spin_lock_bh(&orig_node->vlan_list_lock);
-	hlist_for_each_entry_rcu(vlan, &orig_node->vlan_list, list) {
+	hlist_for_each_entry_rcu(vlan, &orig_node->vlan_list, list,
+				lockdep_is_held(&orig_node->vlan_list_lock)) {
 		num_vlan++;
 		num_entries += atomic_read(&vlan->tt.num_entries);
 	}
@@ -888,7 +889,8 @@ batadv_tt_prepare_tvlv_global_data(struct batadv_orig_node *orig_node,
 	(*tt_data)->num_vlan = htons(num_vlan);
 
 	tt_vlan = (struct batadv_tvlv_tt_vlan_data *)(*tt_data + 1);
-	hlist_for_each_entry_rcu(vlan, &orig_node->vlan_list, list) {
+	hlist_for_each_entry_rcu(vlan, &orig_node->vlan_list, list,
+				lockdep_is_held(&orig_node->vlan_list_lock)) {
 		tt_vlan->vid = htons(vlan->vid);
 		tt_vlan->crc = htonl(vlan->tt.crc);
 
@@ -937,7 +939,8 @@ batadv_tt_prepare_tvlv_local_data(struct batadv_priv *bat_priv,
 	int change_offset;
 
 	spin_lock_bh(&bat_priv->softif_vlan_list_lock);
-	hlist_for_each_entry_rcu(vlan, &bat_priv->softif_vlan_list, list) {
+	hlist_for_each_entry_rcu(vlan, &bat_priv->softif_vlan_list, list,
+				lockdep_is_held(&bat_priv->softif_vlan_list_lock)) {
 		vlan_entries = atomic_read(&vlan->tt.num_entries);
 		if (vlan_entries < 1)
 			continue;
@@ -967,7 +970,8 @@ batadv_tt_prepare_tvlv_local_data(struct batadv_priv *bat_priv,
 	(*tt_data)->num_vlan = htons(num_vlan);
 
 	tt_vlan = (struct batadv_tvlv_tt_vlan_data *)(*tt_data + 1);
-	hlist_for_each_entry_rcu(vlan, &bat_priv->softif_vlan_list, list) {
+	hlist_for_each_entry_rcu(vlan, &bat_priv->softif_vlan_list, list,
+				lockdep_is_held(&bat_priv->softif_vlan_list_lock)) {
 		vlan_entries = atomic_read(&vlan->tt.num_entries);
 		if (vlan_entries < 1)
 			continue;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
