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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD668C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28032077D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaFlBjf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B28032077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9739088494;
	Fri, 29 May 2020 12:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjQnagIH5GDr; Fri, 29 May 2020 12:10:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 40ED28848B;
	Fri, 29 May 2020 12:10:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DE29C07FF;
	Fri, 29 May 2020 12:10:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B644C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5A83725E37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFGB1o5SIrGR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 6AF6025D5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:25 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id f3so1276501pfd.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XsOUCWb5UG6k/8xHVHn/Y03zDxBj23UKsYCk5pFSAy4=;
 b=EaFlBjf5mCoQCF1YiDxccxCDIbiSlxVjSyDj8cLKwcnfa+ay1CBlYxs/wumz1oWi2u
 hSS9JfUSqsCiDndZ7wKOq3ynMhgcPiA2KPz4cAuFMHz7uVYKpkaLRSnfYKETyz3D9Td9
 MoXnZXb6ulno+TUb/70wIfRGUMaeJQKmE7TD9d4GRZ16TB4IOrwVHdW0WgzklV9oeQh6
 6BBrN+a6Z9/uFx+8JvyZr6yKdXabFDtBVZ47v8DMBOZnwpbz5osK3pla0Z9h/vfD06kn
 dP6b7USt1VKfygLJxtFDU58U8fiEtuEsvRd+ZegLyER7aHEJoErDzHGq+PBdOXgoavJv
 XAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XsOUCWb5UG6k/8xHVHn/Y03zDxBj23UKsYCk5pFSAy4=;
 b=kbM6+0i0Wdg2H3WZmHGFMbQ0OXu6N+NaVMbLJWUmFoRnNzoHBxAz24jcTq4NSuYD4q
 Tj1wR+oWJq+wzgsvS2XIVYfwcz2N1p+EEsWh1KVGINY4pkg0F12zTnAyvgR3gIiMIn9x
 LsF62vo9bobbQamM3wKeV62p7mvwY1yEuoH62Y0nVYBHpTib5XodVq3U4YnJstjDGZ7a
 Kd4qic/buvdCUUjb25o4l+SWJDcLHFw/p4HHG26bPdUuIEclc/ryQyGENUL82hS6ZWdq
 dHQWletw3O41oXGGvwXAXRElxj+ZDb6rt6MRb3Z9U0tcwW8PG5dK83VO+Rprf3ykJtcV
 d8YA==
X-Gm-Message-State: AOAM531oSWPIRG6FwnIXpE5aWKrclEVEl/uyR9hUuok9CeQNq4w0nG1k
 V8sViFZXASFCYQk1OYCAZCw=
X-Google-Smtp-Source: ABdhPJxzD2g127jyO3h64vzxvoLByktNZfidajnBnBwvOj1vnepZFTOUkCDcyoDISMv8BL5ilaxEdw==
X-Received: by 2002:a62:168b:: with SMTP id 133mr8582444pfw.137.1590754223880; 
 Fri, 29 May 2020 05:10:23 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:10:23 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:59 +0530
Message-Id: <20200529120703.31145-30-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 29/32] tools: spgen: Reflect Cast
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
