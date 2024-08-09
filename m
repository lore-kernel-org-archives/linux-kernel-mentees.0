Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC1198E6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  9 Aug 2024 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723219059; cv=none; b=H6mA8wt/r+dEuR+dzIOPtOSsrYz1T1Jk+QNHYgcsvUzsrlWx2Z9wfyU0gx8OlUW790DM4TxcY9yJd1IeayIgputG8lfbnX+EU8Z0DjikZsNkmI6O2ZYlvSiG6oXTKqGWM3cXXU1nyUjc68rVsMnbmZOyvVHKtWTw/bcAofV0arA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723219059; c=relaxed/simple;
	bh=aupWW4PudjT0riYrRXYHfSbERNtSjKDoPxOKPQ4Jz3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JAHxl+qsVYR9LH9CZnRTnwPWEN7X641eoOhouppZCUixVjgmVuvErpHE6jvv1qH98O/nW5StrR9Jf0jneVE5MagWcTgXeZUz+f5u2tT22Ef4jY6Sm0FMlC/hxCAPAFDUEdZXPUorF9UH+1t+mV1DOlLTmDOG9h5ICGBfECuFNO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BE6fewfc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE6fewfc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E5CA413CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  9 Aug 2024 15:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipJH6dQn6pxB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Aug 2024 15:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88771413A1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88771413A1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BE6fewfc
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 88771413A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  9 Aug 2024 15:57:36 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-710ced3642dso1388427b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 09 Aug 2024 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723219055; x=1723823855; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQbheJKaZzimqi2nM1cZ0ksDOovJ28S86O+Xj2+eZ34=;
        b=BE6fewfckqE2JMERv/ip0bilNkqnJqn8UeRQaGAdw3qpGdyy3sE//VjdiUP6UVvGK6
         FXpMTdFj8dDZ/pNmm1AgAPDl0KDT/ZNI2j/bwZTPDJ026PUDDj0wsyQOVHHcM4GqoN2T
         DnZXFcA4eQFKJsc0eG1SH8YOEv+wflXcDf3jhv5Jn/HROEFNdJVVZ0J0BIoOL8nABiWU
         V51fjV8DwHrWO/BGTJncTjMHlXHH4ITNj7kH81S/Ih4zhntDG/DXxV6KICXtt7V0jpc3
         1Aok8/3GrSmcp+QI1wsJRje3QXdoBkNfSGrcPm8niSs/0CPEM/Im6/HpLNNyh3h31dCJ
         zs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723219055; x=1723823855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQbheJKaZzimqi2nM1cZ0ksDOovJ28S86O+Xj2+eZ34=;
        b=GcjtubDh51ht2akU7KG0SKNf+wIPw0deTQ1IEzzSb5qUtv2VH7EHQ6L/bUjVVVK268
         g9xrz5gcVztXYy9TiN7spgQQv/m+HAfIGyzLVTOrwH7kusAXmYcaDaGYX6WWrFkCTW8L
         vX3yKhRK1osfjdNl5R3RHM3A+QYR/0j9fg25i0nAP3qL1Wq/mivy8qYN4GiyVv/RO37/
         iuXIEB3h9ZnOd49aOH+5xRrLjCJJzuCC2g+vMSO/nEfdJGyRNjFVBDvDZ6VwMTOPwj8G
         UG2n+eaQyS6V/hjiqG5L/I3lt/6wd5GYqtAbBt4+qU2ETdHK2zWzgCTcLjEoJet7sLO/
         kn8A==
X-Forwarded-Encrypted: i=1; AJvYcCV4FOkcMWgnyk6N/IM8xfbmBvOKro/Dtfh1GF7L2vWn520J8k9uaOzWQwXNc7OoLSv99134pAgyLdH+36M+UU1ah7fKee4eMTLe1Rs4Ri/BoCeheWqrY7tO7EY2c6UQ
X-Gm-Message-State: AOJu0YwiqKiNeqgdVbh5MZSDzwHbJxteFsCoSH3fQQzNTvX3DwQfF/BE
	LFu74EESzqhtMnpwW2hA06rKA5ZVUXirlAn8DXTG5rkTC7Ak2KAp
X-Google-Smtp-Source: AGHT+IG8JAzFFhDJpXp5iBbOS/4CTp1mY7URlH5eSwuMsh8ncTmLK8FtAeFexWHo5ZBxFFWnFAvk0w==
X-Received: by 2002:a05:6a00:14c4:b0:70d:2b1b:a37f with SMTP id d2e1a72fcca58-710dcaec5cdmr2119906b3a.24.1723219055254;
        Fri, 09 Aug 2024 08:57:35 -0700 (PDT)
Received: from embed-PC.. ([110.225.178.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e7490sm2774842b3a.164.2024.08.09.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:57:34 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] rtc: m48t59: Remove division condition with direct comparison
Date: Fri,  9 Aug 2024 21:26:31 +0530
Message-Id: <20240809155631.548044-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'year / 100' with a direct comparison 'year >= 100'
in m48t59_rtc_set_time() function. Improve the code clarity
and eliminate division overhead.

Fix the following smatch warning:
drivers/rtc/rtc-m48t59.c:135 m48t59_rtc_set_time() warn:
replace divide condition 'year / 100' with 'year >= 100'

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/rtc/rtc-m48t59.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index f0f6b9b6daec..cd2ca49805d8 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -132,7 +132,7 @@ static int m48t59_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	M48T59_WRITE((bin2bcd(tm->tm_mon + 1) & 0x1F), M48T59_MONTH);
 	M48T59_WRITE(bin2bcd(year % 100), M48T59_YEAR);

-	if (pdata->type == M48T59RTC_TYPE_M48T59 && (year / 100))
+	if (pdata->type == M48T59RTC_TYPE_M48T59 && (year >= 100))
 		val = (M48T59_WDAY_CEB | M48T59_WDAY_CB);
 	val |= (bin2bcd(tm->tm_wday) & 0x07);
 	M48T59_WRITE(val, M48T59_WDAY);
--
2.34.1

