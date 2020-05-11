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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFFBC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1DDF20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqHt4Bg7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1DDF20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80DE287895;
	Mon, 11 May 2020 10:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qp6AatPgB9tT; Mon, 11 May 2020 10:09:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2448C87277;
	Mon, 11 May 2020 10:09:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11C5BC0176;
	Mon, 11 May 2020 10:09:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25C45C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 15F22888CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLZLM-XfR5xF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B1BEC888C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:11 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id k7so2631681pjs.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7ELOxhs++R4PGiU/Iixh5yNByp0LLvXtJg2Z+Mbkz8=;
 b=eqHt4Bg7wJL8Bc0tlogP8vH8/6QqkOEuMwr0LezR/ZXT106HPnVI4vZ+oM8bR6YBAZ
 oaodNkIbtIAXP2JocjmM56vzmlAnp3AO6K6Es1dU/4QpJhkR8plMoKlY58vcwZBU++3b
 fLOkFPQ9eROukteHog1GSuQ//sF+690Cnspibwfo/79Ot0zcYJ6gWxmkMJa4/RuzypOH
 p4nJPjhdqgf5rB+53KDSrZvRCm+uRl5J3ynd3QBIKMpVbooCHQKwjjuwPDvS0Y728UoD
 nnN3vidg6QxNXZ8cMnoL3dxffVoiBa5UEAH+5S6yPrng5SHQTv0nqrdmEvy0WqR2uQ3W
 0vGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7ELOxhs++R4PGiU/Iixh5yNByp0LLvXtJg2Z+Mbkz8=;
 b=WHItkX2wfbTHu5LfzYqROPJO0A1WJsaGB/retWKKF/xvFFkfAWh2fvRv7urg0j3thH
 TzWTdE9O9f4TGSpcWj74mMve3zSgU36UozyZXFDeztKeChFYuH14FPpASO1jvwkX/P87
 OAwRJaAA6Wi5Op9yzjx665+oRzWIeDCN8leUDrPyRe/xvRQg668Fjj4IZPOkJ1TQsjiN
 2sfRUvu0W2iNATneOFHTHeQdQY0O1i9DEG9XfLQxv6yBnbSuKTNw61CE5UR2T7rba3E+
 HtAw4d4gfeYH4zwHyrfy4DUys2Gs4uLHlBWIPMX2JY8qpD7/era2x5xkv2edligzxR61
 sqtQ==
X-Gm-Message-State: AGi0Pua2mCaquhDTjdgJmdcxX5dI8ndwx3ozmqzlyL0bFxzAsVOOsGL6
 wnX7jRp9Wj7m1+sXwjeEaV8=
X-Google-Smtp-Source: APiQypKnbMUOri4JsEBkc6f16Vogf3OUq7q6+5/QR37gENBND0rEH3KF0ST7LO3IpAPbSi3gXHefvA==
X-Received: by 2002:a17:90a:cc6:: with SMTP id 6mr21530448pjt.17.1589191751263; 
 Mon, 11 May 2020 03:09:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:10 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:07 +0530
Message-Id: <20200511100715.19819-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 24/32] parsing_c: unparse_cocci:
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
index 395b3a3c..0c95c35e 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -455,7 +455,7 @@ let rec expression e =
     | Ast_c.RecordPtAccess (e, name) -> postfix
     | Ast_c.SizeOfExpr (e) -> unary
     | Ast_c.SizeOfType (t) -> unary
-    | Ast_c.Cast (t, e) -> cast
+    | Ast_c.Cast (t, a, e) -> cast
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
