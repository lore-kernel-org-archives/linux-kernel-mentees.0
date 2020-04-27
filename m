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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154ECC5519A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF54F20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auYFOoIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF54F20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C1FA6848AA;
	Mon, 27 Apr 2020 12:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fkh-smmRNWoK; Mon, 27 Apr 2020 12:09:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60AC885F37;
	Mon, 27 Apr 2020 12:09:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DCC2C1D74;
	Mon, 27 Apr 2020 12:09:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BA34C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EEF5E85BC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVuP29jsBe8S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F87C84763
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:02 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k18so6925577pll.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAbYcI+ddLC4sIyW6AKwmLufMWLaaZ3sTc/dozO6PhM=;
 b=auYFOoIeQK74uwOMT0Lie7LxcWEvPB0eP9aHRHzAaRuqBVXTuQa8J7zZ7V8v9vka/e
 uFfYfXe1XQBJyGKxCRTK1Bab86MGsimJ4DUlX1AmqtF1igUl682LpdyCjwmb0vWoIuEI
 seiHV3Vk1VSqVvlTmYn5TKhG3B44DfInzusObAPaOb3Fh2B3gyzP+XoySRhz6QOdDqst
 KjzmWo+YTDbXv4IKINPhY+rEl5IniGR6xqeUz1vV3tNLLHN/Su6sz9ofcTJWO1U7WJmg
 Ca4CUINT4bOhJzvNUnZV7sS2c/wsaXoPyoCOyFTOjTh812ETO6pdsMIcq6VwGg0PJQAf
 5LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAbYcI+ddLC4sIyW6AKwmLufMWLaaZ3sTc/dozO6PhM=;
 b=TMN1cmCZI7DIsNXKe+F9R65mIgDWfHQlRIYyCDOvsU01DdJne0xgpzAkQysNihOZQ6
 HRRusIDOyrL9z2V2jPTq2JHEm6j231sbAGsnLaQDT0QtYCmMDbn/g+6HEO4jh/Bkjpx1
 z+U0YStfed6VelYd+VN5QwHTLA14+jWvMEpZahoBsnOc50OpsEgwtwY1m1WqlC+uEo8y
 dCxTjF86kNV7Le8XDSITKa2iv1kOBUVtOzJ0p/ryy1D1jEWDuZJGPSqvwDgZIlhIM7RJ
 8GQvkOWzBwi7L5UPgPP8Vbr074uvyjIs71z7kM79yP6Dk4hTRmqDIukuM3Q1849Le2P8
 a5aw==
X-Gm-Message-State: AGi0PuZN0PeatZPcZbWw6E9725vul6JFsu8E5llFJEsCbRf1+O07Dimd
 wER2lPELMibvivXS7oN6l5I=
X-Google-Smtp-Source: APiQypKzshW3RlyzHQtEz3tIMJ9R/BMlk8j0XAJd1X417bZfgm1TkajeWt3eTfBso2ZZBjeUEEo/Rg==
X-Received: by 2002:a17:902:784c:: with SMTP id
 e12mr22715929pln.191.1587989342094; 
 Mon, 27 Apr 2020 05:09:02 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:01 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:15 +0530
Message-Id: <20200427120834.380-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 04/23] parsing_cocci: arity: Reflect
	Parameter attributes
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
