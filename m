Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148D2C0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCEE42071C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMpRwSM1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCEE42071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 696F12754F;
	Mon, 16 Mar 2020 10:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ku5tu1Zqqu64; Mon, 16 Mar 2020 10:03:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 56814220A9;
	Mon, 16 Mar 2020 10:03:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51878C1D7C;
	Mon, 16 Mar 2020 10:03:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4117CC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 29E9386456
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48SlUIZC-Cyc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 76F8E85477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:33 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id ca13so8380772pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KQkm1F8AZba3Vmq1q3s3+TmX66Dl/S+v9BfBCxrODMQ=;
 b=GMpRwSM12m+HIkffiV8TFEKtC9Ztu+2w+YmYsYiW0wpKWhCAIV2Wn6l5KgylLEGqSm
 6NJHYigcDINLpfZBtyR47zw0na89OLCvJhrzCgom5bEju3+cC1oPcRjCm0uVH4lhukmV
 67ttOVQRgIRejkJ4/BobCb+4OhRhCMf7fKLnAz4sQqagdGMXaFWDkUeHPgGuo4Jn+Uih
 oQHM9AUDOVTrZGAWA+tNS09//tAURotTCb7AOOh6PX125svmAL4rEiDnOd+h5Jcqj5P3
 lMkaJ5ElVbzMeAOfUcDfKaTiA7nZYWRbY0N7N2YZpsqQiXSDuyhxHU8onPRUCd/ecvYF
 Vqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KQkm1F8AZba3Vmq1q3s3+TmX66Dl/S+v9BfBCxrODMQ=;
 b=ejzMyNuuuQDrxIXnvaNgZLUGYgFkATK79AT46miLiXcTqtTCNrr9cBY0lnMErZ8d5M
 Vrxs7JidS9wX1zcoV8a0MqIeDZKUiDYRSsd2s2nejx+E2QhhqZXWtawUP70dHkytm8+8
 TYKvlQDiStPVQCX/N6OubepWz2AuP4picZzgsARndi+lssPESiWg5bRRXhk8wdziovPF
 vu1br9hOIUim7osbRhKI/oQc8j0mQnRARf2l1TGnkxKTccjye7x/93hjmdUcyZYCrh5N
 Rc+FWL2rln1iTb5hBK8sBcyIzt9buKdVngUHUxxAP/j1oPHlr7iNIVYXCjLFwqhLFReo
 X0Lw==
X-Gm-Message-State: ANhLgQ05ZJGP/9lMkHV8w2cQCb4WXBp5Y72ksowdqDqqUyrvhgaGeXU8
 z2tMfw+Zg3F7eNxYVSZCDmc=
X-Google-Smtp-Source: ADFU+vv9e5tq76a0x0+mIbggAxY+irLP9YGYIINs9CZbTcpGWpud1bS7OD2+4TA+3BqWBjKLWdlR0Q==
X-Received: by 2002:a17:90a:1a43:: with SMTP id
 3mr24747153pjl.35.1584353012859; 
 Mon, 16 Mar 2020 03:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:03:32 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:32:53 +0530
Message-Id: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/26] cocci: Add
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

Upon this, rules similar to that of the C parser's direct
declarator and abstract direct declarator rules are implemented,
and used wherever suitable.  These rules produce ParenType and
FunctionType, similar to the C parser.

Cases for these types are added to various places in the codebase.

The FunctionPointer type is removed from the SmPL AST, since
all the productions that produce FunctionPointers in the SmPL
parser are replaced by those that produce ParenType. Any functions,
constructs or cases of FunctionPointer are also removed from the
codebase.

A test case to match an array of function pointers is included to
demonstrate matching improvements.

[PATCH 01/26] parsing_cocci: Add Function Prototype token
[PATCH 02/26] parsing_cocci: AST: Add ParenType and FunctionType to
[PATCH 03/26] parsing_cocci: parser: Add
[PATCH 04/26] parsing_cocci: visitor_ast0: Add cases for
[PATCH 05/26] parsing_cocci: visitor_ast0: Add cases for
[PATCH 06/26] parsing_cocci: arity: Add cases for
[PATCH 07/26] parsing_cocci: index: Add cases for
[PATCH 08/26] parsing_cocci: context_neg: Add cases for
[PATCH 09/26] parsing_cocci: unparse_ast0: Add cases for
[PATCH 10/26] parsing_cocci: single_statement: Add cases for
[PATCH 11/26] parsing_cocci: function_prototypes: Add cases for
[PATCH 12/26] parsing_cocci: check_meta: Add cases for
[PATCH 13/26] parsing_cocci: iso_pattern: Add cases for
[PATCH 14/26] parsing_cocci: adjust_pragmas: Add cases for
[PATCH 15/26] parsing_cocci: compute_lines: Add cases for
[PATCH 16/26] parsing_cocci: ast0toast: Add cases for
[PATCH 17/26] parsing_cocci: type_cocci: Add ParenType/FunctionType
[PATCH 18/26] parsing_cocci: unify_ast: Add cases for
[PATCH 19/26] parsing_cocci: disjdistr: Add cases for
[PATCH 20/26] parsing_cocci: ast_cocci: Add cases for
[PATCH 21/26] parsing_cocci: pretty_print_cocci: Print
[PATCH 22/26] parsing_c: unparse_cocci: Print ParenType/FunctionType
[PATCH 23/26] engine: Match A.ParenType and A.FunctionType
[PATCH 24/26] tools: spgen: Add cases for ParenType/FunctionType
[PATCH 25/26] cocci: Remove Ast_cocci.FunctionPointer
[PATCH 26/26] tests: Add test case for array of function pointers

 engine/check_exhaustive_pattern.ml       |    3 
 engine/cocci_vs_c.ml                     |   82 +++-------
 ocaml/coccilib.mli                       |   10 -
 parsing_c/unparse_cocci.ml               |   74 +++++++--
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
 parsing_cocci/index.ml                   |    3 
 parsing_cocci/iso_pattern.ml             |   17 --
 parsing_cocci/parse_cocci.ml             |   72 +++++++--
 parsing_cocci/parser_cocci_menhir.mly    |  248 +++++++++++++++----------------
 parsing_cocci/pretty_print_cocci.ml      |   71 +++++++-
 parsing_cocci/single_statement.ml        |    3 
 parsing_cocci/type_cocci.mli             |    3 
 parsing_cocci/type_infer.ml              |   25 +--
 parsing_cocci/unify_ast.ml               |   16 +-
 parsing_cocci/unparse_ast0.ml            |   56 +++++--
 parsing_cocci/visitor_ast.ml             |  101 +++++++++---
 parsing_cocci/visitor_ast0.ml            |  214 ++++++++++++++++++++------
 tests/funptr_array.c                     |    1 
 tests/funptr_array.cocci                 |    9 +
 tests/funptr_array.res                   |    1 
 tools/spgen/source/meta_variable.ml      |    1 
 tools/spgen/source/position_generator.ml |    9 -
 34 files changed, 754 insertions(+), 406 deletions(-)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
