Return-Path: <SRS0=hY7L=4Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830EAC18E5B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E2D7206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo4TxE6n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E2D7206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0342D87C5B;
	Sun,  8 Mar 2020 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svSIbicY5rTu; Sun,  8 Mar 2020 08:44:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA05887A47;
	Sun,  8 Mar 2020 08:44:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD76BC1D7E;
	Sun,  8 Mar 2020 08:44:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1501C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ACB25204DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHy2hMjyy1Fe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 9FC75204BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 2so3395007pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Bu9TesQ0YER+UcJersYaJXnxi19WBs6sgfxto+7G7M=;
 b=Vo4TxE6nMZGu1/YkHSIXNLPEx4PE/IbpjqTp4UKKDOmCN4QJgeCZLZfNkjsHKMHi1U
 AmkLh47NsOV7N1B7N/Wt2+K94Oy/A9vQCpx9+JEpA4DcIfrsa6ZD9dl3TaxhkXYRKHjT
 Xkd8XwbdqdnqwzoB+dTWire09BMtO72ukDm6V+eXvST2Z5hmJzR2yBR+lexXuFXHD8vc
 4cBjbqb9HgsAbKc6LTo3SHcQBeX1VDsEBspglg80OL3cihKSzYDrP2ogJZjKdfrkwhh7
 eM+Ng6uALKJL7HpD9bMg/H693RcDePjU2aawYtjq8nvvjWU3hI3vLfHoLdF3m04CnWAQ
 xE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Bu9TesQ0YER+UcJersYaJXnxi19WBs6sgfxto+7G7M=;
 b=joXYgDF+bgey2VPDALdSQ4ForyqIJBp4EuKfkOqMM0wo3Xo4uVKz4QeN7tdO0/EDTE
 uCS5cL7qUBl5bPctYVGSyHok9C42iDooNkK1flEW9gkJ5KFXpjPa61rM7kU/Xn67qtUw
 mMoZHeVz00A1b/S+hLVpojzitrknXn9YIXLEB/s39spKEi0tlKAmeEU4IE+ylbnyvUZb
 dc9gJRcjq//kQvJfMuT9zJMGu8Nq88GR23jSNMdP9ep0dGGueJbYVB3VJVik3eCQKh/F
 2leq0Eivop387KdzzrjzicdnXBc53XAP/xTjo7O6/smPIzf21oEhlWGuiSgecLRYVi1p
 LDxg==
X-Gm-Message-State: ANhLgQ26+8kM0rvqaWZwD84wfpRHlDE7RDIMnvCYtbxF/xUODLBdoX74
 O361PFmSUaac81l3Dl2zuOs=
X-Google-Smtp-Source: ADFU+vul4gMyig6Ccro1dAj1gnlbX0y2M6SfzosBm/4hootA0F8eK9nT9Pjhcur28OYqDGD9xwYaRw==
X-Received: by 2002:a63:6dc9:: with SMTP id
 i192mr11020674pgc.266.1583657045110; 
 Sun, 08 Mar 2020 00:44:05 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:04 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:43 +0530
Message-Id: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/13] cocci: Align the C AST and
	SmPL AST for enum
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

The C AST and SmPL AST differs with respect to the enum type.
    
For an enumerator, the C AST is as follows:
    Enum -> list of (name, (info, expression))
    
For the same, the SmPL AST is as follows:
    EnumDef -> list of expression
    
While the SmPL parser does make sure that enumerators are
parsed as per C rules, the OCaml types for an enumerator themselves
mismatch, due to their organization. This causes bugs/mismatches for
cases where enums are in disjunctions.
    
This patch series makes the enumerator type of the SmPL AST
closer to that of the C AST. Various places in the codebase that
handle an enum are also changed to match the new type, and
collateral evolutions caused by changed in the SmPL visitors are
handled as well.

Changes are also made to Cocci_vs_c to correctly match two
enumerators, and in Pretty_print_cocci and Unparse_cocci to
correctly print an enumerator.

[PATCH 01/13] parsing_cocci: Align C AST and SmPL AST for enum
[PATCH 02/13] ocaml: coccilib: Reflect changes in SmPL AST for
[PATCH 03/13] parsing_cocci: parser: Parse enumerators correctly
[PATCH 04/13] parsing_cocci: Add EnumDeclTag and EnumDeclDotsTag to
[PATCH 05/13] ocaml: coccilib: Reflect EnumDeclTag and
[PATCH 06/13] parsing_cocci: visitor_ast0: Add visitor functions for
[PATCH 07/13] parsing_cocci: Reflect visitor_ast0 changes in
[PATCH 08/13] parsing_cocci: Add visitor functions for enum_decl in
[PATCH 09/13] cocci: Reflect changes in SmPL visitor_ast in codebase
[PATCH 10/13] engine: cocci_vs_c: Match enumerators properly as per
[PATCH 11/13] cocci: pretty print EnumDef as per enum_decl type
[PATCH 12/13] tests: Add test case for assigned enumerator
[PATCH 13/13] tools: spgen: Reflect visitor changes

 cocci.ml                              |    4 -
 engine/asttoctl2.ml                   |   21 +++++---
 engine/asttomember.ml                 |   17 ++++---
 engine/cocci_vs_c.ml                  |   46 ++++++++-----------
 engine/transformation_c.ml            |    4 -
 ocaml/coccilib.mli                    |   22 ++++++++-
 parsing_c/unparse_cocci.ml            |   27 ++++++++++-
 parsing_c/unparse_hrule.ml            |    4 -
 parsing_cocci/arity.ml                |   25 ++++++++++
 parsing_cocci/ast0_cocci.ml           |   15 +++++-
 parsing_cocci/ast0_cocci.mli          |   14 +++++
 parsing_cocci/ast0toast.ml            |   30 +++++++++++-
 parsing_cocci/ast0toast.mli           |    4 +
 parsing_cocci/ast_cocci.ml            |   13 +++++
 parsing_cocci/ast_cocci.mli           |   12 ++++-
 parsing_cocci/check_meta.ml           |   17 +++++--
 parsing_cocci/cleanup_rules.ml        |    5 +-
 parsing_cocci/commas_on_lists.ml      |   10 ++--
 parsing_cocci/compute_lines.ml        |   25 ++++++++++
 parsing_cocci/context_neg.ml          |   47 +++++++++++++++++--
 parsing_cocci/disjdistr.ml            |   29 +++++++++---
 parsing_cocci/free_vars.ml            |   27 +++++------
 parsing_cocci/function_prototypes.ml  |    7 +-
 parsing_cocci/get_constants2.ml       |    7 +-
 parsing_cocci/index.ml                |    7 ++
 parsing_cocci/index.mli               |    2 
 parsing_cocci/insert_plus.ml          |   39 +++++++++++++---
 parsing_cocci/iso_compile.ml          |    4 -
 parsing_cocci/iso_pattern.ml          |   80 ++++++++++++++++++++++++++++------
 parsing_cocci/parse_aux.ml            |    5 ++
 parsing_cocci/parse_aux.mli           |    9 +++
 parsing_cocci/parse_cocci.ml          |    4 -
 parsing_cocci/parser_cocci_menhir.mly |   13 ++---
 parsing_cocci/pretty_print_cocci.ml   |   18 +++++++
 parsing_cocci/re_constraints.ml       |   10 ++--
 parsing_cocci/safe_for_multi_decls.ml |   11 ++--
 parsing_cocci/single_statement.ml     |    5 +-
 parsing_cocci/stmtlist.ml             |    4 -
 parsing_cocci/unify_ast.ml            |   29 ++++++++++--
 parsing_cocci/unitary_ast0.ml         |    5 +-
 parsing_cocci/unparse_ast0.ml         |   22 ++++++++-
 parsing_cocci/visitor_ast.ml          |   72 +++++++++++++++++++++++++++---
 parsing_cocci/visitor_ast.mli         |    8 +++
 parsing_cocci/visitor_ast0.ml         |   72 ++++++++++++++++++++++++++++--
 parsing_cocci/visitor_ast0.mli        |    4 +
 parsing_cocci/visitor_ast0_types.ml   |   14 +++++
 parsing_cocci/visitor_ast0_types.mli  |   12 +++++
 popl/popltoctl.ml                     |    2 
 popl09/popltoctl.ml                   |    5 +-
 tests/enum_assign.c                   |    6 ++
 tests/enum_assign.cocci               |   11 ++++
 tests/enum_assign.res                 |    7 ++
 tools/spgen/source/detect_patch.ml    |    6 +-
 tools/spgen/source/meta_variable.ml   |    6 +-
 tools/spgen/source/rule_body.ml       |    6 +-
 55 files changed, 748 insertions(+), 182 deletions(-)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
