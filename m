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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66127C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC0B20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFDVE2r4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC0B20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 196FA24C39;
	Mon, 11 May 2020 10:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BELTMECTWCD6; Mon, 11 May 2020 10:13:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A6D4B24B6E;
	Mon, 11 May 2020 10:13:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96EBAC0176;
	Mon, 11 May 2020 10:13:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86C12C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 73D4524C2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77g12lO3hZMg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id DF22C24B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:54 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t16so3738837plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xr9Q/5CorFjVOqOySFb3h8LfcOwM0kMg5W/Qt/usuXI=;
 b=hFDVE2r4JI1sIJ0k1DZZzWuG15R/8UKyQLIGNw+iO56ULJlijVwZmFgrIwEmKzcAX/
 0PyQeN5WuaQoatVtCzqpdEfcgRTMlANbO+NQgX1uvQYmmqQ91N2TsNLsSnwhlfoG//QE
 5d4SAL691vYFKRFgW8T/IymZOtTo7RiBm1G9U2McG8DbfupMXpLgx5qs0S+Aj2rUyD5j
 NawVJPJCQaxaxjjQ3XUW5ypGloFmyeiljcRJZmXgUhtHUaWif517jR9jEq/WrUX2SikS
 FOByQfC7d8T/diqJQWMrcgIDLGVfkfTljADym6b7rASKd79I9uTfdHoia65Qrkux6MhC
 OUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xr9Q/5CorFjVOqOySFb3h8LfcOwM0kMg5W/Qt/usuXI=;
 b=L112QjtUDgfMJZWwAL8Fhk3quvlaXSmFwRwnvKWLmdHi3+d5B4kWTI+7QTN4upTeg5
 zR/iOCknH41wZzjQnMKtXJ5S7S7LPa3BN+6A6LmoKYijTlKy+v7mIfKN6M1+8H4yD1p0
 QwQaMrwg/Z2lEnaqTyjoxsxpCtGn4AuetHFZrgMVr3QM7o0PdUo2HUiihU0RjjRewYvt
 +tzGHar5ba1J72czq10KKoxVLdTCtlp5K3RP+see74w1kie8CykSRrhHhwWe4AzpDtqH
 BJiE3BygzW6YB3aQk7OdQF9GXepcH1/sYfigzaBVdSPXh/7a2VHzj+kGqhVrg3r8POGK
 9P5g==
X-Gm-Message-State: AGi0PubTopXuNyflI93E4Fcev9dQUOfGBrI62lndG07zjy0cC2FB+Tjx
 bg19BV0RvzLN73Bl/qXL9MrCvnC3V0Q=
X-Google-Smtp-Source: APiQypLw2Wk8E86ebjVmldmg3y4xEreqh4k04FDDP/PW2AEPgwn+MTBmR92MjTg8DszIIC31ZKJZEA==
X-Received: by 2002:a17:902:7082:: with SMTP id
 z2mr14037704plk.317.1589192034431; 
 Mon, 11 May 2020 03:13:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:47 +0530
Message-Id: <20200511101300.11101-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 10/23] parsing_cocci: iso_pattern:
	Reflect Parameter attributes
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
iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/iso_pattern.ml | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 9df21fb9..b751f3e8 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -1165,10 +1165,22 @@ let match_maker checks_needed context_required whencode_allowed =
 	if not(checks_needed) || not(context_required) || is_context p
 	then
 	  match (up,Ast0.unwrap p) with
-	    (Ast0.VoidParam(tya),Ast0.VoidParam(tyb)) -> match_typeC tya tyb
-	  | (Ast0.Param(tya,ida),Ast0.Param(tyb,idb)) ->
-	      conjunct_bindings (match_typeC tya tyb)
-		(match_option match_ident ida idb)
+	    (Ast0.VoidParam(tya,attra),Ast0.VoidParam(tyb,attrb)) ->
+               if (List.length attra = List.length attrb &&
+                 List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                 attra attrb)
+               then
+                 match_typeC tya tyb
+               else return false
+	  | (Ast0.Param(tya,ida,attra),Ast0.Param(tyb,idb,attrb)) ->
+               if (List.length attra = List.length attrb &&
+                 List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                 attra attrb)
+              then
+	        conjunct_bindings (match_typeC tya tyb)
+		  (match_option match_ident ida idb)
+              else
+                return false
 	  | (Ast0.PComma(c1),Ast0.PComma(c)) -> check_mcode c1 c
 	  | (Ast0.Pdots(d1),Ast0.Pdots(d)) -> check_mcode d1 d
 	  | (Ast0.OptParam(parama),Ast0.OptParam(paramb)) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
