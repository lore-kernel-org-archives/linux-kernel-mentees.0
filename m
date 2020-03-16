Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789C1C0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9482051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwFV7Sps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E9482051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 41EF5220A9;
	Mon, 16 Mar 2020 10:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qR3dhOs3ChxA; Mon, 16 Mar 2020 10:04:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AC08120134;
	Mon, 16 Mar 2020 10:04:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7E35C1D7C;
	Mon, 16 Mar 2020 10:04:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59D91C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4069F872D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eNXiwoEJpQ2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D3347850E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:43 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u12so9456811pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArrNOO2wlymy2Vj0YHultq0jk+uBF2UAiwJa1GYgwt4=;
 b=UwFV7Spsf3fyqWsq4FUIR8rF0zQKtla+P+FTcHJ2ZYO6gWeswlWlAJ4kuj+Ax8q/l6
 Pni0DpcoDMsP7hEfOEXQovGwZ97XL3pSO4Li5cvXNsiN55fgfaInHxnmOn+AIZCHkpm1
 NJaPr3068fN/wIVrAPULPDAwM++sT1fXDXzsK+LLWFApQ8hsYeQhsAivHDlekgcd+VIe
 dIDGgDaK+AUgg74m/vOnW36CVF2Y948DqwJEnKTjSuNEIrQia9UI63N/opUDqhVbC5Oy
 6dKaGslXLnSJN0Dl1e2IvUH4fMEFPv6faf0Y3T8Veqd3khQZyi86Gfux8grDOfXeJ7V2
 7e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ArrNOO2wlymy2Vj0YHultq0jk+uBF2UAiwJa1GYgwt4=;
 b=XQ0cC6euyQx+HiU/xn0YGUon88VwKYQSHs9+ViXInrfsA99crSVPkp3mh0x7tBuXM6
 7pl8BfffEuxY8jjGRCfC7TxzoyNGq70NPhrdddn9NoD3IS5Br9viv8Dw1cCAdvvHic+b
 +Vq0WmmshKoAM0yKzIHZ3VP6N7eoodD05JSjpllzM5WhfDX4EBEh0bvJt1mw78VC5yuS
 61t4BOUGxJ8wj5LDFQdL+HzSjPN8ku9OLBEZeFoRT4seEeFuRz1g/9dHIlQ3fo2HU6xj
 AgMkTe5Ckma6xQz61rD+7XMuaHL+euqETXspFiHtbDimau8lBnz1x1WZ8q5Fw7HdkNGO
 WoZw==
X-Gm-Message-State: ANhLgQ01LWj7nCc0DTbBfvzIJ4gGRWNBkdGjDUipp80j50IfuEb4blQc
 hhjMrVce0Sk7vUNdS85i9Xc=
X-Google-Smtp-Source: ADFU+vsguXrFHHDmq87Igt4YWiA0uWkkNWVxbltg1q1MR4YNfkBxP4cNNBwIcM1fBVDbqIwTH4Wn9g==
X-Received: by 2002:a62:2fc2:: with SMTP id
 v185mr28487961pfv.192.1584353083426; 
 Mon, 16 Mar 2020 03:04:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:43 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:13 +0530
Message-Id: <20200316100319.27935-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 20/26] parsing_cocci: ast_cocci: Add
	cases for ParenType/FunctionType
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

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in ast_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast_cocci.ml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index f8e6dee6..4fea9794 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -1110,6 +1110,10 @@ let rec string_of_typeC ty =
       string_of_fullType ty' ^ "*"
   | FunctionPointer (ty', _, _, _, _, _, _) ->
       string_of_fullType ty' ^ "(*)()"
+  | ParenType (_ , ty', _) ->
+      "(" ^ string_of_fullType ty' ^ ")"
+  | FunctionType (ty' , _, _, _) ->
+      string_of_fullType ty' ^ "()"
   | Array (ty', _, _, _) ->
       string_of_fullType ty' ^ "[]"
   | Decimal(_, _, e0, _, e1, _) ->
@@ -1191,6 +1195,10 @@ and typeC_map tr ty =
   | Pointer (ty', s) -> rewrap ty (Pointer (fullType_map tr ty', s))
   | FunctionPointer (ty, s0, s1, s2, s3, s4, s5) ->
       rewrap ty (FunctionPointer (fullType_map tr ty, s0, s1, s2, s3, s4, s5))
+  | ParenType (s0, ty', s1) ->
+      rewrap ty (ParenType (s0, fullType_map tr ty', s1))
+  | FunctionType (ty', s0, s1, s2) ->
+      rewrap ty (FunctionType (fullType_map tr ty', s0, s1, s2))
   | Array (ty', s0, s1, s2) ->
       rewrap ty (Array (fullType_map tr ty', s0, s1, s2))
   | EnumName (s0, ident) ->
@@ -1250,6 +1258,8 @@ and typeC_fold tr ty v =
   | SignedT (_, Some ty') -> typeC_fold tr ty' v
   | Pointer (ty', _)
   | FunctionPointer (ty', _, _, _, _, _, _)
+  | ParenType (_, ty', _)
+  | FunctionType (ty', _, _, _)
   | Array (ty', _, _, _)
   | EnumDef (ty', _, _, _)
   | StructUnionDef (ty', _, _, _) -> fullType_fold tr ty' v
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
