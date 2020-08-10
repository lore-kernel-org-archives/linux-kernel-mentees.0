Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6333C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 22:09:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D366206E9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 22:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elE8gXGF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D366206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3DDEF865C1;
	Mon, 10 Aug 2020 22:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yL2qBTJG5YWm; Mon, 10 Aug 2020 22:09:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A97B08623E;
	Mon, 10 Aug 2020 22:09:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94D5AC013C;
	Mon, 10 Aug 2020 22:09:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EFFFC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 16E5787EA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0m12IRUddY9W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 22:09:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7159387E7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 22:09:04 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d14so9912817qke.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 15:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZbMbahrrNkhzXHol1Zr0zVJbIcJ6vrUXkY246I6Gww=;
 b=elE8gXGFCgxGb+WPV22Nwena1f+CuNWdGDIMre+3IYPlJ/dgFxnsv/Nif8jf/9So9g
 Jfq6u/NSq38DCrgFyDUCnVrtGGmwME440my9SPaB2eKBvqacSCkWOroSb302H/A+6/NC
 aFFqf3hnQoBHQs4bfAIRRTwhGKzSgh+tqHkZiR1s4ZRMDUflziWLspPza1JmWtc5x5BH
 hu4Tzumv1CTdCpFez/JNDr9TK5nh5chZTSr0bzMdsoAMlEO6Hm717BFu50YmP2Huc7uT
 O71KhjXh8z3c2xG1Y5UMQPdQCh0Jh59+6yuOQHl1iV7kGHoV8J8a70s1YKxmLmGKTxYf
 aS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZbMbahrrNkhzXHol1Zr0zVJbIcJ6vrUXkY246I6Gww=;
 b=ugxqmhQNIy8f6BdD9S+ayzkYlddMNs+QerXn4nrM5m/o8S05lrT5AELqeaCbQGGwIN
 MlCU6q8MLbrLlpcfWsCb7IjGKNaV802g3TalrRo65Alaz9BPt4bCa1Wdrh7Z1v/2jUhv
 hCn4u1iqQOU0Z6+dbx+yTLKnNCcMdB3JAbUq5W57HSfQKnLsK8zoCDkz5K4ZCMZeCv4V
 WtNnOFKwxbflSGeFfjY+cYdq1p8amsWKcp4zd5YUYhrUPCZofttj+TFl3DnjKLCDn0P9
 z3XjqU4fkTKxoVeLlbyjf2EkJhFIGSZXpakGLJBB4Fvqrq5xrd6lr3HauxdQRC/dPYlR
 B8uA==
X-Gm-Message-State: AOAM530ZyY2qwHsqb20SV4eH2GTw5QqleNhcvue1RIDmBpMsdkSJhanS
 Ey3nzrA9+DXhsStNE9GVZA==
X-Google-Smtp-Source: ABdhPJwB2LGr4Sy6Pe9wMfFj8Jm3p4RuM27hgGOAJBeSaFB5Lh3TbuSGIbsqy+oIYf6RDWfJ0KnCgg==
X-Received: by 2002:a37:bd46:: with SMTP id n67mr29206337qkf.190.1597097343411; 
 Mon, 10 Aug 2020 15:09:03 -0700 (PDT)
Received: from localhost.localdomain
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id w12sm14192544qkj.116.2020.08.10.15.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 15:09:02 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Wensong Zhang <wensong@linux-vs.org>, Simon Horman <horms@verge.net.au>,
 Julian Anastasov <ja@ssi.bg>
Date: Mon, 10 Aug 2020 18:07:03 -0400
Message-Id: <20200810220703.796718-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 Peilin Ye <yepeilin.cs@gmail.com>, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 syzkaller-bugs@googlegroups.com, Jozsef Kadlecsik <kadlec@netfilter.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [Linux-kernel-mentees] [PATCH net] ipvs: Fix uninit-value in
	do_ip_vs_set_ctl()
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

do_ip_vs_set_ctl() is referencing uninitialized stack value when `len` is
zero. Fix it.

Reported-and-tested-by: syzbot+23b5f9e7caf61d9a3898@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=46ebfb92a8a812621a001ef04d90dfa459520fe2
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/netfilter/ipvs/ip_vs_ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ctl.c
index 412656c34f20..c050b6a42786 100644
--- a/net/netfilter/ipvs/ip_vs_ctl.c
+++ b/net/netfilter/ipvs/ip_vs_ctl.c
@@ -2418,7 +2418,7 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
 {
 	struct net *net = sock_net(sk);
 	int ret;
-	unsigned char arg[MAX_SET_ARGLEN];
+	unsigned char arg[MAX_SET_ARGLEN] = {};
 	struct ip_vs_service_user *usvc_compat;
 	struct ip_vs_service_user_kern usvc;
 	struct ip_vs_service *svc;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
