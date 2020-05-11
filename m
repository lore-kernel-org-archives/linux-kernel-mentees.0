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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3784BC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058132075E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA34Zuho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 058132075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ECB41889B8;
	Mon, 11 May 2020 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTbh+OqSlTzL; Mon, 11 May 2020 10:14:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 903B2889EE;
	Mon, 11 May 2020 10:14:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FE06C0176;
	Mon, 11 May 2020 10:14:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A599C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 05B4687858
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsWalE1Tyn-d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 532A786D13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:21 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id ms17so7562702pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoYSqyO22rGi0Db4CqIjpeG/yfksbrnzAwvFWBh1tCQ=;
 b=PA34ZuhoueMzVNNpXoDkUbGOgbhnPFJLNflfhVZH13vZYJXUBVMWz++qlAYSKghLD2
 ooSPEbvMvVhud5QQucLgs8U8vNUGuVrNOAvTBti/sNs/zm4TH3LCygi20DyLIsafG7c4
 r7H7snSGcxnkPX4/HPlHbglmjlnQ7UkrOdjn+IIxE4GtYyuIeI0vKVqUcpE3msCqZx1k
 ZVNWX8HS0AOibmxyNRTYOVjgDSa3wCvDurgWBuRLpO+ehKnTxOxiR9AkaA1aNspAWZsg
 62ibS8rHrpkGIstwkryU33Os3/8PKRBBJ805xKnN9/NKW+U6h60at7/l7bxP20nKTqJM
 1KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DoYSqyO22rGi0Db4CqIjpeG/yfksbrnzAwvFWBh1tCQ=;
 b=XUcNq73lYKA2PFIhsiv8O7OscvYkap3IJSONB/XpcFMByNyiMijy0ZBvPyn79P/5li
 8UnOZp1rqbMpp3IzXDASWAb6myTIMSSuaFLO2r75Hhz+ugYJSxUfOqQ+XxPxmA9GK8TA
 CqJ5XMElBKaDl9VxCEqVmkqG1rQ6EIFBZbRv34D/QG/B+sDYPnUbbL13DosEdlYAX0gB
 dI9ztogywh8cSgDVThakhPH14Se52KGesHIzy4rybmHU66tmiOisqjdyOmQxqCKqplqF
 beHPUo5MYlOg2qPkObnnV9oyiKWeQza7vrDUe5CCSDPcpJHbcDSUhFo6ml87x8P+TqGv
 APww==
X-Gm-Message-State: AGi0PuZU6JeaWrrJfwNQwxJUxJ+Jt8qpU1L7fK15iZFZqSSjweAjpnQp
 eTvGE0FBp6iZTt3uE6VTumg=
X-Google-Smtp-Source: APiQypL0gkzgoyBkOBpe/xxEoyBY8W3FD0pZV+w1RNPAVovUwI9LrTIXMGZisDsgUrYdC1ctVy27fg==
X-Received: by 2002:a17:90b:692:: with SMTP id
 m18mr21690185pjz.39.1589192060472; 
 Mon, 11 May 2020 03:14:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:20 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:54 +0530
Message-Id: <20200511101300.11101-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 17/23] parsing_cocci: disjdistr:
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
disjdistr.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/disjdistr.ml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/disjdistr.ml b/parsing_cocci/disjdistr.ml
index 6724bb25..c868cb1c 100644
--- a/parsing_cocci/disjdistr.ml
+++ b/parsing_cocci/disjdistr.ml
@@ -259,10 +259,10 @@ and disjexp e =
 
 and disjparam p =
   match Ast.unwrap p with
-    Ast.VoidParam(ty) -> [p] (* void is the only possible value *)
-  | Ast.Param(ty,id) ->
+    Ast.VoidParam(ty,attr) -> [p] (* void is the only possible value *)
+  | Ast.Param(ty,id,attr) ->
       disjmult2 (disjty ty) (disjoption disjident id)
-	(fun ty id -> Ast.rewrap p (Ast.Param(ty,id)))
+	(fun ty id -> Ast.rewrap p (Ast.Param(ty,id,attr)))
   | Ast.AsParam(pm,asexp) -> (* as exp doesn't contain disj *)
       let pm = disjparam pm in
       List.map (function pm -> Ast.rewrap p (Ast.AsParam(pm,asexp))) pm
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
