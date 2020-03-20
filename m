Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264FBC4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBB1F20774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmSBJ/Vl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBB1F20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D77282736F;
	Fri, 20 Mar 2020 07:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JF1txSA-Zeer; Fri, 20 Mar 2020 07:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 636C422854;
	Fri, 20 Mar 2020 07:03:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58240C089E;
	Fri, 20 Mar 2020 07:03:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF51C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 192CA8814A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsQbFzXDbHPe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B78DA86B53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:14 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a23so2120297plm.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=748xKLCwQqLPdCAv6SLGVWG8zuIrb/ZVbTG9e7X15dM=;
 b=rmSBJ/VlLVGXUtkob6Qf5xlwK9ZuAt1nArUwbKd0RSUAQdyJFfj/R1MwKLgU8k7e+E
 b2LbOqmIP70U5jxdO4Dge5ZmgnmBA6P3N9fbO0HyxGDVAKcCGyFYl3oV6bNMt1t8bd6Y
 BIt/5grsCdbv/G7SfHpP4z2Zdt5B/uGD3DRtRC/cq3FQcn7RstIgeY5W3QTdQ+S5cP+F
 UMIfNO5cislxg6VvcmWBC+HmaAK+AO6Cr/2x+vre9PZ+DACTUyMZ8OKZDUyaxKZFYUWX
 zZHIRugsG06uE45EdfmHWBtWcBOfxGsqTz/0WzoQ0osxjH/f27TCWeX/bhj5oOqcgB6B
 g9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=748xKLCwQqLPdCAv6SLGVWG8zuIrb/ZVbTG9e7X15dM=;
 b=g0xnZ0U1MDEgKF5ZaSavE/U/34C4XG8iLuMWZNPcMn/+x58ddVMeKKBNcik8T3ueQH
 OZASO4g2oFe1U+Ayg0Fjdeb8Fn2xphumYK6kVxd2VDzlm7adhoCO6eEGtypAqHBuXZ3X
 feKB+ExN0aEPoCAvwr67AAi/X/NGanZtVcoSoZhC/gQpZKzbYWhFCUcPVt2EgXAh3l3M
 4/EPhxI9DFr0H1oKEUUTHpEq6phX3wk7rl8UI12lxSwInNKRogIWXvMbnYlN0xippWXI
 SIpTAOY/3YQvRlCaXc29vxGw43i1Ws//geSbSuwcii8iekLnVXHkJZcII75RkGHsKiSC
 T5ZA==
X-Gm-Message-State: ANhLgQ2zZGhSV7DJVhkHe2fSOZYfNgxMFM+f4rQTBbQmc7VbBU3Ureze
 84F/VnGFiNrsjJ26otoGeXk=
X-Google-Smtp-Source: ADFU+vsws0QaCbFML6hPvn7UuJ6eJMD5msZEJuSgh38TEywwOLL+9Jeixccc9jd+7lbAFZrMl0gP/Q==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr7948514pjb.45.1584687794251; 
 Fri, 20 Mar 2020 00:03:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:13 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:47 +0530
Message-Id: <20200320070157.4206-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 16/26] parsing_cocci: ast0toast:
	Add cases for ParenType/FunctionType
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
