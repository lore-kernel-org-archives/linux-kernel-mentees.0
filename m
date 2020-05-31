Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53988C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25470206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BH9hhXu3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25470206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BA4C86B11;
	Sun, 31 May 2020 15:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-RuxIwaeSFd; Sun, 31 May 2020 15:28:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B1C486ADD;
	Sun, 31 May 2020 15:28:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87B43C0863;
	Sun, 31 May 2020 15:28:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFE6EC0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DEE2985F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v8J9-s2yxuLf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 731F785E6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:14 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id v24so1166638plo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0iJ/SpOKHprtyfp+JlT83C1TdGzXjsrUvgAcn3ScZVM=;
 b=BH9hhXu3dc5XX6rvIR+QBpbjZmFfZmpsEzpliHxrYyy2+uAFB3rsThKvs3WJhClV2H
 iGWCdJMB31a0VxY7zy1kmrFAc6ihs9jtcxXZr33srEHBnHduVY9bKGHEts4tAm//6h2H
 Fy/nGBZCvA8BSjqkfLX+VBirWxhw7KIOuNVFpJ8WPwA/U8n1UFdjJs6HIQCuRRdTXG78
 j9g5wNtdgsf+KMWjn++ARv2y8Q5GPSTi3oSYAP5Wxci6TPZCK07qqemxrtD/9eWpCn2l
 FITSf6Us9i4SpS3yER0HeIVxpiGmlQc93QdXTGdbD35uGysgCKBeD8hz/tW96ilQscWb
 kDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0iJ/SpOKHprtyfp+JlT83C1TdGzXjsrUvgAcn3ScZVM=;
 b=Wh8LR/8YBZU6ao8P1Y6BmVxJ0hl0wvLwNVJ1hBqLu6gXLF1Ew/KRzg1TDhY3uAp8bZ
 kSDQwT/bobRF2lYCY6ls6P0AjGPlWQCI6201HBd6AGpevES38soTkUCrfnRENbOwsElu
 nxm2K8UDB43g4PdhItKkTPnbmqS+rtmOl3d9QXyLGUuThxT5M1/WVNmVQF8e/NoWF++/
 8Nau7kDvpGGIC7MksN6WD+gIIPxYP4tfcwaiZp+6ivg8QKryshH4lI+EQmmfqV6POXUL
 KNigk0isMSh9uvVAfviOyJR0AInquFrc8gxPM8MroVLTgg+B7xXnvedpMxOaqsYyk73m
 Qx/g==
X-Gm-Message-State: AOAM533ucHcEUIHziqnJW3PWRUx25e3+/5IlV53Ln/0PP74gXV6jVy3W
 kVH30CE018Fx7+PS9W2Aa0CIyqXr
X-Google-Smtp-Source: ABdhPJztUkvu5OIEvrPT3/6YFREcKtq3Iyq1ne7lgGFjk1GKbKZ//0VrWc4ABrQtofQac/qJ/rZ91g==
X-Received: by 2002:a17:90a:9f02:: with SMTP id
 n2mr19910481pjp.173.1590938894057; 
 Sun, 31 May 2020 08:28:14 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:13 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:16 +0530
Message-Id: <20200531152621.2886-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 22/27] engine: cocci_vs_c: Match
	struct end attributes
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

Struct end attributes are added to the SmPL AST. Match these attributes
in cocci_vs_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/cocci_vs_c.ml | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index 83141bf5..7abc4d53 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -2461,7 +2461,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
   * T { }; that we want to match against typedef struct { } xx_t;
   *)
 
- | A.TyDecl (tya0, ptvirga),
+ | A.TyDecl (tya0, attra, ptvirga),
    ({B.v_namei = Some (nameidb, B.NoInit);
      B.v_type = typb0;
      B.v_storage = (B.StoTypedef, inl);
@@ -2503,6 +2503,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
        in
 
        struct_fields (A.unwrap declsa) declsb >>= (fun undeclsa declsb ->
+         attribute_list allminus attra endattrs >>= (fun attra endattrs ->
          tokenf ptvirga iiptvirgb >>= (fun ptvirga iiptvirgb ->
          tokenf lba lbb >>= (fun lba lbb ->
          tokenf rba rbb >>= (fun rba rbb ->
@@ -2531,7 +2532,8 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
 			   check_constraints cstr ida (B.MetaTypeVal typ')
 			     (fun () ->
 			       return (
-			       (A.TyDecl (tya0, ptvirga)) +> A.rewrap decla,
+			       (A.TyDecl (tya0, attra, ptvirga))
+			        +> A.rewrap decla,
 			       (({B.v_namei = Some (nameidb, B.NoInit);
 				  B.v_type = typb0;
 				  B.v_storage = (B.StoTypedef, inl);
@@ -2563,7 +2565,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
                    let typb0 = ((qu, il), typb1) in
 
                    return (
-                     (A.TyDecl (tya0, ptvirga)) +> A.rewrap decla,
+                     (A.TyDecl (tya0, attra, ptvirga)) +> A.rewrap decla,
                      (({B.v_namei = Some (nameidb, B.NoInit);
                         B.v_type = typb0;
                         B.v_storage = (B.StoTypedef, inl);
@@ -2579,7 +2581,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
            | _ -> raise (Impossible 31)
            )
          | _ -> fail
-       )))))
+       ))))))
      | _ -> fail
      )
    | _ -> fail
@@ -2718,7 +2720,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
 	      )))))))))
 
    (* do iso-by-absence here ? allow typedecl and var ? *)
-   | A.TyDecl (typa, ptvirga),
+   | A.TyDecl (typa, attra, ptvirga),
      ({B.v_namei = None; B.v_type = typb;
        B.v_storage = stob;
        B.v_local = local;
@@ -2730,9 +2732,10 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
        if stob = (B.NoSto, false)
        then
          fullType typa typb >>= (fun typa typb ->
+         attribute_list allminus attra endattrs >>= (fun attra endattrs ->
          tokenf ptvirga iiptvirgb >>= (fun ptvirga iiptvirgb ->
            return (
-             (A.TyDecl (typa, ptvirga)) +> A.rewrap decla,
+             (A.TyDecl (typa, attra, ptvirga)) +> A.rewrap decla,
              (({B.v_namei = None;
                 B.v_type = typb;
                 B.v_storage = stob;
@@ -2741,7 +2744,7 @@ and onedecl = fun allminus decla (declb, iiptvirgb, iistob) ->
                 B.v_endattr = endattrs;
                 B.v_type_bis = typbbis;
              }, iivirg), iiptvirgb, iistob)
-           )))
+           ))))
        else fail
 
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
