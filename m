Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1941C7C8A2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B54E120663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7A/x+0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B54E120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B96185F44;
	Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKhwk0ysMZz5; Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0A76585F29;
	Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01990C1D74;
	Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A227DC1D74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8C86585F37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hl3ZHoeRTZn1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 78A5B85F44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:04 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 18so7703344pfv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R+I2fipbkPh/x4luyQPKwshG6xdLZBLuUkkno04EsbE=;
 b=C7A/x+0cTcOtHIp/r0N4M1fTJsC+l7JjXhvYSluP1mNnw4fOf70AEz1ri5nL9Gyqpc
 BmYahTsV+hryK/LSk1l8aKpE1T4wEWDOiorzeGfSzQd4otAmpYpFmjFUIEXaVKQ99aY2
 IHeVxK7lRF1XJxalE071O6b7a5sHbN82NBaiS2kjHxJPljrvkueNn56vIV/+rNJ72toV
 hfp1EZNPxprzlAS3mPVUyi3wZXg67DGtXUCn6aDxF6FnwSHq3L3WPWG1S0ZP//BBW4Rk
 8zSQ/VdK+7RZ0bYxgJbdmnsACYkP+zlzYmlZdrAnYrYh2CG1YUTshn2uAigICIhMLJle
 eofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+I2fipbkPh/x4luyQPKwshG6xdLZBLuUkkno04EsbE=;
 b=XuWo4DPRP9WqznI3+9Y792j+UY/2dtU7guaXfMWQEl9xTM0xHbyLMMVMeUqsg6eNrt
 pDqVKHLsxavqNPbde8vws+PLTY8w7moeemwsvKEXKKoSFEZ1E3FMiQtpBgtfT+HYnyCb
 iO1Eq5h1oBsC2cxVgF+oiJpkBd4ucnOdqwtJAPUTv+8DVGOPegYWlcFJWiXjI69/Q2kx
 L9M/QF+le7m/nYhCdYJRVcrxCB+9nrjdExOzJL9FIrNYV9LZqTaEIklTvQ0CexiTlZcr
 YaBoMHFali5b94h/+mvJPr7f8q7lL2lM2bQl1fH8xBGXablVFPvcEtZ8UfGBlUW/cttP
 x44w==
X-Gm-Message-State: AGi0PuasNhqlxzfU9pXViGbw3WdappfvD4vcoRxJFqiGGaz5832ETD9r
 uX7r5nwIZFUPDMiAeWMyA/k=
X-Google-Smtp-Source: APiQypLdbN4EeakYJ5OUp34/aA5yKBmFxdsrRqwoilpp6zmvhgv+jQy1Pg1d9XEwYMPoUD4iMnU4xw==
X-Received: by 2002:a63:1e18:: with SMTP id e24mr19944852pge.296.1587989403982; 
 Mon, 27 Apr 2020 05:10:03 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:10:03 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:31 +0530
Message-Id: <20200427120834.380-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 20/23] engine: cocci_vs_c: Match
	Parameter attributes
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

Parameter attributes are added to the C and SmPL AST. Match the
attributes correctly in cocci_vs_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/cocci_vs_c.ml | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index 317fa71e..66cb104a 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -2112,14 +2112,14 @@ and parameters_bis eas ebs =
   let special_cases ea eas ebs =
     (* a case where one smpl parameter matches a list of C parameters *)
     match A.unwrap ea,ebs with
-      A.VoidParam ta, ys ->
+      A.VoidParam (ta, attrsa), ys ->
 	Some
           (match eas, ebs with
           | [], [Left eb] ->
               let {B.p_register=(hasreg,iihasreg);
                     p_namei = idbopt;
                     p_type=tb;
-                    p_attr=attrs; } = eb in
+                    p_attr=attrsb; } = eb in
 
               let attr_allminus =
                 check_allminus.Visitor_ast.combiner_parameter ea in
@@ -2128,10 +2128,10 @@ and parameters_bis eas ebs =
                 match tb with
                 | (qub, (B.BaseType B.Void,_)) ->
                     fullType ta tb >>= (fun ta tb ->
-                    attribute_list attr_allminus [] attrs >>=
+                    attribute_list attr_allminus attrsa attrsb >>=
                     (fun attrsa attrsb ->
                       return (
-                      [(A.VoidParam ta) +> A.rewrap ea],
+                      [(A.VoidParam (ta, attrsa)) +> A.rewrap ea],
                       [Left {B.p_register=(hasreg, iihasreg);
                               p_namei = idbopt;
                               p_type = tb;
@@ -2171,23 +2171,23 @@ and parameter = fun parama paramb ->
 	      return
 		(A.MetaParam(ida,constraints,keep,inherited)+>
 		 A.rewrap parama,eb)))
-  | A.Param (typa, idaopt), eb ->
+  | A.Param (typa, idaopt, attrsa), eb ->
       let {B.p_register = (hasreg,iihasreg);
 	    p_namei = nameidbopt;
 	    p_type = typb;
-            p_attr = attrs;} = paramb in
+            p_attr = attrsb;} = paramb in
 
       let attr_allminus =
         check_allminus.Visitor_ast.combiner_parameter parama in
 
       fullType typa typb >>= (fun typa typb ->
-      attribute_list attr_allminus [] attrs >>= (fun attrsa attrsb ->
+      attribute_list attr_allminus attrsa attrsb >>= (fun attrsa attrsb ->
 	match idaopt, nameidbopt with
 	| Some ida, Some nameidb ->
       (* todo: if minus on ida, should also minus the iihasreg ? *)
 	    ident_cpp DontKnow ida nameidb >>= (fun ida nameidb ->
               return (
-              A.Param (typa, Some ida)+> A.rewrap parama,
+              A.Param (typa, Some ida, attrsa)+> A.rewrap parama,
               {B.p_register = (hasreg, iihasreg);
 		p_namei = Some (nameidb);
                 p_type = typb;
@@ -2196,7 +2196,7 @@ and parameter = fun parama paramb ->
 
 	| None, None ->
 	    return (
-            A.Param (typa, None)+> A.rewrap parama,
+            A.Param (typa, None, attrsa)+> A.rewrap parama,
             {B.p_register=(hasreg,iihasreg);
               p_namei = None;
               p_type = typb;
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
