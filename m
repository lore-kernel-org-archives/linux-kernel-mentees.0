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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63419C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 383F420888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVCF/3Ut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 383F420888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12E6688D90;
	Thu, 28 May 2020 12:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAt7xPTNp3Ay; Thu, 28 May 2020 12:25:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B262C88C30;
	Thu, 28 May 2020 12:25:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1B39C088D;
	Thu, 28 May 2020 12:25:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 689AFC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5838D882BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnB4DNQDRgt6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 06396880C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:49 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t7so11501182plr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=thv5I0AzqjXXuHTBbXXaR1eYEonA5aOATmSFwn/Lm54=;
 b=MVCF/3UtTtALvLG9g4B0JSWTxccpc0vdMaLHcB0idOVl6KX8ZBkglWypkyHvLS/yT3
 ZgvLWCYABfRPLpDeqsCGJAAsyPCK06WoyTHZ6CsW1TuOXI69wuVD/mc8am7eStkdVbEs
 t4M84fc0t58RNkQGKyVg5mQKd9OPNIe7xcymCNBajukPtz9xsS1fwN22QF588udcLYvD
 mJGX9Ui+kAF/DaerT5LRE+E0U2QvZoKzTNT4jw9tEzdjY+Nk9wWvMLfO/+5QelvvEo9n
 OSc81zdxYcg/2ax0RJzQwtCMRpWYsjF5xJGMOUf6s2MN+STkMJY0ZVZJE2GqakdhImyy
 twQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=thv5I0AzqjXXuHTBbXXaR1eYEonA5aOATmSFwn/Lm54=;
 b=j2lgFC0yLI2jGIpQ65yvJXmH3JRJXwY7PgBRpfy5IUDvOZxmZPdvKI2El3UrhXxK6T
 BvScSKrONtQL+kdURrDP6IvyVEi86EmMSDEWNZzrisCR9vs+EzL945E12X9g0+Yce02O
 WpflWPBqH9TXCLmgrqIuZaw7SvCTwQ6Gb0aP0Kt1hc/NKvFW6Cj18hyFp6hXJ4hwj1od
 jsEFXWGmxxwgyH1LdbznG0wpFtAIWX2ftnKZqVxriklf99AxFluPyeIMt2SdwbJYJVEb
 sJ/nELcALgnc3h4VZ9JdHJGVwHbEj5X/p8uC1/hH57kvMFiso0y6ODCIN49X5kqhlf2T
 +iSg==
X-Gm-Message-State: AOAM533G24+XdMcbLPlrHj7Oafrdri1PBiiiJPeiz8roDyp7bIQ79ps0
 CCwi5Ma0oY2+I+1CB+WIJHU=
X-Google-Smtp-Source: ABdhPJwoXPsAv5gXc7GjR6/Pw89dlO1qZKOf0QdW98OIG8QSlzXhFNk/mOB1Tdjq5n7Y44opMdAgDg==
X-Received: by 2002:a17:90b:4010:: with SMTP id
 ie16mr3504303pjb.138.1590668748574; 
 Thu, 28 May 2020 05:25:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:48 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:21 +0530
Message-Id: <20200528122428.4212-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 19/25] cocci: Add parameter
	attributes to C AST
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

With extended support of attributes, parameter attributes are needed in
the C AST so that the nocast test case does not break.

Add the p_attr field to parameter in the C AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli  | 1 +
 parsing_c/ast_c.ml  | 1 +
 parsing_c/ast_c.mli | 1 +
 3 files changed, 3 insertions(+)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index bc355512..5e31eec3 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -109,6 +109,7 @@ module Ast_c :
       p_namei : name option;
       p_register : bool wrap;
       p_type : fullType;
+      p_attr : attribute list;
     }
     and typeQualifier = typeQualifierbis wrap
     and typeQualifierbis =
diff --git a/parsing_c/ast_c.ml b/parsing_c/ast_c.ml
index b53c8060..204bd412 100644
--- a/parsing_c/ast_c.ml
+++ b/parsing_c/ast_c.ml
@@ -287,6 +287,7 @@ and fullType = typeQualifier * typeC
         { p_namei: name option;
           p_register: bool wrap;
           p_type: fullType;
+          p_attr: attribute list;
         }
         (* => (bool (register) * fullType) list * bool *)
 
diff --git a/parsing_c/ast_c.mli b/parsing_c/ast_c.mli
index 61935c18..5411bbb3 100644
--- a/parsing_c/ast_c.mli
+++ b/parsing_c/ast_c.mli
@@ -73,6 +73,7 @@ and parameterType = {
   p_namei : name option;
   p_register : bool wrap;
   p_type : fullType;
+  p_attr : attribute list;
 }
 and typeQualifier = typeQualifierbis wrap
 and typeQualifierbis = { const : bool; volatile : bool; }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
