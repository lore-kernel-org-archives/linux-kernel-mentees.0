Return-Path: <SRS0=FkPF=7T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA98EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Jun 2020 13:54:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61102206A2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Jun 2020 13:54:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAwTrfqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61102206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1121E884A1;
	Sat,  6 Jun 2020 13:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDhd1ov9+phQ; Sat,  6 Jun 2020 13:54:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D351788457;
	Sat,  6 Jun 2020 13:54:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6649C088D;
	Sat,  6 Jun 2020 13:54:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A298C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Jun 2020 13:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7345585F95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Jun 2020 13:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIDUCpHJvPVM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Jun 2020 13:54:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 768E285F93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Jun 2020 13:54:15 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id jz3so3838550pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 06 Jun 2020 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QFD98B05ZSExaCbo2dTU/He13s/4duWpGEACJla/iM0=;
 b=ZAwTrfqtlGdwgCpV89qAjsbuVmwtSBoDVpP7QKIV98VKZvZc6f1ULMFSJ6mtSCUg/Q
 /mWOGWIaFw1EWMGFOq/y8VJIuqE5PNTq0BzmEUUY3wdw4azSi2Y8q+yRJeC/vKt9jo0/
 +VvzWwIatzf01NotPyY1KIw1GWQgUhJbFUvHDEFWZW7MMxQDx11WR7240WS6VcE9/VRl
 vtS1dlXn4Juof/ImjZxSpWJwdUXiLkQJuXNiR0vVTYWPFmM9ofP5v4JruGGr9GAH79up
 JjJVokIEWJg+AtY0YkEeVgQvJ9te6YnYdcq4h0K1ObePsv9q8Z8/yQVikk84aV6w4HKZ
 /t2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QFD98B05ZSExaCbo2dTU/He13s/4duWpGEACJla/iM0=;
 b=f+ldDx5hT2KSlM44dSrFq5ZRysl6qGi7tfGkj3IgwU5AFTgB6us0BlWCN/SBAJDCDj
 a3ENN3MgYJ65BouEbMJ+431KzOJ9VdPDPi6kKqEfW3oQ7ndzJa9ngiEiPhlYtcRhbdsK
 /glEGUyhZ35UN3bkXbMG6H1ZPAavcKV1udugi+1BuXPpHRfj0VBSxrU42TH/S8f2UHb4
 GIiyh55ISuMuQ+oc6sEImt34EkXxJ3Qu757xYTQ2si7yxIscoW9tw4rfeNzXgOw8EwFf
 EaRIP03j+Z6EKsqjh4p224JtwZEfGGD16i1JXQhGKfHsn6u3kn3ttobKWAjMKWH0wgXp
 JKaA==
X-Gm-Message-State: AOAM531EkGmeVo/k6Kc6iLgwoqVh1kfEbCPjRaaNnQcfpViNS8V7bgri
 qQ2kt/veqQBOkm1rq+ccisQ=
X-Google-Smtp-Source: ABdhPJxXzUl6I6eT3mV5/KCYNXCFPgzHm/oy4FIS6Kt9bne8uwStUmo6JtxUWVgKDphB6pVaeO2zFA==
X-Received: by 2002:a17:90b:384c:: with SMTP id
 nl12mr7498778pjb.108.1591451654855; 
 Sat, 06 Jun 2020 06:54:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:28b:e8d7:7fc3:eb75:1ea0:39fe])
 by smtp.gmail.com with ESMTPSA id
 l4sm2062657pgo.92.2020.06.06.06.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2020 06:54:14 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sat,  6 Jun 2020 19:23:42 +0530
Message-Id: <20200606135342.12584-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-24-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-24-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 23/32] parsing_c: type_annoter_c:
	Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
type_annoter_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
Changes in v4:
- Change 't, e, a' to 't, a, e' in the Cast constructor for
  consistency

Changes in v3:
Rebase as follows:
        v3 of "cocci: Add Parameter attributes to SmPL"[2]
        v3 of "cocci: Improve C parsing of attributes"[3]
        gitlab master branch (ffb87d9d)

Changes in v2:
parsing_c: parser: Pass attribute list from type_name
- Warn about dropped attributes in typeof and sizeof productions

parsing_cocci: parser: Parse cast attributes
- Mention in commit message that cast attributes are matched anywhere
  in a cast.

parsing_cocci: arity: Reflect Cast attributes
- Apply mcode2arity on attributes as well.

parsing_cocci: visitor_ast: Visit cast attributes
- Typo in commit message (AST0 -> AST).

parsing_c: pretty_print_c: Reflect Cast attributes
- Less space in front of [

parsing_c: ast_c: Add Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: parser: Parse Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: pretty_print_c: Reflect Cast attributes
- Switch places of expression and attributes in Cast type.
- Change printing order of cast elements.

parsing_c: type_annoter_c: Reflect Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: visitor_c: Visit Cast attributes
- Switch places of expression and attributes in Cast type.
- Change visitor order of cast elements.

engine: cocci_vs_c: Match Cast attributes
- Switch places of expression and attributes in C AST Cast type.

ocaml: coccilib: Reflect Cast attributes
- Switch places of expression and attributes in C AST Cast type.


 parsing_c/type_annoter_c.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_c/type_annoter_c.ml b/parsing_c/type_annoter_c.ml
index dfd363b2..25cb6c0e 100644
--- a/parsing_c/type_annoter_c.ml
+++ b/parsing_c/type_annoter_c.ml
@@ -525,7 +525,7 @@ let rec is_simple_expr expr =
       true
   | Binary (e1, op, e2) ->
       true
-  | Cast (t, e) ->
+  | Cast (t, a, e) ->
       true
   | ParenExpr (e) -> is_simple_expr e
 
@@ -961,7 +961,7 @@ let annotater_expr_visitor_subpart = (fun (k,bigf) expr ->
 
 
     (* -------------------------------------------------- *)
-    | Cast (t, e) ->
+    | Cast (t, a, e) ->
         k expr;
         (* todo: if infer, can "push" info ? add_types_expr [t] e ? *)
         make_info_def_fix (Lib.al_type t)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
