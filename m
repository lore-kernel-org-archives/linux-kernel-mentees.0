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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CCDC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C36206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4k/4UcK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C36206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 69F3787199;
	Fri,  5 Jun 2020 13:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8ICXn142Fc1; Fri,  5 Jun 2020 13:44:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0765386B4F;
	Fri,  5 Jun 2020 13:44:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03F90C0888;
	Fri,  5 Jun 2020 13:44:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 519DCC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 35E32203BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0inVc3xiOri
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 905692038B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:30 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id m2so2750710pjv.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbCvcqCG573LD2ha1hkVo9FjEMY8WANrl+7FFPQE1Hc=;
 b=h4k/4UcKwjU1/vQfdH5SorxVI6dTS4PNQrDHkW4ZWAi9h9SUzfm2gwSMCfK7XHgG5b
 rhIUZK+vSak2XkOALxeSyVQb5EiGJ86a0npkIGV/FlK03ST8P5l462glqkfYQ/7FKcjA
 f5MO0JPI+5ULNY0FruCN0BLILf4pEWJSDz+BI83BDhMZAn/4sSogNXrGyWkYb4S7Kpq6
 sHkDSGnyNwoJ+wWmIqJ57KnC1fnvjRAca1A3f+pwXGL6zqskQEn2OtzkOjsNPVqBnOal
 yhcPAyrT5h+XjEc/yPmmIo3MI/q2Jw1RLjYO7e+OQecwKT+e75ihJVk1hnDtFVqlK0UP
 jMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbCvcqCG573LD2ha1hkVo9FjEMY8WANrl+7FFPQE1Hc=;
 b=E3lMnL476Z5TIqEkFYIDW9MzGFE8k/I+2Id+GNgdUdJ92+tkjGqsKrE5tKmJIDWRsh
 nzQH+fiO08Z1rht7HyVf4fVpdOUOOldpNY73quw1qaVPc9dcuq+ZESPVwGoxyB+ar869
 TMrO9Avxx903GJlJx62BiKYPkGxfIsQIwuUGFRj+thoLLg8DKbi0n9kJZIDl8S1WVn3t
 U1C7KdDAteuCC9PkqHp+jsro3tXQF1QbASlbgSJpuFeEBlE7zx8lHErCHnvtRhKJjIv1
 cYRkK6KPxanSFWeflcCXGg1WgMeq6s3636bZPxgUImVb4K/MRsYHSPsx+reZbtnT4S74
 SHOg==
X-Gm-Message-State: AOAM530UHpwVTM120isK+Obb0iNI49WqLjH8TvF5HRl5LVbVAxMTEbrc
 KSmxwT3RVapJbJxk0Nadcowq324tDnc=
X-Google-Smtp-Source: ABdhPJzJU63WsUMT8Q+sztBc/Lqnf9M0gDs2x8ayGSZ6GlG52odqSSeStH5s9ouVF7uH5r5VY6gcFg==
X-Received: by 2002:a17:90a:df0f:: with SMTP id
 gp15mr3254925pjb.128.1591364670073; 
 Fri, 05 Jun 2020 06:44:30 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:29 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:16 +0530
Message-Id: <20200605134322.15307-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 08/14] parsing_c: parser: Add
	init_declarator_attrs rule
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

As per GCC's C grammar, the init-declarator rule has the following
production:

	init-declarator:
	  declarator simple-asm-expr[opt] gnu-attributes[opt]
	  declarator simple-asm-expr[opt] gnu-attributes[opt] = initializer

Due to conflicts in Coccinelle's C grammar, adding productions with
attributes to init_declarator is not possible. Create
init_declarator_attrs and use this rule in init_declarator_list for
handling attributes after commas.

Following is an example of C code that is parsed successfully:

	struct mxser_mstatus ms, __user *msu = argp;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index d24ab7b8..9afbd68c 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1667,6 +1667,23 @@ init_declarator2:
  | declaratori TOParCplusplusInit argument_list TCPar
      { ($1, ConstrInit($3,[$2;$4])) }
 
+/*(*-----------------------------------------------------------------------*)*/
+/*(* declarators (right part of type and variable). *)*/
+/*(* This is a workaround for the following case: *)*/
+/*(* <type> <declarator>, <attribute> <declarator> ...*)*/
+/*(* The normal init_declarator rule does not handle this, and adding *)*/
+/*(* attributes to it causes conflicts, thus the need for this rule. *)*/
+/*(*-----------------------------------------------------------------------*)*/
+init_declarator_attrs2:
+ | declaratori                  { ($1, NoInit) }
+ | attributes declaratori       { ($2, NoInit) }
+ | declaratori teq initialize   { ($1, ValInit($2, $3)) }
+ | attributes declaratori teq initialize   { ($2, ValInit($3, $4)) }
+ /* C++ only */
+ | declaratori TOParCplusplusInit argument_list TCPar
+     { ($1, ConstrInit($3,[$2;$4])) }
+ | attributes declaratori TOParCplusplusInit argument_list TCPar
+     { ($2, ConstrInit($4,[$3;$5])) }
 
 /*(*----------------------------*)*/
 /*(* workarounds *)*/
@@ -1675,6 +1692,8 @@ teq: TEq  { et "teq" (); $1 }
 
 init_declarator: init_declarator2  { dt "init" (); $1 }
 
+init_declarator_attrs: init_declarator_attrs2 { dt "init_attrs" (); $1 }
+
 
 /*(*----------------------------*)*/
 /*(* gccext: *)*/
@@ -2372,9 +2391,9 @@ enumerator_list:
 
 init_declarator_list:
  | init_declarator                             { [$1,   []] }
- | init_declarator_list TComma cpp_directive_list init_declarator
+ | init_declarator_list TComma cpp_directive_list init_declarator_attrs
      { $1 @ [$4, [$2]] }
- | init_declarator_list TComma init_declarator { $1 @ [$3,     [$2]] }
+ | init_declarator_list TComma init_declarator_attrs { $1 @ [$3,     [$2]] }
 
 
 parameter_list:
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
