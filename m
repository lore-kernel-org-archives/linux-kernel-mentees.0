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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DCBC7C8A1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B67AB20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFykXHTJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B67AB20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 959BF87D7F;
	Mon, 27 Apr 2020 12:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWuyd8WC5I0p; Mon, 27 Apr 2020 12:10:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F42187D48;
	Mon, 27 Apr 2020 12:10:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F5BDC1D87;
	Mon, 27 Apr 2020 12:10:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FD57C1D74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1F94387D5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DaQLrhda9J+T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BC42787D48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:00 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id t9so7452128pjw.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TV0hQbWPE6I76/eXMWA6DfzgeTBXmkrL8f2jcsCkf6M=;
 b=XFykXHTJUnmfHwxVJBT+GrMJwkXlKejUejMWI37lo3fMnJ7a54q4mbdXHF/Yq8C9gM
 9Qw1gkA7U7I+251l6XKLHnjeJgrO+gNIdEdEDyyWsxyfrjIOlgpvXRiu8U8o9tlEavH0
 tmdvlUYTrjyNa6r+N64+vfwGgOFe3aJmUdnm0aF2gwKgmGLIbacxKH27318o8YM41a4s
 Q7ogCkjB49da2fWtAJTr3vuWL4uSAtn01imVJ9vpc3GS3W83cY75iHJ9KQxLeDDNzxni
 bf6nJ9n7G0Md5FGIMVlqMNsBkwJraEGJXboFJHmJ1hLOo0oRISZFx44m2A2liaoEN928
 0kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TV0hQbWPE6I76/eXMWA6DfzgeTBXmkrL8f2jcsCkf6M=;
 b=Os7W5E2Nm8mU/49WySWuA9dhUbI7e0GPbQ4Pa5R4IuxEFzUQQRQvQ+ADvLeGs2815t
 I/gaV8fZuQB3601rsQQGRSexn7pWsUklYNFsJQhs9mmvejBpv7WNNOacSfcX7mdblGVt
 GlkXcVojyhZDG4ZVUGy3YdlLYZW/oTyIlBuoig5/h/+03xX1UGLiQ0z7Xuy2BUXx/x3z
 WkVxRx36wUYdPpv+Z8BKLXyz192v9YkevC9XKPPbystoDny3iZTEttjjXa99RfkxWykn
 HWDGgixFtDIuceot/N9N0/em2iWY9cpUWYqlVgpI3IchxNCJBpBF6Bi7bvl+JFoq4hLQ
 ftJA==
X-Gm-Message-State: AGi0PuYWLVOgXkSVolXwlQVIuami2fg4DtpO7P2DvRxOD+X5hzVEbsmT
 PScgYRIFxbNpnFkChDn1zZu9TzotDLI=
X-Google-Smtp-Source: APiQypLyTnGrTHyYnknK9WQhzBklWrnjk/ZUhuFMnwGbhCGFImwXysm5JxOe0CYQ3/uEOptNqrDipQ==
X-Received: by 2002:a17:90a:32ea:: with SMTP id
 l97mr23042764pjb.50.1587989400281; 
 Mon, 27 Apr 2020 05:10:00 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:59 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:30 +0530
Message-Id: <20200427120834.380-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 19/23] parsing_cocci: unify_ast:
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
unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index 68cb6613..e2b92c48 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -542,11 +542,17 @@ and unify_designator d1 d2 =
 
 and unify_parameterTypeDef p1 p2 =
   match (Ast.unwrap p1,Ast.unwrap p2) with
-    (Ast.VoidParam(ft1),Ast.VoidParam(ft2)) -> unify_fullType ft1 ft2
-  | (Ast.Param(ft1,i1),Ast.Param(ft2,i2)) ->
-      unify_fullType ft1 ft2 &&
-      unify_option unify_ident i1 i2
+    (Ast.VoidParam(ft1,attr1),Ast.VoidParam(ft2,attr2)) ->
+      if List.for_all2 unify_mcode attr1 attr2
+      then unify_fullType ft1 ft2
+      else false
+  | (Ast.Param(ft1,i1,attr1),Ast.Param(ft2,i2,attr2)) ->
 
+      if List.for_all2 unify_mcode attr1 attr2
+      then
+        unify_fullType ft1 ft2 &&
+        unify_option unify_ident i1 i2
+      else false
   | (Ast.MetaParam(_,_,_,_),_)
   | (Ast.MetaParamList(_,_,_,_,_),_)
   | (_,Ast.MetaParam(_,_,_,_))
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
