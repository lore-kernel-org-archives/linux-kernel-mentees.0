Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D98CC83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:02:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 026D220730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6Eb3/Qf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 026D220730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B69822668;
	Tue, 28 Apr 2020 17:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeyoUoh8YcD7; Tue, 28 Apr 2020 17:02:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 45B332277A;
	Tue, 28 Apr 2020 17:02:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E421C0864;
	Tue, 28 Apr 2020 17:02:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3788EC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 239078625C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0K6q7ewS6Sci
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4D68E87118
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:54 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v63so10958173pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gk0RsyDFY7/OvnOFwMJVjTEx+UXZGsd/1QCxMt3Fwho=;
 b=N6Eb3/Qfl1Vxauz/0clxT6Pi4p0vYDQUZb7kAk8VQRAfDJIGaPxjqXTLYDKAZJNiCM
 vZJk6LZxpn8N9/4zFg00h9wmgonfxSOTfI8D2khzbitpmq8j6p6IeWXk5hsukyFWaOh3
 NION9Cj6crTRAzXQHbDD9C1nd1r+X8KDUMgQYUu6WCfPeiyqOrmvuNXVsaaONhJOo2BV
 FT1pQt0iosfqoYcITvl/5OSc2sw3ty4sTsMuqJ0iWmBAOIPGSCiIHtDjI6VVW1nWARYM
 GS3fYS2J0y6s7+MK+V8b/+bA04ASiAQTUn5cgE2DvbSev8UalF1kNJHonyjKBdnok49n
 yu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gk0RsyDFY7/OvnOFwMJVjTEx+UXZGsd/1QCxMt3Fwho=;
 b=M/qbv+UENci9HER9cxW8M8HtqfKqJZu9OCQQQI/lz658OEgmbBdrfPjwVXgHqi48yf
 95GEtaRFnmX9M5jS+RVN8oX38ZEjqIEdLSwv/yTjEticnLKnC0S0Zxewkxb0gIa73wRu
 PWHVDRnS6HVe8ExIOeq8c0uAVDbvFiF9oDVz5kbKYhtCd+bUgcjyxMjuaixz8Z+bi/ic
 4aZ6ksDE/Cdc5k1QsHsaahDlFXxbPpQEl9G+wk5F6o5G6R2bexZ3KYryn7k5tVrgTQmR
 t0Chadar4dkKkv8L4xFR99HTlcatNHcn1vX/nxGTSB7upaBv4YEx9Wnp03NVJxYgqhkd
 Pt0Q==
X-Gm-Message-State: AGi0PuaeRxJk5CqfAIL+3Mcf5RHKCJhQO33U7iGJ7Tgy6IMvr+U/tieE
 VVGbGPfnP9p06zL713QFJ7E=
X-Google-Smtp-Source: APiQypIXQ4QChPgM5tvvlilOL9N2vajrza0f9oRbszL8tdcXpGdGWmG51zivGw48G33TtjyH+4x72Q==
X-Received: by 2002:a65:4641:: with SMTP id k1mr30875462pgr.406.1588093373901; 
 Tue, 28 Apr 2020 10:02:53 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:02:53 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:31:59 +0530
Message-Id: <20200428170228.7002-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 03/32] parsing_cocci: parser: Parse
	cast attributes
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

Cast attributes are added to the SmPL ASTs. Parse these attributes in
the SmPL parser and place them in the SmPL AST. The added production
only supports attributes after the type and before the expression.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/parser_cocci_menhir.mly | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
index db5661bd..38b0e039 100644
--- a/parsing_cocci/parser_cocci_menhir.mly
+++ b/parsing_cocci/parser_cocci_menhir.mly
@@ -2176,11 +2176,12 @@ arith_expr_bis:
 
 cast_expr(r,pe):
     unary_expr(r,pe)                      { $1 }
-  | lp=TOPar t=ctype rp=TCPar e=cast_expr(r,pe)
-      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, t,
+  | lp=TOPar t=ctype ar=attr_list rp=TCPar e=cast_expr(r,pe)
+      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, t, ar,
                              P.clt2mcode ")" rp, e)) }
-  | lp=TOPar t=ctype d=direct_abstract_d rp=TCPar e=cast_expr(r,pe)
-      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, d t,
+  | lp=TOPar t=ctype d=direct_abstract_d ar=attr_list rp=TCPar
+    e=cast_expr(r,pe)
+      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, d t, ar,
 			     P.clt2mcode ")" rp, e)) }
 
 unary_expr(r,pe):
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
