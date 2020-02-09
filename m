Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760C8C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 11:54:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F5020726
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 11:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj/xcv3f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F5020726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 24975853D3;
	Sun,  9 Feb 2020 11:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFxYRbIhTwGw; Sun,  9 Feb 2020 11:54:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B544B840BF;
	Sun,  9 Feb 2020 11:54:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B11ACC07FE;
	Sun,  9 Feb 2020 11:54:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CA76C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 091FD2049F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFzT48R4cAQv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:54:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 4BE492039D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:54:54 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id ep11so2934781pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Feb 2020 03:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f/YxRyp/EZwJuWxu5M3zEro+v+DimpTMELebddNWZKI=;
 b=Mj/xcv3fUBtS0LAWSnBVF7gXSgiQhOUeXcekumHamXRQNTp+0FMLVAK31l3k43utVO
 7O7TTmL/Io6HH0TiUa9HssRnLqTLU/5sh/f4uS6bzPi6kdj3iWqI8WGzehstlzj9EsiO
 brTB7xwrWBBP19EsF3RORdCISyXTSzTgB8pJsLjAulTGufaF+GOLNBd+yVNSW9IzL7Nq
 CjV2uEGTb4owXmS3Tpn4P1II+qYgjJ98jhNF3HeiW7jO7RkGo/Pz55QaWS0XIxuAWlR9
 50Y7uy4BgV48ogzCEou4kTGpMuWUFzi81wTb2uHHRd9dl1UnM+EJtLuKvZh3qaWC1R89
 lJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f/YxRyp/EZwJuWxu5M3zEro+v+DimpTMELebddNWZKI=;
 b=CCUK//yzmQf/bgtbV9sQ0IbB/ofX/ENXVbGkiuuo54E571qZcZjCd8kz45FYI3fjLd
 tXT/hL0NmaYrSJXk+Hrl4an4JosBw4km4mRmpGxNYuMm79qYn1Mhgh6yrJux6IK7sS74
 SIX8ESwuTNw2UaaqZ/iMR7+BXCGXcOlXHNCO5UQLq8ZSt2wagAI5dDU0eX7dHkkBI/eD
 VelzBst/6Er4C9usKmq3X6fYAzivjpshUCFmIkOryZyY4tYJdsy2y+NruSTMhdIIluFv
 ARVLpjjV552TzmZFkCPisvqFvDAOL4oPzdJFFTSzL+GBDiS9gMVFhTsMVmXEZ975cPtG
 NVtw==
X-Gm-Message-State: APjAAAUBH9+FJENqBTPyxo6EDlKXIj1/G2lbL7mHt7MS11rPtH7ugfM6
 W0Vu+OWeXF91N1vaJRDO3+g=
X-Google-Smtp-Source: APXvYqx1R/YEvZUrdJxsM53HZXOe/sROAIt9FIa6oIlyDJ2yBZdRzlSIWE52myfkVBkFXWj6FurFgA==
X-Received: by 2002:a17:90a:200d:: with SMTP id
 n13mr15319792pjc.16.1581249293719; 
 Sun, 09 Feb 2020 03:54:53 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:166e:dca2:8d98:ad42:3c3b:8544])
 by smtp.gmail.com with ESMTPSA id y6sm8947429pgc.10.2020.02.09.03.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 03:54:53 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  9 Feb 2020 17:24:17 +0530
Message-Id: <20200209115419.32337-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209115419.32337-1-jaskaransingh7654321@gmail.com>
References: <20200209115419.32337-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 1/3] parsing_c: Align C AST and
	Cocci AST for pointer
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

For a pointer, the C parser constructed an AST dissimilar from that
of the Cocci AST. This caused failures in matching with certain
pointer types. For example, for the following case:

char *1 const *2 id;

The C AST constructed would be:
const Pointer1 -> Pointer2 -> char

The Cocci AST constructed would be:
Pointer2 -> const Pointer1 -> char

Change the pointer rule in the C parser so that an AST similar to the
Cocci AST is constructed.

Make necessary changes in the C pretty printer so that the pointer type
is printed correctly.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly      |  4 ++--
 parsing_c/pretty_print_c.ml | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 8d7b761e..4c74f15a 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1333,14 +1333,14 @@ pointer:
  | tmul                   { (Ast_c.noattr,fun x -> mk_ty (Pointer x) [$1]) }
  | tmul pointer
      { let (attr,ptr) = $2 in
-       (attr,fun x -> mk_ty (Pointer (ptr x)) [$1]) }
+       (attr,fun x -> ptr (mk_ty (Pointer x) [$1])) }
  | tmul type_qualif_list
      { let (attr,tq) = $2 in
        (attr,fun x -> (tq.qualifD, mk_tybis (Pointer x) [$1]))}
  | tmul type_qualif_list pointer
      { let (attr1,tq) = $2 in
        let (attr2,ptr) = $3 in
-       (attr1@attr2,fun x -> (tq.qualifD, mk_tybis (Pointer (ptr x)) [$1])) }
+       (attr1@attr2,fun x -> ptr (tq.qualifD, mk_tybis (Pointer x) [$1])) }
 
 tmul:
    TMul { $1 }
diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
index a2e35588..ae02b513 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -804,11 +804,13 @@ and pp_string_format (e,ii) =
              (FunctionType (return=void, params=int i) *)
           (*WRONG I THINK, use left & right function *)
           (* bug: pp_type_with_ident_rest None t;      print_ident ident *)
+          pp_type_left t;
           pr_elem i;
-          iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
+          iiqu +> List.iter (function x ->
+             (pr_space(); pr_elem x));(* le const est forcement apres le '*' *)
           if iiqu <> [] || get_comments_after i <> []
           then pr_space();
-          pp_type_with_ident_rest ident t attrs Ast_c.noattr;
+          print_ident ident
 
       (* ugly special case ... todo? maybe sufficient in practice *)
       | (ParenType ttop, [i1;i2]) ->
@@ -885,11 +887,13 @@ and pp_string_format (e,ii) =
       match ty, iity with
 	(NoType,_) -> failwith "pp_type_left: unexpected NoType"
       | (Pointer t, [i]) ->
+          pp_type_left t;
           pr_elem i;
-          iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
+          iiqu +> List.iter (function x ->
+             (pr_space(); pr_elem x));(* le const est forcement apres le '*' *)
           if iiqu <> [] || get_comments_after i <> []
           then pr_space();
-          pp_type_left t
+          ()
 
       | (Array (eopt, t), [i1;i2]) -> pp_type_left t
       | (FunctionType (returnt, paramst), [i1;i2]) -> pp_type_left returnt
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
