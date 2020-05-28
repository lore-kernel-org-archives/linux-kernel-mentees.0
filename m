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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BDFC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:26:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19BED212CC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSJK1YEc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19BED212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DAA93871D0;
	Thu, 28 May 2020 12:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEsBHJM4Ayy6; Thu, 28 May 2020 12:26:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 76BD7871C3;
	Thu, 28 May 2020 12:26:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6709BC088D;
	Thu, 28 May 2020 12:26:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45114C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 40938880C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHSoV5-D7ysW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BAF1A88278
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:02 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t16so11489282plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4XE5uPcNgqgWnR2Cr0pQe97/Ns3BG8LcPaOZ3ZDM6I=;
 b=JSJK1YEcUw+tXh4ctftmUqWz+jVmYW3JcNPpHG24x+yA5BC2UHpT3dYvWL12ZcSEZU
 neULlVZ/wIHvbc1FJa5Rc05+rkd6JDJ1tzsyLZ/R6tLhpJegtPTMUCPtk7gUAgprHJ8C
 JQPUqsDU/pR1GY/diVtMWobzNhTnqIlHxrBIfIS3scst3kkjjgn9YBDR4BbHGVBTSrZm
 yBqsH5luvkWRUXbaBilpTr8uOPtmB+EojIeKJjE816+dyUEUYJfv8Yxil+QKUpz38Y3L
 uQBcM7V6m8UX5RAIcOGklns/0EKx03QUxdzNw7rYk+7YeQDYdWZWbbVC4f830UTM4cvm
 n30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4XE5uPcNgqgWnR2Cr0pQe97/Ns3BG8LcPaOZ3ZDM6I=;
 b=hF71F+XQqGE00KYUaRD0uL70rEXY7WCeSknUT51o3DiNI1I81pn3+ie0Q02iUlASJP
 5vINgl6zMMgPeSdPJkmY5fR7VIaX+PMgiiaOhp9xN4oZqzDgZIrILEh/RsfkTf4w7g/w
 0LlnfmcRsOv6pn6CMXGr37gXrvBSMdfoPdZckIrYLex6ZE/q9shaIHidGyaJQsfSvXWb
 ciIBYxnFDv7grkk1qSr1e0RdfeNYxnLOpA0sULSrTfUkgldPyhrfeTNLH6IUdQVZNlHP
 eJKjj4k/9CG15sfAAl6YTByxIGZJB8Np6A0gu+iToda3hiNIFCVPQls1bLd9JPIfE3av
 Gjcg==
X-Gm-Message-State: AOAM5312XDu4Sn/CEbZvbqRhnVYkeqK0DSRVA1jrtVqEnGYWpuJURnjG
 P+rdmaXR9mZjj8w+/HNsQzE=
X-Google-Smtp-Source: ABdhPJz1DabSFsd1LZyX3pcB+IN6N6zm6ha3mHKorH2hgfMfPJaQ2pGMpTP2WVzMTcf+J+RcL9npnw==
X-Received: by 2002:a17:902:bb87:: with SMTP id
 m7mr3265232pls.270.1590668762273; 
 Thu, 28 May 2020 05:26:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:26:01 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:25 +0530
Message-Id: <20200528122428.4212-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 23/25] parsing_c: type_c: Add
	parameter attributes to record
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

Paramter attributes are added to the C AST. Reflect this change in a
case in type_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/type_c.ml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/parsing_c/type_c.ml b/parsing_c/type_c.ml
index 4a85b683..617b6fc6 100644
--- a/parsing_c/type_c.ml
+++ b/parsing_c/type_c.ml
@@ -304,6 +304,7 @@ let (fake_function_type:
                 { Ast_c.p_namei = None;
                   p_register = false, Ast_c.noii;
                   p_type = ft;
+                  p_attr = [];
                 }
               in
               Some (paramtype, ii)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
