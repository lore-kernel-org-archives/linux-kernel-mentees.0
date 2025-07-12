Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC072DDD3
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752326095; cv=none; b=Rdnhy+SvXWPARPzrrp5SKhqW1sIvmRbueVzkdhY55oh7tD3+d/WDwq3ECrfjOt0xyw06CEmRz16SlSlDNEqqCHs4gSqwF4SU+bBilikNzkdKJ6gZ2WQFjHuQdfsvtE5hzdE61g6AcSHTw2v2IoVKlPJwd23Kkvceizxn132t/lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752326095; c=relaxed/simple;
	bh=5dN2ZHRvnjmzaC8O0OTUDOBXpyAGk7HmJNNUYPuo3ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=buhpZCf1mKW1J6QY5eGRDpqvoagdYVpzM0RBx+cguLVfEplsxqsp/sfAxI1dvK1B3sqrCiE9AZX9GRGDrquIq2Vq5jywgn8avRse7hRbQcxmwV8UC/hDjHf5QTn4rsTGj2a0Nh/pjhE1MKf4sUO9sNT8PxgDY3VV1kgAz6dVZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f16vSKO+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f16vSKO+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1761117f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752326092; x=1752930892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pGUt1yxOvswvTrka10m3yGzs1DAJHeoa3k02CExK/Ss=;
        b=f16vSKO+pApJrucJnhhaqCIOoLkBmMGOfT4EAS4VOnQKNW3hGIU/ZLZ5egk11VhdVO
         AXvZ8vEV24+Isijede+FuOlxEJrVuWuBHozBO05StPXqG/gFjIojNaIEjANqXI99s5nH
         cdijLtnXkBYR7mQnrch+GYWu7DH9cOEn/LqGkM2Oa0bdcqRCaTdDV/+FQXdvZ60dzlKV
         LyewWihMBPUA/RhRe8f3lvagGs2Y8j4ybZUwLsv4FDkpzGa0d+pRvMwb0zYxSZlT8XBv
         kMJrZ/hz3ncjmPIIN6UXXCBsAOb6a0NjMpaDe0Zn5nSFr4SAhfryf4d4mQyDT6aFls8G
         XBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752326092; x=1752930892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGUt1yxOvswvTrka10m3yGzs1DAJHeoa3k02CExK/Ss=;
        b=twd5ZKM+PGBriOA4D/s3YqVyWaq29M4glWrZ4GrUP962QrRcjyYo/aaGJ9bf9jhBWG
         gDTaY8b6fqcwymAGwqBahO5ejakm3z5/UrXpzVwyPZkTbAlY1rrhh1f30A6elw2eH8Zv
         8Pvm0feJfpcLWldhoQmqBTK/QUsybelDhaEXIIiYqKR6e7sezRgUpKIOdxo5L+UhxEXy
         whhtiDK42cN0SmrsZZy8pASNTf6ajRotieOEKaV16fpZBTyKPNo7Uq7sOEugkRQBhyM7
         7KI25PsU7ivfcHl4tCkM8M6NvZGBonV2yxhcqSpH8c4n3cOEegyuauTmGHXGGmIVr2GC
         +EMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLTZmTKARv3Or1xPz+PPrgq63QNZjEVuBSHQKsFtGWOpIPjKIj64Fqjxa4WDJNtIzQRcvdtXykc+CgqBM6054dA6XMqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaE+r61gF45uXDpuAyqrFEZNRUN9Cluf+fAXM6nUXID9xFB0u/
	PZE4xDMa3+jsNritr4hrSVi5iJdRVMG2gRGNIjgiCg04da4TaIQtrdZL
X-Gm-Gg: ASbGnctUq8qhs16Y5SK/ukIYedwJYnkJzvtmd/YCUk1+mfK2W36npcBTBsLAx4oghPF
	T+jh1/bcmpw3BIe0F0YKm9wER25mrFQ86JKkczF1Qjnmm66aoE903uI30kXQqceEBJJRueG49VJ
	TtQu6lm/TkNRBamczeCaaVCfP35nu9kzG529UDSe/qKXLJe1w5fF8IEZcPmLXiVY+kW/0nVg+TS
	MFn/bhVV2gT3LW3HRc035ngFW2gtlH3i0CVsm2BKKMh5AkoyNuolLB7GRivUqBWDfxf+M+n7Lda
	aRwbLmC9/aVvvdfC9toPeAweJ9zobYA7N711k2oBjajVS8N9+H8sQ27omFJy8Pmy+FSEZdTPO7R
	bGx8l8bRO37kWbrCAeMx8FI+rmkMBEILROlmLVm9K79yJWSY=
X-Google-Smtp-Source: AGHT+IFbc+H8l0qLJKrpFMeU5tqbo7r11l4LglNvrFKAb/BVWebwk1DuSjbYwLjyHDdpjQgidI2xkg==
X-Received: by 2002:a05:6000:1446:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5f187a4b4mr6435777f8f.7.1752326091897;
        Sat, 12 Jul 2025 06:14:51 -0700 (PDT)
Received: from localhost.localdomain ([154.183.63.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc229asm7304903f8f.35.2025.07.12.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 06:14:51 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: max31827: use sysfs_emit() in temp1_resolution_show()
Date: Sat, 12 Jul 2025 16:14:46 +0300
Message-ID: <20250712131447.326995-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace scnprintf() with sysfs_emit() in temp1_resolution_show(),
as recommended in Documentation/filesystems/sysfs.rst: show() callbacks
should use sysfs_emit() or sysfs_emit_at() to format values returned to
userspace.

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---
 drivers/hwmon/max31827.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index 48e8f8ba4d05..c423cabcb28b 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -445,7 +445,7 @@ static ssize_t temp1_resolution_show(struct device *dev,

 	val = FIELD_GET(MAX31827_CONFIGURATION_RESOLUTION_MASK, val);

-	return scnprintf(buf, PAGE_SIZE, "%u\n", max31827_resolutions[val]);
+	return sysfs_emit(buf, "%u\n", max31827_resolutions[val]);
 }

 static ssize_t temp1_resolution_store(struct device *dev,
--
2.47.2

