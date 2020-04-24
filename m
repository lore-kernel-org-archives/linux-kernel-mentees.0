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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F71BC55186
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106C720724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJICzcm6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 106C720724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D5377880B2;
	Fri, 24 Apr 2020 09:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kl3CDMKRThoJ; Fri, 24 Apr 2020 09:19:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6570786418;
	Fri, 24 Apr 2020 09:19:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55B44C089E;
	Fri, 24 Apr 2020 09:19:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BD68C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0A99A880B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNCCqKTf+dAe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9C7CF86418
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t4so3512720plq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfRA+3R9ZzJveL4ru1tMAAgz/8T168ipuotIP5e5FwI=;
 b=nJICzcm6XnqiAn4T+CuPnVtAABJ/JJgq+yxS9N/lglJYb4ML2KGllFV3/vZZYKwmcA
 OEmTaFd0VgV9VbXVsqd924DE4pqgREDCAQOurPAPdM3wVqFz/ixK9oECNe+2na18TtXK
 YRcDWpVwah9DgBfdWioo8xvKXpnQLIy0nrfqREVKeelw0Ed3Cu715wurZ3gnG8+aMH19
 riIRBzgmbojK7WgGzZZv5otpx3LTYkhrx0PrWn0y2KNdwfq1smz1cI5lS1hrTurq6co5
 NQ5GLSJCjV02NPKZMJoSd5lxckgxGDhC+JdDACiVafKqE5WKPw7jcqy/bERHJojc/nlp
 0Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KfRA+3R9ZzJveL4ru1tMAAgz/8T168ipuotIP5e5FwI=;
 b=gyR9r7zn64JrTUGf8AV7jbB2pBUKwZd39l6KTUxtPOTnxMwwdRw3kBfG1HftKorift
 JeOz3UN2nh2eFpKktXjYXkSipBobk90VBikjBQ0Z2AITJQtb9b5zeD7K0dq8J6hSgTTP
 YAGFei/x6EgxjZ/1DDH8WkFCs7cVB6gf6f8AxNvggYrlgTWhD3wTKLb3YG8K+OYIDTre
 /4CPeXb6AtOT0l/+knvsa2rd5R2//cdI+3S14LxJpsVZ/6eTn3urbfW4jxnb68PZ+XyM
 +MMcBpGjhR22de+yLJtEytVFR17OBUryE/bU3eaYvKBqHwznQLPjOXk8EcmFP/v7ySOT
 nDdg==
X-Gm-Message-State: AGi0Puba8M2+yF1miyotyqno0SkaK6yDeTC+QwkIAN870bFE67cQdywc
 Jk9iUQCoonQ68eNOUNyjbek=
X-Google-Smtp-Source: APiQypKuhTtyoFJta0Pp0Ngex9fnXkqqVI7XmX7+p3ZKVoG7MyZ7A4dDHoUV98Om0Z9dGUqMYU82tg==
X-Received: by 2002:a17:902:a98a:: with SMTP id
 bh10mr7940909plb.340.1587719969134; 
 Fri, 24 Apr 2020 02:19:29 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:28 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:52 +0530
Message-Id: <20200424091801.13871-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 16/25] engine: Add distrf_attr to
	PARAM functor
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

distrf_attr can be used to match a single attribute at a time. Add this
matcher function to the PARAM functor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/cocci_vs_c.ml       | 3 +++
 engine/cocci_vs_c.mli      | 3 +++
 engine/pattern_c.ml        | 1 +
 engine/transformation_c.ml | 5 +++++
 4 files changed, 12 insertions(+)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index 2a3c3f94..e383aef8 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -700,6 +700,9 @@ module type PARAM =
     val distrf_exec_code_list :
       (A.meta_name A.mcode, (Ast_c.exec_code, Ast_c.il) either list) matcher
 
+    val distrf_attr :
+      (A.meta_name A.mcode, Ast_c.attribute) matcher
+
     val distrf_attrs :
       (A.meta_name A.mcode, (Ast_c.attribute, Ast_c.il) either list) matcher
 
diff --git a/engine/cocci_vs_c.mli b/engine/cocci_vs_c.mli
index ef55d478..70354e19 100644
--- a/engine/cocci_vs_c.mli
+++ b/engine/cocci_vs_c.mli
@@ -162,6 +162,9 @@ module type PARAM =
       (Ast_cocci.meta_name Ast_cocci.mcode,
        (Ast_c.exec_code, Ast_c.il) Common.either list) matcher
 
+    val distrf_attr :
+      (Ast_cocci.meta_name Ast_cocci.mcode, Ast_c.attribute) matcher
+
     val distrf_attrs :
       (Ast_cocci.meta_name Ast_cocci.mcode,
        (Ast_c.attribute, Ast_c.il) Common.either list) matcher
diff --git a/engine/pattern_c.ml b/engine/pattern_c.ml
index 7b1d0c0a..e6796368 100644
--- a/engine/pattern_c.ml
+++ b/engine/pattern_c.ml
@@ -335,6 +335,7 @@ module XMATCH = struct
   let distrf_define_params  = distrf Lib_parsing_c.ii_of_define_params
   let distrf_ident_list     = distrf Lib_parsing_c.ii_of_ident_list
   let distrf_exec_code_list = distrf Lib_parsing_c.ii_of_exec_code_list
+  let distrf_attr           = distrf Lib_parsing_c.ii_of_attr
   let distrf_attrs          = distrf Lib_parsing_c.ii_of_attrs
 
 
diff --git a/engine/transformation_c.ml b/engine/transformation_c.ml
index 4de8fe51..eecd4858 100644
--- a/engine/transformation_c.ml
+++ b/engine/transformation_c.ml
@@ -621,6 +621,9 @@ module XTRANS = struct
   let distribute_mck_ini (maxpos, minpos) = fun (lop,mop,rop,bop) -> fun x ->
     Visitor_c.vk_ini_s (mk_bigf (maxpos, minpos) (lop,mop,rop,bop)) x
 
+  let distribute_mck_attr (maxpos, minpos) = fun (lop,mop,rop,bop) -> fun x ->
+    Visitor_c.vk_attribute_s (mk_bigf (maxpos, minpos) (lop,mop,rop,bop)) x
+
   let distribute_mck_inis (maxpos, minpos) = fun (lop,mop,rop,bop) -> fun x ->
     Visitor_c.vk_inis_splitted_s (mk_bigf (maxpos, minpos) (lop,mop,rop,bop)) x
 
@@ -750,6 +753,8 @@ module XTRANS = struct
     distrf (Lib_parsing_c.ii_of_ident_list,distribute_mck_ident_list)
   let distrf_exec_code_list =
     distrf (Lib_parsing_c.ii_of_exec_code_list,distribute_mck_exec_code_list)
+  let distrf_attr =
+    distrf (Lib_parsing_c.ii_of_attr,distribute_mck_attr)
   let distrf_attrs =
     distrf (Lib_parsing_c.ii_of_attrs,distribute_mck_attrs)
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
