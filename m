Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C15C83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1E6205C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5f8h2R0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D1E6205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74E8D864C3;
	Tue, 28 Apr 2020 17:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgGWUPqE4ZEw; Tue, 28 Apr 2020 17:03:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D21E5864CD;
	Tue, 28 Apr 2020 17:03:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2214C0864;
	Tue, 28 Apr 2020 17:03:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B9F4C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1800A8829D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMigwLYHgr2T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BBA5987118
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:30 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 145so10952489pfw.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1Jx1GCzpkJYz5KJHR+2EEkLhsdfIdOz4vT4XJi1p5g=;
 b=K5f8h2R0vvMeVxVe/UYiPoET4qa9uU0UfJLHLsZXDh1Loshrh5vb09cHVa0UWox3bb
 hagNiVa2E9eILHgF89JbizRFw3Brj6R6Aul5YcVqWc1Hov+d4Xu9+AYJ+BTA3sS8iuSv
 0LHCl9IaDwIFhaEb18Uw977lVMVnUKBBpf8ZmDJ+/nrT0V2KLs1Bsy3lnZugWoNvVFz/
 vJrlgZYWdpnleS7QBPYTi1OKnTk5RPYFIiWvsgQ1UwcAH2d8pOA7daOyulOyFEfZc9Yw
 3/reGj5WXJfQPnZ85BceOLJ3OnaJFVDPXT5zxf4nMBe93nwTn7OtwboS32ljABU7UMDY
 HLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1Jx1GCzpkJYz5KJHR+2EEkLhsdfIdOz4vT4XJi1p5g=;
 b=fwe5AVWBHk9ImOqppNOULJruRGvDprmkSmaq5EOA4r4BxCRh4Qds1c1a87hhGGB9FA
 Du5T49+heMSGwbonNaL8Di/pddGDjqqAwJVB5OBXOi8hZT44HZPvucz4JV4fznIhly7O
 MeWdM6wvS9k8KzPm8EoDqn1PFlI+wNHI4ww3rPLwpB1sQF9seZgfFv2Cx/XhF34Lj9Ej
 W+D5v3HTfuE4mg7j4K+LR4NAnpN1JTIJF45E+Y4AbjiBZMEZ7TCJYtWLngDdmesDn8sF
 6rddnpIZGIQfSbsNE3i7odZe7Tl7XgHO/3GbAen4O97uaqHDWmX/Ug4q6eQz97uDWQh7
 b1QA==
X-Gm-Message-State: AGi0PuaQLx3IiDX3J1BkhsL0cZl3KI8MS1WFyCHRThVZKGd/p/SKweC0
 jyBR1h5lf0WJqJPZI2boKAc=
X-Google-Smtp-Source: APiQypL3PnnsEJMscFae2z/IleJpAvLlGBSGCzmF2K8s4v2sicN2wEGOr40tVKlfjfQApc5vYWMUTg==
X-Received: by 2002:a63:1709:: with SMTP id x9mr27513566pgl.390.1588093410257; 
 Tue, 28 Apr 2020 10:03:30 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:29 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:08 +0530
Message-Id: <20200428170228.7002-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/32] parsing_cocci: context_neg:
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
context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index dd768a61..b6378512 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -628,7 +628,7 @@ let rec equal_expression e1 e2 =
       equal_mcode pt1 pt2
   | (Ast0.RecordPtAccess(_,ar1,_),Ast0.RecordPtAccess(_,ar2,_)) ->
       equal_mcode ar1 ar2
-  | (Ast0.Cast(lp1,_,rp1,_),Ast0.Cast(lp2,_,rp2,_)) ->
+  | (Ast0.Cast(lp1,_,_,rp1,_),Ast0.Cast(lp2,_,_,rp2,_)) ->
       equal_mcode lp1 lp2 && equal_mcode rp1 rp2
   | (Ast0.SizeOfExpr(szf1,_),Ast0.SizeOfExpr(szf2,_)) ->
       equal_mcode szf1 szf2
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
