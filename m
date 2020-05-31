Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D57BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D17206EB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYaAn/2T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D17206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7D4887E62;
	Sun, 31 May 2020 15:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Okoct2Kj7Nz7; Sun, 31 May 2020 15:27:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6EB7A87E2E;
	Sun, 31 May 2020 15:27:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B51DC0863;
	Sun, 31 May 2020 15:27:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5AF6C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A571687E46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l172bLY3PsCB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4FAD187E2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:45 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id h95so2918025pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mSFkdGTHEJ1lLgnaIQE+lT+3xEfFvshh+vBMY9FtqDc=;
 b=YYaAn/2Tr2wj10lgdWP6KL5gizj1XydwVFvPvYzY1boiC0YMbQU2Ddka2iWKoC3Zgn
 wcZIif9L+ajVVZaUVEnNPy1AzzfVNsRUkkzZbkx/7Rskb/O8ciIRxnIpxcfMu/KUXlDB
 0AY/FihvDRtsC2dTjCH/WXinv2J7oZFLP+s8bsigXKP43okZ+RwROIe2yDzoPbIckFit
 MvlolqMjhhdco/66Y6MJR/mmtxBQ6ISAO5+j1boG73moHSFyHxv10jbSWuh1ArQoQKr5
 k53xqkjbkEsAuUhaVMt1FChEhr8SbyIOt4C4ljAF3POFwt+3de3fUyqQcWu/w0Tw9eTm
 TBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mSFkdGTHEJ1lLgnaIQE+lT+3xEfFvshh+vBMY9FtqDc=;
 b=DomwsBsJsjnAWQbKDlUxxpqjbDjgf/4E8umls9UQyg3L8vWkjYXDNtMaN00Xz1JEQY
 3XUTakzJdQQsEh3y/jIZpi2/jeo2XJPi2AtpSsk2PPLFMlYMeCF8iQsysCc34Zt/RhvB
 c52wu4Sl41W2+B2vvI7z+VLNklucjtmzPFZsVvJM7vIBYksDKk1ibNnMPoKOrrxjsdMG
 DLmVLKQAD4+YtxrM/Ehzh4wL9GWphsm2sseyI22OExwEYkKpKf1W4qBV4zW8X4s6o8VN
 mkE19CWv7konsUcuTA+O1J1uU3/fPVrok28OygPRsnOUCnB50zusrLUsaYHLPTLeVrrE
 PDmQ==
X-Gm-Message-State: AOAM531KlTWkzaMW0+EHalARaf/8tCo7A7O2yuzRJPm4p+wJFkCx8D9f
 Nbz7vQbjfaCv0Iz7Oxj2SgM=
X-Google-Smtp-Source: ABdhPJwoxIw5ZQPlqXzkv/Qn/EbYy10PzLaP+ayaY0dprYqzJvUnfFPPeFptusep5FfGq0/vzITmKg==
X-Received: by 2002:a17:90a:3426:: with SMTP id
 o35mr5274980pjb.27.1590938864864; 
 Sun, 31 May 2020 08:27:44 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:44 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:07 +0530
Message-Id: <20200531152621.2886-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 13/27] parsing_cocci: ast_cocci: Add
	struct end attributes
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

Add struct end attributes to the SmPL AST. This is a list of attributes
in the TyDecl type of the SmPL AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast_cocci.ml  | 2 +-
 parsing_cocci/ast_cocci.mli | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index b4b74a67..403756c4 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -396,7 +396,7 @@ and base_declaration =
 	string mcode (* ( *) * parameter_list *
 	(string mcode (* , *) * string mcode (* ...... *) ) option *
 	string mcode (* ) *) * string mcode (* ; *)
-  | TyDecl of fullType * string mcode (* ; *)
+  | TyDecl of fullType * attr list * string mcode (* ; *)
   | MacroDecl of storage mcode option *
 	ident (* name *) * string mcode (* ( *) *
         expression dots * string mcode (* ) *) *
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index 77dba10f..873e1d31 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -378,7 +378,7 @@ and base_declaration =
 	string mcode (* ( *) * parameter_list *
 	(string mcode (* , *) * string mcode (* ...... *) ) option *
 	string mcode (* ) *) * string mcode (* ; *)
-  | TyDecl of fullType * string mcode (* ; *)
+  | TyDecl of fullType * attr list * string mcode (* ; *)
   | MacroDecl of storage mcode option *
 	ident (* name *) * string mcode (* ( *) *
         expression dots * string mcode (* ) *) *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
