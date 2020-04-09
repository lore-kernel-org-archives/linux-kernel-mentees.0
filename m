Return-Path: <SRS0=Oybv=5Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27F5C2BB1D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Apr 2020 08:29:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 969FD2137B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Apr 2020 08:29:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeBYraYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 969FD2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6B55C203B2;
	Thu,  9 Apr 2020 08:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISB9H9tGjpIk; Thu,  9 Apr 2020 08:29:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 456C91FEDF;
	Thu,  9 Apr 2020 08:29:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41934C089F;
	Thu,  9 Apr 2020 08:29:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EFC7C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7AC65878FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aPcK9TZfh8Pe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 162EF878F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:36 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id cp9so857673pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Apr 2020 01:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=F8gyLVop1Ch0gKbGVHgodmcnCvN85X6SPXoRalm/4uY=;
 b=UeBYraYaZuRxL0liXfpT3eVN66/M7EoV5rBCI8IzWjSmRtb+2fS8VCoKQMRNiiNNPI
 GQtwO3Bb29klU3jizxQRTERoAEXMyuzs1GZ8SHeaPbBLrD4BxH76imlRAO696yJeT/r2
 qBIrWD7A+ldxeRNDjELWGTGbyz2IHckScRapPjH+TRr2QELy92KzJehjWMqTb4aTYhtu
 6onqsCgA3u6/XIdsuxQIbr6F331I1soaJ+j5c4fo43C9LhUUj+dNReGxEjJfbh6LKXa4
 3cGcDbF00vMoIY6Givp1/PKfafreL5o5/vA6obHT0zDpScse921LkE8zqJb/dXCvp59B
 Osyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F8gyLVop1Ch0gKbGVHgodmcnCvN85X6SPXoRalm/4uY=;
 b=ogVehhu20T+06neD4OCu+KSUKFhzwNy+eCRpMclPgvQs1W0SDkvuHvOCYKIBdFzwSP
 LXjm8BtwG82Ey/lqVfbdPO6vcjiJiLoLIyaH/wuYYB24uSKv/WDwBN5cvqqDkUrB3utz
 YFcGPK7mUsPw06UttyBZ/s97h1gk/8Gn3B8kM12+m0Kofjx5yQvmUvRaowGIlnAnJTon
 uPOjcd9ICNGPC5evm3TJAt6LRCgxG42PhCBhdOR4O+0NjN+EcSCJp+Cahf/U+kfetCBV
 P1CyTbXa1cZ48ymO68RTotxxBIwHYhRAKidKceaeGJKEndH1US2OgLymdAUo0yBUcYnK
 eq7g==
X-Gm-Message-State: AGi0Puazi3fA9BHL4Gw8NrDo+XrLQolBKzxHgM8XVgzvmLPNZu88BZYx
 yRj1cjkSE3yvn9rJGvA0wg==
X-Google-Smtp-Source: APiQypJOJq7j0sm89Vt3qi8RrEHe8B14IxsT3T/FfEhZcmU+VsnMmS2Hw8QCmcgk7K/Ke/8ZAy4FBQ==
X-Received: by 2002:a17:90b:24f:: with SMTP id
 fz15mr9986110pjb.138.1586420975683; 
 Thu, 09 Apr 2020 01:29:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:13be:8fdf:25a2:66e2:761f:9d4c])
 by smtp.gmail.com with ESMTPSA id y19sm19170866pfe.9.2020.04.09.01.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 01:29:34 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	kuba@kernel.org
Date: Thu,  9 Apr 2020 13:59:25 +0530
Message-Id: <20200409082925.27481-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 4/4] net: mac80211: mlme.c: Add
	lockdep condition for RCU list usage
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

ieee80211_add_vht_ie() is called with sdata->wdev.mtx held from
ieee80211_send_assoc(). Add lockdep condition to avoid false positive
warnings.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/mac80211/mlme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 16d75da0996a..ef64b3e91ce6 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -590,7 +590,8 @@ static void ieee80211_add_vht_ie(struct ieee80211_sub_if_data *sdata,
 		bool disable_mu_mimo = false;
 		struct ieee80211_sub_if_data *other;
 
-		list_for_each_entry_rcu(other, &local->interfaces, list) {
+		list_for_each_entry_rcu(other, &local->interfaces, list,
+					lockdep_is_held(&sdata->wdev.mtx)) {
 			if (other->vif.mu_mimo_owner) {
 				disable_mu_mimo = true;
 				break;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
