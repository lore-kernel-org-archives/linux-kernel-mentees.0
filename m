Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8DB2CCC9
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 30 Jun 2025 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287826; cv=none; b=E9jmfnc2rU5qbkl9CunvD2B26IFHjuJ/dQHZAbIo7WjewXHK+GY5twWQpTJVv5hIKfk0CNhXquP91kD3mRzAe+sp4i/WOmg5tDM6PKHDeyQLanHQDRxGiTPwvI5njYrnRK4vTVoKg2B0x1xeLoiuiakxQIZjfT3USmqU8oR3HmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287826; c=relaxed/simple;
	bh=1ry30HSaPyoCH8NX44+sha/2zVgc5ksFO7x3qZhWPcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBNNNiAIueoNRjyuyY3rVeZCIHR/bgNepRCLQX67E/VYdfQ1k1KWHNNP4SLy5upXbjdDuU8xNEf45sUbQ5yG3DLw50+TF/N25BcCe1vhB6JvG4ggoflad/5m4M3jp3dQ2nYESD7sqIUIYquBGg2f/JPg+6F5JkLMnH6TwtbtAtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7BE8x1U; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7BE8x1U"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1455577b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 30 Jun 2025 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751287824; x=1751892624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvcxIOVCr74ZJ+9mueD9krtKcBT0TziWtKZrkUEvt1Y=;
        b=m7BE8x1Ur8pkRpYw1F3zD2H7R7cQhW6zgd57HxvcyLo80lV3kXYn9S3kkiateBRNk/
         cBwZdjT4w8NUPXlR4Mkt8VQvsfpy8FWH4NCmY0iDBiA3RU2RApEmbpbdtq66o/hKoOXy
         s38GPUuo0+RzKwju3ys1OZyzrEzjON/nshAOby8mSncF2w7zdIUCbyL4mGELKS3HLo/d
         hJZFxy9ehq31/Ybm1ybDFfVOyNgPX7z0SUio3fWNwWIx4Xw5vJ9aP/Syl7wV6ErNJtws
         snRKkzQPPr7CTfOj1FyAbd2OJ0xsjnaCEHKr7f2tIBDUHCHeqDWTSHfxQQGmQ51eld9l
         Bh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287824; x=1751892624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvcxIOVCr74ZJ+9mueD9krtKcBT0TziWtKZrkUEvt1Y=;
        b=LNYi5WD/8KyoCqW43Y/a2VnEHgpLEyq/o0II2Zkj0HvbVxNG2cJO7BN9jsjGBJV9YY
         q112Wkw0GecaCCiFE1qM7MekLNpDuzs4p13gKCqmlp4EFyXX3zazP/dH6JUCUk2WpZPK
         yjrzuIYUzOL4de2DafcH2nuW1+QFikLumhSg8OQX12IS7Jx3ovWeohhmbA6yxZPy9YSu
         tT0+Tw2h5pPbMEPvkJgV+sYo6dcSzIRKUZ0Y2efTeRASZXJgissoq86ZSrvZyE4fJbum
         qfQqNfi3EVNL+bR1swFwujBYe5Gcvf/2IQOW4Ys9rNhdBevp4I7O7Bs+c6elCXJDNZ1E
         4RFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5slCG9S8y2m4LBFIPEPzCk79dC+PbWzaqj1Mq/tkWM4/qzYl1sBCg0zc678QR4OeyfBbHFWJxnf9gRovaZFhKarmTqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ+oXQd8367mffHVwF0bBQYNQVkAPgf7Bwp5Wnhj/7Aqa8jWGg
	gaU7U/PXj6ul5aBhHidzbVuOI/WXwzlk/CENwSl1DL4HYU+nutxJWOxT
X-Gm-Gg: ASbGnctJ4SFACKV0ymvsJ/zKogRTshKTfRCYS+lIVn8gVA+IUxNRfeD9nlTQJoAGfBg
	q1bPkiMKQTFeigjj4R+LjezfZ3uzeJwL9Zn46GL/HjKnDLfayZg9fNIQHr0wQ6mw5+M2vYyuqMo
	bNZXllg2CM4HMvA6bdfzqEnMiqyWK8ejQpcobbNnQE73g9dRpwtG0xgNg0rosNeg+/M4+DCTsxw
	k3T39AFx27YhYz+OWfiXp6ubRSo74bVeS5bo40ZA1OYllwW9slQqL2IqMOCyo6agJPqwDviDezG
	JdOpo/q6s/ZUTTJgYTn7g95HBz4egfOvHCATRIBzzwwHaTaDCCZ4aFONuJrK3Nh0GQb7gKTaxD0
	bJCvpDbyVLcgoYi9BbrQ=
X-Google-Smtp-Source: AGHT+IG9/9nAYqg9z0wJH0s0jXNq02MM1YjkMaE9bQ8XVq7mhmuXd2OydcFIteqPxF2Nfyx+YFuRhw==
X-Received: by 2002:a05:6a21:1343:b0:21e:eb3a:dc04 with SMTP id adf61e73a8af0-220a12a4e11mr19163816637.3.1751287824076;
        Mon, 30 Jun 2025 05:50:24 -0700 (PDT)
Received: from seokw-960QHA.Davolink ([115.137.3.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56d0002sm9487890b3a.136.2025.06.30.05.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:50:23 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: hao.wu@intel.com,
	trix@redhat.com,
	mdf@kernel.org,
	yilun.xu@intel.com
Cc: linux-fpga@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ryan Chung <seokwoo.chung130@gmail.com>
Subject: [PATCH] fpga: dfl: Replace scnprintf() with sysfs_emit()
Date: Mon, 30 Jun 2025 21:50:18 +0900
Message-ID: <20250630125018.48417-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 drivers/fpga/dfl-afu-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/dfl-afu-main.c b/drivers/fpga/dfl-afu-main.c
index 3bf8e7338dbe..f2dd4667a43d 100644
--- a/drivers/fpga/dfl-afu-main.c
+++ b/drivers/fpga/dfl-afu-main.c
@@ -156,7 +156,7 @@ id_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct dfl_feature_dev_data *fdata = to_dfl_feature_dev_data(dev);
 	int id = port_get_id(fdata);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", id);
+	return sysfs_emit(buf, PAGE_SIZE, "%d\n", id);
 }
 static DEVICE_ATTR_RO(id);
 
@@ -475,7 +475,7 @@ afu_id_show(struct device *dev, struct device_attribute *attr, char *buf)
 	guidh = readq(base + GUID_H);
 	mutex_unlock(&fdata->lock);
 
-	return scnprintf(buf, PAGE_SIZE, "%016llx%016llx\n", guidh, guidl);
+	return sysfs_emit(buf, PAGE_SIZE, "%016llx%016llx\n", guidh, guidl);
 }
 static DEVICE_ATTR_RO(afu_id);
 
-- 
2.43.0

