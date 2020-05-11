Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD37C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C320620720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NV0Uvg/U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C320620720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A9FDF88349;
	Mon, 11 May 2020 10:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQqsDzk8CvuZ; Mon, 11 May 2020 10:13:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 75AE488026;
	Mon, 11 May 2020 10:13:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A5F2C0176;
	Mon, 11 May 2020 10:13:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23DB5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1DCBF85D40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahTXNbwWlqyl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F089785D3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:14 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id e6so7550742pjt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pldW5gvicUgS4QimDza0ZFlQhGmyATN8hupTPC2v+AI=;
 b=NV0Uvg/U5MPfiXMiNGZUXqK0fHHeJLzBTqnCAZStb3USIwlW3vK00V1qZoJR3tlAv9
 q1tnWu30kNvMSPGmnO/f9OSOX9NQsldG+5rJ+nu89ihUlJhVMvU+51g83jo/5kDIOj7x
 ZNZrcTf3/TR3Qa+i8vMj9xUhuD4BeM8EZ48NCcrWbB8r9ByW9awix2FngaMsQi+R+QyC
 rdL+rAWFdTK6hnPj8w+unxwpK79w+u2VQ7FcH1Y0pgGg3W6oGEd85sJ7tvNbV9HVVeG0
 x6YN2+lihlHmnyTmsCPtgrKuBu+L9g17RKaGsdEPGx1jXg28Q3f2FtQnf1SoaRucwR8t
 5CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pldW5gvicUgS4QimDza0ZFlQhGmyATN8hupTPC2v+AI=;
 b=SHecIkzDrIGC4HCE6zMtpxS+kUW9oCs8DlI+3+nh5o4LEgAK/aOojnF6Krbu5YSu7O
 ajjZYTbvi6BoCXQdlXdg3X/nR2142bYfjr8qy2aU2j3WL6MJsz9XQdDLwlROR443Oszw
 Je27RrddQmqzf0IEYDVRoAGK22bakwYszu/yVqN2unRVCwySNeg4qkFPNkIbUTNwYRpq
 xQcQRegj9uoZIPBtQmo9LxYGZ10FJlmkErBeNZZOmu13lf7jwu6f7NMtvbOYnSSRRT/i
 G16QW/OfB7awsVAjFCVnXiW9lySPY1mtlD7bwPd+z8+eCedRcaehTnyJq72ciVNBvi1U
 ZtYA==
X-Gm-Message-State: AGi0PuYU6ZwGE8OjDFS5vgz9RFCzFMlEwEzE7bvLrtTNATuf9mUPlAV/
 jtzteDS7bU21sAKr4tTBAgM=
X-Google-Smtp-Source: APiQypLMhqzHDFqf3msjTOxqBNDbD3J8ZUVTEFesETeB1viH7143cut6ZlsbgvgivldUNrwIXlEVbA==
X-Received: by 2002:a17:902:8f8b:: with SMTP id
 z11mr14252108plo.208.1589191994454; 
 Mon, 11 May 2020 03:13:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:14 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:37 +0530
Message-Id: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 00/23] cocci: Add parameter
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

This patch series aims to add parameter attributes to SmPL, and is a
continuation of the series "cocci: Improve C parsing of attributes"[1].
In [1], parameter attributes were added to the C AST of Coccinelle, but
not to SmPL.

Two test cases are included:

- detect_param_attr: Test case to detect a parameter attribute.

- remove_param_attr: Test case to remove a parameter attribute as per the
  given SmPL.

[1]https://www.mail-archive.com/cocci@systeme.lip6.fr/msg07133.html


Changes in v3:
--------------

parsing_cocci: check_meta: Reflect Parameter attributes
- Add comment about the absence of a meta attribute.

parsing_cocci: compute_lines: Reflect Parameter attributes
- Pass the correct last element to mkres.

parsing_cocci: iso_pattern: Reflect Parameter attributes
- Place opening paranthesis to the right of the if.

parsing_cocci: unparse_ast0: Reflect Parameter attributes
- Fix wacky indentation.

parsing_cocci: visitor_ast: Visit Parameter attributes
- Fix wacky indentation.


Changes in v2:
--------------

parsing_cocci: function_prototypes: Reflect Parameter attributes
- Remove unnecessary function name change.


Jaskaran Singh (23):
      parsing_cocci: ast0_cocci: Add parameter attributes
      parsing_cocci: parser: Parse Parameter attributes
      parsing_cocci: visitor_ast0: Visit Parameter attributes
      parsing_cocci: arity: Reflect Parameter attributes
      parsing_cocci: check_meta: Reflect Parameter attributes
      parsing_cocci: compute_lines: Reflect Parameter attributes
      parsing_cocci: context_neg: Reflect Parameter attributes
      parsing_cocci: function_prototypes: Reflect Parameter attributes
      parsing_cocci: index: Reflect Parameter attributes
      parsing_cocci: iso_pattern: Reflect Parameter attributes
      parsing_cocci: type_infer: Reflect Parameter attributes
      parsing_cocci: unparse_ast0: Reflect Parameter attributes
      parsing_c: unparse_cocci: Reflect Parameter attributes
      parsing_cocci: ast_cocci: Add Parameter attributes
      parsing_cocci: visitor_ast: Visit Parameter attributes
      parsing_cocci: ast0toast: Reflect Parameter attributes
      parsing_cocci: disjdistr: Reflect Parameter attributes
      parsing_cocci: pretty_print_cocci: Reflect Parameter attributes
      parsing_cocci: unify_ast: Reflect Parameter attributes
      engine: cocci_vs_c: Match Parameter attributes
      ocaml: coccilib: Reflect Parameter attributes
      tests: Add test case for removing parameter attributes
      tests: Add test case to detect parameter attributes

 engine/cocci_vs_c.ml                  |   18 +++++++++---------
 ocaml/coccilib.mli                    |    8 ++++----
 parsing_c/unparse_cocci.ml            |   16 ++++++++++++----
 parsing_cocci/arity.ml                |   17 ++++++++++-------
 parsing_cocci/ast0_cocci.ml           |    4 ++--
 parsing_cocci/ast0_cocci.mli          |    4 ++--
 parsing_cocci/ast0toast.ml            |    7 ++++---
 parsing_cocci/ast_cocci.ml            |    4 ++--
 parsing_cocci/ast_cocci.mli           |    4 ++--
 parsing_cocci/check_meta.ml           |    3 ++-
 parsing_cocci/compute_lines.ml        |   30 ++++++++++++++++++++++++------
 parsing_cocci/context_neg.ml          |   10 ++++++----
 parsing_cocci/disjdistr.ml            |    6 +++---
 parsing_cocci/function_prototypes.ml  |    8 ++++----
 parsing_cocci/index.ml                |    4 ++--
 parsing_cocci/iso_pattern.ml          |   20 ++++++++++++++++----
 parsing_cocci/parser_cocci_menhir.mly |    7 ++++---
 parsing_cocci/pretty_print_cocci.ml   |   15 ++++++++++++---
 parsing_cocci/type_infer.ml           |    2 +-
 parsing_cocci/unify_ast.ml            |   14 ++++++++++----
 parsing_cocci/unparse_ast0.ml         |   15 ++++++++++++---
 parsing_cocci/visitor_ast.ml          |   22 +++++++++++++++++-----
 parsing_cocci/visitor_ast0.ml         |   16 ++++++++++------
 tests/detect_param_attr.c             |    3 +++
 tests/detect_param_attr.cocci         |   13 +++++++++++++
 tests/detect_param_attr.res           |    3 +++
 tests/remove_param_attrs.c            |   11 +++++++++++
 tests/remove_param_attrs.cocci        |   13 +++++++++++++
 tests/remove_param_attrs.res          |   11 +++++++++++
 29 files changed, 224 insertions(+), 84 deletions(-)



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
