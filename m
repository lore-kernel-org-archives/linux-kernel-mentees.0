Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CEAC35254
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:03:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB50217F4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3K3EBL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB50217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59FFC85C1D;
	Wed,  5 Feb 2020 13:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BObN5uMaTU65; Wed,  5 Feb 2020 13:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E7A4785C08;
	Wed,  5 Feb 2020 13:03:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D20D4C1D81;
	Wed,  5 Feb 2020 13:03:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DAFDC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 873DF87919
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vDkZ5nb8Jper
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:03:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D00987807
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:03:57 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y73so1198073pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 05:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T4sLQ+yI9jhZw7bh/zJf2U1VnqtoyxbY1frYKtrY/R0=;
 b=A3K3EBL1QRuFMDBs0znyuc4E9dv/nt7AJOZBFb8l8+1duBy7DDVZwnCX0OiZKiwELU
 5/3t1a9Ql6KldFNvvmfmi2wdTbrRi0/wn11u5DjuMjiQJ1JKERGaXyxzPsi34icXZ/qp
 mcPKH0Dg610caJAv9mlswkhcI+F7psDd1YIH7vKFmzuKx3vilSeH+vys9jQBYz+YduUc
 Yj/mEm2Sd1NIr1tmENASa0Snja6w3h1b5FT1znUBDoBL6SfuJw8ytIMJHK4wnkUiNnaJ
 8dw/sGV5FH5shvlDF3y0MtaqlCOYfVoRQ0u1D92vKfRDATDE77/wxMTz+VuagrocEwaZ
 D9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T4sLQ+yI9jhZw7bh/zJf2U1VnqtoyxbY1frYKtrY/R0=;
 b=AzkFdRfIQ6CCyjOZdkq9wd9J2RO59Hi+pEvFvbygdPg+OncZFfk4rtDs8IRxhoVw8J
 gFFdJHfrJBXkiOwleWrb5mKWBgnEP/k+dyx8TQybwI8W4BjreupYNWYiqxHcBuUGspmt
 0J9+zRLhUZPamsYjFPxrJpqIUvxqKG/cWa+JD8m/3hnChDneFBBtYqAPwyEJ+OiTYnr9
 WESeeFTkkcEBAZDhHVxekLauLOZqIa2EJkjIHOUqvBqR0W19lv6tx8E2QbvgHjbceuw6
 LqCD+066XRFlQNkfMJPMJP7+OXoQUbomsL42DJI7fMwpDDVvGZ3/Q7Ji5+z02mFW9pZ9
 9xJA==
X-Gm-Message-State: APjAAAVgQxeMKQDSoQcRE0M3rtoRV/B86osotuAYaRM1mFQtWwseq3Io
 ZAvZUEbxMB/OAxa8cEfuZo4=
X-Google-Smtp-Source: APXvYqyhGdZ0ThCNxogrLhW45GWXOZVFOCGmQOXBGaDHxjSjVjB51HYpcxItMLMFlYVamj+laMi9Iw==
X-Received: by 2002:a62:7bcb:: with SMTP id
 w194mr37228503pfc.216.1580907836543; 
 Wed, 05 Feb 2020 05:03:56 -0800 (PST)
Received: from localhost.localdomain ([2405:204:30e:4a31:b268:7a3:7dc6:f288])
 by smtp.gmail.com with ESMTPSA id
 q6sm28137098pfh.127.2020.02.05.05.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 05:03:56 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed,  5 Feb 2020 18:33:26 +0530
Message-Id: <20200205130327.6812-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
References: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] parsing_c: Align C AST and Cocci
	AST for pointer
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
 parsing_c/parser_c.mly      | 4 ++--
 parsing_c/pretty_print_c.ml | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

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
index a2e35588..40b89fe5 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -804,11 +804,12 @@ and pp_string_format (e,ii) =
              (FunctionType (return=void, params=int i) *)
           (*WRONG I THINK, use left & right function *)
           (* bug: pp_type_with_ident_rest None t;      print_ident ident *)
+          pp_type_left t;
           pr_elem i;
           iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
           if iiqu <> [] || get_comments_after i <> []
           then pr_space();
-          pp_type_with_ident_rest ident t attrs Ast_c.noattr;
+          print_ident ident
 
       (* ugly special case ... todo? maybe sufficient in practice *)
       | (ParenType ttop, [i1;i2]) ->
@@ -885,11 +886,12 @@ and pp_string_format (e,ii) =
       match ty, iity with
 	(NoType,_) -> failwith "pp_type_left: unexpected NoType"
       | (Pointer t, [i]) ->
+          pp_type_left t;
           pr_elem i;
           iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
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
