Return-Path: <SRS0=qNNM=4K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C279C35673
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 10:21:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1040D2071E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 10:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1/3ABOe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1040D2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C42BC84F33;
	Sat, 22 Feb 2020 10:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiGvlNPrC9aH; Sat, 22 Feb 2020 10:21:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AFFD9849BE;
	Sat, 22 Feb 2020 10:21:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A46E5C1D81;
	Sat, 22 Feb 2020 10:21:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95CA5C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 10:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 91AD720396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 10:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2AVUNEkAU6t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 10:21:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id E7A8C203E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 10:21:37 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id j15so2320531pgm.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 02:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EvDiT7bfIhipTWPuk+o95uS98pfW7H0yCdQ9Sfbo/Ig=;
 b=E1/3ABOeJQH0wnuX05IolVmIzSvEmtPAQMAKISZRE2fJdP4fBRe0LzXpHBx0nbm2Yg
 lbQgRPmdPW2NVHfTSiMcq2H1nq9eZJCEm3LI6QpEmGESMe7eryC9V6t5CQEe+2qUExb6
 t4+djDOoQcjMF7AnYmD1vYKdIqS61aN0vSirk9KlUFq6vWvGAOX11edipD39TDR57tv9
 itNEOpo9JNzTejTF9m0WNGX3It/h0umtzpGcidkTTyq63GBC1N2cQgdl8QuAv+zpr2mn
 45ZsKYRnx9mGvpeqUnb2vIRZfhfLM5cw5ncI4t21CVsOvUgiUPMtLgTJM4yvANTIoKoo
 Dksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EvDiT7bfIhipTWPuk+o95uS98pfW7H0yCdQ9Sfbo/Ig=;
 b=taTSeE+5qwqOOSv4Hk3vOqSiW5tkRy3neVGd29hmuSov0XX6l4GF3KN+/vKYAT7rbA
 o7J1qWkloTROWyQx0cxGgrfRaEFVfCna6V6VIlH2G7WUPYBly39yaWUTE9c1gXA1PwcS
 za2SZWZciZIfZZjBQFAp8OubpCgEegzQPvPbvb9jI0V3GujhsuOSYAxFd69D0XbSt7Ec
 hVhs8RJZDGEDxBj7cDv5Zkvl9QktYU1Bp89UfV490aJolIbo7jX6pIK90fsZX8kCCK2F
 jeTqvtI3Z6cuvNeqcpqNFzi5CDr2Qi5O627Qe+NgAR58Z++EHNdwV5OWUobr2WZOM1rr
 /0dA==
X-Gm-Message-State: APjAAAVn2UU/P1on0xMhZZrZadbevUtgDrt+sF37EcJxdXGhNDgNsjwk
 71iSk8ltLoaz59cJ9SUHNg==
X-Google-Smtp-Source: APXvYqxkjfb1mnSYTDk9CIGFnAcTYxjBa2sZc0qY+qzvciaOoKV49y+B/rTlCXGag1kwqiL1Eb3YpA==
X-Received: by 2002:a63:d003:: with SMTP id z3mr41300183pgf.448.1582366897473; 
 Sat, 22 Feb 2020 02:21:37 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in ([112.79.49.48])
 by smtp.gmail.com with ESMTPSA id w6sm6237352pfq.99.2020.02.22.02.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 02:21:36 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: johannes@sipsolutions.net,
	davem@davemloft.net
Date: Sat, 22 Feb 2020 15:48:31 +0530
Message-Id: <20200222101831.8001-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: mac80211: rx.c: Use built-in
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

list_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/mac80211/rx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 0e05ff037672..0967bdc75938 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3547,7 +3547,8 @@ static void ieee80211_rx_cooked_monitor(struct ieee80211_rx_data *rx,
 	skb->pkt_type = PACKET_OTHERHOST;
 	skb->protocol = htons(ETH_P_802_2);
 
-	list_for_each_entry_rcu(sdata, &local->interfaces, list) {
+	list_for_each_entry_rcu(sdata, &local->interfaces, list,
+				lockdep_is_held(&rx->local->rx_path_lock)) {
 		if (!ieee80211_sdata_running(sdata))
 			continue;
 
@@ -4114,7 +4115,8 @@ void __ieee80211_check_fast_rx_iface(struct ieee80211_sub_if_data *sdata)
 
 	lockdep_assert_held(&local->sta_mtx);
 
-	list_for_each_entry_rcu(sta, &local->sta_list, list) {
+	list_for_each_entry_rcu(sta, &local->sta_list, list,
+				lockdep_is_held(&local->sta_mtx)) {
 		if (sdata != sta->sdata &&
 		    (!sta->sdata->bss || sta->sdata->bss != sdata->bss))
 			continue;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
