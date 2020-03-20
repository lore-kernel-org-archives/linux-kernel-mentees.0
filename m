Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232F8C4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDCA920774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWOzaRMG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDCA920774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D71FC8685D;
	Fri, 20 Mar 2020 07:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LtoHv8W4mD-J; Fri, 20 Mar 2020 07:03:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3EF0286B18;
	Fri, 20 Mar 2020 07:03:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C1D6C089E;
	Fri, 20 Mar 2020 07:03:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78ABDC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 672FC889CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aK0OShxdz9Nx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9226688970
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i13so2765160pfe.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CW/aBVc/DvLm5AzOCaIeJv4ugR2BHIZSwBinzT7AqF0=;
 b=bWOzaRMGOyAW/rwbQuZL28TUSd9Vgf8gclOaNpfpmekshA53Jw9suNM7zkcieDsSvP
 vLK786ikJlI2PL+svJJraiIBHUNqrhQd6413iUa6Xydx40YT8BZ3NbXpOUcSmAhzvfsT
 WxiEgy5uQ9L3ShLRJdzmSUxt7kUG5XjwMovXD0wCNVYajVKmU1n3JLlOjL/odhzozGW2
 QCKd+Dupv6aJLO2oTL0xzbW1HJ0FefyDOjnKep3YAB1LGMODSSVCMxPOvs8ChX3ivRPK
 l5qr74Xv4QVJI6vZwV5t6CCHmfD3fbz+sF5an9g6sytFOygi+BNV4Iw87W+qU1t2k1dn
 bsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CW/aBVc/DvLm5AzOCaIeJv4ugR2BHIZSwBinzT7AqF0=;
 b=YePshPXDMCkNmhwqeuKXSVCqS+7uv+ig+9NFA7RxeISVkfTKJxIF/V/2Mu7yzV3IJD
 ZFD0+bsOzw0VedkkLQSjaN+B+hWyQG+VYiecigGhlH8v6221x4zsaSfIBBZV7Bkw7DmR
 QU2WPwHYZDujqE4o1LgvB0nI1py9lpdbENBkaVMy99qq3DxgplHzcIm0CDzKH/Qns0Js
 QaQu8r4lC+OnKKRr/sv1UqxfRKMpSgmVVSZc9ZPvW0CmTo38fa8qVWruReEL4PkD2NR/
 7McC2+FCIczJhG3aps2wqG+vx6bybF6UKG8CWe8bYli347nBI0nXgWnX1JL4rtoyqoGo
 ioxA==
X-Gm-Message-State: ANhLgQ2iUOP0LHt3EbWKivEDXEaUiHBzlFRJ8D04l+/cLbQJ7nYRvh0m
 pbMbkG5FwNI4WcZVLscu4T8=
X-Google-Smtp-Source: ADFU+vuY5+Z2rkJ9NqJDOIeqw+9wgjFNm3Dq/Jz6Cmdhq3EscU8fdxvvLuX/8+z0tI+kzt2KSHt0iA==
X-Received: by 2002:a62:1b12:: with SMTP id b18mr8205160pfb.258.1584687817097; 
 Fri, 20 Mar 2020 00:03:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:36 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:54 +0530
Message-Id: <20200320070157.4206-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 23/26] engine: Match A.ParenType
	and A.FunctionType
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

ParenType and FunctionType are added to the SmPL AST as types.
Match these types correctly.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/check_exhaustive_pattern.ml |  2 ++
 engine/cocci_vs_c.ml               | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/engine/check_exhaustive_pattern.ml b/engine/check_exhaustive_pattern.ml
index 5a047f73..872c060c 100644
--- a/engine/check_exhaustive_pattern.ml
+++ b/engine/check_exhaustive_pattern.ml
@@ -149,6 +149,8 @@ let dumb_astcocci_type = function
  | A.SignedT (signa,tya) -> ()
  | A.Pointer (typa, _) -> ()
  | A.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) -> ()
+ | A.ParenType(lp,ty,rp) -> ()
+ | A.FunctionType(ty,lp,params,rp) -> ()
  | A.Array (typa, _, eaopt, _) -> ()
  | A.Decimal(_, _, _, _, _, _) -> ()
  | A.EnumName(en, ena) -> ()
diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index a4a0e53b..3e0eb50e 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -3785,6 +3785,29 @@ and (typeC: (A.typeC, Ast_c.typeC) matcher) =
         | _ -> fail
         )
 
+    | A.ParenType (lpa, typa, rpa), (B.ParenType typb, ii) ->
+        let (lpb, rpb) = tuple_of_list2 ii in
+        fullType typa typb >>= (fun typa typb ->
+        tokenf lpa lpb >>= (fun lpa lpb ->
+        tokenf rpa rpb >>= (fun rpa rpb ->
+          return (
+            (A.ParenType (lpa, typa, rpa)) +> A.rewrap ta,
+            (B.ParenType (typb), [lpb;rpb])
+          ))))
+
+    | A.FunctionType (typa, lpa, paramsa, rpa),
+        (B.FunctionType (typb, (paramsb, (isvaargs, iidotsb))), ii) ->
+        let (lpb, rpb) = tuple_of_list2 ii in
+        fullType typa typb >>= (fun typa typb ->
+        tokenf lpa lpb >>= (fun lpa lpb ->
+        tokenf rpa rpb >>= (fun rpa rpb ->
+        parameters (seqstyle paramsa) (A.unwrap paramsa) paramsb >>=
+        (fun paramsaunwrap paramsb ->
+          let paramsa = A.rewrap paramsa paramsaunwrap in
+          return (
+            (A.FunctionType (typa, lpa, paramsa, rpa)) +> A.rewrap ta,
+            (B.FunctionType (typb, (paramsb, (isvaargs, iidotsb))), [lpb;rpb])
+          )))))
 
 
     (* todo: handle the iso on optional size specification ? *)
@@ -4361,6 +4384,10 @@ and compatible_typeC a (b,local) =
     | A.FunctionPointer (a, _, _, _, _, _, _), _ ->
 	failwith
 	  "TODO: function pointer type doesn't store enough information to determine compatibility"
+    | A.ParenType (_, a, _), (qub, (B.ParenType b, ii)) ->
+	compatible_type a (b, local)
+    | A.FunctionType (a, _, _, _), (qub, (B.FunctionType (b,_), ii)) ->
+	compatible_type a (b, local)
     | A.Array (a, _, _, _), (qub, (B.Array (eopt, b),ii)) ->
       (* no size info for cocci *)
 	compatible_type a (b, local)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
