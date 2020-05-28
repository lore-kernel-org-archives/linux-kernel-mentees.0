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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36ECCC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:24:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0916720888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osaOr30i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0916720888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D7FE688272;
	Thu, 28 May 2020 12:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXWOEaYDSjMu; Thu, 28 May 2020 12:24:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7FECE880C6;
	Thu, 28 May 2020 12:24:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 701D3C088D;
	Thu, 28 May 2020 12:24:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E368C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 131662078C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDab0Ypb2srD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id C3E5625877
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:47 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k22so11513342pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hdwzt3tFXKWyJadRRPoBDmhsTEk2PAGDfRjvzOl8MPs=;
 b=osaOr30ibutOXeO7u8Q/af6xtS5AxKiJ8tjIr2a2XqdqHKMWmhSQTtVYQkCVLh74Gx
 DRnzm+Ogzo9+zJntpQ93b5vU2L12bezl5Ap9bWZ8lfplVrvbF/qrDDUjF4H1bBwKrDHD
 r89BNNeBwdgl0Vzml1sy4toTTvkP3XbrTBNZkfV+O/ejoCJUBNAYAtd7/WTvnz6DMfRJ
 G4RPbqNSeMVQIg2CvIMeXXtE1lbWl0jGPPBzdH1DgsSd2PfJgmnXzEhI2+15Zg5PNfBt
 dJUh7R1yRjHy0y/unZ9FxxU9AIEw6SCokpMaXn250Fb/1DfEKhZfbRbqOa+v/mlbVQxi
 C6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hdwzt3tFXKWyJadRRPoBDmhsTEk2PAGDfRjvzOl8MPs=;
 b=FxDp8HrKDkltzOvQCzRNUhZNiDTuSD2nIgyM31bXJDSflr2KHc5iuxYZUOJgNvISM0
 KXIoYptct4Az0nbf+8jnLJdo1F5/E3WRGGP+pOX0lSgcMQJkMvkEION9iVYlsFVky2Pa
 uBFDpaAQhffabqVUX2h99frkVM/DQrtc9IILv9amF162ApUr0RzAbDCTVN82EecwFYke
 96bd8PTTg+Q8M9OIlYU1u1WXWO8tNBjart8aOROm///N12uZezfeJAQwTzXM1SOFLueo
 UvKvuoskp9edRFhlQpZZ/8QliONBoenB/5DIGzHAAuBTlfdRjXWVcmw1/qWEJJj06hqN
 78Fg==
X-Gm-Message-State: AOAM531JzRttwzSJU6tiDlU/hx082CvhxT5ApK3TIDD6QZQBVDCmosli
 2AbaNL9C+duNuRUPAZ7ea08=
X-Google-Smtp-Source: ABdhPJzdk/nFgua8nnwDiV8pxsUPopJp4Ej7KqRGiESqc/FLCHdB5vrUehxLR6Vz+z7VDCSgdG6MRw==
X-Received: by 2002:a17:902:6b02:: with SMTP id
 o2mr3415163plk.25.1590668687208; 
 Thu, 28 May 2020 05:24:47 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:24:46 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:04 +0530
Message-Id: <20200528122428.4212-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 02/25] parsing_c: parsing_hacks:
	Label end attributes correctly
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

Due to certain conflicts in the grammar, a separate token
(TMacroEndAttr) is required for attributes before a semicolon or an
assignment operator. Prior to this, multiple end attributes were not
labeled correctly, i.e., only the single attribute before the semicolon
or assignment operator would be.

Add a case to label multiple end attributes correctly.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parsing_hacks.ml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
index 0ee0c6c6..74c3ba60 100644
--- a/parsing_c/parsing_hacks.ml
+++ b/parsing_c/parsing_hacks.ml
@@ -2771,6 +2771,10 @@ let lookahead2 ~pass next before =
 	  msg_attribute s1;
 	  TMacroAttr (s1, i1)
 
+  | (TMacroAttr(s1,i1)::(TPtVirg(ii2)|TEq(ii2))::rest,_)
+      ->
+	  TMacroEndAttr (s1, i1)
+
 (*  (* christia: here insert support for macros on top level *)
   | TIdent (s, ii) :: tl :: _, _ when
     can_be_on_top_level tl && LP.current_context () = InTopLevel ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
