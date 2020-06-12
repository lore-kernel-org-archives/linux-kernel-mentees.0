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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC23C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Jun 2020 06:46:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A83207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Jun 2020 06:46:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+QGhNnM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A83207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B0C8B891EE;
	Fri, 12 Jun 2020 06:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zN+pZgWUIxwO; Fri, 12 Jun 2020 06:46:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 342A48913C;
	Fri, 12 Jun 2020 06:46:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30980C0881;
	Fri, 12 Jun 2020 06:46:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A1E8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 793688919B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWwWBG3qjaOF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1A11D8913C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t16so3359327plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 23:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnEr7qzQW3/zvUdkvr5MBD8uoSpGlLUJmDraCT0xLAI=;
 b=s+QGhNnMuhsjfN9rN0QN0RUjjtUeoz7mDB5tk8zBYLeKzr4EgFhgyoDcYyHfizQ9u+
 GtXdTtF9RgNxemv2vMR+4wV0bQqwsLVRidrf8hZgRd+0y/Md06ZYQhk7jX8vo3BbrZLs
 4dleqrHGOfPS3gtAPqekMRDktY9O8M5JR++e0E8SfdaWKQxjCFCdcOhE7vbUvX1AmajC
 JAcYThYvl6mORF/LEOmUcaa2gAd+waOaMyMtmTdF9u0LvA4rDUiFWObist1kpaPgnUrs
 EGbXPSecbAMtUPhGErWt/R7jv3xIlSn5LdmYpn6+8WWvuE7w7jDHunanBeUWAyQKeOhj
 jw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnEr7qzQW3/zvUdkvr5MBD8uoSpGlLUJmDraCT0xLAI=;
 b=L4mk6ZaYQ8P7CX2T3RlT/8pqnSKyhRHEAyyufHdya30B84uT1F98RcJTZmkoKNhnNg
 UQC9K1ikNLUh3zKLZ4hEm8iiJvBo8J1kdD+/UImubpD4+h6szXTt5gUOdJQcAxEweono
 UTW76frCmZKxd9mbb16/htC4J5qZaBYDGGY2Nur1D/FSc5DDV1GnMz8g7uHeMI/PL3m7
 yRiJ83Fas2fx4zP+14avq6jrwj/bPinnwSFUegCLEbufjHh0NmezEMDe/Dncs+PLlYJj
 aNJ36KqgRxnGceeX/M1B2HBenxT/idspyRdYC+IJuXd/n3WP/dXSE0ymPcUwGMbCg8B/
 VruA==
X-Gm-Message-State: AOAM531u9fLTPRzaiP4OsNMBTXyJKHrGPpaGcDBPc9/ljGfXdUwRIrD7
 4ccx/4BMtICGpg4tGSHgkmo=
X-Google-Smtp-Source: ABdhPJzRoWiepYm/v3AVQdDi+1fdXJ7/ARZLECrfrMb1wTwzb2CnQckTJijo7BE1F2S35wEzMdh28w==
X-Received: by 2002:a17:90a:df98:: with SMTP id
 p24mr11744151pjv.135.1591944378599; 
 Thu, 11 Jun 2020 23:46:18 -0700 (PDT)
Received: from localhost.localdomain ([1.38.217.229])
 by smtp.gmail.com with ESMTPSA id w192sm5087476pff.126.2020.06.11.23.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 23:46:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 12 Jun 2020 12:15:43 +0530
Message-Id: <20200612064544.30194-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200612064544.30194-1-jaskaransingh7654321@gmail.com>
References: <20200612064544.30194-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/3] parsing_cocci: context_neg:
	Apply equal_mcode on cast/param attrs
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

The following commits introduced some poor management of attributes in
context_neg.ml:
	2b7e99a5b86d41e05980c8a9d98eb931e42bb4d8
	08f1cd9fb83ec400435e0ad8fdf579ec8f9c0f21
Apply equal_mcode on cast and parameter attributes in context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index 41bc621f..6e992245 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -630,8 +630,10 @@ let rec equal_expression e1 e2 =
       equal_mcode pt1 pt2
   | (Ast0.RecordPtAccess(_,ar1,_),Ast0.RecordPtAccess(_,ar2,_)) ->
       equal_mcode ar1 ar2
-  | (Ast0.Cast(lp1,_,_,rp1,_),Ast0.Cast(lp2,_,_,rp2,_)) ->
-      equal_mcode lp1 lp2 && equal_mcode rp1 rp2
+  | (Ast0.Cast(lp1,_,ar1,rp1,_),Ast0.Cast(lp2,_,ar2,rp2,_)) ->
+      equal_mcode lp1 lp2 &&
+      List.for_all2 equal_mcode ar1 ar2 &&
+      equal_mcode rp1 rp2
   | (Ast0.SizeOfExpr(szf1,_),Ast0.SizeOfExpr(szf2,_)) ->
       equal_mcode szf1 szf2
   | (Ast0.SizeOfType(szf1,lp1,_,rp1),Ast0.SizeOfType(szf2,lp2,_,rp2)) ->
@@ -842,8 +844,10 @@ let equal_initialiser i1 i2 =
 
 let equal_parameterTypeDef p1 p2 =
   match (Ast0.unwrap p1,Ast0.unwrap p2) with
-    (Ast0.VoidParam(_,_),Ast0.VoidParam(_,_)) -> true
-  | (Ast0.Param(_,_,_),Ast0.Param(_,_,_)) -> true
+    (Ast0.VoidParam(_,ar1),Ast0.VoidParam(_,ar2)) ->
+      List.for_all2 equal_mcode ar1 ar2
+  | (Ast0.Param(_,_,ar1),Ast0.Param(_,_,ar2)) ->
+      List.for_all2 equal_mcode ar1 ar2
   | (Ast0.MetaParam(name1,_,_),Ast0.MetaParam(name2,_,_))
   | (Ast0.MetaParamList(name1,_,_,_),Ast0.MetaParamList(name2,_,_,_)) ->
       equal_mcode name1 name2
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
