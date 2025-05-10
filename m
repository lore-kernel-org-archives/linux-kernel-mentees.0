Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493A234964
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746874411; cv=none; b=UBE1chwrPlX6CcPtYp/U21WMSJxTO5Fby3I/qg/b/SAFBMcRezfVE3JBf/oCgGrHVzZPsfSIlPBSJ1Z0jBMkHoPUpHYGLqTbbfeBP8E+yzCPt5I6VBbia4jfz/wVxZWeODP3ZutNOt5NCeAZJXH4BV/J1vj/KCHwjKrXEvbecmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746874411; c=relaxed/simple;
	bh=EbNT2yqiKVIDkM0MzdYmJqcw32xi/+LZ6wB1evgxPIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PR5EHkWuDh95lZUUKm9BhpTNymUIV85pxhKkOiAYy/LYyLikx4eLf+xXSltyaAd0gYTZy6U2CXnBNLNuMbDO2iy1GDS8fuTVuHtwsjabAiyIalShc5oZdj3L+Tpm7vj+6Pm/6v9izLNGK1U+KYp82vWYnfqkfJhKCjp9Aba/dgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTd+NE/u; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTd+NE/u"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74237a74f15so2629306b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 03:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746874409; x=1747479209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXSOUw10L1n/p9VHd15QKDeGzN947z5NK2VTS4uqVzM=;
        b=CTd+NE/uBLzZkaUMtgZofNT7J2rg9TDp5Mi5sSioCAnGULC6RPm2dbYD5nuClf/gHZ
         yckjXfh7nR8UelbwrKxG3dW46DykvbaG+Uj0g0z9ss813o51RVGrGP1rhizfmrUId0Ff
         HIOpx9D7Wzs61n+Cd/pvIoP03T9f5HPu1VIQVZPfdLIDROFuI4pf9tMjTacZnrAfY1we
         6BSrBfEZ76om+sQvS9RS2zxfWF8ifr71sDlGZLzSJyvA0o4v4C5HIjZWnE5LwjNqqHr3
         ssghL+1wJsxNd//0stVXju86OWjuc5/fieStDocuBmTwCieeHfQr7MrayoIHPxICIJXY
         WREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746874409; x=1747479209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXSOUw10L1n/p9VHd15QKDeGzN947z5NK2VTS4uqVzM=;
        b=vrJqOpg7g9hEINMOoViE8jfkPPZx4dBe9NEJQG3ccdFfs21rSnTeMwWBe49BzALwYF
         ie4DYjuI9VQ3m9DYc4IKiI/xgh0j4LV73lLSJvZbwjmfCsiNrJZqOftmd9F0ZyZbVcQ3
         CiKCKJnVcrHoEn9AtmKjdVi2N/LK9lR9tUIIFR5h9OojGzyWcwfavVILF85BhZlNYV0F
         qzXXXWdAvkPRQHOD64c9GB95isYWjQgF6f4r2WcXUwqdIBWcynbpT3PdELkqyJddpgXZ
         Xgn0A/2l+BerSeogoCckcqJILu4bzwjZOZ5ctVj+hYsY9AH4ZixFNBY7djdWGypZ3oky
         ZdAw==
X-Forwarded-Encrypted: i=1; AJvYcCUCUg7E/YGpeBaWWQgnsMxFU4HMNiq6XaarJxZZXBhpGB1+VTiYEOu/8Lli+/Egz8JoJhvvSLr04X4RTSpPAYW5yoQSsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyT84gUly947JzyrLJcbL2x5V2zqKy0FC4DRc0WUlTTpaj0+Qea
	lRJddCVEnQ7pq6vhq/rEMugS+ipWdFQ7Eu1YeRV/ytmzRicg/Blz
X-Gm-Gg: ASbGncsjyw88ysGuBZHHN9mj/ux6rzUdaZ5PVvVvaDJbB34rjofj7ZQUkAmf1K97aH1
	OmXxdaQpWSwQQw24T6lKuniyD6FpQBAM5x0Oq/I988Un7G7qdPfGzviPkwWBWiJ6Z5+XQBcTA1m
	EIDTJKzr2GDQa4VVkznIINkm6O6flSCCUFV/xNKsVMOliZ2sM/h54MBAgTgxkIxNpUMwymQCqWD
	vshyVr00G5f3SWpaifxAYe10MQdqd94m5nrZxfi6l6VU/8XOZez259NBSoMXdiGlffeyu5fCKqs
	M9PWiMgLo9+X75013904VyZ+neKnEWMTXFaFr6A9mH64OYsOtfK8dVoUeRmL2N5IrgCqEUVJxRd
	BX8Qkow==
X-Google-Smtp-Source: AGHT+IGTNmaFW/gt/gg+ZkUqkYuLnHW1Rx/ohdhMiZ0++c920zHUX1RPe7+uJ+KS8ft1n9pgvmdT/g==
X-Received: by 2002:a05:6a00:1142:b0:740:67aa:94ab with SMTP id d2e1a72fcca58-7423b3f2cb6mr9961041b3a.0.1746874409006;
        Sat, 10 May 2025 03:53:29 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:9e12:1c37:6e8f:31af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a386b4sm3092037b3a.136.2025.05.10.03.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:53:28 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jlayton@kernel.org,
	jack@suse.cz,
	neilb@suse.de,
	mjguzik@gmail.com,
	yukaixiong@huawei.com,
	osandov@fb.com,
	akpm@linux-foundation.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] fs: Fix typos in comment
Date: Sat, 10 May 2025 18:53:21 +0800
Message-ID: <20250510105321.482158-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "FUrther" to "Further".

Fixes: 5c437fa29561 ("docs: fs: fix broken links to vfs.txt with was renamed to vfs.rst")
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 include/linux/dcache.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index e9f07e37dd6f..3e7eac9496e2 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -168,7 +168,7 @@ struct dentry_operations {
  * Locking rules for dentry_operations callbacks are to be found in
  * Documentation/filesystems/locking.rst. Keep it updated!
  *
- * FUrther descriptions are found in Documentation/filesystems/vfs.rst.
+ * Further descriptions are found in Documentation/filesystems/vfs.rst.
  * Keep it updated too!
  */
 
-- 
2.43.0

