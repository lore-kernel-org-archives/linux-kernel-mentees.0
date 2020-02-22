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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6D8C35673
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:42:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6FE2071E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:42:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjxVA3Br"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6FE2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9CDD6864CF;
	Sat, 22 Feb 2020 06:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ68MRNzJ5ju; Sat, 22 Feb 2020 06:42:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4355A87D3D;
	Sat, 22 Feb 2020 06:42:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31BBBC1D81;
	Sat, 22 Feb 2020 06:42:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05A00C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0289C85FA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvN8mQx4GAh1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:42:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7250885FA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:42:13 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id k29so2432827pfp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 22:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9hYMlHxQU9EhnNg/RTgwCsCYqoi4kN3olIEeJ3OkvPk=;
 b=EjxVA3Br6FjEjanPqEhDEoiXcouvU+bGrOv3uTHp9VrVsy3AXGgMpJunV/dlGd1qUm
 h3uIb/c+THfk4d8i8eRh2Gmc6RKBk0FeWU0DeLHdnsCMJijfu9dXn3U/Gbw9qIpykRGt
 gagL4hr4DlgdCOOYPod1UshTeKzN51JTcTv3f74iLTF3ML8aBN5tFTu6vgRzkeuugQ8+
 v7r1tvbe5PFXIYjKy1auosHppC+l4qMmg+TqQGywTUnIQ9D24onvbs6RVVN+8cyCqdJZ
 7gcoN0kyc3bs6KMHZ694GcP6l1jBOCqrZomZdNBuvqhCS9wlN++JrQOVIs3Jl97i9n2/
 1y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9hYMlHxQU9EhnNg/RTgwCsCYqoi4kN3olIEeJ3OkvPk=;
 b=jwRHYGojXAkOo/6Xus+9IjpVbKkzX2oyEMXV+RwWbXgD2x2xswsOs6PMtfsU3lc0XW
 nydHvYoLSV6s/gcVb6WxA9mBXMOnWEPb/wqiKEGN4NlQgcV9LIABbu+04PD34DURIxYW
 S565oN6Kq2t372+eSW5MN1pNgMXECU1V99wnffPJhj3OXCWpPkFb8L3oaAHh+ZoAjC31
 bK3J0DX/jJej6AQ7nns4RgWNAN4QHF12Ty64quZdFCVnnd8cYbtSr2XYR85cWmH4MiCR
 Kwauh9mkpeqEJdeAcy2lHbMRx5rhdKLppreHAHPMTRAXZeaOKuwkZbofgrBqMcLiOq+C
 qEow==
X-Gm-Message-State: APjAAAUTON6GyXARQs7yrxg/O1O4UTkzy6sxls4VcVWlprZTb32HqmDM
 CEMrb97768Q4SeBj4DLWy1I=
X-Google-Smtp-Source: APXvYqwdWk7osSGXdnZrrkUWAfAmanU6pj0j8QeL8rczy5YSTPsqUDFk5CjIMGs1shp3kNuLzO94Qg==
X-Received: by 2002:a65:645a:: with SMTP id s26mr40682184pgv.135.1582353733058; 
 Fri, 21 Feb 2020 22:42:13 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.201])
 by smtp.googlemail.com with ESMTPSA id k5sm4455071pju.29.2020.02.21.22.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 22:42:12 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Sat, 22 Feb 2020 12:08:36 +0530
Message-Id: <20200222063835.14328-2-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222063835.14328-1-frextrite@gmail.com>
References: <20200222063835.14328-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] ipmr: Add lockdep expression to
	ipmr_for_each_table macro
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

ipmr_for_each_table() uses list_for_each_entry_rcu() for
traversing outside of an RCU read-side critical section but
under the protection of pernet_ops_rwsem. Hence add the
corresponding lockdep expression to silence the following
false-positive warning at boot:

[    0.645292] =============================
[    0.645294] WARNING: suspicious RCU usage
[    0.645296] 5.5.4-stable #17 Not tainted
[    0.645297] -----------------------------
[    0.645299] net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/ipv4/ipmr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 99c864eb6e34..950ffe9943da 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -109,9 +109,10 @@ static void mroute_clean_tables(struct mr_table *mrt, int flags);
 static void ipmr_expire_process(struct timer_list *t);
 
 #ifdef CONFIG_IP_MROUTE_MULTIPLE_TABLES
-#define ipmr_for_each_table(mrt, net) \
-	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list, \
-				lockdep_rtnl_is_held())
+#define ipmr_for_each_table(mrt, net)					\
+	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
+				lockdep_rtnl_is_held() ||		\
+				lockdep_is_held(&pernet_ops_rwsem))
 
 static struct mr_table *ipmr_mr_table_iter(struct net *net,
 					   struct mr_table *mrt)
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
