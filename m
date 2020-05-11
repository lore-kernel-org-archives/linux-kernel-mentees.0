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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24E0C54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7D48206D6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lib4o9sr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7D48206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BDE3185D40;
	Mon, 11 May 2020 10:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27lLhi1CCpXO; Mon, 11 May 2020 10:13:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2FE1E863DB;
	Mon, 11 May 2020 10:13:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BFDBC0176;
	Mon, 11 May 2020 10:13:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81214C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7B52C24C2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CR7TvwkMoxJ9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C9D424C10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:40 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id t9so7652925pjw.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNK86jdCWpZvvuZbrZBw1TBtV6hkQFeqAzcg7yMFU+c=;
 b=lib4o9srr9cMamEx4Z/FYbQasBfwu61ExGcgIj84mC9ZybOYN3kEBAIksAv5XQ3xoV
 q45d2AGPJvxmu4u4T+eAsVIXteEUyRWSeeYSowpZ1xtRHfjTOXlXqfl8+WVsQag/ngLr
 C9iBxOoV7ehuSX67BHKW0Gk9k35cH+vq7G9MBYGTUQR94HlPdcMJ4lQvX2FfdRzGGuto
 dc4ZX8mBswVzUZBsoFObw5+zshGK+QISNqHpmIWXn4lkckr5SZ+cRkymySnevuoMqs9F
 tUXPA5aZoHxpvDgcVTVn2T+hJXGsGiTHFFkaQ9hG+VsyLl6Tfx2MdQGYYigltInVZeW2
 eMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNK86jdCWpZvvuZbrZBw1TBtV6hkQFeqAzcg7yMFU+c=;
 b=AvcubNMtK2kg5d6ec/YXqLXXNNFx42tEff2xR0uX5es5Vn8CQaSJOTbNWdt5lpLynV
 Y/39mYZ0OEhV6+tl1DLHQrVcqnojYidX5NLAIWRGNlCP0xd2H3nW3XvvEW/iXO5uKN1l
 4c5ESnDMPsIaxPjdYkwKNlK9+Li97l0pM5cNhKDD1iE5H0hgy5yYuAX7HRR9r0H8IkjI
 bPcQxIwb3IyngclHa08Q5+pkq5/DndWqb0PmsBRBhcLlAG7+p04Ai/6KKZXoB4UG1eDK
 h00zwDmqWWxZRYkwoIoiGFisCu9motuPkBGC9iKSJ5mvXwgyz0ZeKCGJaB4gNzCrEOJu
 4yJw==
X-Gm-Message-State: AGi0PubPz3Xs2iTmZVFoD0ePntURCgu/dqDrEvFLqLAR1sVfjgLE38/E
 N9sz9uAGHXO78fiK9SJR+sI=
X-Google-Smtp-Source: APiQypIOj08YAgdVRcK2HhdQMggqYYkQ7XERZLzo24BgpALqK4MyEfZRih0WLYxWF9pu3H0XBzurpw==
X-Received: by 2002:a17:902:522:: with SMTP id
 31mr14481033plf.68.1589192019608; 
 Mon, 11 May 2020 03:13:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:39 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:43 +0530
Message-Id: <20200511101300.11101-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 06/23] parsing_cocci:
	compute_lines: Reflect Parameter attributes
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
 parsing_cocci/compute_lines.ml | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index 1361d842..5c739d8b 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -914,13 +914,31 @@ and is_param_dots p =
 
 and parameterTypeDef p =
   match Ast0.unwrap p with
-    Ast0.VoidParam(ty) ->
-      let ty = typeC ty in mkres p (Ast0.VoidParam(ty)) ty ty
-  | Ast0.Param(ty,Some id) ->
+    Ast0.VoidParam(ty,attr) ->
+      let attr = List.map normal_mcode attr in
+      let ty = typeC ty in
+      (match attr with
+        [] -> mkres p (Ast0.VoidParam(ty,attr)) ty ty
+      | l ->
+          let lattr = List.hd (List.rev l) in
+          mkres p (Ast0.VoidParam(ty,attr)) ty (promote_mcode lattr))
+  | Ast0.Param(ty,Some id,attr) ->
       let id = ident id in
-      let ty = typeC ty in mkres p (Ast0.Param(ty,Some id)) ty id
-  | Ast0.Param(ty,None) ->
-      let ty = typeC ty in mkres p (Ast0.Param(ty,None)) ty ty
+      let ty = typeC ty in
+      let attr = List.map normal_mcode attr in
+      (match attr with
+        [] -> mkres p (Ast0.Param(ty,Some id,attr)) ty id
+      | l ->
+          let lattr = List.hd (List.rev l) in
+          mkres p (Ast0.Param(ty,Some id,attr)) ty (promote_mcode lattr))
+  | Ast0.Param(ty,None,attr) ->
+      let attr = List.map normal_mcode attr in
+      let ty = typeC ty in
+      (match attr with
+        [] -> mkres p (Ast0.Param(ty,None,attr)) ty ty
+      | l ->
+          let lattr = List.hd (List.rev l) in
+          mkres p (Ast0.Param(ty,None,attr)) ty (promote_mcode lattr))
   | Ast0.MetaParam(name,a,b) ->
       let name = normal_mcode name in
       let ln = promote_mcode name in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
