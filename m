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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F27EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050B4206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rq4nBbUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 050B4206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D467020030;
	Sun, 31 May 2020 15:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5t+rRLUzG11; Sun, 31 May 2020 15:27:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0E48020425;
	Sun, 31 May 2020 15:27:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE80FC0863;
	Sun, 31 May 2020 15:27:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9147CC0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7976D20425
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvcITf53zqZb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id C72A02035C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:32 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d66so2266664pfd.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OLQ/cqD/PIME/yXpfozaq7fkE1pcQOwRe/iiEfP0pwY=;
 b=rq4nBbUQF45+Z2PDaUM5rL04umLwDSUyQvnX7gWHucju/31EBnTi7olQlIoDCtKI5V
 w8U9roQP/Bh+tBiR0bDaoFMnCHFvVKUHmt68ywRTKbbHqn2/dmRAUtdTSTqcvF7l6iZz
 tP/yAUOIACN3XylShXa7KWaRZV3rScgE4IxNTgoY2BVLZn4KvrCd9x55oZIZsQk2vhZt
 lOmKcp8sSZWcdmzBmaAwMTOnLvofWv8+TF2h0lWsDuGpvq5NEJEiMmZUilMOwNGozujH
 hFAvOCvI9p07Ni8ARXjcByOZX8eQlq9QdtvPYR4UEFfyYnQBFUzOL/ynw1+0J/rRrUSs
 rn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OLQ/cqD/PIME/yXpfozaq7fkE1pcQOwRe/iiEfP0pwY=;
 b=Juw6GyuRl7/ACLHNgM0w3u3asEFNGysTGEV4CyF3zL/LOW6K1t/VA9QGnt2PoPxi5n
 18JHHRi00gc/NfpBreDRnyNvFHnIesqDH0H0MU03MYXiJdO4UGVliQezdYY5uwmnX1J5
 MADVXhDicswV5vLqiDnVKiw3glxKrMunYo+KznHigOaSwhodBANtTH9xCJ5MaDN2j+HR
 TVGLMQY2lOCbDC2JuEL/8rnGABzaRtRz/BWBP52eohZ73YfIEyLCujkzalZymYZm1dZQ
 P/f4ryz3JXxL8x+hldY3koEiCtICrTCTJmuBk95FxmCTL2fBzfdXgqE5yJWWo4ZvveL7
 /4Jw==
X-Gm-Message-State: AOAM53023e8wBeM7Sr5rmB53jyg/0Lx0jj96tM4qqW5KooEdWaUAJaXh
 8+KnJpk2HOHRfg4JJYNmGTA=
X-Google-Smtp-Source: ABdhPJzp6hn/IiZCIT1R27ERqguwCUdKWhgC92CMtKuOV4KmzQqizsdQFlB3wmqOLazZ5KM29FESKQ==
X-Received: by 2002:aa7:9431:: with SMTP id y17mr16004030pfo.33.1590938852322; 
 Sun, 31 May 2020 08:27:32 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:31 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:03 +0530
Message-Id: <20200531152621.2886-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 09/27] parsing_cocci: check_meta:
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
in check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 7035766c..f651ff8b 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -292,7 +292,7 @@ and declaration context old_metas table minus d =
       (match Ast0.unwrap ini with
 	Ast0.InitExpr exp -> expression ID old_metas table minus exp
       |	_ -> initialiser old_metas table minus ini)
-  | Ast0.TyDecl(ty,sem) -> typeC old_metas table minus ty
+  | Ast0.TyDecl(ty,attr,sem) -> typeC old_metas table minus ty
   | Ast0.Typedef(stg,ty,id,sem) ->
       typeC old_metas table minus ty;
       typeC old_metas table minus id
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
