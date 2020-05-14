Return-Path: <SRS0=C/JV=64=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64C6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 May 2020 18:02:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E98520657
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 May 2020 18:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vB3ezNNG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E98520657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58BC7895FC;
	Thu, 14 May 2020 18:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FDKIH0n9jNU; Thu, 14 May 2020 18:02:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2536889292;
	Thu, 14 May 2020 18:02:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A778C0178;
	Thu, 14 May 2020 18:02:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E53F6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 18:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D342B22668
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 18:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1m75tJh5um+l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 18:02:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A8DB23077
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 18:02:39 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id d184so1659067pfd.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 May 2020 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ca0BK/SGguPh7YFdWi84as3Zz0WDKCZt+ZX9om6cp8s=;
 b=vB3ezNNGYx/OX/GE+/020ICoVVXSEKWSQIMqDnGH24sr8nyR4gmbHc8Q+FFPfc3LYf
 ECWCy/KpLzrvqMmiTzD0WlfXlaTuydT3awaHd4wpxew4Xk6yew68jZtoOu/ggOXtUF9b
 /eUVOHFN164nYxKeS7MpD7W7Hk+AcCN53/lHsaj+FnlZyO/Rl+I8uUcRQ5/nZOqjxfNG
 /5mu0vLfwy6Cxy0zFIQYB3pKk1UNOjBGyDWCp9C5tJ1OoAWeHRFMvZ6zBqK6a+nCd1xr
 w5Y97aJG7DTWJAcr2ZHP3cxPimP0h5/qgMU2i5IdYvWNLsXjYXPBbdU6vsFNSgjY5vDB
 trkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ca0BK/SGguPh7YFdWi84as3Zz0WDKCZt+ZX9om6cp8s=;
 b=snlnhoJxCXTNEA3guEKYQMaiRMJWLRUPvvzc8dWpaOyVYB9kIX2G6e8XDoX+I03yyJ
 IKEf1VB7R6PrxZQKkvdz8nDDl8pvt3pebX1dRlYHMobkgdnAyk/d3HPYT48V0sP4kT38
 UJkA/zvNR5BE8PumJr6yBdXJcsSu3/DVwPeDWUq9hugvZtcqFuCMZD3Q5HJpVG4C/LtA
 72JZFJ86YjUm7ZGe2aEciTWUuE+Cs/Phak8HYixgrCGBAQ142aw2JAjqbXdAnXGg44q/
 lLo+UP8wNVN8FBNefXULsKd6IpuDFD3aAahnn1V6jDa09bNYhyHGYh8Zi3hFbfMziwG2
 Q5Ag==
X-Gm-Message-State: AOAM531+MOSkmmFYhs409xFlkiX/divOCW6BbzwrLWs6QTuRkN1LKy0k
 vGzjkCsLdOSgtE4wh6Dmtdg=
X-Google-Smtp-Source: ABdhPJx1d23IkIDeVzl+s/M8y4Qu5Th2SszbNzKYQrEBab8KIaYwzFQ+J3GcXEmDo6GeH3LOsiySdQ==
X-Received: by 2002:a63:b1a:: with SMTP id 26mr4946012pgl.443.1589479357535;
 Thu, 14 May 2020 11:02:37 -0700 (PDT)
Received: from localhost.localdomain ([103.87.56.31])
 by smtp.googlemail.com with ESMTPSA id s102sm4594079pjb.57.2020.05.14.11.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 11:02:36 -0700 (PDT)
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>, Patrick McHardy <kaber@trash.net>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Qian Cai <cai@lca.pw>
Date: Thu, 14 May 2020 23:31:03 +0530
Message-Id: <20200514180102.26425-2-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200514180102.26425-1-frextrite@gmail.com>
References: <20200514180102.26425-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 syzbot+1519f497f2f9f08183c6@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH net v2 2/2] ipmr: Add lockdep
	expression to ipmr_for_each_table macro
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

During the initialization process, ipmr_new_table() is called
to create new tables which in turn calls ipmr_get_table() which
traverses net->ipv4.mr_tables without holding the writer lock.
However, this is safe to do so as no tables exist at this time.
Hence add a suitable lockdep expression to silence the following
false-positive warning:

=============================
WARNING: suspicious RCU usage
5.7.0-rc3-next-20200428-syzkaller #0 Not tainted
-----------------------------
net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!

ipmr_get_table+0x130/0x160 net/ipv4/ipmr.c:136
ipmr_new_table net/ipv4/ipmr.c:403 [inline]
ipmr_rules_init net/ipv4/ipmr.c:248 [inline]
ipmr_net_init+0x133/0x430 net/ipv4/ipmr.c:3089

Fixes: f0ad0860d01e ("ipv4: ipmr: support multiple tables")
Reported-by: syzbot+1519f497f2f9f08183c6@syzkaller.appspotmail.com
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v2:
- Change the lockdep expression to check for list emptiness at init
- Add Fixes tag
- Add Reported-by tag for syzbot report

 net/ipv4/ipmr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 4897f7420c8f..5c218db2dede 100644
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
+				list_empty(&net->ipv4.mr_tables))
 
 static struct mr_table *ipmr_mr_table_iter(struct net *net,
 					   struct mr_table *mrt)
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
