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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D24C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B32206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B32206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8860520384;
	Sun, 10 Jan 2021 12:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkt6geBvTOvt; Sun, 10 Jan 2021 12:15:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1F98520368;
	Sun, 10 Jan 2021 12:15:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B1F5C0893;
	Sun, 10 Jan 2021 12:15:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67FD6C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 548232041D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0CpABaYx3SL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by silver.osuosl.org (Postfix) with ESMTPS id BE1C720381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:43 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id g3so8062999plp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 04:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5LcHk/djoLn7Im0a8MC7BPIVlKvUBpW71T7HTSyZtvM=;
 b=O5lBJIX0RFEgUKCa4t1sN8losvZrAe0svC+/OhDjliPS8GDWh0SK+NxKA1nHNgw7GV
 MkaDqSjl7Nrq3/VXDkvMpj+UR4SPzM/HVpi4frbEsORChfqqe7CcNv08IqCFM2Lqa08b
 Wy/rXmnKrUCHzLFuiMhxQOmTmtQ02wcH0SJ6jY2ODICPUO5VMHs35TFLrAGFinhO52Yz
 hqjnmx1IxQZTzYBmP5qKXEUTqQsnPTzCQrgqrvMRuev0i0d4SONiD2SZOvI+QKRa4WK/
 quIMQxZc7Wyw1aW23CSbjN7SZHSKkMPuNzgpykUV6uDwW3c0l4K8umhppJzO9xJP2u8l
 0dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5LcHk/djoLn7Im0a8MC7BPIVlKvUBpW71T7HTSyZtvM=;
 b=IZdhNB5TnHEsvna7pPlcVfz9EJJ4fFaCgU1QA37/6EGldhzGU0+v+a2RSk8TxvtUd/
 zVVBU2VH4a7IQTOlLFhSVKiL+IsUS6TDo3UOoqnWpKoidhshRHeLsQT7NYqdsRTEvrh9
 CV/uZ0T7/2CY69UxFtRYDMPw2WGTqxqP5OZnwie5aEPgVBOpBLVPZSywrfdrste5Bzxg
 ZfEindilO3WmC08fgLCYWY+/4baFWTUHChYmSZpaXNH0bjXHCshJHKdFGnFHVQ5BK0e1
 RTh7+2bF6qPbALhhFvPzsITR165cG3LNIu9CfVAZy9G13JS4wzb2gN/ShgmSfVUQv7TF
 XvBg==
X-Gm-Message-State: AOAM533KPCHOSy6eleXhHNgSB0K1oTgnUSW/STcPe29Gb76joiKUlin1
 2cf7gDHRlRyaCsj39bRUsVU=
X-Google-Smtp-Source: ABdhPJwVYC4QdGdeR1/vy2XXXA0K3dfT+pmaaaNTppDHriuZEvmh0dN/3EyUcnvG7B6qLZwxtQwAlg==
X-Received: by 2002:a17:90a:c20b:: with SMTP id
 e11mr12570465pjt.43.1610280943229; 
 Sun, 10 Jan 2021 04:15:43 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:381d:ba42:3c3c:81ce])
 by smtp.googlemail.com with ESMTPSA id y5sm10959791pjt.42.2021.01.10.04.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 04:15:42 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-wireless@vger.kernel.org
Date: Sun, 10 Jan 2021 17:45:22 +0530
Message-Id: <20210110121525.2407-3-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210110121525.2407-1-yashsri421@gmail.com>
References: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
 <20210110121525.2407-1-yashsri421@gmail.com>
Cc: pkshih@realtek.com, yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
Subject: [Linux-kernel-mentees] [PATCH 2/5] rtlwifi: rtl8192c-common: fix
	bool comparison in expressions
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

There are certain conditional expressions in rtl8192c-common, where a
boolean variable is compared with true/false, in forms such as
(foo == true) or (false != bar), which does not comply with checkpatch.pl
(CHECK: BOOL_COMPARISON), according to which boolean variables should be
themselves used in the condition, rather than comparing with true/false

E.g., in drivers/net/wireless/realtek/rtlwifi/rtl8192c/dm_common.c,
"else if (initialized == false) {" can be replaced with
"else if (!initialized) {"

Replace all such expressions with the bool variables appropriately

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192c/dm_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192c/dm_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192c/dm_common.c
index 265a1a336304..0b6a15c2e5cc 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192c/dm_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192c/dm_common.c
@@ -380,7 +380,7 @@ static void rtl92c_dm_initial_gain_multi_sta(struct ieee80211_hw *hw)
 		initialized = false;
 		dm_digtable->dig_ext_port_stage = DIG_EXT_PORT_STAGE_MAX;
 		return;
-	} else if (initialized == false) {
+	} else if (!initialized) {
 		initialized = true;
 		dm_digtable->dig_ext_port_stage = DIG_EXT_PORT_STAGE_0;
 		dm_digtable->cur_igvalue = 0x20;
@@ -509,7 +509,7 @@ static void rtl92c_dm_dig(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
 
-	if (rtlpriv->dm.dm_initialgain_enable == false)
+	if (!rtlpriv->dm.dm_initialgain_enable)
 		return;
 	if (!(rtlpriv->dm.dm_flag & DYNAMIC_FUNC_DIG))
 		return;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
