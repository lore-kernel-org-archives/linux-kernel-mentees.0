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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ADFC54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DA23206BF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHWORw8A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DA23206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0E97021FA9;
	Mon, 27 Apr 2020 12:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Looz1x6BOHJT; Mon, 27 Apr 2020 12:09:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 428882156B;
	Mon, 27 Apr 2020 12:09:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E810C1D74;
	Mon, 27 Apr 2020 12:09:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B4F0C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 04DE687D39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrzXVw1KMfjA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9CBCD8633B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:58 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id o185so8611339pgo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wngLDj53d40UAfdANhcc9OYS/iaJ7M2lYJl5+hepAbA=;
 b=SHWORw8A+X8MbykBOpeWbwOVXnMRr5fajTUNRT7aoC5wrob22en+gjPSB2qzBCWB5Y
 sRyfOSXLQMbHMF1SGKzU7MubTTDlvXhnhHYRc6rqHgXHl/0I0AsKVxRpajolNlErk/PI
 NJDGMWCdrL5PvpJdhvKlIDbT4xT9Fsw7Y25UpUlA5+SRTh9gbvTiBlFFZQNQwLTp3wSE
 Cc45kx1Kn/5o8OzO5tqBoeg8VgBTxlQuwY7ENEivgA2yEWRt205o+ECLAOg6BQkgyuUu
 jcWv+y5xzzXqP5I19CHk6BgW4t2NLNWJJVJQl1diH6rv5V5c0DG+FgPgKZumm7GRF1Qd
 ieXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wngLDj53d40UAfdANhcc9OYS/iaJ7M2lYJl5+hepAbA=;
 b=GglGETckuh0XjicLVOZbTAzVyCt8QAGtbIecb/lOrpjG+1s7wUWPENVbS9t6I6Z/80
 Gi86kk+HRct8HQ0pXKgvMicDB2i3NSDYAgG+y+EeCUiDsHfjj8pBZvjRibpHZ6xsTosb
 eDFLS6qFlPRSKG+NitMczjZtuZOVnP/L7deRAbBwgBp+Yhj9NoFVBXClB1M/WblQF4n2
 K4vfZRuAB03O7UGKT3XIzgjKSSpQ/6zcFOV2HAR4rBohg/Jnd8OIvp4pjuvN0U0HGZsj
 EUx/KnnOKApfvgRQWRCXekPHHGkvkvWX0/YLxddjy2PbR0z15SI0pkYcM3CnL4RLOB0S
 Uw9w==
X-Gm-Message-State: AGi0Puak8iMztgAPfq4hcAurgAUbJIaKrqmFT5gutgq7aVZS7Dcxh9MG
 TAHj6tFS33ey3NmFUjFWbz4=
X-Google-Smtp-Source: APiQypKv63AQTek8l5LmtHZ62UfZtsz/4MO6iymzhS3CdL/AE93h6+5GNGaPCydxB2uNJTL/Pde93w==
X-Received: by 2002:a63:1c1:: with SMTP id 184mr23605882pgb.203.1587989338140; 
 Mon, 27 Apr 2020 05:08:58 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:08:57 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:14 +0530
Message-Id: <20200427120834.380-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 03/23] parsing_cocci: visitor_ast0:
	Visit Parameter attributes
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

Parameter attributes are added to AST0 of SmPL. Visit these attributes
in the AST0 visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast0.ml | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/parsing_cocci/visitor_ast0.ml b/parsing_cocci/visitor_ast0.ml
index d9e340ed..d6feccb7 100644
--- a/parsing_cocci/visitor_ast0.ml
+++ b/parsing_cocci/visitor_ast0.ml
@@ -826,14 +826,18 @@ let visitor mode bind option_default
     let k p =
       rewrap p
 	(match Ast0.unwrap p with
-	  Ast0.VoidParam(ty) ->
-	    let (n,ty) = typeC ty in (n,Ast0.VoidParam(ty))
-	| Ast0.Param(ty,Some id) ->
+	  Ast0.VoidParam(ty, attrs) ->
+	    let (ty_n,ty) = typeC ty in
+	    let (attr_n,attr) = map_split_bind string_mcode attrs in
+            (bind ty_n attr_n,Ast0.VoidParam(ty, attrs))
+	| Ast0.Param(ty,Some id,attrs) ->
 	    let ((ty_id_n,ty),id) = named_type ty id in
-	    (ty_id_n, Ast0.Param(ty,Some id))
-	| Ast0.Param(ty,None) ->
+	    let (attr_n,attr) = map_split_bind string_mcode attrs in
+	    (bind ty_id_n attr_n, Ast0.Param(ty,Some id,attr))
+	| Ast0.Param(ty,None,attrs) ->
 	    let (ty_n,ty) = typeC ty in
-	    (ty_n, Ast0.Param(ty,None))
+	    let (attr_n,attr) = map_split_bind string_mcode attrs in
+	    (bind ty_n attr_n, Ast0.Param(ty,None,attr))
 	| Ast0.MetaParam(name,constraints,pure) ->
 	    let (n,name) = meta_mcode name in
 	    (n,Ast0.MetaParam(name,constraints,pure))
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
