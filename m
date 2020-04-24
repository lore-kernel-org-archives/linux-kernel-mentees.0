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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C74C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8876B20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkRUy1RA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8876B20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 614D2887C0;
	Fri, 24 Apr 2020 09:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P---M1vBGanr; Fri, 24 Apr 2020 09:18:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F3DC3887BE;
	Fri, 24 Apr 2020 09:18:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF442C089E;
	Fri, 24 Apr 2020 09:18:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E777C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B14C887C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uBYZPQaZsuC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3060F887BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:24 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t16so3527891plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hdwzt3tFXKWyJadRRPoBDmhsTEk2PAGDfRjvzOl8MPs=;
 b=EkRUy1RAwjITi0v6gxlEi+rD+tbojjQ9pGKqNa6yRiuSBja//NWZWDHKZ1FEK2bL6r
 xxqFLZrnMfXMEqGXpsaUH8BwgNkuzlCzf+2L+1y5z4wM4zr1SiK6HN5kb+1NavmFVu/o
 5xY5cM4tLGJ0zdVCO962km3EgAEWfrA7chhb8ueLvXPPv7VL6C3S/PTkuCvIDpI5/uok
 WAEKdRLWUjFlR1QLh0uP3JIXgpa0eUz+U7IAFdES6vfZNzha9NfK3H5gAIt/lOFhmzC6
 CmOONucaBa7Nozir4bjP4n3Rv/+ZDAp0hIRzna10s/EJck1OiHHTe9HTjGkrbcuQEbyX
 z2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hdwzt3tFXKWyJadRRPoBDmhsTEk2PAGDfRjvzOl8MPs=;
 b=mIdM8TcfpFwVwWd04F3OTCa6LofHbcY6USdjGI5no+XC9TdCUN4m3EEtHYLUd+0ppC
 2FXFwWoeteJoM75fuWA0yiEMZ3VMtUad7OKyCMFC2eHbl6Hox1Ag4IFDgHWkd+M+YCQx
 Qk+/R1BXWb3Da5DF/rJxWvLtxwey3K4pTwUS4Aoy+OgZgCbOAlg8C+EwFiBSms1hDj1i
 ZqL2kz7uHBT/FUeCUtdxdtax7xkigkArfNpy9a5RBuLaG0exLGJ0L8Wb6JO6Laph2KNs
 FpOZKS0F8/iuDWm//ZqcXYhBaX/TK217t+ca1l4YYPVcxg46xzfMLt01VbHJV4aQxlR6
 hpiQ==
X-Gm-Message-State: AGi0PubfMNit1ur0jbq57+kNmNTRi/9A0OLDhZU0GSz2co9qS+AxDHh5
 c6cj2/nCSTMcuQzAkkUNJ2Q=
X-Google-Smtp-Source: APiQypL6jYEOd29iJXapjRE3ZoCg2bT3wZvtRFUJ/YB0NXLwSQrNBQqqr7Big2tfODuD4FBbYTjXhg==
X-Received: by 2002:a17:902:b48a:: with SMTP id
 y10mr8106695plr.196.1587719903698; 
 Fri, 24 Apr 2020 02:18:23 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:18:23 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:38 +0530
Message-Id: <20200424091801.13871-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 02/25] parsing_c: parsing_hacks:
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
