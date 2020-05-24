Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425A3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 103CB206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uhRNW/wd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 103CB206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E7FB78685B;
	Sun, 24 May 2020 17:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fTBADuWHpB4; Sun, 24 May 2020 17:22:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 80AC886722;
	Sun, 24 May 2020 17:22:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F711C0178;
	Sun, 24 May 2020 17:22:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77537C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 66D9A87647
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89kwWEfftD92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 057A68746E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:07 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v2so2778262pfv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7WLD42QMXJ7Bz5Ic0YLn9Kq01ou66iO00yz3ADGlF8=;
 b=uhRNW/wdU7CJ8IRiWqT7nThf5Tu8C92kF03fXDdAYyB3MP3pqjRKrJEYG9v1rodsAi
 LBfub3ssWDuiwBxXAuMDuZdPCIDpgbenp/snhlqaN1pHRfoiBCbiOa4NDKHjFwR0ZZAO
 nOeizT0HiFXf+DDfK3qxZGpRxuo3B/fNOtMblBVT4nmAyKeRxMOpLoFqBFJ4FgtqHal1
 TDA9qeAdZ/cGtHS4N5ixD9HKkLEc6shT5U8u2JBXgzTz0F076ZEjIppgPxXOHIFnDiFy
 IIMDIB1Rdy3GjwCWWAvw8/m/R6jlalV8zH0ByzB3WIAD+Pfg3XNt0CRRDZ7KBwIwbPa/
 qjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7WLD42QMXJ7Bz5Ic0YLn9Kq01ou66iO00yz3ADGlF8=;
 b=qVeVvl+PQLLi1MdmdaGGp7uZCaEwpm0zgJwgsM+wi9/qCpXZEmgT1rytck1V7NsG+p
 NUHPhcRv3iVa+CADzFecg8LEUqGR3fvF5esLb4zbqPu4ZodSgeLWvCSMf5++RlcGmScB
 897MT0fjXznM4lsg/HRzecbDq1SKzoJzuKp7cPJwSetspHlmbKcgzE2D+qes9qKt0QeY
 hpU0txfbNyKi23148WljvKDq356j0+LLqG1hIuudB4/je7iFvHLZ5N+C1iMnX+OC1p4y
 yodgKvh4Y8NhwaNU/lwu2zkzeRx9sAXEPL1SVWK2jk2eXvQd/vxGEuJL1maABlGZI9Hi
 89nA==
X-Gm-Message-State: AOAM533lbJ9DrY1AX9mIZaYKzMiIZ62kNn+wW5V63HQ3N22xQ+mKfQ+5
 aamP5BJ0805AnEiXujAXx2g=
X-Google-Smtp-Source: ABdhPJz/rUYzbG84Hv+HnMaQ+sXPbnjCLU/2UFZ1GOUq6+NF/b3ZeFefHavO3NExBUIKsV4UrPO4kA==
X-Received: by 2002:a62:2e84:: with SMTP id u126mr1101181pfu.196.1590340926622; 
 Sun, 24 May 2020 10:22:06 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:22:06 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:28 +0530
Message-Id: <20200524171935.2504-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 23/30] parsing_c: pretty_print_c:
	Reflect Macrodecl attributes
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

Macrodecl attributes are added to the C AST. Print these changes in
pretty_print_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/pretty_print_c.ml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
index b9b9b929..4faa188d 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -1043,7 +1043,8 @@ and pp_string_format (e,ii) =
 
 	pr_elem iivirg;
 
-    | MacroDecl ((sto, s, es, true), iis::lp::rp::iiend::ifakestart::iisto) ->
+    | MacroDecl
+      ((sto, s, es, attrs, true), iis::lp::rp::iiend::ifakestart::iisto) ->
 	pr_elem ifakestart;
 	iisto +> List.iter pr_elem; (* static and const *)
 	pr_elem iis;
@@ -1053,11 +1054,11 @@ and pp_string_format (e,ii) =
           opt +> List.iter pr_elem;
           pp_argument e;
 	);
-
 	pr_elem rp;
 	pr_elem iiend;
 
-    | MacroDecl ((sto, s, es, false), iis::lp::rp::ifakestart::iisto) ->
+    | MacroDecl
+      ((sto, s, es, attrs, false), iis::lp::rp::ifakestart::iisto) ->
 	pr_elem ifakestart;
 	iisto +> List.iter pr_elem; (* static and const *)
 	pr_elem iis;
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
