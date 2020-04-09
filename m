Return-Path: <SRS0=Oybv=5Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E16C2BB55
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Apr 2020 08:28:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200452082D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Apr 2020 08:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrAgMiav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 200452082D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D1BD5878E5;
	Thu,  9 Apr 2020 08:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eh36wFaGsjGu; Thu,  9 Apr 2020 08:28:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A9E5C87823;
	Thu,  9 Apr 2020 08:28:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 958F3C089F;
	Thu,  9 Apr 2020 08:28:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B913C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 92D7D869BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wjh1CHumzOB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:28:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7E868869B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:28:43 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id z3so982347pjr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Apr 2020 01:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+fG/Gev7HaxlZXPpDg5ZggbcqVNpIERCkV8tz6C91rI=;
 b=VrAgMiavqperU/qmbs/nYjs3R21Z28HnwtwMqUnz+kDRaWK1/ZgKpBoHUtv5W1KCFZ
 bxslrV0uDn0OCQeOo3WZ5AJUYGxXqQ695kC9UHyoy7gG1XspSihCx+CU89l6wPOp6V5y
 hG+eMGGzgOuXBePYk7ka5BB+R9mdIcab0K+N7UEN15opjjWlE9NlBFzQuTKI/KH/Q/fA
 ncXvjCpHv2RMY0sUgIwoIwdP52Vt7INaIGjY7NG+KiKG2CUqb408W/RlxvB1PtQ/XfIj
 qDzBcNS1EyfWfqV8yTUdHDLHOkGJnRiUSOfHBdwnSn1avhWyQL3LV14rk7VVZ2vUcDhZ
 ZZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+fG/Gev7HaxlZXPpDg5ZggbcqVNpIERCkV8tz6C91rI=;
 b=GR3k43S1jAieTFUC1Bf4YVpHA+mEs9KtT2IFtywdagGlKvNrSLubeTxkGrlr5q+QEd
 75fS/7RWwOjnuFvkVYt08g0hnif3lTShye8VrO3kbcl8voN1U5mGcvCbQaIFblBlMnG6
 77h1/90QTm170eemU/quLBUsY0rLwJsYq909xAi0rOO4EJUMwvS3KQvW854jt246oud0
 /0tZl62resh+FU5j/qyAyGY6YZQPIiZV94u1ekPpTsQyAyJUD8LAMWd5EoMJTeFXoAR6
 k36MgqPF5dRmVUdc9cvrjPR/RV6WKbaSvKd5a6+m9xBCKIIgOu8NXkiyKISSjOo5yIiU
 eF3g==
X-Gm-Message-State: AGi0PuYPJHP6nfN5dzHqj6LrI74lz8cOM0I67JwE8PbGG9iQf9RuwVAi
 6fF56CpipGpDTHVBXPce7g==
X-Google-Smtp-Source: APiQypJLoXasAxeWqbcLrxY25TSunFHpWMUBhjAxPsjLnDLzDMGnFUlBC1/m+GQba0kNmUo48yAUvg==
X-Received: by 2002:a17:90a:8c18:: with SMTP id
 a24mr10599111pjo.43.1586420922983; 
 Thu, 09 Apr 2020 01:28:42 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:13be:8fdf:25a2:66e2:761f:9d4c])
 by smtp.gmail.com with ESMTPSA id r189sm17762095pgr.31.2020.04.09.01.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 01:28:42 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	kuba@kernel.org
Date: Thu,  9 Apr 2020 13:58:22 +0530
Message-Id: <20200409082822.27314-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/4] net: mac80211: util.c: Fix RCU
	list usage warnings
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

This patch fixes the following warning (CONIG_PROVE_RCU_LIST)
in ieee80211_check_combinations().

WARNING: suspicious RCU usage
[   80.933723] 5.6.0+ #4 Not tainted
[   80.933733] -----------------------------
[   80.933746] net/mac80211/util.c:3934 RCU-list traversed in non-reader section!!

Also, fix the other uses of list_for_each_entry_rcu() by either using
list_for_each_entry() instead (When mutex or spinlock is always held
in the function) or pass the necessary lockdep condition.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/mac80211/util.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 20436c86b9bf..f4b0434024c0 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -254,7 +254,7 @@ static void __ieee80211_wake_txqs(struct ieee80211_sub_if_data *sdata, int ac)
 
 	sdata->vif.txqs_stopped[ac] = false;
 
-	list_for_each_entry_rcu(sta, &local->sta_list, list) {
+	list_for_each_entry(sta, &local->sta_list, list) {
 		if (sdata != sta->sdata)
 			continue;
 
@@ -719,7 +719,8 @@ static void __iterate_interfaces(struct ieee80211_local *local,
 	struct ieee80211_sub_if_data *sdata;
 	bool active_only = iter_flags & IEEE80211_IFACE_ITER_ACTIVE;
 
-	list_for_each_entry_rcu(sdata, &local->interfaces, list) {
+	list_for_each_entry_rcu(sdata, &local->interfaces, list,
+				(lockdep_is_held(&local->iflist_mtx)|| lockdep_rtnl_is_held())) {
 		switch (sdata->vif.type) {
 		case NL80211_IFTYPE_MONITOR:
 			if (!(sdata->u.mntr.flags & MONITOR_FLAG_ACTIVE))
@@ -3931,7 +3932,7 @@ int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
 		params.num_different_channels++;
 	}
 
-	list_for_each_entry_rcu(sdata_iter, &local->interfaces, list) {
+	list_for_each_entry(sdata_iter, &local->interfaces, list) {
 		struct wireless_dev *wdev_iter;
 
 		wdev_iter = &sdata_iter->wdev;
@@ -3982,7 +3983,7 @@ int ieee80211_max_num_channels(struct ieee80211_local *local)
 			ieee80211_chanctx_radar_detect(local, ctx);
 	}
 
-	list_for_each_entry_rcu(sdata, &local->interfaces, list)
+	list_for_each_entry(sdata, &local->interfaces, list)
 		params.iftype_num[sdata->wdev.iftype]++;
 
 	err = cfg80211_iter_combinations(local->hw.wiphy, &params,
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
