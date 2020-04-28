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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E14C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:02:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0329620730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tR+zlfa0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0329620730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3C7188299;
	Tue, 28 Apr 2020 17:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANfWXcLluI8a; Tue, 28 Apr 2020 17:02:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D6228625C;
	Tue, 28 Apr 2020 17:02:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09381C0864;
	Tue, 28 Apr 2020 17:02:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89D8BC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8691B8648C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZtTZxzimezs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BAC1D8648E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:50 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s10so8637785plr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M91q9QGpyZbnFV5DZ/SflSN23/oSIrJm2HJMonaNS90=;
 b=tR+zlfa0tZB10YU1LuW9TflOQwiAPCIhJMjjH6vlszn5HelSGXJ6RhY2y+ZHRbmCeF
 ldGg6u5hq2nqRem7COIZ6TzWmnmvZOnQuzHq7rwEkOeaz2s2b8hOJiPiaahn0KdeepNH
 dtJyHdIEnJSQnL4ayDHLSWvJ5gEARQNlqh0EJykurHFJeDY+kPifUv/U9WpbBwqooQBZ
 c4Lu3eW6sjT3TAvn9McygWjkK5OpkgN2Tebf43YCD9HP8dN8v0ebpOOozj8tzmUUwy4j
 FhG0BkQZlsO+kDm4Vhb21OpwN6It+noKlGGkqbBe3KCAQUe77l5s5z+KNl4IF/cqRJzO
 1VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M91q9QGpyZbnFV5DZ/SflSN23/oSIrJm2HJMonaNS90=;
 b=k1NhjmNfmGzaqCiaGHwXprRJaBKMxZOV/ycGb8QJNrxZw6LaoJvNPRPktdln/xllRP
 ltaDEhHA4b3nwF2mj0DyFE6yIqFM54vW9JqFQF+IsbXZcNXH1eJU4gN2BIqN++nSkjuW
 pOaUzp8EatGlYyLcRNJJ+6sSlIeb+d7TmgQJ6I7bkDygrrmthX2yDa36Yhef2KQw80Ji
 7nUI2lw6j+X/4xC2xPf4s/WhyyIpCQ53UHgt4ZvnWDm/XRSv4Skr+gWvR1MiLL1tB+Wk
 fVaa+D8SMt0YWSa804P1NC+z8un86DtbxgvIZj2FlDWI8/DlZKjyQR1i8A7JT4eMJttz
 UtHw==
X-Gm-Message-State: AGi0PuaSgHyeBmBPGluQCKA8AsLYnennTi6wI7tO+smYKlLlB/UZHyxK
 tzQGqP/gszhfUrE933gBm5k=
X-Google-Smtp-Source: APiQypJ56dodiDiiLL37Fv2ec2zgVwtRE8g2bWaQwoVgZ4D3a4SXlA0NdwiApkQMJpq5fMyOxzC7bQ==
X-Received: by 2002:a17:902:d34a:: with SMTP id
 l10mr29830890plk.234.1588093370295; 
 Tue, 28 Apr 2020 10:02:50 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:02:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:31:58 +0530
Message-Id: <20200428170228.7002-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/32] parsing_cocci: ast0_cocci: Add
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

Add cast attributes to AST0 of SmPL. This is a list of attributes in the
Cast type of AST0.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0_cocci.ml  | 4 ++--
 parsing_cocci/ast0_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index a06d99ae..b65400be 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -123,8 +123,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * typeC * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * typeC * attr list *
+                      string mcode (* ) *) * expression
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
                       typeC * string mcode (* ) *)
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index 5c2520be..08a4b33b 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -114,8 +114,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * typeC * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * typeC * attr list *
+                      string mcode (* ) *) * expression
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
                       typeC * string mcode (* ) *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
