Return-Path: <SRS0=byAB=GN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454ABC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E526F206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E526F206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DAC685DE1;
	Sun, 10 Jan 2021 12:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0oxTvg6AOeR; Sun, 10 Jan 2021 12:15:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6856285DB8;
	Sun, 10 Jan 2021 12:15:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53A6BC0893;
	Sun, 10 Jan 2021 12:15:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26176C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0FBA720381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVCgGBVF0Zh0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by silver.osuosl.org (Postfix) with ESMTPS id 72143203FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:52 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id x126so9278600pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 04:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YTc1II9ACj1oYqqot33qA4ayP2h78MhFEqKnLEwd3cg=;
 b=lXlNqKSB1WT/06xJmknbydbtn2KROIF2e+XrhojUPkwwXA95s5qNeAjiMvf6EFlNtU
 doaXT8YzHMJ8VPtoN/VE2eTLvx3nqNfou5cnpvekM/BQlr9Ys6cLi6J5Jokqq3NL9lsd
 uXhygadpsGlzxXbsOg23Rz8ygs5t9F+I9TBOaOxkRzV36M2qukJqtCYr3nF6sQg9x9Qn
 ACVBKxuCoeEOdDkLF7yp4JRSNsr2w+Pc0M3ta2VehMbIcnu2b5duS7on/ReNn+qFmzuC
 UtWX0Klp42c3t45FsFHCTI1yJtJusT5m3M57SIrPizFM2DzadEdnrNKFhPNWU3dBe5p9
 OIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YTc1II9ACj1oYqqot33qA4ayP2h78MhFEqKnLEwd3cg=;
 b=di3CoP+jXdGCXc9O7IXs5G9n0k4FUDxP1UanGZPXYQYNZi7U6a6W8Ub4MscGCE7FOB
 IdXl056ZRiE/V1UauJKuxjK2WBE6HpY89ldtGz2UPecWjBFEwB99hZz/WPGFvCGVVkZS
 uAAsBwnG91xChd8RNM4v/jxvSyT4DLSmNbXWKyReWMvd9nE9FUxt+xaIPm21mJ8RHw8H
 Nrh3/rIJ0psIHOzON2WzCl98LEYr640HQs4PL59ie/FbI8L66h4bV543Nvjz3PVoh9UM
 2t9YoKTmwZ7GgfRYHwKRSfMIPvh9wThp4JZVP2aPJcXSQWFwCTZ0ipd9tbrEVvnnXHaG
 qw1w==
X-Gm-Message-State: AOAM530BT+wwF6SNhrivgm2Ea3Kl+0Yvz8UNYy8z1KVgJoZZt44VLw/r
 012PRqvk8mfOcaivEop4STw=
X-Google-Smtp-Source: ABdhPJyweUMzxtoGdLkP4eQrEr3IkevhAfKwZ7liWN3FD2t4BNbzorjUd4KIR2CEX4FkHGgx4/b3dw==
X-Received: by 2002:aa7:970f:0:b029:19e:758b:dab1 with SMTP id
 a15-20020aa7970f0000b029019e758bdab1mr15239229pfg.24.1610280951963; 
 Sun, 10 Jan 2021 04:15:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:381d:ba42:3c3c:81ce])
 by smtp.googlemail.com with ESMTPSA id y5sm10959791pjt.42.2021.01.10.04.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 04:15:51 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-wireless@vger.kernel.org
Date: Sun, 10 Jan 2021 17:45:24 +0530
Message-Id: <20210110121525.2407-5-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210110121525.2407-1-yashsri421@gmail.com>
References: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
 <20210110121525.2407-1-yashsri421@gmail.com>
Cc: pkshih@realtek.com, yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
Subject: [Linux-kernel-mentees] [PATCH 4/5] rtlwifi: rtl8192se: fix bool
	comparison in expressions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

There are certain conditional expressions in rtl8192se, where a boolean
variable is compared with true/false, in forms such as (foo == true) or
(false != bar), which does not comply with checkpatch.pl (CHECK:
BOOL_COMPARISON), according to which boolean variables should be
themselves used in the condition, rather than comparing with true/false

Replace all such expressions with the bool variables appropriately

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/hw.c
index 47fabce5c235..73a5d8a068fc 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/hw.c
@@ -458,7 +458,7 @@ static u8 _rtl92se_halset_sysclk(struct ieee80211_hw *hw, u8 data)
 	tmpvalue = rtl_read_byte(rtlpriv, SYS_CLKR + 1);
 	bresult = ((tmpvalue & BIT(7)) == (data & BIT(7)));
 
-	if ((data & (BIT(6) | BIT(7))) == false) {
+	if (!(data & (BIT(6) | BIT(7)))) {
 		waitcount = 100;
 		tmpvalue = 0;
 
@@ -1268,7 +1268,7 @@ static u8 _rtl92s_set_sysclk(struct ieee80211_hw *hw, u8 data)
 	tmp = rtl_read_byte(rtlpriv, SYS_CLKR + 1);
 	result = ((tmp & BIT(7)) == (data & BIT(7)));
 
-	if ((data & (BIT(6) | BIT(7))) == false) {
+	if (!(data & (BIT(6) | BIT(7)))) {
 		waitcnt = 100;
 		tmp = 0;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
