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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022BAC34047
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 15:19:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA06124656
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 15:19:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ah7uoNUV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA06124656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A262E86974;
	Wed, 19 Feb 2020 15:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3e8ZgKZpeDEf; Wed, 19 Feb 2020 15:19:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E34F846BF;
	Wed, 19 Feb 2020 15:19:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C530C1D81;
	Wed, 19 Feb 2020 15:19:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D77BC1D81
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 15:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0F7DA879FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 15:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sg-UKTdOuD80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 15:18:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 39D5387A15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 15:18:32 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u12so248152pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 07:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ukKkOw2CD1p6V3m08F/J1FLQ/Kv80Rkqm5DlFEyeEwo=;
 b=Ah7uoNUV021eb0uXbGTT4n8DSdPnmntOsRtdO0sIaVGmDz6Mx9DRCWkzlQUZdixw+q
 EWquftTkt68WCGlW/aA5nVyhgl+UHA3gsnBdG89IY8cpIjgmPUkSlbSABOsRoUQRQiP2
 tRiY/eEHI2tZExjQkFe8laVxjuRMHuzuVK45dlKZio/IG/07TcGQVIzIxWHJfXrtvd1a
 HtRVxwNVVRPt42qadehr7FMIyLth4UrIOnrhkVj5fNTULu6IlHaSMd/bRTPytPu9Y5vU
 PaRSz9bSbBntBZ+Ij+W79CdwpGDWwZ003hXlhvFCJlR5NffYtNcMGNj1KyqapsoM5/VY
 K/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ukKkOw2CD1p6V3m08F/J1FLQ/Kv80Rkqm5DlFEyeEwo=;
 b=JgKzhdDN5fDb8A5XOoPU7vtkikg9ZdVRwn+v7hk365u+dymXFLa8xFy613CN8iKx1J
 nQugzaJUWmurKTemEtgXUy3ISYbKFc5ys6lfIUdVIYAaFGZ15V+et4cXtCFnYoiYM2/r
 ceSWAHwlH/YZAc/kgenqDWNgu7KBF21K2Q7lhLvcl5P7P35Z/aF4zoSPYZRylIaegmh0
 k+3dUh3nPG8SbU2aJHw3nLxCNObBHBUc+0mvXzuu4HyGr6fueibSpD6t1VSESIIrdxtM
 M2YODPU+j5VaNNMXKmmriRZPZ2fRDUh9Y6tM7KkNykmTorakKGUuW6kwUmcNmaEEI63X
 /xiQ==
X-Gm-Message-State: APjAAAWN9IwLUNIyM5HnhAnZ4TtIhoyE66pI3xcBq3cUWPL2znlcP8fF
 du+blc3hZcyMIrB3A3OV9A==
X-Google-Smtp-Source: APXvYqz7z38VUX56nB4cpmN4ssPqGh9I7Dl7gnU0/yRnff1inv5wjyvzdV1rumvg9fOMEZuF/4bZng==
X-Received: by 2002:a62:78c1:: with SMTP id
 t184mr26533069pfc.222.1582125511796; 
 Wed, 19 Feb 2020 07:18:31 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee1:f898:fdeb:e0c7:deeb:a606])
 by smtp.gmail.com with ESMTPSA id v5sm45906pgc.11.2020.02.19.07.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 07:18:30 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: roopa@cumulusnetworks.com, nikolay@cumulusnetworks.com, davem@davemloft.net
Date: Wed, 19 Feb 2020 20:47:46 +0530
Message-Id: <20200219151746.1050-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org,
 bridge@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] bridge: br_stp: Use built-in RCU
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

list_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/bridge/br_stp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_stp.c b/net/bridge/br_stp.c
index 1f1410f8d312..8be12452071b 100644
--- a/net/bridge/br_stp.c
+++ b/net/bridge/br_stp.c
@@ -52,7 +52,8 @@ struct net_bridge_port *br_get_port(struct net_bridge *br, u16 port_no)
 {
 	struct net_bridge_port *p;
 
-	list_for_each_entry_rcu(p, &br->port_list, list) {
+	list_for_each_entry_rcu(p, &br->port_list, list,
+				lockdep_is_held(&br->lock)) {
 		if (p->port_no == port_no)
 			return p;
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
