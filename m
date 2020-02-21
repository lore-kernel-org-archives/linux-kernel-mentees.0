Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2046BC35658
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:04:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7431206E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1O1i51i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7431206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B89E18761F;
	Fri, 21 Feb 2020 17:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLRRymehQFKE; Fri, 21 Feb 2020 17:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1971875B1;
	Fri, 21 Feb 2020 17:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BD7CC07FE;
	Fri, 21 Feb 2020 17:04:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8E55C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CCF0987D35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUmQxzoFdDh1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 484FE87D33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:04:01 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t6so1106789plj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 09:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OrtwbjkzZAaCxu6fxTwX/mVoWu62JfFRRGdv5Z4KXTI=;
 b=k1O1i51idMpFDe5dEonaVt7lv8r+IWCwHuI4KZfyZCFT+qwi7PmhYttbiKM4iTh7Au
 FHkTEXmjTQ0YsNa9zBZc7moIho4xBzOX35szcUBHIiB2NPenhGcHSrLWWTn1m+UL+5Fu
 ggxYBI3yEia96UReNK00nnCCGN9Ss4Nds+Li1ill5jBTM43AaqXCTnUvvMMSdbWJuskK
 4d7ILHS5EbbPgaxE+uMq5RJG90iYGD1jMYcQk3nklQQZqm9ZvPjyModNkdHPfh43+sqV
 MYMWz4pI65aEBvtzsRFzDtkZIV1JRl64DBLipv1zjqQRCf+QZqbsdSw8sieOLKMCu8VJ
 NSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OrtwbjkzZAaCxu6fxTwX/mVoWu62JfFRRGdv5Z4KXTI=;
 b=aUEUPMdBKEb584iJ+zqJHCcHv/LVN/pU7SQ9lk2+MOmUcj7Dy4qqTh3Xw0W4eXRygb
 e+hXjWa5LtZQM0IDuM9RScfGWd1LN5mWu3T8T7RhnAnnlg+qV19srXtO6iHUf14FKuot
 J+mgkNHbnbMmD1DGAUPH4mMtAlA+893HaGxUPLFBlk/JTh04ZKRmrpRKHFYGRqzzavZ+
 PENapGZXXHbuyFmE1YxBLvhaCEjGJ205R6a2hYVtEi3yD48Up459uIGO6BsDSM37e1U3
 BlAV/x1YjYMHVbe+G5cqxrKuEWlJhGWiSlOIT28DY3OruzJwzzR266KuHK5HW5h1YHC2
 LNpA==
X-Gm-Message-State: APjAAAWrA69EGuGypY/LbEGZ91gxtvSSlchmV7hgPfn12GrODHhXYVLq
 ebf8JrVPzqWvSCxXI7YnIQ==
X-Google-Smtp-Source: APXvYqzuJMjU0coS40IxkcA1Mlm/EiQPHemJds7FMfgoeAfomG9wYeA6VFDcdwYFvEoIyxpsmBAmgg==
X-Received: by 2002:a17:902:aa45:: with SMTP id
 c5mr36394887plr.113.1582304640841; 
 Fri, 21 Feb 2020 09:04:00 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee0:fe5e:d03d:769b:c838:c146])
 by smtp.gmail.com with ESMTPSA id z4sm3280785pfn.42.2020.02.21.09.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:04:00 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: john.fastabend@gmail.com,
	daniel@iogearbox.net,
	davem@davemloft.net
Date: Fri, 21 Feb 2020 22:33:47 +0530
Message-Id: <20200221170347.20526-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: core: sock_map: Use built-in
	RCU list checking
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

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/core/sock_map.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/sock_map.c b/net/core/sock_map.c
index eb114ee419b6..c1549f189b0d 100644
--- a/net/core/sock_map.c
+++ b/net/core/sock_map.c
@@ -546,7 +546,7 @@ sock_hash_lookup_elem_raw(struct hlist_head *head, u32 hash, void *key,
 {
 	struct bpf_htab_elem *elem;
 
-	hlist_for_each_entry_rcu(elem, head, node) {
+	hlist_for_each_entry_rcu(elem, head, node, lockdep_is_held(&bucket->lock)) {
 		if (elem->hash == hash &&
 		    !memcmp(&elem->key, key, key_size))
 			return elem;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
