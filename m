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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B210C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:07:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC3C20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tu10wngL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC3C20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E4AF024912;
	Mon, 11 May 2020 10:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qwz61836a67I; Mon, 11 May 2020 10:07:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7A2142050E;
	Mon, 11 May 2020 10:07:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 687D4C0178;
	Mon, 11 May 2020 10:07:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13411C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0228E85C05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTwPjtLFuIwj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 95CC485B2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:46 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u5so1740213pgn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2zDlikEkJciTy/5/f2JkjOKet6MVMbX5CQMorUUeXY=;
 b=tu10wngLXAsMdOEbzdsJwnxl8+9uVPbBhZVSUdIgnFW46xPhcoZS1y68fuqjGvrcMU
 4jc35r0hIs3tFOwUDBLCoaXIwJDP7e0EpkWsYA+iX/6e9g1RAqS1ZVWCy1mw6CSKF5om
 hGezk2Zg1umz1qCbDm7/FEbZnIMXBk13MUzYgDdpTUJYyKCwdA+HMA1ju1uRhr4yEG7T
 FTIQctHjgxK3bSQXxEGgfOWThMtw/7m17UOMJ80lImjRKpEncx9Z+7JnLT77SKVrwNvf
 BPltzcXBxm5rLmUJpON9cdw/c3hQoXB1ynY+D6SPO0OXYqtCBPUq3PAj0dOv9jW8XYL4
 fznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2zDlikEkJciTy/5/f2JkjOKet6MVMbX5CQMorUUeXY=;
 b=Mk7rvE9rLwwmh3w/1ph+/vXwbMSBTwqTiX0uOHzUpHzagJWk00IWZf9/X21B9sGUma
 7YQik0Zfgaqr1KYWqsas+vf+OaEYsCs5KuGg4PaQ9BGjFDIIbhYA4lC9R8vot5TE09hh
 OntjPuGGfDNHjh/n74g7sZh5YhL9AHxHK/cZZLLK/DVkAjJug8bJ6ITNsa5g48ycNGTK
 QAvnOsh9qI2kNrPiH2oOEe+Rh1g0HmEzGWC4S67sqWW4W969Ja43TJvqAgpwQGEPBjg2
 1nIPC6af0GnvA/d/0Mm2aNvyA5v9IUAkrxYL76heU4jzSsKJ4uJoA91jsGwC75KHBSBk
 BkwA==
X-Gm-Message-State: AGi0Pua7sj7c82IC9cG4K4OkEuxLM2yynPIiEXggQoZ4IILnYBU2cFjU
 ggHRCz7R1rsaRSWd4U1if2i7+wt+0yQ=
X-Google-Smtp-Source: APiQypJOWhvwiCeIRkqTjnXneBVlD1YVc0gMjNIHKkrrr3kIC9b4nJTDA4MNOoEyhHtoZPc+CTW4eA==
X-Received: by 2002:a62:1994:: with SMTP id 142mr14713519pfz.259.1589191666152; 
 Mon, 11 May 2020 03:07:46 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:07:45 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:46 +0530
Message-Id: <20200511100715.19819-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 03/32] parsing_cocci: parser:
	Parse cast attributes
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
However, these attributes are matched anywhere in within a cast.

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
