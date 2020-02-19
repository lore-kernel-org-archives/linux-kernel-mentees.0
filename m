Return-Path: <SRS0=HLeX=4H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B3FC3404D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 09:53:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DFA2464E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 09:53:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u57rzFA9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39DFA2464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9A2D84B0F;
	Wed, 19 Feb 2020 09:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlvBGK+gNZ4a; Wed, 19 Feb 2020 09:53:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77CC784AD8;
	Wed, 19 Feb 2020 09:53:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E278C1D81;
	Wed, 19 Feb 2020 09:53:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E1D7C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EA94C203DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGMmOQW8oQxy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:53:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 46D5320357
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:53:24 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b185so1917206pfb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 01:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9v8+wIBub2qiLrO6UKbQxc1lcW/tT/d7asx+H//NX30=;
 b=u57rzFA9pzTtMdQVkpEyH91i0vMmE1fKyg+1p5GmPkcbJZXGbx2GxHJTN4+B9DtfQ6
 w1KoHvl5zcNbhWbjXEp/8Wbz23UDVorCbM8TrCS85deP9UG4NXuIB6ltRL4BcQjtUhUN
 jSenzfHBEkVDNcu9q9OeD3DFSseCHgSwcJ9ASJ51uKlaDWKk60oHc8mX6xQHVNOB9Gz0
 fBGry9M86uIgCidu0Ofb18szAinmsjYhHAVkVj3/y6p9v37WnZ5dHvZl9iKtbFfXMGUs
 aSZfJ8mHdKFxy0cOSlAvwmoQ/ah3ORgjqt8AHCBkEXvi9Nt8z+b4KZLmR1ptdAZcC79l
 OwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9v8+wIBub2qiLrO6UKbQxc1lcW/tT/d7asx+H//NX30=;
 b=rURu70OxtDV8zzegCXdgnBe7ROmVlMiZPaxpQyEOSSc3v0z14acziYa/Nhb+E8TgkN
 x+wF0FpzpsS/dU3tK3Ujdr/2bxHZqxTRax/2Ti/nu2Tf/SRtz6hgj4+DrsBL8MVKRsIj
 7/Iga4nof7xmYBA8o0pqAP1o1doRTkqxr6Roz2csrkfR/04w7B2yo5VGXbTqDcek5hod
 6A/rwaIc8r6sJc7kvXT7DYPyxpfEVCwEGtrztjh5oKTgOhFI9ULB4ZGJZR/t/kRuBTXF
 ROAgpzPiLzls8IW9mvbFesc9N1X1rg8BqMVtLW76ulA2YAPDonsg2fNGqzmu+wQYjdjR
 Sm7Q==
X-Gm-Message-State: APjAAAWxq62bKHzvofX/5ximmf4UooKVXBu+368tnY6bflUp4YpjHXW4
 YeZm9NJCN8nHl6L50YQ/Mwo=
X-Google-Smtp-Source: APXvYqyN5sxGSp5lOMX94IBT9XEXhNRJK9Ibb42qfRvKAGp1zdKgDaYVcSh+nz2Zj9q/TECBXgh1+A==
X-Received: by 2002:a63:5f4e:: with SMTP id t75mr26676074pgb.7.1582106003790; 
 Wed, 19 Feb 2020 01:53:23 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.220])
 by smtp.googlemail.com with ESMTPSA id t11sm2063907pgi.15.2020.02.19.01.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 01:53:23 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Arvid Brodin <arvid.brodin@alten.se>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 19 Feb 2020 15:23:03 +0530
Message-Id: <20200219095302.21987-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, --cc=netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: hsr: Pass lockdep expression to
	RCU lists
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

node_db is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of hsr->list_lock.

Hence, add corresponding lockdep expression to silence false-positive
warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/hsr/hsr_framereg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/hsr/hsr_framereg.c b/net/hsr/hsr_framereg.c
index 27dc65d7de67..cc8fcfd3918d 100644
--- a/net/hsr/hsr_framereg.c
+++ b/net/hsr/hsr_framereg.c
@@ -156,7 +156,8 @@ static struct hsr_node *hsr_add_node(struct hsr_priv *hsr,
 		new_node->seq_out[i] = seq_out;
 
 	spin_lock_bh(&hsr->list_lock);
-	list_for_each_entry_rcu(node, node_db, mac_list) {
+	list_for_each_entry_rcu(node, node_db, mac_list,
+				lockdep_is_held(&hsr->list_lock)) {
 		if (ether_addr_equal(node->macaddress_A, addr))
 			goto out;
 		if (ether_addr_equal(node->macaddress_B, addr))
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
