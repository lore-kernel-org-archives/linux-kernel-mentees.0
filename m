Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91999C55186
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653F620724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmnOshuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 653F620724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29F48887C0;
	Fri, 24 Apr 2020 09:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEWo7mJVi1NQ; Fri, 24 Apr 2020 09:19:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7214887BE;
	Fri, 24 Apr 2020 09:19:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B33CBC089E;
	Fri, 24 Apr 2020 09:19:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5F9CC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 92692880B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5A2MyBM1iZSs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 13A3686443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o15so4376265pgi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQehgLNKcnkP2r6snLh68vsSiNrWsr6X4sXUN+Ob+dg=;
 b=lmnOshuJAISWxrhI6uRfWGisXd5KiwS1rSynPF2Xmxqe1FMntwT8kgnUONKENSYd00
 3ZTelG44l8GAFIW6TB8u1TiwsBPMySflv3eM72gurM4zmdTmsOZkbXs6KswJ4C20LNgb
 muJ4H5lltM2DvWE08fnCuhaYUt5E41URgNTaHr6YYhlmkd/sam2rOrpxgYnp9aYn34IJ
 alnwAG7cBPz9T9l4fxk54Cn+sAHDn1N1ZP77AivW1ehEubayipUqu+JuHoKUKg2HFoG0
 ExYg96qOEUw0p1n6ybirZxzOg/o5A2OCFgP3/r3aqPaDCLPFKcCOPLKCvxLAs85plxPQ
 nN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQehgLNKcnkP2r6snLh68vsSiNrWsr6X4sXUN+Ob+dg=;
 b=PaQSKT4rsxHtAiqwcFBrr9TR0Vxysddw29JjvxUTrcQhXefW0nYsS8Fk9nfGUFDSIw
 VcmPNvG7D/hv9aVIupGcZPibius8SoK5SNUtQVd1ueLxNUHMD3HWyZKkumcbhHdJaYJv
 xFHz3bBSB9oGG7lhiBYja8SWWwWzZPwMn6fsRZJXp7MaMhAq+4G2X8qaNHRcHv/q/yeO
 r5I0vDMJDAciPSqFBWjvjGzwVnt94YGXV2etDJheMZIZKrcVnbpdJHNfTt6Hx8cKCact
 elslMMQaSjKo1edVnV95IKl8NoFBDx2GZbXme8zu7CRVVGp/TKSLMRDud+Tiepx7OCUr
 fKQg==
X-Gm-Message-State: AGi0PuZQ+B2pipcbyB9WgtZq0iRr8ny7P1uGQbB/JxUIJnM0BxEdU6B9
 fOu7Nv7MPQJnUI3dXKYNxLM=
X-Google-Smtp-Source: APiQypI5hOl7Sz9P6ONJTaxtxFR193NME9k1L/obfvJi0VWNMBGVLcJg3rfISlvrUHWlSSZPbdVf3Q==
X-Received: by 2002:a63:b23:: with SMTP id 35mr7976708pgl.170.1587719953502;
 Fri, 24 Apr 2020 02:19:13 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:13 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:48 +0530
Message-Id: <20200424091801.13871-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 12/25] parsing_c: cpp_token_c:
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
