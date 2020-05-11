Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C073CC47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:07:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8314720720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGoPe90Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8314720720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58B7D86E3A;
	Mon, 11 May 2020 10:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3DT5qwygYxC; Mon, 11 May 2020 10:07:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 23F39873B6;
	Mon, 11 May 2020 10:07:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18176C0178;
	Mon, 11 May 2020 10:07:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4224C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A2F2C88683
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KyVunt3s+HA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A29B28867A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:32 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id k19so3732660pll.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cknHIGv2dfFrq780ViggJRx+5gYnROELhuzVTUaXGKg=;
 b=GGoPe90QiuP+bnWwrd/18p694N6fq28wV5QlIb0VmA11qdR3uSP72A4dIc2xA6E/TX
 sUdVVR8sY9E/Nio4VCYsTSMqlo8WoemTQ/k3nrHdulx5EvLzPq4P7g5gVq/Om+ZJEI5d
 yNOgRwTkMPdy6EaZ2G5V/vJLKnR+ebo/PNQRGHPxOd1zvgx/kq2eAfzvlkk43Jjgwma4
 TXvMkXBf37c3Y1w4+T6xWq+N4GUvINCwT1WKZv9t4dyXyA38YsjEUu5O/KkPbn8qx5Df
 AuEsj4DmpoNSmMGxYxzLfhtJETKPpvzMiL9l+I9LvgKyDa2oG3ojh+PSKmIJL3+V6dia
 QStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cknHIGv2dfFrq780ViggJRx+5gYnROELhuzVTUaXGKg=;
 b=S8EuxVta7filLyg+YAD0aROVW6Xf49dCOO8dKnt/0h+H+ZJW/tO9L80vqp00YAfUQP
 E9TLVEO2MJRyHwr7QqlF4CM2AOUcXx6rZl62zYx1gUysqhTXLnnyMKZqrdopV2OEmWkU
 FjZqZ75mY/09ZFMBQW6svff+IC2JxlnAwEYqfpvJfJSctY4OysoQK4Rl/2sBpHMzxYi+
 P9HvWgn7hpSnKqqBBcZf+Xx2pzESk06QfGBrDXKOv8ib3A3IvrVubz4RNNqxYVDOXjz+
 TxJCS9C93nqh1LWDpwPtw75GoxnX5LHmeWaW9QmX+sXtAf47ag5zEI3CbIdfdfq5frwX
 +1Cw==
X-Gm-Message-State: AGi0PuY5BpqUhsc5ivnL4pEY9v+MeLCl8D4qIB7RBTaMEV/a76SExzpP
 51fcGogewsYMZd9S+fKgUeA=
X-Google-Smtp-Source: APiQypI69WFdXqdHEuBV+4ORpe3UgKA7VxAKRiSaMaAgkjETys1n26IGVQcQfKKtajQ9+v8vjkhezg==
X-Received: by 2002:a17:902:c213:: with SMTP id
 19mr14310572pll.172.1589191651927; 
 Mon, 11 May 2020 03:07:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:07:31 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:43 +0530
Message-Id: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 00/32] cocci: Add cast attributes
	to C and SmPL ASTs
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

Changes in v2:
--------------
parsing_c: parser: Pass attribute list from type_name
- Warn about dropped attributes in typeof and sizeof productions

parsing_cocci: parser: Parse cast attributes
- Mention in commit message that cast attributes are matched anywhere
  in a cast.

parsing_cocci: arity: Reflect Cast attributes
- Apply mcode2arity on attributes as well.

parsing_cocci: visitor_ast: Visit cast attributes
- Typo in commit message (AST0 -> AST).

parsing_c: pretty_print_c: Reflect Cast attributes
- Less space in front of [

parsing_c: ast_c: Add Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: parser: Parse Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: pretty_print_c: Reflect Cast attributes
- Switch places of expression and attributes in Cast type.
- Change printing order of cast elements.

parsing_c: type_annoter_c: Reflect Cast attributes
- Switch places of expression and attributes in Cast type.

parsing_c: visitor_c: Visit Cast attributes
- Switch places of expression and attributes in Cast type.
- Change visitor order of cast elements.

engine: cocci_vs_c: Match Cast attributes
- Switch places of expression and attributes in C AST Cast type.

ocaml: coccilib: Reflect Cast attributes
- Switch places of expression and attributes in C AST Cast type.

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
 parsing_c/parser_c.mly                   |   27 ++++++++++++++++++---------
 parsing_c/pretty_print_c.ml              |    7 ++++---
 parsing_c/type_annoter_c.ml              |    4 ++--
 parsing_c/unparse_cocci.ml               |    6 ++++--
 parsing_c/visitor_c.ml                   |   11 +++++++++--
 parsing_cocci/arity.ml                   |    8 +++++---
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
 41 files changed, 219 insertions(+), 74 deletions(-)



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
