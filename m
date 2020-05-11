Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC138C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEE3120731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uP0gu4g3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEE3120731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B2CBB888F5;
	Mon, 11 May 2020 10:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j747YahgYHlg; Mon, 11 May 2020 10:09:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58C10888DF;
	Mon, 11 May 2020 10:09:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA23CC0176;
	Mon, 11 May 2020 10:09:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B3F6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 17B9924B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0kikO6JfNhe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 7E45924B59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:33 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id 7so7259141pjo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XsOUCWb5UG6k/8xHVHn/Y03zDxBj23UKsYCk5pFSAy4=;
 b=uP0gu4g3fUuUWBEgNz5Nqzy4+nIt8GKdWO/h/ERjwlD/spSR6/HRhbPBK2jOvZSROy
 2DC3DmwB7fVhNB3zZXyZHlFlHGpXNU6D3Hk7K9oS81WclnKLx2yR0tX9xZhippCDHi2T
 6HmpyNUDA3oAnSfVymD1S+qA3mFp4bq+Xbqs8F/jzlNCLJ0nbyJitx7R2i2J0oSZzuAO
 kn7COFZ0QLc3Y3u/lO7P1N99SqLbSs3O0dOP68f3lQZ/EMSlf/uP4qoOYRc40OCsxH7j
 H/+pW+UtS6j/ZReEGoleM56ItKGhmL4WuZCAF9MVWDbFJ8If9oCLABEeC75R4OKdrzEY
 hnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XsOUCWb5UG6k/8xHVHn/Y03zDxBj23UKsYCk5pFSAy4=;
 b=lWAqx9fYBeNwWz+vW78tnBiQjSLDugzCWPkR3ZiUHr4bOsj2y3urqH3h+FSK/ztyvh
 I9JF3huRlIPBKCbRHZX+xGSD0HhwJcGz5nkebvgEms2iXO1XxMPdVxQaxDA9q/wWpV0D
 jZkmUr7qWqqv1Ghuk49JztGw8Wk5wX7fIcZmnfxBsWWFado6tGQVlALqpEXW1W3399z2
 9+xMC1Yk6mTZEJl6I3VtJa0p/bd1zvMwqNHd1E2A8ptm6ZZ/2M5mWIjkHWcnrx4+jVMJ
 OdckEvgUIXS52b8uBLbmdVxK26HAySDHYng+Co0Tl3R2anHJrTjbsHgKU8prPTN/y+A+
 eehg==
X-Gm-Message-State: AGi0PuZGOMU+tf1Zfu+N0SCeJGH0coEWKsCmx9w3QBhTrH5VrR10hthP
 bbiQfEPu6T8MxDlXl/g2DR8=
X-Google-Smtp-Source: APiQypLCKrmpPawaTIiaEP0hZjWBQoqVZGbo4QDncI3H3XkwbSHFXscC8HDKCrL3A7QwqZQqBShnSg==
X-Received: by 2002:a17:90a:376c:: with SMTP id
 u99mr21750489pjb.228.1589191772862; 
 Mon, 11 May 2020 03:09:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:32 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:12 +0530
Message-Id: <20200511100715.19819-30-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 29/32] tools: spgen: Reflect Cast
	attrs
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
position_generator.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tools/spgen/source/position_generator.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/spgen/source/position_generator.ml b/tools/spgen/source/position_generator.ml
index 757faf5f..9143a474 100644
--- a/tools/spgen/source/position_generator.ml
+++ b/tools/spgen/source/position_generator.ml
@@ -359,9 +359,9 @@ let rec expression_pos exp snp
       let c ~exp ~id = Ast0.RecordPtAccess(exp, arrow, id) in
       let alt() = id_wrap ~id ~constructor:(c ~exp) snp in
       exp_wrap ~exp ~constructor:(c ~id) ~alt snp
-  | Ast0.Cast(lp, typec, rp, exp) ->
+  | Ast0.Cast(lp, typec, attr, rp, exp) ->
       let _ = type_pos typec snp in (* sanity check for disj *)
-      let c ~exp ~mc = Ast0.Cast(lp, typec, mc, exp) in
+      let c ~exp ~mc = Ast0.Cast(lp, typec, attr, mc, exp) in
       let alt() = mcode_wrap ~mc:rp ~constructor:(c ~exp) snp in
       exp_wrap ~exp ~constructor:(c ~mc:rp) ~alt snp
   | Ast0.SizeOfExpr(sizeofmc, exp) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
