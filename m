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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619A2C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:44:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11EFD61004
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11EFD61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7074403AC;
	Tue, 18 May 2021 04:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTfhJ5dbQcUF; Tue, 18 May 2021 04:44:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id D40C9402E5;
	Tue, 18 May 2021 04:44:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3AB1C000D;
	Tue, 18 May 2021 04:44:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE1D4C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD0E483D5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fArNvhPW0n6H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:44:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C79783E34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:44:03 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x18so2207548pfi.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 21:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ds28R/7vwYP+GELrd+7TuWueNiMvgRdKm3879jAJ7HQ=;
 b=M8lRvzvdKFwL0qKWqAeZktmJWVupxq33Q7hgy4nUnWPLh0PPzcs52zIHQo3f5R7j8K
 CM1BHYe23PsIG2UmsKQL/MFejxBcpB+OR4UYWmDUbZ5XRRE7WLSIDoNIJkAG9S9blxwG
 n85pGCXxLff+A+7lfVLg+7oRSZeBEo1mc0+cstI7kQCDW3Qs9fSZWhaGEXJUH2I2h2sC
 AGOxlgqz5BC29EemmLcrGekUH8M7xUV7CwnlneXic47UzbMhM036q2CssbN+bAmp0GnE
 /EdLyjNqoOyLpK1/Gh50VEQ1E1sYwjiEyK2eSeC99nzZHb9hPPWb6Ek9yl9ACUlxSVcJ
 q/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ds28R/7vwYP+GELrd+7TuWueNiMvgRdKm3879jAJ7HQ=;
 b=NQQXHTFwYzg5MwL450Ag4tzDX8skhHWX84HP4nCAFoGTx5F3qVV/Om2VKso0tlFV0p
 lPfGm5MWgYhaxggungXsCGALf1uv8QJR/u4jqDmjc1Jdt+hCq/DkpDa34YID8LAZo3en
 l8O5qerWCa1eGBvoL0Xj+IpKLZrNz4g+NKdBYZ1VB08zrlsQ2KduGJCKoegjOJKycqyu
 jPmtjPFOTfIqYfaxDutbbPkPbExtbZIRqQT3Ph7HfJKEf5uGhnvRgOkuAbos2Nim2207
 c8s8byeFu+PN1xzTVpuX4dDDfKDXOo1+bToGDyMAl/Kg2E5dEKdLQB1M5q4SsWWwZnLf
 eguw==
X-Gm-Message-State: AOAM530r0P/HS0JWiB3JkMnG5j0X1AXmGPcUr1BWHE7+6pnA+lf/8BOs
 v16GX0r0XMdBjBlCqnFZJ4o=
X-Google-Smtp-Source: ABdhPJxneK2BJTKruRRi+uIH4AUvHRRkbP9aci+ZVV3w7z6Qfpt7pAVSBnuhoSWv6/Qs7/jcm1HrjA==
X-Received: by 2002:a63:1224:: with SMTP id h36mr3138445pgl.296.1621313042678; 
 Mon, 17 May 2021 21:44:02 -0700 (PDT)
Received: from localhost.localdomain ([203.126.139.7])
 by smtp.gmail.com with ESMTPSA id t15sm357538pjh.0.2021.05.17.21.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 21:44:02 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH v2 5/7] Staging: rtl8723bs: add missing blank line in
 HalBtc8723b1Ant.c
Date: Tue, 18 May 2021 00:41:17 -0400
Message-Id: <20210518044119.2960494-6-desmondcheongzx@gmail.com>
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

This commit fixes the following checkpatch.pl warning:

WARNING: Missing a blank line after declarations
+	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	halbtc8723b1ant_BtRssiState(2, 28, 0);

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 97831d04959b..cf36a7de4735 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1664,6 +1664,7 @@ static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 )
 {
 	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+
 	halbtc8723b1ant_BtRssiState(2, 28, 0);
 
 	if ((pCoexSta->lowPriorityRx >= 1000) && (pCoexSta->lowPriorityRx != 65535))
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
