Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8930E0F8
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 27 May 2026 01:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779846079; cv=none; b=kwhnD2vacNIPbednkvDpg3WTysh/uRUbGmnLZCcv4lAlX/IkCLGNaVfRwL95Pqyp1yWfrL1u7KW/sBacFx7odfKsDmcYdX12CojnGDElgkKCX3AwmHwANAyMUbOdAwY2N+bo8mNomcx8P1B7OYNLNdogoKXQvpIUvPA/ypmC4tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779846079; c=relaxed/simple;
	bh=6CTNQnXIw7kksEaIR9OM04M+MlXeuEuffyRk9pjl+7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/qMSa8z8USY/CUeZI+6GPTsYcP0iqMZJDoYc3Ec1vtYwP6AEUnIciTAiGGSmsDGaQPfUafPNTAVCa5X4CWGR2XOKmly1eW1udozP+QG4c5vUMz6waXE7FaorM53JxqjIv3Tbl1topDs/OTXz+HJV7kaXRzvojlhegsdzAE5T9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFQiiHh9; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFQiiHh9"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-961556c15ceso2304554241.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 May 2026 18:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779846077; x=1780450877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MPAh5QH40jCf+sMWnChY1UnCVNKQYwFuDgmckLLgiU=;
        b=kFQiiHh9jpClFRHkJZKiRSAlNBPTeMDOSND2yn2h1wlsuj5JGtTjqx0n6NyCHo2qBm
         BsVuJuVEyA5KRw5kK3/kYKIwEOZsiRFZmKanrVO0xq/bteG7iR9Wqj8C9jtA6UKwddvb
         yEdUyqh+H0CkNA9dQALdJ/khbr+gxv+qC8HMJXQyDjH4Nfwd9EPshoC1D5pJkgyv/bpJ
         9rSiVsvPl7TYuASo+0gE+z91Sw5NwKBnpHp+PyfSZCsx9ZJsoInrlMrgCW5sXk2YUsQU
         9sXj4cREU01vF1RglxhQsHT/k/JxY5jPrB5iMjdO0uXLetHvpE04Zaweh9Y9EpSTvews
         XRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846077; x=1780450877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6MPAh5QH40jCf+sMWnChY1UnCVNKQYwFuDgmckLLgiU=;
        b=smqtx6/fxtF27xJQleGqGcIsvLm/g7jRs1kTxUSOIXpThwspZZV8PMWyRkY2+4AB9A
         L5iR6vS6x4n213QW10wwsapzOh4pNuok742mL6MhndN64cHQWSNckan/Ms65DBcGdqGe
         GOcQdW0XxmE+rMpcTClpzUCVcszvZ759pCYWTvJyqOM0WOcUI+NV6HgtTsLC9ZVcPYm8
         4ligezNsqz51jutdUpCLgcKFcHVSIg8P/FQA+JkVGo4bN1vQ2gU/is2kyKlJRCksepEK
         Scriaa3X/DwpiC1gTUVo/VVF2P6EEQz9nAbmnbU1QftY3+T4Yp5jEueN6CppNc+N9s/q
         dIlg==
X-Forwarded-Encrypted: i=1; AFNElJ9y3jol9kXbFI/WSxHW8dWPAV8FRT8HCS+9A91c8tsYJRoZZ3kFGC174Z4JAEkI/R2Bgdo2sO2veTDtnJKOCkFO+QIvkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzISGGO8jF5nfrYGXmWiQTaBJZCZhTj6rLHXUfHa/6Z/ss7TCNc
	FNWH85Mg7IOIo0zkNB/r33SLRsIdPPb2FncmpUr631GLdaB++YIcBehh
X-Gm-Gg: Acq92OGgnS31USv81JWIzBEmXPPq+TzSDYf5lL2XgmOaiFtJzs0Q+Hn1piTtjg24iaI
	4MLW9ly7TixdNMbSxV666dWFagT3IHF8kq4T9cGPkaqX62ua5yspuoqLktFI9N9YFHyDTzTSGPK
	dodlX2njXtbX7c3ee6uhB71Fa3ZaIYpbxtLFfmitfuXGPohVORJEm3ENHOXZBFMwhkgZpv/WGlq
	PpzJ7Y32IIBopFQmr7gSTJl4L9XaMwMxnvew0klk0le5xMm99Rp24XJHAs/i9Xfj/FSoPRLQK6z
	BgZD6EyvCbc+YZikUIgan+H61TrGWXHYzmpfm/dVEdCkpaea9IjD0qDCdWGHJ+NiyLEWbCSlBMB
	v14W/Ekga7M1Og8NUBhNsYiRmIqm/uMNaUZeM8RDOvSOD/38CEu3v+sf7FPd2auEbw2Q3TPNAQM
	zph0IXu6rL0TnQYFSE0c2XEywS2nUfxg7lNwUlxb6Q1Ksje7+6mCeNm8OhJEalJvtzKaVbpecpc
	pCYXw5Uq1ofZQ==
X-Received: by 2002:a05:6122:8d3:b0:575:24b5:88e7 with SMTP id 71dfb90a1353d-586628bc866mr10919647e0c.11.1779846077090;
        Tue, 26 May 2026 18:41:17 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:730:757b:d7ca:355])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f2f791d1sm18491348e0c.5.2026.05.26.18.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 18:41:16 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] iio: adc: spear_adc: align headers with IWYU principle
Date: Tue, 26 May 2026 22:36:40 -0300
Message-ID: <20260527014058.35265-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260527014058.35265-1-rodrigo.gobbi.7@gmail.com>
References: <20260527014058.35265-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused includes and add what is being used:

#include <linux/array_size.h> // for ARRAY_SIZE
#include <linux/bits.h>  // for GENMASKxx
#include <linux/dev_printk.h> // for dev_err_probe, dev_info
#include <linux/math.h>  // for DIV_ROUND_UP
#include <linux/mutex.h> // for struct mutex
#include <linux/types.h> // for uXX definitions
#include <linux/iio/types.h> // for IIO_CHAN_INFO_*

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/iio/adc/spear_adc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/spear_adc.c b/drivers/iio/adc/spear_adc.c
index efde6afc54fd..4be722406bb5 100644
--- a/drivers/iio/adc/spear_adc.c
+++ b/drivers/iio/adc/spear_adc.c
@@ -5,22 +5,25 @@
  * Copyright 2012 Stefan Roese <sr@denx.de>
  */
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
-#include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
-#include <linux/slab.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
-#include <linux/iio/sysfs.h>
+#include <linux/iio/types.h>
 
 /* SPEAR registers definitions */
 #define SPEAR600_ADC_SCAN_RATE_LO(x)	((x) & 0xFFFF)
-- 
2.48.1

