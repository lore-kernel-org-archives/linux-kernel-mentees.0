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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D7FC47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095CB20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXAETA4U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095CB20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D7CDC24C39;
	Mon, 11 May 2020 10:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjfKtavQOn9y; Mon, 11 May 2020 10:14:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3389424C2A;
	Mon, 11 May 2020 10:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1801AC0176;
	Mon, 11 May 2020 10:14:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF1CAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EAA8D24C2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-4SUOmPMf74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 8982524B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:10 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x10so3745599plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOXqqQIKxCE3fAslrFlFgyBgp0iUgXeNGD0vo0kS0Yg=;
 b=KXAETA4UVCFUDV1AdBnlji0738eHHuB+3/xueJznEgFw3d2CJTH5eeEUVLeD1N5peV
 cYqFgzOaEcwsDopb25DxMeivl3OTj/lEFLBYKmHEQB+5iHBszN1SoASBhWBboRY/vUGb
 ke9ya5Jtdk7eDxK15wE0PGpL10DfgcGjFSVc4YQETCvX1VoSPXW+1R36tmzlB15qYEyQ
 eP+k3qUrB5IhWEG2q/ue+U/DrsYC+DAJvhKaP9LTNYM4i3DacIXZzD1UOgHP4UxMjVSp
 t29Ipc4lKzomXpH2kP+OtreboFrXp9EZEbhd9w6Jfj2mhCIm6qiZtSGqoWwCqqo0K0ED
 XaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOXqqQIKxCE3fAslrFlFgyBgp0iUgXeNGD0vo0kS0Yg=;
 b=gTObS0LB3OvzgRYUV/RsLx/vWeT/uSm9Y4TTJHVxa+8VgKucSsW5lSFhSDXC2dqn7H
 8FKv3B3b5FotuiLQhEaC1DkxczdWEIje7314XEbHtA18UXFNIUk5zCzDJJ8vr2Jt/O8Z
 dFQfIYCkKgA75/q1T9CRHd0XATy+fRO/R2LBG43FMvkVwWqxchLz0kkkgGJJZWHZD1As
 Ec8FjDW/FN8Rk+ovmQhWGV4Yc2mAY9xkWGtzGjUYJo60mcLb5NltZEw2tLrZ0/FB2CW0
 qvpf+edd4dFq2Rz06iABKq5tYlefuyBFgOWmxa8cbupou10U/eBGTSoWayQ9airugIyh
 tVrw==
X-Gm-Message-State: AGi0PuZKHvclQAvshFJHEx+JbHcDk1+egbgxM0gx1nirPyGBhP0cNk0B
 VoJZhrzD0B+ELDRt24vH3bg=
X-Google-Smtp-Source: APiQypKAD+OW8E7wOVy9poLG0HCiaZzJIuRDy+ZQ0S1r3/++Zd7aPy3Yx9R1xkfobkQJVGX2oir5Ww==
X-Received: by 2002:a17:90a:2046:: with SMTP id
 n64mr21596646pjc.230.1589192050120; 
 Mon, 11 May 2020 03:14:10 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:09 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:51 +0530
Message-Id: <20200511101300.11101-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 14/23] parsing_cocci: ast_cocci:
	Add Parameter attributes
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

Add parameter attributes to the SmPL AST. This is a list of attributes
in the VoidParam and Param types of the SmPL AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast_cocci.ml  | 4 ++--
 parsing_cocci/ast_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index 9b147e5c..919d1dcc 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -487,8 +487,8 @@ and initialiser = base_initialiser wrap
 (* Parameter *)
 
 and base_parameterTypeDef =
-    VoidParam     of fullType
-  | Param         of fullType * ident option
+    VoidParam     of fullType * attr list
+  | Param         of fullType * ident option * attr list
 
   | MetaParam     of meta_name mcode * constraints * keep_binding * inherited
   | MetaParamList of meta_name mcode * listlen * constraints * keep_binding *
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index c56bba88..4b6e7296 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -468,8 +468,8 @@ and initialiser = base_initialiser wrap
 (* Parameter *)
 
 and base_parameterTypeDef =
-    VoidParam     of fullType
-  | Param         of fullType * ident option
+    VoidParam     of fullType * attr list
+  | Param         of fullType * ident option * attr list
 
   | MetaParam     of meta_name mcode * constraints * keep_binding * inherited
   | MetaParamList of meta_name mcode * listlen * constraints * keep_binding *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
