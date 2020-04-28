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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9091C83008
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:04:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA7720730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfHdJaea"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA7720730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6EEA5875DC;
	Tue, 28 Apr 2020 17:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4WXNIYMoeAT; Tue, 28 Apr 2020 17:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5DED3825A6;
	Tue, 28 Apr 2020 17:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CC24C0864;
	Tue, 28 Apr 2020 17:04:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FF0CC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7B34384415
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kjb3sXupHBPK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 67062875DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:01 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id t40so1425303pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+LCecuHRzdR/o7M/ikGH5G4JrMwoDyf73lHut0jbu0=;
 b=cfHdJaea6GdJ+OdQbhn4F5Ou7Kpvtbxkl8eoJLllM/XnfYnDcsd4lprG8i4SasKmn6
 SNhAYchRMI+oxGij2qdBfODjx1rmECLK5CGmEg7ACxZjpdhLWgV4wKuVrtcuxl8yeH/9
 m/AAq9EA8Wh/ScimvYz5bqugY7OmXxI3SGOs2Rpal9zKrD0QZvwmlqrjqEFEHnw+Xde9
 RpPAYXUHIMtUAaaH4T7YwFnbpq+7ByvFKdijDorWM8StKBss9wtjFhdPeif6uTzedLcx
 1xoVlgeIDn6h5j3dY0NrLRdNkO1dCCwjaTfZqoU+3DE/bNWKysvYjmFEeHJUky5RaKb0
 xO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+LCecuHRzdR/o7M/ikGH5G4JrMwoDyf73lHut0jbu0=;
 b=mwR7OaYaGX08rm6hxlppMTjMiR/hlqRV2mGL/+6m4x9kEJKUTytmoIwwApRZlfn6gQ
 Zq5gdWLoX9aQfYFbko2jmA01SW3wQsSW698Bor14ieBM8jBNmu7NvN+GPLD5Vchat+3O
 5iVVRuBccsfiQLnCV7AIEA9K9J9PpXcKVYpLGOhc94WjT8fpZPWEOu1gcVs1keTg1ZxD
 c+PM2vOk4aTUJStDpD8Yht3NA0Fnmrbmq5menhCefzO8pPyRKUJMVnWl5FNqDxILIAfi
 lE4qtQttBwnBPeGkyJHV4I9PrVhCFYDaTp16EIrzl8U8kEoimKa7MAvyqBqoyrUbgNYr
 89ZA==
X-Gm-Message-State: AGi0Pua35GxUo8k7WhsodDMJbsdpeb8hC5ixclwGgJLta3GlQMq6Odon
 3X7u1TK9bSBFeD0xjqD4kRA=
X-Google-Smtp-Source: APiQypIy5CTFMeQW13OAjizD6NjHNeoY2x6cpwm40OiDjsXhI9NhZM9xVjmFi8bTADF1I7mvRqTmfQ==
X-Received: by 2002:a17:90a:e389:: with SMTP id
 b9mr6061256pjz.141.1588093440968; 
 Tue, 28 Apr 2020 10:04:00 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:04:00 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:15 +0530
Message-Id: <20200428170228.7002-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 19/32] parsing_cocci: unify_ast:
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
unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index 68cb6613..25287503 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -220,8 +220,10 @@ and unify_expression e1 e2 =
       unify_expression e1 e2 && unify_ident fld1 fld2
   | (Ast.RecordPtAccess(e1,pt1,fld1),Ast.RecordPtAccess(e2,pt2,fld2)) ->
       unify_expression e1 e2 && unify_ident fld1 fld2
-  | (Ast.Cast(lp1,ty1,rp1,e1),Ast.Cast(lp2,ty2,rp2,e2)) ->
-      unify_fullType ty1 ty2 && unify_expression e1 e2
+  | (Ast.Cast(lp1,ty1,attr1,rp1,e1),Ast.Cast(lp2,ty2,attr2,rp2,e2)) ->
+      if List.for_all2 unify_mcode attr1 attr2
+      then unify_fullType ty1 ty2 && unify_expression e1 e2
+      else false
   | (Ast.SizeOfExpr(szf1,e1),Ast.SizeOfExpr(szf2,e2)) ->
       unify_expression e1 e2
   | (Ast.SizeOfType(szf1,lp1,ty1,rp1),Ast.SizeOfType(szf2,lp2,ty2,rp2)) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
