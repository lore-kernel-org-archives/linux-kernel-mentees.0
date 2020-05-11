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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1BFC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9456D20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u5px5UJ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9456D20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 84AA386D13;
	Mon, 11 May 2020 10:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjKXNBx0k4yq; Mon, 11 May 2020 10:13:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7862486C24;
	Mon, 11 May 2020 10:13:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75407C0176;
	Mon, 11 May 2020 10:13:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D79AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 07851888FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWsvH+t0wDg0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A5B2C884FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:50 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s20so3745669plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y8ZHPI+OwU9oMruCD+HaFNKjHqJkEPQxmCEE5Iwn03A=;
 b=u5px5UJ9JGGgqLsbkXYVrsZ5ibuNm0yorjJsCY/t6iJhQ7YbowazUEYdv5BK/CzCA7
 fo5Rt6Sc6kD/Kbt5lqqeHHZYJI6LjWZAfFNE3+gEKkrIGoaDp5qRLda8GOC8bUMfHG00
 u0SzNUtBq56q368JJwhNkNfhDOnf+hfbqbFVaE0C0W3tzaN5PcXGFNx1YqbYhG3Sfmub
 R1GEYiwoVcfJULbgWZKslhjdk+RPaGEzYuaWVpcjtOrbvtCDrrFUlP0Gk1OIKx0PC5km
 /v5d7cLl8epudkHbK65UDvD1FNAvKExJb/D8Ltlh9Ikp7B+rEI/Eqd7YTq4XrFiTTZm3
 +tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y8ZHPI+OwU9oMruCD+HaFNKjHqJkEPQxmCEE5Iwn03A=;
 b=WKD8UNqO4hh683AS7I+zwrWSRDdKfueMVfjUFS+YsXw9JOcIH3a1QzpSpXDj9q7WOy
 +JEL9tcGkDuG8mgyOaeNYcrXihAcalPjaRG/mSU77bVIkqNC7y3K9HP7cYJf7R5nj0UF
 qbKOzRo5xsDDkzk1Q84Cwi3rU9K0kWsnpQQdj6hAUqASMSOznFTlF08LMnKYmQoalpCT
 OH6wjgEZzQB9qBigMyqBdyWGLujnfj02e4vtIg67xSUEhOoQa1qbHYAi8Ndf5FK/ijLx
 96B2u+kyfF7QMTEpLjoPpNhy3JRm68wLok1pmZes+DDVwPd/r5RnxrBFgxVWJppAO8Zf
 bqWw==
X-Gm-Message-State: AGi0PubC5ny/dIphusdbM9QVNAfvyR5eZSGJSHrkVaOra6Xa7pbifdOx
 fl0ts2M/yFzohnEAvmidzkQ=
X-Google-Smtp-Source: APiQypKCmD9EPSn4/rxm+m2lFBdHFLICCKOQRczLszpO5xNLGDQexrCSfcDsa0QAe4TsPtjGZPXzFQ==
X-Received: by 2002:a17:90a:ce01:: with SMTP id
 f1mr22080374pju.166.1589192030240; 
 Mon, 11 May 2020 03:13:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:46 +0530
Message-Id: <20200511101300.11101-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 09/23] parsing_cocci: index:
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
index.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/index.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index f7ae48b4..1baeb2bb 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -157,8 +157,8 @@ let initialiser i =
 
 let parameterTypeDef p =
   match Ast0.unwrap p with
-    Ast0.VoidParam(ty) -> [59]
-  | Ast0.Param(ty,id) -> [60]
+    Ast0.VoidParam(ty,attr) -> [59]
+  | Ast0.Param(ty,id,attr) -> [60]
   | Ast0.MetaParam(name,_,_) -> [61]
   | Ast0.MetaParamList(name,_,_,_) -> [62]
   | Ast0.PComma(cm) -> [63]
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
