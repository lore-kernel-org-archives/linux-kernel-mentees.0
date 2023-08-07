Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCFCC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 20:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D831D81E67;
	Mon,  7 Aug 2023 20:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D831D81E67
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CuPKy1nJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urH1vCyXpRrA; Mon,  7 Aug 2023 20:11:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CED3081E4A;
	Mon,  7 Aug 2023 20:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED3081E4A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98F68C0071;
	Mon,  7 Aug 2023 20:11:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEC7BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 20:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D4E681E52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 20:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D4E681E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ldbJld8G0S3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 20:11:34 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C478F81E4A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 20:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C478F81E4A
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe490c05c9so18932825e9.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691439092; x=1692043892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NIgW417nJ8bvxbhi642SzRPDY1ezzoM514sPszH49a4=;
 b=CuPKy1nJHxILhIX3BO+881Vpy4e85JkXhpbjPqnCKMsbU0INPblIFXRLvyfsda/BRP
 HrWs2ZhbTWu9xBJ3BiKLu1tx7v9d7B9p8+HAzZ9HOpMYOb5t1Y7Uo+3aeP499EnTUBHz
 cPKCRLIzbUSBM9zwh/BVJ1Go1yQUdisPyMVIYKQNV0edqmeuLB/kv56c0jmCMZrU9aWn
 s4Lnj66DMnzfu/bHfHlbfzL52nThIgx11BJH1OtEb2gic8lbi7OOO8CNvEWkLK5Yb+D2
 kkxr07uYzom0ikfG0wIQk1f+I0sV102u8ahMrXlAatsJKd+s6GXGfrjc1Os0a9lavJ6n
 x9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691439092; x=1692043892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NIgW417nJ8bvxbhi642SzRPDY1ezzoM514sPszH49a4=;
 b=Qlas/zdISEAmPWScKmbvSPbUjkRm/430wtrFlyZlgUlfuW1gkG79VUZvwaDkPMRuHy
 0+YOP6y7mXLk5WmU1rtBJvGQ9UC0lEOWH2QpFvrrtQNfqpui1xOZsQ4fqcHgZgRoYVTQ
 if0kuZXj+1ZGTRKSoMU92KSvACYvv/ka4L+dUr8nSHuYyVqFSgovg9hRn3rud0353YaY
 QrcgcJQyt2tlFH49fGSIOs/QK1wL5baLw+au7vMAts3FYsprhJgcIlDgiUxvCz5Lq1Rn
 Sl7g5ehE9JAlrM3OxnpO7gfdyojBVZtl4SMd58rjFKmrYIWFH7nSY88bX5AXnuWV1HLA
 mqSg==
X-Gm-Message-State: AOJu0YwOGPMtF9bTFj2DoTKeSdqAwYh5TMGEI9qzogjtpxo6yIDkwRzB
 dxOCN8WSbNyJR4pXctAyQXg=
X-Google-Smtp-Source: AGHT+IEfihewtMi1wwv4EExS6KMmD7EL5dbu05lTOoKn2ydQ+El3PbhdWggCr7EhI/1h8r+u3bpJrA==
X-Received: by 2002:adf:fcc4:0:b0:314:3369:df57 with SMTP id
 f4-20020adffcc4000000b003143369df57mr6034932wrs.5.1691439091633; 
 Mon, 07 Aug 2023 13:11:31 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:15aa:2e0a:61a:af68:b30])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a1c791a000000b003fe4548188bsm11572566wme.48.2023.08.07.13.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 13:11:31 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: jirislaby@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org,
 kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ath5k: fix WARNING opportunity for swap.
Date: Tue,  8 Aug 2023 00:10:57 +0400
Message-Id: <20230807201057.340371-1-mahmoudmatook.mm@gmail.com>
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
 drivers/net/wireless/ath/ath5k/phy.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
index 5797ef9c73d7..f87eb684f223 100644
--- a/drivers/net/wireless/ath/ath5k/phy.c
+++ b/drivers/net/wireless/ath/ath5k/phy.c
@@ -1562,16 +1562,13 @@ static s16
 ath5k_hw_get_median_noise_floor(struct ath5k_hw *ah)
 {
 	s16 sort[ATH5K_NF_CAL_HIST_MAX];
-	s16 tmp;
 	int i, j;
 
 	memcpy(sort, ah->ah_nfcal_hist.nfval, sizeof(sort));
 	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX - 1; i++) {
 		for (j = 1; j < ATH5K_NF_CAL_HIST_MAX - i; j++) {
 			if (sort[j] > sort[j - 1]) {
-				tmp = sort[j];
-				sort[j] = sort[j - 1];
-				sort[j - 1] = tmp;
+				swap(sort[j], sort[j - 1]);
 			}
 		}
 	}
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
