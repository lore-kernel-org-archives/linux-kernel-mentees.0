Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8533932C0
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Aug 2026 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179665; cv=none; b=YjpbWeVCggCcdz6htUaFLkWU6MSRj8+C/I9e6YS+28Elo37wgr4xrAneeKC2fr1N8PuLwhEAG7GVPS2LWH/PsHTyRKKf+NsEJzTy3om8qAJ8iGVp1XPz/IRlXNIAH+SBjxgg8z4HmJzew3A2zZFnzNvH4yTGSvvo/C1z8p5Fbe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179665; c=relaxed/simple;
	bh=Al+keQgNW/pNQNnVIlyN6dMkqxOCg3QqdJNuM9v8JS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3L6VSN1q8pKNH53SIW01u9/BPrfhWKzDL2d0dMUewGTmeGmOo3LLVrCvoM3p3/Dr0hWWiFPno4fCgKH9pcdTXebDfqpoRO0ajyLMwv+pY9AdXs6/K2Q2Ncc38Z/OwlokUHrNxUK4kPA8THUejt6ruP8mqq0L9R1IVDYxj4cxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3uWUuYS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3uWUuYS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so214192b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Aug 2026 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179664; x=1786784464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kF/b+Gd23S8p1kMd//04QDrp+FqRSM+cdSuEkId8c2c=;
        b=I3uWUuYSFrKNo61+Ymfvffhj++zQkIV3Skq0HG0uEmFkKHv6yXT8a54Pd8/amzBOdy
         s0rd0DFR0BubowK3ENwh8xuhNGjEkUkomIF3NMAplkoC/A6jPadwezbF5KztKJUnaJ5i
         nCvw5ZCIZ8M54kygIMaUEnhc1mrqAr4Rx2TuywE/px4b71Kqx0yUv7d6rL1CisYIP/6r
         CnsW+4IAJLxGjkjbxqFSU/dZj1bCpK54OeXGi/74x2yxxQShbAzQp6fDLhNODcYZdDp6
         GL497d3HkjrBoFCAWS5QPfxBVeh8zImjIGf5ZkhZGygZJfUijwl5S6cN+6DcFUDTiadA
         u0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179664; x=1786784464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kF/b+Gd23S8p1kMd//04QDrp+FqRSM+cdSuEkId8c2c=;
        b=qda5LmBQLozVQGqvis5EO3rXE5g+K0IvAaY+3yx4NtnFWNvPemBzlDkzQQV4PsxD/q
         /r/AGVSrJ+wsI1MQS9DrppCgAhZ/go6b0QXeaoO5cuVNTrZEDtZ9Gpie8mTpX9xyUT53
         KX5pm7cCulfzcjsti8ctAoYt5Jk+0OllH+ZCHKvf6hKr1Z/SZfs+kGtt1xSl2fGx6h4U
         YRf2DiW804OMSJMbrkQK4g/gA3JrR0f3aDNCEv03gHFePZzjDmlVt2WEjBzFuOuGulxd
         5AVmi5ihmsqyKOZI0TuPw/QD82sAkGuF9YAQy1GirU0AsWu7v3tyN6oxLf2iXGRAmwsj
         r/IA==
X-Gm-Message-State: AOJu0YwRmJVF/2l8LhxepYxmDDzjPqpYYM2WWxvlVvVVgcdgUI5BiGTI
	/ZCP5hLuNHd5B0D5KfpRSjLQKGV+WSJLG61M5OxcZzQ6/DhlRJqBXJ4H
X-Gm-Gg: AR+sD11nxDO6wGyVVqEoPTagKujKU55ngNapO+ppd4ocIRARnfuB/HQcqkhfnvHn5QC
	Q9r4Xs2GIPAI1HKEoQl7RMSir12eiRB4epe8RxkeDdb4J9pxkoeWBWWJUtwnoIqOdpe5DeI2eJR
	m07vWp/g5q916lOZr7V2vciSJ2hogD+8CxamP73bPJG3yQtrxcqUaeeGMLe4ZM18n4Y0ixle0k/
	SbSZAdEltMl6dgRipfllzo6+qOcRKR44+HKtBtXP/OEPJO0QtjCSUQDijYZRMOQZ6Oiaa2u18Qz
	BLZFgghb+tb3p1nwWEg8y2wmAUAvkujfC59J0Hau3mbzzNOFFyAyvmkpgaqpB479xeRr+ty1lKF
	lAVn3IbZuZrI2+U7gSCyP6xWcaLe2bEYj37JCbfcQsLept3IM3ve7SAF3lrIuCBDSBcB9yVgelh
	Vr1GMqMbRD+iubxFnAtTaQYQTxOWyqBQornp1HbbFPaKQRf7lKR+ORJJ/CTjwVqJ/hPqDdhSd2s
	DlhnknUn1TSQGzZvo22c/KHlpoyaVyi9uFwT0wN+RSlLhmxRTiiXADj4+Uhhg==
X-Received: by 2002:a05:6a00:399f:b0:848:42a7:1854 with SMTP id d2e1a72fcca58-84f4fee21bemr16602687b3a.39.1786179663846;
        Sat, 08 Aug 2026 02:01:03 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9f0sm1973871b3a.28.2026.08.08.02.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:01:03 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: lorenzo@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Adi Nata <adinata.softwareengineer@gmail.com>
Subject: [PATCH 2/5] iio: humidity: hts221: Add a blank line after variable declarations
Date: Sat,  8 Aug 2026 17:00:23 +0800
Message-ID: <20260808090026.34187-3-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
References: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve code readability per checkpatch warning

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/humidity/hts221_buffer.c b/drivers/iio/humidity/hts221_buffer.c
index 4d03db19063e..c868549d09c0 100644
--- a/drivers/iio/humidity/hts221_buffer.c
+++ b/drivers/iio/humidity/hts221_buffer.c
@@ -194,6 +194,7 @@ static irqreturn_t hts221_buffer_handler_thread(int irq, void *p)
 int hts221_allocate_buffers(struct iio_dev *iio_dev)
 {
 	struct hts221_hw *hw = iio_priv(iio_dev);
+
 	return devm_iio_triggered_buffer_setup(hw->dev, iio_dev,
 					NULL, hts221_buffer_handler_thread,
 					&hts221_buffer_ops);
-- 
2.47.3

