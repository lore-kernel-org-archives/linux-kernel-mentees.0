Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAA3C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0488820728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXzGkVzI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0488820728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D4F9E24BEF;
	Fri, 24 Apr 2020 09:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIDx2bvuZQOb; Fri, 24 Apr 2020 09:19:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4A76023251;
	Fri, 24 Apr 2020 09:19:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46D1EC089E;
	Fri, 24 Apr 2020 09:19:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CFFAC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5AB7424BE6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AegOZk0QcVQa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id CD83523251
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:26 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f8so3537139plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkmMfCn78jeLBrlG5zHTVXjT0l4ypf79mn+DmgCmYOA=;
 b=WXzGkVzIhLcUWM99DMUrWoa9sIC38Yz3Gk/3bAuNSgkZGGQ6tfnCSuyTAdhkwwhFni
 cuYBueTVvpuDBprwSwv63R4IKpwstEbZRG8svV/D9DU7gzSfQVewaKWJHusfsyM1HtO6
 IL5juAwCkigllEETLpaiFE37U1YugKIECaQbJL76e4yOx/dY2IZqTvxDAJ4vHJHcGaj+
 TQOFr2rU8L1pl6IOLWEoIKP6kFJbo6PiZYcVccNc1M/Avl1JvO+WqCXo7+v7v7VLj7iW
 grtOQBVYv1iaA2hXwEL1p7CSN980yFYFYGsiIuknoT7NQdKjuniAQLwp2WjoAaeKiW5c
 uhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkmMfCn78jeLBrlG5zHTVXjT0l4ypf79mn+DmgCmYOA=;
 b=ElPHd1QiqRazHffKwM9EDhPOIlE42X59AnYu5cRTHR+MsIWjNSzbSg8YrYVmtkztCa
 4lc2UhYPRmXou4oLJ0EikZRssyChg/VOFp3gWhTECyXfiHU1n8JkfWxC1Yyrn8TzdSvP
 K0yi53bCz8Our5VbeFsQZ1q2aGG69zGe+fqc1RKN98GEuJLGcKVzWLZaKog6fiGEL75h
 kWOQzuyDuvPXXWWB/QjaY9G9GngF0FoGWpBseMgnmmVqoo0VQBLExVSuPPRvfxmlVUY+
 urX7+d/NWiza1akS9eM6jJtl+QgPYnJogdYAmBxPG/PObOccT8ewWfZkMIdYGxrtZDmw
 9WbA==
X-Gm-Message-State: AGi0PuYU1GgO0nXukP/PvpMpUM0hY32Coys72etWWRmTSj53/QuyptWZ
 sdj5FyZPNrinfv89XzkPQgQ=
X-Google-Smtp-Source: APiQypJdIs4tzwi74kUNnMhdUlyNu8a7Icrd7Si+ZRxT6ZdHRH5BHmfCaW88ri7ahe4tta0dWRJhqQ==
X-Received: by 2002:a17:90a:734b:: with SMTP id
 j11mr5168948pjs.108.1587719966223; 
 Fri, 24 Apr 2020 02:19:26 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:25 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:51 +0530
Message-Id: <20200424091801.13871-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 15/25] parsing_c: lib_parsing_c:
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
