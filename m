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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD04C34050
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 10:17:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5514724656
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 10:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN10sBd/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5514724656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2B6FC85E43;
	Wed, 19 Feb 2020 10:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEW2TfZ0t7V4; Wed, 19 Feb 2020 10:17:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2998485E40;
	Wed, 19 Feb 2020 10:17:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2108CC1D80;
	Wed, 19 Feb 2020 10:17:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DB95C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 398BC84EB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7af6n9ShVWr4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:17:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 090D68643F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:17:05 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y5so12269545pfb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 02:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wx3cl/ju+y18z95mSB4X4cdRQQ7rCw0DISRZpgvl858=;
 b=mN10sBd/GXiQoJR3Ywfsm0PgOHnA0dVmNF3IgQ8Ktyp7fHFx4uXm9z6AnSYjILHEIV
 BAZuo/Qzdzixq8W+e9q65H8A0nw4EeI4VW8DpBfebiI8ju0TWNS5j6aH+EUlou6AYQnO
 QowgF8dWYECxBSGNFRbDdqgiNPb4ggGYLCHRw6x4N1s+H7Y8VoinygwuqrYU9UI08Mkn
 1jdpPlct9uT3eS4Hyp281UiuPQ8R9RCNUENIsaUMvOdmPRsrzEPB6R3V2VvWEQzELr9T
 dXuxcP4YxroyUstNofwTQhh6Yk+wv4ttKWd+yjJf0swaUFO3aBClYJpFbl4F8ctGX/Bf
 ZVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wx3cl/ju+y18z95mSB4X4cdRQQ7rCw0DISRZpgvl858=;
 b=p3hkP7q0pgk4+/g70PpGBqtJ8QSXxV7PTkRSWWF/HaL7vgQfqtuO+uBZF5O0B/v8tn
 EPqynWmXEHx24/JUGJycrAtFuUOVwy6tMbnWP2Uz3X7KQjOO3avwgHE6TQPwpttq8y58
 Zk5c0DtC6v82aDlizzZaMgFmy788X2cx2wk6KKiKkJv4Vf+ds1Vc/Rfhdw516OGAvT06
 T+b1HT8weDq8UxmCcN/5LInDHekZjj1TfztJzx7JsnNZsuvJNqSLtLv+yY1Q1cJnqtwG
 M7e26Sox0FUre70z24hiIj5hKSp59XpPzbx6WUcbCz1AB7E/wP69gTkPnT72d3zNdeEa
 vtXQ==
X-Gm-Message-State: APjAAAWXFsoJBF5rvCwyr3x/3qUnKSCG6kGzVb0Jm55hVB34uiTZcJm3
 mKzK2MLaHIA32RkucqsZX8g=
X-Google-Smtp-Source: APXvYqy6NiIl+ebEVWdcRWivE8SiuoiFsCnaSaA8epCJyhv6rxlKttT+lXy/ebF12zJfvlcSy/d+Bw==
X-Received: by 2002:a63:6d0b:: with SMTP id i11mr26437592pgc.266.1582107424607; 
 Wed, 19 Feb 2020 02:17:04 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.220])
 by smtp.googlemail.com with ESMTPSA id a2sm2400885pfi.30.2020.02.19.02.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:17:04 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>,
 "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Wed, 19 Feb 2020 15:46:27 +0530
Message-Id: <20200219101626.31943-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, coreteam@netfilter.org,
 netfilter-devel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] netfilter: ipt_CLUSTERIP: Pass
	lockdep expression to RCU lists
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

cn->configs is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of cn->lock.

Hence, add corresponding lockdep expression to silence false-positive
warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/ipv4/netfilter/ipt_CLUSTERIP.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/netfilter/ipt_CLUSTERIP.c b/net/ipv4/netfilter/ipt_CLUSTERIP.c
index 6bdb1ab8af61..df856ff835b7 100644
--- a/net/ipv4/netfilter/ipt_CLUSTERIP.c
+++ b/net/ipv4/netfilter/ipt_CLUSTERIP.c
@@ -139,7 +139,8 @@ __clusterip_config_find(struct net *net, __be32 clusterip)
 	struct clusterip_config *c;
 	struct clusterip_net *cn = clusterip_pernet(net);
 
-	list_for_each_entry_rcu(c, &cn->configs, list) {
+	list_for_each_entry_rcu(c, &cn->configs, list,
+				lockdep_is_held(&cn->lock)) {
 		if (c->clusterip == clusterip)
 			return c;
 	}
@@ -194,7 +195,8 @@ clusterip_netdev_event(struct notifier_block *this, unsigned long event,
 	struct clusterip_config *c;
 
 	spin_lock_bh(&cn->lock);
-	list_for_each_entry_rcu(c, &cn->configs, list) {
+	list_for_each_entry_rcu(c, &cn->configs, list,
+				lockdep_is_held(&cn->lock)) {
 		switch (event) {
 		case NETDEV_REGISTER:
 			if (!strcmp(dev->name, c->ifname)) {
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
