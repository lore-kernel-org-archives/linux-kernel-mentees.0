Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102E1C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Aug 2023 04:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BDBF40869;
	Tue, 15 Aug 2023 04:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDBF40869
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pXh3wdDu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIsnFvaO4Zx4; Tue, 15 Aug 2023 04:08:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 109A140865;
	Tue, 15 Aug 2023 04:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 109A140865
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC14EC0071;
	Tue, 15 Aug 2023 04:08:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88A9BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 04:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69B0240382
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 04:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B0240382
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pXh3wdDu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROTysr9FSHXG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 04:08:29 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AB0340114
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 04:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AB0340114
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe1e1142caso49478875e9.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 21:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692072507; x=1692677307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=anT8jKhSoDVocUIDbiLfqy7dD2AOUweYjEowk202rTE=;
 b=pXh3wdDuavmAXAWIopZ2tsVh81/1AfndoZfZCz6/vScMlf2CL0WH/iRhg39OnJbi96
 Mi6oLJlMJ/nsCF54S1G09ZWjPd9vznFlZ3Zry6G3nn00GLfg2bHUu4RH1Ak6x3s8NDZL
 pf4GLkgmBssOJX8mm7Tlwfi8nYngQz3TT6luj14EsoxJPXmMSHTyhvcg4kzCyG1aDN31
 moOXSAe0JMwiawhxdNx3ZXSLwp2MFZ5kGCL3gFB4al8mQvJuPYMHOjWIBILFSIB+kKxr
 6xFm04W11jT9eob7hbPxd4mV+/bqzsVLXYK1JUbcUmavyOY1wvPj+fcf8D06MyLRFmtl
 YTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692072507; x=1692677307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=anT8jKhSoDVocUIDbiLfqy7dD2AOUweYjEowk202rTE=;
 b=hZ00w+Y+m93tnaSkTw3OKA8Sz9aYWPRb0DhtV1LP26xo1x0LKZwtiMNjY6ilZrbbKi
 UJz9WlsnUQOnuRT8wWMZEx+DAIssOXjBM2PsGnQNh5EY31BSDP+rdoa9bCnt8maTahax
 lfTgyAli9d+XivForRgz/NwRiijO1LMv0IZjhb1wCSiQ+p/reIVJBhbBefRvxos6lcrX
 er8U5YLRIKvPJBN+zsrQ8hxpQPP9sXJ6Gnp4dn9ywWdD5pDyRdoGgGb5flISNDKnlP/T
 SZo8YUvIiuVLzBngqbz0LZ+kyfjBzZWJ514P1Q+9DHxJJ+wQzH7b+4XqYA7BexdMqp6S
 eKGQ==
X-Gm-Message-State: AOJu0YzB7cCgGfH5KIeduchHZaDGdnOzSKjvCCax0wPM9nFsP2vVWC6g
 1+QW9C+UwslVYF5bmiWMqt0=
X-Google-Smtp-Source: AGHT+IGqJCddhtqQ3on45c/KeSIusPEi1z8qJoVUzy5BtApUx75l6r8iKgX+6HNVY9FMuRS0MrcGLw==
X-Received: by 2002:a7b:cc8d:0:b0:3f4:d18f:b2fb with SMTP id
 p13-20020a7bcc8d000000b003f4d18fb2fbmr9080082wma.8.1692072507328; 
 Mon, 14 Aug 2023 21:08:27 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:806e:5eb8:ff79:bda:b103])
 by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm16375286wrj.33.2023.08.14.21.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 21:08:26 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: jirislaby@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org,
 kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ath5k: fix WARNING opportunity for swap.
Date: Tue, 15 Aug 2023 08:08:19 +0400
Message-Id: <20230815040819.649455-1-mahmoudmatook.mm@gmail.com>
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

while trying to fix the above warning, it reveals that ath5k_hw_get_median_noise_floor() 
had open-coded sort() functionality. Since ath5k_hw_get_median_noise_floor() only
executes once every 10 seconds, any extra overhead due to sort() calling
its "compare" and "swap" functions can be ignored, so replace the
existing logic with a call to sort().

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
Suggested-by: Jiri Slaby <jirislaby@kernel.org>
---
changes in v2:
- update the commit message explaining why open-coded sort()
  functionality is replaced with a call to sort().

- this part of updating the commit message is suggested by
   Jeff Johnson <quic_jjohnson@quicinc.com>

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
