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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B638C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E62206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InjJvtn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3E62206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C60CC85F93;
	Sun, 31 May 2020 15:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbYvZ1_GFmMO; Sun, 31 May 2020 15:28:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 768BB85F11;
	Sun, 31 May 2020 15:28:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65925C0863;
	Sun, 31 May 2020 15:28:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E87C8C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D7E4D86B05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8rJ50FJRxj4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 83A3686ADD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:11 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id q24so3806671pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9RKu4+hBUs9HmPljH1l7+WPmn25c+K+wryyLk+AOrw0=;
 b=InjJvtn+F/movD8J397mnw/IhDjOpHCIoVz1XN1m8HRb644+xuTVlGToeq9VdUjxrZ
 Qz9YyYntc/1Gj133Sk0y8UfuZFwopZXsXDGAIXm/Uduvm1jPcL/Yo+Dw4n6EuNBLLA9E
 p48e2EDX/iFzsz7ouvAGG4eYo/Piu7Mwlfgwi/jjiI323hMWYB7fCVzenwhjdSmrfiaM
 cy3SsAiIo0RznJj6AKrVZwXzK8hJHbCGyQT3KL0L5t63daYWVqcMx8jVxG1kzCb/f8x2
 n6iax4oDK/OOG2uKvejddjrWakSmSgbJb4dpcSqnzeSz/I1ByGKDlPa1aUb7uvanZfeR
 +gKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RKu4+hBUs9HmPljH1l7+WPmn25c+K+wryyLk+AOrw0=;
 b=BYHnxTqU3Xz3UFoQAk7RO5f2o+Q7MGjwYUyq97yPlz3AMbFKtwIw71XuHaJyJLLhVB
 nY9dPujm3ZNq+yoW69cQte/8ikO3g1mkos7SH7vuNEipYqDQG3cPXN0dR598iCyxWTmr
 V3hIXC1h6V8IKp75RWujmSOSH7brL84wOLoT16M4WWtYlKaPPfiW9Gt1geRKGE3uAFAz
 kozQqGOuJd3LN8sQmbyMOzhBJkUcCO0/mDvocZfoDGoAKMV/yQ405p/KHREbY5F/J4qG
 j03Epwub7dAhLe9nPkNzjzIOF5cRxCUczBUOzKPbwiRrARMZS00t0aQk3liZxqFTgTj7
 2A3g==
X-Gm-Message-State: AOAM530p1N4+k1l/a8p7CxGeklDz+jgk6P45lB0xRX57EmquXWh7TRPm
 NONwlQ1fTfqlDrIDFnYGCfI=
X-Google-Smtp-Source: ABdhPJzQ7YGN1bX+wb3AjAL9iFT6FhTOiLg1Zo9Fx01/5D1GxgIvSNCOL0lF2mahli36IUhoerUJ9g==
X-Received: by 2002:a17:902:8697:: with SMTP id
 g23mr14392117plo.306.1590938891011; 
 Sun, 31 May 2020 08:28:11 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:10 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:15 +0530
Message-Id: <20200531152621.2886-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 21/27] engine:
	check_exhaustive_pattern: Reflect struct end attributes
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
in check_exhaustive_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/check_exhaustive_pattern.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/engine/check_exhaustive_pattern.ml b/engine/check_exhaustive_pattern.ml
index b702063d..fe2dac67 100644
--- a/engine/check_exhaustive_pattern.ml
+++ b/engine/check_exhaustive_pattern.ml
@@ -62,7 +62,7 @@ let dumb_astcocci_decl = function
    A.UnInit (stg, typa, sa, attr, _)     -> ()
  | A.Init (stg, typa, sa, attr, _, expa, _) -> ()
  | A.FunProto _ -> ()
- | A.TyDecl (typa, _)     -> ()
+ | A.TyDecl (typa, _, _)     -> ()
  | A.MacroDecl(stg, fn, _, eas, _, _, _) -> ()
  | A.MacroDeclInit(stg, fn, _, eas, _, _, _, _) -> ()
  | A.MetaDecl _ -> ()
@@ -78,7 +78,7 @@ let dumb_astcocci_initialiser = function (* seems same as the above *)
   | A.FunProto _ -> ()
   | A.MacroDecl(_, fn, _, eas, _, _, _) -> ()
   | A.MacroDeclInit(_, fn, _, eas, _, _, _, _) -> ()
-  | A.TyDecl(ty,sem) -> ()
+  | A.TyDecl(ty,attr,sem) -> ()
   | A.Typedef(d,ty1,ty2,pv) -> ()
   | A.DisjDecl(decls) -> ()
   | A.ConjDecl(decls) -> ()
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
