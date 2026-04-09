Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA73D3CEA
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Apr 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742700; cv=none; b=KBvhvSaPwS+eucndRsi7VHP0ArwS1n72u1nNMzyjuUq8BPIY2tB4Dxqgps8v261EPI4bg4q+eXgcAUwzvT0ff1y4XWPtn1FNvrZJpprWwn0JZXnfci4+jdJtBA+wKREx8Ja2RPvQ8nHpUaUGlCR1lpfn3OHqU+y8dvnCfdaPbJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742700; c=relaxed/simple;
	bh=b9XVrchuap9fqBpVQL3AJRB7as8Aiw+odeeQjTqQVaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sEZ5f+jlngFRFE8wR5QtRIKFOFC2yceYagYgOsSzMtbDWbpO2KOtxRdL0MxENcNMjuzCO2VHuQ5JRKKyMF0b/KjFYzvHRaPvR22Ed6Kr0cNJx7muOtVst9ZrT8A2z1eRowC5TCki+pjM6Z7p3EYUhBMCpwF94Qs/qK4VSNmoKI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByvkFC/L; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByvkFC/L"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b0afa0210bso4170245ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Apr 2026 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742698; x=1776347498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVEWLl/Od3ufIPmI59zrfVuf3ZvRBpYOxIc+qkV+R0o=;
        b=ByvkFC/LF8RPiqPPWhCol3+R8aZ6l9hzZ9b+BbSe8rUjj34ULoDJOSmr0W7ku7Z9cT
         ucjVhlwZZGDP19LxgSaeiYe03o1ojVCIprJGhWEz/t82aIWl4CfdYSxTKIabiqg+fh2Y
         XeUGypalCD14FDVqdn4wTtfscKvKEt1vx4XeIoVz9UjixteThBEbKm6y8ERLmXxbE6oC
         EcQBy5TOi2D4Yto1aU2gbat27MF3zWrYI+S+qKHpI2AiEzWpaMFFvQv1MKPiVlnBewbq
         cyX3h92SwfB4buAcFnMMJxJQgR8uR38d2bQPjZwGJ211K4dVj208XpFRAYS5yvKjLYE8
         sfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742698; x=1776347498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVEWLl/Od3ufIPmI59zrfVuf3ZvRBpYOxIc+qkV+R0o=;
        b=NAMqyhWuNUX2bPCTLM031SznEIqfdpa/wSyQaRrmVaxNhWF4BQSORoSVKs65OOpBJ3
         gmNkbIj7Rqo0fyQCUCjC6ZE2RAs7wFyeebAdwqHboIcRU3a7JdB3el34ShksQIp25igO
         0NBJYXnz2nQ75jWg8WJdLKdTwLwjlIEQiFFPCYtGS8wzH3JzeKM0J12PK75in6cRKFRD
         Z6JMYjRDJOcpqJ/cWmcR4dclVwA4Eh2gagPHWASRkJ+ALx69o4uNCq2p6hQfFtxPnp+o
         yYUIz8OzoBUh+svzTLH8opuUImIDAnaU5yfBNYwV6jbJoCexST5xyvLVPjYEUC8IW52j
         y/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP6VLrMedu//u+ojTwxIprzVnVjudBFH5NMfogfdUtPANmfnhVlfdWYmBakex8w/p6cu84LjAeBYnidkx7q1vvkf8jmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBorEzWH7BrIkLUJ+aBNExRyNIMRqxlLOCSUEcOoU+7E/HisTR
	G7Qrz/gSbxrhicl6BCBDVCGH0BRJ5a1QifDprEIjN3snSxislHPRqQ82
X-Gm-Gg: AeBDieuBIYPyTXGJAUaHbQR08DXRDIhY0fwa1O1pzpipWHkXhZqnUYARkfBoXoQZaDu
	0Xu1Fie7+YYWFpxnKONVdQ3Bjgm3cCO4g1kH2747mqradYTDfji82ty4UcRPoCS1d+FbggR1mpM
	whOdMcjva5yGwIGqPPOIpX+/ykPK/qeo5caw4HvAEORpnr0918bQoPXNVg/eeiSebf6i4UETadz
	0m6GQ2CPpt9wfVfCKK553/LdENAieqxCHLg2FWaTAQBL+eOj61rLj4u7vZoDlz8ysPaWbfWsET7
	LOZYGXTdDlMCCwhs0zbpzpNpuw4seIWWH6m0emrWIFbdtH7sGuGaN/JmXiKnYSHao9PvdvLgGDy
	oC5d5zlBtGhFQG4RiQFr/NZx7ffuNGeZlP4e24zPVSnxNB0X6tGQDZuzR11EKxXkIPm5h9J8l66
	ja4c3hAf1v9WTBO8gAywJhEO0fq4uWiFpvXp9z0jTL
X-Received: by 2002:a17:902:ccc7:b0:2ae:c5fc:b2ef with SMTP id d9443c01a7336-2b2818b3b4amr288059425ad.30.1775742698107;
        Thu, 09 Apr 2026 06:51:38 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:51:37 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 4/5] staging: rtl8723bs: use read_poll_timeout_atomic in _is_fw_read_cmd_down
Date: Thu,  9 Apr 2026 19:20:25 +0530
Message-Id: <20260409135026.137904-5-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
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
index 12416e499ac3..4bdc8e314015 100644
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

