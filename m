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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D7FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63742206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vJoWhA5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63742206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4927086EA7;
	Fri,  5 Jun 2020 13:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2W9s8EGsaXa0; Fri,  5 Jun 2020 13:44:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E967186110;
	Fri,  5 Jun 2020 13:44:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7EBBC0888;
	Fri,  5 Jun 2020 13:44:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96542C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 80190203E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynPBOasQh42e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by silver.osuosl.org (Postfix) with ESMTPS id A5932203BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:21 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id ne5so138837pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FmDSG3GkcZPx+14FSLQSYV7N874MdZ48KVa17LyO06w=;
 b=vJoWhA5olVMMoYjND31oyX3Tm3XOvbtGXZSx3D82iZyJn39cRMzcvzdQl5qQPKYG6B
 Dc/P2Btj2vzJQ3uk1/QpIM2xzz4CJoiHIa++Uw/EwPF1/kV+o5bku2KMQIMQG3Wh7kc0
 cMbdGf0x2LKgE3igsXgf4poEsiFYW0YDXpmL4EiX+1X4kg8hUY4DTS7UUbYPRgtssfVU
 Pp438d12DB/bWl8YEWiZRDp3yCvgwug+S9DQ/FArit/dJbWiwE9k1GQddpR9bKQfgW4U
 C7TWQAs7It9suuPtxFccTrHzshze4jdkjf8YlhpwOpJ9BSGU7kTeKvBJkPxhWj3VpOXp
 e4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FmDSG3GkcZPx+14FSLQSYV7N874MdZ48KVa17LyO06w=;
 b=atyy1T9/JtcEaVNHV36tXEX1L7oUHktBMCwJED1kjMJIAYotZCmWJATiGeubLY9sRP
 M3UNZbWlyeMuoCYUC0XP6gkPBNDn3I+R9YAcN+l881UkCcf7U92g7pDdIlecIHM7TZZ3
 qW2cLCr2RJHRZoQJUT0ZZU8hapsHu1bC1yvkoSEim5gxi62RyQR9xC08FQU3gH+2aW2d
 tPAiSjwWJmYCW9N7ugHozsy5gcKnvj5mgLsv5vDWxuYFpIepUh8tIsfqPA952shzMS9a
 jsMJi+gjH+Q+7IhRI+PLPcVZVP86aBADyOXTw37VVkrMAuG9sObD5bMLlxAMkiA7OJ3e
 lfOg==
X-Gm-Message-State: AOAM530yd12qRrUArJ9XvJxcobEgZ253/al0RvXtW8wqDTXGGL5+tN9V
 a4BhwG0mL2PIPyomFnWb0MQo2QOvjE8=
X-Google-Smtp-Source: ABdhPJxh4HUKQHLCwJ0+rQVXSbMmo107P2NMd4grDW0GI12jAUM/TF0powxJtyKLPgJKgfS6LrmKiw==
X-Received: by 2002:a17:90a:376e:: with SMTP id
 u101mr3145901pjb.126.1591364661057; 
 Fri, 05 Jun 2020 06:44:21 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:20 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:14 +0530
Message-Id: <20200605134322.15307-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 06/14] parsing_c: parser: Add rule
	for optional end attributes
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

A few attribute centric productions cause a lot of duplicate code. Add
an 'end_attributes_opt' rule to dispel duplicate code caused by an
additional attribute centric productions.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index e4352a61..443ac59f 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -2408,6 +2408,10 @@ end_attribute_list:
 
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
