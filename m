Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3F4C83008
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351B620730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6EMZavb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351B620730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17B64864B3;
	Tue, 28 Apr 2020 17:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maN1LH1DBF6K; Tue, 28 Apr 2020 17:03:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B6EB48648E;
	Tue, 28 Apr 2020 17:03:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67438C0864;
	Tue, 28 Apr 2020 17:03:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49392C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2EB8620464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PyJoihgzP9Ys
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 89C6420436
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:43 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s18so7963463pgl.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zbvXGqBiZFdhuruX6dixt1jqjEUEVpjkXq+JsBjijvw=;
 b=V6EMZavbBqv5glTnH95BbWCTWfaqULKey4KyoFRTD87T1F+E6vBIHPBmmrVK2yt7Oo
 4/X/3aINk3LUs8l5juSAraGGUGHYXHTuXkWxvxOhQ5FYtfhs5wp/PwdbV0aLCUkUkHfi
 aHJtSYAT3eDTfPoxsbW4pi5LBcZrrKP+Y+OYf3vO48U+E5sydP5BW8E9/LmGDpzD5yg6
 BUd57v8cDIjrlqVACgmd+WRwRbm4k1baTHmZPHSGu//YXKYjZMAWdeSU38wKhCP38PAO
 2k9JHZxoWTUFJ3e2ISpuKQxsx6e+YjXTBfol7klI+TdGMyarRSPzmBi4yVffMw76TX1D
 d2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zbvXGqBiZFdhuruX6dixt1jqjEUEVpjkXq+JsBjijvw=;
 b=I0o2tv4YWq8fhqHotUv2PFSk+TyRrrYxW303MduWAUDR6aGYXpGOmeB6dugfFqsDj7
 C+2GjXwIRQzdNJ7WG7pQIjwMOJ4jfKf4BLq44omvTHHfoLDtoGDRn8brVry8IBT1WB4h
 MOwQ5LxefV9TDjk4r5o9lu1ogRD7PHpu9WTrdSCaoh7gozdptDJuCYbpbxwc+kSvoqV8
 s370qVfSg09zDzZ8+YL9f4H08lMsXM0zu6XitI5AfL3Rsh8S7bhC/04mXOTP5yFnFRar
 CDF2kzNRoJcvBFeDjuwDBTVAGbilHvjGFR1LKjOe+ZtfngxYQGditvrj0gBS9M631qjT
 lc4g==
X-Gm-Message-State: AGi0PubdQ6dBkLkKQDMhkLM9hi6p279W8DEvVTIUuIGPZy/3RCwgwsw2
 Er1knbbaZXx+uLUkTBo8n/s=
X-Google-Smtp-Source: APiQypIfUdOcQB1ZxZMyUn4kjKqpBAY0AZvyfBqhV/+25YTS4EF+3709cNoDIKhVGf7ywwR+0dEOgw==
X-Received: by 2002:a05:6a00:2b4:: with SMTP id
 q20mr30708451pfs.104.1588093423046; 
 Tue, 28 Apr 2020 10:03:43 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:42 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:11 +0530
Message-Id: <20200428170228.7002-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 15/32] parsing_cocci: visitor_ast:
	Visit cast attributes
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

Cast attributes are added to AST0 of SmPL. Visit these attributes in the
SmPL AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 8e530114..644bcd5d 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -198,12 +198,13 @@ let combiner bind option_default
 	  let lar = string_mcode ar in
 	  let lfield = ident field in
 	  multibind [lexp; lar; lfield]
-      | Ast.Cast(lp,ty,rp,exp) ->
+      | Ast.Cast(lp,ty,attr,rp,exp) ->
 	  let llp = string_mcode lp in
 	  let lty = fullType ty in
+	  let lattr = multibind (List.map string_mcode attr) in
 	  let lrp = string_mcode rp in
 	  let lexp = expression exp in
-	  multibind [llp; lty; lrp; lexp]
+          multibind [llp; lty; lattr; lrp; lexp]
       | Ast.SizeOfExpr(szf,exp) ->
 	  let lszf = string_mcode szf in
 	  let lexp = expression exp in
@@ -1184,12 +1185,13 @@ let rebuilder
 	    let lar = string_mcode ar in
 	    let lfield = ident field in
 	    Ast.RecordPtAccess(lexp, lar, lfield)
-	| Ast.Cast(lp,ty,rp,exp) ->
+	| Ast.Cast(lp,ty,attr,rp,exp) ->
 	    let llp = string_mcode lp in
 	    let lty = fullType ty in
+	    let lattr = List.map string_mcode attr in
 	    let lrp = string_mcode rp in
 	    let lexp = expression exp in
-	    Ast.Cast(llp, lty, lrp, lexp)
+	    Ast.Cast(llp, lty, lattr, lrp, lexp)
 	| Ast.SizeOfExpr(szf,exp) ->
 	    let lszf = string_mcode szf in
 	    let lexp = expression exp in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
