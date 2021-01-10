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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6908DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB00206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB00206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E462D20381;
	Sun, 10 Jan 2021 12:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjObxu924KpL; Sun, 10 Jan 2021 12:15:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 467C1203FF;
	Sun, 10 Jan 2021 12:15:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DD09C0893;
	Sun, 10 Jan 2021 12:15:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C51E7C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AD8A287191
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Zgwnow3Sa7A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A035C87176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:47 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id y12so1875274pji.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pDEEvJ1raRHovODvVibZtDrKwCKJS8ji5cQnuEVu9AU=;
 b=MBjX5Y9FARb2FMBMlNC5DaPzVJYt9sa0Habl/+AgRVKXnklO3mQ3Kd95BGdG0h4APM
 Y+YhKW270hNPN+GAlVuc4n7KgSHwgA5WKEjy1BcdubFnuwKO8+dFnzebnz0KwgUB3Rd7
 EeYcBgAIxt8GKk5zamNAft+QCWbaN83hW0eE/igQZUxbq6tQFRONrDFEhCKJJewbmbWj
 XHdRg1Fo4UDU9iSoqqfJWkyTgNdgL+lovu2OlyB18snHusjCtYJ3EP7sFoindhpY5Dsv
 oF1aH8pNj5jyHsnjgV7qj3Gpfa2gmE2lMkQbVgzoCKUPYWb9GuNGamnmhXq7ElclRLK8
 4SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pDEEvJ1raRHovODvVibZtDrKwCKJS8ji5cQnuEVu9AU=;
 b=e1Y3CdZrl1I+y+txiQdh4Q25OqID4/3M6KiWhdPq0tosB5t2EMr0pCEq2O1cyeopdY
 uZgSv/QOWOMA8mzz/RASx64oq9zq7mqh6ldHV/ZYQym3RK8ANNEssRFbx0x0m0HowsZ0
 c+QhuhHmFfi6vnRdOoPG+Kw77l/0WfqOLuqRahUEIOME3B5ImMSBtiW6ubNYuY76Dtew
 xqMTnLMpQE6fCyScuVGxW8a//D6F4PDsR7AUAK8oDMO1V314v1DJSoXrSsXRpN5yv6o/
 dL1IfExKEMczZX41HOM/+B7eOLO5mvfjSV38a/prYSf1phJ6dvJ7OXmWAFqbZmE/IrN+
 v+sQ==
X-Gm-Message-State: AOAM533EcFr1CEKh5VHrMgc0KRf7MVayFBRRKnxVcbfdy3P4e8jH96hd
 XlKTLgwhmq2wl8cPd4YlHXg=
X-Google-Smtp-Source: ABdhPJwmOW2gS/r2V+OiuIjnYnknqXowh5GM0aAdpna5+cM/rvaentF8D04RcnV2A9dHu71MAGaQ9Q==
X-Received: by 2002:a17:90b:1945:: with SMTP id
 nk5mr12666347pjb.30.1610280947142; 
 Sun, 10 Jan 2021 04:15:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:381d:ba42:3c3c:81ce])
 by smtp.googlemail.com with ESMTPSA id y5sm10959791pjt.42.2021.01.10.04.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 04:15:46 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-wireless@vger.kernel.org
Date: Sun, 10 Jan 2021 17:45:23 +0530
Message-Id: <20210110121525.2407-4-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210110121525.2407-1-yashsri421@gmail.com>
References: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
 <20210110121525.2407-1-yashsri421@gmail.com>
Cc: pkshih@realtek.com, yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
Subject: [Linux-kernel-mentees] [PATCH 3/5] rtlwifi: rtl8188ee: fix bool
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

There are certain conditional expressions in rtl8188ee, where a boolean
variable is compared with true/false, in forms such as (foo == true) or
(false != bar), which does not comply with checkpatch.pl (CHECK:
BOOL_COMPARISON), according to which boolean variables should be
themselves used in the condition, rather than comparing with true/false

E.g., in drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c,
"if (mac->act_scanning == true)" can be replaced with
"if (mac->act_scanning)"

Replace all such expressions with the bool variables appropriately

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c | 8 ++++----
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
index d10c14c694da..6f61d6a10627 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c
@@ -474,11 +474,11 @@ static void rtl88e_dm_dig(struct ieee80211_hw *hw)
 	u8 dm_dig_max, dm_dig_min;
 	u8 current_igi = dm_dig->cur_igvalue;
 
-	if (rtlpriv->dm.dm_initialgain_enable == false)
+	if (!rtlpriv->dm.dm_initialgain_enable)
 		return;
-	if (dm_dig->dig_enable_flag == false)
+	if (!dm_dig->dig_enable_flag)
 		return;
-	if (mac->act_scanning == true)
+	if (mac->act_scanning)
 		return;
 
 	if (mac->link_state >= MAC80211_LINKED)
@@ -1637,7 +1637,7 @@ static void rtl88e_dm_fast_ant_training(struct ieee80211_hw *hw)
 			}
 		}
 
-		if (bpkt_filter_match == false) {
+		if (!bpkt_filter_match) {
 			rtl_set_bbreg(hw, DM_REG_TXAGC_A_1_MCS32_11N,
 				      BIT(16), 0);
 			rtl_set_bbreg(hw, DM_REG_IGI_A_11N, BIT(7), 0);
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
index bd9160b166c5..861cc663ca93 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
@@ -1269,12 +1269,12 @@ void rtl88ee_set_check_bssid(struct ieee80211_hw *hw, bool check_bssid)
 	if (rtlpriv->psc.rfpwr_state != ERFON)
 		return;
 
-	if (check_bssid == true) {
+	if (check_bssid) {
 		reg_rcr |= (RCR_CBSSID_DATA | RCR_CBSSID_BCN);
 		rtlpriv->cfg->ops->set_hw_reg(hw, HW_VAR_RCR,
 					      (u8 *)(&reg_rcr));
 		_rtl88ee_set_bcn_ctrl_reg(hw, 0, BIT(4));
-	} else if (check_bssid == false) {
+	} else if (!check_bssid) {
 		reg_rcr &= (~(RCR_CBSSID_DATA | RCR_CBSSID_BCN));
 		_rtl88ee_set_bcn_ctrl_reg(hw, BIT(4), 0);
 		rtlpriv->cfg->ops->set_hw_reg(hw,
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
