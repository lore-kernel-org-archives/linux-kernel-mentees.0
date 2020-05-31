Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B6BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF830206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCj++rnj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF830206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C9C687E3F;
	Sun, 31 May 2020 15:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6yOPumSad84P; Sun, 31 May 2020 15:27:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC90487E3C;
	Sun, 31 May 2020 15:27:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7BB4C0863;
	Sun, 31 May 2020 15:27:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 387D3C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 228DE2035C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ao6XYpclfBA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B581920030
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id n9so87644plk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QLCn+hu3XyMfTe5JXU0MfTa2zkxECdy10Y5As/RVP0E=;
 b=FCj++rnjW+cYPTyeP0hfMv4C7d4Ot071iIIIghq1lASRiIZdXCTarosduBzeARAW3C
 PxqgBRzv6ezdChBkskaATLTf3GsoFfx+oYw9VUa0oluagg+exAgnXFr+X1DLvTvHhJss
 XsbxiAnKwO6kYLBG++tyFuW9S2YG8Xz7T1lZTLyHgHnpZrC9ofqCSkTDZRVuDLIb5YLc
 UoP4Q1sQZh7o1S3U23Q02mJK4nwTQNjLBbCyB/swRNluiEszace0TyGxBw1OfVxZduWo
 0iecXsT/w2zfLVmS77xpr2Dc1GUZRLnFdwypYQ9ssj/VD26g6w5SxxjAzGBp+V6ujY9Z
 WfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QLCn+hu3XyMfTe5JXU0MfTa2zkxECdy10Y5As/RVP0E=;
 b=kITzh9o4ndYTsXHlqeqjCba7LRFzuUM9aiLO2hBSp20coALGlrRPJYS7HNgeqD4SYW
 tMAkXZzZZuQ8R/hKuT0uiyPkwCwGzVQo03pcF3ih5molIx8+HOv9LGcmXRi9e4WXYh9r
 RRR+E2tbu9L13/9HypEO7TsfrInd7GabeO9b4roVokecXICGYLR4urSVNm2yzY58xfHt
 XKYAWKbg2ObVs3IEhGVB7GedvDxxjpMXePfKSCmGHcANwQ6cShkqSSljpU/h5ozoVkgu
 K16RNM6lUPog6HuY9YMKCljOo3YJofaf4QzNUZIAsuvIcAZNWPM28BEXTyNiQCJiwZpB
 IZ6g==
X-Gm-Message-State: AOAM532WBwmhxxX45i7KeYghacZSejwn3kqzuzZ52hWTLL6BjZP2Q1ZX
 zyxl/BihBrLDlv3wA26knA0=
X-Google-Smtp-Source: ABdhPJyqEqbSif+P4NiW+Er22CL/vN/Wc7Ubor6yJbRVzye7UcLeh20qtUYcfH0q7z5X/aavuAlhBA==
X-Received: by 2002:a17:902:7618:: with SMTP id
 k24mr16971641pll.167.1590938823208; 
 Sun, 31 May 2020 08:27:03 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:02 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:55:54 +0530
Message-Id: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/27] cocci: Add struct end
	attributes to SmPL
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

This patch series aims to add struct/union end attributes to SmPL, and is a
continuation of the series "cocci: Improve C parsing of attributes"[1].

Two test cases are included:

- detect_struct_endattr: Test case to detect a struct end attribute.

- remove_struct_endattr: Test case to remove a struct end attribute as per the
  given SmPL.

- remove_struct_endattr_allminus: Test case to remove a struct definition and
  check if the end attribute is removed as well.

This series is rebased on [2].


[1]:
[RFC PATCH 00/25] cocci: Improve C parsing of attributes
https://lore.kernel.org/cocci/20200424091801.13871-1-jaskaransingh7654321@gmail.com/

[2]:
[PATCH 00/30] cocci: Add macrodecl attributes to C and SmPL ASTs
https://lore.kernel.org/cocci/20200524171935.2504-1-jaskaransingh7654321@gmail.com/


Jaskaran Singh (27):
      parsing_cocci: ast0_cocci: Add struct end attributes
      parsing_cocci: parser: Reflect struct end attributes
      parsing_cocci: visitor_ast0: Visit struct end attributes
      parsing_cocci: unparse_ast0: Reflect struct end attributes
      parsing_cocci: index: Reflect struct end attributes
      parsing_cocci: iso_pattern: Reflect struct end attributes
      parsing_cocci: type_infer: Reflect struct end attributes
      parsing_cocci: arity: Reflect struct end attributes
      parsing_cocci: check_meta: Reflect struct end attributes
      parsing_cocci: compute_lines: Reflect struct end attributes
      parsing_cocci: context_neg: Reflect struct end attributes
      parsing_cocci: single_statement: Reflect struct end attributes
      parsing_cocci: ast_cocci: Add struct end attributes
      parsing_cocci: visitor_ast: Visit struct end attributes
      parsing_cocci: pretty_print_cocci: Reflect struct end attributes
      parsing_cocci: disjdistr: Reflect struct end attributes
      parsing_cocci: adjust_pragmas: Reflect struct end attributes
      parsing_cocci: unify_ast: Reflect struct end attributes
      parsing_cocci: ast0toast: Reflect struct end attributes
      parsing_c: unparse_cocci: Reflect struct end attributes
      engine: check_exhaustive_pattern: Reflect struct end attributes
      engine: cocci_vs_c: Match struct end attributes
      ocaml: coccilib: Reflect struct end attributes
      tools: spgen: Reflect struct end attributes
      tests: Add test case to remove a struct end attribute
      tests: Add test case to detect a struct end attribute
      tests: Add test case to check struct endattr allminus

 engine/check_exhaustive_pattern.ml         |    4 ++--
 engine/cocci_vs_c.ml                       |   17 ++++++++++-------
 ocaml/coccilib.mli                         |    4 ++--
 parsing_c/unparse_cocci.ml                 |    6 +++++-
 parsing_cocci/adjust_pragmas.ml            |    8 ++++----
 parsing_cocci/arity.ml                     |    8 +++++---
 parsing_cocci/ast0_cocci.ml                |    2 +-
 parsing_cocci/ast0_cocci.mli               |    2 +-
 parsing_cocci/ast0toast.ml                 |    5 +++--
 parsing_cocci/ast_cocci.ml                 |    2 +-
 parsing_cocci/ast_cocci.mli                |    2 +-
 parsing_cocci/check_meta.ml                |    2 +-
 parsing_cocci/compute_lines.ml             |    5 +++--
 parsing_cocci/context_neg.ml               |    3 ++-
 parsing_cocci/disjdistr.ml                 |    4 ++--
 parsing_cocci/index.ml                     |    2 +-
 parsing_cocci/iso_pattern.ml               |    9 +++++++--
 parsing_cocci/parser_cocci_menhir.mly      |    8 ++++----
 parsing_cocci/pretty_print_cocci.ml        |    6 +++++-
 parsing_cocci/single_statement.ml          |    4 ++--
 parsing_cocci/type_infer.ml                |    2 +-
 parsing_cocci/unify_ast.ml                 |    5 ++++-
 parsing_cocci/unparse_ast0.ml              |    6 +++++-
 parsing_cocci/visitor_ast.ml               |   10 ++++++----
 parsing_cocci/visitor_ast0.ml              |    5 +++--
 tests/detect_struct_endattr.c              |   13 +++++++++++++
 tests/detect_struct_endattr.cocci          |    9 +++++++++
 tests/detect_struct_endattr.res            |   12 ++++++++++++
 tests/remove_struct_endattr.c              |    7 +++++++
 tests/remove_struct_endattr.cocci          |    7 +++++++
 tests/remove_struct_endattr.res            |    7 +++++++
 tests/remove_struct_endattr_allminus.c     |   13 +++++++++++++
 tests/remove_struct_endattr_allminus.cocci |    6 ++++++
 tests/remove_struct_endattr_allminus.res   |    1 +
 tools/spgen/source/position_generator.ml   |    4 ++--
 35 files changed, 158 insertions(+), 52 deletions(-)



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
