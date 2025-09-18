Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4394296BB3
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Sep 2025 18:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758221070; cv=none; b=KnaaEoBV/G5qfHMoK7Gce0dLuy++Y5rcDv+QRtFYgjRKRJ9xwHDjHJfQANNreNcaC+CZPJLxz0ICiBjy9ZeCreEphLa4tGbrv03SVzPULO/BX4YuD3u3+yDIxaqXeA0CK0Qei3FPsnkGxVeVd2VB7LGt0Og6UsgOA8c/Fp8dLgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758221070; c=relaxed/simple;
	bh=fe3A6MnHA+kBcuSKcXPhgzXX8sc6RtnqsVbVSSBzilk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=paKLwulleDno41tNRLT3/IN4J5fDg5B7U4AkutQRycudv0sD3G2JQkwx+ijjTqptt1zjUgKosnIpYE9vtbOnSDBEvRlWuQudmW4AM0khb293Gx0tEXA5NDpyPGCxM2F3Y7lmYpRHXO1TfmmkDo7Fpt4zozP5GoUISYISzAxS/+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eg9/Qr7K; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eg9/Qr7K"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1330802b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Sep 2025 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758221068; x=1758825868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8zgmbahM1VfgP+dW3KRwovtdnR9tCk8bO4aKfh2zws=;
        b=eg9/Qr7KI1lAxKsjtnYZ3ErcmGWkF/kjiA9VGNNgpB5jz783zxHxga6DyxggBHsl5G
         fc6c26Pv2SR0UnEGrN3scZGVEVGizQ7BQIat1ICGTQVUQ7MS5+rqqwtI2aqPTZL3ru1g
         zqwlWgq37Ut+uyVTPEbLeBkjmvBIvJcxHBfGSECK/S2YIdkcgiadPJzQSMde30N+98iJ
         E8KC8teutcK/yFekftOM7i54fNVuGP+V5Amdd+fv0fHtSjwOfXW3o7wvWeWQhICdoUQ0
         X05NdkSJDyV5RH6K6UYWXvoqSVRJ4U0nfv1lZe+U4SUMXrJhLOEagDP5eCz1Fchmrx1M
         Engw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758221068; x=1758825868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8zgmbahM1VfgP+dW3KRwovtdnR9tCk8bO4aKfh2zws=;
        b=f5o/5Cv1ymmqIiHhTSTr+N2D5Hv7jZPGzAVA2gR41haWf/YFmNg0sE8XpgDh0MBQOm
         62Zm7C+uxc3Wydbb2BwLIgPnU34OWPWqYcS7h0p5WmxmIb0fAvs5qN10DOCckbaPvqxZ
         MzcZwVUJqiyF7Jo+SliErD575H2MbzUe4WTzUvlo+F4iXPom253AdzIEAF0kKZ6kN68U
         oFpwbuRg92GJ11uzVtBTvmoEdusozoVs9ionRuDJoYbxt4n4zgkH6PjOEGFK9HII9TNq
         Os+xDb0yFE2PRYgFBd4zQoJ3OKvHjXU69siWAjy4CePYTK6iBvpV5i2uflVcSfV3Mwil
         E1XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnXvlfsSJ1WrKhz9H8e0tyk4sGs55m86a9IUbwTT0ybZm1IRv2NxPdHn3IV1BkhTqcc8B2E5mOpRBZ8rkZL0orpJ/zXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqbduH5mUkYPKK81Yssd1gNC1zujus5S/hBw/70SLqnv5+iyld
	JAsMRSGBqCVoC14wDVQ1k6+Wa2xMw2ftDuLUI0Kvmw0/wJ/JguQxd2py
X-Gm-Gg: ASbGncuvZ6JUr4f025DaiCszfU7OgYggUt/71PK8vqISOP47g31SNQZ87WuDigQK8bW
	p+hB21ipLpwEvSx+GyeaDI07zkpTfmdPJbysEV6i+NP8x+j5ZHU+a8pQhmQCWOK0pjwayQXPg0L
	TQxMwTjDZn+GDDQ56SzDpZRm7vis+A+0k9evugTDJtyKir+WEY4oG0ykI3qUYPyHR56OQjZ+jZN
	Z/TaX6VjmLWYoz40yN8cxdl+UL6DD+LqaJgA3ELvev0uoAbQsqVxil7PLYETA0NVznXCJsVT+38
	OZdQr73/FJMAi7OqaXnam1GQ+eLNFL3+++9d+Qc3SkbJwqbakSH1alcS0jhpHpP3yGkP1cPzxBb
	S2LL/ihyTmi+dL4x4AbioxBU32i0mC5Ivk1p0oswJ4KtQ/9tVClE+VWtBb3oZ
X-Google-Smtp-Source: AGHT+IES0nh3YJZduE+bzFAmjo4n9/IGmSy36TfhXM3u3Sd6MomrUkG0ZxjN3Mi9LkDFwohHkOZtBQ==
X-Received: by 2002:a05:6a20:3d1c:b0:245:ffe1:5609 with SMTP id adf61e73a8af0-29270503242mr768026637.44.1758221068102;
        Thu, 18 Sep 2025 11:44:28 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cff22bdb5sm3051926b3a.94.2025.09.18.11.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 11:44:27 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] mtd: cfi: use struct_size() helper for cfiq allocation
Date: Fri, 19 Sep 2025 00:14:14 +0530
Message-ID: <20250918184420.76047-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/deprecated.rst recommends against performing
dynamic size calculations in the arguments of memory allocator
function due to the risk of overflow. Such calculations can
wrap around and result in a smaller allocation than what the caller
was expecting.

Replace the size calculation in cfiq allocation with struct_size()
helper to make the code clearer and handle the overflows correctly.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 drivers/mtd/chips/cfi_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index a04b6174181c..e254f9cd2796 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -208,7 +208,7 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	if (!num_erase_regions)
 		return 0;
 
-	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	cfi->cfiq = kmalloc(struct_size(cfi->cfiq, EraseRegionInfo, num_erase_regions), GFP_KERNEL);
 	if (!cfi->cfiq)
 		return 0;
 
-- 
2.43.0

