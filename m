Return-Path: <SRS0=6zuU=KL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F042C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:31:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2D06100A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E2D06100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D33683A71;
	Sun, 16 May 2021 12:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exIiyQo_T0WZ; Sun, 16 May 2021 12:31:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE0F83A49;
	Sun, 16 May 2021 12:31:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3DE6C000E;
	Sun, 16 May 2021 12:31:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98893C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9473A60703
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vems3oM3Xxl5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:31:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2725C605F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:31:04 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id i5so2846991pgm.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ds28R/7vwYP+GELrd+7TuWueNiMvgRdKm3879jAJ7HQ=;
 b=rEEgJv5BYec+b4lztI67bvFhhdOJx/o7DPkxi3xSciQzsPHrMn7o7fdMnNvwZ7ZGAY
 WOCJQR8xqdqDU+w5jG33FtR4jxlFzAvXKEHglc6zohI8xClEiFjlyagVZpSeF3EuZd/M
 RFfLX8BO3wTOTtsex+R+YwFHDxlma+esLgVVM6LYF5wSp76JVQ2Vl8+YCgAw5TimZeON
 F/JN1+TBCdpClM2bh1NNJmuLeRchwIC9JwFztRQUNXQa8fRcr1uHgPO6uZ9KQsrYFO5g
 t8tYngE8YzZQbtdGeNoKAatV9bc5RCKloez+XkmVBUcY6w7NkLZmScQMcdsY/TDc4KBT
 MZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ds28R/7vwYP+GELrd+7TuWueNiMvgRdKm3879jAJ7HQ=;
 b=bz07UuCIKulYDtg/IjV78xU9E7VbpEboiWbm6kJZHi/AY3C6l4MJeJY3pTjU5XX30d
 h/+Du9ACAlcwQOtZIIMp+y/JbU9eSS/lhsHVsyCTvu+8eu071Xpgc2J7Tx+kErKQnUuw
 sz+qtema7Gp+uk3HdcEVMPbSwfYfi0i8lsU2RMpsZ7JOnw0Gp72YfvRfk9Njz/D40Lp+
 WA/bjYl0OKwomEqioeAyX+7FChkuzwL0svS9O5aTOSjdab0M2Jz2gPcPlfjgxd1WT1gC
 mRoplF2z+bs2XXRj/J6U6HF8Ng8muxZIrmbNxRbgr8J1RoSul7n9TZJEdwN5cLjox7Nk
 6lAg==
X-Gm-Message-State: AOAM531eY2T8aF1t5jhTO2XBsGYX/XFbUWyDBzKecx7751BgeITPwIJh
 288a2M5DjD8jtFx6MrpK+eg=
X-Google-Smtp-Source: ABdhPJyUnk4tZhpoLh6hARcUhy8fFfv9TcSYa1G973qaWL3zCQrGzeEq+CvnQUB7zeVaCqBWLeFviw==
X-Received: by 2002:a62:7652:0:b029:2d9:4602:7292 with SMTP id
 r79-20020a6276520000b02902d946027292mr6031215pfc.52.1621168263632; 
 Sun, 16 May 2021 05:31:03 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
 by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:31:03 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH 5/7] Staging: rtl8723bs: add missing blank line in
 HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:25 -0400
Message-Id: <20210516122927.1132356-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
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
