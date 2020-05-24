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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911B4C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F4C3207DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoJ1KQHe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F4C3207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4EBA785FFD;
	Sun, 24 May 2020 17:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQ1AwPeO_tUY; Sun, 24 May 2020 17:20:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EECC985F6C;
	Sun, 24 May 2020 17:20:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB0A8C0178;
	Sun, 24 May 2020 17:20:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB99CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DBC6785F83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgOw_rMKf1_d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8D72D85F6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:56 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w19so6606992ply.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oaqB0eFbbqjwOp8kwNjw6yCTOqMGnl831G6vpg8CDQM=;
 b=IoJ1KQHemTtRezT3n7xBs3PUOY/5AhGb9EHMaVFsJq12shl5NU5Mu1QziwSgUBbMnx
 Y+dJKyUUo5rj/59rS4uRswTwTzgNf9uLia80LiOddSU+TAvl1FS5jOfLWZKZQ65coUv9
 EwSjuGDwfaQcPB+ZvATJDdQrHmNWk56PapPZqoo+rovqrTFbTwm2kHdGgTOiT8AhKq55
 ndYFrzLIM85PqYpN+orlHOrZ3Yo+O8ms1g2m0ZurIYSxZiYyKQrOdeLrMOjglFNE3cEI
 zrqQpWO3Hi84q3jd/9pH6WKEaTzGPNioaXySS2FI/8nfr3J2s1NOzLw/sDUQY1WBs+o6
 lPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oaqB0eFbbqjwOp8kwNjw6yCTOqMGnl831G6vpg8CDQM=;
 b=fretP4k01SpxegRzyGk7N3sJqdrjr1yOj4nKaUxOEjKKzVIceLGkqpX/aQBD5mgyOt
 R/hWh6VExKhYQ4oFrRWfEDTab/W+IcqhKOTvTO5hQJTus/ve4eDFe7oxyE/y/RxEmmCD
 6Kak1U6NHWxfDz7Uo4y0YR5b7cJJaZpbMsgIw6BVjesEaevk69tReBDw5i8I3QUDWrdy
 WfId5h3uWkOvgIBERTrCFlUkwVdZyAp9NVXh0T8VxV5NKEX7/rI0ydjSwP+UmS/Ef9L0
 JFqEMlF4ltGzqXRx2K9n1AHyQUBGwISNAe69KhDYljdQZM1rhPhDUaopHfIvQBLTFL67
 axDg==
X-Gm-Message-State: AOAM533btvsgNNiL9q1qlZszs6yxeLEYdOem3gLZE3qAnrZ0ezV7ldTB
 wxHqqzYSk1uKenJt4EWRvHJgXBKsfv8=
X-Google-Smtp-Source: ABdhPJzND+6hCrF+1O1I0Q6k+fwr1C/oekuPWahRZGGjdLTVNYcpZPU3Ci+tA+28GuKOA4G/yDidYQ==
X-Received: by 2002:a17:90a:d70a:: with SMTP id
 y10mr16298199pju.53.1590340856151; 
 Sun, 24 May 2020 10:20:56 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:16 +0530
Message-Id: <20200524171935.2504-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 11/30] parsing_cocci: context_neg:
	Reflect Macrodecl attributes
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
context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index dd768a61..4b1376cf 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -752,9 +752,9 @@ let equal_declaration d1 d2 =
        List.for_all2 equal_fninfo fninfo1 fninfo2 &&
        equal_mcode lp1 lp2 && equal_varargs va1 va2 &&
        equal_mcode rp1 rp2 && equal_mcode sem1 sem2
-  | (Ast0.MacroDecl(stg1,nm1,lp1,_,rp1,sem1),
-     Ast0.MacroDecl(stg2,nm2,lp2,_,rp2,sem2)) ->
-      equal_option stg1 stg2 &&
+  | (Ast0.MacroDecl(stg1,nm1,lp1,_,rp1,attr1,sem1),
+     Ast0.MacroDecl(stg2,nm2,lp2,_,rp2,attr2,sem2)) ->
+      equal_option stg1 stg2 && List.for_all2 equal_mcode attr1 attr2 &&
       equal_mcode lp1 lp2 && equal_mcode rp1 rp2 && equal_mcode sem1 sem2
   | (Ast0.MacroDeclInit(stg1,nm1,lp1,_,rp1,eq1,_,sem1),
      Ast0.MacroDeclInit(stg2,nm2,lp2,_,rp2,eq2,_,sem2)) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
