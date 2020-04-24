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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C820C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E6A20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Llo2AcDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2E6A20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CBE01887CC;
	Fri, 24 Apr 2020 09:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DmwE5l9Iae3; Fri, 24 Apr 2020 09:19:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 660C6887BE;
	Fri, 24 Apr 2020 09:19:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FBF2C089E;
	Fri, 24 Apr 2020 09:19:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C66D3C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B6784887CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WM3+4qCumnJF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5D0A3887BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:04 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x2so814348pfx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s+AcX5825VBIdlBbtw9jwikYvEvBRgXbpwVmNkVuuh4=;
 b=Llo2AcDjr/r5wde+HpBRM2B/ksMMmQhfqPpFEWuPRXtZXkYhppUHzWfSsQmqi9GwhY
 Vlcl/Ztqn2O7YkAdISVjI52z6P1f/zuEhGTKfGPcjiroD+7XoNs9gubkC4ZUZpY5xPjU
 ipSuqpHtcSD4IOyFRIvtcB50rX7pwNkNnFpEV9tSxNYf/FPR448u7bPiNs60DLBExZSw
 6nQOXVnxkdiAG6lYXqBzIr4bHWdjoVGX0I53KoFi7dTpe7yFPPDLjmQeyzErTdvl8ak+
 /wxZmbbioykv6iB5IQISPd86YI2/mg2g5PxNCuOlN4i/0dXhllsmGk41ctm949k5NcFM
 fIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+AcX5825VBIdlBbtw9jwikYvEvBRgXbpwVmNkVuuh4=;
 b=rQglARmeaNTKYIzUVAr7tqhbzpZ4abfz9qMA7KqFxuxDefBSRtEfmBx6Hl0s9lw6qC
 LZzhW5pZhrBJBu+TERFvixrlUwyElKGpgOL7IiNPtes4OB8wDyLNBT7LIv+YoabJfGI8
 SRhhMzVWXfoTqpj1DQ9KwAP3HUkIHcB8fEw3moIidUxewzn10Ed5LPErs/KBqWYvuUb2
 TwfULfeEDG5pwYr90LlrOf+zPyZ6721VWWyqCo1bxnCJiLJf79Bips5UkJKJtR4hoDM3
 cn6bKEaPcfcVvzZ35rVaIx6e3b2GTN+a9Q9vvREJk49p8onF3cKKd7Jfu6iNOS35fqO2
 ozQQ==
X-Gm-Message-State: AGi0PuZCndXJUb/2cZNgjVhBXNvH7GeBq3hPSgSeveVkw893LjLTmeYj
 xM8RK5AJ2+NJmov5fAurkFk=
X-Google-Smtp-Source: APiQypKZKlZ2BfCdMjzhfBBDgWWGKEq/naMo/kFWGt5tH9C8zFfp0gTEEZP0u8iLCcbIaRltbwUpfA==
X-Received: by 2002:a62:e50f:: with SMTP id n15mr8147696pff.22.1587719943899; 
 Fri, 24 Apr 2020 02:19:03 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:03 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:45 +0530
Message-Id: <20200424091801.13871-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 09/25] parsing_c: parser: Handle
	struct/union/enum end attributes
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

As per GCC's C grammar, the struct-or-union-specifier and enum-specifier
have the following productions:

   struct-or-union-specifier:
     struct-or-union attribute-specifier-sequence[opt] gnu-attributes[opt]
       identifier[opt] { struct-contents } gnu-attributes[opt]

   enum-specifier:
     enum gnu-attributes[opt] identifier[opt] { enumerator-list }
       gnu-attributes[opt]
     enum gnu-attributes[opt] identifier[opt] { enumerator-list , }
       gnu-attributes[opt]

Add a production to the decl2 rule of Coccinelle's C parser to handle
the end attributes here (i.e. gnu-attributes after the } ). This parses
the following C code from Linux v5.6-rc7:

  drivers/net/wireless/broadcom/b43legacy/b43legacy.h

	struct b43legacy_iv {
		__be16 offset_size;
		union {
			__be16 d16;
			__be32 d32;
		} data __packed;
	} __packed;

  drivers/scsi/myrs.h:

	enum myrs_cmd_opcode {
		MYRS_CMD_OP_MEMCOPY		= 0x01,
		MYRS_CMD_OP_SCSI_10_PASSTHRU	= 0x02,
		MYRS_CMD_OP_SCSI_255_PASSTHRU	= 0x03,
		MYRS_CMD_OP_SCSI_10		= 0x04,
		MYRS_CMD_OP_SCSI_256		= 0x05,
		MYRS_CMD_OP_IOCTL		= 0x20,
	} __packed;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 8def5f0d..99ceb359 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1554,6 +1554,17 @@ decl2:
                 },[]],
                 ($2::iistart::snd storage))
      }
+ | decl_spec end_attributes TPtVirg
+     { function local ->
+       let (returnType,storage) = fixDeclSpecForDecl (snd $1) in
+       let iistart = Ast_c.fakeInfo () in
+       DeclList ([{v_namei = None; v_type = returnType;
+                   v_storage = unwrap storage; v_local = local;
+                   v_attr = fst $1; v_endattr = $2;
+                   v_type_bis = ref None;
+                },[]],
+                ($3::iistart::snd storage))
+     }
  | decl_spec init_declarator_list TPtVirg
      { function local ->
        let (returnType,storage) = fixDeclSpecForDecl (snd $1) in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
