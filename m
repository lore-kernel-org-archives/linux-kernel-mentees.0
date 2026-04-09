Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9E3B52EB
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Apr 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742661; cv=none; b=U8NNO8LbCjK4qbXGGaWQWtIE5qasacyEoM+gPJZ/kNSM2sINzeM+wGAaijnqFs5NpDXBm65i/sTltNoFyKzEo6MUR2EUj4jOPDCUaZIvyZJPhwaMKdkJmYpeImaTQ+3cvFnH8VDoqCXJekMGsywUXKY9iZprLANMKj2mKXWSaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742661; c=relaxed/simple;
	bh=GoJd8xoFax/fUYid/kkt0blxgC9juHJhA+KIYsEv7U0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I52t5y1gkvVZnuEOXoTXMuh3XAue806lPzsikW8N4ZRr/boYw6iV25PGLpkGhsWKp8gjXN/nOR4LbZirWBlXMZ+OtCTvr0xwpgbUhTNmM6fMiI1BEfbnHuE18pnsLPxxoYVewgS096k+yUXmvX05ejntmqS1LolSHazJORFIOlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyTarJii; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyTarJii"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so373892a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Apr 2026 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742655; x=1776347455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOX+Dn3sD+9VHEa9uJa98TAYdd3Svmy0/RHJyTRf6N4=;
        b=HyTarJiiZUEdtIejQ+wtYxzWZzWzmQA8pdcNK3MEIq2A4X8e7Lbmd3iE6bunPE0rXS
         wotOiy0hZeCesCrnQJfcoIjTGpY2v65/7k82br3FT6Tx+wLgOdO4ZIJD2Nh6UiDUvlGS
         NzvgNWocGo65L0KPSbbP/KPU2k/cOeok6vDhMmJaKy1gONQWQuAK6Iyb9+lcIFRbPgT0
         Ywu8p/dGpuXb7U6OrWz5C+mBu2NqHJdXzgdNoqt0NPAzWO5y+AhgT7jUtYJLnxcADkvP
         qN5HcL07X021TJsDELpkXF1YkvKlDK5VayyfCecaWJqw8cy05YGn26XxlI8auU7OyvnT
         E6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742655; x=1776347455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOX+Dn3sD+9VHEa9uJa98TAYdd3Svmy0/RHJyTRf6N4=;
        b=gkc+m/rcez7pqmD0LFa43xQK3LYC+d2mbOzWTMbZNAf42cuV1li73KJ7inEo47fWe4
         lb8smPWTCl046xNyyc9kZcZ8VYE+9l8gChOwIYKHpz2/AYT/TvKZHr2vgOYRuFmR78/9
         pLuWoluLzabIr05oVTGyxjZRDX3X6zPetcftuJg/1ezHFebzhTWWeiAO8iSHxI5nkW7i
         OLy4bssrDmOXnJmsM9Vq8dsE6spID07FYNgO6Nuq0XPkUoqBIMylN29Ww/J+/tc5Kl1h
         FPqhN9qrcdh8FUlTOkHRJ4JGbYIjgh4U+sj1F63YHLRHdNvQymyTDyF8I+v+W47UyRjw
         HAkg==
X-Forwarded-Encrypted: i=1; AJvYcCUO0tQuJEiPa88H+yNZwiUXIl78a2cGajGAiGGprs+VR4LameQ9koqtQkDOIBzVXQePD/0LZWdW37lMpAOEFs20YxnUhg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/ez80jOQPaP7GdTA6+KUM1YI1x8zlobtLdBm0Efp1mUFSb7oc
	/bhd/LYVOM8Ies2xIEjN6AZXy3mlr/xlAGBL4DYdGiFRNCkullmlV9Jl
X-Gm-Gg: AeBDietDoRAQFmVzx+kqkq3bmOR1y75aecB50AR/x5ztBvpukeR6jDz8Ljonq+Mev8b
	LPMGBv8+lg3vKitSXR9IlBG6bQXdjTl8u/T9eIxc8XmdMPgaJiUAgqORIHBqmOU/F6Kl6ohl42Z
	qIwiPgh6rjus7w0PV/OHPSAh6JiGkhd6fYvV4/9lk2WpggdTy0lcm+sAgQxPVlbYknVG3blMv43
	qu+DTtNxmQN8ieOlzIQIihjpvD9romPowSXbIEhQZwlLkA71M+L+TPhr4seonVaLtf680pN/sv7
	Fk96T3RqrHJq+TDA5D65vPXM6dNUaNuvHR/J7pa94J1MyhnQ63nldqoL1E0oe1doyGfOptCxGfI
	pdCPbtjp/bD/5MwLrcl+XcZBSmtlwLK341HZRmy5cZHyJqXHp9xW2vinghNO3vRfOBysDvs2fvs
	zbtbwNM7Pm1D6G8OhAm7NvOsLg82nsBatgY6Qp7Qfg
X-Received: by 2002:a17:902:f60f:b0:2b0:b1e2:583 with SMTP id d9443c01a7336-2b2817d9616mr287882085ad.2.1775742654620;
        Thu, 09 Apr 2026 06:50:54 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:50:54 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 1/5] staging: rtl8723bs: move constant to right side of test in comparison
Date: Thu,  9 Apr 2026 19:20:22 +0530
Message-Id: <20260409135026.137904-2-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move constant from the left side to the right side of the test in a
comparison, where ==, !=, <=, >=, <, > operators are used, fixing the
checkpatch warning: Comparisons should place the constant on the right
side of the test.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  4 ++--
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c        |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c |  4 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  |  4 ++--
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..58f6cf063498 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -2211,7 +2211,7 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	}
 
 	algorithm = halbtc8723b2ant_ActionAlgorithm(pBtCoexist);
-	if (pCoexSta->bC2hBtInquiryPage && (BT_8723B_2ANT_COEX_ALGO_PANHS != algorithm)) {
+	if (pCoexSta->bC2hBtInquiryPage && (algorithm != BT_8723B_2ANT_COEX_ALGO_PANHS)) {
 		halbtc8723b2ant_ActionBtInquiry(pBtCoexist);
 		return;
 	} else {
@@ -2490,7 +2490,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		return;
 	}
 
-	if (BT_INFO_SRC_8723B_2ANT_WIFI_FW != rspSource) {
+	if (rspSource != BT_INFO_SRC_8723B_2ANT_WIFI_FW) {
 		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [3:0] */
 
 		pCoexSta->btRssi = pCoexSta->btInfoC2h[rspSource][3] * 2 + 10;
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 8f6849f2277e..0780847e287d 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -301,7 +301,7 @@ static void GetDeltaSwingTable_8723B(
 	u16 rate = *(pDM_Odm->pForcedDataRate);
 	u8 channel = pHalData->CurrentChannel;
 
-	if (1 <= channel && channel <= 14) {
+	if (channel >= 1 && channel <= 14) {
 		if (IS_CCK_RATE(rate)) {
 			*TemperatureUP_A   = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_P;
 			*TemperatureDOWN_A = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_N;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..5473dca13695 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		auto_load_fail = true;
 
 	if (!auto_load_fail) {
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index bdd595a99b98..2746da0a9846 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -466,11 +466,11 @@ u8 PHY_GetTxPowerIndexBase(
 
 	if (IS_CCK_RATE(Rate))
 		txPower = pHalData->Index24G_CCK_Base[RFPath][chnlIdx];
-	else if (MGN_6M <= Rate)
+	else if (Rate >= MGN_6M)
 		txPower = pHalData->Index24G_BW40_Base[RFPath][chnlIdx];
 
 	/*  OFDM-1T */
-	if ((MGN_6M <= Rate && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
+	if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
 		txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
 
 	if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..b15899580893 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -405,11 +405,11 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 			break;
 	}
 	_FWDownloadEnable(padapter, false);
-	if (_SUCCESS != rtStatus)
+	if (rtStatus != _SUCCESS)
 		goto fwdl_stat;
 
 	rtStatus = _FWFreeToGo(padapter, 10, 200);
-	if (_SUCCESS != rtStatus)
+	if (rtStatus != _SUCCESS)
 		goto fwdl_stat;
 
 fwdl_stat:
@@ -1165,15 +1165,15 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 
 static void hal_get_chnl_group_8723b(u8 channel, u8 *group)
 {
-	if (1  <= channel && channel <= 2)
+	if (channel >= 1 && channel <= 2)
 		*group = 0;
-	else if (3  <= channel && channel <= 5)
+	else if (channel >= 3 && channel <= 5)
 		*group = 1;
-	else if (6  <= channel && channel <= 8)
+	else if (channel >= 6 && channel <= 8)
 		*group = 2;
-	else if (9  <= channel && channel <= 11)
+	else if (channel >= 9 && channel <= 11)
 		*group = 3;
-	else if (12 <= channel && channel <= 14)
+	else if (channel >= 12 && channel <= 14)
 		*group = 4;
 }
 
@@ -1221,7 +1221,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 
 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
 
-	if (0xFF == PROMContent[eeAddr+1])
+	if (PROMContent[eeAddr+1] == 0xFF)
 		AutoLoadFail = true;
 
 	if (AutoLoadFail) {
@@ -2037,7 +2037,7 @@ static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
 		val8 &= ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
 
 		/*  Always enable port0 beacon function for PSTDMA */
-		if (REG_BCN_CTRL == bcn_ctrl_reg)
+		if (bcn_ctrl_reg == REG_BCN_CTRL)
 			val8 |= EN_BCN_FUNCTION;
 
 		rtw_write8(padapter, bcn_ctrl_reg, val8);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index f50726d2ed0c..ff39077deb69 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -415,7 +415,7 @@ int rtl8723bs_xmit_thread(void *context)
 		if (signal_pending(current)) {
 			flush_signals(current);
 		}
-	} while (_SUCCESS == ret);
+	} while (ret == _SUCCESS);
 
 	complete(&pxmitpriv->SdioXmitTerminate);
 
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index fbb12fe31a6c..a3f519e2f6d2 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -394,8 +394,8 @@ enum {
 };
 
 #define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
-#define IS_CCK_RATE(_rate)				(MGN_1M == _rate || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
-#define IS_OFDM_RATE(_rate)				(MGN_6M <= _rate && _rate <= MGN_54M  && _rate != MGN_11M)
+#define IS_CCK_RATE(_rate)				(_rate == MGN_1M || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
+#define IS_OFDM_RATE(_rate)				(_rate >= MGN_6M && _rate <= MGN_54M  && _rate != MGN_11M)
 
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
-- 
2.34.1

