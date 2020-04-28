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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF38C83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:05:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF7E20730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW64WVeZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF7E20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E9F986542;
	Tue, 28 Apr 2020 17:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_7XOx2ROs2p; Tue, 28 Apr 2020 17:05:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 272B3864EF;
	Tue, 28 Apr 2020 17:05:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DAF7C0864;
	Tue, 28 Apr 2020 17:05:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86D70C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72DF920464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRA7PPLsUAiC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0FB6022668
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:52 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l20so2711269pgb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2PLzjijGSWHhGZmQAc+EDg38Sv7Vw78F5dVtWsvodwU=;
 b=EW64WVeZJMt2mA46M430+xTsfD+roFU3rzgWDqRAX4L5pSsUfLh6jsU88pbLe2Ngax
 JGsBOu5m1cjoPmPU722SQhGRw3pzMHI9Nf9QMAPSOsF3PvTSnthAPiqcg4UWVLj8Fu3a
 LKe+F1FudjmmNlOGVUSOtBYKFybddXjPZ4YjgIHnSHyqrU2hXUWuMWAoNeSA8v21NEBN
 yedCnR225mNPAj43olNFzt6pSmVVYNYNgTOoXK+NafGlgHokk1k8wEbUzLzDOVwYMfPu
 F4Zy0lUvg0x5rvUGIuSUYGaLuS0DwRrJQr73UgxQfbULZQvCVEGjnC6X1+ZYbmay/fkN
 Ae5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2PLzjijGSWHhGZmQAc+EDg38Sv7Vw78F5dVtWsvodwU=;
 b=AwpcmJD4iAsm/p1viTqFm1qpUWTdG2vAjKEfnBKe6zT+H8JULYKVAut5dxAJu2tNWF
 49AFN4vlR1wMioIjfv/XvHFBhmhalQ++l8QSdFGdrQTcHb7QNMqNRCzcbjN4JrRNSVKi
 3qEFfURbnE0KyAQoGFqf4PcI2tCqn40dS/+obKcxGi7U00JcLas0qBK+VYdhyRnI2TV8
 iaz0z9j9NbCfiZImwYmcY/TpgLCT8Ta4bnXRiSssBkyGWSMkwd751QRj+vtkEkDyfRsQ
 Fiyb6Vb/FAjycHx6+C/4RydW+f9L/wjkixONHxfuvnOuqFPV5YlFDGM8S7oGQUItpA8e
 C+Ig==
X-Gm-Message-State: AGi0PuZVZIBYCU9qB/XMScUsYQvZxHR2BwpHT7Arks44nmf+ze3/JGXt
 e+If2xFHViqSEjo/MbBRl/A=
X-Google-Smtp-Source: APiQypIlMaoWRKHrCDXU4FhiTmXQZaSzw53O0LhSGyvSkKdMTJ5Ydlq2mvxsiUbfPR7DiPYLgzG2SQ==
X-Received: by 2002:a63:4846:: with SMTP id x6mr1656768pgk.209.1588093551545; 
 Tue, 28 Apr 2020 10:05:51 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:05:51 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:24 +0530
Message-Id: <20200428170228.7002-29-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 28/32] ocaml: coccilib: Reflect Cast
	attributes
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

Cast attributes are added to the C and SmPL ASTs. Reflect these changes
in coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index a305d616..0c379547 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -146,7 +146,7 @@ module Ast_c :
       | RecordPtAccess of expression * name
       | SizeOfExpr of expression
       | SizeOfType of fullType
-      | Cast of fullType * expression
+      | Cast of fullType * expression * attribute list
       | StatementExpr of compound wrap
       | Constructor of fullType * initialiser
       | ParenExpr of expression
@@ -2569,7 +2569,7 @@ module Ast_cocci :
       | ArrayAccess of expression * string mcode * expression * string mcode
       | RecordAccess of expression * string mcode * ident
       | RecordPtAccess of expression * string mcode * ident
-      | Cast of string mcode * fullType * string mcode * expression
+      | Cast of string mcode * fullType * attr list * string mcode * expression
       | SizeOfExpr of string mcode * expression
       | SizeOfType of string mcode * string mcode * fullType * string mcode
       | TypeExp of fullType
@@ -3305,7 +3305,7 @@ module Ast0_cocci :
       | ArrayAccess of expression * string mcode * expression * string mcode
       | RecordAccess of expression * string mcode * ident
       | RecordPtAccess of expression * string mcode * ident
-      | Cast of string mcode * typeC * string mcode * expression
+      | Cast of string mcode * typeC * attr list * string mcode * expression
       | SizeOfExpr of string mcode * expression
       | SizeOfType of string mcode * string mcode * typeC * string mcode
       | TypeExp of typeC
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
