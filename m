Return-Path: <SRS0=VQEw=6X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80009C47257
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 May 2020 07:24:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4676F24957
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 May 2020 07:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUc+DAyx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4676F24957
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0B17C8714B;
	Sat,  9 May 2020 07:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64C1pMa3ZVIv; Sat,  9 May 2020 07:24:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA6418715D;
	Sat,  9 May 2020 07:24:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9778BC0889;
	Sat,  9 May 2020 07:24:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D8BCC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 May 2020 07:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0574E22797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 May 2020 07:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSm8ru8NBJQp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 May 2020 07:24:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 8B1FC226F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 May 2020 07:24:06 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id f7so2170231pfa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 09 May 2020 00:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6NOWgkJuVNBzcRIWQKK+1L2R6ELyCXl3BZEpc2cyyg=;
 b=KUc+DAyxbo/FIS+4ZMWHTtwo6Scti9M6yahWtKDsNxEMlPDPUR2gzIMoGEdEJszrYh
 yTljj1+PVG4Fy6LZ9x2kjiHQnC2qaotowIAdSHDX9LBsHeBkobPRtDapevkpz/D47TKt
 BR+X3l9qhCILE3KscM+h8IXp2Rrug8V+6hjbFY8O9s2D0ROHxnLLLlRDXM0k4X5OqYOX
 fp1LQgIGNHScNVR9h6q2t0tvkeiAjw61Rm+/vdQhKpluCNGdrDoQjZgJpsopz2L5Zrk/
 Ddfxg1DflK9NwFWtiA0KDnOGZIiNN/MBy3m0zx+tYPSMiP7YKzgdy9YSg8UOqo0gdN2L
 PzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6NOWgkJuVNBzcRIWQKK+1L2R6ELyCXl3BZEpc2cyyg=;
 b=qLANl32SVK+igHgNOrtVNUgpctiHNM0m3Rcch1cKz6b4DBHumTra3XUN0GnGwl9uDW
 u080JjzjttB3z80XaXGGgwH2QET7FcI56kUrHpttEq+VkENKvaoC5SMvo9fOZ73dtA2j
 WmgEmL7bxnBXC0mhIxJ6+lVG8yowhKZcpKA8JpyaRFdGFbg2cF2oBoopct75xPvfNtfI
 qOatHSVSWFOt3sy2r3uNRpQkpNOr+Sq9K52jNFxmIr1vCFv+P5vEwCUN1N3FcI4lpUCS
 8FNvZ5qH3gqIKP+skaPDbKuvNgXD1uIuXva1p+GX71Avq6gSZjqsf3RQ7EfSXL8PM9v9
 3+DQ==
X-Gm-Message-State: AGi0PuZGn9DDR35TzvEljfw7DSzu6JyDvcaZ4fyCZqbq1iw49aWuBPTA
 xAEyI+HrCN0PCHUGUss2/ZE=
X-Google-Smtp-Source: APiQypLTU3XMkvl0Nz44wwzDblB4tt49h2bt3Qv4UGrAIw0pZYdRRFVUWDJLSt6+VdFXVmRMfm3pag==
X-Received: by 2002:aa7:9148:: with SMTP id 8mr7084252pfi.154.1589009046017;
 Sat, 09 May 2020 00:24:06 -0700 (PDT)
Received: from localhost.localdomain ([103.87.56.89])
 by smtp.googlemail.com with ESMTPSA id f74sm14024249pje.3.2020.05.09.00.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 00:24:05 -0700 (PDT)
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Sat,  9 May 2020 12:52:43 +0530
Message-Id: <20200509072243.3141-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH net 1/2 RESEND] ipmr: Fix RCU list
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
