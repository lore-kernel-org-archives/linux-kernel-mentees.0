Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D6EC54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3976320656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ef+0b1js"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3976320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 22D072156B;
	Mon, 27 Apr 2020 12:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LcyTbZ6FvicZ; Mon, 27 Apr 2020 12:09:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B5BAD203F0;
	Mon, 27 Apr 2020 12:09:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2E9AC1D74;
	Mon, 27 Apr 2020 12:09:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0257C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 15DB384763
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id va8+fvR7Mh5t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2EE0C8620F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:09 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id h12so4634096pjz.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZcLgsD2NT4RKlSvX8OLhp3WwZOfSpNZrQHDX9kzUnVA=;
 b=ef+0b1js6ziep3xZnZxScPoP82nnbTitMcOPp3viS4EJ+Xn92FqJosm0eBIfkr5R3+
 v/WuNpz56hHHJHhDCxh/FQjjsXpFrVgU691bLMYwpjfvshEmXX70qa0TQkmWolvPlcRP
 YTdkOtssE3iYbVQV+qeGgKTTO7wxWaU2W2Ugs42fmLin1ilw6gDEW/clTUR6Pq3WHdT2
 NLCq5mlTX4hvXV6vKyO5txQkf0Oml308DhFpbmx05BMfeGUqFd+aT3S6pfW2LTG/qmyk
 5yif8WcDgQBkxiINCIWvKjmh8hVbCOE8xgsjLrmvmwY+ufldfx/UzJNKOX/j2D1K8Rl+
 yqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZcLgsD2NT4RKlSvX8OLhp3WwZOfSpNZrQHDX9kzUnVA=;
 b=OcMKfqVL0ilNDiIFgRGNzPPvJsb844qJy6tKBYByVbjl/sqqr8ErBFYNcVINoK7t1r
 YwCVgkAmhQYIoH+p+76UKGsXMscE3INoTrtjwNorjtr7VC+4ysN2eipUbs40gVMUld+f
 bUJX07I9siZ0FrC+vWlQ+dlmtWlRli+WM879IgdsMrZjAG9TsFd2IE/XxdIV5QPisS0p
 x9+XohZMpv/fwRpP57N7ygWS9w+FmVL/DDQkswzbTEUKZflAKUUGaibHXhKdZgpe2Zn0
 m3jcu8N1YD6nj+ppbLXMkhJxu3noWwvBFEhsR+v/j0G3fZ/pIquzCNTjtZEucYntHvWU
 rZ1A==
X-Gm-Message-State: AGi0PuYPOPsQ1Lwm0ZAtufTWBGqfr+n4LQA8945sQ9FwBSDmLuGorZqB
 6V179f5o7drUQphD0XUMmcQ=
X-Google-Smtp-Source: APiQypJ18TUhWMfbVdB6r3QXUJzv6dXIDHPYSbO1mI92BRqC/H2pITAZlvnZV+h6oA6t3Dcvqi8x/g==
X-Received: by 2002:a17:902:a985:: with SMTP id
 bh5mr18640511plb.163.1587989348659; 
 Mon, 27 Apr 2020 05:09:08 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:08 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:17 +0530
Message-Id: <20200427120834.380-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 06/23] parsing_cocci: compute_lines:
	Reflect Parameter attributes
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

Parameter attributes are added to the SmPL AST. Reflect these changes in
compute_lines.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/compute_lines.ml | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index 1361d842..9bf4ab06 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -914,13 +914,16 @@ and is_param_dots p =
 
 and parameterTypeDef p =
   match Ast0.unwrap p with
-    Ast0.VoidParam(ty) ->
-      let ty = typeC ty in mkres p (Ast0.VoidParam(ty)) ty ty
-  | Ast0.Param(ty,Some id) ->
+    Ast0.VoidParam(ty,attr) ->
+      let attr = List.map normal_mcode attr in
+      let ty = typeC ty in mkres p (Ast0.VoidParam(ty,attr)) ty ty
+  | Ast0.Param(ty,Some id,attr) ->
       let id = ident id in
-      let ty = typeC ty in mkres p (Ast0.Param(ty,Some id)) ty id
-  | Ast0.Param(ty,None) ->
-      let ty = typeC ty in mkres p (Ast0.Param(ty,None)) ty ty
+      let attr = List.map normal_mcode attr in
+      let ty = typeC ty in mkres p (Ast0.Param(ty,Some id,attr)) ty id
+  | Ast0.Param(ty,None,attr) ->
+      let attr = List.map normal_mcode attr in
+      let ty = typeC ty in mkres p (Ast0.Param(ty,None,attr)) ty ty
   | Ast0.MetaParam(name,a,b) ->
       let name = normal_mcode name in
       let ln = promote_mcode name in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
