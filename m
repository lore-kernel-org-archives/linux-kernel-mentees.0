Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CA9C83008
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F6E205C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEXHR4pa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F6E205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CE45E2284C;
	Tue, 28 Apr 2020 17:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOpFQHW8GzS9; Tue, 28 Apr 2020 17:03:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 27ED920436;
	Tue, 28 Apr 2020 17:03:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09974C0864;
	Tue, 28 Apr 2020 17:03:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 718A7C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5E6EA81279
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3r2kKGuraEmp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CE5A3825A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:38 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w3so8631371plz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8ObZEU8oQgITaiHCYVY8TZYA9FdrqRe/dufNnhXR+s=;
 b=LEXHR4paTAfENXSm1fPyuMh2Y9HGrBp0yzn6UhF/cZwHQSEn2767OVRIDBqfmZFzGa
 gGaddEzo9mssxwBshNmwkOO+4YCjQ7FXRijzELpep3CkGsDEc8wNb0fws7fhQcrc9+8M
 cSK+cO4S3gjGhN3nMw8vGVUdLMk/R37pDWFu9m3pY+Bys8pwwYegl6Gu4FeUlJmVRkY5
 d5LHsUrVaNSu2v1/vaK9T9GiYF1i+wK6WZd3Ik9rJnpkfHJVpSlgT6W4ncEb+oZunRUR
 +Zd6H6//If0OzRhKQEPRicHgt5Z9rOVqCtjTU9/mXQXrPS8Dp9KYgMukS7Nb3jVviSP1
 jUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8ObZEU8oQgITaiHCYVY8TZYA9FdrqRe/dufNnhXR+s=;
 b=TGYGxFqpLbkA/Ncmm/mVQk2PJZD0ON5dBaMtbzQ3b1kNvoAb6YS+VX3zakr0pd0791
 xbg1sQ5A8jFhgBmoKoT7hXg59lWfcdZAeKeNeMcngxSF1VGkqbnA4t+EUO8Zc/78dtR2
 SPdGAr93lWkftgX5S361pW7bUkICqdiYdo42STogDhnrciOjrLiWzZhwNFHK4INdEmfM
 MVfclSLgCGFhgBLZvQKLJAscwAqa5+ERlV15DHijF1Ko9gwfhzUiSnUe74WUjjyDVwbR
 q5Zcjscr2235bu8wZRgjH6alKQjxvkDPAlH3Muv+i90S6xSeodyLk1cJkOAhpuwmWg2P
 Zqxw==
X-Gm-Message-State: AGi0PuZEfD14IwUbB6YFx/KhQ42j0GJ5pArlw1Fm4PANL6UWpBVhBuxR
 4E2jVARb2hL+LdAhrOq52/AT9IxIMLk=
X-Google-Smtp-Source: APiQypL0m7kGPLHbxYE2D4ptgxLVbXDupMFYZfKFe91ctu+0dqB7nMuTAdlLBHrybKoE0/7Hj1K+Sw==
X-Received: by 2002:a17:90a:734b:: with SMTP id
 j11mr6205428pjs.108.1588093418264; 
 Tue, 28 Apr 2020 10:03:38 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:37 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:10 +0530
Message-Id: <20200428170228.7002-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 14/32] parsing_cocci: ast_cocci: Add
	cast attributes
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

Add cast attributes to the SmPL AST. This is a list of attributes in the
Cast type of the SmPL AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast_cocci.ml  | 4 ++--
 parsing_cocci/ast_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index 9b147e5c..b0190fa1 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -194,8 +194,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * fullType * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * fullType * attr list *
+                      string mcode (* ) *) * expression
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
                       fullType * string mcode (* ) *)
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index c56bba88..ff81692c 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -178,8 +178,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * fullType * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * fullType * attr list *
+                      string mcode (* ) *) * expression
 
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
