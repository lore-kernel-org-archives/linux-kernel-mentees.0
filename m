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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0FCC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C40520812
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAGl9n6x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C40520812
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5865C85FFD;
	Sun, 24 May 2020 17:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xy75md1NwDcU; Sun, 24 May 2020 17:21:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F33BE85F83;
	Sun, 24 May 2020 17:21:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDDB7C0178;
	Sun, 24 May 2020 17:21:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0E87C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 90308880C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVjwTobZPsIi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3832288098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:02 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b190so7855136pfg.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4AysMomGa6RXFEPipea45EWMRk3CTOxlO+t3BKqr7CM=;
 b=BAGl9n6xoEVKg6BwVr1/7uA7lc42y1AHM7bcNz12A2ZZytOpAWbjaGv6EC+LKlUePa
 2fH03gNZ1dvsw5FjgTtxpWA6fSjtdYrmpteNsXGflagnOp5ef3lKQ4FvnfgxTXsttJth
 w6rJQhhyT5NbK3KHXfSW7ZMK1OoUi8CXeLFg92lwiRTvrPUJBwFzJIKhlqR8NmjCZVHd
 6lUnoHw7n3aEA78HqpScyvHvzpHlPXOP9vw7ndG8/+K3fx6/2h/7BooBBHkaFmjnClCo
 4K6u9WaUt3kbHOh2oCGTLy6/CTWamfVvRxIi7Y8yMlGc7ltflBHMYUNSPGqqQEreMui8
 YSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4AysMomGa6RXFEPipea45EWMRk3CTOxlO+t3BKqr7CM=;
 b=e8MeLbA2jzCEE91olzrVxVirlv2tGTjGlANXJFcE+vBB14yRt9ITpNqQwxK2/IN+8E
 VHsAXwrVko7vmmkwfVUMWPWnCEHItYMvSbg0yLrwFMSmyIo/GvgnQZ+hs2xP32YpE/0i
 mcHDM1EkbdXXgap8Sdg3YNVGyEYysyPM4k1k/T6mB5N5QyhnNj0JNtMvjsL2QJbNRn03
 Yjr5V1jgPR38kN55mUHfxtkJf7DcGDa7L+IYl+3TpP6LEYjlBb4Tsb0m+a6n+YyL3sHp
 +1nMOycEOycgRaVDrp9ZAZD/2Ix4SgiaNQMKzi5XNZ3RcJcuuYlFOPkG8irwLTOteQLT
 E/Kw==
X-Gm-Message-State: AOAM532bxEtX7Q14smiXj1CsrJOGCMnzdH43b6WYYW01vXweZLpNNtQn
 ZxHLBjPNHMQhgv/bO1nAItA=
X-Google-Smtp-Source: ABdhPJwdKpd/BJFd5Pd93nKW3vUPggvH6CEPjwEpYM4id9yderRAGM+/0VqQtxji14RNLn1tsWdJdA==
X-Received: by 2002:aa7:955d:: with SMTP id w29mr13966771pfq.133.1590340861769; 
 Sun, 24 May 2020 10:21:01 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:01 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:17 +0530
Message-Id: <20200524171935.2504-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/30] parsing_cocci:
	single_statement: Reflect Macrodecl attributes
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
single_statement.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/single_statement.ml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/single_statement.ml b/parsing_cocci/single_statement.ml
index 4ad1c4e4..a75dc755 100644
--- a/parsing_cocci/single_statement.ml
+++ b/parsing_cocci/single_statement.ml
@@ -200,8 +200,8 @@ and left_declaration d =
   | Ast0.FunProto(fninfo,name,lp1,params,va,rp1,sem) ->
       (* should not be nested in anything anyway *)
       false
-  | Ast0.MacroDecl(Some stg,name,lp,args,rp,sem) -> modif_before_mcode stg
-  | Ast0.MacroDecl(None,name,lp,args,rp,sem) -> left_ident name
+  | Ast0.MacroDecl(Some stg,name,lp,args,rp,attr,sem) -> modif_before_mcode stg
+  | Ast0.MacroDecl(None,name,lp,args,rp,attr,sem) -> left_ident name
   | Ast0.MacroDeclInit(Some stg,name,lp,args,rp,eq,ini,sem) ->
       modif_before_mcode stg
   | Ast0.MacroDeclInit(None,name,lp,args,rp,eq,ini,sem) -> left_ident name
@@ -219,7 +219,7 @@ and right_declaration d =
   | Ast0.Init(_,ty,id,eq,ini,attr,sem) -> modif_after_mcode sem
   | Ast0.UnInit(_,ty,id,attr,sem) -> modif_after_mcode sem
   | Ast0.FunProto(fninfo,name,lp1,params,va,rp1,sem) -> modif_after_mcode sem
-  | Ast0.MacroDecl(_,name,lp,args,rp,sem) -> modif_after_mcode sem
+  | Ast0.MacroDecl(_,name,lp,args,rp,attr,sem) -> modif_after_mcode sem
   | Ast0.MacroDeclInit(_,name,lp,args,rp,eq,ini,sem) -> modif_after_mcode sem
   | Ast0.TyDecl(ty,sem) -> modif_after_mcode sem
   | Ast0.Typedef(stg,ty,id,sem) -> modif_after_mcode sem
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
