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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFDAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325E12075B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXh5W24x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325E12075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DB566203E3;
	Fri,  5 Jun 2020 13:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1JEOgg99lNy; Fri,  5 Jun 2020 13:44:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 441FF2038B;
	Fri,  5 Jun 2020 13:44:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40688C0888;
	Fri,  5 Jun 2020 13:44:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 158F3C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 125598714B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_QL_ZJWmXry
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C05D486BA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:47 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id nm22so2604577pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ehxusg0wFvuEPrRhtjKOUQLdOEx3QD4aVXqqLyIFDM8=;
 b=fXh5W24xVbDFtDPiVvviSlkBRaf+Sv1cHqvakHXrRE6KZFBM0s6WtLg+kTEXG4Pw8A
 /Q375nS9AfsftgD0X8Rg6upI1Yx9e28HMsvFbSNjqStN/bPYQnKGK98u0GZb9XaPHzB/
 2ep5MKz5Ek0yQCbx8/pOqqq8pLEEyd8nDRlymGDYMyOLthfzRztmKpzjznrg8zJUXk8f
 lJ7fY1pM2x5tGCyP8CleRYibABADqpNcvfUhlhRFPYzZr0TStZmggKlTwudO8/JbtfWF
 0+mEyV6OWRUhu6rjfKjZFahh+nFxleInWSBSxa2vUZymPEPLKuIWBfU12v9UnFKI98Xt
 wm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ehxusg0wFvuEPrRhtjKOUQLdOEx3QD4aVXqqLyIFDM8=;
 b=lJaB3ua1aS3eAeP7KwIz4OJNQ/xu2YfJH3WxdmKKvwCnI5BTesMWqI+N1G9rlNvDzF
 H/nOi4NsepFTMBc9IsO1c42i12VyBV4HIqwfnY6iYB35wZbPlMsPNZIh1h/4cECGRtYr
 k0vHLgn7rM7DPYq4OMu0SfjHfslwXQrxirCcP5wNZZm5MeXQd3mh6CVMLzf8OKq6gi/U
 ooR65uZiKHuBNZZccGln3CdLc/ZSeh5Hb31iDeMEILmnnV9zIwzq0dBurh9TF4HesYsJ
 aoZJ8V6tQjwzK32lN/g5GVtNWytWYTiPtoxbrC6EsaksZBHHDmheoO1jF+EFSPGEbf5s
 2ayg==
X-Gm-Message-State: AOAM532q/3BPQZQ9v85l4HIYVwV2j/fr5sF65EB/u0dOV2OdUON0a3R9
 kgt0pUl+oNNWiFJ8hjawsKI=
X-Google-Smtp-Source: ABdhPJxcaxdE16027mZpA3O8NkW5nAOngcRZ85miMBVLUqGFQlYwHifv4G36TqtC45TCLTGrIgHZGQ==
X-Received: by 2002:a17:902:684e:: with SMTP id
 f14mr10147871pln.328.1591364687326; 
 Fri, 05 Jun 2020 06:44:47 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:46 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:19 +0530
Message-Id: <20200605134322.15307-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 11/14] parsing_c: parser: Add
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
 parsing_c/parser_c.mly | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 3412c34e..71e58e5b 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1576,15 +1576,16 @@ decl2:
      }
  /*(* cppext: *)*/
 
- | storage_const_opt TMacroDecl TOPar argument_list TCPar TPtVirg
+ | storage_const_opt TMacroDecl TOPar argument_list TCPar end_attributes_opt
+   TPtVirg
      { function _ ->
        match $1 with
 	 Some (sto,stoii) ->
 	   MacroDecl
-	     ((sto, fst $2, $4, true), (snd $2::$3::$5::$6::fakeInfo()::stoii))
+	     ((sto, fst $2, $4, true), (snd $2::$3::$5::$7::fakeInfo()::stoii))
        | None ->
 	   MacroDecl
-	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$6;fakeInfo()]) }
+	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$7;fakeInfo()]) }
 
  | storage_const_opt
      TMacroDecl TOPar argument_list TCPar teq initialize TPtVirg
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
