Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0106928686
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 01:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785635073; cv=none; b=psFQebv8Gcg/BsxlkTbpVH1zePcJApZB1LxqnwQqmMHhGx1Zyttco9U8qvN6LqEsjolmCEF4RZvaztIKzkJwX/52PWyGkvW4InbwEq1Wh2l4RnyQsubKiKXta27wjxAQFyY5M52sn2O9u3giAkFnFEQa+YrDk7LjcO+2ctBFsds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785635073; c=relaxed/simple;
	bh=mHlmprP4/+isuQFq01dfKo3OTEQ8iFHihf/kdwIvxGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eCLxQAm89qQLIf9aAzO+48svi/jmMHSpIWIpj3DYDn+ygbgV8oO/kN7DvlELcoQXgP7kOJa7s9Fq+fntD3mmDFs6DYGXK/PymZpmtcvfbOP0ssYvfuXVJcVn6pCdIyn5FA+I7zhU4ECsivPELZYZ05PVp4hzNN3NHFBrK47wtdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GS7xaXz5; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GS7xaXz5"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2087140a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Aug 2026 18:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785635071; x=1786239871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPO1lD2amifsUr2YFmGY/nZKEN1sQ3UfJ2jRMstq/IQ=;
        b=GS7xaXz5pgzhg6MhEP/YlV9Rs/9L+DA3mzbqappgGxXF6QMkiLvG9zB07cqId8im8b
         Fi6ZWE85IDW20fj/947YTXiKwuy8QpyzJBZhmgJKZjXdiPKKa9y0MayLdty05r1M/P6y
         TwHH6e+/8RHrl2Ukx+qv3xL23cZAMhEzNX77eZr6Y3gnMaKEzFj2fbHSy+G7195Tqvm7
         iUiIzJ37EuiSTNGwlSLrDgyP7X1BOQizH2uPf5KrJtnL3AG7MZJx+MiZW0iZrNF1IpbS
         HNNZvpGyc3JADw2rXmbKGix7N2oJAOVg0vbnFnd3oG7bDgAJQ3rdNDkbDRLIlewU4CuH
         KCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785635071; x=1786239871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPO1lD2amifsUr2YFmGY/nZKEN1sQ3UfJ2jRMstq/IQ=;
        b=h619XO1/J9X/JhEn6GTj3Bmp0AorDls5JkZhhWqi17QMFi62dBjAvsxeLlXCWW3CW3
         SyqNVcwW2+Vbx2sfqKhC43hr/QrP5lGGJ5ZIp1culUoEThEbGqGnxdK9BJp6MF4mn3j4
         oCXHxGdyMee58ahS+6O8M3GToKR9eC1mCX22H6dxc9/nNYQl8sIkl5Xw40xPWux9tDxA
         DdxXrDP2J4ImWaazatCgpeIOQrt0ZFs/fAaB1mD0VmXQAR4MNZIdxWTmD4cueS9VJP0D
         zjWDwMElDDSXkPlpphSmnTLhdnOZfdzENK2kteLZy2PdSiwZslc4JdhWiKH9qT4r53mv
         8YGQ==
X-Gm-Message-State: AOJu0YwXkrGr+ZrVPCO5N6m14+SqjJ614LDpmz8EftEJHDyfJY2OJrxV
	E97jgLhGbBJLfHwkS/R0Jytwu1bIgBJTX4QXPjkB3Avs0WJxO4DNTziK
X-Gm-Gg: AR+sD12kwBFnlwdFjuD1gTp7A83ZkEpUDAeGapwvzKqRtb+5sP9Eo/d3EYJVARbKDhk
	ZJNZLS8ahF/PUzH26HPN1P3XIXEwTR4D4d7nE41MMtU9z2rrEJO1cCdk3L33R7s9LyOWRl5snGb
	qSD9OWY/3I5fgGcnKDstoRIN7gEu7kSOj0bzZdvLV/M8M2y/5fN0vf61p1hVV42SMTffqgdV3iN
	gyiDIpthCvBHsKRuDP2lh6yf9nTmqUad190THpOv5/mPRUsdiu8sfnDuL5dvNu1nOKe1dU4P+1I
	NLVstbwMEGH+hH20yQM24XMsn4o7VE759P4P4jqxKU8WK3QhuJejnjNieytp2pbdDULYgbFmEYk
	p7TfQ5L32jhIJmHXU6XZ1g4YFqmMKaBD2Y7MmpgmuMUhKxZMpMgObxM7JB/kt6wSGUIvPfcQHiG
	+2/nH2NxfL0UuxiggbMNRMf0QP9OOuqLzq0Y7/J4XGqlUd5gMyXSoNLoNV0VwJh9uKWDX2Bd08m
	bQlvhsS8sXO+BXnXmDpfodOUyUsmz/Qj8PFY0Ng0NgJrXq1R9eFc8cnozjulA==
X-Received: by 2002:a05:6a20:c786:b0:3c3:6af8:ab24 with SMTP id adf61e73a8af0-3c92a8f54b1mr5192950637.56.1785635071305;
        Sat, 01 Aug 2026 18:44:31 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddd7a33sm19692525eec.12.2026.08.01.18.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:44:30 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	adinata.softwareengineer@gmail.com,
	mazziesaccount@gmail.com,
	bhelgaas@google.com,
	o-takashi@sakamocchi.jp,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] iio: humidity: htc100c: Fix checkpatch warn unnecessary else
Date: Sun,  2 Aug 2026 09:44:15 +0800
Message-ID: <20260802014417.15485-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch warning:

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
+			return IIO_VAL_FRACTIONAL;
+		} else {

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hdc100x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/humidity/hdc100x.c b/drivers/iio/humidity/hdc100x.c
index bc452cc8fbcf..38903239fb9a 100644
--- a/drivers/iio/humidity/hdc100x.c
+++ b/drivers/iio/humidity/hdc100x.c
@@ -229,13 +229,11 @@ static int hdc100x_read_raw(struct iio_dev *indio_dev,
 		if (chan->type == IIO_TEMP) {
 			*val = 165000;
 			*val2 = 65536;
-			return IIO_VAL_FRACTIONAL;
 		} else {
 			*val = 100000;
 			*val2 = 65536;
-			return IIO_VAL_FRACTIONAL;
 		}
-		break;
+		return IIO_VAL_FRACTIONAL;
 	case IIO_CHAN_INFO_OFFSET:
 		*val = -15887;
 		*val2 = 515151;
-- 
2.47.3

