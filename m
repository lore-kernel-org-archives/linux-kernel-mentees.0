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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BEEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BDF5206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bknaAKrh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BDF5206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EA5C0221BB;
	Sun, 24 May 2020 17:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLYGzndKvNmC; Sun, 24 May 2020 17:22:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2014C20022;
	Sun, 24 May 2020 17:22:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C2DBC0178;
	Sun, 24 May 2020 17:22:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0BAAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BDBDC874F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDRwhX3dqpR4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5D09E8701C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:46 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id t8so5458582pju.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NBWu/XHzPYAwW6zcyT2ksTuyYehC4xbj5Y/cE5yhHZs=;
 b=bknaAKrh4Ko3mW4EF6XDbc3pnuI9qsCbyF5QexeUo80nhGacE9BSof6Qg1tFxkdh48
 8dl/5NIkW9/ch7TwF0hbsjoyTpdzghAJbSA/SssQF96YWDSXjfesyiQm274iVsTsQs3f
 AhGvcAZptFsu7ePmb/1ztMpmBB9lEtK+W6gZGVD+WZPRAzpiA2uKmMxLfwWwT1++hNPm
 sjwMjDGZhSGbWnLiAMHtpjwESLa+03zd5tN7vC3VTIPBNpELIfmu3jyFBTCTL76Hv7TH
 eJaZlNitIBGZnGtaYi+yULefNXNhBcjSi1Vzo3fs0jyeqcJYOxmvvF0KC2LKTGYvlbaR
 jCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NBWu/XHzPYAwW6zcyT2ksTuyYehC4xbj5Y/cE5yhHZs=;
 b=jtgRMxWXSnqG98hadWBVkQYpC3QjhuxGq+BZF5uPHl0AS6q8hg222eliUU7pqFFchC
 sgpbW3+fW5VrqAeI3Cc5yeVPX6pvbZTKNAQB2i40pWDp8c9v7dPJeT0X5E3qQesq9KPg
 vMrwMrwTx2tvBXR7SKI5BQJtc0sQo1R8WHAUlnExNofnOVrc172cRQl35eVqUoiupNVw
 zU8bQUYnzs1YZOZEZ22+ArwdX3349ifAhGjjk7MvqXQSHNeAmpZhlQo7TRz9LI5ncW52
 68X023PU/iOp2FiLoW20ZRq5IvMXNwZ36UR4mtl2oNgGFQBeRZeWMzEemlKkcOIBBdi2
 TtwQ==
X-Gm-Message-State: AOAM531aglJv/7PUvFgfgMiZiUIosY6hr1KEaEQbzvDHbNtsVhkOebWh
 LkkjkJ+I0LdWLa+pRwFtrdDFJ05z2fw=
X-Google-Smtp-Source: ABdhPJzxsUKl2vvRNpsAgE4SJ2mSswLTVPzUz7xGdeaM7SLBorfGbz2MFN1Fl5WWfm2fgg+ymlWXiQ==
X-Received: by 2002:a17:902:7488:: with SMTP id
 h8mr24941746pll.128.1590340964647; 
 Sun, 24 May 2020 10:22:44 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:22:44 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:33 +0530
Message-Id: <20200524171935.2504-29-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 28/30] tools: spgen: Reflect
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
spgen.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tools/spgen/source/meta_variable.ml      | 2 +-
 tools/spgen/source/position_generator.ml | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/spgen/source/meta_variable.ml b/tools/spgen/source/meta_variable.ml
index 2197a3f6..31456614 100644
--- a/tools/spgen/source/meta_variable.ml
+++ b/tools/spgen/source/meta_variable.ml
@@ -538,7 +538,7 @@ let metavar_combiner rn =
         meta_mc_format ~mc ~typ:"declaration " ~constr
     | Ast0.AsDecl(dc1, dc2) ->
         let dec = c.VT0.combiner_rec_declaration in as_format dc1 dc2 dec dec
-    | Ast0.MacroDecl(_, id, _, expdots, _, _) ->
+    | Ast0.MacroDecl(_, id, _, expdots, _, _, _) ->
         let expids = c.VT0.combiner_rec_expression_dots expdots in
         MVSet.union (ids ~rn ~typ:"declarer" ~id) expids
     | Ast0.MacroDeclInit(_, id, _, expdots, _, _, ini, _) ->
diff --git a/tools/spgen/source/position_generator.ml b/tools/spgen/source/position_generator.ml
index 757faf5f..618ba19b 100644
--- a/tools/spgen/source/position_generator.ml
+++ b/tools/spgen/source/position_generator.ml
@@ -419,8 +419,8 @@ let rec declaration_pos decl snp
   | Ast0.Typedef (tm, tc, tc2, sem) ->
       let constructor ~mc = Ast0.Typedef (mc, tc, tc2, sem) in
       mcode_wrap ~mc:tm ~constructor snp
-  | Ast0.MacroDecl (st,id,lp,ed,rp,sem) ->
-      let constructor ~id = Ast0.MacroDecl (st, id, lp, ed, rp, sem) in
+  | Ast0.MacroDecl (st,id,lp,ed,rp,attr,sem) ->
+      let constructor ~id = Ast0.MacroDecl (st, id, lp, ed, rp, attr, sem) in
       id_wrap ~id ~constructor snp
   | Ast0.MacroDeclInit (st,id,lp,ed,rp,eq,init,sem) ->
       let constructor ~id = Ast0.MacroDeclInit (st,id,lp,ed,rp,eq,init,sem) in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
