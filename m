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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5704C2BB54
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Apr 2020 08:29:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B79F020A8B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Apr 2020 08:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP2q/UIm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B79F020A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8DFBE87916;
	Thu,  9 Apr 2020 08:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7EdP-mpuHE6; Thu,  9 Apr 2020 08:29:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 302F8878E5;
	Thu,  9 Apr 2020 08:29:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2087DC089F;
	Thu,  9 Apr 2020 08:29:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E241C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8E19A869B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pvdoy3dTM8FT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 35E46854D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Apr 2020 08:29:18 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id mn19so993394pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Apr 2020 01:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=thmb2MaUkAYwWEknYChKiLfRBjC26khbulpjo27xBxY=;
 b=IP2q/UImPra//LmWIBAZ+IhOWsM8OCnVf+xQw5pG52z6SrmJwJZiaotOEUZ8mKGafH
 uzuNLilzjhYGUngIrdbMtEFbnAMI5dzle15sBBfWVQLPnlZn8ICMi0nGPtxcgryAU75K
 oJKLxnMkTlRRsSxqbN3DvJTcobEuHgJ240erVvAm5BiwUBXWPy11Z0O2woJ48cNcEcta
 NaACUYq+4l4lmMcNDkrNCL6HCUdEFSfdNktjmi67pZVW4zegjXoF9saAgQONuQ4suwk0
 4ZbpKYRFCQ1M0gznRBve4tjKLwuAN9ht2kvRhNe5qrERFD+o+R/VPYm+qFLnaDGPvmY9
 tZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=thmb2MaUkAYwWEknYChKiLfRBjC26khbulpjo27xBxY=;
 b=klbziZbfZvxMQ9zq8MT4sIuowpy8nN0MgFB1v9asfxLHDJYgjkICvOyrsmk4Erqxf/
 vn/4rdirsT7I5uCbroab99f5cq9YB1J4s1FRFhVZFKOFI2J0eGj9rK5HVYJu9d+JzfRO
 oMBTXJW8A0AAkVQamif2YyHtuBXpq0Zgrf0f0MdMD8dIttzsaheqNAkzdfQ+j/IrxobR
 MZei0b9QTLFzWEjXJZDqFBoiU1N7CVO1HwexWYHDK4mA59gGcRS3dZsACWF/OZH6Y6Gm
 EK4N14N+99pI0iaO8RO8Ypnkbs5wrHI3PVaix4jjVByF9uEbJs/mGDJSDT2kbR+ybG8z
 kwCw==
X-Gm-Message-State: AGi0Puawa3zzumXkTSBUGNRjJprCjnI9juoIh8mZCeAy29hlI6np0zAg
 aXR2V775xrVj8EB8yskgqg==
X-Google-Smtp-Source: APiQypL1Nj1lCDjuCVFwMYpqxk0cEfBJHr8sL+RJosyfsPsRH8j2Im1XHq+VTTkIBFpCE2s7AqCWKQ==
X-Received: by 2002:a17:902:aa84:: with SMTP id
 d4mr11298193plr.158.1586420957884; 
 Thu, 09 Apr 2020 01:29:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:13be:8fdf:25a2:66e2:761f:9d4c])
 by smtp.gmail.com with ESMTPSA id o128sm18390653pfb.58.2020.04.09.01.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 01:29:17 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	kuba@kernel.org
Date: Thu,  9 Apr 2020 13:59:06 +0530
Message-Id: <20200409082906.27427-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/4] net: mac80211: sta_info.c: Add
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

The function sta_info_get_by_idx() uses RCU list primitive.
It is called with  local->sta_mtx held from mac80211/cfg.c.
Add lockdep expression to avoid any false positive RCU list warnings.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/mac80211/sta_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index f8d5c2515829..cd8487bc6fc2 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -231,7 +231,8 @@ struct sta_info *sta_info_get_by_idx(struct ieee80211_sub_if_data *sdata,
 	struct sta_info *sta;
 	int i = 0;
 
-	list_for_each_entry_rcu(sta, &local->sta_list, list) {
+	list_for_each_entry_rcu(sta, &local->sta_list, list,
+				lockdep_is_held(&local->sta_mtx)) {
 		if (sdata != sta->sdata)
 			continue;
 		if (i < idx) {
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
