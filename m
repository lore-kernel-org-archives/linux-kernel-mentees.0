Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924522259A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670383; cv=none; b=lo2eXTG72o5EpLzOyABJ2Dj/PIpR7ykZHnEGgZs9H42zZg5ZRpYEbdqBB/52/PqHfmlE9MHIdv9hj0Su/lII5s4jEPPiXiP1v8PjyOfvUFyloEY7apYabGTnl3qFl6s16sIWcTAU+IHaWSGA9yEgSZV+LpygfO3C8lPtrwCr3JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670383; c=relaxed/simple;
	bh=ji/FAgHI92OTK5f23io89QCG5WvGIIeBGOkDnmo9nuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWLnOD6MeoHpn2PcVM+VhSy/iUfLh25padyx8p1KBSQPPjaTIuy0BiPQRvlGze74UPcOFQQAXRppimNgD7zwLgILUgFa9LSfzz6QpW0YRbIQSoPYEAmzKa4PxlxtiiEpSSBwLUPFCaHeV7Z6mpymLn9+iR23LnluFqg06elFbkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPd1r2FA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPd1r2FA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3027129b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750670381; x=1751275181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4YJw5XPCMvS5//y1Mmde0UI3BPz61gnsXJcsAlcDn4=;
        b=DPd1r2FAfQLnfPl+7zGDI1qUIt3nnYnedMXr+WOVla28DNvbhdeE4IobTvaYeiNJ3G
         F15J39JW5v69WNqPfo5IhboaOLJvj9e5OJrAMnqUWkDcADEqpYdda16AwwpZaupTk2ie
         ucGvNohNE8ZTtydn7RDLsdLdQHKFUy+Cu4GAZIWCVVSQiBcdKwFkNuddzZYAke1dnbTc
         u1VRNTAfWoi6TxKxMpLCPSwNPEUSVH7JVLRIcSYJPirG2Dcrxy3tbaHEDIriVckmi7bX
         t55JarODbfAxbjxA9lF8pYmPIEoVhJL8PKDf6IrWxvsO9B5uiXlItrozyVa4zKSeD6tR
         FSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670381; x=1751275181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4YJw5XPCMvS5//y1Mmde0UI3BPz61gnsXJcsAlcDn4=;
        b=CaJuTAnVkxgjys4G2mzkzs36Zjn3xw3JkA+9EWqByODBkiUB+j/Hq3knv37OqeCy77
         vZjsFKMwjblYZrzYU0tlqLrLLmYDDYlai//TrNR6LdbaDhxDpbj+Wy/GxvdtX8vGA0jf
         YsH07mkQiXefc6eiZyuSPRCuIBXUfaOay0KTHyd+PUQEu7uNwpJ1yDkvKxNCucjmevcG
         FcC5sjZrAz31AgMyGyinJQQEet0yuw8S2HMCZv1mRwPialt2cwu23bWlVj6+lz4R2z/2
         mXpiICz7S01cXDUuP2/4hWe+M9PB8vMKHT+KX7bWkiW9fgZ+72/Xx/sr7w4vUONYWNIq
         UNKg==
X-Forwarded-Encrypted: i=1; AJvYcCUS+igWJFkKORw4N96892wJpW1oEdm+k/yy9ceiLHgN5HJ6b3lzB7UIUiPJ9WsqxR3+JS7R1QzbpljxK63JAoIIgnM81A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4iCb/QlZJvhVTIldYur/h4weFzOH/R2Asr+3Ykptg3bIHtD1K
	ieNlJCxkWas9jgwNhjP3/arc6nrtDKRjecuHQ9v9npYFycHhiubKOpVa
X-Gm-Gg: ASbGnctqRFkkSdC1bQOwTEyP3XwrrS4zVCcSlo/Sb0GzGwiczsrf+2Kci414gdq1/K5
	CKu9iBX2H572EKyq8LH6o6ZPaYLSdoW6nEmM0YGpQnQiSHaDoEIN+smNKCERQQRKornO3/qWLLj
	zb9VHwLrUmLMK1fxDq/+dmPFQA/3rVAFc3vpd9AeOsROgcO3Ql5cL4Xjd6MfW4tv2eCE2DwiCVN
	mvTT00AnGFoIbUlCtNPO5daZWRIjHhSadvfIKKiNcBayQNBr8UD0LFBUTZXBUurTlGVw5L8WYLm
	Uxq3IdcecUcLxwL1h/q0XNC2fnFkANCqYfPYF1krKFeMNgeE3RR+n4vziDa/M4g+5hly+eqIAz9
	BqLtdVK0=
X-Google-Smtp-Source: AGHT+IH9RLIYNgOIHeCndHNhloZ7mp+IiMwxQJdW8lE1NhoYyXy7rgsiZiOa8Fo2+Ilx9+DVNMOxdA==
X-Received: by 2002:a05:6a00:cd4:b0:742:ae7e:7da1 with SMTP id d2e1a72fcca58-7490f287c44mr14578637b3a.0.1750670380544;
        Mon, 23 Jun 2025 02:19:40 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:8091:47dd:9377:3ab1:4e4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6bd5bbsm7773093b3a.168.2025.06.23.02.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:19:40 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com
Cc: ming.li@zohomail.com,
	rrichter@amd.com,
	jeff.johnson@oss.qualcomm.com,
	peterz@infradead.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] cxl/port: automate cleanup with __free()
Date: Mon, 23 Jun 2025 14:49:29 +0530
Message-ID: <20250623091929.366357-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the scope based resource management (defined in linux/cleanup.h) to
automate the lifetime control of struct cxl_endpoint_decoder. This
eliminates the explicit kfree() call and makes the code more robust and
maintainable in presence of early returns.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/cxl/core/port.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
index eb46c6764d20..c35946882b20 100644
--- a/drivers/cxl/core/port.c
+++ b/drivers/cxl/core/port.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/idr.h>
 #include <linux/node.h>
+#include <linux/cleanup.h>
 #include <cxl/einj.h>
 #include <cxlmem.h>
 #include <cxlpci.h>
@@ -1888,14 +1889,14 @@ EXPORT_SYMBOL_NS_GPL(cxl_switch_decoder_alloc, "CXL");
  */
 struct cxl_endpoint_decoder *cxl_endpoint_decoder_alloc(struct cxl_port *port)
 {
-	struct cxl_endpoint_decoder *cxled;
 	struct cxl_decoder *cxld;
 	int rc;
 
 	if (!is_cxl_endpoint(port))
 		return ERR_PTR(-EINVAL);
 
-	cxled = kzalloc(sizeof(*cxled), GFP_KERNEL);
+	struct cxl_endpoint_decoder *cxled __free(kfree) =
+		kzalloc(sizeof(*cxled), GFP_KERNEL);
 	if (!cxled)
 		return ERR_PTR(-ENOMEM);
 
@@ -1904,7 +1905,6 @@ struct cxl_endpoint_decoder *cxl_endpoint_decoder_alloc(struct cxl_port *port)
 	cxld = &cxled->cxld;
 	rc = cxl_decoder_init(port, cxld);
 	if (rc)	 {
-		kfree(cxled);
 		return ERR_PTR(rc);
 	}
 
-- 
2.49.0

