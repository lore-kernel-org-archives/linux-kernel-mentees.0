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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCFFC54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6D920720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7GeQ6an"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6D920720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C4C087954;
	Mon, 11 May 2020 10:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwY0p19L0LT9; Mon, 11 May 2020 10:09:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B62A08788B;
	Mon, 11 May 2020 10:09:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3B21C0176;
	Mon, 11 May 2020 10:09:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BAA9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EF5E887277
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RK9UPNYbyU8W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4001E87954
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:52 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s11so856764pgv.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+LCecuHRzdR/o7M/ikGH5G4JrMwoDyf73lHut0jbu0=;
 b=h7GeQ6angKT+XYjyho/EzT2LYrafE7OVEX1t7xcLS3lNqkor/j9ihEJF99yDW0QRny
 vAdyzmLTuWQwdKT6AngTHhE8B0ZjH9Gct1z/7MPIt8bZeD+E6jSXOUUZY2CSf51ekOIz
 +d6xOeViKZdrNFFX+GEjjh9dtQ/wZ/5DwgKtO/LfwCT+AEZ3Vkn8sJ4/RoOyCRrOlSdK
 sW3nHjaiCrPU8MAl8S3WAxlrA8cfcheYwCEiYNlJEUCP6tFxRSItiXgRGNv/5nFKQ8H8
 mIJXr5rMECbp7LIPgH8dn6auIX9F+i2LstWrnkf95Zpe0oWdTiD6kEU4K2dN+Mss/yld
 0RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+LCecuHRzdR/o7M/ikGH5G4JrMwoDyf73lHut0jbu0=;
 b=iTzAFoTM1e3GIJX9uv8/9YPrtuR01b7EDAgJQA7hVXB7X6qGPNIYFKXVo1dSbPEZ5n
 oxvCPuWYjuzULFZXIrv+c8WzdK7VRe0G1BF1mDFctubDHiMKJI+5J1ZADew1uxBQS8eI
 h7g6rF1MqJ1BfJV2JvDuWNMHRjmEECH1p/A3IEOFYXPCVegFFfB+56vQrP71kYLqEbhi
 CJyDGxkzRzvSh8QuMg7Gvz97Bzau74ho+V41SMdJYSGAznbcFct9y5I649Zf1GDGpWr7
 k5GM6JfokCPp0SdsieY/5A8SqNO05fsBFd25jZesxYvpIdv+Hnqw57pmiXzBBe4T6+4N
 w6fA==
X-Gm-Message-State: AGi0PuaWMuTEQltB44c7c0hgQvKKibXq9YM4LbdROEC9UgDLqcj9JaqV
 Rqpk3sFGVn59a2MfyaiAuqc=
X-Google-Smtp-Source: APiQypIPXNUv4FjDzB/h0HAlb6FddelA+Zob+scQO3d444cuX7sBPXiFL7cOBR2jTYcvF6VyeuzB3A==
X-Received: by 2002:a62:1b84:: with SMTP id
 b126mr15566787pfb.123.1589191731833; 
 Mon, 11 May 2020 03:08:51 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:51 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:02 +0530
Message-Id: <20200511100715.19819-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 19/32] parsing_cocci: unify_ast:
	Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index 68cb6613..25287503 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -220,8 +220,10 @@ and unify_expression e1 e2 =
       unify_expression e1 e2 && unify_ident fld1 fld2
   | (Ast.RecordPtAccess(e1,pt1,fld1),Ast.RecordPtAccess(e2,pt2,fld2)) ->
       unify_expression e1 e2 && unify_ident fld1 fld2
-  | (Ast.Cast(lp1,ty1,rp1,e1),Ast.Cast(lp2,ty2,rp2,e2)) ->
-      unify_fullType ty1 ty2 && unify_expression e1 e2
+  | (Ast.Cast(lp1,ty1,attr1,rp1,e1),Ast.Cast(lp2,ty2,attr2,rp2,e2)) ->
+      if List.for_all2 unify_mcode attr1 attr2
+      then unify_fullType ty1 ty2 && unify_expression e1 e2
+      else false
   | (Ast.SizeOfExpr(szf1,e1),Ast.SizeOfExpr(szf2,e2)) ->
       unify_expression e1 e2
   | (Ast.SizeOfType(szf1,lp1,ty1,rp1),Ast.SizeOfType(szf2,lp2,ty2,rp2)) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
