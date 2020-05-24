Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76CAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75CA8206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4z7eoBY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75CA8206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 56FB28746E;
	Sun, 24 May 2020 17:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxhDp6JmHGsk; Sun, 24 May 2020 17:22:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D9DA78701C;
	Sun, 24 May 2020 17:22:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8B6BC0178;
	Sun, 24 May 2020 17:22:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D593AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C54FD87B4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CyUTJzvCx2z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 610B881B74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:35 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m1so1448493pgk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYx2A/rvZUMqfb7yE0l7tN8ntav6DCEcObh5qrmNPHE=;
 b=E4z7eoBYA6Rh5+3ZxXbDy//lKV1uctDNtp6X8dF30KCs+Ht55QcxZ7yvCxcEPLnglW
 AFqvfvlVqXj/3PuWwB04xM4yT7JeGQtYGNym1vItAntYzg/NWtw5jVuJxfI5N55tNelf
 bRKL1SVaOaonzKQzYrq5PLoNYY6POua0Mv/luNfsk06x64lsjZzwmqbjTvrHi8R2RN/N
 PHr8ohtxrBUdNOqbSmJom829wvzJfERRbT9H5tuARHKAkLhHt3mWw7LZ3v3OB8rZGJhj
 1LiK9Z2NLQJVxqHYQbOc25zcFNuQPajgDvgWE6aJCppbqWVPEEah9P5Lzxtz2MNOq9kn
 rgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYx2A/rvZUMqfb7yE0l7tN8ntav6DCEcObh5qrmNPHE=;
 b=qN2mgldxZOxoU22MYtdhOcfG6QP5jLGlJlrKu/0mtyyL2SbylopKNPCC0CAlwQeo05
 jLsFDA2QvEmzYoMyR3q+ND+3JwAZJ1mOucV3Elb+qAdiNWkYiXAN4T+cgmLZwLikGCQN
 mb14A7hL4WjfEC0V2mEvGvOqrQFZ5+2l6h5R8GWFf7cJJHVIc5gSuC+T/5fS4K9z6TWr
 0v4+lI/gpD8zj7J5gLGo7FsNaZISDdF/ZkmBt5wH3tky5Opp9PYisf1hwP3ij3Kfj0O/
 zMbkNYA7r0cNeG7ssi7/J60LxUnUKJAcPm/3dhbar9eJidjcxkziXYBc9Db/9gbCsx7l
 vfAQ==
X-Gm-Message-State: AOAM533XyfnGbl8pb5b2Mt3mkkfR0OsI+cGTd4SQJ2Hi7cPXaAdOteCr
 ztrgO2HOfMkUkUXIsWeHnb0=
X-Google-Smtp-Source: ABdhPJz4R1+YhIcTPwUjHmUnBlY8syjh9efWJIOkFhpNbmB9oyAuMjJlbiai/bxIf5geH3zGu+E2sg==
X-Received: by 2002:a63:3c17:: with SMTP id j23mr22376345pga.343.1590340954916; 
 Sun, 24 May 2020 10:22:34 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:22:34 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:31 +0530
Message-Id: <20200524171935.2504-27-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 26/30] engine: cocci_vs_c: Match
	Macrodecl attributes
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

Macrodecl attributes are added to the C and SmPL ASTs. Match these
attributes in cocci_vs_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/cocci_vs_c.ml | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index 317fa71e..ca911765 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -2340,8 +2340,8 @@ and (declaration: (A.mcodekind * bool * A.declaration,B.declaration) matcher) =
 	      fail
 	end
 
-  | A.MacroDecl (stoa,sa,lpa,eas,rpa,enda),
-	B.MacroDecl ((stob,sb,ebs,true),ii) ->
+  | A.MacroDecl (stoa,sa,lpa,eas,rpa,attrsa,enda),
+	B.MacroDecl ((stob,sb,ebs,attrsb,true),ii) ->
       let (iisb, lpb, rpb, iiendb, iifakestart, iistob) =
         (match ii with
         | iisb::lpb::rpb::iiendb::iifakestart::iisto ->
@@ -2352,6 +2352,7 @@ and (declaration: (A.mcodekind * bool * A.declaration,B.declaration) matcher) =
           stoa ((stob, false), iistob) >>= (fun stoa ((stob, _), iistob) ->
         X.tokenf_mck mckstart iifakestart >>= (fun mckstart iifakestart ->
 	ident DontKnow sa (sb, iisb) >>= (fun sa (sb, iisb) ->
+	attribute_list allminus attrsa attrsb >>= (fun attrsa attrsb ->
         tokenf lpa lpb >>= (fun lpa lpb ->
         tokenf rpa rpb >>= (fun rpa rpb ->
         tokenf enda iiendb >>= (fun enda iiendb ->
@@ -2360,13 +2361,13 @@ and (declaration: (A.mcodekind * bool * A.declaration,B.declaration) matcher) =
 
           return (
             (mckstart, allminus,
-            (A.MacroDecl (stoa,sa,lpa,eas,rpa,enda)) +> A.rewrap decla),
-            (B.MacroDecl ((stob,sb,ebs,true),
+            (A.MacroDecl (stoa,sa,lpa,eas,rpa,attrsa,enda)) +> A.rewrap decla),
+            (B.MacroDecl ((stob,sb,ebs,attrsb,true),
                          [iisb;lpb;rpb;iiendb;iifakestart] @ iistob))
-          ))))))))
+          )))))))))
 
-  | A.MacroDecl (None,sa,lpa,eas,rpa,enda),
-      B.MacroDecl ((B.NoSto,sb,ebs,false),ii) ->
+  | A.MacroDecl (None,sa,lpa,eas,rpa,attrsa,enda),
+      B.MacroDecl ((B.NoSto,sb,ebs,attrsb,false),ii) ->
 	(* This is for macrodecls with no semicolons, which come from
 	   a parsing rule that deals with function prototypes with no
 	   return type.  That parsing rule would have a conflict if there
@@ -2383,6 +2384,7 @@ and (declaration: (A.mcodekind * bool * A.declaration,B.declaration) matcher) =
 	    X.tokenf_mck mckstart iifakestart >>=
 	    (fun mckstart iifakestart ->
 	      ident DontKnow sa (sb, iisb) >>= (fun sa (sb, iisb) ->
+	      attribute_list allminus attrsa attrsb >>= (fun attrsa attrsb ->
 	      tokenf lpa lpb >>= (fun lpa lpb ->
 	      tokenf rpa rpb >>= (fun rpa rpb ->
 	      arguments (seqstyle eas) (A.unwrap eas) ebs >>=
@@ -2391,10 +2393,11 @@ and (declaration: (A.mcodekind * bool * A.declaration,B.declaration) matcher) =
 
 		  return (
 		  (mckstart, allminus,
-		   (A.MacroDecl (None,sa,lpa,eas,rpa,enda)) +> A.rewrap decla),
-		  (B.MacroDecl ((B.NoSto,sb,ebs,false),
+		   (A.MacroDecl
+                     (None,sa,lpa,eas,rpa,attrsa,enda)) +> A.rewrap decla),
+		  (B.MacroDecl ((B.NoSto,sb,ebs,attrsb,false),
 				[iisb;lpb;rpb;iifakestart]))
-		  ))))))
+		  )))))))
       | _ -> fail)
 
   | A.MacroDeclInit (stoa,sa,lpa,eas,rpa,weqa,inia,enda),
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
