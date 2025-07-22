Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6283528A1E6
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 03:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753155553; cv=none; b=YEg1fSzuCvNCHn4gyGAvmlS6x6VmBboigvqXQBRZzx+/Jn9hqQSwvayUjhZqk9i/F1g/6D7fT+UQNWDZz2bbNh6shdr9VhzEUxzlv2/NlmW+O8BgQ+PGJrrWH+2Rf3SOigEgRp6ASINMiPJCW8EPtlqVmegjurjyH1yGen5xiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753155553; c=relaxed/simple;
	bh=a8ZDCKvk1z9V4mWSqgga4htHIEnZXgftQcODAhyHbhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0HDHAhOV/G1J73NrmpWTI75YHkRqLe0NFQJ9YXej6WZloA6FWuBF+jP/j4U9ujwWkz249mD1IjkpI3DTckTjyjCsmFCaExm95yEs/mFpawQSlU70UWKh007S13jsqOjEy6LHqjID8eC3Ci6CLYhiEPsfqZLULwTch9lhyq/KK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDLTFnL2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDLTFnL2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235f9e87f78so46404985ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 20:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753155551; x=1753760351; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HxvgsGdyX3E0xq2IbH1R0rlYmLQG970WtCL2FPZRg4=;
        b=KDLTFnL2pJokyIlYr22L40n/VHPV6MTSYVE5HDU17YzlXVJDxRw6QfMRGHCubwKzRF
         2zAi4SseS1/XVUgibPYM9UMPnlwq0EaKH3FXWvJBZTGf6DvKxYNxBflW8MNSEoNBRhkv
         QfLCZkjNTLuaJg3IZHmydrbXII3scr7M45mr69+lswo76eTy2JEVCu7Y5G6uI3MEIPLf
         A0SEX/dQVXgSHmm3Fc46rBRpMiRkqffc6YNnYFSU+Kat1tuQKlPxX2RnzmJWiWRnnfAA
         br31kyFjIn32495nqbmYVKxKzHj0ekJrJC2JU6x9Wh/rPlL6/M/YUB5ou+k90N4eneh1
         afVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753155551; x=1753760351;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HxvgsGdyX3E0xq2IbH1R0rlYmLQG970WtCL2FPZRg4=;
        b=lwKYUp+0TRsGom16GhUBC9JacpD+3aBdNl1EqcY+0DDlQH1apjRGeYXSiZM4vxNz+G
         PsNuWJJ5mBTBkI1qyc+n+AUhRkg00iP6sCR3QOIlQf0z264aFenixb/8VOpvVahM2h66
         7llE9eydRb5PU2wETps9pu/2D1FRzdcUhn3B9IhzPDaNHhA/t7pSsbBlTt3Gl0PO7ofT
         LrAF6Vlie7uNigeKuhN71ZV/lT68jT6lGxUDk+eiiaGIEQ/efIb3zV+6VM2Fk9PUSjqw
         82j5fqjit/y1IflGc6ej24j+nYPPYARLXoTc9LB5yQfeUkETWolEH1l4Tq8f63pZDgiK
         PfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5i6YHLAVHSAOlRmoRFQyE7bUyI8nMyo0qI1SgVE8hPnRg66mJp1Uww/hCh362Y3VEACLaGkkfCZXGmT6cJfj30Jpkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YybI90axMPwe0syS8Zk3xXmcj6+goQ11TCnPhbWHenmhzPUjWv3
	Lmp7XsBJytM2n0oxaHQ3H/oucx2qoqI5irt2EQdYz5teDeSa4kiX2BP++nGKCg==
X-Gm-Gg: ASbGncsWlyeDCHpx86EeZD7n5/nc0Kh91IiSlvrl6cwfKDbIq+QJpylzMiMuCBiSgLn
	Bc+5Iqrs3NgcmneCxoRKAZJuMVrE5OL4Yrdh5BsFaofRka4kuPHgRn86VsxhQR0/11cjXXXlPCN
	dfAq+H97uI8se98vMuOmCht84dJta4OXv9Gk1ESAvnKsOL9Fl4JAQUUoAmGeyV4CXoK/EXiLWCn
	Oo0MHQQTW2+z3Z7AvL8spbBEhuoHTIkOW/+BX/5G1e0YxXgmpHJigGN2dqunFHMCsLl4A0hfZIA
	j/JpmaTLUtEKfiueTWs0KN3ig6DTChKGpxCn3kd5XBHted0oLgPNen84havDpxQy1PuKVyM/4/e
	RSDzg1vpL2ZXDOOcSAOyRZXsLLRy2TrA=
X-Google-Smtp-Source: AGHT+IELXenhGbrXs3GHqpCXNMZRZtfRAufEp0joWU/yATfc1Fkd0qA6Op2/PITBrKGg0UU01VXk1w==
X-Received: by 2002:a17:903:faf:b0:235:799:eca5 with SMTP id d9443c01a7336-23e2576e67cmr337988305ad.44.1753155551546;
        Mon, 21 Jul 2025 20:39:11 -0700 (PDT)
Received: from brak3rDesk ([115.96.77.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f309fsm65886665ad.223.2025.07.21.20.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:39:11 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:09:08 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drivers:zorro:zorro-sysfs.c Replace sprintf() with
 sysfs_emit()
Message-ID: <aH8H3D0WRrqqZYc4@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reply-To: 

replace sprintf() with sysfs_emit() in sysfs
*_show() functions in zorro-sysfs.c to follow the kernel's guidelines
from Documentation/filesystems/sysfs.rst.

This improves consistency, safety, and makes the code easier to
maintain and update in the future.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/zorro/zorro-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/zorro/zorro-sysfs.c b/drivers/zorro/zorro-sysfs.c
index 10aedcd21363..a552724b7fc7 100644
--- a/drivers/zorro/zorro-sysfs.c
+++ b/drivers/zorro/zorro-sysfs.c
@@ -29,7 +29,7 @@ static ssize_t name##_show(struct device *dev,				\
 	struct zorro_dev *z;						\
 									\
 	z = to_zorro_dev(dev);						\
-	return sprintf(buf, format_string, z->field);			\
+	return sysfs_emit(buf, format_string, z->field);			\
 }									\
 static DEVICE_ATTR_RO(name);
 
@@ -44,7 +44,7 @@ static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 	struct zorro_dev *z;
 
 	z = to_zorro_dev(dev);
-	return sprintf(buf, "0x%08x\n", be32_to_cpu(z->rom.er_SerialNumber));
+	return sysfs_emit(buf, "0x%08x\n", be32_to_cpu(z->rom.er_SerialNumber));
 }
 static DEVICE_ATTR_RO(serial);
 
@@ -53,7 +53,7 @@ static ssize_t resource_show(struct device *dev, struct device_attribute *attr,
 {
 	struct zorro_dev *z = to_zorro_dev(dev);
 
-	return sprintf(buf, "0x%08lx 0x%08lx 0x%08lx\n",
+	return sysfs_emit(buf, "0x%08lx 0x%08lx 0x%08lx\n",
 		       (unsigned long)zorro_resource_start(z),
 		       (unsigned long)zorro_resource_end(z),
 		       zorro_resource_flags(z));
@@ -65,7 +65,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 {
 	struct zorro_dev *z = to_zorro_dev(dev);
 
-	return sprintf(buf, ZORRO_DEVICE_MODALIAS_FMT "\n", z->id);
+	return sysfs_emit(buf, ZORRO_DEVICE_MODALIAS_FMT "\n", z->id);
 }
 static DEVICE_ATTR_RO(modalias);
 
-- 
2.43.0

