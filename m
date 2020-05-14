Return-Path: <SRS0=C/JV=64=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE05C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 May 2020 18:02:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3106120657
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 May 2020 18:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQCQr6U9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3106120657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA53288A5A;
	Thu, 14 May 2020 18:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZuPS45y86oao; Thu, 14 May 2020 18:02:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8C6B88ADA;
	Thu, 14 May 2020 18:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7FFCC0178;
	Thu, 14 May 2020 18:02:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19893C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 18:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F1C6922668
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 18:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIVIE4yOnlTK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 18:02:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id E4E0C22CC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 18:02:32 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id q24so12779749pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7zabWZX7zia6FGAl/2g9/rRePkB0T8QEsMQp4+a+KVc=;
 b=aQCQr6U9CCACb3xi4GcbeO3Ij3GnygrgW/rLvBZHveDxvGGhUA0azKpsjc+ckY1KQi
 GaLXLNDMjd+UDWLTU1dQF/DmbRGXvwrdiIvTzI6h/svgOwYBrtyEBUf545NxdH0qBPpz
 3nUbFXs5s40ooengpKQr9D1fAvVV19Sq6MYkaVUeB0nmhWjBQV2FvhAbk70wGQbf06NX
 ti1JlvBXnmNHMdlWejLYix+UCoPoVvPYeTh95avlwTeZotQM8uaDgqxxSrRw77LyFhtI
 6lyb2vYhWzRT4DxZpojO01GlfcLBW0B/FnFE2QP5F45wmHb6RFCt6NGRfyGGYTWlU4XR
 S6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7zabWZX7zia6FGAl/2g9/rRePkB0T8QEsMQp4+a+KVc=;
 b=e6tbsqY3YV+E9LY3NyujG2oYL9714vnQv5ezMVCPoWai1jceK52qnB1/MCez4O0Dg0
 lWkuaWv8yfxI1NrKyD0R3jdWDzrf+3mnWFTTS6kb/xAmnyreXAuvbkOP7VfxJ+hyjJBB
 SRJ93nVfJWhuVfvvMb8WOEto4jdt0fVUE592OloUpqYz4OC18XY463rShh9fwb+r/RjN
 1bRt6ki0WWfeFTx827ts4LZuq8IIA87KXGjsys6i2mHuidYAd2uPWmcdXz1YwFc1gi37
 TL2STtTHSjbefz3VuaM1YPsF3CrtSZJQs35YyAgKzpN3xpOaXMeok7FvH85OS1UY83tC
 OtAw==
X-Gm-Message-State: AOAM532x0OMKADtGWVIFhtRqeTCyQk7imTNP9l6Ha5pF1KznGp1xXPZl
 mO+QA6xFbyTZ+ljVL598ky8=
X-Google-Smtp-Source: ABdhPJy/icmI40gwG9O80DXWUuHBQDVQog7Y7jXBEQ88FWbaHdlqDynL7D2LdQWr2EQGscCkrTM3hQ==
X-Received: by 2002:a17:90a:de07:: with SMTP id
 m7mr3795254pjv.100.1589479352409; 
 Thu, 14 May 2020 11:02:32 -0700 (PDT)
Received: from localhost.localdomain ([103.87.56.31])
 by smtp.googlemail.com with ESMTPSA id s102sm4594079pjb.57.2020.05.14.11.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 11:02:31 -0700 (PDT)
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>, Patrick McHardy <kaber@trash.net>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Qian Cai <cai@lca.pw>
Date: Thu, 14 May 2020 23:31:02 +0530
Message-Id: <20200514180102.26425-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH net v2 1/2] ipmr: Fix RCU list
	debugging warning
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

ipmr_for_each_table() macro uses list_for_each_entry_rcu()
for traversing outside of an RCU read side critical section
but under the protection of rtnl_mutex. Hence, add the
corresponding lockdep expression to silence the following
false-positive warning at boot:

[    4.319347] =============================
[    4.319349] WARNING: suspicious RCU usage
[    4.319351] 5.5.4-stable #17 Tainted: G            E
[    4.319352] -----------------------------
[    4.319354] net/ipv4/ipmr.c:1757 RCU-list traversed in non-reader section!!

Fixes: f0ad0860d01e ("ipv4: ipmr: support multiple tables")
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v2:
- Add appropriate Fixes tag

 net/ipv4/ipmr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 9cf83cc85e4a..4897f7420c8f 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -110,7 +110,8 @@ static void ipmr_expire_process(struct timer_list *t);
 
 #ifdef CONFIG_IP_MROUTE_MULTIPLE_TABLES
 #define ipmr_for_each_table(mrt, net) \
-	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list)
+	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list, \
+				lockdep_rtnl_is_held())
 
 static struct mr_table *ipmr_mr_table_iter(struct net *net,
 					   struct mr_table *mrt)
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
