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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46938C55194
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8EE20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rx4q9ME1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8EE20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F31D386443;
	Fri, 24 Apr 2020 09:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVo2C+lalnfV; Fri, 24 Apr 2020 09:18:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D31C8640E;
	Fri, 24 Apr 2020 09:18:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98A9DC089E;
	Fri, 24 Apr 2020 09:18:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E552EC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D4B65887C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ip4NaHyzg6-L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 80817887BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:34 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n16so4353780pgb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tIUifw++gcNjsA6xw62XJoWy60jEOtatHZYKBU3ncSk=;
 b=Rx4q9ME1bsr1iajLU6VwQoUO01cqLUgUgC5A1/G8fIBP1IL9GJQz8snwjAGg3f0TwF
 e40/zBRJWIOQZaxn+kn/FhcjrC5/aCzu9d3HtAdvQmHkXug18+DwHm8VwFzfUidsuI2P
 bVbg8w4Ut++rebEFeWdSC+IuRuFzR125APKcs/+45zcvS/TizS7kpV9P64w0QoVs4GdL
 KF0sfm2soFvGq4lh7Aa57L/dreXNWKb00kdaryUHuBuJnm3YBD+OQAVybpbgdqSYPpan
 AUtvRTOZlgcQKAqr32EIJcgLAlYFFu3almnXKMCmDQm9+GDUh0IYUhX4oxAQYjpdeyGi
 EaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tIUifw++gcNjsA6xw62XJoWy60jEOtatHZYKBU3ncSk=;
 b=OXVzlZ4llJrImAysU4UJ8VafuRG4z4JC2xuvxgahuPcP5lJYTXlj81vy5rS6j0lbAf
 sZPUc+ZpW7w/O2PHtGtMpkuvePgLX4NFSxoB05cqOnZjPzkFaDlOWCgzqRfBY6yLlU+F
 TF8vWhmVbqMmVi7PNcVBrevPs6ujeeknzHra4Fd+n6cVw9K/OtF/77z4znFs4rV8ccAc
 szRQe+0cXOxBEeM+nOHTxpltIHoNIBjmdDvb7A39Nru1f8lSpbPHp7AJ2fvP6z0l6cDX
 NXw+UEqyxCHAJyKlgPKGG1gUuwIANjCQQKg9/dGYPnmt9kt9NGIo3/PrAQHYEbQ1Pj97
 x9Cg==
X-Gm-Message-State: AGi0PuZntXUg72AjeA7tU9qJTg31SqCUh+VUJQ1sHvljFHkqUnkoa5Qw
 nedfTj/niBWizUvfvp9yZ60=
X-Google-Smtp-Source: APiQypKebcgDSTTX5mPn8FxPUilz0qN1hlQ6HiwJ4LUeaFmv9EUK9R6ALNRXnb9eEASP/pOXx/tlWg==
X-Received: by 2002:a63:e749:: with SMTP id j9mr7981788pgk.319.1587719914063; 
 Fri, 24 Apr 2020 02:18:34 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:18:33 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:41 +0530
Message-Id: <20200424091801.13871-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 05/25] parsing_c: parser: Add
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
index d259f12a..a858db56 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1082,8 +1082,9 @@ stat_or_decl:
 
 
 expr_statement:
- | TPtVirg      { None,    [$1] }
- | expr TPtVirg { Some $1, [$2] }
+ | TPtVirg                     { None,    [$1] }
+ | end_attributes TPtVirg                     { None,    [$2] }
+ | expr TPtVirg                { Some $1, [$2] }
 
 selection:
  | Tif TOPar expr TCPar cpp_ifdef_statement              %prec SHIFTHERE
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
