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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9778FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:16:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D781206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D781206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2FEDE20492;
	Sun, 10 Jan 2021 12:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbuXAUxuNdtq; Sun, 10 Jan 2021 12:15:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9E5F220381;
	Sun, 10 Jan 2021 12:15:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 874DDC0893;
	Sun, 10 Jan 2021 12:15:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54874C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 372C32047E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 958W1o9wnY1T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by silver.osuosl.org (Postfix) with ESMTPS id 58D6420381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:56 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id j13so8760182pjz.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 04:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=T7ThywqXuhxC8F6Hh3LDj1yvDqMYokNpJlLIGbeNsvg=;
 b=RJNN5BgGe8mKnEWypJ7UYPnfrK6Jxoaz8eUBmO+P/O89GAkqfT1ln2VZIiVO2f8AXR
 bhqozprqbGV9Mg/ZisW9ECc8jP/mk+nqS89Qnr/DRD88jkss5HEz2HfSx7AEn0ycLRq8
 4hG3cAX+L5XMyK58ByN8Bq4Jx9965rX7jPr59WKW3hJecoeWEck83icdNU7NEqtcCnnD
 MiR34KsXkRGX+jrHvt9stgwoqGIcQI+WMBIahCmFsuBT3TLpSzgaXzgn1wkofsKpqLkf
 tcGZbrtuyd9FCx8XYlBBXTf2Z9vflnJIN5b7Jpzr9zSYvzKCjPd3qWhafuqVw5qOig/y
 fw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=T7ThywqXuhxC8F6Hh3LDj1yvDqMYokNpJlLIGbeNsvg=;
 b=OkGiPc6PDqcCzbhiad6lsdDpq3KkDU3rkcTWQuH8QKAHaVcJ8pHjYDEBmsZVsRXIuO
 s/K70pCO0maiJ0M8/SBpEIg1G/w82vyTaGlHDTodOu2L+2kj8Q9RzZ0ajCdG/nLflu5M
 F9MhgHd3RN67wOUIcr+YILMR+dVCPn7vw4650yycFK1WHBUpY9jhZRrjPEAXNv6NiVPk
 8Aily0ZdkyQWcClOlCKvsvHPJ61PWn0maWSOVPRsJbZltCafe1sGLVl/NhLCNPNgEoEO
 YPUByBPRa38Mzi6QDSfD/4pM+MfTqV6930ajJrJiNV1q9roc//HqDzU3PFe2Jcp7ujwm
 kCXw==
X-Gm-Message-State: AOAM533TfzRpGA++0C5P191qJlBtMfncPdYKInBtJkQCzMH/7WLDnV6/
 IwLeng3w9WhIAiQknM8P17E=
X-Google-Smtp-Source: ABdhPJys2QAtK2nStXpmMUaaqsBFY49SSm7RfqzrRy2zOk36qHLcn1ATn8LKYR/FYtmW8MIDE65AIQ==
X-Received: by 2002:a17:90a:5303:: with SMTP id
 x3mr13072178pjh.54.1610280955942; 
 Sun, 10 Jan 2021 04:15:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:381d:ba42:3c3c:81ce])
 by smtp.googlemail.com with ESMTPSA id y5sm10959791pjt.42.2021.01.10.04.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 04:15:55 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-wireless@vger.kernel.org
Date: Sun, 10 Jan 2021 17:45:25 +0530
Message-Id: <20210110121525.2407-6-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210110121525.2407-1-yashsri421@gmail.com>
References: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
 <20210110121525.2407-1-yashsri421@gmail.com>
Cc: pkshih@realtek.com, yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
Subject: [Linux-kernel-mentees] [PATCH 5/5] rtlwifi: rtl8821ae: fix bool
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

There are certain conditional expressions in rtl8821ae, where a boolean
variable is compared with true/false, in forms such as (foo == true) or
(false != bar), which does not comply with checkpatch.pl (CHECK:
BOOL_COMPARISON), according to which boolean variables should be
themselves used in the condition, rather than comparing with true/false

E.g., in drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c,
"if (rtlefuse->autoload_failflag == false)" can be replaced with
"if (!rtlefuse->autoload_failflag)"

Replace all such expressions with the bool variables appropriately

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
index 372d6f8caf06..e214b9062cc1 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
@@ -1812,7 +1812,7 @@ static bool _rtl8821ae_phy_bb8821a_config_parafile(struct ieee80211_hw *hw)
 		return false;
 	}
 	_rtl8821ae_phy_init_tx_power_by_rate(hw);
-	if (rtlefuse->autoload_failflag == false) {
+	if (!rtlefuse->autoload_failflag) {
 		rtstatus = _rtl8821ae_phy_config_bb_with_pgheaderfile(hw,
 						    BASEBAND_CONFIG_PHY_REG);
 	}
@@ -3980,7 +3980,7 @@ static void _rtl8821ae_iqk_tx(struct ieee80211_hw *hw, enum radio_path path)
 				}
 			}
 
-			if (tx0iqkok == false)
+			if (!tx0iqkok)
 				break;				/* TXK fail, Don't do RXK */
 
 			if (vdf_enable == 1) {
@@ -4090,7 +4090,7 @@ static void _rtl8821ae_iqk_tx(struct ieee80211_hw *hw, enum radio_path path)
 						}
 					}
 
-					if (tx0iqkok == false) {   /* If RX mode TXK fail, then take TXK Result */
+					if (!tx0iqkok) {   /* If RX mode TXK fail, then take TXK Result */
 						tx_x0_rxk[cal] = tx_x0[cal];
 						tx_y0_rxk[cal] = tx_y0[cal];
 						tx0iqkok = true;
@@ -4249,7 +4249,7 @@ static void _rtl8821ae_iqk_tx(struct ieee80211_hw *hw, enum radio_path path)
 					}
 				}
 
-				if (tx0iqkok == false) {   /* If RX mode TXK fail, then take TXK Result */
+				if (!tx0iqkok) {   /* If RX mode TXK fail, then take TXK Result */
 					tx_x0_rxk[cal] = tx_x0[cal];
 					tx_y0_rxk[cal] = tx_y0[cal];
 					tx0iqkok = true;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
