Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C01C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 06:20:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081BE206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 06:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhtpN2xs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 081BE206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC39D8773F;
	Thu, 30 Jan 2020 06:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uVSJzyZae0N; Thu, 30 Jan 2020 06:20:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4984F8772F;
	Thu, 30 Jan 2020 06:20:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D811C0178;
	Thu, 30 Jan 2020 06:20:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACAB7C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 06:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 961DE85F8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 06:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uUw8uE44WsP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 06:20:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 300A485F84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 06:20:50 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 84so945124pfy.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zMHEc0flI99qBQqzj4e4DXxEH1EhacSSKhwIiUnp+1c=;
 b=VhtpN2xsAoab5j+OLu9VSC+ZOwi4XRzPI0yYbHyjphZYtfbtU8Jxg+H/BRglroO/f0
 a0ITfk+IK607kmTkp+dIw0/dnJGuYSOXJoeVIDiFio4O0pfs7BE+jXmlKXBI1OZfXFJp
 NATXjkr1AF363UXRaXv1RHERVT9x+3eqmJiDEENZcPVuQsauRJ9YYnt2cCoURmUMIi/D
 AEDIqhUw/JhYlweTSumgx4F/HI2qCKUrvHxxzO5Bh2LmM1rEV/qWR15jZ18BlKGFHNwB
 HxzQuYAeGMKauOLO1w9ci8mb56YK5s78dME+mxfSu8PDKgTzENuuVwSLx8Z5Ll5Hv4Ox
 l/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zMHEc0flI99qBQqzj4e4DXxEH1EhacSSKhwIiUnp+1c=;
 b=PXN+7XRVZhtH1SV+ZsTfvLXdb17PwkX0yapQCI+cq1CWSxD1JbIDp4mUXq1i97hlA3
 YUvw9FzyTfVHVinWPcE00xZzwt8aDyE9WYKuv9tVCmCkrOFjhuhDCZbNnSw/U30fptxq
 lhmWNk/2A8KJE8JM/MYGbW0afn4Y6e0LpKtTeDYeqOwYcP6exL2xhsSoo6qag7NunxD9
 oNwTHOKbrYhBI2vw6kkzGtE574/Ljnh4UBZghQ90T22ew2CqPFpqcX4ekSnD41ElevWH
 8qn0iVAp2asPHTPerW2+XKILZFyx1uDhQe7xAE5JoOMK5+xvRI1od6ktXLMHSxbcKVbi
 lOyQ==
X-Gm-Message-State: APjAAAWVPO97POTEH3exrlwZgT6Q3xQ36GAIS0VFPjd2h2Wg19x8IynW
 OvywQ3SNj+mgvCNTZ95vfQ==
X-Google-Smtp-Source: APXvYqw4a2hKiGpcYewgSpLWc2dNqkZ5HkxaNFMcdKHAIBTJy2upjUfpxVclQix8G82rDVwgCtkqJg==
X-Received: by 2002:a63:597:: with SMTP id 145mr2947677pgf.384.1580365249786; 
 Wed, 29 Jan 2020 22:20:49 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1eed:fc71:d421:7a49:b2e4:2bd6])
 by smtp.gmail.com with ESMTPSA id s124sm5041496pfc.57.2020.01.29.22.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 22:20:49 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: peterz@infradead.org, mingo@kernel.org, oleg@redhat.com,
 christian.brauner@ubuntu.com, paulmck@kernel.org
Date: Thu, 30 Jan 2020 11:50:28 +0530
Message-Id: <20200130062028.4870-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: joel@joelfernandes.org, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] exit.c: Fix Sparse errors and
	warnings
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

This patch fixes the following sparse error:
kernel/exit.c:627:25: error: incompatible types in comparison expression

And the following warning:
kernel/exit.c:626:40: warning: incorrect type in assignment

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 kernel/exit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index bcbd59888e67..daf827a4aa25 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -623,8 +623,8 @@ static void forget_original_parent(struct task_struct *father,
 	reaper = find_new_reaper(father, reaper);
 	list_for_each_entry(p, &father->children, sibling) {
 		for_each_thread(p, t) {
-			t->real_parent = reaper;
-			BUG_ON((!t->ptrace) != (t->parent == father));
+			RCU_INIT_POINTER(t->real_parent, reaper);
+			BUG_ON((!t->ptrace) != (rcu_access_pointer(t->parent) == father));
 			if (likely(!t->ptrace))
 				t->parent = t->real_parent;
 			if (t->pdeath_signal)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
