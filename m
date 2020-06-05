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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1F6C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF46206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+x2rMt0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AF46206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3234087179;
	Fri,  5 Jun 2020 13:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liXGuEIqoW13; Fri,  5 Jun 2020 13:44:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB96486B4F;
	Fri,  5 Jun 2020 13:44:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB837C0888;
	Fri,  5 Jun 2020 13:44:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD5D8C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 99636203AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wc7xeHrI9P6c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by silver.osuosl.org (Postfix) with ESMTPS id 75E892038B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:16 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id b16so4913411pfi.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPCzDPIq2ilnpUksJQzqSvAiCCiGo4aSKa+4vJmVh6Q=;
 b=l+x2rMt0uSRnCU7Z/zakb9jtgj+idMJpmHfjmugvHlUV4QCGZrM5U3ClQv+XGjoq1H
 4kFWttofNA12VRd5IMpxmqvFKOrH8diszMu78UBuAQmkBJSnBwnhQuJRBpHoh2FHmNnm
 uTvETUb2qzAfTSIPWTzIUo3xDeAxeis8rvA5Oju86S7Poabktk2lRQkZYV6aUq9BzVx5
 HB4sHZbiT205H8rDeR1E2RHSuIqfYwUw1JE1H3ZSZgBByVvYcASYUlVos1JaGkOWvDiA
 DXeiQm0UcIdXKetv0qwVD6Cgt1Vi4LLaRA/wx5DW0T1sNqG3SBmhXBPZ3o14zxqMa3ve
 XAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPCzDPIq2ilnpUksJQzqSvAiCCiGo4aSKa+4vJmVh6Q=;
 b=Z6jaiwzroAancyjxkkeCnCndQtNGzf2F8/STYIcbcV9jE6rb9TRuE0YXHmeqfjEfp8
 mpQS3CXX5HTeYYXuT/aMjsv5m/meITJHw/HFyGplcQIBy7DO6A54YiMDWCN0/Gvgt+qm
 36YyObB6yJyOtRI54xo/95zjRnzqZjfnbxU8/44yxPGqXuBJmPl4na7zaRCyq02kubrv
 XvPi9LMC7PkyjjiZQpr/38MfeAoc0+1td/zoRJZjyBeqCthKgYQbBcEA7kUg1g8QvTJh
 Iblj7RwYwVZe0TSW+WI+ZQoQ8DVWIzo7WxLS+q3TeAJdRJ3v5TmLZAwIzDhRhRwYU/It
 BYfg==
X-Gm-Message-State: AOAM531mPNCkVlDQ7KrHsM1LPRgOH5+Y2gSK/WvMU1etciHJf5U8yQ2R
 OPTWPY82daVsH4RLkju9stgQKiaoHjM=
X-Google-Smtp-Source: ABdhPJzkCao1PPslxtrs/vozZzIkDhz/UsjFzjPQIa9CcOAizSDw17EshdoTxjnf96PPptC/ulXaWQ==
X-Received: by 2002:a05:6a00:807:: with SMTP id
 m7mr10050379pfk.246.1591364655970; 
 Fri, 05 Jun 2020 06:44:15 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:13 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:12 +0530
Message-Id: <20200605134322.15307-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 04/14] parsing_c: parser: Add rule
	for multiple end attributes
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

There is no rule for productions of multiple end attributes. Add a case
similar to that of attribute_list for end attributes.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index bfe92e18..d259f12a 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -2401,8 +2401,11 @@ attribute_list:
 
 attributes: attribute_list { $1 }
 
-end_attributes:
+end_attribute_list:
  | TMacroEndAttr { [Attribute (fst $1), [snd $1]] }
+ | end_attribute_list TMacroEndAttr { $1 @ [Attribute(fst $2), [snd $2]] }
+
+end_attributes: end_attribute_list { $1 }
 
 comma_opt:
  | TComma {  [$1] }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
