Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFFE6117
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpSYViZ0"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B15F9403E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B15F9403E2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bpSYViZ0
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJoiwcGJ2ijF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 06:42:01 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C7DAC40370
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7DAC40370
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6dbcc5d78eeso610106a34.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 22:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703313720; x=1703918520; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Opo0R05OB5wID6sQJu4dx2K7wLhXLYuO4epgLQz9yZE=;
        b=bpSYViZ0nx8+WJBYuPUjkLN6jUrMWyi+dF7DSO5tmzCUvsPSohd1vPf1U/jNv3wDKa
         iBJOqYUNcnmrJpyat/0KzGK9+AtbreTDpi+g2rqHY7CE67Xv5MRldQc6fYtxZX+pUaWT
         rHIu4X0Fb33W4SAEUHOwylub9fYwgbktKVs4byTAGgPFE8vpFYpQn9jwuvXwnTb8jBYq
         VACEgKyGP3FQUpB4wtIfiDUuCcIOOK8cAELFLVehk1feiGvYTxdmcHgOv+YHqb0XxLFC
         y3azXddbCyiWV0EuesTGQiJlHnHnbIBZcGtzzmInzNuehcFeCKjojDy3JwVBPlsvx0jB
         wB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703313720; x=1703918520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Opo0R05OB5wID6sQJu4dx2K7wLhXLYuO4epgLQz9yZE=;
        b=F5rwhxbBK2X9WFr/LXrwnj6q4rFJgB3G2kuC8+CVuMBtw4mCrpwqf5YCJPN+3gcHH3
         7eEYqptIqvFQ84cbHJk3Hr2SLYU2UIo010fcDDJ2BWfZSmYxR+yJwMBbYCUh/q3AxnZI
         Y84zKPj+DkzT9WUO3w3j7vrTPVPAKcwJn0/joUe3snmQ/ewc+DkKz68FESd0mzc0xTA0
         r8U/+u/jighd+2ohqx7ELy7GPcitY2urIJTw1W6tn+r44lYm65+7hSKZRSVok2cAlCL+
         S2o62rXTmdtm+7JRtwpv7Bkxr/bKDu42vbBmdmMsFqi9Lyh8O6bg3hbzvffy9oIDLe4X
         EEQA==
X-Gm-Message-State: AOJu0Yx4eVzBo/1zXqyhIfcBoJVyhL5CRdbQFS4WKGa17GibWzd3Rxtf
	4FDcNoL16FPepP/UC7otuqY=
X-Google-Smtp-Source: AGHT+IGbvtCMw5QMbF5aP6/UdVWZWEKE1p3xJRB03uLf1/uxV2A9/CYxiwT4/8kX/82sgTUfK53q/Q==
X-Received: by 2002:a05:6358:7e05:b0:172:fdd5:805 with SMTP id o5-20020a0563587e0500b00172fdd50805mr2924464rwm.27.1703313720528;
        Fri, 22 Dec 2023 22:42:00 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id a15-20020a17090ad80f00b0028c35076de0sm423230pjv.35.2023.12.22.22.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 22:42:00 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci: Fix spelling mistakes in sh_css_mipi.c
Date: Sat, 23 Dec 2023 12:26:52 +0545
Message-Id: <20231223064152.79712-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in sh_css_mipi.c as below:

'''
./sh_css_mipi.c:177: separatelly ==> separately
./sh_css_mipi.c:540: ofset ==> offset, of set
'''
This patch fixes these spelling mistakes by changing
"separatelly" to "separately" and "ofset" to "offset".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index b7c1e164ee24..6e11fd771938 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -174,7 +174,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	mem_words = ((embedded_data_size_words + 7) >> 3) +
 	mem_words_for_first_line +
 	(((height + 1) >> 1) - 1) * mem_words_per_odd_line +
-	/* ceil (height/2) - 1 (first line is calculated separatelly) */
+	/* ceil (height/2) - 1 (first line is calculated separately) */
 	(height      >> 1) * mem_words_per_even_line + /* floor(height/2) */
 	mem_words_for_EOF;
 
@@ -537,7 +537,7 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 
 	/* Hand-over the SP-internal mipi buffers */
 	for (i = 0; i < my_css.num_mipi_frames[port]; i++) {
-		/* Need to include the ofset for port. */
+		/* Need to include the offset for port. */
 		sh_css_update_host2sp_mipi_frame(port * NUM_MIPI_FRAMES_PER_STREAM + i,
 						 my_css.mipi_frames[port][i]);
 		sh_css_update_host2sp_mipi_metadata(port * NUM_MIPI_FRAMES_PER_STREAM + i,
-- 
2.39.2 (Apple Git-143)

