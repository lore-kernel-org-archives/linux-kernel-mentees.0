Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDF32E7172
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443110; cv=none; b=hcfFgphZPvoAZa6AAoiSUYqvqiZl+wm6zisKsKI00IE7jWvkeviLs+6QrAON4Ja/LQxrD0Ep9ScxB0RIIB1EieWHhXxj/YEqcO6JbODo9sjkLyxX2n777OkaJIf/Xyy8eop8j2Db2hxbgH60k4PLQAfnE7XulCumqE0Ym7RZ/SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443110; c=relaxed/simple;
	bh=S5W+2wzhOf70gLHouOcf3i1hTYAKPJZKpUoJye4dZ1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PN8gKKteZ4jnyHdKPXZmj92agUX227TAVu8VX/ITnvH0ooEdnDPO6ODyAeovInBYaZke2U21rphksbY1gLSPuXXnlxBjA0dECPx9tiFcQhLczx8oSnW0H2YTR8c57Lttlhiu4tnxEEsQ9Zw/cHgrjAGWn+gTMqUsknFo9an6hfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTqEpgBO; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTqEpgBO"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so1578968a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 11:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750443108; x=1751047908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvtTJ1kHeCmxTLbmdO2cHISakb3o5Bb3qadp7bFl/tA=;
        b=UTqEpgBO6yy8RjhiO4oxCGd37ouGUD4wzsP0eFFNbhYcyFD39qJ1kXikLeFmH/w3Gv
         eGHnm7GIc9hpr3dIGkM5HoTM8Mo3w8ZzpK8pJunat/wAO3VSwgruVkA0MuvGVgJ+Nkxs
         ek4QJpYwsbn50oOS8BI9gbmQWRV5g+QbadDLBqF6RsjcEcVNfxkU9zCtZSoIDtqjvOnh
         z1zF3NTCeOkzYHnmL05EirLB94AQNPr2/pr7neLyytfcBzdTvv/ldllbNS81lxu5FBBN
         qAlR/pHUMP8Z5SzK2Nx8ayocnN+gVj7cILVnjgaAiKj9r81/fFmxEGa0GbNjMZ9uUsme
         2wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443108; x=1751047908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvtTJ1kHeCmxTLbmdO2cHISakb3o5Bb3qadp7bFl/tA=;
        b=gebRwISQPZIcOzQSFjowxrUSMKdkrwmQ46z2ogzY2Krkv1QGOEGVHRq+SvIRWwgNNV
         B/zrRU7LoarprChxLCx/dw9tZyQOlrM03XtnxIhEbRDh8WWuOST5rTcmVAhZ1hjTpsra
         D8fBxUvTEirpbsMw+fNiTAzbccI5a1C7K7Z4J6Tn1J5CG0qRS1YYoeh1yq+YRCMomLy2
         +IZtOQ7q9mD/PpapHsIEjTfpNnpAi5iOjOb+1+VTDZSxdvO930E7kHazTvWQEccWt4UV
         I0NahXdg7WZhbOTAH4o0clLDqHIXTFjULznaDw32ZeffrlFuzIs9PkvBc1gltZPtQCSo
         qzIw==
X-Forwarded-Encrypted: i=1; AJvYcCVpA8ozgC77Vb7/ULB1rUfcnnyuFbrg2sfecfydQA6IYLAKaXvVsDIUnV1LqnvT+wj2zdlke3rVAjWpiSfx5xA4NJnJmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YySMwgv3+8PnOfRFHAP0Ll0I4k7DWLiij6xo9EPPlnIHxGfZlKS
	tGM2PqQjfWWbWLH5P9LQ8GFVfKUvhl0teccEwr7p29bEuK9m3oSWS3Z2
X-Gm-Gg: ASbGncuzNrJC0Qc0KObRcVJhWE7+Rxc3SdE1onVwqUeTIJEAFrwigurZm/uPHwQ7uco
	5xurfNTl6gxy8VJqp5h9ii8+L/nhXq/vwnojqn8hvaQXbUcIqhg1F9A9n9jcEPRbSvj/n0rMqcP
	wIH062MRFBzyItSHoiVmaJGj26B7WzljIrqYnh9oxRIPXLmAXMRkdSJjoi9QkfmMQyqF5XaqwpO
	pbaIrdhbfy8JnA4GsB8PLOm9jjl+hfaLWZHfdg9uPyNLKWU0zRKjaIuiciuFafmQmwI+WPnIDTy
	rG5nTAHPBW7iikXE6lO8Jm6nrlOyuO/3V4wSPTmmqZmVjvNTocUX9r5UReZlnrE=
X-Google-Smtp-Source: AGHT+IEkKualNq3kDWX54ZvRRoM63Hsk4wstuNdFVMQrD/3uSyOxwAAD1THoibWhcQxW2+2hUuNthg==
X-Received: by 2002:a17:902:d2c6:b0:235:f45f:ed53 with SMTP id d9443c01a7336-237d99b8f35mr62267535ad.33.1750443108280;
        Fri, 20 Jun 2025 11:11:48 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:9fdb:eae:b35c:757c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d0bedsm23005985ad.67.2025.06.20.11.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:11:47 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: alexander.usyskin@intel.com
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH] mei: bus: replace sprintf/scnprintf with sysfs_emit in show functions
Date: Fri, 20 Jun 2025 11:11:44 -0700
Message-ID: <20250620181144.10750-1-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update all device attribute show callbacks in the MEI bus driver to use
sysfs_emit(), as recommended by Documentation/filesystems/sysfs.rst.

This improves consistency and aligns with current sysfs guidelines,
even though the existing use of sprintf/scnprintf is functionally safe.

Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 drivers/misc/mei/bus.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..bc124a15006e 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -1156,7 +1156,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *a,
 {
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%s", cldev->name);
+	return sysfs_emit(buf, "%s", cldev->name);
 }
 static DEVICE_ATTR_RO(name);
 
@@ -1166,7 +1166,7 @@ static ssize_t uuid_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	const uuid_le *uuid = mei_me_cl_uuid(cldev->me_cl);
 
-	return sprintf(buf, "%pUl", uuid);
+	return sysfs_emit(buf, "%pUl", uuid);
 }
 static DEVICE_ATTR_RO(uuid);
 
@@ -1176,7 +1176,7 @@ static ssize_t version_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	u8 version = mei_me_cl_ver(cldev->me_cl);
 
-	return sprintf(buf, "%02X", version);
+	return sysfs_emit(buf, "%02X", version);
 }
 static DEVICE_ATTR_RO(version);
 
@@ -1187,8 +1187,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
 	const uuid_le *uuid = mei_me_cl_uuid(cldev->me_cl);
 	u8 version = mei_me_cl_ver(cldev->me_cl);
 
-	return scnprintf(buf, PAGE_SIZE, "mei:%s:%pUl:%02X:",
-			 cldev->name, uuid, version);
+	return sysfs_emit(buf, "mei:%s:%pUl:%02X:", cldev->name, uuid, version);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -1198,7 +1197,7 @@ static ssize_t max_conn_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	u8 maxconn = mei_me_cl_max_conn(cldev->me_cl);
 
-	return sprintf(buf, "%d", maxconn);
+	return sysfs_emit(buf, "%d", maxconn);
 }
 static DEVICE_ATTR_RO(max_conn);
 
@@ -1208,7 +1207,7 @@ static ssize_t fixed_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	u8 fixed = mei_me_cl_fixed(cldev->me_cl);
 
-	return sprintf(buf, "%d", fixed);
+	return sysfs_emit(buf, "%d", fixed);
 }
 static DEVICE_ATTR_RO(fixed);
 
@@ -1218,7 +1217,7 @@ static ssize_t vtag_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	bool vt = mei_me_cl_vt(cldev->me_cl);
 
-	return sprintf(buf, "%d", vt);
+	return sysfs_emit(buf, "%d", vt);
 }
 static DEVICE_ATTR_RO(vtag);
 
@@ -1228,7 +1227,7 @@ static ssize_t max_len_show(struct device *dev, struct device_attribute *a,
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	u32 maxlen = mei_me_cl_max_len(cldev->me_cl);
 
-	return sprintf(buf, "%u", maxlen);
+	return sysfs_emit(buf, "%u", maxlen);
 }
 static DEVICE_ATTR_RO(max_len);
 
-- 
2.43.0

