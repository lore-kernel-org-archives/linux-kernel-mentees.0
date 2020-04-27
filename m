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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F93AC55199
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5243720656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTHO8k7i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5243720656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 38245203F0;
	Mon, 27 Apr 2020 12:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3MVK+LFXu8e; Mon, 27 Apr 2020 12:09:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A14682011B;
	Mon, 27 Apr 2020 12:09:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 904BAC1D74;
	Mon, 27 Apr 2020 12:09:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72BA6C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6C02D85F37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zetldKVwHN-A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 18A7D84C29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:06 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g2so6935067plo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZ5votp7iJyEHJkIeJl40honWeZHULCEBP3YDk5oiHU=;
 b=GTHO8k7iHz56GYP1fwrcKp/QXst5IcAXmU+Z67BRa/0oWhKQRe7EgRU4BzWhgQOZve
 W2MvbdJ1VvWELqF7iATr1Phl3zjXzlsHS9wfY+FFRjdAt3Qb+04KPAQVvKMB4kFZGAmb
 f0T68ye0RcCX2rlroI04KgZob26ktFGBziXA3fjNajcByWrWebBwFli/uLVwIGRp2P0r
 AqFyYcFDyyBQmdV8ZSAal9jR3C4/kr5Bc06etmIJmhvUWRApw75LVwQLVHUShRWLhKEY
 G+jQYNTcZDe9rlUB/1wciK6FIU4Az2vAMLw1VHjR+p1AKgCH2iW/rtonrQmRrkRmZ5H0
 XzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZ5votp7iJyEHJkIeJl40honWeZHULCEBP3YDk5oiHU=;
 b=By1KIl8OjShWq0BZlM49qohjaj8Nr9olWAj2/LgGH7G8XwVwXQcS7+z31fWpWmQnhN
 LbgzEaU4Kzv60SaP4TPCCz1eRXUvurXcdVTLv4U/9XiJvX9TqmdzHvRTtNb70hmLXGza
 jl8Y8pil1d/Wp62Jih0NtA0wnf+e+uF1XV8izaLSUFX86kuYFMExKgjjQ4h0INcfG8Ss
 s3pfmRq4TVqdAqHzJJy/dnzxwZr7iytHD5r/HMHfjm01ZLPDllrFzjpmgMwrv88JyLcE
 kxGOf0f+dflazLgu2eI9KTNMM3zUGLSlgD/Ey4G3cWMBgsVzZ4ulcI1wJZDiChigJTb4
 8Y6g==
X-Gm-Message-State: AGi0PuYPlDGjxD82YPUzT7rZ4/Nu7qkg0yPkELFsnFHBBK/kOQ3NutL7
 sZ4VP6zArnhCLSxtSSzX3/8=
X-Google-Smtp-Source: APiQypISpS71+6HrTkWFfrZLGMg6hgh3o+1fUy9OVqpCGbdtRgfrwxWwNc4EcvIlDLQ7voqkO6+d0w==
X-Received: by 2002:a17:902:d697:: with SMTP id
 v23mr21008191ply.262.1587989345694; 
 Mon, 27 Apr 2020 05:09:05 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:05 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:16 +0530
Message-Id: <20200427120834.380-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/23] parsing_cocci: check_meta:
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
check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 5a348ba3..ab1d357e 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -374,7 +374,7 @@ and initialiser_list old_metas table minus =
 
 and parameterTypeDef old_metas table minus param =
   match Ast0.unwrap param with
-    Ast0.Param(ty,id) ->
+    Ast0.Param(ty,id,attr) ->
       get_opt (ident ID old_metas table minus) id;
       typeC old_metas table minus ty
   | Ast0.MetaParam(name,_,_) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
