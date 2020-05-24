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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86434C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A174206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+AA1grp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A174206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47255874F7;
	Sun, 24 May 2020 17:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCJG+qLELWSR; Sun, 24 May 2020 17:21:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E7B118746E;
	Sun, 24 May 2020 17:21:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5A43C0178;
	Sun, 24 May 2020 17:21:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9453FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 83C54866AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADLxahyeyl3h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3888886670
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:34 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id e11so6905721pfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6JGEKFsxFuHSsUljfKUFffLbRzeznecp1vrka61QpQY=;
 b=n+AA1grpDAR9IX4n4FFlXhkXzh7KAgVxaYM2XTb784nIJXbI4VPZudXH2AkwGwbnju
 vU93uteC6P6YM9MyrZquLVDacs2kNulAfBK1oRHed+GehwjfElGqNLHWFPyZoEsCuHVr
 /ZeJSM30L+HUfKBvienhPfS1LxkG4VC8MOwNZcb5n6+hDXUSjRyDLSwuzsUeHPSFAJJQ
 KugjO8lkH1GFXsWYK5MFOl9iNvwS3ZYQ+NrYAaxyNrQvWY1I5mIggGeN7NqTWTO7cTZ7
 LaPxVKMnYGP6W8rB1DlgiLq/0HFTNuWEbverkM7yXDHohW/GXERdiav+j1l9tT8EYum4
 wY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6JGEKFsxFuHSsUljfKUFffLbRzeznecp1vrka61QpQY=;
 b=F/Krlb+MxgnKvN9FhMxNJAh3BVgvQ3YD1MCpTf0oJ+M2eVE4K16+opUx9YF73bXccL
 77iHnQfn2DU/JprG2IsYcSBlOxk951Ofjr4mE00lJxavTmKC1bpnszy1Z/XtjBn+AbPD
 oLtD3pZ5DNK0hO/xeEGpGmHBgA2wiHcdT5QPmdcEh7tY3baOOiaHygiWicCPYhnH/oQO
 hfQkrf7MPxasw2w7gBtgqovgkB8lGk9RVENeXP2ttAV51uuuVTV/L+TORp815oiHJe0/
 cS915DDPkZxN/JCBppJCsnljAJl1N5gnvZ3w5qPYn6Vox+ziR87pPocKcgFSf+5f1CmU
 cLVQ==
X-Gm-Message-State: AOAM5334l2qemkdD1GvjyWopbyyg9EE4s9ANkcmHI16d3UnS57FSf9T8
 mQnKf1pekxtuHLEOZ8kBJnk=
X-Google-Smtp-Source: ABdhPJyU0kkKtZxZwo0iBWurOSh9w3795/BTKa6nychsfVE4wNO2IcaYF8/AOaKS9qAGzxghm/7Fiw==
X-Received: by 2002:a63:5245:: with SMTP id s5mr6174951pgl.394.1590340893781; 
 Sun, 24 May 2020 10:21:33 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:33 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:24 +0530
Message-Id: <20200524171935.2504-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 19/30] parsing_cocci: ast0toast:
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
ast0toast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0toast.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast0toast.ml b/parsing_cocci/ast0toast.ml
index 09c28c06..7ca7bd3f 100644
--- a/parsing_cocci/ast0toast.ml
+++ b/parsing_cocci/ast0toast.ml
@@ -657,15 +657,16 @@ and declaration d =
 	  let rp = mcode rp in
 	  let sem = mcode sem in
 	  Ast.FunProto(fi,name,lp,params,va,rp,sem)
-    | Ast0.MacroDecl(stg,name,lp,args,rp,sem) ->
+    | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
 	(* this would seem to need allminus... *)
 	let stg = get_option mcode stg in
 	let name = ident name in
 	let lp = mcode lp in
 	let args = dots expression args in
 	let rp = mcode rp in
+	let attr = List.map mcode attr in
 	let sem = mcode sem in
-	Ast.MacroDecl(stg,name,lp,args,rp,sem)
+	Ast.MacroDecl(stg,name,lp,args,rp,attr,sem)
     | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
 	(* this would seem to need allminus... *)
 	let stg = get_option mcode stg in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
