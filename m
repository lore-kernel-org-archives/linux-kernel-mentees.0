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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C81C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA5F20728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FryyyBAP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA5F20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E29786F3C;
	Fri, 24 Apr 2020 09:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flOu1ZnRsXo2; Fri, 24 Apr 2020 09:18:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC87586F3B;
	Fri, 24 Apr 2020 09:18:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E942BC089E;
	Fri, 24 Apr 2020 09:18:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19874C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 08044887C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6c47GSbzCeP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E975C887BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:50 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q18so4348285pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=438wvAmjSRefVIvaDhaeYHRQmYcSFJQekHePTY/5Erk=;
 b=FryyyBAPp0Jac4z4a5YKT3KwRUgDtBH8LWZPBOOR+raL4ju2BahMgKwfLoRckO05PM
 Ege0KnyiqadGxmJzeRGGhivg5R2uvMqmD9lXZQSCSScCYwFeYQj8Dqnb+wXL2cbfLb4a
 rmJ1U7o4VJDghjVJHecqeoBfKgxEuyCbOmPSeu+BJVkjwA+OyeivlCgzeCT6tu4SnL91
 tzCFaRsc/EIBK3s32wHqC/iABUYe/3VpXLV4XsB/NHdqvmPoDbRD8rauOpPm//QpIKVx
 +MLsvOdYzmtoGPyfRmnryO6f4IXjbbHIM+Duai2DS/w9iHlwfvgk2crbVzbat3V6qs09
 psyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=438wvAmjSRefVIvaDhaeYHRQmYcSFJQekHePTY/5Erk=;
 b=QoIgeaSCqfgj8F69za46TbAH6nY2qadivmdodek0jJkslBI2S3F17VT7+FjB+TqgQz
 KeKE7b0n8EJ7UC4/+kw1OD+8ZR1wbutuF5FeSFVk2ltZjTsZxQsDKou/jUFaSxkuHqWW
 H6cS/Hlwp7caPzIozo3LA+rRW+X8J4vx2i2mDak1OLSwdNjzX+0yR4QNnCsiikqv9u93
 4N5VKfnq2mHZb61/92/YHdJ+nlYZN1AV/wyWiVm0F+bdULApMWJL/FOYCp2AIDVUXeRI
 g8HowpgiYrAdla9MuIf34BSUN69rriCzUpIqIjOS95rrQaExz9wE50ipqoHdCKf6A3ig
 GkGw==
X-Gm-Message-State: AGi0Pub2pz/DmFGNgNsJbZWC/FQ4dZwRnze/OgEjSVWPTglUxG2H3BhJ
 Jzi3cd3MJRAIGyfasMRgFXo=
X-Google-Smtp-Source: APiQypKaCMQZYiKCUoL5MVgu4YLns7Nmz2SX4Gfje+8CfZyhGEDJmnwCJUOt3ng9cAIqEeDv8COwUQ==
X-Received: by 2002:a62:d119:: with SMTP id z25mr8135572pfg.153.1587719930358; 
 Fri, 24 Apr 2020 02:18:50 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:18:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:43 +0530
Message-Id: <20200424091801.13871-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 07/25] parsing_c: parser: Add
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
index a5b0d214..1ff2fd87 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1668,6 +1668,23 @@ init_declarator2:
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
@@ -1676,6 +1693,8 @@ teq: TEq  { et "teq" (); $1 }
 
 init_declarator: init_declarator2  { dt "init" (); $1 }
 
+init_declarator_attrs: init_declarator_attrs2 { dt "init_attrs" (); $1 }
+
 
 /*(*----------------------------*)*/
 /*(* gccext: *)*/
@@ -2373,9 +2392,9 @@ enumerator_list:
 
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
