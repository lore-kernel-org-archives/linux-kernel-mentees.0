Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC71C35658
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 15:16:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F01206EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 15:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHqUsWyZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F01206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F0AE4220EC;
	Fri, 21 Feb 2020 15:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2pAsq-wHeRo; Fri, 21 Feb 2020 15:16:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E8845220D0;
	Fri, 21 Feb 2020 15:16:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2346C1D81;
	Fri, 21 Feb 2020 15:16:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EC98C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 15:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0DAD1863C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 15:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWRTTcfgL8hN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 15:16:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A169863BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 15:16:26 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b9so1099022pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 07:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tt5oxns5lx1f646f1QThGbvv5Sl7/0SEXMWJEeaTqzA=;
 b=XHqUsWyZpog7dGkF2/1vy0XTPQVmrc3GfB3/7gzT7AU3Ppp54bRgKBWQQpv+YyAVRN
 jDMqH+xq/B+yeFSi3bYiI5FZNGGHqK1r8BV2ERyHgdHhpiDtRrQqVvZwvTfuFtru9nVj
 qI1rsAUke55VKP+GCASFz9QPRyXZi88rhE4eonRwFKX5c+tHUZmF4plFiYnLG1twO6Ey
 5gYd8TzBIrgRhdlORR8VXXZH4ghI84aGmmCZZPfXxqBlDMCWfWUt/ldK26EhaK77/toL
 Act9AWx73QCjqqZswcrdKNb/fKAGr8OhCdHETSjBXF45dUAyf/cMMUEwKFVX00cZR9qN
 JA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tt5oxns5lx1f646f1QThGbvv5Sl7/0SEXMWJEeaTqzA=;
 b=Pg1QD+7TMMgxAcOl7vaTGw/jPrDFIRZtqCP3VlGO2eJehj9KcFib3MMc57FRO1Ggyt
 3QzmVqRS8AHXc77Ij0iUUGXAvSKRnLmiMarV9dyb1d0PoP1xGqkMTjZ/YytEe6dGX7tE
 p/LbcAsOQi1CwD6mq/XKk9Qfw7pMlMLK5cn/fkcAJBuCLoydC9qc3DXdhqJnwG39d5C6
 z+wBk4dfO0CcdduxIaVIbS5iR7pFhDTaI1DUN5BxIvlwW95bHY1HXnRCdlviGhK+hOjc
 IS2iSP5RVtGXMzj6IdmLwliaL6s/Zd5KTZ6nxUzpMl8ffqPU8BKn8O1tFOQF2n9WHVV3
 KPrg==
X-Gm-Message-State: APjAAAWB71n3re9JYACh2s972YBBODsOODA7v0x02aFESmi4oXPXh9VD
 oLSNQNCB82PF8LfWT0mdIFo=
X-Google-Smtp-Source: APXvYqwS0Ob3VOCEHDxy3+rkM8vo9z+IVglG6FEY74TcvgDu8IUNl4kEuR2PSPfRYJ/RKzHHRSRkaQ==
X-Received: by 2002:a63:5124:: with SMTP id f36mr1105111pgb.288.1582298186030; 
 Fri, 21 Feb 2020 07:16:26 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.170])
 by smtp.googlemail.com with ESMTPSA id q25sm3239490pfg.41.2020.02.21.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 07:16:25 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Eric Dumazet <edumazet@google.com>,
 "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Fri, 21 Feb 2020 20:45:38 +0530
Message-Id: <20200221151537.12334-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] tcp,
	ulp: Pass lockdep expression to RCU lists
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

tcp_ulp_list is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of tcp_ulp_list_lock.

Hence, add corresponding lockdep expression to silence false-positive
warnings, and harden RCU lists.t

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/ipv4/tcp_ulp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_ulp.c b/net/ipv4/tcp_ulp.c
index 38d3ad141161..b9e55759054e 100644
--- a/net/ipv4/tcp_ulp.c
+++ b/net/ipv4/tcp_ulp.c
@@ -22,7 +22,8 @@ static struct tcp_ulp_ops *tcp_ulp_find(const char *name)
 {
 	struct tcp_ulp_ops *e;
 
-	list_for_each_entry_rcu(e, &tcp_ulp_list, list) {
+	list_for_each_entry_rcu(e, &tcp_ulp_list, list,
+				lockdep_is_held(&tcp_ulp_list_lock)) {
 		if (strcmp(e->name, name) == 0)
 			return e;
 	}
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
