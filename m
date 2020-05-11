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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FDCC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DC82075E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfaUFwrZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DC82075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DD7C87858;
	Mon, 11 May 2020 10:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOzJIM1ft7Zo; Mon, 11 May 2020 10:14:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD31986D13;
	Mon, 11 May 2020 10:14:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD1ECC0176;
	Mon, 11 May 2020 10:14:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 323F8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2EE3387858
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72sg4jo1pE7b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0893286D13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:33 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id fu13so7552134pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R+I2fipbkPh/x4luyQPKwshG6xdLZBLuUkkno04EsbE=;
 b=gfaUFwrZLnpI1Yu0IZAu8R9ckzX7LqrbymwRO6u7rd+7f2cZVLkz9p73SiAzaIh4Yp
 CAtwMDZkLl/4OwwMG0t7IlYTXRDAorlSTsj1+fmk9VKBrGytN5Y5xIsWE+O6Ag5gx0p9
 UIe3X8abHDbOalB/4mN2B/mXOpP+3qPIN9L3AV0JZ2INSYg7nH4gAFMAHTiKOrUWTcTS
 L+ZAiXA9yOxIPwSK3qFFGqBKQ4ij8+XAmBK2qeqnxvJ6MwXpPbYiR3BBnRN58M1MrKES
 o4QbrsMHj8deYxKttJr9O0hIuiZpJezW6w5sYpsIKOoNx0A5GIV8BOxWSexk7JC8iaAG
 Qt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+I2fipbkPh/x4luyQPKwshG6xdLZBLuUkkno04EsbE=;
 b=e0YkJFCfz7xgnHEWwlxqrCDEIQveeezAxNL8VjDCic7A/1B7l26n/cJ6uFY9+tQnyQ
 PpYBt6XJJhAXJPehomWOG9x/sM1jj1jaLT60HQOkzIHIfprFXfhbYoTG3CAPc83ud8ZI
 rFtPe5Cs8NIfRmTvhZaUgqHgoiJv+QbALFjY2qbonYBiPOdOztCehUKRZhlqslO44wtc
 u5E91QqbnUUsFo3bDR6EI0Si8xZHXbTDyFdTtMVnqqMBJHOh5ipNd75ufEu4gayKzjSL
 luJX4r9GtZsPbSDlVR76LtAyYqtYvieI9BqF6gfo6hrM7FUtpmLcXPEvT57LWToF38X4
 vNPg==
X-Gm-Message-State: AGi0PuYow9dNpzwRv8FO1FBCMg9p3aSyFiGy4ox05yGZrOmxitmKlOsH
 eCQ91LhPiV7idVoq1z4qM+HgbVV34V8=
X-Google-Smtp-Source: APiQypK9ANMEXBiaW3LgqNcwFD7K18vuXfuAXR72W25gnSovhFGX7UezhxBrka4mgR8KsN8zzZsOIA==
X-Received: by 2002:a17:90a:20ee:: with SMTP id
 f101mr21837127pjg.197.1589192072516; 
 Mon, 11 May 2020 03:14:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:32 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:57 +0530
Message-Id: <20200511101300.11101-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 20/23] engine: cocci_vs_c: Match
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
