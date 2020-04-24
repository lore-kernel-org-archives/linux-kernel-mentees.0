Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E15C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CD620724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hq7pmnfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83CD620724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E894887BE;
	Fri, 24 Apr 2020 09:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id db3WW4e-kB-f; Fri, 24 Apr 2020 09:19:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 976C2887D4;
	Fri, 24 Apr 2020 09:19:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8702FC089E;
	Fri, 24 Apr 2020 09:19:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EF47C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9BE6686F47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZO3gIjTsMxTB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 01F8186F41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:32 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id p25so4513955pfn.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyw+Qp7viQi2nyCbqX5ANdDvSch9vDo6f7qr8BxYN/4=;
 b=hq7pmnfGDkkzZgkHIUWlfgSlQd5OHfyYYNf/MXi4+/R7pmZBQ355dZ7z8B9U3IpJ9l
 fzu6xgBSbiUr4ROnBM+qarf2vtQYSOMLOqNDlBgRNR5p/bvW+YGEoF8qU/SzRkFEX9Oq
 ysYFR9flag5mmEl8nPRr55vW1xesFrrNf+7VxMCXlSIU83/MI7D25UzhuKp9YmWV74da
 r1fokmgqEJQvi49gAA+/rqbPc2VDn3SnV6KLfwuO9XvBV6/b30J9gowH+gEFnCPMeT4I
 wMDU5mkCZDD2fIAK12+wu0BC6uDxeJQOP99lDSoZbBfyb/fayArpu/tC9wFyFWIHbPQM
 RWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyw+Qp7viQi2nyCbqX5ANdDvSch9vDo6f7qr8BxYN/4=;
 b=pURqvdea9k4g8oj2w0+v0hcanYLaOAAS1FriPkBV5dIc1fhTFlYoBO6RYlHh/OIjeB
 SZXu1l1z6CeFNIFKzZvoNRxwViji1wyg6jNzGKcEnGGIoBT+oeOv7QByZyM+0EZs+ofe
 zGpDaOxbG/X+5R0oSQ7GqikgE0Iz+DpFI/6QdsZ5rcDFfTWAsC7uJLrBHpeahrVBbt/k
 VxD9l+g0cf0Rw67mTutdnfH7iHtLthCeBlTNpXguSerCNVTMg2S9kW2qHGCXWy33LQgd
 eJPCt7r6DKXmqlIAnpTMSb8V8QT6r0EA1t9JHrcj4lG6F4gaGuVY8XMkfH5MyYfnpSgk
 6XTQ==
X-Gm-Message-State: AGi0PuZo/Xkb+re9Ba3ZkhN2xZM85KISrAN4HNA1Px1d82kwgy6P38ZD
 Z3HhlD5QwpljzTPQI335Dbk459NbYyA=
X-Google-Smtp-Source: APiQypJFRVCAIUcroAmZ60o1SeSk5+X3wK/2am/0aDbs9s89Z1YaGiF4pZfj4tQ26X+x+S8ngnl9og==
X-Received: by 2002:a62:5b87:: with SMTP id p129mr8508734pfb.5.1587719972461; 
 Fri, 24 Apr 2020 02:19:32 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:32 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:53 +0530
Message-Id: <20200424091801.13871-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 17/25] engine: cocci_vs_c: Add
	allminus argument to attribute_list
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

The allminus argument is used to denote when attributes should be
removed. This is with respect to the given SmPL program.

Add the allminus argument to attribute_list, and pass it correctly in
places where attribute_list is used.

This also makes sure that the test case unstruct does not break when
attributes are identified correctly by the C parser.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/cocci_vs_c.ml | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index e383aef8..413ea220 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -2563,7 +2563,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
        ident_cpp DontKnow ida nameidb >>= (fun ida nameidb ->
        tokenf ptvirga iiptvirgb >>= (fun ptvirga iiptvirgb ->
        fullType typa typb >>= (fun typa typb ->
-       attribute_list attrsa endattrs >>= (fun attrsa endattrs ->
+       attribute_list allminus attrsa endattrs >>= (fun attrsa endattrs ->
        storage_optional_allminus allminus stoa (stob, iistob) >>=
         (fun stoa (stob, iistob) ->
          return (
@@ -2592,7 +2592,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
        tokenf ptvirga iiptvirgb >>= (fun ptvirga iiptvirgb ->
        tokenf eqa iieqb >>= (fun eqa iieqb ->
        fullType typa typb >>= (fun typa typb ->
-       attribute_list attrsa endattrs >>= (fun attrsa endattrs ->
+       attribute_list allminus attrsa endattrs >>= (fun attrsa endattrs ->
        storage_optional_allminus allminus stoa (stob, iistob) >>=
        (fun stoa (stob, iistob) ->
        initialiser inia inib >>= (fun inia inib ->
@@ -2651,7 +2651,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
           inla (stob, iistob) >>= (fun inla (stob, iistob) ->
         storage_optional_allminus allminus
           stoa (stob, iistob) >>= (fun stoa (stob, iistob) ->
-        attribute_list attras attrs >>= (fun attras attrs ->
+        attribute_list allminus attras attrs >>= (fun attras attrs ->
         fullType_optional_allminus allminus tya tyb >>= (fun tya tyb ->
 	let fninfoa = put_fninfo stoa tya inla attras in
         parameters (seqstyle paramsa) (A.unwrap paramsa) paramsb >>=
@@ -4194,29 +4194,41 @@ and attribute_list attras attrbs =
 
 (* The cheap hackish version.  No wrapping requires... *)
 
-and attribute_list attras attrbs =
+and attribute_list allminus attras attrbs =
   X.optional_attributes_flag (fun optional_attributes ->
   match attras,attrbs with
     [], _ when optional_attributes || attrbs = [] ->
-      return ([], attrbs)
+      if allminus
+      then
+        let rec loop = function
+            [] -> return ([],[])
+          | ib::ibs ->
+              X.distrf_attr minusizer ib >>= (fun _ ib ->
+                  loop ibs >>= (fun l ibs ->
+                    return([],ib::ibs))) in
+        loop attrbs
+      else return ([], attrbs)
   | [], _ -> fail
   | [attra], [attrb] ->
-    attribute attra attrb >>= (fun attra attrb ->
+    attribute allminus attra attrb >>= (fun attra attrb ->
       return ([attra], [attrb])
     )
   | [attra], attrb -> fail
   | _ -> failwith "only one attribute allowed in SmPL")
 
-and attribute = fun ea eb ->
+and attribute = fun allminus ea eb ->
   match ea, eb with
     attra, (B.Attribute attrb, ii)
       when (A.unwrap_mcode attra) = attrb ->
       let ib1 = tuple_of_list1 ii in
       tokenf attra ib1 >>= (fun attra ib1 ->
+       (if allminus
+        then minusize_list [ib1]
+        else return ((), [ib1])) >>= (fun _ ib1 ->
 	return (
 	  attra,
-	  (B.Attribute attrb, [ib1])
-        ))
+          (B.Attribute attrb,ib1)
+        )))
   | _ -> fail
 
 (*---------------------------------------------------------------------------*)
@@ -4927,7 +4939,7 @@ let rec (rule_elem_node: (A.rule_elem, F.node) matcher) =
             inla (stob, iistob) >>= (fun inla (stob, iistob) ->
           storage_optional_allminus allminus
             stoa (stob, iistob) >>= (fun stoa (stob, iistob) ->
-          attribute_list attras attrs >>= (fun attras attrs ->
+          attribute_list allminus attras attrs >>= (fun attras attrs ->
               (
                 if isvaargs
                 then
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
