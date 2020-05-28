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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4BFC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F99214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEV430Dl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5F99214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A9B692588A;
	Thu, 28 May 2020 12:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gW+gG9OH1iJn; Thu, 28 May 2020 12:25:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D44942078C;
	Thu, 28 May 2020 12:25:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0FB6C088D;
	Thu, 28 May 2020 12:25:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD187C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CCBDE25406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRaGem8NbAiy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 4378B2078C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:58 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n15so13496529pfd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGDUzhZcEhkVFp2C8yOH7JRCO3lSVAy9MoJAYsw+VoQ=;
 b=gEV430DlDKZNk2wykprugo7vVbOKxYnkGlgJBx4CBXVaXXGmsFS2UFnrD1kaOmSLgg
 xILUdGLvUP3wFsJy+H3AEC79XwWFkBBerUnTXJ1J/wvpoNJOcR6mkCGUD+yQ9fSayUdt
 fK9kNTvN651IuOSA3OOzrgZ1lQn5yB1KYR37/bQ9BL9N2X1Q3fKnJgYeqFAG8NoZ0WQ5
 f4yyMjeJwxHqe0SziquEfkcBot+qU7/uE9V3MoTE6vNzIOti9Ov/6XVzF6KtIz8prue2
 HOHYNmw4+J1yGQJqNbwYrq9BSz7fivSmggcNEQhR1Np55uB56ful6f7R9dgi1z8rVvEs
 S01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGDUzhZcEhkVFp2C8yOH7JRCO3lSVAy9MoJAYsw+VoQ=;
 b=cOhz7y8FRBzkw0kit9uCLXSZv6iJIOqoKJ59CwkH9bkogYZAQdQtnCJ/BXYokrBjsS
 E1jiJ1fzMaPr9TybTPdEBgeIWtq61hCwuwBK8kQsaQTgkhG43NbwSvhlTss+rzGQbRP6
 ly7cCM92ONsPq9hyMsbKRTF159xNYlO6Ymcw9pt9cOGbp4wmzX2MncqzlQAIamEdXkWt
 RQ21yMtb1jp/ExAd7QDvsQpWjLdoVU9QeX2KWPfd3MBpJvRNGvbzbkAh31ifZrp7siFU
 KBAsqCLh4YXmCiVGfiKi9GiXWYWEk9fahcCm/YAxoRumLdkiTL/EcdnoUk3OZzQk4/El
 qezw==
X-Gm-Message-State: AOAM532X9WS6t11FTVIz96PEH9zl42f5BRMmSQDQ4kSzj2sDTvpGncOU
 aHUWylhcsZXn3ACJeJ7AwZU=
X-Google-Smtp-Source: ABdhPJwaxcAMOolxi0nQ1pKLvuGjEDWQ17mag6Bj4YmEo9nSthqnbjKxsskE0k8BLBbKREX2PyLTxw==
X-Received: by 2002:aa7:93ac:: with SMTP id x12mr3040780pff.143.1590668697788; 
 Thu, 28 May 2020 05:24:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:24:57 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:07 +0530
Message-Id: <20200528122428.4212-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 05/25] parsing_c: parser: Add
	expression statement attributes
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

As per GCC's C grammar, the expression statement rule has the following
production:

	expression-statement:
  	  gnu-attributes ;

Add this production to the expr_statement rule of Coccinelle's C parser.
If attributes are recognized, this parses the following code
successfully:

	label: attribute;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index d259f12a..e4352a61 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1082,8 +1082,9 @@ stat_or_decl:
 
 
 expr_statement:
- | TPtVirg      { None,    [$1] }
- | expr TPtVirg { Some $1, [$2] }
+ | TPtVirg                     { None,    [$1] }
+ | end_attributes TPtVirg      { None,    [$2] }
+ | expr TPtVirg                { Some $1, [$2] }
 
 selection:
  | Tif TOPar expr TCPar cpp_ifdef_statement              %prec SHIFTHERE
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
