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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC22C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2304207D5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl6zROxR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2304207D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A16C084B6F;
	Sun, 31 May 2020 15:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjalUl0wTC3s; Sun, 31 May 2020 15:27:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A794B84AAE;
	Sun, 31 May 2020 15:27:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4160C0863;
	Sun, 31 May 2020 15:27:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC6E9C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CB9E487E3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VaCLOl7Q1D5x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6743D87E2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id v24so1166184plo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWAsQSn0NCXnW2R3p4nW1Uw8wyNBP6QIXBIJaWZEtGo=;
 b=Dl6zROxR4MPo5JFy9ww1jAU3LBH8zyQJjvTJ5I2tkSm0Da8aklmH1kFqmyh88iYnF9
 HVUsC4+J7Nhbm3YjxizbZdAuBWedzUOY/JByyCRCq/bNc1oo7naVWD3FX8OrehoQJZTK
 Ao1GNBXQuqTZ5Zq6iyjFPnZYHDggWzftW78474gaSDnllAgHPQRcsAkbcnmBW6zeMX4A
 RS2aoU+PZNuPJ+2UiAjYJMMTHwCYo1mI+scjOfZ1RCLzxI6dHm/H30Qv9IRo/zBT0nFg
 /YZbILS0cXKdgF4uenyj5Q2n2dRMHjh2Na9Fa4hrlgnMt7Fnt50Hj+ls5iFmkSKjoYLA
 Bf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWAsQSn0NCXnW2R3p4nW1Uw8wyNBP6QIXBIJaWZEtGo=;
 b=kbIVevzjEEB8goP0uHw7Q+FnwqQZCVOV6Emf5dkdmRnNzfFl8LsDOCXhlx5UC+/xsG
 qvZg1obn6vJfxnycDPVbj6/HBkGAB8DqmexcoR1RK5Xbd5QA1pp3cG9ZMZULnEIcJv7u
 VyBzZSEdp6gxgXjojo7oDxhGHZm3E2BpUTcZFhXKR9pwAMaHzLpHYBhcj60NJrFxHfsY
 1qgzNNQUcQRqbJtvJvqWrVCarFIS08c643MdtpfggLf3QPiLX0m+dkLhoVmydfQZvfVp
 YM1lZ1vRc/w20fdgFe/vOqWxrVgipYrAra2ZeVFgzf3C8vKu+qUx/TcgzEObyYAlF3Rl
 olRw==
X-Gm-Message-State: AOAM5304/0DLQBY9Ofa2h8xYfolElbD58Vpa+4piLVfN7AjXD3kmuXqw
 LKrKbnqjZ4gLUU2fEmElgp8=
X-Google-Smtp-Source: ABdhPJzEVd77ofGTk4+PPBGkdJ1rREjUfuSUrukd85DlM8HBLAr7AFTPnM2yvQsRUxCGaCDVtKoZNQ==
X-Received: by 2002:a17:90a:d783:: with SMTP id
 z3mr17740834pju.187.1590938846013; 
 Sun, 31 May 2020 08:27:26 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:25 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:01 +0530
Message-Id: <20200531152621.2886-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 07/27] parsing_cocci: type_infer:
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
in type_infer.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_infer.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/type_infer.ml b/parsing_cocci/type_infer.ml
index b5bc3a38..02e300a2 100644
--- a/parsing_cocci/type_infer.ml
+++ b/parsing_cocci/type_infer.ml
@@ -384,7 +384,7 @@ let rec propagate_types env =
     | Ast0.MacroDeclInit(_,_,_,_,_,_,exp,_) ->
         let _ = (propagate_types env).VT0.combiner_rec_initialiser exp in
 	[]
-    | Ast0.TyDecl(ty,_) -> []
+    | Ast0.TyDecl(ty,_,_) -> []
               (* pad: should handle typedef one day and add a binding *)
     | Ast0.Typedef((a,_,_,_,_,_),b,c,(d,_,_,_,_,_)) ->
 	[]
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
