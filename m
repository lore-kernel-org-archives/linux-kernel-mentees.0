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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9358C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E59C20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax+kMoLm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E59C20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 795B588116;
	Fri, 24 Apr 2020 09:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRHgpmpzcTRo; Fri, 24 Apr 2020 09:18:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B3AD880DC;
	Fri, 24 Apr 2020 09:18:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18311C089E;
	Fri, 24 Apr 2020 09:18:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E784C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 297F78811E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5zG2WM8O3iK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B859E880DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:26 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w3so3533391plz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7rZYxRe2Sz/SF1CBsPRfrtZT5FjMYD5co3xZ8oxX9U=;
 b=ax+kMoLm3IIrCgdTQX2Gm3JD4LhEF5plv3ZtAqoMNdfIcoYZPGjd2FVfUbCSSE4ddg
 M+9WIB8b1hcIMskIcbEq7UjDMQPXbj5pjXqPhY38kuazQ6KoG3GZL5R3oQwxMoRzslYG
 L5H+KhZBhnF22dqlMMRoFw7pj3qdFDfD/jTWBKhiaa7ZsrSd4kenBlEKDfLpsXMUZ7gN
 Ob2DSssZTTBbdbMy6GEfY3En6FuSKY56LfrerDkggsFrPQ3KtCgPjPrDwIIG0+ZHwSMa
 jTD+RFP3sbkMFjcbAZDE30bOrAE/2rn/o27C6craeAhnZ4N04I2lBkApdfwL7lOGAVCA
 rf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7rZYxRe2Sz/SF1CBsPRfrtZT5FjMYD5co3xZ8oxX9U=;
 b=IIuNvXeB/Iw5XRMooEFb30JS6MO1DbcsxHWqCWifZGKu3Jo3Lpr+gIxhvb5rD0Zq0Y
 fhNVWlJqvxHPFGWZqS5infyXWwokAFSr/z9TpEhj37muNZfQC/wKaQ90H0DYCpXhakND
 ro5pwWkXBtYgJQlxnM4XHnEQtcgAtp4ZhmuE6jjg5BtXPKDKA+6wklwRTMJYbsa952jH
 NhPDXLWr6T3wBQOixrbhOf9ghXbBLoLv9rKCHv9KErv3UMU/73P4Ug704i1To7OvlX1C
 m4vehzg8xBQyid46NkEfi6mGc5yYg4NhD3303h+4GXe3h0WxfAtBx0Vr62S4lzGCwHA3
 OUEg==
X-Gm-Message-State: AGi0PuYeOZgGMiAvA0fS565yvzs0kyA/xibmX/uCMIxouI4VVlN4kkiK
 Fkn4BBLzpYyLY8/eHl/x/lX24XDFjx0=
X-Google-Smtp-Source: APiQypLl0zlT037EQQDQ8+HF0G5thYz4Qg5QjEdoEA3+lx2Tc5CQoapKECljGfYOnhddBhqwbGPXFA==
X-Received: by 2002:a17:902:788e:: with SMTP id
 q14mr8138360pll.72.1587719906293; 
 Fri, 24 Apr 2020 02:18:26 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:18:25 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:39 +0530
Message-Id: <20200424091801.13871-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 03/25] parsing_c: parsing_hacks:
	Commentize attributes before qualif/type
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

For the following example from fs/btrfs/ctree.h in Linux v5.6-rc7:

__cold __noreturn
static inline void assertfail(const char *expr, const char *file, int line)
{
	pr_err("assertion failed: %s, in %s:%d\n", expr, file, line);
	BUG();
}

__cold and __noreturn are not labeled correctly, leading to C parsing
errors. Add a case to commentize attributes before a storage
qualifier/type qualifier/type correctly.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parsing_hacks.ml | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
index 74c3ba60..0254fc7f 100644
--- a/parsing_c/parsing_hacks.ml
+++ b/parsing_c/parsing_hacks.ml
@@ -1952,6 +1952,29 @@ let is_type = function
   | Tshort _ -> true
   | _ -> false
 
+let is_type_qualif = function
+  | Tconst _
+  | Tvolatile _ -> true
+  | _ -> false
+
+let is_storage_spec = function
+  | Tstatic _
+  | Tregister _
+  | Textern _
+  | Tauto _ -> true
+  | _ -> false
+
+let rec is_idents ?(followed_by=fun _ -> true) ts =
+  let rec loop l =
+    match l with
+    | x::xs when ident x -> loop xs
+    | x::xs -> followed_by x
+    | [] -> failwith "unexpected end of token stream" in
+  match ts with
+  | x::xs when ident x -> loop xs
+  | x::xs -> followed_by x
+  | _ -> false
+
 let is_cparen = function (TCPar _) -> true | _ -> false
 let is_oparen = function (TOPar _) -> true | _ -> false
 
@@ -2134,6 +2157,16 @@ let lookahead2 ~pass next before =
 	  else
 	    TCommentCpp (Token_c.CppDirective, i1)
 
+	(* tt xx yy *)
+  | (TIdent (s, i1)::rest, _)
+    when not_struct_enum before
+	&& is_idents
+           ~followed_by:
+             (function x ->
+                is_type x || is_storage_spec x || is_type_qualif x) rest
+        && s ==~ regexp_annot ->
+	    TCommentCpp (Token_c.CppMacro, i1)
+
   | (TIdent (s2, i2)::_  , TIdent (s, i1)::seen::_)
     when not_struct_enum before
 	&& is_macro s2 && is_type seen ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
