Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416D31A541
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760521318; cv=none; b=enwytgJACghcjaVCAxdTZOJbXslsQYakatJfItYulSIg+5ucu92cChg/GVF+Xah8AZMkd3uzS9nyEKXcb4jtP73jqrKOljXRgSG+3+H6t4GUvccLMyaYW2G1q20JvjxHbW3M5ifP1UhZfwpmYcKDz7YNZXeXKLNRlHhiBYxtHfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760521318; c=relaxed/simple;
	bh=x/duYL1yTsMhL0k8eWiAzZY9f7fqBH4VJapCdvJb+1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJwT3NSWzrGzp22H2yYkJkHFS5CSKm8cSvJQfZqmRIec5DaAH/eCZkpG7B02rDf5eK+oxCGZ+fnECv1TFgTQzgz0cCoUMS7e+hz3npxA32pfkjdBXcZW61O15+8K8F/m5lmfm8fi/mk+OwUJgO/5vFmySYrQIYfvIFfLxVUd6jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHDs3pJG; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHDs3pJG"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f343231fcso3991373b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760521316; x=1761126116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tG+tl0txZhrAHciW3MyttNmS0q+Bc+HLXAgKcHRdHoI=;
        b=bHDs3pJGCSgnpduACBvn4RAlFMhohX9MyjGqD77mVTz9NsL8bwn3JYashQfsmNvIj0
         yi18h1qP5XtjNbXeDRD5/S0kDCrdXL/pm5VA/1uASJgU8SU8eTvBo9rhfQwr+LshXX//
         4/Wh+5JmeJv7BSdEREVEok7FTe8z+Q4PGB6CxXq4bVlYfXXNqgZxZLFGHbwpW1JYuktd
         CJcLHu5dE8QbhB+hgMjlzfIN38k93OxRQW3YeiEyDPboqWywVKscFKsPT/SYNxKVS5KM
         +0nhYIkYgrvwL1IRBdvMg+Ep7CPrHTztoZsSCpjz+9n/0Moinozkmg4pi21TDO+Lf/MV
         r++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521316; x=1761126116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG+tl0txZhrAHciW3MyttNmS0q+Bc+HLXAgKcHRdHoI=;
        b=qh3f0PQvVPVV2dcU8F+5n92zJl1aKqcL86MNyohOjbI1q7xBcM8jxbdXhA++ZRkQmx
         2alQxkxFasqauO1KVB74rnAGqr9TFepb17fv8PLeLwN2kFZgPxfMv96bj5wQTkyG3JAP
         LBOa7bL0hkrQsWyFJSEy6gzqY3+snw8neA4CH6K4vTqzhH6CUjmBWAr1voBEY4ADmqjR
         OoW2fSPWL3F+u/tG4i09KuAbtA8zU9vSZjgKDmo6hDlNPiqgo1CwhzYWpw/O8onSCF7Y
         xsK3hasKo5POUf0RluMo8SdlfZR9lCft4qxDbaSnCaTIBK95Din5GKy9jodIisQKyTLv
         WKow==
X-Forwarded-Encrypted: i=1; AJvYcCWBEwD69X/bJrQtzgSt1BiIpArJ3LJN7dHK2gxLy/c0X4LAQVhUSi0vbDkvvDiHmCiZtwkeAsKMwQsHIY6X2lpKkCXocw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtqmDKNkLnOv5TOMwdSy9j6UhljLzW64XXJ8CUI2EhikmMvItV
	I/G7eOTYLSgOxwTSHAtkW8/L5nHj9iBHi7sr+BCl+U3XD3wGIlLH+SIm
X-Gm-Gg: ASbGncuF1v+reg1UxSHouE/iMZKFr9kCq2gyOdr1QYSnZp+qbpsIXwamACWtWso2JWy
	D60HWhtLurYHGhwAr51vt7rZVs+t+ylFVjwiqcedjN4kYAsojIpXULYBQuVLoc2KEJ2IjYfm+Y2
	hBcHrHB7jTzmdxYExuODrG3U2b+gYybwzBDFiO+9zRpS4nRvLgoc0KyqXS16ZQoiYRua5bPxkNw
	2zJgTSJfbFZ/+x/rhnQOiXq2a56an6h72/0MAi44xcV1wwtVXKiOTSD+QO9En/zS6Emev8p/IOo
	wWP8eCt9Q3Af+XVV8yXzyr6P7Rx3K3RvJGSrBGByAKqc+Xsk8BCIQxpAuD5hiESFB5fA9BlLRY9
	d/6qa1zznZZQgqKE8GlAcAJYRxZ2sFYAIfmMH6GrF5eaxGY3RyHWL54oO9IXBTc/9jA==
X-Google-Smtp-Source: AGHT+IEKoQxkgbtF8i/Kt9CagehiZKqlsvVyVFzeIw42nRsVCigEnL0pnAnyRizvdIX9+O7mFeJkZw==
X-Received: by 2002:a05:6a21:32a4:b0:2da:f4be:c8d9 with SMTP id adf61e73a8af0-32da83e2597mr36570791637.37.1760521315791;
        Wed, 15 Oct 2025 02:41:55 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df8ea31sm14374155a12.42.2025.10.15.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:41:55 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: dinguyen@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] firmware: stratix10-rsu: replace scnprintf() with sysfs_emit() in *_show() functions
Date: Wed, 15 Oct 2025 15:11:17 +0530
Message-ID: <20251015094117.535157-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace scnprintf() with sysfs_emit() in sysfs *_show() functions
in stratix10-rsu.c to follow the kernel's guidelines from
Documentation/filesystems/sysfs.rst.

This improves consistency, safety, and makes the code easier to
maintain and update in the future.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/firmware/stratix10-rsu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/stratix10-rsu.c b/drivers/firmware/stratix10-rsu.c
index 1ea39a0a76c7..53c896ceca9a 100644
--- a/drivers/firmware/stratix10-rsu.c
+++ b/drivers/firmware/stratix10-rsu.c
@@ -454,8 +454,7 @@ static ssize_t max_retry_show(struct device *dev,
 	if (!priv)
 		return -ENODEV;
 
-	return scnprintf(buf, sizeof(priv->max_retry),
-			 "0x%08x\n", priv->max_retry);
+	return sysfs_emit(buf, "0x%08x\n", priv->max_retry);
 }
 
 static ssize_t dcmf0_show(struct device *dev,
@@ -632,7 +631,7 @@ static ssize_t spt0_address_show(struct device *dev,
 	if (priv->spt0_address == INVALID_SPT_ADDRESS)
 		return -EIO;
 
-	return scnprintf(buf, PAGE_SIZE, "0x%08lx\n", priv->spt0_address);
+	return sysfs_emit(buf, "0x%08lx\n", priv->spt0_address);
 }
 
 static ssize_t spt1_address_show(struct device *dev,
@@ -646,7 +645,7 @@ static ssize_t spt1_address_show(struct device *dev,
 	if (priv->spt1_address == INVALID_SPT_ADDRESS)
 		return -EIO;
 
-	return scnprintf(buf, PAGE_SIZE, "0x%08lx\n", priv->spt1_address);
+	return sysfs_emit(buf, "0x%08lx\n", priv->spt1_address);
 }
 
 static DEVICE_ATTR_RO(current_image);
-- 
2.43.0

