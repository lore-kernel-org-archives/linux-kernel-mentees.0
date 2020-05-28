Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49D9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C15120888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQwicxwm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C15120888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5CEF8259AB;
	Thu, 28 May 2020 12:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVCReZ4Tloc8; Thu, 28 May 2020 12:25:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CFDB325931;
	Thu, 28 May 2020 12:25:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDD88C088D;
	Thu, 28 May 2020 12:25:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A77BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1627225931
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RP2K+BAaQiMm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id A8F1625406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:22 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ci23so3042531pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQehgLNKcnkP2r6snLh68vsSiNrWsr6X4sXUN+Ob+dg=;
 b=iQwicxwmzju/u++1nRNKENBNJGU84tdt7O5Zp4K/spTj2C0kijW5vwM92mO2V6zDDL
 yZqnjHUefKGcpo2u1wLkt3biIDibMsewmGXxe5Ht7ddS7Vsgi5k4bIkEWNIxQiuPaUEO
 4yBPjNBrDsFGAbVPvz9roEpsVikEwHmRFgYeqnbTP1VWeiXHFwfXpXBkw2ZWRmtwgE2R
 yfROh18JGWV9IeqwVj1ir8bfRUIkhQvvn0mD8Bwp89F6vW8lysTd53tqQhtK87oAhvpP
 9DSybq5j2ccdtOEz5q8lFHzR3Sow/wJZKQR8YXomyz/0Ticsyhx6dVcbsdMUZuQZH199
 BbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQehgLNKcnkP2r6snLh68vsSiNrWsr6X4sXUN+Ob+dg=;
 b=C4U/02ebuEe+u+NZZ5AwOwmzBGnY9kt1SZNVwR5DpzA41MLArQfnoWw78TiyI9bwVD
 9SYQfSvwGFWyJ8T0ptrWJT9IaUZ9P1ktfmVwzQ0T41tj1fH6I5npkMvWRHkj0iWZRjKA
 GiHOnd81GJSWQ0Vk3DMgO2h0UQAm7vUKn9oF43kr9MILMjpLv+AHZhDheyuBGi3qT7HN
 NZcHiRxgFOyyLAS7rXoMxvac+rllsUzVOTjEgNX24/FRHtDggwMFptgRZYrgJTxERRlm
 3H6s+t0S5rwfFG9h3y1UkyIkLQaCyNGQy8e+qtLULqa8f+DOUoZZwDajdmqMluJZQvWE
 mcsQ==
X-Gm-Message-State: AOAM530epd3vlXghNLQmI912kdxeHYBRqF7WnD8Wo6CqLqBXKboZXU+r
 r6aYMLrvEpUjfLSyPmeLR3NuaPzI
X-Google-Smtp-Source: ABdhPJye24VI1ZPwk7HfjtIIsVlwMydNhPBBKsbfMKQ4JtBWXxvOL6K58Cg8RJF7DWYsNuv+Ak7jfQ==
X-Received: by 2002:a17:90a:5d06:: with SMTP id
 s6mr3718682pji.88.1590668722196; 
 Thu, 28 May 2020 05:25:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:21 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:14 +0530
Message-Id: <20200528122428.4212-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 12/25] parsing_c: cpp_token_c:
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
