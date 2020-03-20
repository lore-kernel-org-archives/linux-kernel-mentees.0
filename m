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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1A2C4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE17020774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQyCa8cA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE17020774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A4D6A889B8;
	Fri, 20 Mar 2020 07:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-NRGEVZ2xxs; Fri, 20 Mar 2020 07:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 548578898B;
	Fri, 20 Mar 2020 07:03:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E80FC1D89;
	Fri, 20 Mar 2020 07:03:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40E3FC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 28C3E27495
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWdFo8j1TPpm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 08E7D2744E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:49 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id l184so2749048pfl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eY8uN9ZiTYVXH+rnlUtslQcR4wVjV9QbTbMABZr/Vwo=;
 b=gQyCa8cAnE8Qw5wKqASTu5aaqAQWCZW4pNEi6aFOyYKw9ojGtiP8JSvZSv1+BVpItc
 5QIuUmj101VnAvbqaftKXGUq1vWPJMeFT5M4hLc3uewNrJz6Yki9phS321MbYdkxMbtc
 8UxvY5dnqUcHPvCg0BxAIctMqVt3xH0/qtAxWx0mAoz81NVR3sQTj7LeQKF2rGfNdtBf
 20dhiWjQZp53r1EduQYQvHYRXSR2fU0G8/63YisbjKB97kStKwOWCdW25HLeJkdoZFLv
 R80oy9pgwc3DUFylM3UwubP0aUfvw55B6hPVtsnvilqEZZu721GjqzaBomh4hEnAKvGX
 uVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eY8uN9ZiTYVXH+rnlUtslQcR4wVjV9QbTbMABZr/Vwo=;
 b=WfQ43udY1qkMv/yKUucHP7Wh9Jbjl3zCcmrFAA2XkNjiIXYGuX384FnqlJ70xXsEto
 O3toBrgbV9bTU2fRCBkhFXA5LfMu/czRaIOtFbgpe9gK/TCM5Gib4H0dnaOwgKOVmU4W
 SK/AWFoJfBcigN5bm3zSKD8fQNHEgKux3tibKAxDyYcJ77PwH5hRQFun/DjWN/8eOyMc
 zSrm/F53oaMgP4ojYHq2pzgkbQy1UBWh4bNENbycDnKYjCaqyBiX0eebWVi5dQWztd9H
 elrDkOqid7ObtJ4FRed8cZkHFUjtpCGdndqr0dFU+nEcq7Fm4slCOcV1CKjWKgIXEQzY
 6YkA==
X-Gm-Message-State: ANhLgQ2CJQX7gxkzP5W1h6fIHqNtkMOVpfic/mLg3ylbADc4LttWNlBc
 OCBmZR4BMsD8XgOG92NMbkPT1CH8
X-Google-Smtp-Source: ADFU+vvvprRZnhyJod09oJ8a0jAyFf6SWu4Pr9FYtAyMUqJa28qxauEp9416qlq6GwJ56oNutYMBqg==
X-Received: by 2002:a62:14d7:: with SMTP id 206mr7729914pfu.43.1584687828540; 
 Fri, 20 Mar 2020 00:03:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:40 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:55 +0530
Message-Id: <20200320070157.4206-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 24/26] tools: spgen: Add cases for
	ParenType/FunctionType
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

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in position_generator.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tools/spgen/source/position_generator.ml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/spgen/source/position_generator.ml b/tools/spgen/source/position_generator.ml
index 31d6cb5e..2fa630fb 100644
--- a/tools/spgen/source/position_generator.ml
+++ b/tools/spgen/source/position_generator.ml
@@ -195,6 +195,12 @@ let rec type_pos t snp
   | Ast0.FunctionPointer(t,lp,star,rp,lp2,params,rp2) ->
       let constructor ~mc = Ast0.FunctionPointer(t,lp,star,rp,lp2,params,mc) in
       mcode_wrap ~mc:rp2 ~constructor snp
+  | Ast0.ParenType(lp,t,rp) ->
+      let constructor ~mc = Ast0.ParenType(lp,t,rp) in
+      mcode_wrap ~mc:rp ~constructor snp
+  | Ast0.FunctionType(t,lp,params,rp) ->
+      let constructor ~mc = Ast0.FunctionType(t,lp,params,rp) in
+      mcode_wrap ~mc:rp ~constructor snp
   | Ast0.Array(t,lb,expr,rb) ->
       let constructor ~mc = Ast0.Array(t,lb,expr,mc) in
       mcode_wrap ~mc:rb ~constructor snp
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
