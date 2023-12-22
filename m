Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5EF2FC32
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 20:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhrtYyUu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC6DF61B13
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 20:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC6DF61B13
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QhrtYyUu
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyJ2CupMMiHR
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 22 Dec 2023 20:15:18 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 31B75615EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 20:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B75615EE
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d3eae5c1d7so15049125ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 12:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703276117; x=1703880917; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLrEctJKTdv+9DQYIiqT5d8pIz5ARZucJNkVZeQocxI=;
        b=QhrtYyUul3bW3EZboO8bhHPtKxfJpPvgm1gzKPXQl+jr1G28euD54AhQ9bzdDLXeg9
         ysDsu+IIKv9mIlvQCvFzhJtvuVEDZtTiXkrTd55D8XXGEbPQaY9oO5eF5UdjcRK891vi
         zxOAyBkpYrZBNQOkHBHkWpL8k7v+k3CGs6Js4prMEmJMwSu0jAidqAvMGEcrv2KdKrBm
         OJHbapPbNLZCNrLpiDZsEIhX+fBGXeSMDxuHvtNa0D7sGdxIsos7U7FKkmzTjooLtyPC
         zXFqJOz08PcMJOiuw+h5w5T45e0dX+m2lIe53/m3Ro0N7MB18zQNa45zPW/e+T6MIyii
         axUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703276117; x=1703880917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLrEctJKTdv+9DQYIiqT5d8pIz5ARZucJNkVZeQocxI=;
        b=iEBQBL7Nv2DgLEzYY9UmyoBLRc1Zx63D5gOIhgkarYD8tc5mrjcNtp1SDUHQB4xksC
         qRCDsnuWzfyaLSFyM0DSl93xdvPxSzb7ITkLgkQ/m2xcDzLxmkDIzBNABrGyfKGi8/U5
         Z1XENX10lXsM1ldL1rJSHvkeZQnWYuF5hd28TCsBkAsXsMDM94XCGsGbMU7f4QNXuk4I
         K/Tv3fM+F1AG7DVNmnadFc3xOo7moCS0gly3WwIEWeRSm7Y2qUEEvhK7ViC1fGqEsOMB
         COFzsqqcBgmUZI3jizS19aP7uNb+y5gp/NTSnaCYko6ghJEoM9nL3olMbZe4KASLGBpJ
         6Mjw==
X-Gm-Message-State: AOJu0YywgJ9WqPi0RmB4FFBUnq34OZcudOtGWgga3d/NGxNP37euGnoT
	Uv3O48qmYwAzUKvbKMYDB+U=
X-Google-Smtp-Source: AGHT+IEIokT7TBCD1z0pxoBMQ+BF23UOr1l/aVdCm8o0pnIaamekIXFExQ3ix1pzgG1NcmHoUDZFlw==
X-Received: by 2002:a17:902:7085:b0:1d4:8c4:5e07 with SMTP id z5-20020a170902708500b001d408c45e07mr1149471plk.23.1703276112357;
        Fri, 22 Dec 2023 12:15:12 -0800 (PST)
Received: from ubuntu.. ([202.166.220.102])
        by smtp.gmail.com with ESMTPSA id b16-20020a170903229000b001cc1dff5b86sm3792746plh.244.2023.12.22.12.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 12:15:12 -0800 (PST)
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
Subject: [PATCH] staging: media: atomisp: pci: Fix spelling mistake in isp2400_input_system_global.h
Date: Fri, 22 Dec 2023 20:15:03 +0000
Message-Id: <20231222201503.2337-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported a spelling error
in isp2400_input_system_global.h as below:

'''
WARNING: 'upto' may be misspelled - perhaps 'up to'?
//MIPI allows upto 4 channels.
              ^^^^
'''

This patch corrects a spelling error,
changing "upto" to "up to".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/isp2400_input_system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
index 61f23814e2fd..3ff61faf0621 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
@@ -19,7 +19,7 @@
 #define		N_CSI_PORTS (3)
 //AM: Use previous define for this.
 
-//MIPI allows upto 4 channels.
+//MIPI allows up to 4 channels.
 #define		N_CHANNELS  (4)
 // 12KB = 256bit x 384 words
 #define		IB_CAPACITY_IN_WORDS (384)
-- 
2.34.1

