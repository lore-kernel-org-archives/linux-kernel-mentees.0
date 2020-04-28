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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66B7C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7F0205C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="soKK2RN4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C7F0205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 55F4086E1A;
	Tue, 28 Apr 2020 17:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSyAZPiwIkbj; Tue, 28 Apr 2020 17:03:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 551008625C;
	Tue, 28 Apr 2020 17:03:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35070C0864;
	Tue, 28 Apr 2020 17:03:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54145C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 37B3C20436
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVvoI6M8lpoe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F5A520372
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:55 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id t40so1425183pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P7a3ovJfYqH7rlgS40CehEM91vUo6sSt21YTgxgCWwc=;
 b=soKK2RN48HrG7sZ0WLfHHYjtb14+pc2bJolqlwtJXoHCUNJDjcpAqI15I0dExCBJYV
 QHzIePW+DugeqhHezSK23zjTqjMMfv6B25c5wECrDTK0uVK+JPUH1sHJdnXl5IzAY9Af
 A1c0qGdMXG+c74O0WBAkPT2kNOAnD3nKYdwUkFue8WWt6KSVJnV8loWmkFAJAtsUco6y
 POLUD1bzTRQw9LcMlLEvteHAOCrZDgNRBIo7VFEIE85Qo+xFZYRmkiLO1jXowu60fYh/
 fGqI8Msjxqo12KBCyxMZhXXLGoWtSXcuhS4RoeueHpjdtcykmPeFUeeozcvcBvblHF/2
 V5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P7a3ovJfYqH7rlgS40CehEM91vUo6sSt21YTgxgCWwc=;
 b=bm8WNyrafqgkqn3MGMZ+18VyuIN1PztpVfyMVkq+4m/uSvHzt9UJKpeHSI3THOycMJ
 WGg6AB94ryHXPq+Etar4Ok0Jqeb5BCFiLC+tQ3ExKCkbdx2HToM7alyH5kEpl8GAhGuU
 3cZrZSEwMcLoZhXGtrftPGawp5GmnfJgPz4yYLKqF+NJwOvbYMnK1zjJj0+58lkb5phf
 LdQlb/RUaXu57kvZ5JIz0Mb8fEeEcxB0gBH5LBvs311SVC3JMLfEG26x7YJXJZ/gL25Z
 emuFCeIr4/1Qna6iu+QiETJWqSzk5i7zBi460iietmPhAbICyu2DKjGBes2HOLKlzZBu
 w4Jw==
X-Gm-Message-State: AGi0PuZbR/vIY9TPWAlUZLw7/orXy6FJB1j7nxgX9J+J2FlQceVZZGMA
 bhGlXOTLGV6u4EpbFKqah3Q=
X-Google-Smtp-Source: APiQypIVm7wfWSJbO13qHxe0INpVjgr3A8Brs8j4wHhmvFcyOatnxPRDlbybYnLFul+c/kHQzbZYTw==
X-Received: by 2002:a17:902:b709:: with SMTP id
 d9mr29006584pls.118.1588093435186; 
 Tue, 28 Apr 2020 10:03:55 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:14 +0530
Message-Id: <20200428170228.7002-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 18/32] parsing_cocci: disjdistr:
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
disjdistr.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/disjdistr.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/disjdistr.ml b/parsing_cocci/disjdistr.ml
index 6724bb25..e171e6ea 100644
--- a/parsing_cocci/disjdistr.ml
+++ b/parsing_cocci/disjdistr.ml
@@ -219,9 +219,10 @@ and disjexp e =
   | Ast.RecordPtAccess(exp,ar,field) ->
       disjmult2 (disjexp exp) (disjident field)
 	(fun exp field -> Ast.rewrap e (Ast.RecordPtAccess(exp,ar,field)))
-  | Ast.Cast(lp,ty,rp,exp) ->
+  | Ast.Cast(lp,ty,attr,rp,exp) ->
       disjmult2 (disjty ty) (disjexp exp)
-	(function ty -> function exp -> Ast.rewrap e (Ast.Cast(lp,ty,rp,exp)))
+	(function ty -> function exp ->
+          Ast.rewrap e (Ast.Cast(lp,ty,attr,rp,exp)))
   | Ast.SizeOfExpr(szf,exp) ->
       let exp = disjexp exp in
       List.map (function exp -> Ast.rewrap e (Ast.SizeOfExpr(szf,exp))) exp
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
