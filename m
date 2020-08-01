Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1688C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 19:46:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7345206E9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 19:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIEyUOLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7345206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C44887BFF;
	Sat,  1 Aug 2020 19:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTqGRGJ1J8Bn; Sat,  1 Aug 2020 19:46:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F8FC87BB8;
	Sat,  1 Aug 2020 19:46:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55DABC004F;
	Sat,  1 Aug 2020 19:46:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFC6EC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 19:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D7C8286078
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 19:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPP2KVG8aiS2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 19:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 171788605E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 19:46:24 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id x6so9863535qvr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujYsQMCZbecD6bJOJC4Hkc6cL1ixRi2Hw1s2+qYZ8Ac=;
 b=HIEyUOLPHv84IyjfJfi3d8BatiT6NbFRFo4ij+cTD9CJeCkKTEmiTauwNMEbVi8j5H
 WUZk8m1BLwfiRWVb/wKvdceJhb+sY6NCjWQVGC56HCCpLqP8zDWFjm4kNyQhRqidxJK/
 GrbwW9CqiPTw3gwxE4WQTnfvh5FV2F6v/RG3ky/Ehr3oRjhInC6MwSGDAT8Tu7+ySwQB
 7TPBs+ODPpzT1BgGkvhTYQNjj3SRHZGocz9wc2pyerSBVQd9LsATV+T2rl2ZZV8DS4t6
 Ad5bWemDX+rR3mc/tjNrx1Skb3x52oGEei/Dj7QD3NQ8w8GxHtqhJ8E/YQtdDX0rIWBJ
 OVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujYsQMCZbecD6bJOJC4Hkc6cL1ixRi2Hw1s2+qYZ8Ac=;
 b=AH+Kjm6rd00tCNf/eUFDkk9LbYetEzYAwVULzR8kf/Bi2bp869mtxhhzw5eOR3/q//
 JmNHky9lL5xocO50UNN/CzBQEW0Yj3zYP2dFEldkY1wM+Df6eR3s9S50JiawGLKPuKmb
 x8JZXN+Tre0JfZLkPV5MU+KqH/qURFBxki/ETkLjO5MuIQVZM8yON/DwVoXbWLPXWI2J
 pxsj7Q8PtrczbFYdrlRJF8rzJjpW51gCbqrKmDcBUCvGoq6p6MPWCLg/nP+feG8L458K
 YPjtiK9tkzu7k2NRM8co+46swETclKlEI+BNm8WAVswtMHJT4rJtN1h+EOs9sDQtfNk6
 VYbQ==
X-Gm-Message-State: AOAM530E2xFdaP6W/2JNYWFnU0h8VqQfE23nIrvfASPrX5CsjWAUAJ52
 yRpy4ST2V7ymPCS6jX0c7A==
X-Google-Smtp-Source: ABdhPJzDVgh81xMg4udcLC8TIzADu8oMa6/Aiz82VsTpmlIIxc01ZpgOmmLKGcMXX1gdukgbZPM0XA==
X-Received: by 2002:a0c:d7c9:: with SMTP id g9mr10286039qvj.83.1596311183058; 
 Sat, 01 Aug 2020 12:46:23 -0700 (PDT)
Received: from localhost.localdomain
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id q17sm7791343qte.61.2020.08.01.12.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 12:46:22 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Ursula Braun <ubraun@linux.ibm.com>, Karsten Graul <kgraul@linux.ibm.com>
Date: Sat,  1 Aug 2020 15:44:40 -0400
Message-Id: <20200801194440.246747-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Hans Wippel <hwippel@linux.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH net] net/smc: Prevent kernel-infoleak
	in __smc_diag_dump()
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

__smc_diag_dump() is potentially copying uninitialized kernel stack memory
into socket buffers, since the compiler may leave a 4-byte hole near the
beginning of `struct smcd_diag_dmbinfo`. Fix it by initializing `dinfo`
with memset().

Cc: stable@vger.kernel.org
Fixes: 4b1b7d3b30a6 ("net/smc: add SMC-D diag support")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Reference: https://lwn.net/Articles/417989/

$ pahole -C "smcd_diag_dmbinfo" net/smc/smc_diag.o
struct smcd_diag_dmbinfo {
	__u32                      linkid;               /*     0     4 */

	/* XXX 4 bytes hole, try to pack */

	__u64                      peer_gid __attribute__((__aligned__(8))); /*     8     8 */
	__u64                      my_gid __attribute__((__aligned__(8))); /*    16     8 */
	__u64                      token __attribute__((__aligned__(8))); /*    24     8 */
	__u64                      peer_token __attribute__((__aligned__(8))); /*    32     8 */

	/* size: 40, cachelines: 1, members: 5 */
	/* sum members: 36, holes: 1, sum holes: 4 */
	/* forced alignments: 4, forced holes: 1, sum forced holes: 4 */
	/* last cacheline: 40 bytes */
} __attribute__((__aligned__(8)));
$ _

 net/smc/smc_diag.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/net/smc/smc_diag.c b/net/smc/smc_diag.c
index e1f64f4ba236..da9ba6d1679b 100644
--- a/net/smc/smc_diag.c
+++ b/net/smc/smc_diag.c
@@ -170,13 +170,15 @@ static int __smc_diag_dump(struct sock *sk, struct sk_buff *skb,
 	    (req->diag_ext & (1 << (SMC_DIAG_DMBINFO - 1))) &&
 	    !list_empty(&smc->conn.lgr->list)) {
 		struct smc_connection *conn = &smc->conn;
-		struct smcd_diag_dmbinfo dinfo = {
-			.linkid = *((u32 *)conn->lgr->id),
-			.peer_gid = conn->lgr->peer_gid,
-			.my_gid = conn->lgr->smcd->local_gid,
-			.token = conn->rmb_desc->token,
-			.peer_token = conn->peer_token
-		};
+		struct smcd_diag_dmbinfo dinfo;
+
+		memset(&dinfo, 0, sizeof(dinfo));
+
+		dinfo.linkid = *((u32 *)conn->lgr->id);
+		dinfo.peer_gid = conn->lgr->peer_gid;
+		dinfo.my_gid = conn->lgr->smcd->local_gid;
+		dinfo.token = conn->rmb_desc->token;
+		dinfo.peer_token = conn->peer_token;
 
 		if (nla_put(skb, SMC_DIAG_DMBINFO, sizeof(dinfo), &dinfo) < 0)
 			goto errout;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
