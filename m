Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED0DC54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:08:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4101F20663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qu2ylTuI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4101F20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E1AB920134;
	Mon, 27 Apr 2020 12:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itB+xUXYB0lQ; Mon, 27 Apr 2020 12:08:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 084A02011B;
	Mon, 27 Apr 2020 12:08:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F063CC1D74;
	Mon, 27 Apr 2020 12:08:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84167C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6EAC28142F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPWbrxsMTme7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 57221805B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:48 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id h69so8598236pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QDOZMP5+Tp1H5p7ZsGPBt9cBYKhAoKEiEgHpCjlZyPg=;
 b=qu2ylTuI84qQ8IY4Piz7tdD0Bo89vfOnZCtJcLqJwjmygA0o9BIxzaGRpXBjat6mKT
 FhoXeIZHwlEl/vUvqiTsBVbHIvRqDigpmrHJEOr0ziIdmgPgjMugxRTVkLAXuJZ+8jQg
 X2O9VDQlGVXdQsbTI7daslOyn1sunm4zCaF/I+Wl33Rwj9pD+7ToYvDOL0bT3tU96W7V
 uiXM5JdaLtzI5l0ORlDptvRPlrlKOREgtTEVvS7GlzOi9wKHJG8obBQVdjQ27N2FeQWN
 2QlWKEn6wAoaij/SxCqWnDryFlCi1B2Bq59Ni1a5nxY+pKhnOUqRViRlZj1XNN/9EoPo
 89hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QDOZMP5+Tp1H5p7ZsGPBt9cBYKhAoKEiEgHpCjlZyPg=;
 b=XWylJPsWDOnKQfgIF6iiI82+NpYfj7sQG6vmQrRsMONupS5ZBYTbKZNpxgTVUVSStg
 jYgwvCTKV6U4D+e5Ci3fZu9NiUj0iAjSF++T+F6LjHLRt8CLrfBDS/mVDngoEFe7MlzO
 gKVmcgxdTFz4K4TjSiHeNQaUra6X0wld6AmADu9F02SnDq0vcxkbIr5N3CkupG7tBNIy
 9+Lgi5rI4E0Y+4R71VuP4rkS7wdeIhQkmo319FL+mC8gv3dNV7CdnYllqjj1YlCRyW6K
 JskQWZqvjaDBg6GD6LUPZwk7tZhBqOAkXgXOaQV4q2s69+2dllbN+g10KKQg9Dtxj7N7
 jK8g==
X-Gm-Message-State: AGi0PuYhCs7KLEoD51FzSQOtvn0BL3NJ0ytG+prMYRbObilzDUMiPo4z
 u8FyJnN1VeYBo1R3KXEfaq4=
X-Google-Smtp-Source: APiQypKLaPeHDSsyS2ka8vPzcN1pFv/EmazhoafRDhmiFYgKMn5fCHnLKqxoHXK2N22Q2xKay4KGcg==
X-Received: by 2002:a63:4c1:: with SMTP id 184mr22129446pge.156.1587989327860; 
 Mon, 27 Apr 2020 05:08:47 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:08:46 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:11 +0530
Message-Id: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/23] cocci: Add parameter
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
 parsing_cocci/check_meta.ml           |    2 +-
 parsing_cocci/compute_lines.ml        |   15 +++++++++------
 parsing_cocci/context_neg.ml          |   10 ++++++----
 parsing_cocci/disjdistr.ml            |    6 +++---
 parsing_cocci/function_prototypes.ml  |   12 ++++++------
 parsing_cocci/index.ml                |    4 ++--
 parsing_cocci/iso_pattern.ml          |   22 ++++++++++++++++++----
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
 29 files changed, 212 insertions(+), 86 deletions(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
