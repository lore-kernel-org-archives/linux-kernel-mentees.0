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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C5EC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B30F20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fprue9XP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B30F20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1971724B6E;
	Mon, 11 May 2020 10:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vx+o8I31YMZT; Mon, 11 May 2020 10:13:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7274920358;
	Mon, 11 May 2020 10:13:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BDF1C0176;
	Mon, 11 May 2020 10:13:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C64A2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B224685E40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40fGSO7UK_Mz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5DB8E85D3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:19 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z1so4540603pfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpLTgt82Ti31oCPVD1pdgcNX51JVNVAJJuqnmPIy5S0=;
 b=Fprue9XP2QnYFuMFJj8BXSBOpeZAXQlYWa6NLP0bkkD5T1du46XQ1CD4QyN/guXkwj
 pLRHCxEqlHlHmJMefUnEvqZJ7d7Qtov7uaqW7lfQPCaXNXD/gAp471ex7NJTUGpG78i7
 8EXhTBWu4B067LB9t/IT+nnedqg+DndFK67KYtk6fAsBhWgl1i23ZhyI8Gp6R+pZSePM
 6lK0T55t1rFKNkwtNcIk9hUFJnp/JqAW2rvI3cSQ21cJIhRKOfku2Ro9X867mVRetlFl
 0YYaSYyTnxgUItE2kovfUHUNh0eBJOOOajXstBNLrfU7LMGNARj5JQMr6oBYaN58jklW
 KVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpLTgt82Ti31oCPVD1pdgcNX51JVNVAJJuqnmPIy5S0=;
 b=fhcYfy75KcKxRtFdViKDmYo0B4DwLY3v6bvnmyZuQ1kB5nCECb0YxmFD+9Xn74AdEj
 6JZk/Bf73qonn0tIIHI06hzCwKNKkiusHeUFkWxUeHCN/6Bh6SMRbuA+LyuADYcpkpQ0
 y7YuHrK8mTgPUGXk4rh/IyrvBDswF9xPdi1cXJCT01Z4WgUSFknIOSa9GjPAIKfmeZmI
 MGSB1NfgETljcJc6DFI8AIG/7+LXoJhdMucBCttMJ9WbscnAMqD4b1vgiNpVKKyULh1C
 LQigfNpQfJ8bnVCbGvsLrdFLBC2delCLZ4DpqF/7XG0tTtzYSVRNO+V+JtReDBIGWtnK
 McsQ==
X-Gm-Message-State: AGi0PubibsURRfYzR1nnZ64IirZ+xB3bKmXUx407h4UMFNMTsiYR6Xar
 qd4Mkxy/xCK18Cpk/S9X3Io=
X-Google-Smtp-Source: APiQypJdoB2y17RAIqS9YA61EKWWv60wkx64JOT6VCfsf9yPUbTwWFYw/W4H7sjfXkMcQvMhvwInjg==
X-Received: by 2002:aa7:979d:: with SMTP id o29mr15789608pfp.90.1589191998963; 
 Mon, 11 May 2020 03:13:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:38 +0530
Message-Id: <20200511101300.11101-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 01/23] parsing_cocci: ast0_cocci:
	Add parameter attributes
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

Add parameter attributes to AST0 of SmPL. This is a list of attributes
in the VoidParam and Param types of AST0.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0_cocci.ml  | 4 ++--
 parsing_cocci/ast0_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index a06d99ae..8d30daea 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -334,8 +334,8 @@ and initialiser_list = initialiser dots
 (* Parameter *)
 
 and base_parameterTypeDef =
-    VoidParam     of typeC
-  | Param         of typeC * ident option
+    VoidParam     of typeC * attr list
+  | Param         of typeC * ident option * attr list
   | MetaParam     of Ast.meta_name mcode * constraints * pure
   | MetaParamList of Ast.meta_name mcode * listlen * constraints * pure
   | AsParam       of parameterTypeDef * expression (* expr, always metavar *)
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index 5c2520be..f66a1fac 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -320,8 +320,8 @@ and initialiser_list = initialiser dots
 (* Parameter *)
 
 and base_parameterTypeDef =
-    VoidParam     of typeC
-  | Param         of typeC * ident option
+    VoidParam     of typeC * attr list
+  | Param         of typeC * ident option * attr list
   | MetaParam     of Ast_cocci.meta_name mcode * constraints * pure
   | MetaParamList of Ast_cocci.meta_name mcode * listlen * constraints * pure
   | AsParam       of parameterTypeDef * expression (* expr, always metavar *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
