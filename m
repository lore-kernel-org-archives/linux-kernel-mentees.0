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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78226C54E8F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6D320731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDPQBORE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D6D320731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42B4F87A8A;
	Mon, 11 May 2020 10:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvBpyjPr7+-g; Mon, 11 May 2020 10:09:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4AAE98788B;
	Mon, 11 May 2020 10:08:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39C27C0176;
	Mon, 11 May 2020 10:08:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA6A0C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D543E85C9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDQhqZ71IcIH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 82C5685C05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:44 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id ms17so7557165pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q9ypuI2Md0mVYC2/fR1d5UCBTOm19QzTtQ7LOldzd/4=;
 b=VDPQBORElUs0peBBwiTiBD2gWwBzpUtPziiXlpv5sNSzHnpdtkszruGuKPCAsfRYr0
 wP9i+NehVIC/56T8mt/WDzzG3bI45yL+nA6ODxbfigssLUqGy36ethEbRxaKo+wjE0tF
 Bw573iLt6zrg4/iz0Y9rWmpWwBOiEa76usv+U+R6UVAnKiveGGIKumzt93NwrVgAUrc0
 vFCaZ55evsaHRrZiFOl/j5/OF6g2gQaPcMe8lUrnwCePrYp5VREMGARTMQ4Ylmqd4Tzi
 YBJG/3pFkDw230BszFES6fq/YEagiL79u4M4xk+lbvqJRrINuNwRhr1xgGc7qojt6jWE
 aWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q9ypuI2Md0mVYC2/fR1d5UCBTOm19QzTtQ7LOldzd/4=;
 b=qidHThY8XRppaMUYxt43oPvlhwKA25F2Fg3Rsia/RgRMrgf5xacGOy401Nm5lEvwnj
 2jUvTU2kEy/LFmnV8Of6fbXvdMrmM1UdxyfEaqPDlfflxl492d2CgIsi3umGZJeMHxwi
 DK0wgEMTsCgJEy9260abzUELfc/Osy3L6H7lzeXGwlkYPV8xkGDeAA+OYhM8S2WVXxdU
 Zs+6I4L/d3fecFLY3S8Bik30qspi+inQZVXMpw9nUqItMNMvPg5EDMSCwguofv7HbEyd
 5SXjnfn/Y70+8f7Rw01SnfgKKlhRS9a3Rbge6j+Abt5Lao7Qsta8Qmp4+SWx4/bGf1QF
 JCSw==
X-Gm-Message-State: AGi0PuaWLFxMvGnjd2OCYA3LDBhnjlFaKj813dARSo2uhGOTzFKi6ugn
 PNwIrtMdhMFWMhTSssCnvbo=
X-Google-Smtp-Source: APiQypLCV2GQU6UAA3/60duuEtJe6FT30ZHfkKg8NF6S+4S8yIvhypy11Q/lpPIJCIVwt+gojjD1UA==
X-Received: by 2002:a17:902:527:: with SMTP id 36mr9755108plf.69.1589191724013; 
 Mon, 11 May 2020 03:08:44 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:43 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:00 +0530
Message-Id: <20200511100715.19819-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 17/32] parsing_cocci: ast0toast:
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
ast0toast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0toast.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast0toast.ml b/parsing_cocci/ast0toast.ml
index 09c28c06..56f684ee 100644
--- a/parsing_cocci/ast0toast.ml
+++ b/parsing_cocci/ast0toast.ml
@@ -439,9 +439,10 @@ and expression e =
 	Ast.RecordAccess(expression exp,mcode pt,ident field)
     | Ast0.RecordPtAccess(exp,ar,field) ->
 	Ast.RecordPtAccess(expression exp,mcode ar,ident field)
-    | Ast0.Cast(lp,ty,rp,exp) ->
+    | Ast0.Cast(lp,ty,attr,rp,exp) ->
 	let allminus = check_allminus.VT0.combiner_rec_expression e in
-	Ast.Cast(mcode lp,typeC allminus ty,mcode rp,expression exp)
+	let attr = List.map mcode attr in
+	Ast.Cast(mcode lp,typeC allminus ty,attr,mcode rp,expression exp)
     | Ast0.SizeOfExpr(szf,exp) ->
 	Ast.SizeOfExpr(mcode szf,expression exp)
     | Ast0.SizeOfType(szf,lp,ty,rp) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
