Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C9E1990CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Oct 2024 03:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729309463; cv=none; b=NHgy/0hbDD9t9m8dMc92BI2cRD7X249y9itznsLiU+ZCUDoKRGA1+JnReAelcHs7Q2cKgOcMAcbyuzTLgpZWO/N/y8vwAOuXcgPS4NRAPMRS1/C8IWwxoi9SdnLzqjgV5PnwIPWK0glcDpk/IUPW9vHlBLc+0wLJAlW1KziXS70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729309463; c=relaxed/simple;
	bh=9Hof6kLaX2KKH33qWdelzUil5kX+1EazXBDXIbgmp2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4XSHysX5ZhruqiGtlPV6Fess+BWHeenULv0f3Xe22FpwCuj7tQroQYtzpum+f2/ZhUE6GH7pYmaKYPMszSfe9fS4GXGSXY2gudF5yHqiok23TIK2OZxPcL6eQioFLhRQEkct/uLkw1J+3gP153tJyGW75c5aSswg09JZWFBhIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vmcw+t4J; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vmcw+t4J"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C9BD80D36
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Oct 2024 03:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TN5S2QOi0BL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Oct 2024 03:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 538BB80D34
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538BB80D34
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vmcw+t4J
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 538BB80D34
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Oct 2024 03:44:21 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so2317553a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Oct 2024 20:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729309460; x=1729914260; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eThC6hVzWsdHtEhWDhCbyZEHYHBJN4kvgmT/qDBPVlg=;
        b=Vmcw+t4JrVGTTPwW17neWhVWF0cC5ZOOJKVuexkrhXhVTg+saMNRQT592G4Zhma4Ul
         cBXAMmKLxXgoe2fIVIr4oWHB3cut9nLnB40fy2zON7PFXkkeu8OmOFDB9XqQrsUUVoxe
         Ulf3VN/2lB1Jes+Zq1/Ef2dd4tP3xxEeolyhqiUObgzzDuF8OzlA0o0bS480a8VZkCkv
         5GkGuqUSzGuaDILxp5j6lmtyNHR4sPdK/O29jzJ/JgSE1VdLUedTTwQw8sjDQKjlM/jS
         jclpczwyLWCvLR/ml+IaeFAYbNlx1Bj8GqeX0hth1V0QAEbWogg6bQlyojF4XucAFt+E
         FotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729309460; x=1729914260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eThC6hVzWsdHtEhWDhCbyZEHYHBJN4kvgmT/qDBPVlg=;
        b=mW3kQEQ5r8QSrYJvmTm7jR05+3LYNFLR4QiHgkjLf0q2TB7lSDL6bTLecuFjyBWu3z
         28iExfEHfxXZg2KHJ2QAq2DTjaRMCjauegRztiFTMtmqSgP0SBdf96WEESQdK5x/E/xn
         otPoYhETa/hymMpQY5m7YyY1GvvltynxlDLK3nlnHWafLNIwnJHIt4kzokEBwTQSmGiz
         ySvY8EKl45VFt/Nh1JkuUCFRr0lxqPyPGEa7QAwMg1PZL/nprplkHyyecNZoHsjLNvrS
         UEOCnrGSsAi/EBwUcW1Zw97Uc17O3nCdLS3ypffbr0O4UeY2cN6CJdGQmjOHJKqCmo3B
         RClw==
X-Gm-Message-State: AOJu0YyqLWuqsBcXodOXKU74cDqINLDS0Gkeskx//yORMKfnMoOEVChW
	LuqUhlBTEiX4SXNUFqEbc/hulPyA+GyxkliHckafgO6i47hVdrSJkU66eaDx
X-Google-Smtp-Source: AGHT+IF/LzVEcKUcuB9qout1Q2wSfEN0p0a89i0W245kI2zIQGsP0IC01PUWfoEDP2YOLzl2/i50yQ==
X-Received: by 2002:a17:90a:f581:b0:2e2:c6b9:fd4a with SMTP id 98e67ed59e1d1-2e561756ce7mr5211959a91.18.1729309460220;
        Fri, 18 Oct 2024 20:44:20 -0700 (PDT)
Received: from ernestox.hitronhub.home ([2407:4d00:3c04:81a0:204d:4917:a5b1:22a6])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e5611d5d0dsm2869145a91.23.2024.10.18.20.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 20:44:19 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: gyro: list adis16137 in Kconfig description
Date: Sat, 19 Oct 2024 11:42:05 +0800
Message-ID: <20241019034213.429464-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adis16136 driver also supports the adis16137 model, but it is not
mentioned in the Kconfig help. Add it to the description in Kconfig.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
 drivers/iio/gyro/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/gyro/Kconfig b/drivers/iio/gyro/Kconfig
index 97b86c4a53a6..3e193ee0fb61 100644
--- a/drivers/iio/gyro/Kconfig
+++ b/drivers/iio/gyro/Kconfig
@@ -27,7 +27,7 @@ config ADIS16136
 	select IIO_ADIS_LIB_BUFFER if IIO_BUFFER
 	help
 	  Say yes here to build support for the Analog Devices ADIS16133, ADIS16135,
-	  ADIS16136 gyroscope devices.
+	  ADIS16136, ADIS16137 gyroscope devices.
 
 config ADIS16260
 	tristate "Analog Devices ADIS16260 Digital Gyroscope Sensor SPI driver"
-- 
2.43.0

