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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE2DC83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EECC320730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNyoY/rX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EECC320730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CFC408648E;
	Tue, 28 Apr 2020 17:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXX0pR2vNttE; Tue, 28 Apr 2020 17:03:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D7038648C;
	Tue, 28 Apr 2020 17:03:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56A02C0864;
	Tue, 28 Apr 2020 17:03:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA4EFC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9F9B320464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-5haM1B2Nfk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 348B022846
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:02:58 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s8so406292pgq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mDnBPl3qIHtqg930rr9qdZdP5Uw3rvrHwoa1ZEd6TMs=;
 b=rNyoY/rXdi9R/wAiFTn7R3mfeNe3ziEbo3RjNgxitCbRCNX8t81tPLJtfQQ9+RoKov
 NV/pFZ1AP1oj3/2K9NlGB1JFtlL9oeNFnr9G9sgIbGUYu2Haup8bA8nZAXckdWriYfV6
 9Bvn3xeOlstS9fjJZAb/xAT3eVbmAPPXFEn8FUm1cUljWJIZuTmmVBP9iK942J9+3AgH
 wTX/IcPQTD3W6kyanQu0XE1NJtmLWQMJw6d4yzutbqqB+f18/dketrA6RwBCrXOzk2DT
 /4DeDoQ22shIPgcT+evKxryC2Ox3EOkgUWl8XxaMUD/dMnfES5KAv5jXY72uqIDtYYwu
 fjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mDnBPl3qIHtqg930rr9qdZdP5Uw3rvrHwoa1ZEd6TMs=;
 b=FCResvhOfHZMCvjqHVG3N9LeRtOgHBbYftDb797SY0Bt69R4xNJ/5oHkIfs0Z6foGw
 Rv5kHjc4FIqJRz5r48qB2lBCZJKPxtP9fIgAVYTwdawk19v28q+zzOk1cx0e05QQoZA0
 bjgG1azp5wY1PUrjZmyZ9+McylZYbdWFbBlbFErbsQ7hJnxEhfHCqPYFIarhUnzL/RAt
 G2l79mw4Zf6fqXVCj1p48MB2JQ8mDREASWbAHhUFeSzQIK+BfYGuldXD/R+pRdjxxR8L
 Fq/5Of0w2B1LpSq4rJjqdR/JRqwjWwVKp90WR2oK+9pCK/8wIBIyLIVb+48m/gT5bpJF
 /YDA==
X-Gm-Message-State: AGi0PuY6eXD+kDffOSfEITV8jdJF32YhKjxVl82YE+9drixatQV+1BX6
 RJCDJzHoCKGecbyCbpecOak=
X-Google-Smtp-Source: APiQypLsXOCeyVl2qilIHPM4I1AaCJ+iV+9qhwBEoEM9B/qRaL3HpiUQYe9nGtjv75Cb9CtQ+rkHMQ==
X-Received: by 2002:a62:3857:: with SMTP id f84mr32523134pfa.56.1588093377757; 
 Tue, 28 Apr 2020 10:02:57 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:02:57 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:00 +0530
Message-Id: <20200428170228.7002-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 04/32] parsing_cocci: visitor_ast0:
	Visit cast attributes
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

Cast attributes are added to AST0 of SmPL. Visit these attributes in the
AST0 visitor of SmPL.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast0.ml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/visitor_ast0.ml b/parsing_cocci/visitor_ast0.ml
index d9e340ed..2ccdb0bb 100644
--- a/parsing_cocci/visitor_ast0.ml
+++ b/parsing_cocci/visitor_ast0.ml
@@ -184,12 +184,14 @@ let visitor mode bind option_default
 	    let (ar_n,ar) = string_mcode ar in
 	    let (field_n,field) = ident field in
 	    (multibind [exp_n;ar_n;field_n], Ast0.RecordPtAccess(exp,ar,field))
-	| Ast0.Cast(lp,ty,rp,exp) ->
+	| Ast0.Cast(lp,ty,attr,rp,exp) ->
 	    let (lp_n,lp) = string_mcode lp in
 	    let (ty_n,ty) = typeC ty in
+	    let (attr_n,attr) = map_split_bind string_mcode attr in
 	    let (rp_n,rp) = string_mcode rp in
 	    let (exp_n,exp) = expression exp in
-	    (multibind [lp_n;ty_n;rp_n;exp_n], Ast0.Cast(lp,ty,rp,exp))
+            (multibind [lp_n;ty_n;attr_n;rp_n;exp_n],
+             Ast0.Cast(lp,ty,attr,rp,exp))
 	| Ast0.SizeOfExpr(szf,exp) ->
 	    let (szf_n,szf) = string_mcode szf in
 	    let (exp_n,exp) = expression exp in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
