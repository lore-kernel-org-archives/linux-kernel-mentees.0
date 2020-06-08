Return-Path: <SRS0=Jgkt=7V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6049C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:20:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B79C92074B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx4E4GWJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B79C92074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7011D86031;
	Mon,  8 Jun 2020 12:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCxiLzy6DnoY; Mon,  8 Jun 2020 12:20:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F85084F9F;
	Mon,  8 Jun 2020 12:20:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0852BC07FF;
	Mon,  8 Jun 2020 12:20:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29D4FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2518486031
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTP4jkwaggwr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C066F84F9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:53 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id u5so8681559pgn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Jun 2020 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fSK2B+hLSgYiVV+I2Y1lJ4NYKoBsUNBdl8adOpxXfoM=;
 b=Gx4E4GWJBWIBEkmbI4Ttk/o7sW0G7uCg+mqTarU+OdhDJaZV7uxKBwkuDh4uxmQm1y
 9Ik0IJr3clWL/oX6Y1F2Rhp20NN8fcG5D+awd6kYbn3SzCE3674qfXXD3QJMBuF1hmdd
 U6g+dvaY7QTK9icXwNlM7MA8jj2pAl8k6/F2M/YuPTUt/Be932oYQ4z/E1wqAgOVcnYH
 IbAybsZzsYWfEcrZ5zlj2MF6ycKbMTHW2lylR/q7hfeY6jsLVrPAgET5aWNlOR4khKKZ
 0Uy5s9GMSt97nfpmveinud0K2fNOHSytC2D0ALa70wgy/tPSLf76xo1eF/njzBZ30eZo
 UnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fSK2B+hLSgYiVV+I2Y1lJ4NYKoBsUNBdl8adOpxXfoM=;
 b=qpB0S5MIqIbuBqXnNbkCkpoyPHIo5Qf2V+lQJkIEwqzSLlme+szBuNp4GuCBBEMn4T
 WqehfU4FOJ29IXnvhHwiUiwZO4fTYhLu8cm2AY2VsUcdNsiOQiOSM0UDxNq7rFmrSIEi
 8bRDh7l3VsT4XCyLhHN/A91AmKPUoMO09O2Xim3QZ+j275iCZDQEyiuNWqJTB6HTZUxy
 2ThvVEZQPPSSzEw+D1XKccTj2/xVi/E5f5C7khS2iUA5OEXH6u2DZVIgLQAF1AsWgKIM
 JF3WwmgdTwha0ARvu7ZhIkI9LvaJgnQfqtJN6snifor21Cph52RBGJb2l0ZkIwMaVDuq
 R/sg==
X-Gm-Message-State: AOAM532bldP85ePAEXdK6FnW7yH9oLAtI4RyzbSjYP7zmrO+KzmnNUpJ
 Bqr/cZyQPqmu1lAfm1/9Swg=
X-Google-Smtp-Source: ABdhPJzoQqDH2Mf3SRzOajFfM0XalI3D1XIysA6EN4vZjugw4o0jqs5maXDXfjlaLyoD06Pi3VeZFg==
X-Received: by 2002:aa7:9e50:: with SMTP id z16mr19969329pfq.118.1591618853328; 
 Mon, 08 Jun 2020 05:20:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:1863:7add:d8e9:7114:e8b0:51a9])
 by smtp.gmail.com with ESMTPSA id i5sm15747657pjd.23.2020.06.08.05.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:20:52 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon,  8 Jun 2020 17:50:34 +0530
Message-Id: <20200608122037.28019-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
References: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/4] parsing_c: parser: Add
	end_attributes_opt rule
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

A lot of redundant code is introduced in the C parser due to additional
productions for end attributes. Add an end_attributes_opt rule to
resolve this.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index effd0727..78407844 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -2542,6 +2542,10 @@ end_attribute_list:
 
 end_attributes: end_attribute_list { $1 }
 
+end_attributes_opt:
+ | end_attributes { $1 }
+ | /*(* empty *)*/ { [] }
+
 comma_opt:
  | TComma {  [$1] }
  | /*(* empty *)*/  {  []  }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
