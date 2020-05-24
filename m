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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF44C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A2C206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qe5K+uTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A2C206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B56B86722;
	Sun, 24 May 2020 17:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPVG1cWoqKcd; Sun, 24 May 2020 17:22:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E705D8671C;
	Sun, 24 May 2020 17:22:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E39FEC0178;
	Sun, 24 May 2020 17:22:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79552C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 690768746E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCRzxiDPP7SN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0A7398701C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:40 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id m7so6631001plt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAD46fD01aNyn20JNooZb90mKKDcnOlC71QcSJBDLwE=;
 b=qe5K+uTL/WjhPUP1FJu5+Uj6kg18IWM+Kmd6qWk22kds9B5bn8T/Q1AxuJGTfuhKZn
 pPpxyTq98F1Kak8prEO2wYuuREvu4cm17djz/YvBa+UrBOdyin9cKsjIzMAMnXWsaCV5
 mheWeqk8IDp62pdySglgxtSrdh99YLUPA9WKUUi6+ma0VAZ/164C4/b2bGeFpcDk3J/s
 jdwrWGx8pJU1k4CZ67b6PMUzeOM2GbXQLbyghgnrFlYTYmV/M8xA7PPHUaByuMTTkFuU
 +9H9uIfVEjUnpp790E+H+N/iu96YxBicq8YXXG2DKI6YWCgF738zn82sS9QECFzPZUjd
 HFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAD46fD01aNyn20JNooZb90mKKDcnOlC71QcSJBDLwE=;
 b=tPoU7acj/S/ev5hLpCpvzKowah6f9YRbCopYSuKNkJJP8Gcht4l/xMMcgDN6jbFrK3
 ayopPHU7WeTrTaCsnAEz7kWLnC8t9B7jxOw8ftk+p1VLymOIqGiyALkwAup9cDsnFm7m
 NPYiyFqYVbANtfG612s9V9A3Z2mGdXbZejVtNRxidj6QI7ozkzTobAyKe8dsO8cZ6s2b
 vYHL4Vcw3l1CHZT6Vusencsf9Jd2yG0glxGG7a+tfso02bx0tCYHKlNZNrMkSs75EELC
 cpqVcM+PtvhLVFxXTCZ5QmslucigtjZXgtOuk24fQhxrg2RBSyh/ogOn8CpyXli5U0ig
 GrGg==
X-Gm-Message-State: AOAM5311QZYvX9TdZkuFHz5y7Nz13aEdnscA2fHBL14vVRvTcmTgHI9T
 OyzhZeGmrSXwBpuGd/FySAg=
X-Google-Smtp-Source: ABdhPJz6ng3nBuHvVtD1aI+okrXPWNFLjXpkbaMjzOr3Ske9SWRUk2nQOU0J+h3MvaKaIXLycxINgw==
X-Received: by 2002:a17:90a:fd85:: with SMTP id
 cx5mr16284420pjb.146.1590340959627; 
 Sun, 24 May 2020 10:22:39 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:22:39 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:32 +0530
Message-Id: <20200524171935.2504-28-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 27/30] ocaml: coccilib: Reflect
	Macrodecl attributes
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

Macrodecl attributes are added to the C and SmPL ASTs. Reflect these
changes in coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index 5e31eec3..264c01b2 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -288,7 +288,9 @@ module Ast_c :
     and declaration =
       Ast_c.declaration =
         DeclList of onedecl wrap2 list wrap
-      | MacroDecl of (storagebis * string * argument wrap2 list * bool) wrap
+      | MacroDecl of
+          (storagebis * string * argument wrap2 list * attribute list * bool)
+            wrap
       | MacroDeclInit of
           (storagebis * string * argument wrap2 list * initialiser) wrap
     and onedecl =
@@ -2765,7 +2767,7 @@ module Ast_cocci :
           (string mcode * string mcode) option * string mcode * string mcode
       | TyDecl of fullType * string mcode
       | MacroDecl of storage mcode option * ident * string mcode *
-          expression dots * string mcode * string mcode
+          expression dots * string mcode * attr list * string mcode
       | MacroDeclInit of storage mcode option * ident * string mcode *
           expression dots * string mcode * string mcode * initialiser *
           string mcode
@@ -3400,7 +3402,7 @@ module Ast0_cocci :
           (string mcode * string mcode) option * string mcode * string mcode
       | TyDecl of typeC * string mcode
       | MacroDecl of Ast_cocci.storage mcode option * ident * string mcode *
-          expression dots * string mcode * string mcode
+          expression dots * string mcode * attr list * string mcode
       | MacroDeclInit of Ast_cocci.storage mcode option * ident *
           string mcode * expression dots * string mcode * string mcode *
           initialiser * string mcode
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
