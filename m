Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4044C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8A34206EB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8htdYr0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8A34206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7852F2035E;
	Sun, 31 May 2020 15:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqZWyjinEgiz; Sun, 31 May 2020 15:27:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A607320030;
	Sun, 31 May 2020 15:27:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92780C0863;
	Sun, 31 May 2020 15:27:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7EB6C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D287C2035E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYrTq29EGaf8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 4951420030
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:23 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id nu7so3902590pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9JsogsnDuUGo21WJm29vh3LmkeAuiFz2LgdYhtFROA=;
 b=q8htdYr0t+cuOo4Pdla05P3ju+qIt1QpJskMbe1BwWCBlHdGV2h4ScBAc7rn30qDhp
 +AWjChNv1PX8DXv3oAr82n+GNF6GfL+oGNUhSpXKEKKZajTuPtPb7hwgVzmzfTif2qA5
 kD00szGZNenI2uFufCixWqTnZ/tND0fCdFD22/hMsLd1+S61xoy1lsS8BX/7jgm/Frpi
 Rbm/ne6zW6kwXVt36/p84S2ZSCEVMvUZxCRd43Hg5oa0mofJ1VJ6cO0cgj9BbKm15YsX
 f+nzZq4adUSOmwvO58iFCgurOKxbP2eh8/RAaDFpjiIBQNcNbPrd0jqDY1yTaAt9Tvr1
 7yKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9JsogsnDuUGo21WJm29vh3LmkeAuiFz2LgdYhtFROA=;
 b=CUa/Wwfw5RUBSFuDCe+4kmDS+a627HhfDpD95KchNS5QgwEIB0Aa42wnAODpev8Zwb
 FN4K3155VC99s+zCdXayQCluVc+ECiJgLTnmG+QStkJ3QNQ8kB1YJytMTmWDcoaRztzY
 DzNq1HkAmQFf2KdxM0UioWVVbK7mMeGroRyR8bd5hTabBMMhGEUviA2t1p63LgbO2BCm
 I7plTvAIOSDhypyBiBRdFWvr0uMIj86MRZk9JdUl3U23aFk02wmAinGe3cjgOuZIpqF0
 fjBlOV8clhMX3egG/cIpidoEq46YxHmM+pzGrVUSuV7XY0xfD0bm0bbYezYO4NNKrgox
 H4LQ==
X-Gm-Message-State: AOAM5300BwEimNfA6lINhA3wV7ofLaqsnPyulMgDYkGKKxfr+7qF/Ku6
 b3xJpRWwIx6hEgkMIuMXW80=
X-Google-Smtp-Source: ABdhPJwZa9+PebgWBijZl8ZpfPhsvVv+5fx1jKgEOnoG3OLNZ1SRDPhgyBTKBJniTxJ6H5j9CMvx2w==
X-Received: by 2002:a17:90a:1642:: with SMTP id
 x2mr17781764pje.149.1590938842814; 
 Sun, 31 May 2020 08:27:22 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:22 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:00 +0530
Message-Id: <20200531152621.2886-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 06/27] parsing_cocci: iso_pattern:
	Reflect struct end attributes
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

Struct end attributes are added to the SmPL AST. Reflect these changes
in iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/iso_pattern.ml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 5b4c5f61..6cd5f1cb 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -998,8 +998,13 @@ let match_maker checks_needed context_required whencode_allowed =
 		       argsa argsb;
 		     match_init ini1 ini]
 	       else return false
-	  | (Ast0.TyDecl(tya,sc1),Ast0.TyDecl(tyb,sc)) ->
-	      conjunct_bindings (check_mcode sc1 sc) (match_typeC tya tyb)
+	  | (Ast0.TyDecl(tya,attra,sc1),Ast0.TyDecl(tyb,attrb,sc)) ->
+	      if (List.length attra = List.length attrb &&
+                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                    attra attrb) (* no metavars *)
+              then
+	        conjunct_bindings (check_mcode sc1 sc) (match_typeC tya tyb)
+              else return false
 	  | (Ast0.Typedef(stga,tya,ida,sc1),Ast0.Typedef(stgb,tyb,idb,sc)) ->
 	      conjunct_bindings (check_mcode sc1 sc)
 		(conjunct_bindings (match_typeC tya tyb) (match_typeC ida idb))
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
