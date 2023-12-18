Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEA24238C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvEe+ilp"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5794D419CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 15:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5794D419CF
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OvEe+ilp
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHJZ7B2rcKQd
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 18 Dec 2023 15:17:26 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AF449419BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 15:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF449419BD
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d3b547cd4cso4273415ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 07:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702912646; x=1703517446; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sSlpTRou09JsVwTLNvbg+U7lQZsRkp+48aYZvwXB/s=;
        b=OvEe+ilpFTsukYB9WKbZI0De/bwIY87mxuRuVlRMWv+HvQU4X/cBOMIyjp199uq9Oa
         qssQ09jrq+wU0kK8ty0V104PsHe3hY6xJ0faOHIAH+hHd2rm4lvfc0LiLQPTK8HwGG+H
         V0KxLKVGiBRWa0DWxaHj/TKJvNwqV97PoD5B48UZDFJ93yAAxM/CGXwlvnAcVsEi7j8+
         8GAdbHhSTMMr+SuGZQ7WB3t1HY/GeWXASFlamfWj0ruyS1OEswc3FVbEH48immfG91mM
         Wt09acbmiZm19JDg8wT33UCe1tOD7c6PeGcaxHYvcEHo6QT8Xv8LkgGG6LkKZsa67cQn
         UeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702912646; x=1703517446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sSlpTRou09JsVwTLNvbg+U7lQZsRkp+48aYZvwXB/s=;
        b=ZpUtlA2WRLlpE1sbIdQCwBhy1Jm6gRm/zVlb7t/2K7PDgEOPg9df59LCO6AzdwFg/I
         WBtMUiDCrnn5EcL44v3wsRa7JJIFH5fgKxtNEZzVwuE9q19idV+yE+3X2bE9toB8DGaB
         ASZ+LBTy/2DzDROy8mSYhM0hU4QFv/fLVYsvaazQ2fa1QZh0kEhwMuqbOyZ776S6DygK
         QqUlDt5HU+ECujFIKvNNzeanUhoE59RXKPXLK1iMe5m+k6vD6AmqBdGFHBe1j/EPFS3p
         kKkDnn52nPIVOL9IxTaNjf7RU+6xFZzQjYhhF0kOzVVGlnvA5pnZjvrsk6OziydFhq5x
         +Vvw==
X-Gm-Message-State: AOJu0Yzgz0BY0BqkDDncUQSk6EztXYbVTa4aBPl8JwYepyGeRtYb2VaK
	HRIQ/TPvhj+PpOL/DGiugCc=
X-Google-Smtp-Source: AGHT+IGe3IJac/lizAUEvlaMq23plr5Jr6d91eSJPJSnKbCGX35B0n+f/GzjuWPVTiDYXG5ZjltwNA==
X-Received: by 2002:a17:90a:c7c3:b0:28b:7ee0:4ef0 with SMTP id gf3-20020a17090ac7c300b0028b7ee04ef0mr667374pjb.39.1702912645812;
        Mon, 18 Dec 2023 07:17:25 -0800 (PST)
Received: from ubuntu.. ([202.166.220.102])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm10514190pjy.10.2023.12.18.07.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 07:17:25 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drivers: staging: media: atomisp: pci: Fixes spelling mistakes in ia_css_irq.h
Date: Mon, 18 Dec 2023 15:17:04 +0000
Message-Id: <20231218151704.449883-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported spelling errors
in ia_css_irq.h as below:

'''
WARNING: Possible repeated word: 'in'
        /** the input system in in error */

WARNING: Possible repeated word: 'in'
        /** the input formatter in in error */

WARNING: Possible repeated word: 'in'
        /** the dma in in error */
'''

This patch corrects spelling errors,
changing "in" to "is" in all three comments.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_irq.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_irq.h b/drivers/staging/media/atomisp/pci/ia_css_irq.h
index 26b1b3c8ba62..00e2fd1f9647 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_irq.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_irq.h
@@ -84,11 +84,11 @@ enum ia_css_irq_info {
 	IA_CSS_IRQ_INFO_ISP_BINARY_STATISTICS_READY   = BIT(17),
 	/** ISP binary statistics are ready */
 	IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR            = BIT(18),
-	/** the input system in in error */
+	/** the input system is in error */
 	IA_CSS_IRQ_INFO_IF_ERROR                      = BIT(19),
-	/** the input formatter in in error */
+	/** the input formatter is in error */
 	IA_CSS_IRQ_INFO_DMA_ERROR                     = BIT(20),
-	/** the dma in in error */
+	/** the dma is in error */
 	IA_CSS_IRQ_INFO_ISYS_EVENTS_READY             = BIT(21),
 	/** end-of-frame events are ready in the isys_event queue */
 };
-- 
2.34.1

