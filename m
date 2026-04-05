Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B39344D8C
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  5 Apr 2026 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389481; cv=none; b=A/QBZcb1KGDNGIydzFa6FyvBsv7avcZFPMBJX4NsZO16gKsIa+eV1mz8R/Ua7S8+PxPl+p4iKdQN3zXLvb/qv6jbHC37Ovp9K3sRMXv7A10dGNgTzCXx6t5ugkQkZPDx6y14Y+HHeVzIk9UVfNi/jA5WeiSMwkuyxFV1DSxWGsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389481; c=relaxed/simple;
	bh=QhFZfZE65gbnl9h8vQU90kaMUl0AlHiQu80nDsgeAKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKJmqACJtzonXnt/m7jPN4ecxbUkoIh8hiSevRZneYbdfuKLR80z+k3IOb5FNRIaOfeidvVqUCkAxquj4TDI7fdzZh2WrhsSQ4NppQ9F7hPRLUFPwOqv9xGQk3c5oRsuiXzpmTjmBdP8Z4ptzeqx7MyP1VAJ5jETCjmhpFTrbPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciBnxgdO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciBnxgdO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so2229889b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 05 Apr 2026 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389478; x=1775994278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O20kcq5bcuV9eQLusJE7YAYwYicT0IX29PK1z9JHR94=;
        b=ciBnxgdOJgn2pB4JUn2GwctvyzzlVeiuw5h/6yrbljGlMrdnPfBz5SCB24Dpd+t4Ky
         gz5k2bZqzWIlm/X97rEQQ4TMRBDKNLqBqELDX0oWZDBSPdPnXloepupFMYrO5726AuP0
         wTZcSlP3SaYyMIGiJX2b1Bf0CrgEBpJaYUTfscDY+r2eZFtnT+h8X+SvDFCajCAp9nnk
         vDS47qTWPjxokhWdkbEIrhKN1YMZ+8K9VhLI97hyPn3pTu9Z9Ntu38/RwKNxhko8R5Fx
         JjkMQ1uQfVRaBtTnjwYSkVFrmB1QGbBlQvbB1ybyBKeMg8MyHWcdPgMF9n0ij98HACyJ
         Goyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389478; x=1775994278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O20kcq5bcuV9eQLusJE7YAYwYicT0IX29PK1z9JHR94=;
        b=PsjVdQd5k3du3Dy6ju3PxAQE0lQOh8tEuHjEUUgA917iodpYpSxfmNrRzswYWu+XHR
         17nva6gXRFfHOVtkZX+NMaYyb4QB+BCQtiXGSxyf4sKfl5QTkowNnvNi/tBT8MeLGDLv
         rCak3X6pMVENpA7fu9L02UTNPoqqoTYLiI2lMWojsG27Eyd8v8hhntye0Td7a27o5tar
         2X8+DFaOy6b0u0qmd1wHB7/piiVWICZcpi9VRu5RgpOe0n81XduHy1XqImxZv+rPulGO
         6Z2nqpR5wruygUrnCtNhYfaEopMefpCyuNnIxqvW35fjK/rv8qIdulOrjQgOtq2w3H/Y
         gw9w==
X-Forwarded-Encrypted: i=1; AJvYcCVPh0VBysBaAU3djpLlsd21ztLo9hoHbhj0Jzr1Ycis7vSbsH1QrvVX7MJ21j1AU7Z42qz6BokCRvf1XjFrqkhg3tHq8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyofmrsPdE8tcIlwN1QefiBIT5I25qDVghs0jbXhSUAfRGK/bki
	brM+4XUm3neBZWEDUGxUvmRZw0gwIavvpfI8WZ5gDU5M536aLlIUt+55
X-Gm-Gg: AeBDietwLs+c5I+Qx/0RL1fWjKtAvQMw2EAdm12ztRAr5vZt9OAmT9X8sOI4vwOm4O3
	dRITACDkVuhbcXoFCSKxUMpq+DkZNMR7Zewf6zMJ/9MRcA6LYifILqjvI2r8++45WQ33mpZDUl7
	nXQfhiwY+DD78rEKOgjAOVhgcnmh1ltGmIv+7fagz+g7H2bo/DMOcLFtPXIruHkr9kNIFAYuAJI
	8gArGOprO85iAEmS+NE8cjDbTEJAYsKkbXL+EeDH4vMzQiHQsbN93GJVM53uiA8ISSVnoGV0zTD
	pPHuXouqaPrbIw0pq05ZgsNMTRMbw8ai0F1F9PP3gf96dkrzAH1HtfVjyaw9kq67Qxh1b5Gt1Ym
	wsJdyRSSHo7CKdER6AvOWf8NodRk7KVOwzVrkhv4OLS0WNvM73fIfxZvxGiAFr2aM9szj/W+s4t
	+Te793L9V7YW3VLsanRQj2dM2U+ewoLBT2up43sAI=
X-Received: by 2002:a05:6a00:e05:b0:82a:8030:f574 with SMTP id d2e1a72fcca58-82d0db40023mr8714468b3a.33.1775389478590;
        Sun, 05 Apr 2026 04:44:38 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:37 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 4/5] staging: rtl8723bs: use read_poll_timeout_atomic in _is_fw_read_cmd_down
Date: Sun,  5 Apr 2026 17:11:31 +0530
Message-Id: <20260405114132.310774-5-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the existing rtw_read8() and do-while loop mechanism with
read_poll_timeout_atomic() from <linux/iopoll.h>, in _is_fw_read_cmd_down()
which is a standard Linux macro, ensuring polling REG_HMETFR efficiently.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..17e135cd3e0e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -8,6 +8,7 @@
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
 #include <linux/etherdevice.h>
+#include <linux/iopoll.h>
 #include "hal_com_h2c.h"
 
 #define MAX_H2C_BOX_NUMS	4
@@ -18,20 +19,15 @@
 
 static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 {
-	u8 read_down = false;
-	int retry_cnts = 100;
-
 	u8 valid;
+	int ret;
 
-	do {
-		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (0 == valid) {
-			read_down = true;
-		}
-	} while ((!read_down) && (retry_cnts--));
-
-	return read_down;
+	ret = read_poll_timeout_atomic(rtw_read8,
+				       valid, !(valid & BIT(msgbox_num)),
+				       0, 500, false,
+				       padapter, REG_HMETFR);
 
+	return !ret;
 }
 
 
-- 
2.34.1

