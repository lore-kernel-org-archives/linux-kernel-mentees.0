Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AFDC7C8A4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E416520656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKnDCVoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E416520656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AA6F687D92;
	Mon, 27 Apr 2020 12:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOWPnCwqYr1o; Mon, 27 Apr 2020 12:10:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D237187D7C;
	Mon, 27 Apr 2020 12:10:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2731C1D74;
	Mon, 27 Apr 2020 12:10:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 804B2C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7D4328587E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgVkEZHppJu5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13B1085F37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h69so8599326pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoYSqyO22rGi0Db4CqIjpeG/yfksbrnzAwvFWBh1tCQ=;
 b=qKnDCVoO1mLBGIybMp/3g8aC8cc0y7WxPmbfl71mwLBMh1425RTTB6x2eFRTohjswd
 UTJLimGECaVkqYBmPRA6RMUL+s5psGTXamng1xMs94iNOAvUFZRND5n5I1DiC+vFAk6h
 1wmcnuqRmBHQWT0Ezi5SoBZ6cFwvYpBWLeJZzOZ/HU85tUCLFZUKFBZHKfqBnr+dnYvo
 bq74a13NS5OhEG6+x8nwJBRrfVMKOPevg6pnSlIRetk1b3xHVPwLsPlxOQD05LR9LfsD
 aHshwesuIT6G6dmfDGCZ6/F/6DRcZLFjhbETfmY97Z0uchvoICijrgNVpEP6FIeD9qZ9
 lxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DoYSqyO22rGi0Db4CqIjpeG/yfksbrnzAwvFWBh1tCQ=;
 b=Md7lUk5CxG4QLZc3Btn/MHF+JiYNmnIVl/3e3204FTGk9Vq+1e4P0BItQiI7dYLhmE
 Koi9+oa9ddtHwNAvf0KoQg9K6NFFFArgbsiiJFEhY/3kELw/JJ1hBQjBb/Y8egLsTh+6
 KBIAe1vqmF9r6pusu4MCtikKqXlRPC3FvRL7h/1jDhZnyp76+MhSur+KlCGNzlcorvhD
 3zu8HSXJocGQpY0rz4cogzH9JDhymPag3Edw/rAk+xGOz4xeTB6Sri6gLFksU17x1i4Z
 SjKfKQlFHwA4XBcDIq6Wgl4oyHIEvTOPwIhk7Lvqkb8t8rBzqKrpbFDlxdLIWtlw+P/v
 nNhA==
X-Gm-Message-State: AGi0PuZrt9aYzRaOF5QDIP8Il5/GNJ5lltES+xXT7IY9vNHnuEv0DrnI
 do1Sok6vSGZ3T+TRfnUd2zXJKwtULrM=
X-Google-Smtp-Source: APiQypKJEcXwY6grZhJMONF0CscEOICFfb+Vz/7i3cuVklX14CObw6yqGVnIbFEJv+zvFXQwo/nOnQ==
X-Received: by 2002:aa7:9832:: with SMTP id q18mr24948130pfl.179.1587989394648; 
 Mon, 27 Apr 2020 05:09:54 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:28 +0530
Message-Id: <20200427120834.380-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 17/23] parsing_cocci: disjdistr:
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
disjdistr.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/disjdistr.ml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/disjdistr.ml b/parsing_cocci/disjdistr.ml
index 6724bb25..c868cb1c 100644
--- a/parsing_cocci/disjdistr.ml
+++ b/parsing_cocci/disjdistr.ml
@@ -259,10 +259,10 @@ and disjexp e =
 
 and disjparam p =
   match Ast.unwrap p with
-    Ast.VoidParam(ty) -> [p] (* void is the only possible value *)
-  | Ast.Param(ty,id) ->
+    Ast.VoidParam(ty,attr) -> [p] (* void is the only possible value *)
+  | Ast.Param(ty,id,attr) ->
       disjmult2 (disjty ty) (disjoption disjident id)
-	(fun ty id -> Ast.rewrap p (Ast.Param(ty,id)))
+	(fun ty id -> Ast.rewrap p (Ast.Param(ty,id,attr)))
   | Ast.AsParam(pm,asexp) -> (* as exp doesn't contain disj *)
       let pm = disjparam pm in
       List.map (function pm -> Ast.rewrap p (Ast.AsParam(pm,asexp))) pm
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
