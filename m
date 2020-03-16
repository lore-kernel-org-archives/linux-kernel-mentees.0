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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC45BC5ACD3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBEC2071C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awBpypZY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EBEC2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 890B929434;
	Mon, 16 Mar 2020 10:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpaiJ7R7ig61; Mon, 16 Mar 2020 10:04:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DBDD29315;
	Mon, 16 Mar 2020 10:04:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 344F0C1D7C;
	Mon, 16 Mar 2020 10:04:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 265B1C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2210888464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwIYU83qxI43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C4D668844B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:29 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d25so1641964pfn.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=748xKLCwQqLPdCAv6SLGVWG8zuIrb/ZVbTG9e7X15dM=;
 b=awBpypZYKQbfPTAX7GKNxZVbpNy/TTJe21uqB6Hd83r4YimTcwt9KlYUz6gMgQ4aMp
 AffvtzyQYP9Zti1+Kbooo8TYlqyAKDLP0weJnGWsEmoKBiWJPBL5t4XDz/9e3picEBqF
 DPHtPSkdASi74Ci2NQ7WBXN79l4tHpI3YrM2G8S81mUs/VIyJVdY7udPprGUR6u5/7CY
 9BIzwDLY7BVXVJ9JsdFpcSgfFhV9/TsmsH1CBFRAOeIvNdIc9LZTK3e5amEJk/07R1JR
 NjlevM8DjKBuDH8N92tzDLrf1izpB+7b6J/a7GDIF+fK+C/jvWshebzmevLgn2LBrUzh
 N4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=748xKLCwQqLPdCAv6SLGVWG8zuIrb/ZVbTG9e7X15dM=;
 b=M+PI2hOOqHk2lmOOmf8UpNUjw6muc6lh4QLDKILLohpYN9Q7Lw2BAUUxtU58vN626+
 RvQE+ct4Av43x0KdNZ4avnBDhf9YwWqC3BbgDam3dKPuVXVAVRW5xf7tW/R293MU1pUS
 h2Ok6PeyBoJDGma1f4H0dW8+rfqXU6vrx7pRDSVaM24BuK4XSVPfSsMtC24AADoHhrh5
 Gw2/E4ocBYGZsmEMKVVW/NXHPzSILMmQlWGmJv0Td5tHL5SU4m3NTJCzHz4Rpp/xbISA
 obd1a79nkNLfmOvlBu8T0P6b7Q5A2HA0Qp8abnHI9IqzYARI9+CWJcBgxTB2VhiVTSc0
 q9Ww==
X-Gm-Message-State: ANhLgQ02b14F2weA5Psys/52bNNjTn23yGftO1GFEG2mVqxa5jelVt1H
 YJ9d5qv5IHTBrLg9PrFJkQ8=
X-Google-Smtp-Source: ADFU+vueB6r/vYv52C4vPHw7yM0HzSwfusa32gsWKtLNyCHbdCuc8xHsDKC0KxVJJvEQfwpYl8sVfQ==
X-Received: by 2002:a05:6a00:c8:: with SMTP id
 e8mr24050030pfj.131.1584353069183; 
 Mon, 16 Mar 2020 03:04:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:28 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:09 +0530
Message-Id: <20200316100319.27935-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 16/26] parsing_cocci: ast0toast: Add
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
cases for these types in ast0toast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0toast.ml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/parsing_cocci/ast0toast.ml b/parsing_cocci/ast0toast.ml
index f1bbde0b..dc7b30f7 100644
--- a/parsing_cocci/ast0toast.ml
+++ b/parsing_cocci/ast0toast.ml
@@ -562,6 +562,7 @@ and typeC allminus t =
 	| types -> Ast.DisjType(List.map (rewrap t no_isos) types))
     | Ast0.BaseType(_) | Ast0.Signed(_,_) | Ast0.Pointer(_,_)
     | Ast0.FunctionPointer(_,_,_,_,_,_,_)
+    | Ast0.ParenType(_,_,_) | Ast0.FunctionType(_,_,_,_)
     | Ast0.Array(_,_,_,_) | Ast0.Decimal(_,_,_,_,_,_)
     | Ast0.EnumName(_,_) | Ast0.StructUnionName(_,_)
     | Ast0.StructUnionDef(_,_,_,_) | Ast0.EnumDef(_,_,_,_)
@@ -588,6 +589,11 @@ and base_typeC allminus t =
       Ast.FunctionPointer
 	(typeC allminus ty,mcode lp1,mcode star,mcode rp1,
 	 mcode lp2,parameter_list params,mcode rp2)
+  | Ast0.ParenType(lp,ty,rp) ->
+      Ast.ParenType(mcode lp,typeC allminus ty,mcode rp)
+  | Ast0.FunctionType(ty,lp,params,rp) ->
+      Ast.FunctionType
+        (typeC allminus ty,mcode lp,parameter_list params,mcode rp)
   | Ast0.Array(ty,lb,size,rb) ->
       Ast.Array(typeC allminus ty,mcode lb,get_option expression size,
 		mcode rb)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
