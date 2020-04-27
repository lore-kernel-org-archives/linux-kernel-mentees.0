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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B1BC7C8A2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0621920656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt9FvGmz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0621920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE8B787D5E;
	Mon, 27 Apr 2020 12:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oq8h4GSDFI4X; Mon, 27 Apr 2020 12:09:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A08687D40;
	Mon, 27 Apr 2020 12:09:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A5E6C1D74;
	Mon, 27 Apr 2020 12:09:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AE1FC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 05A2E87D40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1jy4MczwRaa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A679587D39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:37 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id v2so6918691plp.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UvHa+JnzOSwV06PrvaE7jD1s2TVcEm/6dw+RStRj2F4=;
 b=Pt9FvGmzwq78DXZ+zdBTr65mGm3QzIIwg49HtSsqiy4wpaTLPmkt4pbMD4GV8Kd+et
 4B/hBbDrYZiczDKCAk3MXwoPLYLeevW8fB1oPq97PIzk4YNPbReYH5KbrsK5feEchhV7
 8eGzECv7vi3FrTYK/UfgcabKfjBf4TgILuU+QxidUHJ/EmRUg28UvCKoEAxvhvv6hE1t
 Y8F2fMkdiPxpnKt/ngCiF6R6e7DI0bSLY8tPl6kRzZs5A7O1JFRWiFaySD1EE3+5w7I7
 Ad7huZGu5rkTXcAJ7uIrTk2nCDy/46i5EDT9hfO6kAId567PQScl9lH/WiYh+9swm36Q
 K2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvHa+JnzOSwV06PrvaE7jD1s2TVcEm/6dw+RStRj2F4=;
 b=NW7wKpYSlNHACsXS6f+w/8xojVyD+qqcksqh9L3V5Xp+lx8XsOFyaSK3QjrE9WOc41
 BwAAq7trOusK7l3wpa8WtFUihFCTgz1ZxY3o7A6vrTzpuXIHn400Bwd+t/VrGMVv1acB
 IVHyndfmZDgLm4XQkIfO9baU4lLTXiNC7mnQMuNMSms13x5I51oB1df2aY2iqg5XcEw6
 /uFDJ1kIyvulvZL87Ck0Hicod5JCbqPb1DouUAkS6ekuUQob42JsSRL6aCHnbHEopg/X
 MRxz7iJEau9s/AO5ckYFUncuf+HgPuA17Jzi1kWQuFoVMRLgA2XvRicRdfSgcZKmXKKc
 bKZQ==
X-Gm-Message-State: AGi0PuYm4C2c9x1Rd2vEmEffEe69+VcWc17Zw9qnM2DSnrKiOdhG7idV
 DX4t+8gtWLC9EL7DePWtCUQ=
X-Google-Smtp-Source: APiQypLm8ctJ0+LH8caGKQZdrqUw/p2NZa6frop0eGbmRYDLgfR6bKMabZXaBaCE18sANhj/RFeAVg==
X-Received: by 2002:a17:902:b08e:: with SMTP id
 p14mr7189929plr.326.1587989377236; 
 Mon, 27 Apr 2020 05:09:37 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:36 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:23 +0530
Message-Id: <20200427120834.380-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/23] parsing_cocci: unparse_ast0:
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
unparse_ast0.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unparse_ast0.ml | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
index fdaf6cfa..738549fd 100644
--- a/parsing_cocci/unparse_ast0.ml
+++ b/parsing_cocci/unparse_ast0.ml
@@ -546,9 +546,18 @@ and parameterTypeDef p =
   print_context p
     (function _ ->
       match Ast0.unwrap p with
-	Ast0.VoidParam(ty) -> typeC ty
-      | Ast0.Param(ty,Some id) -> print_named_type ty id
-      |	Ast0.Param(ty,None) -> typeC ty
+        Ast0.VoidParam(ty,attr) ->
+          typeC ty;
+	  (if (attr = []) then print_string " ");
+	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
+      | Ast0.Param(ty,Some id,attr) ->
+          print_named_type ty id;
+	  (if (attr = []) then print_string " ");
+	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
+      |	Ast0.Param(ty,None,attr) ->
+          typeC ty;
+	  (if (attr = []) then print_string " ");
+	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
       | Ast0.MetaParam(name,_,_) -> mcode print_meta name
       | Ast0.MetaParamList(name,_,_,_) -> mcode print_meta name
       | Ast0.PComma(cm) -> mcode print_string cm; print_space()
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
