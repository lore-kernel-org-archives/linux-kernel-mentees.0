Return-Path: <SRS0=Wgtg=7Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066E1C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Jun 2020 06:46:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9BF20801
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Jun 2020 06:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpCgNK44"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9BF20801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9FF7B8812B;
	Fri, 12 Jun 2020 06:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZ-Cl5y4ZaO1; Fri, 12 Jun 2020 06:46:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4949888129;
	Fri, 12 Jun 2020 06:46:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4244AC0881;
	Fri, 12 Jun 2020 06:46:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FC5BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 59E3F87A11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pikIYW3uQLR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E6C2387993
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b5so3848102pfp.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 23:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TFnz4lPJiP/gesszZznbRbJ5EYTo2GON/fiHmKhvIc=;
 b=hpCgNK44K21axee+YJbBF4tgKfeEljEf2RvIotnfsf1uQ8/0uiM4MK/z4mvTMBQ85b
 uDj2GAa//AtoTN5r+vp6zm9PI3Ma0BD1TpohFcPIO3tzruIb0nYefR3xeQYzRwbp35WP
 dypLaMrBTdNqA0yygTOZHy0hX53I8UVuaCqyqm0I6cKiNlImknE/zPpqZCs1+32zzdbz
 wS0tSUTU/AtsJD9e2TlbRpBneK0NfaU3H2LvRQGTi1qXSxCgQbjhDGExkyqOVz2aErp7
 hYR5SLAUcquuKU7miIdymmDsGTCLk6d+7so9+t7EImGUrjkHGVAYfroJEiZ5W8fozrx5
 lHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TFnz4lPJiP/gesszZznbRbJ5EYTo2GON/fiHmKhvIc=;
 b=kK8N4Pc+UC9CvoUAUJ5cFHjSBODd4wwGtqYXFcN+XhD90Rxr2xClwMD5gv5qFDLWcw
 1/Iczd2bZ32OPJJ7RskDKgAovBs9bRNTV2nx4uh3x2lPNTCpYbbZ+YwUlFYPosY6O4Fi
 Uaptf5vXY0cW/vaT+3q+BErvfTP8EyovK00opF1+Z+aZA/9LrcoTJqdp8w1wyIOKeWWT
 rdGz9WjlUxXAPsDRnZwjXruA88Sz2BdsKp3sOe6MgZROAZaOAOBJXsbSZV+a9AIMua2w
 GLE80hVgA4vbZr6g84jE1wjQRXtC3rzRicUAi/YjJIca4pgiRF4wS/JqgXuWEaiCc6UR
 bD4A==
X-Gm-Message-State: AOAM533DAeYX1miUkyCUvxSD3BAgkxBvWvNzOa3ZvBXTgiBfrBV/X5p7
 +Voufxncng8EC04UeL8kNCk=
X-Google-Smtp-Source: ABdhPJxwX4t7bb9/xuU+pfIaJ7tPz8tF/47c15RhsxXquIzJNlfal9NZsK3LlLlK0lb3ruMt0ecp9Q==
X-Received: by 2002:a62:7993:: with SMTP id
 u141mr10993826pfc.110.1591944381454; 
 Thu, 11 Jun 2020 23:46:21 -0700 (PDT)
Received: from localhost.localdomain ([1.38.217.229])
 by smtp.gmail.com with ESMTPSA id w192sm5087476pff.126.2020.06.11.23.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 23:46:21 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 12 Jun 2020 12:15:44 +0530
Message-Id: <20200612064544.30194-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200612064544.30194-1-jaskaransingh7654321@gmail.com>
References: <20200612064544.30194-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/3] parsing_cocci: unify_ast: Apply
	unify_mcode on macrodecl attrs
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

The following commit introduced some poor management of attributes in
unify_ast.ml:
	b4b8653bd5a9607922e0050fe2fede10d422b218
Apply unify_mcode on macrodecl attributes in unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index 752e9283..788c8fdc 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -413,7 +413,8 @@ and unify_declaration d1 d2 =
        else false
   | (Ast.MacroDecl(s1,n1,lp1,args1,rp1,attr1,sem1),
      Ast.MacroDecl(s2,n2,lp2,args2,rp2,attr2,sem2)) ->
-       if bool_unify_option unify_mcode s1 s2
+       if bool_unify_option unify_mcode s1 s2 &&
+         List.for_all2 unify_mcode attr1 attr2
        then
 	 unify_ident n1 n2 &&
 	 unify_dots unify_expression edots args1 args2
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
