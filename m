Return-Path: <SRS0=n6YR=KN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C433C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:44:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04B5F610E9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04B5F610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9695606D0;
	Tue, 18 May 2021 04:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSJSw0cvc0Su; Tue, 18 May 2021 04:44:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1931760671;
	Tue, 18 May 2021 04:44:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 066A8C000D;
	Tue, 18 May 2021 04:44:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4696C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 928EA40493
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7jfBhYzufNW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:44:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE10940494
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:44:27 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 b13-20020a17090a8c8db029015cd97baea9so1093098pjo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 21:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZRMdbjxMxB4jilOYqB66sZPAREoVkPe1v6Lee0oUs4=;
 b=iLWsrAi1bzNb6Ny1SZ+EqLbTmvGKxgXbnO87xCBUV/SioaE7lWKJNfclmiiMll3RVe
 GBT2lZ4zljRObXp/WM/KqkRMM/1tBoc8QegQj10NJ/pH8k6qV15q4rV0wntQxU6CzVTy
 8GCQCvxHzrT8jiGo2QEbirbgRXFaJIDvlT9R8EXJoYm31jw/SJSknfwcEo/6tT1AKrzO
 lhkvPVrzb8KwOBkZz5QoVhxm7WW02QowLJFqpXk0K/LQyYFpCoydwLaike0G9Mlgerfx
 CFx3SwRWUQBelG1nHuhmuxPxBEPBJQJ0h4kk1gB+HWujjhw7+pr8kVyAf11v2V9ko/gD
 asTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZRMdbjxMxB4jilOYqB66sZPAREoVkPe1v6Lee0oUs4=;
 b=Hlat49q1ITlY0H18XjBHHEBkzn2PSaimUv0wDkLopgtkhFB0rJODNQAQP+KTOOt5ug
 GTnZd3enOn4QhnNvun71iM2gfR0Wmd+wpv1myLvhUTb4Va8PM++IsHxoINPDlHoTV20w
 WZNHtO9spcw3yatXXk2Oz7Gvg66Y33Db8BY3/PTHrLe8oHJWq2Z9xoNrKt1R/eobrnPq
 5yiXZUr1s3pn+PpVSW7C/hmOfPbusBDfYYcVe489w55AzGecAd/0/JvjMNbHECY4zJ5I
 4IbXUHRkLrXSz7d99H12UQAzv3BWUReNdWQL0p0KD3MOmqVpqUuBqmwqpzcud5K+gs6H
 YQpQ==
X-Gm-Message-State: AOAM532VZL0nYDQT84Jc5Gp3nIQzyTu5YbQxlDFwqWdfglq67/DioLav
 GhyyeIOx/zUXK1c2GN4qvqI=
X-Google-Smtp-Source: ABdhPJwrEPev0BjXHphGbKgGWulX1v4SAk+tUih50mHbMnYF0UvN0YbbrrzOmiAec3MkuJoGz9CJDQ==
X-Received: by 2002:a17:90a:f18e:: with SMTP id
 bv14mr3341739pjb.234.1621313067403; 
 Mon, 17 May 2021 21:44:27 -0700 (PDT)
Received: from localhost.localdomain ([203.126.139.7])
 by smtp.gmail.com with ESMTPSA id t15sm357538pjh.0.2021.05.17.21.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 21:44:27 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH v2 7/7] Staging: rtl8723bs: remove dead code in
 HalBtc8723b1Ant.c
Date: Tue, 18 May 2021 00:41:19 -0400
Message-Id: <20210518044119.2960494-8-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
References: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

This commit removes dead code to resolve the following checkpatch.pl
warning:

WARNING: Block comments use * on subsequent lines
+		/*
+		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index cc7f558903ac..e5464a27c052 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2509,12 +2509,6 @@ void EXhalbtc8723b1ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = %d", "IgnWlanAct",
 			   pCoexDm->bCurIgnoreWlanAct);
 		CL_PRINTF(cliBuf);
-
-		/*
-		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \
-			pCoexDm->errorCondition);
-		CL_PRINTF(cliBuf);
-		*/
 	}
 
 	/*  Hw setting */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
