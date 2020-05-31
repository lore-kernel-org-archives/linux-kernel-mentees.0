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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E92CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E1C206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3QvUWvu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E1C206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0735B20438;
	Sun, 31 May 2020 15:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qnk-JyOJL5HE; Sun, 31 May 2020 15:28:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0E5E420425;
	Sun, 31 May 2020 15:28:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6150C0863;
	Sun, 31 May 2020 15:27:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C0F3C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7EDCF87E3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPNoSw6FvYPe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0751387E3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:58 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id nm22so3183779pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mB0J9jFpe+iFVZmvfWg1x2ixXm3XmVvZibanMHUFwpo=;
 b=j3QvUWvu5TdxaB+Jnsdp1BzDq9l/6fJO4xsmT89SI15QU9m0cMX+rMWYCM8QG3JRYb
 0HAexwILkF7N7xD6czlLdYkjq1p+2jQuc0htXWWBPmQT4lpD+R9l5Jj+8McLyKsJEGe+
 S+NjN0TXAGduFnts2xr5kgeLr+1yLWWG3yU2kc6ZsqsTToFughnnF/GoTXamvrQ/MiX4
 hVuUjRV+hUuX7kyQhyhA1/oMpDYpL/aaD+K4XYwgrTg5yLCvR9C5q8mXKd2NhclcYmwW
 iI/3jcOaSHNjWPLvl2Zz5t2ehBPSOIiP0Lk9PKywIaDE3aBy3g71qqTCjTI4wswUb+gf
 Vb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mB0J9jFpe+iFVZmvfWg1x2ixXm3XmVvZibanMHUFwpo=;
 b=MduWowxLUHlvJ9FKTJLp2xf9PSj2P+a5MIAh03x5+640wGWYFZ3ZPJ5f4uUzp7bEuT
 Kq45RV1dRbAAz8CSMlBWK0/DMeJTa4u/NE8MzQRBiKfop6VKIaMFKVr1eMobdFtZOlHx
 J0+p+amqIeMBjyK+mF54Xs5ctp+4uF0oP9XqA5+vsPHXyNhb9F35N7eFaxDm2p8gyNZS
 1CCDefvLRkPzPJfAJdV/icYvNdV4KmgWAN4TZWouHrx6ak0oHkyE7MLuW/DOg4EL/hEs
 Qvi4GL/GiTw3tIBj/De6fg/g/OoSabp/efoM1ymtxF8S5vzfgCJWrmB4IuplHeC39p+0
 Ok8g==
X-Gm-Message-State: AOAM530d0iVztiWHI9NUvPqPdfj6UWuTG7AqcrCTeU9a4YHRssJBwVXS
 I9tHD/YrwgrroGGm0IyEc9/keoHU
X-Google-Smtp-Source: ABdhPJydpk7/X7mphC6nDNKXHa47j5dmAyPg7ecIvMooRakv6HJOLBu2UuZmPoKZpOPZVG14Fbingw==
X-Received: by 2002:a17:902:14f:: with SMTP id
 73mr16493574plb.86.1590938877594; 
 Sun, 31 May 2020 08:27:57 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:57 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:11 +0530
Message-Id: <20200531152621.2886-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 17/27] parsing_cocci: adjust_pragmas:
	Reflect struct end attributes
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

Struct end attributes are added to the SmPL AST. Reflect these changes
in adjust_pragmas.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/adjust_pragmas.ml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/adjust_pragmas.ml b/parsing_cocci/adjust_pragmas.ml
index e5597943..b328ad27 100644
--- a/parsing_cocci/adjust_pragmas.ml
+++ b/parsing_cocci/adjust_pragmas.ml
@@ -60,9 +60,9 @@ let rec right_decl d =
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
       call_right right_mcode sem d
 	(function sem -> Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem))
-  | Ast0.TyDecl(ty,sem) ->
+  | Ast0.TyDecl(ty,attr,sem) ->
       call_right right_mcode sem d
-	(function sem -> Ast0.TyDecl(ty,sem))
+	(function sem -> Ast0.TyDecl(ty,attr,sem))
   | Ast0.Typedef(stg,ty,id,sem) ->
       call_right right_mcode sem d
 	(function sem -> Ast0.Typedef(stg,ty,id,sem))
@@ -292,8 +292,8 @@ let rec left_decl decl =
   | Ast0.MacroDeclInit(None,name,lp,args,rp,eq,ini,sem) ->
       call_right left_ident name decl
 	(function name -> Ast0.MacroDeclInit(None,name,lp,args,rp,eq,ini,sem))
-  | Ast0.TyDecl(ty,sem) ->
-      call_right left_ty ty decl (function ty -> Ast0.TyDecl(ty,sem))
+  | Ast0.TyDecl(ty,attr,sem) ->
+      call_right left_ty ty decl (function ty -> Ast0.TyDecl(ty,attr,sem))
   | Ast0.Typedef(stg,ty,id,sem) ->
       call_right left_mcode stg decl
 	(function stg -> Ast0.Typedef(stg,ty,id,sem))
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
