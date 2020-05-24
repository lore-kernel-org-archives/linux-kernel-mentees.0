Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C637C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3279C206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4N0QYGX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3279C206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E47C42262B;
	Sun, 24 May 2020 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmuQL20eTJKl; Sun, 24 May 2020 17:21:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2C4C7221FB;
	Sun, 24 May 2020 17:21:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19F22C0178;
	Sun, 24 May 2020 17:21:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B99EFC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A96C186267
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muDcUxjzWceH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2C0C585FFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:09 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t16so6620439plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RFL0vX57JLjJtDttGGTwt7+T+8bNhaJb8FQN4BlYQM8=;
 b=N4N0QYGXp7CjNO8TigNGJm2MTSwDmwer7hm/Y1XrdUg6PTF8YG5/Uqhq4vWMp3b+5q
 IKHX6Cbqz0FchzRVABghxU2ciav9C52C8SkBsNnGL1esqhP1OThC0O+FXjPt7eDPaVfx
 RRYSxZ0o+4bn05xYTpF2i4RtyjLxd1SPkYtHyCiQ1vsggYcsbTbD3ZrNDPhtgCc8HK2f
 37xNdXFrxh/tmUJUxqxwpKGguTDprbE8twKsqImY27uOUuTQWUCNkEGxjniYUWvU5TxW
 Rr793l6rY1fbzbQJ78J/D7vOEGMOkpqjGORQsdjCwts4arIzRRlYwXk/pmNN4ltGL+p2
 /QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RFL0vX57JLjJtDttGGTwt7+T+8bNhaJb8FQN4BlYQM8=;
 b=PvegLn83M7kOnjxeVKoWEL5xaIHgOZSNq0v1uiexm3xM1t2v8CYCphH44FIUZURjT9
 GGGKvLZSTLUQLYYKvn4sp/8kvHBYbKCkYpPKjFH7jfNOqZtCjE2IDTeWyvMD2FpHdkdM
 Orj54KPCXwhQADuDhjUqsH3dQzdmJdRfzKZ6pZ4PRoCTYtPa2mw1kJgMbVmRzxy5i5jo
 RmbS2OzMp/m/KUplQCK029ZNRR0Fh0R1eNOrI3c6bYa6dubgE9udq3VVhQFwjqHKeLBb
 atJBaRCFYf8uXjpo7KHu/rssZdlkyWul0cRCfwuRSmbCG2GgCaCZSe5YipQesUzgvnMm
 xb9g==
X-Gm-Message-State: AOAM531eM/sC0/p05ISdNTi/3Qhxded3jOG/ocU2In0vA/iOQMYhW/Xo
 75S8bvnHcFwIoTT1Fk8xK6k3TU/4UUo=
X-Google-Smtp-Source: ABdhPJxolzVHTASGt8dbLXaG4SNKgboIkw8mOcKdcMepLrqUar5kwsYRrXflmOmOEVJo5u5ABrYNzA==
X-Received: by 2002:a17:902:7c05:: with SMTP id
 x5mr25121785pll.278.1590340868729; 
 Sun, 24 May 2020 10:21:08 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:08 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:18 +0530
Message-Id: <20200524171935.2504-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 13/30] parsing_cocci: ast_cocci:
	Reflect Macrodecl attributes
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

Add macrodecl attributes to the SmPL AST. This is a list of attributes
in the Macrodecl type of the SmPL AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast_cocci.ml  | 3 ++-
 parsing_cocci/ast_cocci.mli | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index 9b147e5c..87bd017a 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -399,7 +399,8 @@ and base_declaration =
   | TyDecl of fullType * string mcode (* ; *)
   | MacroDecl of storage mcode option *
 	ident (* name *) * string mcode (* ( *) *
-        expression dots * string mcode (* ) *) * string mcode (* ; *)
+        expression dots * string mcode (* ) *) *
+        attr list * string mcode (* ; *)
   | MacroDeclInit of storage mcode option *
 	ident (* name *) * string mcode (* ( *) *
         expression dots * string mcode (* ) *) * string mcode (*=*) *
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index c56bba88..5d04430c 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -381,7 +381,8 @@ and base_declaration =
   | TyDecl of fullType * string mcode (* ; *)
   | MacroDecl of storage mcode option *
 	ident (* name *) * string mcode (* ( *) *
-        expression dots * string mcode (* ) *) * string mcode (* ; *)
+        expression dots * string mcode (* ) *) *
+        attr list * string mcode (* ; *)
   | MacroDeclInit of storage mcode option *
 	ident (* name *) * string mcode (* ( *) *
         expression dots * string mcode (* ) *) * string mcode (*=*) *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
