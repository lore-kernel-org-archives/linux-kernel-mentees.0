Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F02C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C27206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s17Of79t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C27206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E98D88453;
	Fri, 29 May 2020 12:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYR8pmM7CK5r; Fri, 29 May 2020 12:10:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1DC98847F;
	Fri, 29 May 2020 12:10:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 917CEC0893;
	Fri, 29 May 2020 12:10:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2132C0890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E1DEF893CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4fbaKMHRL7y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 97AEC893C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:06 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x10so1102841plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9xs+VxrE+SKT0t/5AoaC7h0As2M2DyZtXWTfrJjWgM=;
 b=s17Of79t13tqSZRbS2xGaRObBYmXSG9I9l5OalUJTYjRgjUmGowMqHSpBVtk5BtCGg
 JQ1RsLEV7I6BXXQDF+d/pg447svCG6YQcwxZh+Sf+DB8yKyWxAl4Vf0skmzerMms5JPj
 NcOskhzloqkb/g1tSa0NjakrKIHKqq/f5/04BIyRQjHL9U7T48LL8ffLiWcSz8sidSYc
 BT/puPvgB2l/0Ld7VL1CoGLBYMF/0l42hXhNG81YQIBnFwQZiFR2m7NH+6E5zZgDArPn
 v4cX5QO7orpCX8PslmQXP+gBzxW7k692kSo9MBlQTlh/bzszDRipjfNfWAiJ4QVA8ogY
 VxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9xs+VxrE+SKT0t/5AoaC7h0As2M2DyZtXWTfrJjWgM=;
 b=Cx92Ywuy2pc/QHLALavROkz3iPP2f4xFW2tJCph4/O6SzcNZb7iX+2My3pasU4aC4L
 zEhUb2J3O47NwPL9NJ3GTGvT8Mu8fumPUTccAL5FOgJuondVG65iJ06TeCS4RoSwlaSK
 xtQi6KMLxVWUZCZ61N1wcSeg/kYJiIYK+qN1Ix8/EoAo+PmfR2RLa4NHMOhfEQNR+d9w
 LDygtPmWQBsGLIqDaMx5zF6td58UbjjEhFsITvJeq54fhPaFQm3c2kX1gZIC4hLVxYCN
 RsYt/RTinV1lYKLB3SkpICy36iDpu/XsvbckKat+tJXDfm9iCvDiGHiBztrkGNC2Gtjj
 apFQ==
X-Gm-Message-State: AOAM532UTJ3BXkzZqPBT6t5eQ9zp56JKKH6MUWSdHdG6TuYg1EVUbKXl
 DnLtp678KfqvvfpH/bJJcxQ=
X-Google-Smtp-Source: ABdhPJy0WyTRYBwRX2G0ek5jnXXbVsuYUpZmtLFo1b917nI5fzUgRwnq3MN3b6d2A3HLTTzAm4JZog==
X-Received: by 2002:a17:90a:3ad1:: with SMTP id
 b75mr9430928pjc.216.1590754206121; 
 Fri, 29 May 2020 05:10:06 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:10:05 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:55 +0530
Message-Id: <20200529120703.31145-26-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 25/32] parsing_c: visitor_c: Visit
	Cast attributes
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

Cast attributes are added to the C AST. Visit these attributes in
the C AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/visitor_c.ml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/parsing_c/visitor_c.ml b/parsing_c/visitor_c.ml
index 57b5f32b..77a011d8 100644
--- a/parsing_c/visitor_c.ml
+++ b/parsing_c/visitor_c.ml
@@ -324,7 +324,10 @@ let rec vk_expr = fun bigf expr ->
 
     | SizeOfExpr  (e) -> exprf e
     | SizeOfType  (t) -> vk_type bigf t
-    | Cast    (t, e) -> vk_type bigf t; exprf e
+    | Cast    (t, a, e) ->
+        vk_type bigf t;
+        a +> List.iter (vk_attribute bigf);
+        exprf e
 
     (* old: | StatementExpr (((declxs, statxs), is)), is2 ->
      *          List.iter (vk_decl bigf) declxs;
@@ -1188,7 +1191,11 @@ let rec vk_expr_s = fun bigf expr ->
 
       | SizeOfExpr  (e) -> SizeOfExpr (exprf e)
       | SizeOfType  (t) -> SizeOfType (vk_type_s bigf t)
-      | Cast    (t, e)  -> Cast (vk_type_s bigf t, exprf e)
+      | Cast    (t, a, e)  ->
+          Cast
+            (vk_type_s bigf t,
+             a +> List.map (vk_attribute_s bigf),
+             exprf e)
 
       | StatementExpr (statxs, is) ->
           StatementExpr (
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
