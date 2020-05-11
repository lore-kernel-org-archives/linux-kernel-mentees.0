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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3E4C54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C4420720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb84SZpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01C4420720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D7C6386FBB;
	Mon, 11 May 2020 10:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVzMarnZS-67; Mon, 11 May 2020 10:13:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76E0B86C24;
	Mon, 11 May 2020 10:13:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66E4FC0176;
	Mon, 11 May 2020 10:13:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4F79C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 93C4924C2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwQmtX-HTIKz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 3541124B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:47 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id q24so7557414pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U5/XClYRjVE2OZVb+vj8MCi+FDKxhb61twexwoM2+tQ=;
 b=Hb84SZprwnaA7c0IQSYXeIuTG8QRBxNhoMSGAXArGBRVVMDOnwJWdA9eKn3Gopdlo0
 48Cdowz+FGcALnD3q6PP4Aijfu7SDB9PRMmSONXv1GVAfXyTpKvuJ1U7RDoxtpXkvROZ
 mBHiQIIct/pVYcaKMvpE5boCXcscJ20ggdp6XJmHqknC29w4SAktSSptLhKRx8Pf5WjZ
 v6D8WukURRfwcVyDJyr+mAJCi+8AZGYji5VL6MM+49DQxTqEI8iC25zlYzWizsWpxFW1
 /uUGCey/3VxmEKG6NHpHLR2NYTwAIoRKEL2dCHmxOdd5y3yOBcDJ3BGnBkblOcJ86KAA
 kSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5/XClYRjVE2OZVb+vj8MCi+FDKxhb61twexwoM2+tQ=;
 b=a7531WmLnMdHNmjJQzRX8GpogmnlnF0pvhzizErHbj2+07veKwhBd9wNRXUnJtLs3n
 IPdp+9GOCoFy7X9/6wDYdGkeXN0RMSVehOgYvOpkwvU3I4thiAkFiEXVL0hJBay+142w
 D0PS42W0b3RTMDEVFopL5AJQhHMaNa4vWzx39aA6mYacuRCVwVhKSasYq3DzP0yRDnAr
 OdWruq4wp7drSWfnGxafifzIJkAIm+K6BejYs1AHLTXatX8HxA+G4ILuCg/NccJ/lbnV
 5B5X2LBDbtdJE5DZRCHoZ/Ggcxk4RRwcfMWcumjzvf20NtKGa58HQFSS9qthvtPTN0bi
 w+JQ==
X-Gm-Message-State: AGi0PubM/+ybXcTSbAWDI91wKE+3FqThRIuBMWj0qH1g9F4F+xOFC9Qj
 KMMioGY26Xv2fIIWBeZ+j1A=
X-Google-Smtp-Source: APiQypJgfd9RgkAPJjVO1tIEtw51oV6HBfxt0LUlX07sUciNESt57G9qlZjdpNMRlxb+XywfiZz6hA==
X-Received: by 2002:a17:90a:db91:: with SMTP id
 h17mr19964683pjv.7.1589192026829; 
 Mon, 11 May 2020 03:13:46 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:46 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:45 +0530
Message-Id: <20200511101300.11101-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 08/23] parsing_cocci:
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
