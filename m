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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BF1C54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:21:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECD3206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/77hY4C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ECD3206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C5FD844D6;
	Mon, 27 Apr 2020 12:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-5b5bU1OkY9; Mon, 27 Apr 2020 12:21:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07EF8844C6;
	Mon, 27 Apr 2020 12:21:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E46ADC1D74;
	Mon, 27 Apr 2020 12:21:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F74EC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0F5EF20797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DJUY+MYk3sSC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:21:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 6976D21546
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:21:36 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g2so6945333plo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYYLVUG1uEXHHk2zeWVmVA7BFjrGO/QyFUFlkFzKPn0=;
 b=V/77hY4C48yk/yuaOhDUjCmPrqnK2EIh3NQXWrsIV+FpuNkB2PlCxOMY7UBDeokrcW
 VudrBhZuzzUW+O56lBXSVTHkBcOOPKAK4//qQ+SDLfTI+kz48ngsRPIU49W9YtL+Rk7G
 x9r3jLGFkyHsf1QAFsD83HyUh9JIM8L3UKEmiGQz+E075g5myQiehblG2oHfPglu//ye
 UFvCal6zpqt1ehamauF2BMkoDKkggWIkznJiXKK55XrcQ/KDUQTm5Fg7WUGWie9gusiv
 T1/CuZsuEBfMDWlLFRMU0ETs1Pg3IaoQZzUxOhXDzgk3blBBcVKtUlFHewsLciK+E1fR
 sS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GYYLVUG1uEXHHk2zeWVmVA7BFjrGO/QyFUFlkFzKPn0=;
 b=KlNXyjmg3vtPHBujckZSk8eJVoc+KVDA5peGOKalwqXoJo0CyNWrIDxJjeAeFVyRds
 CmzQ0so0OfE3MtzsIQziDmpAPGZ49Db04PCBaIRek+jL3qHCku9GwQb7bLcmONu7DqaJ
 pRT0KfnMDelTOQHVNdNmvcdof9pCswsamkfkrHgFHY1G3ZkppmpzCTU5NU6ec3LCkiYz
 BxPM+YGvpY9/OD+VJdojGCpnfcgFjY8TQA0mUrUrqrZ3iyjLPsbZesNHCluD6rPe/7Ix
 ixfdkZpvXddGjr9Z2RA5B5UCiibwSr7gotyzNZN0WbtOCE0amkQ5itWp1Jx6g+1MOIYr
 nAfg==
X-Gm-Message-State: AGi0PuadgBbvjRCYoNha2Xn3JV8AjCHptDVsXR4NEZI2Z+rLWzyQ/Pst
 Fm9gjqFuttfFe+6CjE1195M=
X-Google-Smtp-Source: APiQypL2l7Y428aP/zfI5RcZYIsmWQr3E5LbzMUpmyllNi0vt0A1vOVRcvO6hPCS3VK/31w4m0z8Sw==
X-Received: by 2002:a17:90a:7486:: with SMTP id
 p6mr23227557pjk.62.1587990095574; 
 Mon, 27 Apr 2020 05:21:35 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id o198sm12424584pfg.183.2020.04.27.05.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:21:35 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:51:13 +0530
Message-Id: <20200427122113.18442-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 08/23] parsing_cocci:
	function_prototypes: Reflect Parameter attributes
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
function_prototypes.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
Changes in v2:
- Removed unnecessary function name change (collect_ident_strings).

 parsing_cocci/function_prototypes.ml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/function_prototypes.ml b/parsing_cocci/function_prototypes.ml
index 71bf1a2a..966369b8 100644
--- a/parsing_cocci/function_prototypes.ml
+++ b/parsing_cocci/function_prototypes.ml
@@ -261,10 +261,10 @@ let rec attach_right strings ty =
 let rec drop_param_name p =
   Ast0.rewrap p
     (match Ast0.unwrap p with
-      Ast0.Param(p,Some id) ->
+      Ast0.Param(p,Some id,attr) ->
 	let strings = collect_ident_strings id in
 	let p = attach_right strings p in
-	Ast0.Param(p,None)
+	Ast0.Param(p,None,attr)
     | Ast0.OptParam(p) -> Ast0.OptParam(drop_param_name p)
     | p -> p)
 
@@ -297,7 +297,7 @@ let new_iname name index =
 
 let rec rename_param old_name all param index =
   match Ast0.unwrap param with
-    Ast0.Param(ty,Some id) when all ->
+    Ast0.Param(ty,Some id,attr) when all ->
       (match Ast0.unwrap id with
 	Ast0.MetaId
 	  (((_,name),arity,info,mcodekind,pos,adj),constraints,seed,pure) ->
@@ -308,7 +308,7 @@ let rec rename_param old_name all param index =
 		 ((nm,arity,info,mcodekind,pos,adj),constraints,seed,
 		  Ast0.Pure)) in
 	  ([Ast.MetaIdDecl(Ast.NONE,nm)],
-	   Ast0.rewrap param (Ast0.Param(ty,Some new_id)))
+	   Ast0.rewrap param (Ast0.Param(ty,Some new_id,attr)))
       |	_ -> ([],param))
   | Ast0.Pdots(d) ->
       let nm = (old_name,new_iname "__P" index) in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
