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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77D5C55186
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BA220724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/z9lpS7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77BA220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6AED1887D5;
	Fri, 24 Apr 2020 09:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XkHOxR6GFqr; Fri, 24 Apr 2020 09:19:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1671D887BE;
	Fri, 24 Apr 2020 09:19:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 052EFC089E;
	Fri, 24 Apr 2020 09:19:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F4136C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E453F86F55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2fIFczsj3Bi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6B93086F49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:41 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 145so4504064pfw.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bchYLZbBNBNBSZIJ1iCVYfzqRcCaJHzrdjElwsP08aM=;
 b=W/z9lpS7U4/EjKSDqT+m/0sRTxFDScOFrQzBLniiLx5Sx2d8A1HgIQbkyiQLIwbGQz
 pYr96neiIqoR+ANd9UtsjtA/0aiWf37KM3hiHCbR5SH482D1QdvLsntD4F6UvdPpCI5/
 KqpZ+EmsRDqt7Mmi/geSLEV2u1xAthqJhjRrv0GpSWUgQZwZv/X9+1lW6pFl4OA+hGv/
 tWtlQFVlcfb3wTA1sf2SjFdJzdP4TwkAAObk9PAeDpQu0Z+nNzrhoUIwtuIPuH596Ovi
 I9TNcYeG+Ggh8e1OBIyoXw0psu4MPOAevoz8XxANrx0pYmIgwBlNF1SkSadlUSa7TN26
 1Tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bchYLZbBNBNBSZIJ1iCVYfzqRcCaJHzrdjElwsP08aM=;
 b=ZY0Iasr9L/9h6u3qIVRIu5pkVl3b2BTPqGbNBoy83iazsCwHCTYn1h0lHmgbfFQD9C
 KgtKS12uli+ZQqlu/e060pS5CJWYMRE7IYwCVz9ZOQcqHJNMAWhtmIh2CIsKKnT8I3En
 x3xwhfhzLCZZz+80uWqmbGS1kqFRQxvs3X26O0z1vaiBTskDtxrb0Fleh2lVQd0Z4Xa3
 bmpahj+dd7Rd4/vnNZovy4v9Mtbg3zILeCipFEDF7fjxbjyPYDb/K+Aa4bFSbktCBJSH
 oER/SHW+7MFmGwcrays3J1q6Ng9QTePqGyV0QIamo25MpZXAJ2t600ETL5ZhCi7sNrJn
 nqkw==
X-Gm-Message-State: AGi0PuaMEQfLGYo9QO9LMnziwSJFYjCPg1hrmnaWBdwhi4GYhC2o3G2y
 q1LheGnC6U8DY2Pr7ju9GbU=
X-Google-Smtp-Source: APiQypJT7FcSzYE8ePAoC4SuP+49dh+5wK/Gdxxo+PifIJT+FeqUdTePx3bf1mh39aMfXkKdZwbMFw==
X-Received: by 2002:a63:1644:: with SMTP id 4mr3602556pgw.444.1587719981018;
 Fri, 24 Apr 2020 02:19:41 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:40 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:55 +0530
Message-Id: <20200424091801.13871-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 19/25] cocci: Add parameter
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
index b95f2632..0e807c9a 100644
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
index a328e661..f25f9b55 100644
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
index 555a82e5..8923a335 100644
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
