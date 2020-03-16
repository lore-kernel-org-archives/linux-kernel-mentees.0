Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986F5C5ACD8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CF020724
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOOlAVXD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CF020724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E47C89039;
	Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vEyBj8AYYzM; Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C35B88672;
	Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18B6DC1D7C;
	Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26FBEC1D7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E71E428ECC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEEiaUpBrUUL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 8261C27F2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:05 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id a32so8609824pga.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yG6jmrgNVmdX8cemKmNhpv4ahVdrMFnSV8o9QTHxaI=;
 b=kOOlAVXD2KL+mvUNoIOGkuZMUgeYNFvcnpZMQmcCBadrMjE7vzttzfEWCFArnKHcMO
 bYCUeEBscn9Tx8tEQ1ZTBG5aowhNWxoI9S0H5qSFI1Q/diVvXzreaG2aZIVl55HHXJIG
 BWOcn5CQklRLDr4cVTnBY/cRpjvfBL/grOLgRX0SJXHh7RTO6aduB2PTPQ+jau1JLjeE
 ZPE/bTqKFP8cCsNoAzgGNR8CLA3/Q7cM+Gr3KbjOKov4AWkq+U1Nw+XUOqBCpHu7EcDL
 juubw/v/Z3jNW+5A3vakRU68Ya1hHpvnqolEtU63BwsqKtqxZ+F44zN9OXecyqHgEMJW
 heQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/yG6jmrgNVmdX8cemKmNhpv4ahVdrMFnSV8o9QTHxaI=;
 b=VD5pLRazJ9bADbmnHa2AJ8RRiOUO7hTxgVajMl4gYTbLPZr7Q1n6eng7ux9LW94crf
 6J3ENgDnd7elMV1AaX1IYnQ6nHK0fx4RDEBpZSLXkZDLcGhxZU60KC/oeCR7Esi19Zgw
 TNtuV+ErfmkUWSRCs+Y0IciW5b6CafkYQbxGdyDgQrcd1Ynp4lEYQtLAyD4yING0wcFh
 YS/50OrJcFp+N6rNfxiTY1wxv2NIIMN2JR1GlTf8xVVBxdOP3oWLOgFH5vXfg1hqe8sy
 P526K6uXzyMh3vHafivoi/0ahPV8z19My7tIrFV3FtsPU9h/xpN8i7CoB7yHBTko7Qbj
 mnDg==
X-Gm-Message-State: ANhLgQ1TexesiAHQocweM6iHuypfL9Bfdi5b4qPunMqPhqHDLMAXgRS4
 p9ciHWrcqHztvgzdbp7HLfKAucmz
X-Google-Smtp-Source: ADFU+vt9JMyhaH8MLEAWhPIxEXOIObfJHv2oIwNsUYIiR7bUlHatRtwTohx13jBaUqQNplTN24SZDA==
X-Received: by 2002:aa7:9906:: with SMTP id z6mr28181939pff.112.1584353045063; 
 Mon, 16 Mar 2020 03:04:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:04 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:03 +0530
Message-Id: <20200316100319.27935-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/26] parsing_cocci:
	single_statement: Add cases for ParenType/FunctionType
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

ParenType/FunctionType are now types in the SmPL ASTs. Add
cases for these types in single_statement.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/single_statement.ml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/parsing_cocci/single_statement.ml b/parsing_cocci/single_statement.ml
index 46408b73..48d77b5a 100644
--- a/parsing_cocci/single_statement.ml
+++ b/parsing_cocci/single_statement.ml
@@ -166,6 +166,8 @@ and left_typeC t =
   | Ast0.Signed(sgn,ty) -> modif_before_mcode sgn
   | Ast0.Pointer(ty,star) -> left_typeC ty
   | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) -> left_typeC ty
+  | Ast0.ParenType(lp,ty,rp) -> left_typeC ty
+  | Ast0.FunctionType(ty,lp,params,rp) -> left_typeC ty
   | Ast0.Array(ty,lb,size,rb) -> left_typeC ty
   | Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) ->
       modif_before_mcode dec
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
