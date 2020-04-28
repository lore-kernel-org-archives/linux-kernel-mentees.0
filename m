Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58FCC83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C1520730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPv/gVlG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C1520730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 760C0875CA;
	Tue, 28 Apr 2020 17:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfzqDKgLnF7d; Tue, 28 Apr 2020 17:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 00C4A875A1;
	Tue, 28 Apr 2020 17:03:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2149C0864;
	Tue, 28 Apr 2020 17:03:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7385FC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7084087118
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8En42UV41aq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 604C286E1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:11 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x26so10633045pgc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=baLXxpVeWEBfxtTo4sAaWBj7RQkMl3/SHWSBubRN2Uk=;
 b=HPv/gVlGU6Mi0O4oAhDZNo0x5S7JSwXF9RKv5cyzpwaBTFhXeWV3cG9QDjFk2RpmgQ
 mqgy1km5WX7A6NvRlFJmRvzFXQN4eGX+hCbRSrJaPC5girjTXWZKzbxsaJRQSnv8B4OH
 5KsRe333Gm1PIoZfQ8lrRjEyuJ9WOdMADft6Bi31l7HQy0CvTu5KPc8bz9EbSSMnmJcI
 8Y6NyJibi6tDThmFYPI1EHqZ+2QM9QN43lDPFT66gxbFXvOM8b++xkLFWt7XJ1qQNBnG
 EYIAtSgzFvspx7q55s/wHCclL4YgUc0WfK61AQBFs8ap/cY2Kxo4J5BAF9mMgNGhpiST
 S4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=baLXxpVeWEBfxtTo4sAaWBj7RQkMl3/SHWSBubRN2Uk=;
 b=eECcyor7kpOCVhn89AB2YJ5PpasNwtDz2zvrcDr0wswe8DPwYAzePevfECt61xlWrA
 QDoKurqo+ST1hVIQNjn/saFt107qHwvswJqd7pxYGv3GuEp6KnQhzFwOMc7RIcGx5k6s
 GRb7jV6k1lKnwZFiK4rjMBBCdVblj/ckGOquaD4PeWJIW7bEYcJLub6qhHlbV551UNHB
 ybF03/9h/FdUmds+88Cr8M5gwNS5w/df1IppEdi7bEfBG7TB9djLDca0/tKcaMO8ZfLy
 yTC75m8xzecEcKzC5vFSBQOMoF4xpeXIK3To8zp0ESRYmJFErgf4sHfjPrUwXKdUxh5p
 kN4A==
X-Gm-Message-State: AGi0PubhC2TPmGx8Bn/qCGCpqZx3ColgNLQ5dCNdrciU4hmkwscnt2u+
 /Ijcg9Pp3kaIqyzDjxQC/ZM=
X-Google-Smtp-Source: APiQypLYjLZJmZ1NYZNPnJc/8NgqWdnskTcTS3IaRBznJYcL0/JFYL13U5BgO4qNllSPCUvZtgMBwQ==
X-Received: by 2002:a62:38cc:: with SMTP id f195mr30380759pfa.85.1588093390897; 
 Tue, 28 Apr 2020 10:03:10 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:09 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:03 +0530
Message-Id: <20200428170228.7002-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 07/32] parsing_cocci: iso_pattern:
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
iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/iso_pattern.ml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 9df21fb9..b57e293e 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -575,7 +575,7 @@ let match_maker checks_needed context_required whencode_allowed =
 			(* all caps is a const *)
 			Str.string_match all_caps nm 0
 		    | _ -> false)
-		| Ast0.Cast(lp,ty,rp,e) -> matches e
+		| Ast0.Cast(lp,ty,attr,rp,e) -> matches e
 		| Ast0.SizeOfExpr(se,exp) -> true
 		| Ast0.SizeOfType(se,lp,ty,rp) -> true
 		| Ast0.MetaExpr(nm,_,_,Ast.CONST,p,_bitfield) ->
@@ -586,7 +586,7 @@ let match_maker checks_needed context_required whencode_allowed =
 	      let rec matches e =
 		match Ast0.unwrap e with
 		  Ast0.Ident(c) -> true
-		| Ast0.Cast(lp,ty,rp,e) -> matches e
+		| Ast0.Cast(lp,ty,attr,rp,e) -> matches e
 		| Ast0.MetaExpr(nm,_,_,Ast.ID,p,_bitfield) ->
 		    (Ast0.lub_pure p pure) = pure
 		| _ -> false in
@@ -757,10 +757,16 @@ let match_maker checks_needed context_required whencode_allowed =
 	       conjunct_many_bindings
 		 [check_mcode opa op; match_expr expa expb;
 		   match_ident fielda fieldb]
-	  | (Ast0.Cast(lp1,tya,rp1,expa),Ast0.Cast(lp,tyb,rp,expb)) ->
+	  | (Ast0.Cast(lp1,tya,attra,rp1,expa),
+             Ast0.Cast(lp,tyb,attrb,rp,expb)) ->
+              if (List.length attra = List.length attrb &&
+                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                  attra attrb)
+              then
 	      conjunct_many_bindings
 		[check_mcode lp1 lp; check_mcode rp1 rp;
 		  match_typeC tya tyb; match_expr expa expb]
+              else return false
 	  | (Ast0.SizeOfExpr(szf1,expa),Ast0.SizeOfExpr(szf,expb)) ->
 	      conjunct_bindings (check_mcode szf1 szf) (match_expr expa expb)
 	  | (Ast0.SizeOfType(szf1,lp1,tya,rp1),
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
