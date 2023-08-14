Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA697C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Aug 2023 20:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2984D40324;
	Mon, 14 Aug 2023 20:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2984D40324
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R1zZbbSB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xI2nm7RjGV4V; Mon, 14 Aug 2023 20:04:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D718740284;
	Mon, 14 Aug 2023 20:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D718740284
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2D37C008D;
	Mon, 14 Aug 2023 20:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 553AAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 20:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26789801EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 20:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26789801EC
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=R1zZbbSB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYs7WwzBmkKV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 20:03:29 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3874581699
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 20:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3874581699
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso42818185e9.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692043407; x=1692648207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5fiXIeSxGU6C12/rcvOiLEQl7A8RO3MC5S0NrAZgA48=;
 b=R1zZbbSBgKNzu8Ux7wLr6E7apfwzcRfyA2+cBDttLJOkCC/s9/IAzJvwJ4pAMFxB4G
 8EEQo+h0B5MuO3JKzc1dj3fdx/uRf3PUFyEYOd81VTkIE2D6GK5itNQnjGzGSZUtuPwN
 UnEsi3N7H/YbxHGFm1AB+a3vpuaSFqIUpFypDDc5miqMth+ku5FdETHayi4Juz3/kj4Y
 3qx5quWLJRvMO/S50jFyMSMDOnikqA7jOCZCKb0wtS3/zSf8/D427vEQMkBKqKCkfPbz
 32yoKjo/oosQ4N1aVk7XcFdkufhJ0jYE4ZNAzZpCwkCb18Oudfgli4nE4KJCrWc+3wd7
 6h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692043407; x=1692648207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5fiXIeSxGU6C12/rcvOiLEQl7A8RO3MC5S0NrAZgA48=;
 b=fTRscbAFTpb12tUC+Uz2DUWw6Hl0L4ObRov8k0t7fZGLYWR6cyG9hVQpDAl2gN0OLb
 SAd/Iaq67jUDtv2hpKi2zKepHn6JERzYf8rPB9sTixNatwsZJbogqHvJU9lVHXOgT0l1
 I19yTWhaxmZfh4uTEvPJeaodRweBhy9Lf/w2YimMx533xCNvKmQkAcCmdPCD9qchlIvT
 JhouMRuv+dzbaPA/c32ikWNKuciHKhrw8HDILziGnZFiFKWKN9LW4vV0HW0YFMpnRlNh
 LhAea675MuLrL51VLCALyPdld1OjNqXJVp33DcEaI+TvEtTA8O1d5kVw2Om6QvH+2yW1
 wAjA==
X-Gm-Message-State: AOJu0Yx4jz9sZYmJ0jlP6R+IDBigOmUPBTU4MdjLKV8fMfAM+FzRzQ9n
 xY/rZ899foKUTa5Yfe0yon0=
X-Google-Smtp-Source: AGHT+IEEzqFJCrvsKy+RvX2zA7EyrgcHCWnPkZR0870P2/bZGQTchnccaPU3JR3ahoetHACFF4e1ig==
X-Received: by 2002:adf:f4c6:0:b0:317:5399:bb5b with SMTP id
 h6-20020adff4c6000000b003175399bb5bmr7436110wrp.25.1692043406977; 
 Mon, 14 Aug 2023 13:03:26 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:806e:5eb8:ff79:bda:b103])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c378d00b003fe2de3f94fsm15225777wmr.12.2023.08.14.13.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 13:03:26 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: jirislaby@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org,
 kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] ath5k: fix WARNING opportunity for swap.
Date: Tue, 15 Aug 2023 00:02:34 +0400
Message-Id: <20230814200234.637583-1-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
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

coccinielle reported the following:
./drivers/net/wireless/ath/ath5k/phy.c:1573:25-26: WARNING opportunity for swap()

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
---
changes in v1:
- replace the entire double loop with sort()
  as suggested by Jiri Slaby <jirislaby@kernel.org>
---
 drivers/net/wireless/ath/ath5k/phy.c | 29 +++++++++++++---------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
index 5797ef9c73d7..7ee4e1616f45 100644
--- a/drivers/net/wireless/ath/ath5k/phy.c
+++ b/drivers/net/wireless/ath/ath5k/phy.c
@@ -26,6 +26,7 @@
 
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/sort.h>
 #include <asm/unaligned.h>
 
 #include "ath5k.h"
@@ -1554,6 +1555,11 @@ static void ath5k_hw_update_nfcal_hist(struct ath5k_hw *ah, s16 noise_floor)
 	hist->nfval[hist->index] = noise_floor;
 }
 
+static int cmps16(const void *a, const void *b)
+{
+	return *(s16 *)a - *(s16 *)b;
+}
+
 /**
  * ath5k_hw_get_median_noise_floor() - Get median NF from history buffer
  * @ah: The &struct ath5k_hw
@@ -1561,25 +1567,16 @@ static void ath5k_hw_update_nfcal_hist(struct ath5k_hw *ah, s16 noise_floor)
 static s16
 ath5k_hw_get_median_noise_floor(struct ath5k_hw *ah)
 {
-	s16 sort[ATH5K_NF_CAL_HIST_MAX];
-	s16 tmp;
-	int i, j;
-
-	memcpy(sort, ah->ah_nfcal_hist.nfval, sizeof(sort));
-	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX - 1; i++) {
-		for (j = 1; j < ATH5K_NF_CAL_HIST_MAX - i; j++) {
-			if (sort[j] > sort[j - 1]) {
-				tmp = sort[j];
-				sort[j] = sort[j - 1];
-				sort[j - 1] = tmp;
-			}
-		}
-	}
+	s16 sorted_nfval[ATH5K_NF_CAL_HIST_MAX];
+	int i;
+
+	memcpy(sorted_nfval, ah->ah_nfcal_hist.nfval, sizeof(sorted_nfval));
+	sort(sorted_nfval, ATH5K_NF_CAL_HIST_MAX, sizeof(s16), cmps16, NULL);
 	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX; i++) {
 		ATH5K_DBG(ah, ATH5K_DEBUG_CALIBRATE,
-			"cal %d:%d\n", i, sort[i]);
+			"cal %d:%d\n", i, sorted_nfval[i]);
 	}
-	return sort[(ATH5K_NF_CAL_HIST_MAX - 1) / 2];
+	return sorted_nfval[(ATH5K_NF_CAL_HIST_MAX - 1) / 2];
 }
 
 /**
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
