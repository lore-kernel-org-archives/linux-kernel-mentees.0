Return-Path: <SRS0=2Cfq=IV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8172C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41CE56191F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41CE56191F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F399A404A8;
	Tue, 23 Mar 2021 11:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VC4QH3yq5tA6; Tue, 23 Mar 2021 11:35:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED96840498;
	Tue, 23 Mar 2021 11:34:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6820C000A;
	Tue, 23 Mar 2021 11:34:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7524EC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 11:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6106D606A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 11:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfkB_fx7WlJ4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 11:34:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C4C06069F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 11:34:57 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso12025176pji.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 04:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ElLOWUMualAIIWBPGGWJKeUgzwjaNX2HQui1EmZiBWc=;
 b=afnufsrSRgnVzKen0KAipeY2Gr5RB2YrUx3TRVnXnNLcuks/zuGRd8sJUVkJLRebIm
 9T9R9lfv2O/j0Lx1Eop4fg3WZwlp9vsYAHSHl3UjGDK3qJsXIg/ufdkQVYpGgfQW6ZBP
 v4zAUJUr22QHF7kZB0TRveNn6O3DvtfY+M/l8qwXoa5JsUp1ys7OXvBYthrMIk9DEu6i
 3sBAZXIPLXYcHkeAbWIL1QvpKClaFylFtfK3eX5a81cSXfVRbA2GQoyZUS4e6USJ4wFx
 xttZTf71IwhuMgQEu4ZxEO0bBI8i+3sxJQZuArTRbuWXBz4BiLSSWX/YcFcae1ilwHn7
 pZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ElLOWUMualAIIWBPGGWJKeUgzwjaNX2HQui1EmZiBWc=;
 b=mf+NEk+Soc20ghtuaK2ghzLK/ZmF/EozNvFWNYedDjQpV1g21H0J6v+c3iM8SUZa9f
 /fF5EVJ+QcgfOcQqwdfKEmLcOo5pEV2xtlg7z0J978czxJVN6KjkTKt9N2uGR8wZAz50
 sN7DeiRMzzc6IrhQPnMVnGUqxVoL0KVmUVGsId5Q8QAhxQg0nNb6TZrXxcwQejWBwtaN
 munJkFrQJ/xeqcthF40LB/f2LsFquCJEdmK7QeK1TXfsZGTGd7cWxdKA2G6pm34z9zUm
 EoSdw7P0fuxiSLf6GLPY/dDHuWrpxZj/xMkN89u7x1/J89oKRAwxTY+QgSjcYc758Hsp
 pjUQ==
X-Gm-Message-State: AOAM533puAJKzBTaJpS6YpjVwxM0ffdNYUQYRLKaFqNi4iJZFzy0qfrk
 MOPNOZSEySb9O83HfYAdQ0w=
X-Google-Smtp-Source: ABdhPJxrc64WnAAp3j44E1M3MpoM2k95vp5z1QbiTFPkZ+hE99kiQmRIJxH9dFqDMRVYDGafdJjHUQ==
X-Received: by 2002:a17:90a:bf0a:: with SMTP id
 c10mr3993377pjs.195.1616499296743; 
 Tue, 23 Mar 2021 04:34:56 -0700 (PDT)
Received: from localhost.localdomain ([122.174.244.83])
 by smtp.gmail.com with ESMTPSA id l22sm2750385pjl.14.2021.03.23.04.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:34:56 -0700 (PDT)
From: Atul Gopinathan <atulgopinathan@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 1/2] staging: rtl8192e: Fix incorrect source in memcpy()
Date: Tue, 23 Mar 2021 17:04:12 +0530
Message-Id: <20210323113413.29179-1-atulgopinathan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Atul Gopinathan <atulgopinathan@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The variable "info_element" is of the following type:

	struct rtllib_info_element *info_element

defined in drivers/staging/rtl8192e/rtllib.h:

	struct rtllib_info_element {
		u8 id;
		u8 len;
		u8 data[];
	} __packed;

The "len" field defines the size of the "data[]" array. The code is
supposed to check if "info_element->len" is greater than 4 and later
equal to 6. If this is satisfied then, the last two bytes (the 4th and
5th element of u8 "data[]" array) are copied into "network->CcxRmState".

Right now the code uses "memcpy()" with the source as "&info_element[4]"
which would copy in wrong and unintended information. The struct
"rtllib_info_element" has a size of 2 bytes for "id" and "len",
therefore indexing will be done in interval of 2 bytes. So,
"info_element[4]" would point to data which is beyond the memory
allocated for this pointer (that is, at x+8, while "info_element" has
been allocated only from x to x+7 (2 + 6 => 8 bytes)).

This patch rectifies this error by using "&info_element->data[4]" which
correctly copies the last two bytes of "data[]".

NOTE: The faulty line of code came from the following commit:

commit ecdfa44610fa ("Staging: add Realtek 8192 PCI wireless driver")

The above commit created the file `rtl8192e/ieee80211/ieee80211_rx.c`
which had the faulty line of code. This file has been deleted (or
possibly renamed) with the contents copied in to a new file
`rtl8192e/rtllib_rx.c` along with additional code in the commit
94a799425eee (tagged in Fixes).

Fixes: 94a799425eee ("[PATCH 1/8] rtl8192e: Import new version of driver from realtek")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 8415f26fd4c0..6e48b31a9afc 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1965,15 +1965,15 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 
 	if (info_element->len > 4 &&
 	    info_element->data[0] == 0x00 &&
 	    info_element->data[1] == 0x40 &&
 	    info_element->data[2] == 0x96 &&
 	    info_element->data[3] == 0x01) {
 		if (info_element->len == 6) {
-			memcpy(network->CcxRmState, &info_element[4], 2);
+			memcpy(network->CcxRmState, &info_element->data[4], 2);
 			if (network->CcxRmState[0] != 0)
 				network->bCcxRmEnable = true;
 			else
 				network->bCcxRmEnable = false;
 			network->MBssidMask = network->CcxRmState[1] & 0x07;
 			if (network->MBssidMask != 0) {
 				network->bMBssidValid = true;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
