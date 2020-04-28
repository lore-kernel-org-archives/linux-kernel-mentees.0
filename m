Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDBAC83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:02:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A14420730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qotrKHk2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A14420730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4936A864CD;
	Tue, 28 Apr 2020 17:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aCK1dsGOvEZ3; Tue, 28 Apr 2020 17:02:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DC9C8648E;
	Tue, 28 Apr 2020 17:02:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77BD8C0864;
	Tue, 28 Apr 2020 17:02:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13870C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D402922668
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cw9I9kORPaGV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id C581C20464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x77so10980649pfc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ez01Gw1WJxkkT7XwlHmwndQkn6baSCeUPSIZZX1HO0o=;
 b=qotrKHk2mHA4KWegTBKSILvhQz/dGAJZwB73M/zcmoquR0J632sAyeuyeI+WCddcV3
 SD3RsDpmo+zV+X11bd72GGnKe26qvnrggyEbbNzgYL2mtx9fTdTj4c3jPlxLUO7HDrgK
 ddH5rYlUY2GXPZwCI/fh5giM6m/MlhE6EOMnksO7qynRyFZ7995FCBE3JErO1dLpmm+O
 NoAozlbJOqsacpl0AVu98VEIAGhmBgNKDhi9MRD8c76MqrS28Xd4i9gQShn885lwq6xu
 di4zQXY1dID69wXVArkllqulo2PfL+NYt08CVqDKyITbpfbCuUfGhSzGfIAuhxA/fNj2
 4PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ez01Gw1WJxkkT7XwlHmwndQkn6baSCeUPSIZZX1HO0o=;
 b=YhKqE2LR80h9wia9I6s+uurroL8NlA+7xKWQY81V3HYLuU2ar6RCZdn5lbMTUU3kdq
 bdolKJOPA0vQ5W4srqcsfYzWXdp08rnfpXyc3Sa3mPo4ZTg57VFJmm4ZCF+fbWeBLvQF
 Jo1qB9Z+89dTRCZqIJSUa197kBLLdFiMyYZRHX332sGQPOOSYrbEXZHH3oICzg+opg1Z
 INzDx5hae1j4TXEOjOf6dQ9z95080nktHTSvfalM9VS7V1tMuoyDK2beTccjBKsIxHfz
 KR4OGgedoh4Cd8mEPEaViRq8bzMEghlj2JbXpR8MR6A7WGMMTOYHs/JrYKzK146i2PrD
 P5Qg==
X-Gm-Message-State: AGi0Pub4oNDI8ceZMQ59lWRr9njUpkjidL+twl5ZD8qqy1oeeLDUeSc1
 9e2nhTKpPMKXDecxjHHhHN4=
X-Google-Smtp-Source: APiQypKS//eqPV74yb/jgwqv7Ykwiaqo7cAAcBgXMHze8NuvTv8Iy+tX759MCoElZDt7lgsMoDAIVA==
X-Received: by 2002:a62:24a:: with SMTP id 71mr11607378pfc.98.1588093363134;
 Tue, 28 Apr 2020 10:02:43 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:02:42 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:31:56 +0530
Message-Id: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/32] cocci: Add cast attributes to
	C and SmPL ASTs
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

This patch series aims to add cast attributes to the C and SmPL ASTs, and
match them in C source code. This is a continuation of the series "cocci:
Improve C parsing of attributes"[1].

Three test cases are included:

- detect_cast_attr: Test case to detect a parameter attribute.

- remove_cast_attr: Test case to remove a parameter attribute as per the
  given SmPL.

- remove_cast_attr_allminus: Test case to replace a type in a cast and
  checking if the attribute is removed as well.

[1]https://www.mail-archive.com/cocci@systeme.lip6.fr/msg07133.html

Jaskaran Singh (32):
      parsing_c: parser: Pass attribute list from type_name
      parsing_cocci: ast0_cocci: Add cast attributes
      parsing_cocci: parser: Parse cast attributes
      parsing_cocci: visitor_ast0: Visit cast attributes
      parsing_cocci: unparse_ast0: Reflect cast attributes
      parsing_cocci: index: Reflect Cast attributes
      parsing_cocci: iso_pattern: Reflect Cast attributes
      parsing_cocci: type_infer: Reflect Cast attributes
      parsing_cocci: arity: Reflect Cast attributes
      parsing_cocci: check_meta: Reflect Cast attributes
      parsing_cocci: compute_lines: Reflect Cast attributes
      parsing_cocci: context_neg: Reflect Cast attributes
      parsing_cocci: single_statement: Reflect Cast attributes
      parsing_cocci: ast_cocci: Add cast attributes
      parsing_cocci: visitor_ast: Visit cast attributes
      parsing_cocci: pretty_print_cocci: Print cast attributes
      parsing_cocci: ast0toast: Reflect Cast attributes
      parsing_cocci: disjdistr: Reflect Cast attributes
      parsing_cocci: unify_ast: Reflect Cast attributes
      parsing_c: ast_c: Add Cast attributes
      parsing_c: parser: Parse Cast attributes
      parsing_c: pretty_print_c: Reflect Cast attributes
      parsing_c: type_annoter_c: Reflect Cast attributes
      parsing_c: unparse_cocci: Reflect Cast attributes
      parsing_c: visitor_c: Visit Cast attributes
      engine: check_exhaustive_pattern: Reflect Cast attributes
      engine: cocci_vs_c: Match Cast attributes
      ocaml: coccilib: Reflect Cast attributes
      tools: spgen: Reflect Cast attrs
      tests: Add test case to check cast attribute allminus
      tests: Add test case to remove cast attributes
      tests: Add test case to detect cast attributes

 engine/check_exhaustive_pattern.ml       |    2 +-
 engine/cocci_vs_c.ml                     |   24 +++++++++++++++++-------
 ocaml/coccilib.mli                       |    9 +++++----
 parsing_c/ast_c.ml                       |    2 +-
 parsing_c/ast_c.mli                      |    2 +-
 parsing_c/parse_c.ml                     |    4 +++-
 parsing_c/parser_c.mly                   |   19 ++++++++++---------
 parsing_c/pretty_print_c.ml              |    7 ++++---
 parsing_c/type_annoter_c.ml              |    4 ++--
 parsing_c/unparse_cocci.ml               |    6 ++++--
 parsing_c/visitor_c.ml                   |   10 ++++++++--
 parsing_cocci/arity.ml                   |    5 +++--
 parsing_cocci/ast0_cocci.ml              |    4 ++--
 parsing_cocci/ast0_cocci.mli             |    4 ++--
 parsing_cocci/ast0toast.ml               |    5 +++--
 parsing_cocci/ast_cocci.ml               |    4 ++--
 parsing_cocci/ast_cocci.mli              |    4 ++--
 parsing_cocci/check_meta.ml              |    3 ++-
 parsing_cocci/compute_lines.ml           |    5 +++--
 parsing_cocci/context_neg.ml             |    2 +-
 parsing_cocci/disjdistr.ml               |    5 +++--
 parsing_cocci/index.ml                   |    2 +-
 parsing_cocci/iso_pattern.ml             |   12 +++++++++---
 parsing_cocci/parser_cocci_menhir.mly    |    9 +++++----
 parsing_cocci/pretty_print_cocci.ml      |    4 +++-
 parsing_cocci/single_statement.ml        |    2 +-
 parsing_cocci/type_infer.ml              |    2 +-
 parsing_cocci/unify_ast.ml               |    6 ++++--
 parsing_cocci/unparse_ast0.ml            |    4 +++-
 parsing_cocci/visitor_ast.ml             |   10 ++++++----
 parsing_cocci/visitor_ast0.ml            |    6 ++++--
 tests/detect_cast_attr.c                 |   10 ++++++++++
 tests/detect_cast_attr.cocci             |   11 +++++++++++
 tests/detect_cast_attr.res               |   10 ++++++++++
 tests/remove_cast_attr.c                 |   10 ++++++++++
 tests/remove_cast_attr.cocci             |   10 ++++++++++
 tests/remove_cast_attr.res               |   10 ++++++++++
 tests/remove_cast_attr_allminus.c        |   10 ++++++++++
 tests/remove_cast_attr_allminus.cocci    |    9 +++++++++
 tests/remove_cast_attr_allminus.res      |   10 ++++++++++
 tools/spgen/source/position_generator.ml |    4 ++--
 41 files changed, 208 insertions(+), 73 deletions(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
