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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EF3C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E6620720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSFKVkVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E6620720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AAC8B86169;
	Mon, 11 May 2020 10:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SG6FzJ6YZm6; Mon, 11 May 2020 10:14:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 44C3F85D40;
	Mon, 11 May 2020 10:14:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33A1FC0176;
	Mon, 11 May 2020 10:14:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF3CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1E81C86D13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3fWJAmDCQHs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ADAA286C24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:13 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w65so4523406pfc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1IRKXoXy4oSxJMoDJYQIKQOJHNCxCdagozC+STAuSk=;
 b=XSFKVkVYc3FTkdicKvVqoQX1jedu+ryGGb2CmjnM2dETKczNe0o7O8vjpCWwv0B9sj
 R3ZUxMYykm8gtn3BZWsBaxfzYi2U1j8+2WwZOyjIvx+Icxe6eQ4EXJC2SDrJmhY53qbb
 o7BNnIUN0QAH8nB3mUNuAZDeFmhafEe/iOCNtVkzME5400Tj6x2JtfDtgn6p7ON1U4rl
 oQW88HOrNVmqF7aTCvWAGoU7/Dj7IOEd+m28uoEEXwGfWbxqbN1yyBqkcDoiRkF8MHHl
 t4mWYpZ+6nn+iG800NIHHgQgQ7j5066slf6MD0JoCpb9uxHILcGwqse4eevqhjbl8UjC
 lJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1IRKXoXy4oSxJMoDJYQIKQOJHNCxCdagozC+STAuSk=;
 b=bWawNzqTGc9Ro1llfy9KnZZRVuNPgWthUoPZzKBRZR+hU0dPRqDBKLb+hXiv6HUL1l
 As2MQ2WEC64UkvjI2/rEfZTNC5DdD/aHSVMvemk+bWJOOqfxR5UHcopuwGoLZ+ruyJGc
 2Vlyueqvy5S17XmiNsW2mcf5YWGKRIQMswFNjSgRZt/1kUZqrSwKFLDVhml7ghPPkcp0
 aD47StqJDgKJzscHTrwFXQEYJd8r7pDtXfLzgyeIkvpUu1QTI4sUwbWHgLeDDEnVGh04
 lPUEnlOrOz5ybQz/3SJjoZxcrv2+hLVHsTWs1Wa8duBILmgSZF3ZnnCivWBzA9kMqTXc
 rYug==
X-Gm-Message-State: AGi0PuZENIuoMNLtHEj4OQKWSSTZw6g/F3dBkCzKtuXDByu2S4Ef4HSH
 7m9XCd91AJVnjfJr635acE8=
X-Google-Smtp-Source: APiQypIPnWlD29Ahi/Saw72hs2UWi0TVl+G5cCNW+vgxb7eYXVgxBw11N/Q45KXGZfZAoqiA+ZnSyw==
X-Received: by 2002:a65:6251:: with SMTP id q17mr13756226pgv.4.1589192053247; 
 Mon, 11 May 2020 03:14:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:12 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:52 +0530
Message-Id: <20200511101300.11101-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 15/23] parsing_cocci: visitor_ast:
	Visit Parameter attributes
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

Parameter attributes are added to the SmPL AST. Visit these attributes in
the AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 8e530114..63eab999 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -621,9 +621,18 @@ let combiner bind option_default
   and parameterTypeDef p =
     let k p =
       match Ast.unwrap p with
-	Ast.VoidParam(ty) -> fullType ty
-      | Ast.Param(ty,Some id) -> named_type ty id
-      | Ast.Param(ty,None) -> fullType ty
+        Ast.VoidParam(ty,attr) ->
+          let lty = fullType ty in
+          let lattr = multibind (List.map string_mcode attr) in
+          bind lty lattr
+      | Ast.Param(ty,Some id,attr) ->
+          let lid = named_type ty id in
+          let lattr = multibind (List.map string_mcode attr) in
+          bind lid lattr
+      | Ast.Param(ty,None,attr) ->
+          let lty = fullType ty in
+          let lattr = multibind (List.map string_mcode attr) in
+          bind lty lattr
       | Ast.MetaParam(name,_,_,_) -> meta_mcode name
       | Ast.MetaParamList(name,_,_,_,_) -> meta_mcode name
       |	Ast.AsParam(p,asexp) ->
@@ -1582,8 +1591,11 @@ let rebuilder
     let k p =
       Ast.rewrap p
 	(match Ast.unwrap p with
-	  Ast.VoidParam(ty) -> Ast.VoidParam(fullType ty)
-	| Ast.Param(ty,id) -> Ast.Param(fullType ty, get_option ident id)
+	  Ast.VoidParam(ty,attr) ->
+            Ast.VoidParam(fullType ty,List.map string_mcode attr)
+	| Ast.Param(ty,id,attr) ->
+            Ast.Param
+              (fullType ty, get_option ident id,List.map string_mcode attr)
 	| Ast.MetaParam(name,constraints,keep,inherited) ->
 	    Ast.MetaParam(meta_mcode name,constraints,keep,inherited)
 	| Ast.MetaParamList(name,lenname_inh,constraints,keep,inherited) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
