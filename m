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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E39C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:24:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3980B212CC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:24:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2qbNJbK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3980B212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1A85C8715D;
	Thu, 28 May 2020 12:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQIShBIuw_63; Thu, 28 May 2020 12:24:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B7F7870F7;
	Thu, 28 May 2020 12:24:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B340C088D;
	Thu, 28 May 2020 12:24:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5214C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9F13288C3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pscLgYegrocC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1728A88C30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:51 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id ci23so3041997pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7rZYxRe2Sz/SF1CBsPRfrtZT5FjMYD5co3xZ8oxX9U=;
 b=p2qbNJbKh1tYHNFAD1TOdvrjaa2Zv6dfWxu6Xj7uoVYtWrAxgMnzMwbdCS0BNFhPv/
 eY8kJdK7DPBVJATJgSwxFaeGdCdIIWMjcJRjLFtzja0tFVtsyRilz9NZ4Ae/vBfgK/Zi
 /Or7uCRQsgokoEaivFolGC1uF9LaGp38r8qrCLl+LlyFYvzb+qqA0m5lbRb/mltOvT+0
 DB449kJrspmftzQVvuPkkxHz/2HEJNuLpae4E3R3/Vqoeni8ZJdcnry+xMgUBq37M1RK
 xt7pK12eVOEJiUsalOnxr4lMlBUTGKXK0dzCy9FGEZHjfEElom2A2iwY21vnpPIEuD2l
 KBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7rZYxRe2Sz/SF1CBsPRfrtZT5FjMYD5co3xZ8oxX9U=;
 b=VKnl7bVFpDEaOJRG6+6icxZQg1A31Y1jcqOUt4zeTqKI1RTiJh7z9dg4sbvfjno2QA
 xM2RuTZZL5cXrZBI7Z0oFma/ru49MMmKnd7xBglD7wjHQKjeHxBVedfX7roO6xlbCH/t
 /zTTO99d1Ix7/x124dbkKDXkrmbs/ad1C/MdmOGlULAvUYvcw0Gsiy77Sn7K+VKKvtDw
 tZ9LZIRFZB6+ZS5PyWsbSkReny40DJbp8iwRDadGGYkk9g1FZ8A36zL0lT/+6C45oitL
 IRvddqbB1ZYv+yMzjmiSv6woUPdMosE7UUSFMN6wakGqImC/dW+zbhS5hMQexYz5UwDY
 Qf2g==
X-Gm-Message-State: AOAM531SABaqkKT0Ch4DJR2fn9VlbYgordoGlDlvsDAH5lHmRU43WxER
 Xls3bwgzxNH8+dKiWXPOUfo=
X-Google-Smtp-Source: ABdhPJwPWX+X3N67i74tHc8wp6Chun7bEhZeV3lFazC8xF0suRajYlLNI5FcCJtUgxQ8mtbl3oCS/Q==
X-Received: by 2002:a17:90b:80f:: with SMTP id
 bk15mr3628404pjb.51.1590668690457; 
 Thu, 28 May 2020 05:24:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:24:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:05 +0530
Message-Id: <20200528122428.4212-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 03/25] parsing_c: parsing_hacks:
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
