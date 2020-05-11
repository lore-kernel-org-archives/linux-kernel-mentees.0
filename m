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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AB4C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6082080C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/bv8DFA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD6082080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4CFF8887E;
	Mon, 11 May 2020 10:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8o47L3Mj2+fL; Mon, 11 May 2020 10:08:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1AD888869;
	Mon, 11 May 2020 10:08:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AADE8C0178;
	Mon, 11 May 2020 10:08:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CE8BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7AA5C87880
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lb9ZkKYEoXIE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 252CB87853
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:26 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f6so4352708pgm.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8KQVzS3ah3vs2qqwXtIf9FY1LkUh04IBlZi8QJebGs=;
 b=f/bv8DFAI7W+ehUyYUAJu2tHzH7mzfNDwhIClieF6e+fAv23fHWo1u1yyLifCGXpUX
 yN3wbVMbo1u/e6NkNYa+rolYjy+KqN1ozIYERXKBRI25kFJM228zGIfqk55Iue74gury
 l6lj2+BdtY37qe62OpoceBVtoOv5EM2fio0WNglVgsliePh7mNmt+5lTlDUJcxKQbVCT
 RPo2bFe1/6bF5ys3q+JBY1403qqabcXPgbxMhAIHzL99qVUGVeTFAlaEjt7SHQ8ibe1c
 QD87yj8pCkMNqAialQUzYsH7u/fUpAomAoaACFzD3ufelNdi7z2Q0rU+LLhVaMqdbXwp
 ZGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u8KQVzS3ah3vs2qqwXtIf9FY1LkUh04IBlZi8QJebGs=;
 b=Z7S9XKtlxAA0tFFct91E8Aj4aiAsh+Ur4fwjjxuMgp0fJVnX1I+8Eq552Ef2Wp+qxa
 sL37/2haq5+SuDRAwHgF4gkbai8D3nuq//e9i+ize8Q+2m9sk5CWpTAie2mr+RTuTbqG
 sp5TIWO67dvLqhsYx7a3kvK9DgoMrBBBPwIhIHv+N9WY0k/OydzjQ0TzsEZo9OjBgtf6
 APuDgy0b4Cm4neuYVYMCDoUKKo0GE74A++GBAHDrzRcSHfiu87hgbUc7yYPBLRfxHqby
 7KUU7Ki7esU78eYxZAGgeXi8H6uea1g2i0pGIca2fW69KV0KHm/5dBW7MQqkCELkjM/J
 qgyA==
X-Gm-Message-State: AGi0PubUVKmaYP/1ABSorQrnsxEFv1aZgcUFmYAqzwyBgQ8JlaSXZZXs
 2NgZcMTUJIaBo8TbYR/b46HH9wnKt+0=
X-Google-Smtp-Source: APiQypJ3gxIirL+0dqthlJIwHpjTYRgTzmKY/mYaqLgoCFnBwMuV642/jYFF+uB3+BF7am3qvWRChw==
X-Received: by 2002:a62:64cd:: with SMTP id
 y196mr14885547pfb.116.1589191705705; 
 Mon, 11 May 2020 03:08:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:25 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:56 +0530
Message-Id: <20200511100715.19819-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 13/32] parsing_cocci:
	single_statement: Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
single_statement.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/single_statement.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/single_statement.ml b/parsing_cocci/single_statement.ml
index 4ad1c4e4..73554e9c 100644
--- a/parsing_cocci/single_statement.ml
+++ b/parsing_cocci/single_statement.ml
@@ -138,7 +138,7 @@ let rec left_expression e =
   | Ast0.ArrayAccess(exp1,lb,exp2,rb) -> left_expression exp1
   | Ast0.RecordAccess(exp,pt,field) -> left_expression exp
   | Ast0.RecordPtAccess(exp,ar,field) -> left_expression exp
-  | Ast0.Cast(lp,ty,rp,exp) -> modif_before_mcode lp
+  | Ast0.Cast(lp,ty,attr,rp,exp) -> modif_before_mcode lp
   | Ast0.SizeOfExpr(szf,exp) -> modif_before_mcode szf
   | Ast0.SizeOfType(szf,lp,ty,rp) -> modif_before_mcode szf
   | Ast0.TypeExp(ty) -> left_typeC ty
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
