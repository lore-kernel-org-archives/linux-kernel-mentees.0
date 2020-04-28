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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93485C83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:05:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6910E20730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbUsJWWb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6910E20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41F2787118;
	Tue, 28 Apr 2020 17:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9pGUalSzptI; Tue, 28 Apr 2020 17:05:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37CF38625C;
	Tue, 28 Apr 2020 17:05:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21D59C0864;
	Tue, 28 Apr 2020 17:05:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FB51C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8DCE384415
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WacrL+3Srcfq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0E47D84368
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:19 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id r14so10975063pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3ReeIBsUmvwqIkuKcc953gbdgvjaKucYr1i3+EeYT4=;
 b=FbUsJWWbLKREBAr3vFxvbEd35sOhop17Fe28zhg9wRAgXuPlRGrrjlxsWZwTAu2CCO
 4GEpXtAufHYM9mmIauS6I8WTWfJrF6aW+QCTSGQHepGHw2NEN1lcfd2qWEg2OX7qvoMs
 C7bwiTYWNzcNSSuHOotz08Po9t4Npl7o/1qnGjxNo76lioAA24jd/CnzqKbJBiWGAQfF
 rW9mplBTsCpEDvPOHwaQx9SttMDqoo/eQzfvf4bGYBZgdXyjZWg+JZNhTswotW2JILxD
 PsbgczRAHauJj3YDJscjYWAP8/MqIMnH2hcEqyA6rbcRCv6klsJWAoG/n0mYbWMWdisI
 HPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3ReeIBsUmvwqIkuKcc953gbdgvjaKucYr1i3+EeYT4=;
 b=BjwNrrc7X1tQhPcWgKmNsrtARJV3zEimrq4V9mEQTQSD1qvuidYAnVCG+D+FbyUizU
 iC6k0RZ+YEc7FT2wD7e3hmBgwmMq6VD4TczzuNVTdCfhbjxL6nHtIpkaCVmV6opDfd4o
 BIfP+s1khRsHMEgBZR6vsG1I2maDmU0lG31Fwtgqb1GEy7WtZltlsH4BR44pnhplHf1R
 nvhvG8MDBF1uUmhLU56JuTByP8TYPxhx0HbEVC2iyn6u/rvIxyDf1ZFGei/sXGY3sZqK
 fJsDYr2fI1N7DFbQBGmh6BFzJiIV1/2Y2O7mowMcUFL+lafDWa49PfpuwyNEm52w3d1c
 kf8A==
X-Gm-Message-State: AGi0PuYJc6lJtoyWcR0+mIb6c19c4SP1S9dfA8hWR0Etu9vwM6mmzPe6
 22TNTXzyu3mtMMKAXiqSdmY=
X-Google-Smtp-Source: APiQypLCemE0uvGm90G94Xm0vd4JloZlFVy2YY74eWvv8W4jozi5eyDFSecYaagL/k9ee2dwjlt4Yg==
X-Received: by 2002:a63:2885:: with SMTP id o127mr4457703pgo.198.1588093518647; 
 Tue, 28 Apr 2020 10:05:18 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:05:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:20 +0530
Message-Id: <20200428170228.7002-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 24/32] parsing_c: unparse_cocci:
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
unparse_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_cocci.ml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 395b3a3c..081bcdd9 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -455,7 +455,7 @@ let rec expression e =
     | Ast_c.RecordPtAccess (e, name) -> postfix
     | Ast_c.SizeOfExpr (e) -> unary
     | Ast_c.SizeOfType (t) -> unary
-    | Ast_c.Cast (t, e) -> cast
+    | Ast_c.Cast (t, e, a) -> cast
     | Ast_c.StatementExpr (statxs, _) -> top
     | Ast_c.Constructor (t, init) -> unary
     | Ast_c.ParenExpr (e) -> primary
@@ -503,8 +503,10 @@ let rec expression e =
       loop exp postfix; mcode print_string pt; ident field
   | Ast.RecordPtAccess(exp,ar,field) ->
       loop exp postfix; mcode print_string ar; ident field
-  | Ast.Cast(lp,ty,rp,exp) ->
+  | Ast.Cast(lp,ty,attr,rp,exp) ->
       mcode print_string_box lp; fullType ty; close_box();
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
       mcode print_string rp; loop exp cast
   | Ast.SizeOfExpr(sizeof,exp) ->
       mcode print_string sizeof; loop exp unary
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
