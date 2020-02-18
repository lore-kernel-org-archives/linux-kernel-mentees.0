Return-Path: <SRS0=Ux9x=4G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D0DC34049
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 19:58:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7B824676
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 19:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaFbYSbq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7B824676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5478E85BE4;
	Tue, 18 Feb 2020 19:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpOTexFXFZwy; Tue, 18 Feb 2020 19:58:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA2F685D45;
	Tue, 18 Feb 2020 19:58:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9B1C1D87;
	Tue, 18 Feb 2020 19:58:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90978C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EAE8204DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ad8iJELe7yP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id D47EE204D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:58:13 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y8so8482759pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZVaa80uyP+XZfhhhWT99/ZXFbqKi9cNUzihG4oAdlOc=;
 b=XaFbYSbq7VSZh//HL+vvxQWPtsyeqB5gQ4P0KM0hmriCA5ji4kWEWtRsLF8+YJJaW/
 q86DBbJKueEg9mAyc94VyX4Npqiwi97xuEOvWFSylQ4njEqET32RP/fQ1Rb/j42zeF8E
 fbOarrrBcnX7YKJLzSpVGwm+nx06OwsvoMdcyRrev2F1f9kaStE38X0CTRcMc6jUR4w5
 fODfPNzXaTm4a+cUbv2EPAev+zvmleSEx0+04/vBfda64JxTEijfyv5qsJ/FxDK/gyoQ
 AMIrE/96R+7rPYXgs6Lw10c9MRcCyj62XqVoGN69GD0i2vA0PQTlc8AIEZ7lXFINdvq/
 mulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZVaa80uyP+XZfhhhWT99/ZXFbqKi9cNUzihG4oAdlOc=;
 b=UOnGknD0h7cQAdxBQHdQ13TFpAtcATWKAw9xkH2IcLbvdC2v+ero7A4WVJmKNzpkLu
 FxXXdr0NJFUjJTnUGbNdZOSqrB/fBBEk9eM3xTLHgAn8bf1TyOpEHJbi+EFdFWLwlbpS
 z4oFKfJiLX0bJaO2G5yEE1T+5/amdkSf0N283FtfpyKxFmxA4iPp2iHtFWI47zpo3xcZ
 9NxItHvuLGx2CuEBpdwRB7eB7AF2DoTdTHlJkymvwrmjiGCdVQlwzs7ODnlKRaTpoC2y
 EHikX243rtHQKuTPoUudvDDkTDecsLA+8vTZTH7O8vqjBtPIKwW9OSaeI697Hz9kCqYH
 VR+w==
X-Gm-Message-State: APjAAAW40hf89yiUT58MqlAloYRLy8hi7CGqRX401EgyZuNFlgFii5ZC
 Uh2JBp142LDTdeX3Lzpflw==
X-Google-Smtp-Source: APXvYqxzdkyS57C03yGJaG/36hN7DxqwFGCS6tWj6O9YmFwyOpxHVxiIjXkr6u95wRoOLZOl9InRTA==
X-Received: by 2002:a17:90a:5d85:: with SMTP id
 t5mr4608220pji.126.1582055893495; 
 Tue, 18 Feb 2020 11:58:13 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:ff08:f869:e1e5:121e:cdbf])
 by smtp.gmail.com with ESMTPSA id g19sm5046770pfh.134.2020.02.18.11.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:58:12 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: pshelar@ovn.org,
	davem@davemloft.net
Date: Wed, 19 Feb 2020 01:28:02 +0530
Message-Id: <20200218195802.2702-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dev@openvswitch.org, paulmck@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/4] datapath.c: Use built-in RCU
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

hlist_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/openvswitch/datapath.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 1047e8043084..2b7a348ad167 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -179,7 +179,8 @@ struct vport *ovs_lookup_vport(const struct datapath *dp, u16 port_no)
 	struct hlist_head *head;
 
 	head = vport_hash_bucket(dp, port_no);
-	hlist_for_each_entry_rcu(vport, head, dp_hash_node) {
+	hlist_for_each_entry_rcu(vport, head, dp_hash_node,
+				lockdep_ovsl_is_held()) {
 		if (vport->port_no == port_no)
 			return vport;
 	}
@@ -2045,7 +2046,8 @@ static unsigned int ovs_get_max_headroom(struct datapath *dp)
 	int i;
 
 	for (i = 0; i < DP_VPORT_HASH_BUCKETS; i++) {
-		hlist_for_each_entry_rcu(vport, &dp->ports[i], dp_hash_node) {
+		hlist_for_each_entry_rcu(vport, &dp->ports[i], dp_hash_node,
+					lockdep_ovsl_is_held()) {
 			dev = vport->dev;
 			dev_headroom = netdev_get_fwd_headroom(dev);
 			if (dev_headroom > max_headroom)
@@ -2064,7 +2066,8 @@ static void ovs_update_headroom(struct datapath *dp, unsigned int new_headroom)
 
 	dp->max_headroom = new_headroom;
 	for (i = 0; i < DP_VPORT_HASH_BUCKETS; i++)
-		hlist_for_each_entry_rcu(vport, &dp->ports[i], dp_hash_node)
+		hlist_for_each_entry_rcu(vport, &dp->ports[i], dp_hash_node,
+					lockdep_ovsl_is_held())
 			netdev_set_rx_headroom(vport->dev, new_headroom);
 }
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
