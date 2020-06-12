Return-Path: <SRS0=Wgtg=7Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7466C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Jun 2020 06:46:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB4B5207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Jun 2020 06:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThprmTDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB4B5207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8AFE287A14;
	Fri, 12 Jun 2020 06:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zljEjuyTJq-q; Fri, 12 Jun 2020 06:46:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 214E287993;
	Fri, 12 Jun 2020 06:46:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CDEFC0881;
	Fri, 12 Jun 2020 06:46:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF9A5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EC39989188
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKc-Iko99niW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7346A8913C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:16 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id m2so3464677pjv.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 23:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4agKA9fGXmmMQ0KXhvea/FbQXVfJX1PROKMSRGKAktA=;
 b=ThprmTDjSw+uozIeKE/7GKNLnIZ7xi3SxRDssEuXHP2qSsb4TJLw162yclQ/er6+P6
 HepEyFv+PGiUm1msj9KOEPfGH7WuQllv+BDAH0Olw1rsW8z9/IHQq9wVj+eB1IxNb0nn
 LWu+tXBCys8hcb4v+EGHpDARsKCaB8xd8XZcX/1Sun+7BKox9AV6i26K8uFIITb4fFsi
 QncAiem7ckJZuJRsOQvlq8nixWoNMQmvKUWqsUS6cqmfrW8L55McIwhIFyVL+sRwG80Q
 mU2PA/kfzj4jTT0L5RnUXZ32lMx26Uk7vM6CjRpW2vWGOwZ3GLNRcVEKZvjAWDFzCuH6
 XmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4agKA9fGXmmMQ0KXhvea/FbQXVfJX1PROKMSRGKAktA=;
 b=rruflrPOlsZnSmcC3Q2DyJz9iytisMIIc02pElpG2NFw4R4sVRx07bKUFSN/V9YFJT
 mKHX1j5Su5nfUv5Lby1neIBbcfVS3WidPPuZqCquWhOdNGTua6ymi5nrHRdzSb0BooGk
 VuSac7PT3e3T/CT72t59OOCwn5sd9Fwxy49wbXr8Pg0IRjyI8YPP+sQ5Tw7PsMsVuRpo
 VI1XIRxhHyLbYQFR7IBnXmCSf4IwARD93JfK+rA/3eYjFmJs1DZqCH9YH7cgSsKDNYGe
 rX1umNrQBbXN3PnwbBUjkiuwoAH7zP8xDfne+YBKb2P0q18qxlRClX6FOODco3qYUk04
 c1Sw==
X-Gm-Message-State: AOAM531/8Dr2HXCnsyXCRfoNrrV4WihNGOuGsmWaP0SgfReiQJUDSevu
 9/DG0t0UpzeZEAni5KkQYVc=
X-Google-Smtp-Source: ABdhPJzHjA3Aj66iVd0K319U1Npw7WbqfaLLUR1vo9we0Uv7pvHu7hgilZz74en3IdDg9A7wRhWFiQ==
X-Received: by 2002:a17:90a:7347:: with SMTP id
 j7mr11960015pjs.128.1591944375944; 
 Thu, 11 Jun 2020 23:46:15 -0700 (PDT)
Received: from localhost.localdomain ([1.38.217.229])
 by smtp.gmail.com with ESMTPSA id w192sm5087476pff.126.2020.06.11.23.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 23:46:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 12 Jun 2020 12:15:42 +0530
Message-Id: <20200612064544.30194-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200612064544.30194-1-jaskaransingh7654321@gmail.com>
References: <20200612064544.30194-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/3] parsing_cocci: arity: Apply
	mcode2arity on macrodecl/param attrs
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

The following commits introduced some poor management of attributes in
arity.ml:
	08f1cd9fb83ec400435e0ad8fdf579ec8f9c0f21
	b4b8653bd5a9607922e0050fe2fede10d422b218
Apply mcode2arity to macrodecl and parameter attributes.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index 6f90616e..3bbecedf 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -601,7 +601,7 @@ and declaration tgt decl =
       let arity =
 	all_same true tgt (mcode2line lp)
 	  ((match stg with None -> [] | Some x -> [mcode2arity x]) @
-	   (List.map mcode2arity [lp;rp;sem])) in
+	   (List.map mcode2arity ([lp;rp] @ attr @ [sem]))) in
       let stg = get_option mcode stg in
       let name = ident false arity name in
       let lp = mcode lp in
@@ -816,30 +816,40 @@ and make_param =
 
 and parameterTypeDef tgt param =
   let param_same = all_same true tgt in
+  let make_param_attr param tgt ret = function
+      [] -> Ast0.rewrap param ret
+    | x::_ as xs ->
+        let arity = param_same (mcode2line x) (List.map mcode2arity xs) in
+        make_param param tgt arity ret in
   match Ast0.unwrap param with
     Ast0.VoidParam(ty,attr) ->
-      Ast0.rewrap param (Ast0.VoidParam(typeC tgt ty,List.map mcode attr))
+      let ty = top_typeC tgt true ty in
+      let attr = List.map mcode attr in
+      let ret = Ast0.VoidParam(ty,attr) in
+      make_param_attr param tgt ret attr
   | Ast0.Param(ty,Some id,attr) ->
       let ty = top_typeC tgt true ty in
       let id = ident true tgt id in
       let attr = List.map mcode attr in
-      Ast0.rewrap param
-	(match (Ast0.unwrap ty,Ast0.unwrap id) with
+      let ret =
+	match (Ast0.unwrap ty,Ast0.unwrap id) with
 	  (Ast0.OptType(ty),Ast0.OptIdent(id)) ->
 	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,Some id,attr)))
 	| (Ast0.OptType(ty),_) ->
 	    fail param "arity mismatch in param declaration"
 	| (_,Ast0.OptIdent(id)) ->
 	    fail param "arity mismatch in param declaration"
-	| _ -> Ast0.Param(ty,Some id,attr))
+	| _ -> Ast0.Param(ty,Some id,attr) in
+      make_param_attr param tgt ret attr
   | Ast0.Param(ty,None,attr) ->
       let ty = top_typeC tgt true ty in
       let attr = List.map mcode attr in
-      Ast0.rewrap param
-	(match Ast0.unwrap ty with
+      let ret =
+	match Ast0.unwrap ty with
 	  Ast0.OptType(ty) ->
 	    Ast0.OptParam(Ast0.rewrap param (Ast0.Param(ty,None,attr)))
-	| _ -> Ast0.Param(ty,None,attr))
+	| _ -> Ast0.Param(ty,None,attr) in
+      make_param_attr param tgt ret attr
   | Ast0.MetaParam(name,cstr,pure) ->
       let arity = param_same (mcode2line name) [mcode2arity name] in
       let name = mcode name in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
