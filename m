Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0875FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB49206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFv2ofrk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB49206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF34988419;
	Fri, 29 May 2020 12:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1HWIysZzoPv; Fri, 29 May 2020 12:09:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A36B88453;
	Fri, 29 May 2020 12:09:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49314C0890;
	Fri, 29 May 2020 12:09:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D791BC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C1B4222098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-VubaF0pOMr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 54D9120410
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:50 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 124so1407764pgi.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D0QvzcJdnxs5FOqQZUwMdH+ePAV0OSOpsV/1LQynJ30=;
 b=IFv2ofrkY3SWtycUW2Vh6g647GGfsQpkBvzx+74FSo+R0G1phlzkCemdXEFcpBuuob
 HcMqIZWahT77+K1fggKG3VoF7w2EqkIBTFpWdsc4jvv7NM8cNU0KpwHJq4+o17HD9+81
 XGCjPUZ0qvYaBG1EUR4x//D6oly4ImiM5hXObE48XkpGu71eM92gmsXGQcHgO+EQ0Hfl
 C946/fIXMKOMfhLfXV9O81IKqFBrUHL+J9KVLUVtnU/Mnk1vyDkQohmwF1axytZkOuk+
 9MuP5KS9sxK2fGgSIPIL/tsfz7jR8ZJhN/aooQxapaEVveI3UdaWKI3lmWywGsW1pR2g
 cLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D0QvzcJdnxs5FOqQZUwMdH+ePAV0OSOpsV/1LQynJ30=;
 b=oKBMdXqhrzX0SgnFAZdRNnN405dqc6g7UHqVpolrUpnX3QEZl4wm5tgcFcDo5yMjxO
 aEjYNPILeSpUnRzU3Ht7Da08hThQF51nfUPcA3HsY/690Hvi2EWEDkQAs+uWEHCY5WIi
 v+Im8Q37bVREgKxmq1zaLaHfup44yBVCpnhwCWpCDeCis78W7qHJJD2OIP96/r7VITpn
 D4wyP21n31xs7X5MXs1jP0Vk+c4GWABdA6lVHeUT1fQdIIRTPzBEcCWOWuHlNevgawSn
 e2dA6ZEEgG90f5mKOcIsnpmJUr6yy6TiJtULXGdkISMLReg4i5f+tOW/wjfF1ztDvXkz
 Dfpw==
X-Gm-Message-State: AOAM531GVeigzFKtL4c6ipm508MLXKh8CPCbq/t6m7Yrg8UUwRmRKN8g
 3VoApwYaTgmFcSl6j0XMOjU=
X-Google-Smtp-Source: ABdhPJwwsHZQgPruXLWIDHJSm/Q0Altn6a2+SVa/aEoVAi2Bew2h6dbItPjCflyMqEC7KlS+7fGJbw==
X-Received: by 2002:a62:640b:: with SMTP id y11mr8764353pfb.318.1590754189861; 
 Fri, 29 May 2020 05:09:49 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:52 +0530
Message-Id: <20200529120703.31145-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 22/32] parsing_c: pretty_print_c:
	Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Print these attributes in
pretty_print_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/pretty_print_c.ml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
index b9b9b929..1a4a8f17 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -146,8 +146,9 @@ let mk_pretty_printers
 	pp_expression e
     | SizeOfType  (t),     [i1;i2;i3] ->
         pr_elem i1; pr_elem i2; pp_type t; pr_elem i3
-    | Cast    (t, e),      [i1;i2] ->
-        pr_elem i1; pp_type t; pr_elem i2; pp_expression e
+    | Cast    (t, a, e),   [i1;i2] ->
+        pr_elem i1; pp_type t; a +> pp_attributes pr_elem pr_space;
+        pr_elem i2; pp_expression e;
 
     | StatementExpr (statxs, [ii1;ii2]),  [i1;i2] ->
         pr_elem i1;
@@ -184,7 +185,7 @@ let mk_pretty_printers
     | CondExpr (_,_,_) | Sequence (_,_) | Assignment (_,_,_)
     | Postfix (_,_) | Infix (_,_) | Unary (_,_) | Binary (_,_,_)
     | ArrayAccess (_,_) | RecordAccess (_,_) | RecordPtAccess (_,_)
-    | SizeOfExpr (_) | SizeOfType (_) | Cast (_,_)
+    | SizeOfExpr (_) | SizeOfType (_) | Cast (_,_,_)
     | StatementExpr (_) | Constructor _
     | ParenExpr (_) | New (_) | Delete (_,_)
     | Defined (_)),_ -> raise (Impossible 95)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
