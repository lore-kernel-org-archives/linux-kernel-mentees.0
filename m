Return-Path: <SRS0=bPvr=ZL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E75C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Nov 2019 09:43:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC2522304
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Nov 2019 09:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t2TNBod+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC2522304
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC4BA880C8;
	Tue, 19 Nov 2019 09:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NH8vND-ej0eF; Tue, 19 Nov 2019 09:43:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2D9C287FE3;
	Tue, 19 Nov 2019 09:43:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 122DFC18DE;
	Tue, 19 Nov 2019 09:43:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90554C07AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 09:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7C80421FFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 09:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdOSNlH94oA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 09:43:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id F3BDE20131
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 09:43:17 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b1so1603551pgq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5Xd4M81fImO3/kEvtaMUcgFwYoI1za0ht4Hkwi0Pas=;
 b=t2TNBod+gT6gy5nr335xeqzR678kaEZH7MmuWg7ax6S/VYsz7RxhUOINJP1qPNaATK
 EdGJWGe+Af4fv9+2/GVqd3f+ma7rDyQgKikTcHDCpkiUeXXoWO1byT1xyEJ/A/GgXbUZ
 ONy54QNJEFFSZO/mYhlzTnBc/F+KOP9iXvSV7/WKPkejUKWKaR05NQOcU7Eza+AMFsOZ
 3sOuXEbye9hD5Tju1S5M8hhWiOqsq1j7Ovn1MgCYllgZPOii3Q7OoWfQ+agUPSTOylOP
 4F6JoP2YYgU+OLABN0q0mzIuyTDqgq7jrqGyjEMw3JSBouENduSZNWOKjMe9yt4Omwi0
 n5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5Xd4M81fImO3/kEvtaMUcgFwYoI1za0ht4Hkwi0Pas=;
 b=hwgac9ru373C/rOGgrvSH/FBlXkV/w926LG8G7+e6DH5gduGmUxOXqTUhNkGMFgCZs
 7x0dz2Ox/rJZqGGwKzoBgMLX30qGXkFKfZOVv9XOrmj/MdygaSuqJ0Y1EiLosR5ys1JT
 C0BgNpuVPPkDu3OEIWiZg2iKtpCPF1lcMibTEDMXOUb/lSyowpZGjigKs0bJ2OLo4AaP
 OJ9rEFXppSXOn0OYptqu5uOOLK93peJ0Z4RI5rrmnddP4ahuWyykaX+0vEbvYiT4tziy
 QdGXXyYw9327jVlnjJqn6x7tt5lUYujQAHODZ+LCrLrgOmo+LXZmfU5WO5mQK3ZGyrG3
 rdKA==
X-Gm-Message-State: APjAAAUko7JHik6ZMYJ1WM0OxItYKim9ZL2xac/V97DOef5r//32X+i+
 zqwQwobhzYX210eaUmPizJxwAtHaQU0=
X-Google-Smtp-Source: APXvYqxXoXqEz1ufn4CCX5LFA6C1yC6sJ72v5Vf8S/DMLsouB+JgknLi3fYbpsaaScZ5lvsXvpgb8A==
X-Received: by 2002:a17:902:900b:: with SMTP id
 a11mr32678325plp.116.1574156119022; 
 Tue, 19 Nov 2019 01:35:19 -0800 (PST)
Received: from localhost.localdomain ([1.38.144.63])
 by smtp.googlemail.com with ESMTPSA id 83sm23636616pgh.86.2019.11.19.01.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 01:35:18 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 19 Nov 2019 15:04:07 +0530
Message-Id: <20191119093407.23603-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: julia.lawall@lip6.fr, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] parsing_c: handle space and ctx
	newline around minus toks
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

Handle the following case:

	space + minus + context newline

In this case, the space should be dropped except if it is followed
by any newline. This should be done just before the minus tokens
are removed from the token stream.

This is useful for situations like the following. Here, the space next to
the right paranthesis should be dropped:

	if(a)
	-{
	-result = b;
	goto c;
	-}

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_c.ml | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/parsing_c/unparse_c.ml b/parsing_c/unparse_c.ml
index 778a59ab..c6478c5a 100644
--- a/parsing_c/unparse_c.ml
+++ b/parsing_c/unparse_c.ml
@@ -1300,21 +1300,28 @@ let rec drop_space_at_endline = function
     drop_space_at_endline rest
   | ((T2(Parser_c.TCommentSpace _,Ctx,_i,_h)) as a)::rest ->
     let (outer_spaces,rest) = span is_space rest in
-    let minus_or_comment_or_space_nocpp = function
-      | (T2(Parser_c.TCommentNewline _,_,_i,_)) -> false
-      | T2(_,Min adj,_,_) -> true
-      | (T2(Parser_c.TCommentSpace _,Ctx,_i,_)) -> true
+    let match_till_context_nl = function
+      | (T2(Parser_c.TCommentNewline _,_,_i,_) :: _) -> false
+      | (T2(_,Min adj,_,_) :: _) -> true
       | x -> false in
-    let (minus,rest) = span minus_or_comment_or_space_nocpp rest in
-    let fail _ = a :: outer_spaces @ minus @ (drop_space_at_endline rest) in
-    if List.exists is_minus minus
+    if match_till_context_nl rest
     then
-      match rest with
-      | ((T2(Parser_c.TCommentNewline _,Ctx,_i,_h)) as a)::rest ->
-        (* drop trailing spaces *)
-        minus @ a :: (drop_space_at_endline rest)
-      | _ -> fail ()
-    else fail ()
+      let minus_or_comment_or_space_nocpp = function
+        | (T2(Parser_c.TCommentNewline _,Ctx,_i,_)) -> false
+        | T2(_,Min adj,_,_) -> true
+        | (T2(Parser_c.TCommentSpace _,Ctx,_i,_)) -> true
+        | x -> false in
+      let (minus,rest) = span minus_or_comment_or_space_nocpp rest in
+      let fail _ = a :: outer_spaces @ minus @ (drop_space_at_endline rest) in
+      if List.exists is_minus minus
+      then
+        match rest with
+        | ((T2(Parser_c.TCommentNewline _,Ctx,_i,_h)) as a)::rest ->
+          (* drop trailing spaces *)
+          minus @ a :: (drop_space_at_endline rest)
+        | _ -> fail ()
+      else fail ()
+    else a :: outer_spaces @ (drop_space_at_endline rest)
   | a :: rest ->
     a :: drop_space_at_endline rest
 
-- 
2.21.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
