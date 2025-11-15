Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F4B1B0439
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 06:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763187503; cv=none; b=il0eqUsE1jgwpi2/3kTJB/mlp8MAOJ1bAeT12eba12JIScIekgM6/5E0O7n/AI2sc1vsG2g7VOkoS3eef6GrIV/h2logz0+Zke1rR+p4zsaZCevayMKPoSuG51LWdx0DOttZUuXRvYqI1cyoXDy44ZTQcvvX+CogZFmpXJ1LRLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763187503; c=relaxed/simple;
	bh=NrEKsQoz0XxezEcop9klSosma97viVe+I9X0t+9NKwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUqqMW8G+j7ay+bzgDrd/H059XQ4A3IdzO9bo6pgeJ8Y/pmNkg3iwV5n/7PhsNkEu3q/PrpVkYV6g6gvUPjG1xDIdhbyqQ8xxJaxsto3vOQ+d7nkCD89GlmrcsLRdDfTd0Dl4mf2lopXZ17twnkovHEmHz2kDnZPxoUlh/EJt+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hklXXU7U; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hklXXU7U"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E6DA41208
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 06:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ioj2djI184lq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Nov 2025 06:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6551141207
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6551141207
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hklXXU7U
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6551141207
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 06:18:21 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so3113677b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 22:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763187501; x=1763792301; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nR414HzuTWuhyNuPBPVh6HF0ByypEaKaxDXsS4YHm+8=;
        b=hklXXU7U6xORY3Q/y/bMFWzBHl0nmsjmzXkvvninYZw6HurgguzeXqGMDWIb2l+bb+
         pIJOFfIsznzXx9glRgxvvig+cKVBzd1/kRyU9OPqv1Obn/ZI2qYO0hNM0eNciEQ+UQT1
         4dv8HajUbjXb2ijRYiwrvx0KJ7as/XwTXjGYLhr0xAy8KGOVBQ6pOgjILnCcZ8tlCJ+e
         8PM+zQirSuDwmzNZEvIrFHTN3Bd9Uvz65f31LosRhTI/TBZXMcl2rFDDhtBfAiOHTCB2
         fAtJkEalHhTGJ+VgJV+WimAf8GfTscWz2yO1I9iLWQJ7/O6IYMd36YHP8K0ym+j8pJEc
         u4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763187501; x=1763792301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR414HzuTWuhyNuPBPVh6HF0ByypEaKaxDXsS4YHm+8=;
        b=gEJK2rDEGSlPYjnRk8M5+qNRtvMYRpJBEXeYjWAgTtn/zzbWKLmHrzaSBfMMn3eC4r
         AxlaUBifMYOwmk1RxVl1bjRq2cgbv+MVRk0RXLa8TMW6eLfEWlAuzyhVzWsVJZ4Qc8Zs
         LyXb1MYPEZEgq4amGodNobgsjVFPlK/piakt9GlsGAmgVwV7XdiOPV1quoSX//IPY9uV
         9DTwGBTIKiJ16gceyjOrREoeK3IWYQ2FXeAS1awxmC/vgfFMsTFovefHL8fCBePcQ05d
         p1tAJ+j0Z4xDfMzb+x9TImOJbOan6iNYHy9c2Hqaa2i6ubUgbLOK2YNbPxXUV1JQwdUW
         yctQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqyruTALz85WGNjhm0XJc0nA5g9wnJVzl8rmATSFj5l2H9bAludEKMjPp896z9lYouzLr3/UqUkv1/dh15ojXd4HY1jQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyQMmRDQ4h0SAKNpd7lx5HhbRML+CLAJ9SKj8D6cGjl0V0k+WLd
	BPfX+/S0NMEs04NfzR2XUf4A6fJEc8DCUfIFMPBMumirXCEeYHq5V401
X-Gm-Gg: ASbGncvjZyke4gjk9rANnxMBm0OM3ANU/Qf+1LJ3YuT+7GQIihY+KEKONcqhq2gA6rl
	46BSoLAn5RANsgB70M5QZLfTYgofSTIqrYtpxeC1c2AT2TTnaghnKiZccR3HHV2mIx4JOkmOUjq
	Cym24FnxQ0BumT0rYoB6glpXnp26/2LeofCkyq1WFwVcCBD0IRZleYHlde2H0E2iSBnOlClsNTb
	kktqGpOteY8sCWzW86xZBveDsIARBX3BvaBIWp8gkGYnTdLxN6l253SuZ6ZoLol+qiIm5bFFKXr
	A5peFjGhTQMNFrA6IL6eCZQJrDbNaaSAvpcqYEmUsRu9T0fTPh1DTAMpAyjaSTuuzZk9qFb5IxU
	GzjFge7pGNIwMSJ1E8ewSj/FoLmup0d1vYGIG871ZB2w7fhaCiR/7HkYBPVYmQuZDwh/5rMEha5
	hUDicHtwzHdoFF+N57n987cPZCsy2N7PVioRiJh4PzazDOFR19iH3ydfupnxMl7Pak+n+SbV/iC
	RxOGGNnJrWZWkDsORT9soor6x0=
X-Google-Smtp-Source: AGHT+IH1LjD90VbAPuNapbdjB5ZQKWZ42pc4Ga7VXQDXnVR8Okq/prv5bQKCJu1zSNjuVb+IId1/ug==
X-Received: by 2002:a05:6a20:4315:b0:34e:e0ba:7ab with SMTP id adf61e73a8af0-35ba219576fmr7346436637.40.1763187500557;
        Fri, 14 Nov 2025 22:18:20 -0800 (PST)
Received: from prakrititz-UB.. ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d24b9sm6976265b3a.17.2025.11.14.22.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 22:18:20 -0800 (PST)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] staging: greybus: uart: check return values during probe
Date: Sat, 15 Nov 2025 11:46:47 +0530
Message-ID: <20251115061646.160847-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return values of send_control() and send_line_coding() during
device initialization in gb_uart_probe(). If these operations fail, the
device will be left in an inconsistent state, so propagate the error to
properly fail the probe.

Both functions call gb_operation_sync() which can fail with errors such
as -ENOMEM, -ENODEV, or -ETIMEDOUT. Ignoring these errors means the TTY
device would be registered despite incomplete initialization.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 10df5c37c83e..5cece0a6606f 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -879,14 +879,18 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	if (retval)
 		goto exit_put_port;
 
-	send_control(gb_tty, gb_tty->ctrlout);
+	retval = send_control(gb_tty, gb_tty->ctrlout);
+	if (retval)
+		goto exit_connection_disable;
 
 	/* initialize the uart to be 9600n81 */
 	gb_tty->line_coding.rate = cpu_to_le32(9600);
 	gb_tty->line_coding.format = GB_SERIAL_1_STOP_BITS;
 	gb_tty->line_coding.parity = GB_SERIAL_NO_PARITY;
 	gb_tty->line_coding.data_bits = 8;
-	send_line_coding(gb_tty);
+	retval = send_line_coding(gb_tty);
+	if (retval)
+		goto exit_connection_disable;
 
 	retval = gb_connection_enable(connection);
 	if (retval)
-- 
2.48.1

