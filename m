Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE8EC4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF37A20774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqxfyCjD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF37A20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA71087477;
	Fri, 20 Mar 2020 07:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vfpj9XQARLK; Fri, 20 Mar 2020 07:03:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C93987347;
	Fri, 20 Mar 2020 07:03:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6946DC089E;
	Fri, 20 Mar 2020 07:03:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A37CEC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 925CA273EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyFUu6dSoIiV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F71A22854
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:18 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m15so2061257pje.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kd2vYYIgWVNqEV4R66099cZMd/G/FFbUiirYb9tf7F0=;
 b=iqxfyCjDDU9GHupsllSiqFBQ6u04aTjgugzg9TMeOZ/kjmhYzqn2rbrVeFFdEPN3Ng
 pn3Z4NCN1HIk25XJ4iGYUaHy8JWxB6zRy3YD30np3dUyPRRDVD7WT80Rh4IVAY+xoDzR
 nlIC/sP/wEpIvZ8lkWf8wAcO58E3YbSFdCTbEvMMH0Ty1+t/d67hpqVH8ZJkMD+EI+Y9
 e2Gh2iCyJ1sjEbqAgX8oKbBiFfETcBkE+4sSU8HlsGPoQTIFtIiHEwsONjgucEbEoOn6
 O32nqd7pZey8HyN6YaiDpkQJtpaRdWrIQRuM6WYjtSgboHvLQ1ycEy6lGgSdWZFOHzt4
 LSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kd2vYYIgWVNqEV4R66099cZMd/G/FFbUiirYb9tf7F0=;
 b=VNmOJFQ2utoAggqFQzgGE3FT6ARbpm0X9u9QtAi6Rdiym+2kUdq449s6QezHofpZbn
 1DaAWXiezIsmDo6gZsIQQm1nHQ/rbVCe0tP0axA/Gr35GjqeJpVlVycIfIfHHzAFtEpn
 zi5URyBoD+mKGELBLU2ia6lZdEo3iP5kyqT1B0lA1dM/y3PshxzZtdXuhvniZzdg2pNv
 dBourogbzNYldPAv3WyMAWqADZcZxBUHdG8DHmCBbUgORTHZNmS02m+IltlN7UZmWEMr
 iy4KIisFQRABsmltYITDRR2v4aTm5H1hsH/j9a4sJfhf1fRQhVtLnGTTlm4rvP5sLF0H
 DFOQ==
X-Gm-Message-State: ANhLgQ20OREbJeKTSXiURc7PuSKID6NmCZ0Sp2z/8ZHD4YreBTi2a1Ls
 QOLYAvkfMbYfNK3MCbQtrTQ=
X-Google-Smtp-Source: ADFU+vt+L7fanGnxUNul/gCQdVFTNDVT7RDVsEJ3B0nBYC81lDkYYZOZlgQ+z/tEonCg4651qXcQ2A==
X-Received: by 2002:a17:90b:124a:: with SMTP id
 gx10mr7880740pjb.117.1584687797519; 
 Fri, 20 Mar 2020 00:03:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:17 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:48 +0530
Message-Id: <20200320070157.4206-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 17/26] parsing_cocci: type_cocci:
	Add ParenType/FunctionType to types
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
