Return-Path: <SRS0=7LP4=7S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315F5C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00899206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXhGXDHe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00899206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DA2AA8863D;
	Fri,  5 Jun 2020 13:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uym8c6dk6wO1; Fri,  5 Jun 2020 13:44:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6EECF884DC;
	Fri,  5 Jun 2020 13:44:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E913C0888;
	Fri,  5 Jun 2020 13:44:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 715F3C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 59545203D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naeHcgCLCHwV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 3EC612038B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:53 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y18so3656838plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQehgLNKcnkP2r6snLh68vsSiNrWsr6X4sXUN+Ob+dg=;
 b=mXhGXDHeJNRfbU05PeRDwLvr4ZgtL+kg1r3hphuMeQ1HcPcSjljueaeBCuRcvO7atY
 O20JZ7YW+rtTjmFh6S88de6CwiZtAGFxricc1uRLjODNb94ZbwstCzNx+wmcbZ9grcGw
 J7e7mY8My6suPXOphgDlYnC6BFuN+OaBSg6IH3epcSrwovZwqkw2+7gmBvD84HFLuSS4
 5uY9ZN+CHtYqR6vfejEE/O6N1D6wapRLuxVlJB8dQiMX5Urt32+5X9djiEe/wJpXSsHa
 2T43NVlsqa3eJ2lmZ0TyOcp//n6S71cNHDzEEb329QHmaJ/TX76bT7mnXEfObxPatbW6
 spuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQehgLNKcnkP2r6snLh68vsSiNrWsr6X4sXUN+Ob+dg=;
 b=ccKnRyPN2IYnQzSA+5HXy/Cz4VDEHmc4mETfVFbd7QzQj/Y2jA3KaTPgdLFHTmJ7dE
 hwrciFldoCu3WrA0SN9K9VJM0HD/0V+U9HQVXFesOTNx+HN0Nt/wszhv0RzWl4Wbds1H
 ahkcbH5SfHsDVHOVayWJlZ4+OkYWg4c1d8BXR2A68Fy56+4KUDzU1zkWG/uFkCu88aNg
 ZWof8hbbL1PnfjddYMhp7PT2ib2NgUg06HNTFB0WR1cEBwsg4BAIOQ8wu+b+a9RDyItm
 bcazvSspjtG3PPeeJVz/OmqtpGkMp3QnW7HMmOaf5pvuA2w4SdYLrhrf5zEJhIrd6mmn
 UlYw==
X-Gm-Message-State: AOAM530TPJ52/RtT6ozK1t/fT2DxfBBTeqA0jJwGtPF5Dn2vjleUdFVh
 auupo/EGgbfU9vJI+7IZoho=
X-Google-Smtp-Source: ABdhPJy6aqXfFFBWvT/6q+/mXSHcZruGxXh9GAjT/LBtgeJZ9RJy4d2bj8pm4yt1ZztBOh48+e2GQg==
X-Received: by 2002:a17:902:714e:: with SMTP id
 u14mr9904805plm.175.1591364692699; 
 Fri, 05 Jun 2020 06:44:52 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:52 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:21 +0530
Message-Id: <20200605134322.15307-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 13/14] parsing_c: cpp_token_c:
	Introduce MACROANNOTATION hint
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

A better way of denoting attributes is to pass attribute information
from SmPL to the C parser. However, a temporary solution is to introduce
a MACROANNOTATION hint to cpp_token_c.ml so that the parser can identify
attributes easily.

This hint can be used as follows in standard.h, the user provided
macro-defs file or the given C file itself:

	#define __attribute_name MACROANNOTATION

By default, __attribute_name would be identified as a comment. Using the
above hint, __attribute_name would be identified as an attribute and
transformations from SmPL would be performed as if __attribute_name is
an attribute, not a comment.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/cpp_token_c.ml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/parsing_c/cpp_token_c.ml b/parsing_c/cpp_token_c.ml
index 425234e8..0654be26 100644
--- a/parsing_c/cpp_token_c.ml
+++ b/parsing_c/cpp_token_c.ml
@@ -81,6 +81,8 @@ let assoc_hint_string = [
   "YACFE_END_ATTRIBUTE" , HintEndAttribute;
   "YACFE_IDENT_BUILDER" , HintMacroIdentBuilder;
 
+  "MACROANNOTATION"   , HintAttribute;
+
   "MACROSTATEMENT"   , HintMacroStatement; (* backward compatibility *)
 ]
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
