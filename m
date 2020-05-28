Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C012C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3C720888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVNySu5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3C720888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3645120010;
	Thu, 28 May 2020 12:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VttYePCpEWc2; Thu, 28 May 2020 12:25:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 850E825406;
	Thu, 28 May 2020 12:25:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7384EC088D;
	Thu, 28 May 2020 12:25:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF12FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9EF1F882BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4HWAk6OzCO4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1AD798826B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:42 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j21so13405087pgb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyw+Qp7viQi2nyCbqX5ANdDvSch9vDo6f7qr8BxYN/4=;
 b=dVNySu5sirpr0kdQFs1o59tcvgYzh/3Yyn0DOanjD5Y1klz4fkqXCuuKkyGUJbAvoz
 /WMrFdKAdsMjHL+HzxNz3zuOtS5KbMu/fefCOMti5i44I+7/+mcuJcun5kRCaysEubYo
 VFP7klQr71JX/LKPUhTYqU+93Xw8gGu7HstXJs0GaNPY2p/IKfIzrNu3n2lyxugt8eWr
 6CYWJzl4W+R8IYoxYl8+wdBs61GNj8AuKGnh6RyX/Dgnl+mO7L4C/JVpOtRl1AAbJ+cl
 IxVvCm//DvoCyqz088cNG5QJla4OcqE0zO4wG4XmE7omS1dkyM8QALOzyic0kI0NOrMt
 +Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyw+Qp7viQi2nyCbqX5ANdDvSch9vDo6f7qr8BxYN/4=;
 b=jL8tj8L2T2dc7SA+qQf8s0Q9vv3A9rYseRxRu52VpVskV8xgle0gIdrSIzE3nSTi2o
 B7Y5vCPgj0F5X4bQQYqK6Xbsk85zd2A/QMjn6/yS9YMRDa7lQAYVYnqTCy2F98qAqK6K
 xUlO3d+6MiaCw4rNZ1dy9piH0ewOXCoBXclX/Bt7KXxnW0InlETqlj2j7/YkPmbStQYP
 BRn9g23oMF3KHv0sLWNNxnosS7kfh3e5su3ytyaYnUO+r5zHO/FGOykfJI/HOPmF7sYz
 RV/xXuvfwuiXwjTzTGabrUpUaICVyXvky5eIaDi0jK9zfNquiwXesgVHHXgIG4u6S78V
 r6dQ==
X-Gm-Message-State: AOAM530XMbRcpaDBXmhASxa1DVJqU+HCbI+9mTocTvAwD6seKntvP9s8
 uTJW0vn+SnNQR+0nAeDnKdY=
X-Google-Smtp-Source: ABdhPJxxdyFLFycskXjNsunfTbgHjGRAxfH6nO/MkY+Brz9ixeeEasUmvoK7rqL1O3M9b9Kn2pQPJw==
X-Received: by 2002:a65:40c3:: with SMTP id u3mr2792760pgp.305.1590668741623; 
 Thu, 28 May 2020 05:25:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:41 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:19 +0530
Message-Id: <20200528122428.4212-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 17/25] engine: cocci_vs_c: Add
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
