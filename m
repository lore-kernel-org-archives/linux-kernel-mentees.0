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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A18EC34050
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 10:01:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A252464E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 10:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1LWdc/X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A252464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C3183203F4;
	Wed, 19 Feb 2020 10:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RJ0xoATlNX9; Wed, 19 Feb 2020 10:01:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6B13E2039C;
	Wed, 19 Feb 2020 10:01:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60B68C1D81;
	Wed, 19 Feb 2020 10:01:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3038C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AF22E8587D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id om4xusKquwHj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:01:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3639E8518E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:01:35 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z7so12459788pgk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1EXylD9M9pyp6RCZrxC0U5DPcWHq62ndaaHnByK73qg=;
 b=h1LWdc/XtVhfk8KjtHhg4fU8weGskZPlQRBh5/dxOKJooTKO6sqSyQcabvn/E5pfPB
 qHxDiS5im9Rv2NXhglKKTBJTlmdcA0rbXMb047X51M63ZYkgcvE0TkwB8AjRTrc7NY56
 oMd4FQer5pztQ+WEc5OGCV7FqpisfkCYzn38geyLlsWd3JCFiZ0abJEuKkhqrEVSlEpd
 q8oxbcP8n7mp0YPGJwVfWvhylm2poJO0QdF06EbcTHUcgZ7PsxE9ZCrwPEDysmzvq5vt
 sfkfnoppF867VfHRaOASJ+AF7D5p1VcnWpGqyfHIAZkq+YQ3fu/HlP6yIXQ/IPet6sY2
 8Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1EXylD9M9pyp6RCZrxC0U5DPcWHq62ndaaHnByK73qg=;
 b=eivclILhKvlvqTMRqWsuvhf8xZKHMd+fjK64MIBY6crzVZnokwqtL/Vu1l/cSq8IhU
 /E4zai6kK/bL/3q0U2faatiBgijfmhhvO9DzRs3PdOqGeb/EX9SC9kzfAxOTibPOB0vo
 LZSpgPyHIvyn+Tlaog7nHEtW22QP890hd+wEOBKVHdFPzNvfWosJJbi4MhSwsJwDjXeo
 /jr+oSR2Rg3aQPdTgwYC6EgH5obwQ8gzOuURothFafA+W9k3KlUXxxUla8QRqMtFiMYc
 yfW0u5a4ZhjnAa+rfOnM1Nxom2G7r/Jo9nKsKR1PpQyyGanNtSfi4/rb8qOFkCEZRqng
 Ujug==
X-Gm-Message-State: APjAAAVngei5l1PtpDk9xlkkf8FjgOwqg3z1SvPTttKJHrI3UM7fsFBo
 y18Yl+vGHT18O3f86ola8mQ=
X-Google-Smtp-Source: APXvYqxUF3j/7VaJSopwF5M/zdTNKYwnecAFNAI6SMP/6B46CpsqGYOYKoKBjr2bnTQZ6Mht9Uj5Nw==
X-Received: by 2002:a62:ac03:: with SMTP id v3mr25792332pfe.17.1582106494797; 
 Wed, 19 Feb 2020 02:01:34 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.220])
 by smtp.googlemail.com with ESMTPSA id q17sm2040779pgn.94.2020.02.19.02.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:01:34 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 19 Feb 2020 15:30:11 +0530
Message-Id: <20200219100010.23264-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RESEND] net: hsr: Pass lockdep
	expression to RCU lists
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
Resend:
- Remove failed delivery recipients

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
