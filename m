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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870A9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE6B2074D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCcKEUxv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AE6B2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3B412893BF;
	Fri, 29 May 2020 12:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMqeuY2zoj7G; Fri, 29 May 2020 12:09:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1F9A893C4;
	Fri, 29 May 2020 12:09:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEFA3C0892;
	Fri, 29 May 2020 12:09:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D2BCC0890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F20F920410
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRrXoX3CnoAh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 68591220A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id e11so1304936pfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=czkNgC7mHrVkpHFh8w/m1Lw+qJX/QBELh3ArVedEAQ8=;
 b=WCcKEUxv4R6etWVSEryxZlOgmizrjiCdQeHPc/G4f0M9byHeN8JFku4gq0eS7VtKZO
 Kv4TzUc5rwy7xtHPZFF4RXvA26l1Hg+n0r0wIIE7xC5Po7AXmAduiuVj31KdODM33eRN
 2OjxEDvBXp4FTpuou2E9dAREDxd9wQqIDb9ASC5Aeno/vtLvN9C/b/zt3Dz98SrjOoBK
 scUR4gY2omNPlJX0I//Ujv6yCclrGZ/6D5qhmAverFTGwpvOSTtjg/CW9RiT+NZHe4e4
 a1XTACkWhTBOgprdSVl4V1SHitFLqKQhGrPzrPW2CRjaVJIIQCZQIEFV6IxwWRYWHAxs
 QzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czkNgC7mHrVkpHFh8w/m1Lw+qJX/QBELh3ArVedEAQ8=;
 b=g2P03ZF68O3+QhQgMSSsn5XmM1PF4VnHIbaD8j5X4v96jiP2vLHwBWuoqS8kYaB47U
 x6EQ+SXYygCEx1qJyksGm1hzjDf5sevO6zuti4yh+0E/3MXNtE2fBHl1D6LUJzQrD6is
 r3UHEXkX2xDPIIVdrppg29p0Mx7b1YmXX9VdQdcchE+xUubwgbXIHa+8SeMSnWBXn/Hd
 tjnvp0gD0JewEBVb9/p5CRa8c/y3M+f4rUJnivzGKnMifDmLs7VORhPD7uaSQDGjaoGR
 9HlkNeDwfzz03mS3vEmSAWuHc5Sun0I+JDWnfmWYL+37Ec9jA61iYUQknyLQE6y86Tkw
 wfRA==
X-Gm-Message-State: AOAM531RqgfHpCHsdN4ZjkzB//xzNBt6wwyIi2qZE73FserBL0VY4BVt
 3AXcPLy4HSNelW6MOWZodRm2tJTK
X-Google-Smtp-Source: ABdhPJyqFY20odkcdEQYk9rV3z52QKVuP5XLSAlnHaCo8MCwMJDhlykek8FoCM6IgHiKFfMr7yZ4nw==
X-Received: by 2002:a65:67d6:: with SMTP id b22mr8064885pgs.14.1590754142940; 
 Fri, 29 May 2020 05:09:02 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:02 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:41 +0530
Message-Id: <20200529120703.31145-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 11/32] parsing_cocci:
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
index 5c739d8b..99029212 100644
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
