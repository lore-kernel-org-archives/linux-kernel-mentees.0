Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06693C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0ED920888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tRu5FccV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0ED920888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C401F88D55;
	Thu, 28 May 2020 12:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChTuZ8-ZR4Ya; Thu, 28 May 2020 12:25:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5066788C30;
	Thu, 28 May 2020 12:25:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DF40C088D;
	Thu, 28 May 2020 12:25:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5DE8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A7DE825931
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3XGDL2tMKOI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id ED44E2588A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id g5so1978581pfm.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkmMfCn78jeLBrlG5zHTVXjT0l4ypf79mn+DmgCmYOA=;
 b=tRu5FccVI83mCNdAzuE6PGvTomTtHLwsrXKA88tpsukf3POgraoi7Tsx234wlc4lQm
 FSjGX3QZ0cU0ozHaPNWJGnIC5ACJSFDsmQ9tDcUScyPk4MpLpY8+GSa4dFMFSvF4KQjQ
 YHTaaTADyFxbdtJeeOd6FdpA2UrvpEdfyDyqXD9XlE9nlQ7hSt+ATtAMzAbVbBPV9NyW
 cygrImXWY/wSz52qZhMVAChE1hyF3fdBIVH9zH5b4BRVsLjpe6ItIduWaYQGkht+Udbl
 yNTFtiUKyOPox4fvhH7ZsCoWy6wUC4yS8/NJPNDjaPK+LEO3+EbO/VdbhG6ZzRwlQ/wV
 jufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkmMfCn78jeLBrlG5zHTVXjT0l4ypf79mn+DmgCmYOA=;
 b=m9/ZBVNhcIsU4kjSMRWB7TieBdM61Aax1UgIXek+dVGOv2gRNYF2s43iUsOaWK9YIj
 u0oULRABFnY8gfOfC7eNU4NEI8iJDVx0RYQZAM7zc/heHirw+p4SZTFDe9CkE7Mlay3Z
 5QzFy+sxihprzwZVUjTOiqG8s56K0mx018EOkAug9G2yryB7+wWTzs3ZQRTxbRNImcrI
 7jGPYcqMacEogA23kKWdwzZak3jCTLlF8YOrMS0qVSdu4ix6MeNylP8Y8r/NEyKV2z0o
 x8xJVCoKZxvBKnQB57k01jRhMIA20Ac3ABN71ILxPp3Hq+4x/p1GbKMVQeg55tWkE8jK
 d8ZQ==
X-Gm-Message-State: AOAM533WxgvOLfWeSmH6vVjbRbloGCjHdLPxOHymwnMPXOa4FpFKqAdd
 ov5E809Pms0t3SIy+vLhGQw=
X-Google-Smtp-Source: ABdhPJwcmshj88XR2zCpdAosuQUEyA4esnmBodP7AG8KRRi7UwWwh+3xm1QjBs0IeW0UpnrVoJal1Q==
X-Received: by 2002:a62:ed10:: with SMTP id u16mr2891940pfh.0.1590668734531;
 Thu, 28 May 2020 05:25:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:34 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:17 +0530
Message-Id: <20200528122428.4212-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 15/25] parsing_c: lib_parsing_c:
	Add ii_of_attr
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

ii_of_attr can be used to get the corresponding info of a single C
attribute. Add this function to lib_parsing_c.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/lib_parsing_c.ml  | 1 +
 parsing_c/lib_parsing_c.mli | 1 +
 2 files changed, 2 insertions(+)

diff --git a/parsing_c/lib_parsing_c.ml b/parsing_c/lib_parsing_c.ml
index 2ab3b3a9..99e43be3 100644
--- a/parsing_c/lib_parsing_c.ml
+++ b/parsing_c/lib_parsing_c.ml
@@ -315,6 +315,7 @@ let ii_of_define_params =
 let ii_of_ident_list = extract_info_visitor Visitor_c.vk_ident_list_splitted
 let ii_of_exec_code_list =
   extract_info_visitor Visitor_c.vk_exec_code_list_splitted
+let ii_of_attr = extract_info_visitor Visitor_c.vk_attribute
 let ii_of_attrs = extract_info_visitor Visitor_c.vk_attrs_splitted
 let ii_of_toplevel = extract_info_visitor Visitor_c.vk_toplevel
 
diff --git a/parsing_c/lib_parsing_c.mli b/parsing_c/lib_parsing_c.mli
index 1fc59420..d9578f3c 100644
--- a/parsing_c/lib_parsing_c.mli
+++ b/parsing_c/lib_parsing_c.mli
@@ -125,6 +125,7 @@ val ii_of_ident_list :
   (Ast_c.name, Ast_c.il) Common.either list -> Ast_c.info list
 val ii_of_exec_code_list :
   (Ast_c.exec_code, Ast_c.il) Common.either list -> Ast_c.info list
+val ii_of_attr : Ast_c.attribute -> Ast_c.info list
 val ii_of_attrs :
   (Ast_c.attribute, Ast_c.il) Common.either list -> Ast_c.info list
 val ii_of_toplevel : Ast_c.toplevel -> Ast_c.info list
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
