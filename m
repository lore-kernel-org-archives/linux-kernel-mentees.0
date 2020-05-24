Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D66C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04DE1206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKmvrLRJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04DE1206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE28D880C3;
	Sun, 24 May 2020 17:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Sczaw9VqGGG; Sun, 24 May 2020 17:20:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56A6F880C0;
	Sun, 24 May 2020 17:20:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4468AC0178;
	Sun, 24 May 2020 17:20:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 105D7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F385D874F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hexlF8+z8Y57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 876908746E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:31 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id q24so7579192pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsXmpuYiU3H+YSGw86M+yfarFqH71sZdfBhnw8U00xw=;
 b=ZKmvrLRJqPSOjPNzy8DmG9skzh6XTJQ4XwHSY6sdLbwp1VLBLTu8+Tl/4OR5FIsT/e
 9N80fPvbLNUnlHRkJSZSIpD8q6aWUT4fcFPNDTeSeb/9HvbiMjhoIFXJ71wcw/NzYc25
 eD3uuNXf0a6gRTIIxAgpURI/ttoZLjl2PJ476uGJFNNCwDo1qpSjglYy6TtrQWuxQxev
 sRSjQOqqgthUkB+sEyFg3q4iDmKBAoUx8pDxFSWD4OkN86PMHZaqWbKxfZ8Om/Rna/kk
 khx5xMYoVktSDVl89ZpwZmY7OSnXVTsEgoFkQdwTyTiqj9uCsnCKpKQhRyBUbeG0drC9
 8IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsXmpuYiU3H+YSGw86M+yfarFqH71sZdfBhnw8U00xw=;
 b=Ho9jESaeHZ7rii2IeiIo9Fg/ye7+VPQ43oTfJwN+iV3GEhKFLxnbuELfMy1PVBL0pm
 IUH1+w8Si8dOGOm8/Y2Tl7Xxmr+ibBPY0uNNkRSdRlEMXWV7bgMgCLPK7EKK6jn0Zlqi
 PbZiJC54gIZdCREctElYfRHM66j6aQ/DGkvxFZ/3zWP11HR6uX8ywlhiZTCa2eMDW87x
 x6xh7NMn2y3bG+VSPGf3t9v9jMS4Q6xKGSzmhrLdsHV9nzufd1H4gVS25JCobfrEGOVo
 JoBUDAQ9Nt9f5zzIca4vLVoF3KzDWsmcVrGFy9G/mm6HvEEWdOCGw4gtd+2kl4YT+qt6
 s+Eg==
X-Gm-Message-State: AOAM532woEZmO8GYR88DObwpW1bm7nYsp4cELoABK6xKBWQqfiVzAx48
 tW5XsAplYP5xM+Q5KcOXUDGVYSqPzpY=
X-Google-Smtp-Source: ABdhPJzVtPDtS/89Tx3IalM5fO6Y2YKNpKk/9iQflaYzMfQ6BEsse6zIB3IWCIKM6MgQMDFD8O+dCg==
X-Received: by 2002:a17:902:8509:: with SMTP id
 bj9mr24275180plb.151.1590340831038; 
 Sun, 24 May 2020 10:20:31 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:30 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:11 +0530
Message-Id: <20200524171935.2504-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 06/30] parsing_cocci: iso_pattern:
	Reflect Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/iso_pattern.ml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 9df21fb9..ebb83e23 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -965,9 +965,12 @@ let match_maker checks_needed context_required whencode_allowed =
 		     params1 params;
                    match_option varargs_equal va1a va1b
                  ]
-	  | (Ast0.MacroDecl(stga,namea,lp1,argsa,rp1,sc1),
-	     Ast0.MacroDecl(stgb,nameb,lp,argsb,rp,sc)) ->
-	       if bool_match_option mcode_equal stga stgb
+	  | (Ast0.MacroDecl(stga,namea,lp1,argsa,rp1,attra,sc1),
+	     Ast0.MacroDecl(stgb,nameb,lp,argsb,rp,attrb,sc)) ->
+	       if bool_match_option mcode_equal stga stgb &&
+                 (List.length attra = List.length attrb &&
+                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                    attra attrb) (* no metavars *)
 	       then
 		 conjunct_many_bindings
 		   [match_ident namea nameb;
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
