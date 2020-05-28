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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506E1C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235D7214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tvx8kNhv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 235D7214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0156188C30;
	Thu, 28 May 2020 12:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4eO6JD9u6+Br; Thu, 28 May 2020 12:25:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5590388D55;
	Thu, 28 May 2020 12:25:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5289CC088D;
	Thu, 28 May 2020 12:25:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49775C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 394F98826B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5pReouAKPRL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CA444880C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:38 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 124so7210911pgi.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H7rNN90I+VvWsyT//Ny3D6RN+JUCIC4Hn7sEnZwtroc=;
 b=Tvx8kNhvJpbRrcNox3id4fLIEYCgDMkgdLBCshnX5crQv95RBjjKwvIES6p8AKDhlk
 QZUI6Pvc3SgqGAf6RHsE6+mczyuCJMSZFTaeR+FNikgJ/7NVKOxXI4RI9DVhlTlRUNXu
 bkTrelhZMMjA+xwjNJAaSp3iSOLHYZsb73RYpD7ywyCz9/PrwUI4BmKL13p//VTZdQuR
 avu7YtLPfu6KwiuUJ7gGsUMtXSOFQrFjp5rYyLc4cymiPmGeVvfY1H3B4yhz3O7kqE4y
 AaiZ6/FGZpxO4Md8GC6It32NjhjPDUXynDp+t26CK6aSOld3QV/IaVCX/T+kRw6QKWEM
 nNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H7rNN90I+VvWsyT//Ny3D6RN+JUCIC4Hn7sEnZwtroc=;
 b=rMKK/bfvjEyVbFW9AKQhrsxT6/cE1eYXLo6sw8u+6Dk+CPcd8LIV8MZtZ1C8NePJqc
 vEDbKdbWjgkHxPhskblxaObd/YVeuB4awOVCjc/NfIhLXkyjetgrnR6z8fLiWy97v9Ed
 iZyWQTeBFHimlolqUQSBLHBc4IZw94uAVNj1k/9GB3OyuxMuDYs4a42IxiNtPGCqqvIz
 lgRjlcwT+zEAOTlZlEL0jrRN5HSdGJG9G6AZubnZWqA8WJoFJfEYaL/O9PUEikAm8jfm
 gvEAZf777iw7v+VyoF2SkE06IxDqRrbnQHaoijRrLZHJWTJg34A6iirzhtul6p3lYasg
 Ay+Q==
X-Gm-Message-State: AOAM530S1l6bTj6tenXkS+qOlahRbpKl0qthdxpQVaxisC+rOOdARRyR
 Kz7K6DObWENIOGL/RNvVm+k=
X-Google-Smtp-Source: ABdhPJzYLoRdTHCf7MqU3spL3f7Vq0gE6jY+4E/Q1odGEDHF6uvEDrKTskGqWX6urs4UV55+dbG9Hw==
X-Received: by 2002:a63:5015:: with SMTP id e21mr2737964pgb.54.1590668738322; 
 Thu, 28 May 2020 05:25:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:37 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:18 +0530
Message-Id: <20200528122428.4212-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 16/25] engine: Add distrf_attr to
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
index b1d80abb..12b1c170 100644
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
