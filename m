Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DECC54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:08:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3D520663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F38hnRqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3D520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4E73E85F3D;
	Mon, 27 Apr 2020 12:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYy7d2TpTRHK; Mon, 27 Apr 2020 12:08:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2D0E85F29;
	Mon, 27 Apr 2020 12:08:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAB7DC1D74;
	Mon, 27 Apr 2020 12:08:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B817BC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AE70586E88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gv-9swDCeD4S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 45D358633B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:51 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 18so8915954pfx.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpLTgt82Ti31oCPVD1pdgcNX51JVNVAJJuqnmPIy5S0=;
 b=F38hnRqtkDW6hCSyIln+Tt5oq5BOvM4Q+wlhnr+GrxtTX9wNkm9/untzFs2/3Wsji+
 ZtIyoXX70buMyRQvhCoxh5kwVg6IdahF8NiAg2OBByElQFOplYNCMzCUr+cJHaPG65Mv
 wweO1GOb5xDtAJTHBQTlLX8X83A23+SbUny0Y+vMZZrhHINWFjPr6goNXBbYqRV940+N
 Hc0eXReLY2wY9AiDtlN2W3TF6D+vj4TGHaYOK2cw8hgUSVkal85sv7VFXF3huaAk/DaA
 u2E7dq/AQM5Q0KHIOEqZaftUcvcUZs6su7PvlgeRYUwjERcqXpm054XrosOmZPQw/VAM
 +waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpLTgt82Ti31oCPVD1pdgcNX51JVNVAJJuqnmPIy5S0=;
 b=Z/pHiJxYjro4onmz/9xQDxuYaWM+SmSN+SQKwDco9wIRMQ9UX+qfqjl4HPV+F1rrj/
 4w6LSk03zn6NvobXfesrsVyt3lYLP/Idz1cWZvuFVt0qqZFqvCwP3jOi5XG453UV8jD2
 uKUSOa1lfH+Qcw8+n4hsfY+ZF2T0tNTuWkWZYX50hrgukTR12Zd9uSfPuCLrzzzfo5uu
 d97yuFI+UQmB7H+7FXfUG2Tw1aku8Pn3nKC4cuCR8MauwW+3Va/FSuakHGDtQX5BYCsH
 WFLN27Tpa2gH+e6UST6/tBOOw1TFFXFkCYiLKJuIsFTvBExMTuYI7VmZJDDNwJ+qjnZj
 RYlQ==
X-Gm-Message-State: AGi0PuY3iMJeDJvXzTI2v9xzjKA2K7UtVN2ZKjNacEmgxr6yoEMHyrO5
 SV3hwDsDzSmbeo5ZSIwV2y0=
X-Google-Smtp-Source: APiQypKbFcu4Ch6ZHpnK5cxFhHh8/790Xgu/biQNivMdIlQMkDNcLyvHokCcjJOltgbDLnOQ/k+5Cw==
X-Received: by 2002:a63:1414:: with SMTP id u20mr5354822pgl.47.1587989330808; 
 Mon, 27 Apr 2020 05:08:50 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:08:50 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:12 +0530
Message-Id: <20200427120834.380-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 01/23] parsing_cocci: ast0_cocci: Add
	parameter attributes
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

Add parameter attributes to AST0 of SmPL. This is a list of attributes
in the VoidParam and Param types of AST0.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0_cocci.ml  | 4 ++--
 parsing_cocci/ast0_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index a06d99ae..8d30daea 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -334,8 +334,8 @@ and initialiser_list = initialiser dots
 (* Parameter *)
 
 and base_parameterTypeDef =
-    VoidParam     of typeC
-  | Param         of typeC * ident option
+    VoidParam     of typeC * attr list
+  | Param         of typeC * ident option * attr list
   | MetaParam     of Ast.meta_name mcode * constraints * pure
   | MetaParamList of Ast.meta_name mcode * listlen * constraints * pure
   | AsParam       of parameterTypeDef * expression (* expr, always metavar *)
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index 5c2520be..f66a1fac 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -320,8 +320,8 @@ and initialiser_list = initialiser dots
 (* Parameter *)
 
 and base_parameterTypeDef =
-    VoidParam     of typeC
-  | Param         of typeC * ident option
+    VoidParam     of typeC * attr list
+  | Param         of typeC * ident option * attr list
   | MetaParam     of Ast_cocci.meta_name mcode * constraints * pure
   | MetaParamList of Ast_cocci.meta_name mcode * listlen * constraints * pure
   | AsParam       of parameterTypeDef * expression (* expr, always metavar *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
