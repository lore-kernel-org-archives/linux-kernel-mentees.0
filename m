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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4A4C34049
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 19:57:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E59E24670
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 19:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ+9pXbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E59E24670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4CD3B204DB;
	Tue, 18 Feb 2020 19:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6N2aWGK0xEqx; Tue, 18 Feb 2020 19:57:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 953F32000E;
	Tue, 18 Feb 2020 19:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AB72C08A0;
	Tue, 18 Feb 2020 19:57:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFD7EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DF2278658D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzQ320FZMiyv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:57:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7654686578
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 19:57:55 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 70so11451180pgf.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 11:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=93cUwvRz5DcbF2nQaz+gagk6IvPBCJp98CU5NTDjQMY=;
 b=UQ+9pXbDMmbdwA6F96Qv1VTxfWIz+JpDgMRfBgEwsI2/DxQA8d1YYv3LhqeSWvFyG3
 KySMupXsPLTKR8WIfSgIj374RP/tpNY6rn9kI85B2bdUZKNIAI4bBtweOJJkv+UufbfL
 OsHJC1WfHbmkTo4aTz0APkZDFAdFavuyyZd6ZXl1OwPo93zeo/bz8FthImtkeCMnvSFS
 vLhtX0zbw3wAuwNmOtJU6nw6SWTGmqPVqAubM0XpVuoS5kogsoQOXzF6YzD7MGj+PfLU
 FaP2WqUchlHEnqt0TtGb4plEPa9QcyJBK/mJcXAwrN+vzxkqCENzHeZu0Lh3Yb+lIkhs
 cIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=93cUwvRz5DcbF2nQaz+gagk6IvPBCJp98CU5NTDjQMY=;
 b=cs84qsEHqU54T9ny7Sr1jESK+4hDgqiHUnH6X4oFg35xs1v+Sux+3ymwr6tyJ5QA16
 ewwAyNYSzsXnjks4SLQcwk72/fjqkIegiR/mxuXW80I0n+sR1w5QFibisYQ+WT4sgn6J
 BJIJZASwv40rLDyxwic/BDa/RzQOHjTZpr8QuAOVPinSl4uN3RPOBFmzR+dGrocaefGA
 EAipD+wvsaGHjqGrJnzd4u9gWl+ioKGtsupkiSzRKdmpTE8DuxWlO34gcDLmQtOxOjaQ
 PmiReHYrmpe1J/siWO28SlNiN6F16EnjeiY64hikrZWe31QfOfz91N7bjcQdhgm7Iaz9
 cJeA==
X-Gm-Message-State: APjAAAUEP61ev/JAjTc3FaTvehYDjwaiRdgflNdi4yCxuNjybCnN6uJ5
 hkQcTpuYn3bNOu8L7IjpEg==
X-Google-Smtp-Source: APXvYqzmmai+702KiOlcfbcc3ZFX7jmIWdGXi8fVhYaR8Nc3GJgeHndI1Pldb3SlGbLRf31qGdaxsA==
X-Received: by 2002:a63:4525:: with SMTP id s37mr24073227pga.418.1582055875098; 
 Tue, 18 Feb 2020 11:57:55 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:ff08:f869:e1e5:121e:cdbf])
 by smtp.gmail.com with ESMTPSA id d4sm4038413pjz.12.2020.02.18.11.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:57:54 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: pshelar@ovn.org,
	davem@davemloft.net
Date: Wed, 19 Feb 2020 01:27:42 +0530
Message-Id: <20200218195742.2636-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dev@openvswitch.org, paulmck@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/4] vport.c: Use built-in RCU list
	checking
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
 net/openvswitch/vport.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index 5da9392b03d6..47febb4504f0 100644
--- a/net/openvswitch/vport.c
+++ b/net/openvswitch/vport.c
@@ -96,7 +96,8 @@ struct vport *ovs_vport_locate(const struct net *net, const char *name)
 	struct hlist_head *bucket = hash_bucket(net, name);
 	struct vport *vport;
 
-	hlist_for_each_entry_rcu(vport, bucket, hash_node)
+	hlist_for_each_entry_rcu(vport, bucket, hash_node,
+				lockdep_ovsl_is_held())
 		if (!strcmp(name, ovs_vport_name(vport)) &&
 		    net_eq(ovs_dp_get_net(vport->dp), net))
 			return vport;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
