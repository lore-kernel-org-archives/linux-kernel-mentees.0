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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69508C54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E60F2075E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDQWaZaL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E60F2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A24787858;
	Mon, 11 May 2020 10:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCxTaDha2xfY; Mon, 11 May 2020 10:14:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB89886D13;
	Mon, 11 May 2020 10:14:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB8C1C0176;
	Mon, 11 May 2020 10:14:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CB02C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2BB8F24B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajSilhQibPgy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 31A6E24C39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:29 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k19so3738953pll.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TV0hQbWPE6I76/eXMWA6DfzgeTBXmkrL8f2jcsCkf6M=;
 b=pDQWaZaLZq5Zp3He8jOevTL36fH5efM7S8NZMK8PNRUNPqV2R80Ocu64IvtOqZTFPO
 KRSkrBCLqhRj10nSluJvpyMHLKBCzqERxK3+qu/uONFaXwFK2F7UAfrNz00oJI1mWiV8
 EzxSyyHuRZimEaJZIYyKJHPPR1hL2bnE7mKQmIqDA8f0IltOCXtLa6z/eGPfa65FrOCA
 rLZE8hm5onqaEl3JhhVDgZeHh+YVO+iUcr1xP7qh2dpSCDPbCUXSfITiRjO8Vo/yT4KY
 zL+76sV7YEynP56BWbYJMI9NuznvQei3EXxIusLJaYY1n35wC6VWFaqt7yOMcProeSp3
 YOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TV0hQbWPE6I76/eXMWA6DfzgeTBXmkrL8f2jcsCkf6M=;
 b=iPyXvt6ICD5f6dSjtzIrQes2JBh5qr68g10cHNMR0KpikGlv1xnBb5gO8CNiZtU4W5
 DdF38yPtogTiRS4fAPIHAKOWBSyTyQ4U2Txfhql0LtFWKW9tx4xD5EZXy+OxiFgXMNuV
 tHfYKTcIiEPmCTMAZGDa5UQ4cz8p1DqZe/4xXo4/wn0NXvmkVM2fHwxkqR6tVrOgHj6Z
 jUfDP+XdIdyFUBpRjhc3mjboGlK/x1cPVDI7nobpbO2L9GY8hpdqYd5iC5b4bqmxX6qZ
 c5DvMoPmrwY/bikVZ/fYYQ6EyLq2k14PeGPx/3bu0yv0Kp5wiyAkUlawUS3AwcJ2exMv
 qgLw==
X-Gm-Message-State: AGi0Puamc+FaIId6B+LJiqPBo3fHi+ZtiOzRMY0zZcJ/ert+jdwdObXb
 lQTAV+Cx2i2Rrv3Idd+DTfI=
X-Google-Smtp-Source: APiQypKini2t5ARQmTcRJ7w/Cnlob2L/WnrdU5+FGEjGRwoFIPYYlRfdXS8E6IOzLddn4KoEYVvW7A==
X-Received: by 2002:a17:90a:2046:: with SMTP id
 n64mr21598286pjc.230.1589192068735; 
 Mon, 11 May 2020 03:14:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:28 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:56 +0530
Message-Id: <20200511101300.11101-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 19/23] parsing_cocci: unify_ast:
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
unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index 68cb6613..e2b92c48 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -542,11 +542,17 @@ and unify_designator d1 d2 =
 
 and unify_parameterTypeDef p1 p2 =
   match (Ast.unwrap p1,Ast.unwrap p2) with
-    (Ast.VoidParam(ft1),Ast.VoidParam(ft2)) -> unify_fullType ft1 ft2
-  | (Ast.Param(ft1,i1),Ast.Param(ft2,i2)) ->
-      unify_fullType ft1 ft2 &&
-      unify_option unify_ident i1 i2
+    (Ast.VoidParam(ft1,attr1),Ast.VoidParam(ft2,attr2)) ->
+      if List.for_all2 unify_mcode attr1 attr2
+      then unify_fullType ft1 ft2
+      else false
+  | (Ast.Param(ft1,i1,attr1),Ast.Param(ft2,i2,attr2)) ->
 
+      if List.for_all2 unify_mcode attr1 attr2
+      then
+        unify_fullType ft1 ft2 &&
+        unify_option unify_ident i1 i2
+      else false
   | (Ast.MetaParam(_,_,_,_),_)
   | (Ast.MetaParamList(_,_,_,_,_),_)
   | (_,Ast.MetaParam(_,_,_,_))
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
