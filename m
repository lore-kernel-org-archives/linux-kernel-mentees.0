Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0447535893
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745067259; cv=none; b=lBZoPAsXJYI3K46st2CXTxDVMSsFMWIq2b2HiiAv6sm4KN7Q41kxtBIRQrfWC0MSn0Ez9LsAMdtIKtslMY3xHSJpyqOidwKm9EGOCyWdcJ6BTSCWoneEPHAFiyZO2UImttG3O3MzvzzhuB1Xj3QXL7106O3ocWEnlpK0Y8KvnUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745067259; c=relaxed/simple;
	bh=09owqr+dWFhTVcQC9RS2HCR+GPzSZgd6dQgqjlLBPrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=egB8nt63F2kQGvQGMT+joH7LBfzCGQ3o9qTwcmZjDgmOTmWtRl8+U2dbHL0PSOVcHWsMeIZLTd0mWc8uGNVSd2yXDUc9DHTtJ6HwlUpad745UPpy4zD/Sg8iUSba+OUNsz9+EbY+dYIVLnGz7fW4NH2twyK0JoJEhDijOdHmpG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5m7XrY8; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5m7XrY8"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8ffa00555so22550506d6.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745067256; x=1745672056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZCVXeMvwtO+XgfUIIlEKPWYpKv+YaVwsaTpEWQ9aCQ=;
        b=Q5m7XrY80+0V1gO9forBjCpEEbpAbkJofNh8rTzJC0Rfl3F0qOF630rbcu3eJK2D0Y
         REjFkGoBge6QUJTRGKyANgaVESHkNsj76DpTpryoSoBWLT1XTIzWdgCmv3yWFRZd2FEa
         Bk99OsKa8KreocKL4fsKqlki+bDydLner4pQhWOa8F/PdALS9QLCw+CTNqlmkp65V330
         IWABhoaFsmhFgFWhTcw2FhYF6pWyCkR/AvxvlJFT9wYS0QWRvjaozqtLZf+Hbcm/I2rP
         ulgOpvHURzwNQeltoP8/NxtEjfYaXBPHevYUt2NwvBb9tn/oWOpB0LLDf+L/T4gWquD2
         wBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745067256; x=1745672056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZCVXeMvwtO+XgfUIIlEKPWYpKv+YaVwsaTpEWQ9aCQ=;
        b=eVLG0EgTRGF45bnUnDWDar7g0/NgD7Thj6c4POa6gzD7bc9Xg/o6ji2fVDYCOqjqTO
         3wUDxQepb2QrRRLZgPUdnoSgRPGxhLLL8+cJl5NYR/zzWSRsorxBgu07KagBya/l1GfC
         3ali6+NghlHqtJPz4XfRWV954jA/7BC+f/MrDAaxZWnh2l5bKYVfMw9ZtCZEL7ETDudR
         Tjokh/AiJsIjrZVZOJ8IQUyLFwWVUFil/NMwCF25llPWXusnzP+CCxqKyNMJOEkIjbTr
         X5OuSjJDbnr2LZ7A/VQxrjC30ayHsrUkqQo8lYjpbSWqgT57fPmHD+ws/UMitaL5SkVv
         +syA==
X-Forwarded-Encrypted: i=1; AJvYcCUJW9oXzoAELMqg0BA0fDnE4RFUmXWSR6Hu/pITJLz/x5e0IOlK+vwSVp8Sia/nHEJv1RdhQRdq+5qkoC0tbdDAGRZJPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMItgsoZl8Qg/A5wR5Ia71Vwx1HImApppjkqmGoDLnqqDMUnEV
	YR265kbDnA8JnCOt77Ag7WFRJ05NnZRTL+mCgQsE99TZzVMoKPqR
X-Gm-Gg: ASbGncucsdQF6q4KHH8PUK3BR4JzGFCN1IaYN6wMj18XpBcJFHiWG8k3urzHs47EfY2
	CYUtvXxm4cxk8nFN6448+JqobPgCg9q6qXO2cVhE93CcjB2sa1WOlX4BX5OJuMDMWPCjIBJpcXh
	GnUjsdU9KMGzc0vRtVdigylqUuuFfUFzmQSGp5kAtOkZDy/qxoZOkNOrI+pfu327kffxFw4yybp
	0T1oyErU8BCs/64HSKGNgd1coRrFWmCUsSTApnag/oGfHdj9G5mBGILtBZ5vKEYGa5XtPt1+MM5
	fE1kf4Aa2QeLZrP3csm5E3NPMj+PkI9xykUI5sdEwPc17nT/teNW8js=
X-Google-Smtp-Source: AGHT+IGw1aI7q5f08oFeWoBF3nOTUTLN1Pe5Qft5/kDututuRDrqfq1HMpqJ93njQaIEUiILACZDkA==
X-Received: by 2002:a05:6214:19ec:b0:6f2:aefb:948d with SMTP id 6a1803df08f44-6f2c45394efmr79362116d6.15.1745067256203;
        Sat, 19 Apr 2025 05:54:16 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c3b485sm21296421cf.27.2025.04.19.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 05:54:15 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: himanshujha199640@gmail.com,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] iio: adis16201: Correct accelerometer scale factor
Date: Sat, 19 Apr 2025 08:54:13 -0400
Message-ID: <20250419125413.679290-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The IIO_CHAN_INFO_SCALE previously reported for accelerometer channels
used 0.4624 mg/LSB. This value matches the datasheet specification for
the offset calibration registers (X/YACCL_OFFS_REG, pg 18).

However, the scale should reflect the sensor output data registers
(X/YACCL_OUT, pg 15, Tables 7 & 8), which use 0.4625 mg/LSB. This is
also consistent with the typical sensitivity in Table 1 (1 / 2.162 ≈
0.4625).

Fixes: 57f9386405a2 ("Staging: iio: accel: adis16201: Add comments about units in read_raw()")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/iio/accel/adis16201.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index 8601b9a8b8e75..982b33f6eccac 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -133,7 +133,7 @@ static int adis16201_read_raw(struct iio_dev *indio_dev,
 			 * 1 LSB represents 0.244 mg.
 			 */
 			*val = 0;
-			*val2 = IIO_G_TO_M_S_2(462400);
+			*val2 = IIO_G_TO_M_S_2(462500);
 			return IIO_VAL_INT_PLUS_NANO;
 		case IIO_INCLI:
 			*val = 0;
-- 
2.43.0

