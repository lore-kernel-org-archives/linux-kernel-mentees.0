Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41849C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC4220888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NO/g7GNH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CC4220888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFDE188DB4;
	Thu, 28 May 2020 12:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qQfjSg8Cara; Thu, 28 May 2020 12:25:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 640E288D90;
	Thu, 28 May 2020 12:25:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54038C088D;
	Thu, 28 May 2020 12:25:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1611C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 90FE588DC8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WltqRX+gqwoy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 31A8788D90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:12 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bg4so6200214plb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zmkWlw6cjzbdMBQ4EEJvo+mhwEmnPJhxR/Fbo4eIk3E=;
 b=NO/g7GNHCyskJevgYt7XJx+1cRE8GGrdDZMKs8N9fMNSA3sUursVU9/P8wlbGu9TGk
 fZTZndEegwETVujKsj9uId3R4FN64V9trlbD4ymrl0n3nqCeTy8qKG1d4F+fln9/TDCi
 QQ/9zEOFRm5yup8wP6Fd291Hqi3zD1QijkxL9ncMbPV/Rz3yHImvBZt74oY+WTnU+z4m
 B8nT2X4256bFBPPk2wF6rCPzaktaL4MAL3VEj5HLooSAGSsAJmZtP6mMd5II4WxG2Bpz
 F1DT8TdeOh5sWfuaePDYLGBMy7aRLRYHtVyaxs7sHzZr8h77IbEY13P8Acx+AK2BZU4h
 BC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zmkWlw6cjzbdMBQ4EEJvo+mhwEmnPJhxR/Fbo4eIk3E=;
 b=WIWEA9k650Xjq1RV5KOrTuSMSCr7ZknC63V0GscGgz06Qt1/4/91ynWhHlX/nZR4+4
 uOpXxAeiDSRToy1HVR22Xj0feiQyoi4df3WTCgM/7vOgZqADdmZLRsR/bsmSWFjISHA0
 4bj9tYNKU4JkT3Jzw1OQLXJnApkXGZlsQoE0PmJR2iTBLCvTxQOS1TJex3RwNeBO5TXM
 jwLO0rw439xgGmr/3IZBt+9MeMRtzs/jquZPXFW85fEsJZp9yVPq44ymYUQlUPwoSF51
 fHEnc2g75hh0b22Fv8WETtxKUFWykPe5xeBTV3cjwYuw8KD77gpztFsXDA+2Uwb2tKHG
 v7nw==
X-Gm-Message-State: AOAM533rI5INVAYVkHHPln3HW3SW6d9fEydkQOoR6IXzLLSYjZUahDDY
 S10Id3jzOAYE8eagr22HvGzapg1h
X-Google-Smtp-Source: ABdhPJyEuiFGIK+jiJpBwmpySMoWEqzyP/bDMc/3Iss+XtYZaPi3VcJp58HgAdtZv/XPZkAxkcKlbQ==
X-Received: by 2002:a17:90b:fd4:: with SMTP id
 gd20mr3576098pjb.181.1590668711670; 
 Thu, 28 May 2020 05:25:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:11 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:11 +0530
Message-Id: <20200528122428.4212-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 09/25] parsing_c: parser: Handle
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
index b795f3a0..684ee63e 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1553,6 +1553,17 @@ decl2:
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
