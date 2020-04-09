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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B25C2BB55
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Apr 2020 08:29:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE29520BED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Apr 2020 08:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUEXAxyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE29520BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8F23420015;
	Thu,  9 Apr 2020 08:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuXwakRhDJxy; Thu,  9 Apr 2020 08:29:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 03A921FEDF;
	Thu,  9 Apr 2020 08:29:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E36E1C089F;
	Thu,  9 Apr 2020 08:29:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC102C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DADD220015
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aTv4HKL4k2g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 54CB21FEDF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:00 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c138so4457324pfc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Apr 2020 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0HXV8vx9Be0BBihyhMob71nh1LkIaEr5epGWg9GzRAU=;
 b=MUEXAxyoTdSoolqIbRRVACRTGku/CrRdwrnfri3FU7m1CGWxvVxECyJzNjlzoqEsKx
 3F4wPoUnPw9Kuzp/PVK1EZi9PKkRunyMAcxg9R/YOyGp5tIrKrpjXWEUrlpLOJOWBzUD
 obPKIv5NLJclwMiHJMYvdi7BAiqeOxWl8X/mhTECRPJ9/Eld7HjSPlVuifZme/saoNlL
 r7USy8sMvD85yB/97jF8qGDDQ2P63+yhXJqbcB5PJrASY94EGnAi3CmWe/DK9SxyfXu3
 3EUfwTX31XHnMhbzoahy0Jh91k/5CiQiM9jr7e97x7EuVBBI/A0B6jKgznf21CII8MWK
 pJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0HXV8vx9Be0BBihyhMob71nh1LkIaEr5epGWg9GzRAU=;
 b=Sgddh3OcDR+UD21FQSOQmQwQrCMAVXftSRrQl5QYwWrwzISLnakTnwm9yNavc63hIP
 Wr8Ymw88dVG7uMMj2kVOpxT3kJ8wd4l5HA9F1dtRJUkphD6Tug+Rs2W7LTYiHHQCqIbd
 9DBBoLv7nl3gm30XmwB7JICh+meyOCUnNURbiHBPvGmghL1qAYlQM67P3dOv3ZQXakwq
 leEqEQLdMSF/azwyy3ee49E8FoA337abLQI+uqxIJtHIv2jyPSy3nTyynG8a8RD9GKbe
 uNY8B0g1b58alQ/MwPK8OPwJiKARnhWR++YrUiFTlGW8ZDIRe+0X6YjMexmZsd3KhPMd
 h+Og==
X-Gm-Message-State: AGi0PuZszCAMwBEx7s4JnRzE4UthFBE5OYIZp1jytVzR1Nv+McRVX3Oj
 aARBPyeKN7NjGSFIYcx8/g==
X-Google-Smtp-Source: APiQypJMUo7McfIjWzcXnjJmz+8h35KmF64lZDJ+qnUEu0I5lgVqNGuknsQBsn/cgMScS/uFl60oLQ==
X-Received: by 2002:a63:e56:: with SMTP id 22mr10914839pgo.173.1586420939939; 
 Thu, 09 Apr 2020 01:28:59 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:13be:8fdf:25a2:66e2:761f:9d4c])
 by smtp.gmail.com with ESMTPSA id h10sm17615674pgf.23.2020.04.09.01.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 01:28:59 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	kuba@kernel.org
Date: Thu,  9 Apr 2020 13:58:49 +0530
Message-Id: <20200409082849.27372-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/4] net: mac80211: scan.c: Fix RCU
	list related warnings.
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

This patch fixes the following warning:

WARNING: suspicious RCU usage
[   84.530619] 5.6.0+ #4 Not tainted
[   84.530637] -----------------------------
[   84.530658] net/mac80211/scan.c:454 RCU-list traversed in non-reader section!!

As local->mtx is held in __ieee80211_scan_completed(), no need to use
list_for_each_entry_rcu() (use list_for_each_entry() instead.).

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/mac80211/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index fdac8192a519..0860f028ab2a 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -451,7 +451,7 @@ static void __ieee80211_scan_completed(struct ieee80211_hw *hw, bool aborted)
 	 * the scan was in progress; if there was none this will
 	 * just be a no-op for the particular interface.
 	 */
-	list_for_each_entry_rcu(sdata, &local->interfaces, list) {
+	list_for_each_entry(sdata, &local->interfaces, list) {
 		if (ieee80211_sdata_running(sdata))
 			ieee80211_queue_work(&sdata->local->hw, &sdata->work);
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
