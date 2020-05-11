Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2B6C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123CA20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBNPM+Vw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123CA20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4A0C87853;
	Mon, 11 May 2020 10:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CO13uxEBzhqI; Mon, 11 May 2020 10:08:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7C2F986E3A;
	Mon, 11 May 2020 10:08:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C168C0178;
	Mon, 11 May 2020 10:08:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11507C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00E72863DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuIla5oa5idt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9DB1185C05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:18 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f15so3740089plr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hng7/Ni+h9OoD4yErxJiv2mDpyB/SRBbLSaLYVxbSB4=;
 b=eBNPM+VwvOFEBMRzBNLaJn9j4sVksfZkgKaFKSywEPwplrmJ0XwJIvhL65FleRO8ax
 gnd+XAaZ29sq01sUtbOSysqrS2bWQduB8J1uYHe41N0xb5ibHeyQoFW8z7kPJ/2t0D1k
 UFgIkBff1mbV3Yaj1LT+Nw8q6BbEjNsfB60fPAgQ1WaESZ8QFXsPLUgfCwLdqWkemnDk
 s6bO9N0dym8tnKcYyLMGmjBECcIj49DhVyHlEt6m1xlMUpkA636NWhVlCz6NbUs4ceOx
 kEvLJvAM9l1Kb4aWWEGh3ETWc3rwhYeMiZ2BoCudTLbQwZGD+YsJNX8MaGY6z43AJC1L
 V0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hng7/Ni+h9OoD4yErxJiv2mDpyB/SRBbLSaLYVxbSB4=;
 b=fbwjaeolvmrL4zK4isvV5XpMslDeR7e1wlDB4fu3vARNltsR/3LuyS9u0ouXzS8LWz
 ZnkUpq7bhRR9g1OTwwdSjQfit8nkC2Z67PnmaC9Aoqjy8A147Oq8pEgAwlYn+I6iTeBz
 jHxf6n22poaoQwgDH/HBbvsWiCmHPdK9OgUMl6T8hWFhSgY3UFcwpujFDx+2PC/Y8hLD
 7Pj1zus/uoSEWpxIdLQ8JhnNPjAUK/O7ms4yvAWRWgkRORL/j1A8NWumpKi1rsqbUCNb
 rOHXURiAA/ZcEzIi1X3J89gkBMguAkZfDdeGvX8vWvcFvzqRRJo4Tf11JHmt1UCLgypy
 /vXA==
X-Gm-Message-State: AGi0PuZoSGKWSOj3JpZW7hL/JLI91wW941vkgzcw105ODqklfUrb64Am
 UBlZHnuHOXppteuG9sclnNUJv1tYrrI=
X-Google-Smtp-Source: APiQypKPnMQJ2TjX+RFesXfUCn0o8JDm0DR6m4E21VPMjd4SMjzRwMY42ghh5f1OgAfJFrgthZ+YLQ==
X-Received: by 2002:a17:90a:f404:: with SMTP id
 ch4mr21417444pjb.123.1589191698199; 
 Mon, 11 May 2020 03:08:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:17 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:54 +0530
Message-Id: <20200511100715.19819-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 11/32] parsing_cocci:
	compute_lines: Reflect Cast attributes
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
compute_lines.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/compute_lines.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index 1361d842..e945914b 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -425,11 +425,12 @@ let rec expression e =
       let ar = normal_mcode ar in
       let field = ident field in
       mkres e (Ast0.RecordPtAccess(exp,ar,field)) exp field
-  | Ast0.Cast(lp,ty,rp,exp) ->
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
       let lp = normal_mcode lp in
       let exp = expression exp in
+      let attr = List.map normal_mcode attr in
       let rp = normal_mcode rp in
-      mkres e (Ast0.Cast(lp,typeC ty,rp,exp)) (promote_mcode lp) exp
+      mkres e (Ast0.Cast(lp,typeC ty,attr,rp,exp)) (promote_mcode lp) exp
   | Ast0.SizeOfExpr(szf,exp) ->
       let szf = normal_mcode szf in
       let exp = expression exp in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
