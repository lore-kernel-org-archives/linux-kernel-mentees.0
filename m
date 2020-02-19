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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E9CC34047
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 09:36:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3BE7207FD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 09:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFl+Rpgh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3BE7207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A13B2878F0;
	Wed, 19 Feb 2020 09:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mz5UJM6VzP1i; Wed, 19 Feb 2020 09:36:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4475787860;
	Wed, 19 Feb 2020 09:36:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BEA7C1D81;
	Wed, 19 Feb 2020 09:36:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97F8EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8741C85D78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIgbeTyUeHjW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:36:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 016EC85A58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 09:36:08 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t6so9323825plj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 01:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USv22fMY4lRbm7kdOlrco6KeUFWgxCIZrYv0NUecR8k=;
 b=mFl+Rpghcx4xs9gygrl7xbkfupYFtIeXXg7A2VrlMXSkKuMQsWKeCG26GbJDCiOieA
 OjvFeZpZfmYjIpBwwOBC9csCzviJo3jbxes07OuwfMKnYxJUcVKvyfaQepkrHlLQx9es
 OV7Iu2BxOSRlY1uWn0azWWlBlxhrfAL1rnIEVUnSViqd4vKaKk30ZnHvziLZcbICXXdJ
 rLShTFl9eQRoiKGW0P2xPeeBunLdmhwGgSpuuQMZFkTJMTClvncjNGMTqkyzJhTPZ7l7
 bVuNYv9kA+TX8kwieNjO4JqyjO3IVcfqL78VqmZ1CUZaxtive881yHsaUaEmaKDPtOo0
 yKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USv22fMY4lRbm7kdOlrco6KeUFWgxCIZrYv0NUecR8k=;
 b=Nn1AOCKHHEM46E4PUy6vG3HK7uK3964mY0R+CbApm3rdIi8ea7XcSsehn3EFggXPf8
 3OnF6EOr/y8cOZP3OKAFTdSviUDt1c14fepRdMW212M0N4vd0s7bmxzEIHa9liPY1eeY
 bpBdnMzc0/BePeet7CeJaesva1UCBeRdjAbxaAhlD6q01QOs4LVKIAmH2YIYqMJbakvL
 HUm/YhdwTB7mESkPtK7X64kkq6zuhztr8byflbpLMd53y0YVCzD5OgMPuO2efiIt5RCw
 o2MjUypuJkiEfGEBWnECW1aGP33VrEntX/dkbiY1WzPWEbwyxdlhB2vNW25i8H5gaPe+
 LrJQ==
X-Gm-Message-State: APjAAAWYZKKVA9Sqj/ZDB2v9VgGw3fXKDdkjBISl3qf3C7mu1uRorHHs
 L/VALqujlloaEpcYpvTU62c=
X-Google-Smtp-Source: APXvYqyK7T17usTuMnhZLEVXZVGy6SV0GxYbz6ukrtcwQEV2x5dPjBIC/2rZ3TlaqMsCMFAuKp/yxQ==
X-Received: by 2002:a17:902:9a09:: with SMTP id
 v9mr24385277plp.341.1582104968248; 
 Wed, 19 Feb 2020 01:36:08 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.220])
 by smtp.googlemail.com with ESMTPSA id x197sm2119217pfc.1.2020.02.19.01.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 01:36:07 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Chuck Lever <chuck.lever@oracle.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 19 Feb 2020 15:05:05 +0530
Message-Id: <20200219093504.16290-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] sunrpc: Pass lockdep expression to
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

detail->hash_table[] is traversed using hlist_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of detail->hash_lock.

Hence, add corresponding lockdep expression to silence false-positive
warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/sunrpc/cache.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/sunrpc/cache.c b/net/sunrpc/cache.c
index f740cb51802a..5db5f5b94726 100644
--- a/net/sunrpc/cache.c
+++ b/net/sunrpc/cache.c
@@ -97,7 +97,8 @@ static struct cache_head *sunrpc_cache_add_entry(struct cache_detail *detail,
 	spin_lock(&detail->hash_lock);
 
 	/* check if entry appeared while we slept */
-	hlist_for_each_entry_rcu(tmp, head, cache_list) {
+	hlist_for_each_entry_rcu(tmp, head, cache_list,
+				 lockdep_is_held(&detail->hash_lock)) {
 		if (detail->match(tmp, key)) {
 			if (cache_is_expired(detail, tmp)) {
 				hlist_del_init_rcu(&tmp->cache_list);
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
