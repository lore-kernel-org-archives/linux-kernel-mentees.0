Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93AFC5ACC2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBDD20663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3R+v6jv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABBDD20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7005E2C34F;
	Mon, 16 Mar 2020 10:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mP55-xrsCMCJ; Mon, 16 Mar 2020 10:04:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B1AF72C7C4;
	Mon, 16 Mar 2020 10:04:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A107BC1D7C;
	Mon, 16 Mar 2020 10:04:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1A39C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BDC1E89039
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3s7lCkEEQOb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5CD9B89033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:33 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u68so9652163pfb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kd2vYYIgWVNqEV4R66099cZMd/G/FFbUiirYb9tf7F0=;
 b=q3R+v6jvD1ALns0G2KPJHU1Tt0k8f0wqiPyqlel5B2vLkspsRJe8rWpRp7PZRiV5Yv
 eEO+dP9JDbcOIdBMmfhzEZiyqTNaChfcltU0GVYhfS6phUNIN0AcD8IQPAxvHnek14tH
 CIBqb7DgtvYDzH1ZdGYZ/JCBVVBv3uJ+n6diilLK4dEx5ejwc67+S3qiKKFE0mItbgAV
 gGvj7dEqiiUfSpQMwWgvZVtp0V0oDsXaFwg5udmkz4iTZPgg3kBc25kluN6e029K6bmc
 L609PaiDko1aXdEG5MW7kAZzn25cgj5wZ7QZZCV5lJFP00LDycF/fRVMlVrInJyvBN+N
 koKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kd2vYYIgWVNqEV4R66099cZMd/G/FFbUiirYb9tf7F0=;
 b=CpjP9Uwj5DtFuhq7m8VYYL0dNmcnXo7noV+rSFPxw3xweKkxjbRzgRJkYijZVjw8ML
 6M0AKMa2c99Wfh03hSYhEnNpAnEo1ZjP4OrA890P6kQJo3Jq/ZSfXyO/waPXzOqRXxSg
 QBpXE5azuXH+jXAAkbQXv6zuEeqcBVecCx3GTE7To2W3IsazAUSYPmlJVvPtdu8eJkop
 lzhs9BkY5tpM3P8DCbm/e7PvI0hyst77/al5W1NKqTOPQ1DsBJPjoAq7CLnuRu2Ao2Dw
 JUgBOBsutqalWdJCaT+MOAfeQDhsKZ2OyUllWcFeHNn4RCoPdNPgzCiQqth39pGI5BQc
 ONvQ==
X-Gm-Message-State: ANhLgQ2bGl7EhKvwTdmJutO3U4POlK8KuDu10zCiW61vN+wwpL6pIRdo
 mFqaxghlmeJWDV9tl7Q7ua4=
X-Google-Smtp-Source: ADFU+vv7ABMOLTUNYSDdsn0BUNFIUXTrxl0zspD/+HWgTgXJXWGPFUZSNknTBfDwjfXw1v1qfmX5Rg==
X-Received: by 2002:a63:c4e:: with SMTP id 14mr25926566pgm.444.1584353072898; 
 Mon, 16 Mar 2020 03:04:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:32 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:10 +0530
Message-Id: <20200316100319.27935-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 17/26] parsing_cocci: type_cocci: Add
	ParenType/FunctionType to types
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

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in type_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_cocci.mli | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/parsing_cocci/type_cocci.mli b/parsing_cocci/type_cocci.mli
index c1ccb58f..6f24adf7 100644
--- a/parsing_cocci/type_cocci.mli
+++ b/parsing_cocci/type_cocci.mli
@@ -16,6 +16,8 @@ type typeC =
   | SignedT         of sign * typeC option
   | Pointer         of typeC
   | FunctionPointer of typeC (* only return type *)
+  | ParenType       of typeC (* only return type *)
+  | FunctionType    of typeC (* only return type *)
   | Array           of typeC (* drop size info *)
   | Decimal         of name * name
   | EnumName        of name
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
