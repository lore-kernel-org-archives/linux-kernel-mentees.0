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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6C1C35669
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:42:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7892071E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Feb 2020 06:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqRdB+56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E7892071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E32B62040C;
	Sat, 22 Feb 2020 06:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aj7Fo6VP4zdF; Sat, 22 Feb 2020 06:42:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2EA1D203FB;
	Sat, 22 Feb 2020 06:42:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DADBC1D81;
	Sat, 22 Feb 2020 06:42:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BA46C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 75A0087D09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUhnsYL7BxXr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:42:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EE5CF864CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 06:42:09 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 6so2142749pgk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 22:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6NOWgkJuVNBzcRIWQKK+1L2R6ELyCXl3BZEpc2cyyg=;
 b=FqRdB+56woJ+aqiLb2Cd0+dDu3Rnbt4s70LQ8+EbM106IRfJasluEqi2KryUpycnpa
 q46Pq0kb0YYO4m1Eo9qos5zs55uz/HYlEiPssXEfy33wSj5in56o1Mw0y49vLcmJS0SY
 KOTH5triN05mU1FQJYa8AJqZsid6Aonj/ufDlabhYcxsGlsumxffcFpMUDxWLnL7pr6X
 0NyVv9KrUsBpfk2Ha2RdaczyDdXY9OoGLoN+oazdrGPJHmXtTPYKfgVT6KW0BL/sOZbz
 p53x+j7OfmyjxxNdXL1y2/YbXE19bh+x/h6q2IwQ6BwfPUi0JCZPZU8zOtK1LS1pEVFh
 rD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6NOWgkJuVNBzcRIWQKK+1L2R6ELyCXl3BZEpc2cyyg=;
 b=Xi9iqYN3Bs5RRwAtEDK8qa8/Jk9CBsXpsRxTsnN57h7s0rFnuOwZLTkzvQq9L8tVo1
 eG+VRsc4SuRhgC8G1V+JcfkqoQZyOtkrilm4JLYIMTf5yITqYQ0HKATgG6B7uopJ5OiN
 IHu0A4t3OFOD4E2Ro0216qhQVexK0JRP0TPGStFhA9yllNmtLdFxdaFLpUK/KCHculLb
 tfGu1X66yRCh4wKNUa5ngLAG27jcXK3lU9YZ9r5NthGncs8kSWzQfjpUbYyTl0Eqzd3B
 lc3QO6l7uIlRaTWOr47M8hXIeoVnbtJhErqcxKKvGehmt8lLErTPHRshcD+tBeGI5J7x
 TQbA==
X-Gm-Message-State: APjAAAVJB65tM16nRBVAa2n99oe35Le77BziSIJDxvqS0kVxbkK9x4Ko
 tblknW2yA4PCj85R4rPxW+I=
X-Google-Smtp-Source: APXvYqzDbgRAfSah8enAHJuCFgRyyBPFc5qmEZEwMTAKxSh/dXWKbXLbH0Ui0FVikX6GYWQ+VW/dWg==
X-Received: by 2002:a65:5a42:: with SMTP id z2mr1036184pgs.213.1582353729466; 
 Fri, 21 Feb 2020 22:42:09 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.201])
 by smtp.googlemail.com with ESMTPSA id k5sm4455071pju.29.2020.02.21.22.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 22:42:08 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Sat, 22 Feb 2020 12:08:35 +0530
Message-Id: <20200222063835.14328-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] ipmr: Fix RCU list debugging
	warning
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

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/ipv4/ipmr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 6e68def66822..99c864eb6e34 100644
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
