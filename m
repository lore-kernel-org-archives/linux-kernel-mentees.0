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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73CDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9208206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr7Cznm6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9208206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8101686ADD;
	Sun, 31 May 2020 15:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BAbcyw14gp3; Sun, 31 May 2020 15:27:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14D7286B05;
	Sun, 31 May 2020 15:27:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 006F3C0863;
	Sun, 31 May 2020 15:27:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16092C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E639C2035E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NELLJjOznr09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 480D82035C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:07 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y17so1424703plb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAkigKwio/NZLH//7Y0ZynzE7Fji0Kc43KzUv5ZRwR4=;
 b=lr7Cznm6clQCN3kSfdSjl1xs4gpzm8/0YcNI3/ltDPt44sqotfFXmPZQ8/WJjdiQMh
 aJ6Cdx8dKWvRNj5wlS24KQ7uLIGYI9+V2q16lsef54UWej+bOj1LPXeoyBN+VPN/A7np
 bD2ddkn1lWXGb4d0n61g5OzYdcd1oHLEIHSvbqdHyjT2Wd5u4NXmshxgp7rH/yadeZoC
 9l+CafPktatxCZ1Q2u5V+ptVDxPn1qXJazDTRkWc1Cf34vUSxbI+CsF6LuJBnfWCMfR4
 eUcM3gPET6dMeFf/hqQyuckCbOELyO+ItUqmrOZwaco4UUPtPg6hLRfQv62/wu9zoyGA
 tLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAkigKwio/NZLH//7Y0ZynzE7Fji0Kc43KzUv5ZRwR4=;
 b=sMpVrzHYVP35ZhmVIifNfx6G4rSn26yBLSHE3AGPTn6uXp0G2dCRXwBO5vsaluOgg9
 qorf+dCkd+/1bll+SETEOSXAsd5+vYPSZ8pN2YrxFJvGQEEd++MZDpIjYd3yIDjw+Rau
 lRNxcSIj6MKwjq2AUQyAX71ALlU6cIxKNIcgxztJwQlgUGt44LegKc1upguXnLc/ZFnj
 IHgVtBY7aV5VZj2YR+eo5/G9bJeYYfjw7vMkk4cTxVRycnhkSAlYSQMKhytSVUHYdEF1
 DPSARFK8uA4PaxJvmFyUlx3g4+5m69ltlaB6n7SsBy1hA+cHJ0awglofRJgoELLM07uk
 /jMw==
X-Gm-Message-State: AOAM532bbVincs1kUqyCsLWk+yuWqnUm5m5ZGatY3QCUrFOFJpqW3uBx
 1CIYZ+0vEJsXCwpbGPeCmFM=
X-Google-Smtp-Source: ABdhPJw5ela95bIzkdkfLh7K7w35fZgRCAen8HZjbH3vJAJoVJXDLtsscd89PBRt6KKgMEw2B4INAg==
X-Received: by 2002:a17:902:d70a:: with SMTP id
 w10mr16958191ply.256.1590938826844; 
 Sun, 31 May 2020 08:27:06 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:06 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:55:55 +0530
Message-Id: <20200531152621.2886-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 01/27] parsing_cocci: ast0_cocci: Add
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

Add struct end attributes to AST0 of SmPL. This is a list of attributes
in the TyDecl type of AST0.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0_cocci.ml  | 2 +-
 parsing_cocci/ast0_cocci.mli | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index 7714fd16..743fab86 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -252,7 +252,7 @@ and base_declaration =
         (string mcode (* , *) * string mcode (* ...... *) ) option *
 	string mcode (* ) *) *
 	string mcode (* ; *)
-  | TyDecl of typeC * string mcode (* ; *)
+  | TyDecl of typeC * attr list * string mcode (* ; *)
   | MacroDecl of Ast.storage mcode option *
 	ident (* name *) * string mcode (* ( *) *
         expression dots * string mcode (* ) *) *
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index f4b25abc..470c837f 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -240,7 +240,7 @@ and base_declaration =
 	string mcode (* ( *) * parameter_list *
         (string mcode (* , *) * string mcode (* ...... *) ) option *
 	string mcode (* ) *) * string mcode (* ; *)
-  | TyDecl of typeC * string mcode (* ; *)
+  | TyDecl of typeC * attr list * string mcode (* ; *)
   | MacroDecl of Ast_cocci.storage mcode option *
 	ident (* name *) * string mcode (* ( *) *
         expression dots * string mcode (* ) *) *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
