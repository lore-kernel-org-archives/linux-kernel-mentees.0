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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC89C55186
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F397B20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEhYsUyM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F397B20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D6A91887D4;
	Fri, 24 Apr 2020 09:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z28K2BkR8Qk6; Fri, 24 Apr 2020 09:19:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7EE64887C0;
	Fri, 24 Apr 2020 09:19:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E217C089E;
	Fri, 24 Apr 2020 09:19:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ACA2C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1179A2041C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UO4+5fYgZK1F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 95A0D20115
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:07 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z6so3521256plk.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wIhWgWsmcSnUCFYeY1Wz7dLsANz2MSWyq7Or4zgsT2o=;
 b=OEhYsUyMp0aV3TBzP6CYFnNSXBqOdqYBn0M9DtYonOyM34L167efIoM9AvN6mv81Sm
 D7FIy8NANhD+LQD3xibx1tEPZx4uYNmlNTOwmnietF61xp0xr0uJXLNiK85WpPR8Mv2f
 wylS2cCbpYKOxasJip0iCl9qIOO65gIJuLsn+xwdsGYN2Dxg7qh++b7leVXk3VgNp+3f
 z2SFgg4jubUOnj5NWZrw6HZv/xLzlFUGNx5qIRmaN8LSVhmuJkmchQELkJGG0bB0Edb8
 Ur9d+Hxtgp2KRWYfYPqGLxJmo/7wOYAtvJE1iRBqx2dI2GNeg4csVdnBimXaqJMOTGLm
 w9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wIhWgWsmcSnUCFYeY1Wz7dLsANz2MSWyq7Or4zgsT2o=;
 b=Crdf+75qm7ufAqLEZhLMuIBGKKLjNsP4VG4jFG8p42I+nZTCfx1oE9IjWel0Euq+k9
 MnNZqnt9KWRZ61lzvHY+Jy+g9RaCGoYQIDR+v6pZLWys2kR4zwFrLGrGLhh+RoNjkBWD
 zwy3yeXZPnvRZeH0TckCI49S+3f4Rf0X1P45ZaAUwXd2UQsl5t+Pqnp9mliiuV5+m4Z3
 Xze5WYxnmxUbkeLU9M4TtyD36eVj6smxmOSSXYhXDj54QbMzkM/Py8OO4+DkbcElOVcB
 jxfpYtCDofxyBYkyLifLH7shOwOK8P9uQRYpirQapgJOOT8PCO4e5DjlfKK4U/Nk0Uwd
 axuA==
X-Gm-Message-State: AGi0PubA3AVz1uqfClU2p1DSHV/3RJN3shyepheA9N5XhttwbXVoCCkm
 2t7DKOnHK2PJ+i7PZvT++LQ=
X-Google-Smtp-Source: APiQypI6n2rZ0urVb/rPBTkhgg00wgg9qDzbsPQKuVFGi5swsLSmpmqQHJk3Tqty80n5bINa6aJWjg==
X-Received: by 2002:a17:90a:aa83:: with SMTP id
 l3mr5328678pjq.100.1587719947148; 
 Fri, 24 Apr 2020 02:19:07 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:06 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:46 +0530
Message-Id: <20200424091801.13871-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 10/25] parsing_c: parser: Add
	MacroDecl end attributes production
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

Add a production for macro declaration end attributes. This parses the
following C code from Linux v5.6-rc7:

  arch/x86/kernel/nmi_selftest.c:

	static DECLARE_BITMAP(nmi_ipi_mask, NR_CPUS) __initdata;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 99ceb359..eb22cbcf 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1598,6 +1598,17 @@ decl2:
 	   MacroDecl
 	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$6;fakeInfo()]) }
 
+ | storage_const_opt TMacroDecl TOPar argument_list TCPar end_attributes
+   TPtVirg
+     { function _ ->
+       match $1 with
+	 Some (sto,stoii) ->
+	   MacroDecl
+	     ((sto, fst $2, $4, true), (snd $2::$3::$5::$7::fakeInfo()::stoii))
+       | None ->
+	   MacroDecl
+	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$7;fakeInfo()]) }
+
  | storage_const_opt
      TMacroDecl TOPar argument_list TCPar teq initialize TPtVirg
      { function _ ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
