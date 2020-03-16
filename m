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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20063C5ACD6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD0A72051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBcvpOv4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD0A72051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AA20D291A9;
	Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCr-HtMs4nfB; Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C5A6B27BB6;
	Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C240BC1D7C;
	Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98E5DC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 86DA688672
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwB+G8WwqJt9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9F28C89039
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:36 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b22so3469231pgb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z5Vt+kSyi/RcHyrlEg6BWuNNcdeP5nA5wISFF/Yfsqg=;
 b=tBcvpOv48ZK8ACvgScx0mxSLE+Hey+IZqt2tohXLrgqHu0c+21ju+0ghXWth9t5Ug5
 BAA6gGK30H9vjpcaMWKYMkI+0KpXfZhY4gedt/vVbCkyFXxpQb/RC6HDqkLaWzVPw117
 ECzJhiJY+CgiTk24EY/NOuHokWNrtSUutZBeKISTQ3Zdq0i0CbAtLD0qNJX7db/UOgl4
 5799C99aguxskhsBdSVvmPY2XK/3jOdFjIaJazKeSiiuwlXC/Gof41kXtODyqf23xBAI
 q8Ts2rrhEeYn5gSetEFbVx4mN6eCgF1RmEnetRyoZ42KxCAYKGUkQpDuJPfIy71SZpGn
 ratg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z5Vt+kSyi/RcHyrlEg6BWuNNcdeP5nA5wISFF/Yfsqg=;
 b=YOHDzkKub1+YgUfB+N6zGosBHVVEySoMcLyqlfof5V7D9xCf7wvB1EYuXAr6TtnHtQ
 2IFU0n+XJJQFzyfD8fwFyVOujh4YkK3C/fkC9lhdEFpDg1SY6F3Hd62oZyq3bQgU68cL
 trr0BW0eDwrfl6ruCa2CAkDrHbmMeVRMoBuSoPhvD6DWnZsYKCIQpkg2AS9N3r8HdUCA
 7qQq/5EW50LxjYBjOaOLLsyn2rMP5oc6+0EyQ4TAHCX4JlMYminQvGddoB5DYLKfgxYo
 xdkWvZfBmSOT1ZQ95/yhpNFbKIR+NqGJrKGR/Ae3Hz1/gFvgiWkF5E0FpwvF7TAtmCzU
 Hriw==
X-Gm-Message-State: ANhLgQ0VdBTZbGzK20r72A2H3VUkIazpNyo7Hw+7EsTAKw7g9pdg8iz5
 XbMF966I0U90PW66C2nDzHWRH49I
X-Google-Smtp-Source: ADFU+vu1fbwM99gGzkn5JRcy+wsFdkIsZIGs7yw7uir9cJyWQX0bcgG0e/LZv08nzezdG+CL77y/Fg==
X-Received: by 2002:a63:4b07:: with SMTP id y7mr26016286pga.272.1584353076167; 
 Mon, 16 Mar 2020 03:04:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:35 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:11 +0530
Message-Id: <20200316100319.27935-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 18/26] parsing_cocci: unify_ast: Add
	cases for ParenType/FunctionType
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

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index d4ad3030..de86b1d3 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -336,6 +336,14 @@ and unify_typeC t1 t2 =
 	 unify_fullType tya tyb &&
 	 unify_dots unify_parameterTypeDef pdots paramsa paramsb
        else false
+  | (Ast.ParenType(lpa,tya,rpa),Ast.ParenType(lpb,tyb,rpb)) ->
+      unify_fullType tya tyb && unify_mcode lpa lpb && unify_mcode rpa rpb
+  | (Ast.FunctionType(tya,lpa,paramsa,rpa),
+     Ast.FunctionType(tyb,lpb,paramsb,rpb)) ->
+      unify_fullType tya tyb &&
+      unify_mcode lpa lpb &&
+      unify_dots unify_parameterTypeDef pdots paramsa paramsb &&
+      unify_mcode rpa rpb
   | (Ast.Array(ty1,lb1,e1,rb1),Ast.Array(ty2,lb2,e2,rb2)) ->
       unify_fullType ty1 ty2 && unify_option unify_expression e1 e2
   | (Ast.Decimal(dec1,lp1,len1,comma1,prec_opt1,rp1),
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
