Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53BFC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7311620720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxoCjvbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7311620720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 66F2F869EA;
	Mon, 11 May 2020 10:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8yvCsmVwuDM; Mon, 11 May 2020 10:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17B9885D40;
	Mon, 11 May 2020 10:14:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 069D5C0176;
	Mon, 11 May 2020 10:14:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E25B4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D1D6C86C24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDD3weoHIhWU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6757686FC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:05 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id k7so2636712pjs.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Gk3ffGaKEx6MgGnn2QBnBC8UunZy5aBosraxgOTrGU=;
 b=JxoCjvbVF6cBcmJPjxWZaSLMUOpjJtwvjetOiN/0pG5UT9gIh8R1DiIppJe0u4Q3hz
 5hg+kYjgBgArYkDRXhBUk94ZCo0tYhE9iNdb7w4Pd6d0IoipR5ShgEpdw8SowswQfT3Z
 SlJL4Xt9ZqeXrexUOT2O2GGzWbfk3byby3QMheW77GVbSltoVMM1oudQUuqxtrAxFDt2
 OWq9vUvkMegyyD6Mt3a/aRy1miMdNpwNCQPrxsbBJHW1dWc8GuYSmB3VRH/MdB1txMKH
 348/c0ldKqab8WofPw8U9e+Bm8+t6/cByewYNLdEaprZa5eXOsrpx//zZkUDdna7v+4O
 lhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Gk3ffGaKEx6MgGnn2QBnBC8UunZy5aBosraxgOTrGU=;
 b=BRa9+p5J1wkk/RgTGcmBQdStGJsOzGzyEtblogCVaGYUjROHqwJJ6eRSk/M1tr2qqC
 3ccbVBeSE2k11aIWR89hDWkIEMQMka8/6hwwBLo9FdBXDljjQbrTbzkJJ8+H54BpStrI
 xAd52XDr7rhM71s+evNoayZsyXOwB+1Xouf7SANyiB7TmvTsurpb3cFsPzEPUdQoCz9C
 YStlZEdMb7qzB1IuyChp0se2yWdn9dtFNPzuoPP85GvsMLYvii7If1VLUjK7u4VnckwN
 xX/OKgoYujMVUphb7wvlWAWHZbh/BvUwLN5Wkxlz/YGllKKvgGRSo3B5HVBUbzlkqLOX
 UsEA==
X-Gm-Message-State: AGi0PuYABxb5QcKjMFERBcXz+KkX+cF3mW13btoMoyxoAe6LQXOFnxK1
 tI1ebUnaHkkmmwo0AtXnoNY=
X-Google-Smtp-Source: APiQypKjL0EwS22e12sdGvxiEVuNdRO3tWydlcsynh/IZgIAmcCvq1RTx2TSpBDc/EjR4o79oBcqyw==
X-Received: by 2002:a17:902:a408:: with SMTP id
 p8mr11439871plq.36.1589192044920; 
 Mon, 11 May 2020 03:14:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:04 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:50 +0530
Message-Id: <20200511101300.11101-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 13/23] parsing_c: unparse_cocci:
	Reflect Parameter attributes
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

Parameter attributes are added to the SmPL AST. Print these attributes
correctly in unparse_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_cocci.ml | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 395b3a3c..d3f97bf7 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -1089,10 +1089,18 @@ and designator = function
 
 and parameterTypeDef p =
   match Ast.unwrap p with
-    Ast.VoidParam(ty) -> fullType ty
-  | Ast.Param(ty,Some id) -> print_named_type ty (fun _ -> ident id)
-  | Ast.Param(ty,None) -> fullType ty
-
+    Ast.VoidParam(ty,attr) ->
+      fullType ty;
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
+  | Ast.Param(ty,Some id,attr) ->
+      print_named_type ty (fun _ -> ident id);
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
+  | Ast.Param(ty,None,attr) ->
+      fullType ty;
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
   | Ast.MetaParam(name,_,_,_) ->
       handle_metavar name
 	(function
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
