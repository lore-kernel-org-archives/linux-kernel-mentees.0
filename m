Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4458CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11965206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPJ0VOlF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11965206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DF8488757D;
	Sun, 24 May 2020 17:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mevewC+aQULF; Sun, 24 May 2020 17:20:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87EE88746E;
	Sun, 24 May 2020 17:20:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 764C7C0178;
	Sun, 24 May 2020 17:20:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB718C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B73D5221FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csZc68+GXRhw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 1FD3F20022
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:44 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z64so3343308pfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CIT4ulcINpSBAMknhc5mGb5HbX9zV5kFWcp1NsjcRxY=;
 b=BPJ0VOlFfsKKSzPec7CrqCHH8wuGv1L+AUhF2otkAmCqO3LKiHSbwDbQV0H9C+hT2d
 vlX74CyhLVLre5GWPq5p4p1IF9VD9TL6bu/UgIEJzudgJs47kPwhUOyRru89yok3UcRz
 12U/ojy0dRNO6NyShvp8ZmrFdbb64wlXnjhb1g4DfFShXh78weQfDYGUXSgqofi0g5XG
 DFoRIE5LWB6twzCOiLnVM8rfVoUqc6MVldy+pe1GoHsc/E98JGotaQnQMWjUd2VpccOx
 DfMDhCiWAXB2UsIz7etzFlAJFh7H+Z4KRB4kSfYljJdu6K8b291v3mUmXj96US/Ebe3i
 YRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIT4ulcINpSBAMknhc5mGb5HbX9zV5kFWcp1NsjcRxY=;
 b=WyZGRohoZ+FKfd5QcLyURQAPpIv7TbtoCOha5zwOzBwDcXGpTvOgHqIAqBrPI9J2w6
 ADpltY7EPqpNlwjtNoChF4ftEgPyLEvszUozkNIzGCUdX8Gc/n+V6zxUcwV8Gs89ybeA
 tHPvMK+/mZ4lFBMD6K3mdgZ4LEvMfuAzmLbzMCAmZTXl3vtPNcU2T2IEbV97rgmi20AY
 wxfGE0Nh3YQunFPIocmb2nag60foJJNpRID/ReO0gzzslLqIk7ahO4Ek08K7/b9aTjZ5
 vn0G/bJZgG9YTwYcr/IMp+ppwjRv+RMsqXTN1f81OJN5+9AnhTrzAveq4CE8UjDRaPQ8
 WfbQ==
X-Gm-Message-State: AOAM533CupTDnIDbKYznyrIELQHU6+1WsDT96WgmYMmMuVemY+qtYihM
 y0iZBOtEYRvEX1d9324GBy8=
X-Google-Smtp-Source: ABdhPJw+77kDDLQn1On68qbHo3AmPG4Qb40VIxJWOYxg7AEl3IN6KIS3iZDIjRSCpbvZg7jMzetAVA==
X-Received: by 2002:a63:348b:: with SMTP id b133mr2537096pga.319.1590340843671; 
 Sun, 24 May 2020 10:20:43 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:43 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:13 +0530
Message-Id: <20200524171935.2504-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 08/30] parsing_cocci: arity: Reflect
	Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
arity.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index 8ee6d33f..1c74aa8b 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -595,7 +595,7 @@ and declaration tgt decl =
       let rp1 = mcode rp1 in
       let sem = mcode sem in
       make_decl decl tgt arity (Ast0.FunProto(fi,name,lp1,params,va,rp1,sem))
-  | Ast0.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
       let arity =
 	all_same true tgt (mcode2line lp)
 	  ((match stg with None -> [] | Some x -> [mcode2arity x]) @
@@ -605,8 +605,9 @@ and declaration tgt decl =
       let lp = mcode lp in
       let args = dots (expression arity) args in
       let rp = mcode rp in
+      let attr = List.map mcode attr in
       let sem = mcode sem in
-      make_decl decl tgt arity (Ast0.MacroDecl(stg,name,lp,args,rp,sem))
+      make_decl decl tgt arity (Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem))
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
       let arity =
 	all_same true tgt (mcode2line lp)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
