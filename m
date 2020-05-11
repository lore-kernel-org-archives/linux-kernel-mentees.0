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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085B1C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD75C2075E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR2jWkw4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD75C2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C159D86A11;
	Mon, 11 May 2020 10:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFEf7oZvswF3; Mon, 11 May 2020 10:14:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62B3285D40;
	Mon, 11 May 2020 10:14:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5251AC0176;
	Mon, 11 May 2020 10:14:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1700C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ABE5E24C39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bsR2en2SoHty
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 4ECEB24B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:17 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f6so4358506pgm.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96G1ivLh1DBNVuKEJBoB0hDamYQo6rKx1EXrpxqcHM4=;
 b=cR2jWkw4QhGtG2U+3ww86zlTSmN20iIaPzunlWb+ir3luvbVKmGNN/6I28431IOtvK
 AravCKgqVHcFla6fQZSRMNJc6IrKJDB9FleW8zsn8PfEgApgWJV2QtwfVPFuuy1MMegR
 t0UCjYnHkxK2/eIS3en6PG4sNjCd6bA5yaabLkobUIcYGLskzAgG00TJjTuquHGWzQGi
 RQfD4KDwJrueB2uCH3QX6c740UwvWmMTvbM6z79vdsJo4BkgEzf8dyJQ/26jomkjrZXr
 h6YpyL/0ona+iNxAgdQ51j2LNbfDzv8Rg2/1QD8biCIUmzt9RctCU5Zta90cM5uW/2j4
 7A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96G1ivLh1DBNVuKEJBoB0hDamYQo6rKx1EXrpxqcHM4=;
 b=gkLK7SwF8ICBmgqI4myq550R6u1kEd5TlJpqdPdBIIg6V2vylaQZnZSMXOOTAqJp5u
 8I8leyoiZQDjrXoT7AKsRQngJFaECBpOIO9l4aw6Q0Sza5yZVSUzO1f1OXQHD9+NOy/N
 /W86t1bKns06YFxpuI6loYP/BkeKk7aPcmdmPxZ+2FD3z9wqyeODJleDiet+3k50YO+Q
 Snf/GbPrWU6pzzM2yWK4NsI+YZQJiuxtSwnHUGOnLyI5CHfjweZJ0Y+/s0kJ6OaDYXby
 qswKxc5Y7ZhMGMwSYD2A3HBRnHbRCj/w9MUVBl1pfDXG36yvD6l7atNSv3d22ofWtU1b
 qFGw==
X-Gm-Message-State: AGi0Pub2X1Co95RqJp6kXbYtuec318ha13jJgucDJlE3aiuRs/ScDszG
 irtpNio4JmJVmUBMlBNkuVc=
X-Google-Smtp-Source: APiQypLaK8hQAghusADmdDc1HZt6Tij51yXMTt15vTD9XDnLdnxIUsEH373ZJXyHLgbU5XGFgQEgTA==
X-Received: by 2002:a62:1c89:: with SMTP id
 c131mr14622572pfc.164.1589192056876; 
 Mon, 11 May 2020 03:14:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:16 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:53 +0530
Message-Id: <20200511101300.11101-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 16/23] parsing_cocci: ast0toast:
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

Parameter attributes are added to the SmPL AST. Reflect these changes in
ast0toast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0toast.ml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/ast0toast.ml b/parsing_cocci/ast0toast.ml
index 09c28c06..80d38138 100644
--- a/parsing_cocci/ast0toast.ml
+++ b/parsing_cocci/ast0toast.ml
@@ -857,10 +857,11 @@ and designator = function
 and parameterTypeDef p =
   rewrap p no_isos
     (match Ast0.unwrap p with
-      Ast0.VoidParam(ty) -> Ast.VoidParam(typeC false ty)
-    | Ast0.Param(ty,id) ->
+      Ast0.VoidParam(ty,attr) ->
+        Ast.VoidParam(typeC false ty,List.map mcode attr)
+    | Ast0.Param(ty,id,attr) ->
 	let allminus = check_allminus.VT0.combiner_rec_parameter p in
-	Ast.Param(typeC allminus ty,get_option ident id)
+	Ast.Param(typeC allminus ty,get_option ident id,List.map mcode attr)
     | Ast0.MetaParam(name,cstr,_) ->
 	Ast.MetaParam(mcode name,constraints cstr,unitary,false)
     | Ast0.MetaParamList(name,lenname,cstr,_) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
