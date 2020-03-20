Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81B8C4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D8720774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3Fn7+z0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95D8720774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DECB87432;
	Fri, 20 Mar 2020 07:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7YOp1KeIqEb; Fri, 20 Mar 2020 07:02:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B204B87347;
	Fri, 20 Mar 2020 07:02:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91BCBC089E;
	Fri, 20 Mar 2020 07:02:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09027C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 004892736E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jdPzg26xdGa8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by silver.osuosl.org (Postfix) with ESMTPS id E0BEB22854
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:13 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id u12so2597835pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1sY74GkyZuxdCYokvBmv+hrifgX3v/qyVpyDCQhtrjA=;
 b=p3Fn7+z05Pd9TDTfcHErHEAYF+iRb/a2MomtlrMTMgDx/e1Oy8QzdgCTFYrZ8jJQzh
 VrZkYSV6+1SfVxcmF2HQc5x0A63jyYoXRNSY8inxcH8fcfPxw7X3kcG5KMOe+gOZfjcL
 O8Rw+GFlgZLUv4He7ZG/sJjQcsU/SkLEjY3GJ9pl/0qUTgCak5OEb6ogLCRvPPJSAGyD
 607H/z10pj5uv7pdN52EpKd1f1hfPVvNmYOJYXt4N3nbik2q7qDfZSrY90rrwKiJEO6f
 hMP9G7+W4ygnDub5+xPEHIc7tKk1yY+LM00fGtJcPQqssDLdNWLy/HgxbnrSkiKPMV0a
 EskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1sY74GkyZuxdCYokvBmv+hrifgX3v/qyVpyDCQhtrjA=;
 b=rUABy+D6W2qMZ0SIOCzI1Ny6KszpAcmHrM0NEodTe8OqF58Gw09N/FJ8NqL+BFtRa2
 VgBr4Yd2jo9Gyti8PqGR0sLdriSyLWHgtL4DNkwFe3l9JFSXxoPFFrmLzNwtjuXnR3/T
 gy1HyOBYlmojd+QySZpUzNrP47WFS49x47d9djsJ+3oJs+vgJaKKCs/4sCEmT+ZMMeD7
 Z383ypC0hwkq6MM7JS957MS3fXbYffqAjnjVZRV8YSUaGPyr6aOUTZRCkeOZZ4/VF5Qu
 mnje9TrSFNeZ/laESlIjv/gKj70k2PQe3O6lLNmUXfmTmQy+20nIqZ37cdYx6PCtfbkm
 XVqw==
X-Gm-Message-State: ANhLgQ098Jl3Mc/+NDUQbDilJcC6NTH3bQKl57alWDWAqqSpku1cG7Jw
 ccO2jg0duR1dWLn++C/Shuw=
X-Google-Smtp-Source: ADFU+vuO/1o6IId7Nr/PrsGbEZmz4iZ3BsLSRJGGozvbpmg9w3A6e8dL8cgNnElaPpAKRw1kTy1P1A==
X-Received: by 2002:a63:82c2:: with SMTP id w185mr7423709pgd.382.1584687733209; 
 Fri, 20 Mar 2020 00:02:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:12 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:31 +0530
Message-Id: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 00/26] cocci: Add
	ParenType/FunctionType to SmPL ASTs
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

The aim of this patch series is to add the types ParenType
and FunctionType to the SmPL AST. These types are present in
the C AST but not in the SmPL AST.

Preliminarily, a hack to resolve a reduce/reduce conflict
with the funproto rule in the SmPL parser is implemented.

Upon this, a rule similar to that of the C parser's direct
declarator rule is implemented, and used wherever suitable.
The direct declarator rule produces ParenType and FunctionType,
similar to the C parser.

Cases for these types are added to various places in the codebase.

The FunctionPointer type is removed from the SmPL AST, since
all the productions that produce FunctionPointers in the SmPL
parser are replaced by those that produce ParenType. Any functions,
constructs or cases of FunctionPointer are also removed from the
codebase.

A test case to match an array of function pointers is included to
demonstrate matching improvements.

Changes in v3:
--------------
- Patch 01/26:
    - Add case for __attribute__((.*)) in is_permissible_proto
      so that the p1p2 test case passes successfully with just
      01/26 applied.
    - Add case for typeof(.*) in is_permissible_proto.
    - Change the function balanced_args in find_function_names
      by adding a new argument "reverse". reverse is a bool that
      indicates whether the given list is reversed, and if it is
      then when to return the rest of the tokens and how to increment
      or decrement the current depth/level of the parentheses.
- Patch 02/26:
    Briefly describe how the new constructs are used in
    the SmPL AST.
- Patch 03/26:
    State examples of productions that are not supported
    by the direct_declarator and direct_abstract_d rules, and how some
    of these could be supported.
- Patch 04/26:
    - Group together repeated code in a function.
    - Place match statement on a single line.
    - Change spaces to tabs in a ParenType/FunctionType cases of
      named_type and named_type_typedef.
- Patch 05/26:
    - Group together repeated code in a function.
    - Place match statement on a single line.
- Patch 07/26:
    Change the comment in the head of index.ml to indicate
    which indexes have now been used.
- Patch 09/26:
    Group together repeated code in a function.
- Patch 10/26:
    Change ParenType's case as per what term is to the
    left.
- Patch 14/26:
    Change ParenType's case as per what term is to the
    left.
- Patch 15/26:
    Change promote_mcode rp to promote_mcode lp for
    ParenType's case.
- Patch 21/26:
    Group together repeated code in a function.
- Patch 22/26:
    - Group together repeated code in a function.
    - Add FunctionType case to named_type function.

Changes in v2:
--------------
- Patch 05/26: Change "visitor_ast0" in patch subject to "visitor_ast"

[PATCH v3 01/26] parsing_cocci: Add Function Prototype token
[PATCH v3 02/26] parsing_cocci: AST: Add ParenType and FunctionType
[PATCH v3 03/26] parsing_cocci: parser: Add
[PATCH v3 04/26] parsing_cocci: visitor_ast0: Add cases for
[PATCH v3 05/26] parsing_cocci: visitor_ast: Add cases for
[PATCH v3 06/26] parsing_cocci: arity: Add cases for
[PATCH v3 07/26] parsing_cocci: index: Add cases for
[PATCH v3 08/26] parsing_cocci: context_neg: Add cases for
[PATCH v3 09/26] parsing_cocci: unparse_ast0: Add cases for
[PATCH v3 10/26] parsing_cocci: single_statement: Add cases for
[PATCH v3 11/26] parsing_cocci: function_prototypes: Add cases for
[PATCH v3 12/26] parsing_cocci: check_meta: Add cases for
[PATCH v3 13/26] parsing_cocci: iso_pattern: Add cases for
[PATCH v3 14/26] parsing_cocci: adjust_pragmas: Add cases for
[PATCH v3 15/26] parsing_cocci: compute_lines: Add cases for
[PATCH v3 16/26] parsing_cocci: ast0toast: Add cases for
[PATCH v3 17/26] parsing_cocci: type_cocci: Add
[PATCH v3 18/26] parsing_cocci: unify_ast: Add cases for
[PATCH v3 19/26] parsing_cocci: disjdistr: Add cases for
[PATCH v3 20/26] parsing_cocci: ast_cocci: Add cases for
[PATCH v3 21/26] parsing_cocci: pretty_print_cocci: Print
[PATCH v3 22/26] parsing_c: unparse_cocci: Print
[PATCH v3 23/26] engine: Match A.ParenType and A.FunctionType
[PATCH v3 24/26] tools: spgen: Add cases for ParenType/FunctionType
[PATCH v3 25/26] cocci: Remove Ast_cocci.FunctionPointer
[PATCH v3 26/26] tests: Add test case for array of function pointers

 engine/check_exhaustive_pattern.ml       |    3 
 engine/cocci_vs_c.ml                     |   82 +++-------
 ocaml/coccilib.mli                       |   10 -
 parsing_c/unparse_cocci.ml               |   72 +++++++--
 parsing_cocci/adjust_pragmas.ml          |    7 
 parsing_cocci/arity.ml                   |   25 ++-
 parsing_cocci/ast0_cocci.ml              |    7 
 parsing_cocci/ast0_cocci.mli             |    6 
 parsing_cocci/ast0toast.ml               |   11 -
 parsing_cocci/ast_cocci.ml               |   21 +-
 parsing_cocci/ast_cocci.mli              |    6 
 parsing_cocci/check_meta.ml              |    8 -
 parsing_cocci/compute_lines.ml           |   21 +-
 parsing_cocci/context_neg.ml             |    4 
 parsing_cocci/disjdistr.ml               |   16 +-
 parsing_cocci/function_prototypes.ml     |    7 
 parsing_cocci/get_constants.ml           |    2 
 parsing_cocci/index.ml                   |    5 
 parsing_cocci/iso_pattern.ml             |   17 --
 parsing_cocci/parse_cocci.ml             |   97 +++++++++---
 parsing_cocci/parser_cocci_menhir.mly    |  248 +++++++++++++++----------------
 parsing_cocci/pretty_print_cocci.ml      |   64 ++++++--
 parsing_cocci/single_statement.ml        |    3 
 parsing_cocci/type_cocci.mli             |    3 
 parsing_cocci/type_infer.ml              |   25 +--
 parsing_cocci/unify_ast.ml               |   16 +-
 parsing_cocci/unparse_ast0.ml            |   51 ++++--
 parsing_cocci/visitor_ast.ml             |   92 ++++++++---
 parsing_cocci/visitor_ast0.ml            |  198 ++++++++++++++++++------
 tests/funptr_array.c                     |    1 
 tests/funptr_array.cocci                 |    9 +
 tests/funptr_array.res                   |    1 
 tools/spgen/source/meta_variable.ml      |    1 
 tools/spgen/source/position_generator.ml |    9 -
 34 files changed, 732 insertions(+), 416 deletions(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
