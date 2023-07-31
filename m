Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737FAC001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 02:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B91360BAB;
	Mon, 31 Jul 2023 02:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B91360BAB
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=BJasjRvN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kz6qIryh25aG; Mon, 31 Jul 2023 02:38:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DAA4260AA8;
	Mon, 31 Jul 2023 02:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA4260AA8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC77FC0071;
	Mon, 31 Jul 2023 02:38:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68666C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D7014081F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D7014081F
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BJasjRvN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_xkYpIZILxx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:38:33 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC05540583
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC05540583
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686efa1804eso2807291b3a.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 19:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690771113; x=1691375913;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ARxiCoB+DCxySI06TbQe/1opBfLGlEbdA/arcMTzmFU=;
 b=BJasjRvNE8e3dDMzzRpr096BocEe6ocP5JxoG8E2Ze96sbnYIW0VA01TIeTAOGgRKE
 zkpTvoa+aJq8PLiygj/lU6RRVKOtck73spYRPtZ8D5pk21RIVRmgXMr9TDJ2ucg06hro
 8hYV6Jj9+bl00VgGkXhFD91lNdeAgTU6Y3MM7jpoNUxj0ERr58GVn/rG7Hv0dHKi85Vu
 khaNw3CTX9WwTHM3EHJ/gTXPL0u3npFeE5BqSakcbtVtw0Eh1NA0wDgHCmSmO9aseeSx
 9oQ1JLpTDoODCtJBexwlkzR+517eatnjpGI/LyvAjAuyNC09I9lgNMe6lu2CjdVPhsxH
 5Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690771113; x=1691375913;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ARxiCoB+DCxySI06TbQe/1opBfLGlEbdA/arcMTzmFU=;
 b=jmaHEvDFfmYdWtc3tc8qOWKMC93MiuYxv7KyRZgQQdPucR58usmU0S3mwmtsrPbxwz
 ye2XjtltwhkiiKRxZVpjcUU7V9tSdKSIEgr4D989urOZosrRg3pwlnlqqdSq+VlviI/m
 bYerYt90YGirz9Vsq9LE+9D02KFscyhS6glBnbhnRXRO0pwiX8rnwotOpZdBOx6BOacy
 7RH+64EqrjVYJM40Glt79q101sOHuSAlGWJ/Jn4mGsgA6feXToe25F02rg781uOpI+jR
 VREZXSORWtMaO/tbbunVanynudtAM/JdRatn4QEwA/DX9DmSKriF+Z614dVNTCTiKCCh
 Fr5A==
X-Gm-Message-State: ABy/qLZsSVfJWpQG/lM75VVIAJddaRDQb1s1hhMWrpZ1/Rc/pTLnyigT
 QQerH0VDNuqLYIICmZ21S2I=
X-Google-Smtp-Source: APBJJlHRPRHHkKwKoOs5V9VHQLWmC3z/V04kEImJhE9suNHr3LMJnF2jA8vaJQ2VfqXFI4NTMfIn2g==
X-Received: by 2002:a05:6a00:170a:b0:672:264c:e8cf with SMTP id
 h10-20020a056a00170a00b00672264ce8cfmr9547837pfc.7.1690771113025; 
 Sun, 30 Jul 2023 19:38:33 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 s8-20020aa78d48000000b006661562429fsm2474546pfe.97.2023.07.30.19.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 19:38:32 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: jirislaby@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org,
 kvalo@kernel.org
Subject: [PATCH] ath5k: Fix debugfs_create_dir error checking
Date: Sun, 30 Jul 2023 19:38:20 -0700
Message-Id: <20230731023820.26571-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
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

The debugfs_create_dir function returns ERR_PTR
in case of error and the correct way to check an
error is 'IS_ERR' inline function.
This patch will replace the null-comparison with IS_ERR

This issue was found with the help of Coccinelle.
./drivers/net/wireless/ath/ath5k/debug.c:985:6-12: Wrong debugfs call error processing on line 985

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/net/wireless/ath/ath5k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath5k/debug.c b/drivers/net/wireless/ath/ath5k/debug.c
index 4b41160e5d38..08058b3f7e22 100644
--- a/drivers/net/wireless/ath/ath5k/debug.c
+++ b/drivers/net/wireless/ath/ath5k/debug.c
@@ -982,7 +982,7 @@ ath5k_debug_init_device(struct ath5k_hw *ah)
 	ah->debug.level = ath5k_debug;
 
 	phydir = debugfs_create_dir("ath5k", ah->hw->wiphy->debugfsdir);
-	if (!phydir)
+	if (IS_ERR(phydir))
 		return;
 
 	debugfs_create_file("debug", 0600, phydir, ah, &fops_debug);
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
