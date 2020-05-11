Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA9FC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCAA206D6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tt2WqyZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DCAA206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C9C8888FC;
	Mon, 11 May 2020 10:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7O3YL6nIKh6M; Mon, 11 May 2020 10:13:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE54788026;
	Mon, 11 May 2020 10:13:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAD65C0176;
	Mon, 11 May 2020 10:13:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67C58C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 57A1086FBB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id em+p9h+9-83n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3874E86CD7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:33 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b12so1826731plz.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAbYcI+ddLC4sIyW6AKwmLufMWLaaZ3sTc/dozO6PhM=;
 b=tt2WqyZMxACu979jHSzGEKVbV1D1ZFS6qrxMFzDAZbHxc8fzLlGyhYT7IsEAcJGE2t
 b7BcRGSIAc2WfO+/Voa/2a4Vjt8AM8ls6PFlomLitKviI2+tGC/RxN9bigAW09hJbsiP
 5RPZoEqzTTsoi57G11o2fcExoVYoPTEGQRq8Y8fNHCbBKIO4FJuylXNnX9yFYGYh8tRa
 0qmI7vXMGgoBtZ376+URnxAf27C2r1kPIol5hbBCBqcZLETrWwNOEtzJrTKLKLZ0cGj0
 I73hgMO7Monw/t2j2m/wYsBHgXjn4Xxsb9yaSAAqdeLT598KI4hSChuqXcdwrYk9Bxt7
 ZiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAbYcI+ddLC4sIyW6AKwmLufMWLaaZ3sTc/dozO6PhM=;
 b=UNtohSUoeph7yubMiwhphPjpBDCDTpyk/x9kYvAnVw1KuUlvX00TLrHo9zIa9DTIHZ
 mvW03tWmL1agfrbnzssKwh5T5ENMDCOPnue/kipMdhtWB24g0aAzB2iIXcJmg+taSq9n
 z2TF1O6FIkrJE641nPWGmDOOiB1K4X6oT/HAl0+NhDnyEm4Azl+jdy0CowDg5A3t4Itv
 2/yLTwt38+u5iGg7CJ0wYtFQoIlyOndey/jeR9szUcX5AsM063iklse7Beq7fZYAQAHj
 P4zYVboylw6YuoS3c3M9rXDCuNWvBHRr5O2pp0LGU/t9DTkHsU/C7T9QwcZwJ/OZ8Kav
 a5kQ==
X-Gm-Message-State: AGi0PubO0d1ezQmXP1roynu+8Ta9miqeHBtoweEWF189oH4JWE4b4wzC
 nCmD92ntOx/xGCPJtsClSPSt1BE8PJk=
X-Google-Smtp-Source: APiQypLfMnmCqp9pA80yqUSe0U2qaPWFWKjZZ1LUJrZ5dpaS1vhp6UxTk6CFaWrHj9LYuw0CrbILmw==
X-Received: by 2002:a17:90a:276a:: with SMTP id
 o97mr21417951pje.194.1589192012752; 
 Mon, 11 May 2020 03:13:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:32 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:41 +0530
Message-Id: <20200511101300.11101-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 04/23] parsing_cocci: arity:
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
arity.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index 8ee6d33f..0f64c113 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -812,26 +812,29 @@ and make_param =
 and parameterTypeDef tgt param =
   let param_same = all_same true tgt in
   match Ast0.unwrap param with
-    Ast0.VoidParam(ty) -> Ast0.rewrap param (Ast0.VoidParam(typeC tgt ty))
-  | Ast0.Param(ty,Some id) ->
+    Ast0.VoidParam(ty,attr) ->
+      Ast0.rewrap param (Ast0.VoidParam(typeC tgt ty,List.map mcode attr))
+  | Ast0.Param(ty,Some id,attr) ->
       let ty = top_typeC tgt true ty in
       let id = ident true tgt id in
+      let attr = List.map mcode attr in
       Ast0.rewrap param
 	(match (Ast0.unwrap ty,Ast0.unwrap id) with
 	  (Ast0.OptType(ty),Ast0.OptIdent(id)) ->
-	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,Some id)))
+	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,Some id,attr)))
 	| (Ast0.OptType(ty),_) ->
 	    fail param "arity mismatch in param declaration"
 	| (_,Ast0.OptIdent(id)) ->
 	    fail param "arity mismatch in param declaration"
-	| _ -> Ast0.Param(ty,Some id))
-  | Ast0.Param(ty,None) ->
+	| _ -> Ast0.Param(ty,Some id,attr))
+  | Ast0.Param(ty,None,attr) ->
       let ty = top_typeC tgt true ty in
+      let attr = List.map mcode attr in
       Ast0.rewrap param
 	(match Ast0.unwrap ty with
 	  Ast0.OptType(ty) ->
-	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,None)))
-	| _ -> Ast0.Param(ty,None))
+	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,None,attr)))
+	| _ -> Ast0.Param(ty,None,attr))
   | Ast0.MetaParam(name,cstr,pure) ->
       let arity = param_same (mcode2line name) [mcode2arity name] in
       let name = mcode name in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
