Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16B7C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:08:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4826206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZllWuOHx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4826206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A8B2E893C3;
	Fri, 29 May 2020 12:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPzZQppYf4zC; Fri, 29 May 2020 12:08:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F0CE893BF;
	Fri, 29 May 2020 12:08:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B86EC07FF;
	Fri, 29 May 2020 12:08:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AF61C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 39E0325D5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpsAhHmZ97Cb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id D3C8722098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id o6so585614pgh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBrn5GOGua0oqimGk46kFDdn4o25pJeN4ksGfT7ihn4=;
 b=ZllWuOHxGUcwFEvx8Io4wEhtcHOA/kw17iK+g0FtrPOT2U8Fv4nS8Rz/WpaljGJjmr
 DB6kVJWi38TqZMGj2cHujNk9GsAnKEOR/Z15QYeQ9k8sp+/yJwYbAo9frHz15H6KRcIH
 uzLCQ3w4Cp5+bHjpxYMGM/czmJdY/DZp04DlgwIp4cHxpgUBbP6A9V0TIEY9WXmco4R1
 xyR+Nl9Lwt/RO/DfzUw+zrhGIKvB8vRO0HuReLSB/f6yOCEDTUwfdr4gYsLBdYed0of3
 QEXK9ea5sqGzX0w2nJWXGMLf2dmYzmWDFLCcFUqMPnXeU6CNx5YNv9QBCt1+LIZbjTFD
 unkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBrn5GOGua0oqimGk46kFDdn4o25pJeN4ksGfT7ihn4=;
 b=qbZ4EtOFDfLNEIVidjyB6SRLmyLn0rEm7TIhoxcPYNmvUvr1WtziJ6RoEXQNGGnDUa
 Eqzq2oqyeD5rc2hPwrUlMK2+3F8G6USpXA1GItGGoaqaVTniGe0ehBNrO6kJbZ0t1E/z
 MskMSV5wAfzS2SABnXluKBa8AZt8Ok0gaeJZhf3S1Ir2glXiq4TjnNskIse9p93Kf4im
 N6Quu8VDUDhqAkMBlVp/vbZGJETlh0hrkW+MV7D51bZiXlhYLI74tqXtYwSVwWwV6LF5
 wId8dDgdPv43ktAZU/oCdUyd3jgOGsAcRGYundAjeIU/Idot7hYRh/LO8ddltauGK4AO
 7yQg==
X-Gm-Message-State: AOAM533X9iN22bt0vvfTMhViWyWGuM2589Oc/NflVZmissNFyGNnTziQ
 LrGkNLhi4Hf3RPjGf3e2MuM=
X-Google-Smtp-Source: ABdhPJyEq7hlsNLmOP0Dhk7j0w11w1GSkhlaG/JPz15yjRJqtZ+Dm4L8O5TxHb0JaFdS9IA4RxhgXg==
X-Received: by 2002:a62:b402:: with SMTP id h2mr8690566pfn.221.1590754134440; 
 Fri, 29 May 2020 05:08:54 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:08:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:39 +0530
Message-Id: <20200529120703.31145-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 09/32] parsing_cocci: arity:
	Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
arity.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index 0f64c113..90d0cd98 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -254,13 +254,15 @@ let rec top_expression opt_allowed tgt expr =
       let ar = mcode ar in
       let field = ident false arity field in
       make_exp expr tgt arity (Ast0.RecordPtAccess(exp,ar,field))
-  | Ast0.Cast(lp,ty,rp,exp) ->
-      let arity = exp_same (mcode2line lp) [mcode2arity lp;mcode2arity rp] in
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
+      let arity =
+        exp_same (mcode2line lp) (List.map mcode2arity ([lp] @ attr @ [rp])) in
       let lp = mcode lp in
       let ty = typeC arity ty in
+      let attr = List.map mcode attr in
       let rp = mcode rp in
       let exp = expression arity exp in
-      make_exp expr tgt arity (Ast0.Cast(lp,ty,rp,exp))
+      make_exp expr tgt arity (Ast0.Cast(lp,ty,attr,rp,exp))
   | Ast0.SizeOfExpr(szf,exp) ->
       let arity = exp_same (mcode2line szf) [mcode2arity szf] in
       let szf = mcode szf in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
