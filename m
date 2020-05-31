Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD5CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0442206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgsCKBya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0442206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 622F284B6F;
	Sun, 31 May 2020 15:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qi5PL08dzVx8; Sun, 31 May 2020 15:27:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 130D784AAE;
	Sun, 31 May 2020 15:27:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F626C0863;
	Sun, 31 May 2020 15:27:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3FE3C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A1B7284E0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nNtLA0A4tnwr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4062D84AAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:10 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id fs4so3904168pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/esz5+1vzkbbW+2y/fuP4JSdygfzKs2wP6JPwtSf/W4=;
 b=RgsCKByaAIHybCejoFp9e+yDaqq70f/t2cyrEiRvHrJvc/QM4EKouHrtsDYUioLk8i
 HDzbSvmxKMwVRWfl0XSsucsIsQ2DcRQtlEZh5Xf1fecxdW9kMlJvDWCMgQ0tQMxwA8k+
 XB+QhQSfWkekz0YUJALAje/CXjWdQg+O6HE8mL/JxnvLf9kdZ3sRlQSkxO0Suh42dEHw
 4k/4su+vxSl5qRdlO/pWx+zXX39N+A/lpLeOmrPoDIb+5xGI86mtgQkGukMB4vLzOHZb
 IH3upu7VNKWZgcXV92BVCZjunHOJqDquHJ1MxBvPdAgYMJYIkSpeRyfazsiWC4+X9D3N
 p2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/esz5+1vzkbbW+2y/fuP4JSdygfzKs2wP6JPwtSf/W4=;
 b=jpCMHokf6OXL9Cb66gwvTTuwcth2pHcAcYroplQCVbS3y6wpCeo1EpgoRGs7ZgiNX/
 BampoFzRNsjwiFoI8owusAKbTrprllIBLvHV9aGawo2uKKpJvV7c5d3Ga/qHdRZf2jS6
 2MVhKOGf6UxDJ0zgjUTAL+Fjm/t/SoFE92BbNa6yZSS4pdvD4Mh4rEr7SabWwjXsuGdA
 a9rpvIv8vTCGbKS/KY5Nfsyz5mp8RO59XxlFYFz6eB3SXKOBD+yFAeo9b4mvOUDv2JSr
 fpSUTKFVkgXx3ddizaAgZ/HMANfiNCpoGaQIJpFhqFUb5D9BJT/4EMrj1wR4j+9MhBJg
 umUw==
X-Gm-Message-State: AOAM533qBidxMoHtTNABO+LHTrhkJjEOkc89Z0XAZ2pu6n7967qmde1S
 CE0bYt5I9NrAiS312QPxDLA=
X-Google-Smtp-Source: ABdhPJwaVi/1sZsnd/x79dVIRjxgBHWk1on7KvIeQFePsVmsaPx+lkgJX7YyC+K96DbuMoCBp3UiOg==
X-Received: by 2002:a17:902:b206:: with SMTP id
 t6mr16942391plr.248.1590938829810; 
 Sun, 31 May 2020 08:27:09 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:09 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:55:56 +0530
Message-Id: <20200531152621.2886-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/27] parsing_cocci: parser: Reflect
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

Struct end attributes are added to the SmPL AST. Parse these attributes
correctly in the SmPL parser.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/parser_cocci_menhir.mly | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
index 94e0b84a..63cb8b5e 100644
--- a/parsing_cocci/parser_cocci_menhir.mly
+++ b/parsing_cocci/parser_cocci_menhir.mly
@@ -1678,8 +1678,8 @@ the language is ambiguous: what is foo * bar; */
 /* The AST DisjDecl cannot be generated because it would be ambiguous with
 a disjunction on a statement with a declaration in each branch */
 decl_var:
-    t=ctype pv=TPtVirg
-      { [Ast0.wrap(Ast0.TyDecl(t,P.clt2mcode ";" pv))] }
+    t=ctype ar=attr_list pv=TPtVirg
+      { [Ast0.wrap(Ast0.TyDecl(t,ar,P.clt2mcode ";" pv))] }
   | TMetaDecl { [P.meta_decl $1] }
   | s=ioption(storage) t=ctype
       d=comma_list(direct_declarator(disj_ident)) pv=TPtVirg
@@ -1731,8 +1731,8 @@ decl_var:
 	  d }
 
 one_decl_var:
-    t=ctype pv=TPtVirg
-      { Ast0.wrap(Ast0.TyDecl(t,P.clt2mcode ";" pv)) }
+    t=ctype ar=attr_list pv=TPtVirg
+      { Ast0.wrap(Ast0.TyDecl(t,ar,P.clt2mcode ";" pv)) }
   | TMetaDecl { P.meta_decl $1 }
   | s=ioption(storage) t=ctype d=direct_declarator(disj_ident)
       a=attr_list pv=TPtVirg
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
