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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD26C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A41206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4I11BUH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A41206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0D36920461;
	Sun, 31 May 2020 15:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1fsfbf8TSPz; Sun, 31 May 2020 15:28:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D498D20030;
	Sun, 31 May 2020 15:28:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D10A9C0863;
	Sun, 31 May 2020 15:28:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18686C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ED08A20030
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gVhNIol3pD5N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 2785320438
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:21 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id h95so2918446pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NXUeytJ5uRBtX8W1ChtiyG/4HvNDjSGAAyZIqVaTHdw=;
 b=b4I11BUHNWbIm38/UnWDKfD2vpmg8rkjW7lirjMXKczqCxh7vxqZqF8QMiMC3J7u1f
 /lW3QAguRQwJ/NaHPDaWtU45/Vy4UTi1gfxmNMoBznK/Meseh94CUtbovIhZ3Mro0rrV
 KzoiiLsQnQ1axb2HHVczygjNwC7vdhG3IceYfovTlw0YA/fdX07jKSnCZsaR2t5946Jd
 1DJxnMxCm1Dwk8l+E5kUu/UmU5ifoLEB/zC647478TFXIgPY+nyOsuFnig4WDwEcx/1j
 RyjjjsPet7fHCov4sK69LmJvCNSHc0g/nCMNKkCCrL7hc3IgKlwGJ+zKpUWfSGXDfZGd
 gWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXUeytJ5uRBtX8W1ChtiyG/4HvNDjSGAAyZIqVaTHdw=;
 b=QV8SSfsREgC3aue5e3wZKLUkltIBiEiKYsC5GONHDjPh3Thnx/JwflndyfCSU5aPXQ
 zlQW/DY+yj9skpRYoFvQVHHV+Ivc2c4z1QiJ+IzZolWCSEEtsZhkzEJWvN7IXrIlbJfu
 IVVzZik7Om6V5C7D95SFt4CcA7W2bZckGvo9aw7xrdhsHJbIIG9lGx/tO/mWIPut1jnn
 AJxjGFIWZxvuJJ8XbT2SWG5U9hn4/uZQncpQOR/0SXW28CUrwOpUL7kUJLsqMlOadmeY
 IFkSQodMbl9E1r7FlbxqmlHVxbNcYdYtxhSiEVzZJ7xWL7pcK53o28ogyajiFpKFQ+3u
 vqfw==
X-Gm-Message-State: AOAM5318t83sA7T/CEms442de+fD61gHXGfXHgsC6PUUpqAnlsUh+VOh
 W0GyuodHKCkgUQLYtzL3ABQ=
X-Google-Smtp-Source: ABdhPJyjbPoVru2z3LJr+IjdZ2gwKBF3O/42f+YAw0BKqoK8FgYFwLQFBqdpVhUCR/pagLdKv1WthQ==
X-Received: by 2002:a17:902:7e01:: with SMTP id
 b1mr2560600plm.234.1590938900707; 
 Sun, 31 May 2020 08:28:20 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:20 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:18 +0530
Message-Id: <20200531152621.2886-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 24/27] tools: spgen: Reflect struct
	end attributes
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
in spgen.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tools/spgen/source/position_generator.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/spgen/source/position_generator.ml b/tools/spgen/source/position_generator.ml
index deca6f73..e70a47b4 100644
--- a/tools/spgen/source/position_generator.ml
+++ b/tools/spgen/source/position_generator.ml
@@ -412,8 +412,8 @@ let rec declaration_pos decl snp
       let _ = type_pos ty snp in (* sanity check *)
       let constructor ~id = Ast0.UnInit(st, ty, id, attr, sem) in
       id_wrap ~id ~constructor snp
-  | Ast0.TyDecl (t, sem) ->
-      let c ~item ~mc = Ast0.TyDecl(item, mc) in
+  | Ast0.TyDecl (t, attr, sem) ->
+      let c ~item ~mc = Ast0.TyDecl(item, attr, mc) in
       let alt() = mcode_wrap ~mc:sem ~constructor:(c ~item:t) snp in
       item_wrap ~item:t ~item_posfn:type_pos ~constructor:(c ~mc:sem) ~alt snp
   | Ast0.Typedef (tm, tc, tc2, sem) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
