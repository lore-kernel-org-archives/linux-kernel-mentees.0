Return-Path: <SRS0=7LP4=7S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F50C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8899207D5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHN7rrXH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8899207D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8CE4887179;
	Fri,  5 Jun 2020 13:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bUxD2LjxjBQ; Fri,  5 Jun 2020 13:44:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3365886BA3;
	Fri,  5 Jun 2020 13:44:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30323C0888;
	Fri,  5 Jun 2020 13:44:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A21D4C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 90A878770C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSpWsgzCJBu9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 219EA88175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:44 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id h95so2752020pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mM0yEkzigxdxEBTLGKgE+cLixX23avYYOLyrqBoWtNw=;
 b=EHN7rrXH+n6NJOiBwQ9BJvdnDnS7AfK/R+UKibVs6iE0Ub+oPyp+kCBqDuS73mzoQO
 +i2C9im0YE7dKhZNTmRugcM0WxwsRX+EY4jjtubCQruYjQKIKqwjW2V6mdmAc7fYxcBD
 tKi1jTSrBaiucLE+ndKtZiRrnsepWvsTFvRF1O4ODfh3JlJjIjT49++698eIH5ZviMv6
 KSAirShnLDqKT04gDuca+5lESkZFWwptDXsymJpngliSKMiYwhjhGgSnY1C4u2WpS5jx
 AzzFYOMYrYykcM3PPs+WVECBJwrHc/MvIAy+jlmOZRcdzCfcAT5cyP3j0Ap/ACYFnjHr
 YVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mM0yEkzigxdxEBTLGKgE+cLixX23avYYOLyrqBoWtNw=;
 b=rPNPKUHP2sgLN6R5q3L0E7uKDdE0/FAO6jmFoa13M8pbmm6uYIhLsYeqIu+0fZd3Kv
 p0HMB51B40ryhnJOhyItL3SpkVtj2HcMsfoecAxQgPQ+4Quc70HiK+wcqeBTkJeIfT+t
 WlRZI5horF6/PaHtk1e44bpo79Em+Qd+ohK+eaH9AoBdigiAk7eVv3UzR1S1cXgvOhvU
 TQ2WxvjYnWtQxl7zAq4Fsx/hk6siA92t9H94J/9M3ZH/TzDL4YsHp+hpiSvRr+Pda7hT
 Nw9+iFSp+5UnkIAVMyeFfubVQI++9I6YNyQKm/aTIgApSPtdIae1HVh3/Amzd2hysmLZ
 TEAA==
X-Gm-Message-State: AOAM531wlRHT0uz+WifzeAwEBMGtJCt3XWOgPuOuuQa2P0Sly8YIZIuT
 NxrgoGaFdHlQCwcAQ8KR/vycore/AnA=
X-Google-Smtp-Source: ABdhPJwEq9LltdJj89b9nPUZaDgiKosPSHexCQubgcmbf5dcVTdoOldEh7OtS2GRrsDd92PiMI+IuQ==
X-Received: by 2002:a17:902:bf46:: with SMTP id
 u6mr9778921pls.302.1591364683517; 
 Fri, 05 Jun 2020 06:44:43 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:43 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:18 +0530
Message-Id: <20200605134322.15307-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 10/14] parsing_c: parser: Handle
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
 parsing_c/parser_c.mly | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 5b7e1faf..3412c34e 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1542,16 +1542,16 @@ abstract_declaratort:
 /*(*************************************************************************)*/
 
 decl2:
- | decl_spec TPtVirg
+ | decl_spec end_attributes_opt TPtVirg
      { function local ->
        let (returnType,storage) = fixDeclSpecForDecl (snd $1) in
        let iistart = Ast_c.fakeInfo () in
        DeclList ([{v_namei = None; v_type = returnType;
                    v_storage = unwrap storage; v_local = local;
-                   v_attr = fst $1; v_endattr = Ast_c.noattr;
+                   v_attr = fst $1; v_endattr = $2;
                    v_type_bis = ref None;
                 },[]],
-                ($2::iistart::snd storage))
+                ($3::iistart::snd storage))
      }
  | decl_spec init_declarator_list TPtVirg
      { function local ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
