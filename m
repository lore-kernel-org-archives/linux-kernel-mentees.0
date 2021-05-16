Return-Path: <SRS0=6zuU=KL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE62C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:30:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E8C61155
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6E8C61155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F86E607CB;
	Sun, 16 May 2021 12:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHYe9Vg47WBe; Sun, 16 May 2021 12:30:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5611060703;
	Sun, 16 May 2021 12:30:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 332E2C000E;
	Sun, 16 May 2021 12:30:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54F68C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36DDE60703
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzNCvq9yT1Qt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58F69605F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:25 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id s19so878565pfe.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 05:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6/Rho8TmYFKlfRGaJ1gUUbZ0GhH8HY750ITGcGEJbQ=;
 b=IdoLeuPUpirykiZih9M5Qe9bdrboecUgrFfLDpHR962ClzrVk6AUz19c+8UZRS61yC
 ET5LtmeDX2Pla+ivhcv7osrO/KtUuONSP9YkFD+jkZs/Il9i0PZltn0JoBsl/AAPwGXE
 z5AU0zkD2HtyekFE1s3H+YQVmHm+drGYEkOPPPY6GDDbbUu0aTP3Hx5jyKdL4eR5hSJZ
 mwdAlrLXkCGnmTq8jen8scU0pDzWADMdLoAy5SuHboS145WYMBz+E5ysxzk3XpEnQDIm
 AGSCImrf2w3GAq3MH7WXjJcHNihdDivhqCV/OgyKCtwYkwvDqClsIWvhtfEv4imQV09i
 A/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6/Rho8TmYFKlfRGaJ1gUUbZ0GhH8HY750ITGcGEJbQ=;
 b=E6YHC4fCoE8mNcymZoZItcgKFCvpZv9IltcJXwLHim0dw0pfoRgEekNUNoMAiqbLKH
 1t6n3c0mjMePH6fH1JoSWUkB35qow4TFJNSnX8GvasCZFvtDR/guG4+VUdnP3zfpJJ3N
 pknM8agU0F7ef1RDWQsOo4Boim0fci9YCYnqPXcee8S0PWIS0RRhuFrHAgzAfKaiBkk9
 o41kOEb85Vl+1SOQzslOOJzhM9yqeN/sX9I5a71yPdJkSuWMrshNUJAo7PP2Ekwj+FHQ
 KuqRZ3nbVBv11RIrIxo7a34skCtEH3oCyHJoNo7A5L3YiFzk5fXGxUda01urOOyx+50T
 ZS1g==
X-Gm-Message-State: AOAM532uVFhxVhK9eB3e6oPz+FpfuHZwQ9JK1LZrY4CFNnNpQS38e6gL
 reeosIucZ8BC+kuS5FMY87w=
X-Google-Smtp-Source: ABdhPJyflv6pZ8fTilF0drecMpY4vUnqXNJkII1REaaMMwmslSq8qUO47eYOeVSdGAdAMAmv7HTkfw==
X-Received: by 2002:a63:4547:: with SMTP id u7mr10064952pgk.250.1621168224775; 
 Sun, 16 May 2021 05:30:24 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
 by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:30:24 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH 1/7] Staging: rtl8723bs: remove unnecessary braces in
 HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:21 -0400
Message-Id: <20210516122927.1132356-2-desmondcheongzx@gmail.com>
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

This commit fixes the following checkpatch.pl warnings:

WARNING: braces {} are not necessary for any arm of this statement
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
[...]
+			} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+			if (btRssi < rssiThresh) {
[...]
+			} else {
[...]

WARNING: braces {} are not necessary for single statement blocks
+		if (rssiThresh > rssiThresh1) {
+			return pCoexSta->preBtRssiState;
+		}

WARNING: braces {} are not necessary for any arm of this statement
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
[...]
+			} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
[...]
+			} else if (btRssi < rssiThresh) {
[...]
+			} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+			if (btRssi < rssiThresh1) {
[...]
+			} else {
[...]

WARNING: braces {} are not necessary for single statement blocks
+	if (!pBtLinkInfo->bBtLinkExist) {
+		return algorithm;
+	}

WARNING: braces {} are not necessary for any arm of this statement
+				if (bBtHsOn) {
[...]
+				} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+				if (bBtHsOn) {
[...]
+				} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+				if (bBtHsOn) {
[...]
+				} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+				if (bBtHsOn) {
[...]
+				} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+				if (bBtHsOn) {
[...]
+				} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+				if (bBtHsOn) {
[...]
+				} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+				if (bBtHsOn) {
[...]
+				} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
+				if (u1Tmp & BIT0) {
[...]
+				} else {
[...]

WARNING: braces {} are not necessary for single statement blocks
+	if (pBtCoexist->bManualControl) {
+		return;
+	}

WARNING: braces {} are not necessary for single statement blocks
+	if (pBtCoexist->bStopCoexDm) {
+		return;
+	}

WARNING: braces {} are not necessary for single statement blocks
+	if (pCoexSta->bUnderIps) {
+		return;
+	}

WARNING: braces {} are not necessary for any arm of this statement
+		if ((pBtLinkInfo->bA2dpExist) && (pCoexSta->bC2hBtInquiryPage)) {
[...]
+		} else
[...]

WARNING: braces {} are not necessary for any arm of this statement
+	if (BTC_LPS_ENABLE == type) {
[...]
+	} else if (BTC_LPS_DISABLE == type) {
[...]

WARNING: braces {} are not necessary for single statement blocks
+			if (!pBtCoexist->bManualControl && !pBtCoexist->bStopCoexDm) {
+				halbtc8723b1ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, false);
+			}

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 94 ++++++++-----------
 1 file changed, 37 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 300327f8706c..85bf45cabecd 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -38,50 +38,44 @@ static u8 halbtc8723b1ant_BtRssiState(
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
 
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else {
-			if (btRssi < rssiThresh) {
+			if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preBtRssiState;
-		}
 
 		if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT)) {
+			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (btRssi < rssiThresh) {
+			else if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
-			if (btRssi < rssiThresh1) {
+			if (btRssi < rssiThresh1)
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	}
 
@@ -508,9 +502,8 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 
-	if (!pBtLinkInfo->bBtLinkExist) {
+	if (!pBtLinkInfo->bBtLinkExist)
 		return algorithm;
-	}
 
 	if (pBtLinkInfo->bScoExist)
 		numOfDiffProfile++;
@@ -530,11 +523,10 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			} else if (pBtLinkInfo->bA2dpExist) {
 				algorithm = BT_8723B_1ANT_COEX_ALGO_A2DP;
 			} else if (pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANHS;
-				} else {
+				else
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR;
-				}
 			}
 		}
 	} else if (numOfDiffProfile == 2) {
@@ -544,27 +536,24 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			} else if (pBtLinkInfo->bA2dpExist) {
 				algorithm = BT_8723B_1ANT_COEX_ALGO_SCO;
 			} else if (pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_SCO;
-				} else {
+				else
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
-				}
 			}
 		} else {
 			if (pBtLinkInfo->bHidExist && pBtLinkInfo->bA2dpExist) {
 				algorithm = BT_8723B_1ANT_COEX_ALGO_HID_A2DP;
 			} else if (pBtLinkInfo->bHidExist && pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_HID_A2DP;
-				} else {
+				else
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
-				}
 			} else if (pBtLinkInfo->bPanExist && pBtLinkInfo->bA2dpExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_A2DP_PANHS;
-				} else {
+				else
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_A2DP;
-				}
 			}
 		}
 	} else if (numOfDiffProfile == 3) {
@@ -574,17 +563,15 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			} else if (
 				pBtLinkInfo->bHidExist && pBtLinkInfo->bPanExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_HID_A2DP;
-				} else {
+				else
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
-				}
 			} else if (pBtLinkInfo->bPanExist && pBtLinkInfo->bA2dpExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_SCO;
-				} else {
+				else
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
-				}
 			}
 		} else {
 			if (
@@ -592,11 +579,10 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_HID_A2DP;
-				} else {
+				else
 					algorithm = BT_8723B_1ANT_COEX_ALGO_HID_A2DP_PANEDR;
-				}
 			}
 		}
 	} else if (numOfDiffProfile >= 3) {
@@ -893,11 +879,10 @@ static void halbtc8723b1ant_SetAntPath(
 				u1Tmp = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x49d);
 				cntBtCalChk++;
 
-				if (u1Tmp & BIT0) {
+				if (u1Tmp & BIT0)
 					mdelay(50);
-				} else {
+				else
 					break;
-				}
 			}
 
 			/*  set grant_bt to PTA */
@@ -2015,17 +2000,14 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	u32 wifiLinkStatus = 0;
 	u32 numOfWifiLink = 0;
 
-	if (pBtCoexist->bManualControl) {
+	if (pBtCoexist->bManualControl)
 		return;
-	}
 
-	if (pBtCoexist->bStopCoexDm) {
+	if (pBtCoexist->bStopCoexDm)
 		return;
-	}
 
-	if (pCoexSta->bUnderIps) {
+	if (pCoexSta->bUnderIps)
 		return;
-	}
 
 	if (
 		(BT_8723B_1ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) ||
@@ -2057,9 +2039,9 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 		halbtc8723b1ant_LimitedTx(pBtCoexist, NORMAL_EXEC, 0, 0, 0, 0);
 		halbtc8723b1ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, bBtCtrlAggBufSize, aggBufSize);
 
-		if ((pBtLinkInfo->bA2dpExist) && (pCoexSta->bC2hBtInquiryPage)) {
+		if ((pBtLinkInfo->bA2dpExist) && (pCoexSta->bC2hBtInquiryPage))
 			halbtc8723b1ant_ActionBtInquiry(pBtCoexist);
-		} else
+		else
 			halbtc8723b1ant_ActionWifiMultiPort(pBtCoexist);
 
 		return;
@@ -2718,11 +2700,10 @@ void EXhalbtc8723b1ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (pBtCoexist->bManualControl || pBtCoexist->bStopCoexDm)
 		return;
 
-	if (BTC_LPS_ENABLE == type) {
+	if (BTC_LPS_ENABLE == type)
 		pCoexSta->bUnderLps = true;
-	} else if (BTC_LPS_DISABLE == type) {
+	else if (BTC_LPS_DISABLE == type)
 		pCoexSta->bUnderLps = false;
-	}
 }
 
 void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -3029,9 +3010,8 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 		}
 
 		if (pCoexSta->btInfoExt & BIT3) {
-			if (!pBtCoexist->bManualControl && !pBtCoexist->bStopCoexDm) {
+			if (!pBtCoexist->bManualControl && !pBtCoexist->bStopCoexDm)
 				halbtc8723b1ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, false);
-			}
 		} else {
 			/*  BT already NOT ignore Wlan active, do nothing here. */
 		}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
