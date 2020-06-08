Return-Path: <SRS0=Jgkt=7V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AA7C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:21:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7B12076A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:21:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZKycvy2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE7B12076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7C9386DBD;
	Mon,  8 Jun 2020 12:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3GLkShQ2ti6; Mon,  8 Jun 2020 12:21:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4014186DB2;
	Mon,  8 Jun 2020 12:21:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F961C07FF;
	Mon,  8 Jun 2020 12:21:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53EB6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3D2E086031
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1h3LDP35w9sj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:21:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D37C484F9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:21:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t16so6590577plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Jun 2020 05:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KpNADySjSxgviZ47NrIw80ayrJdSlH5yFH10DEh6Q0w=;
 b=nZKycvy2w6KMWaLoR/N6Jxhr/1KG+jd/puMz8/26FwZJVTQSmQgejm261IcGrjv6G+
 kPkIhwth9R1xTMY80Qts2sImQN5wLfE+rv3OFbjfGheLwAl2THT/Fskc8C6h7UBXts18
 OMqPhERaIDx1+a0qq9eySYZ+ZtHY4U5KiwkvGoCY3yajmgIpOnwhNtcu21Pub2nY1XGK
 Wz5HH2buGP3716CaXgdcaU/KZ5d1MFxAArq3pJGpz6/MuuHSbKC5Q+GvWPYenEYEilJL
 U3kkpZtdQR6Ib1+zOLgOF3kAT5Y0fEaaTvQnaRYnS9Fd7oL9yPlrqn9fDLvYPct6Gddm
 mR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KpNADySjSxgviZ47NrIw80ayrJdSlH5yFH10DEh6Q0w=;
 b=ZA7hs1pBUwRFziScvB1nGH9919i55hDcrqmlsCUGWci60Qi/+xkZAySplcquY/kZf2
 ZHR+TXMZRL187G15EiMhe+hHgA8LFpXJgirk6qqzuKfH8wYfjsyj78gQEOBGC/72uSrQ
 FSTi4HJu/TpQuHJkMri7dJhpP1OvPiEA//3tjHigRTUcqMRFTl1CbhVfan1npwhlPMRb
 U7iAiLPPSEnVvGhOtVOGcRANpxLaOhKXwQHp0em/OttlLAvV5LfmCxJAT0eX01vdspSf
 FM57iIKqU9Ejxl+C2d7+UEDyYH1VB6G/7x5E2zf0W0jpwHp4Td905eMS4YQPPqvjlDRY
 uWHw==
X-Gm-Message-State: AOAM533Sgs1W2+GDzTpdeqPTS2lOdd6ouUivOsIKjBMO0xkbMibWpf4D
 vkpVuZ+Rpyt4DqZJWGplXmU=
X-Google-Smtp-Source: ABdhPJz9XlDcc/DxNbc5wo6U98ssO56xSpZFoRGydxGX1FlaNB0frnpgtna8PyWw3Es168K16F4ctg==
X-Received: by 2002:a17:902:ee12:: with SMTP id
 z18mr20829277plb.211.1591618860366; 
 Mon, 08 Jun 2020 05:21:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:1863:7add:d8e9:7114:e8b0:51a9])
 by smtp.gmail.com with ESMTPSA id i5sm15747657pjd.23.2020.06.08.05.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:20:59 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon,  8 Jun 2020 17:50:36 +0530
Message-Id: <20200608122037.28019-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
References: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/4] parsing_c: parser: Use
	end_attributes_opt in field_declaration
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

The field_declaration rule has redundant code caused by additional
productions for end attributes. Use end_attributes_opt to resolve this.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index ebb3b327..61bb1ca0 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1851,23 +1851,7 @@ struct_decl2:
 
 
 field_declaration:
- | spec_qualif_list struct_declarator_list TPtVirg
-     {
-       let (attrs, ds) = $1 in
-       let (returnType,storage) = fixDeclSpecForDecl ds in
-       if fst (unwrap storage) <> NoSto
-       then internal_error "parsing don't allow this";
-
-       let iistart = Ast_c.fakeInfo () in (* for parallelism with DeclList *)
-       FieldDeclList ($2 +> (List.map (fun (f, iivirg) ->
-         f returnType, iivirg))
-                         ,[$3;iistart])
-         (* don't need to check if typedef or func initialised cos
-          * grammar don't allow typedef nor initialiser in struct
-          *)
-     }
-
- | spec_qualif_list struct_declarator_list end_attributes TPtVirg
+ | spec_qualif_list struct_declarator_list end_attributes_opt TPtVirg
      {
        let (attrs, ds) = $1 in
        let (returnType,storage) = fixDeclSpecForDecl ds in
@@ -1883,19 +1867,7 @@ field_declaration:
           *)
      }
 
- | spec_qualif_list TPtVirg
-     {
-       let (attrs, ds) = $1 in
-       (* gccext: allow empty elements if it is a structdef or enumdef *)
-       let (returnType,storage) = fixDeclSpecForDecl ds in
-       if fst (unwrap storage) <> NoSto
-       then internal_error "parsing don't allow this";
-
-       let iistart = Ast_c.fakeInfo () in (* for parallelism with DeclList *)
-       FieldDeclList ([(Simple (None, returnType)) , []], [$2;iistart])
-     }
-
- | spec_qualif_list end_attributes TPtVirg
+ | spec_qualif_list end_attributes_opt TPtVirg
      {
        let (attrs, ds) = $1 in
        (* gccext: allow empty elements if it is a structdef or enumdef *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
