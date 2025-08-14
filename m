Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3BC163
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755190305; cv=none; b=M/KXiEqALJczG3oFll+Jn6anrk0tx3N04+F5U5ul/aV7hV8zVE/GppnqD2KqzQcemVUIAJ0JyuwI630R1G6Zi4PzAwa0DYfiusDlFJdQvcgbPpLS9R9G5H93jwM39QolTAPdz6xxenh2PkR6RkMkazaARdtGQRM+2hU3xOwYZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755190305; c=relaxed/simple;
	bh=546+oPUnHFnZfa6yi5axZ3GmMVDm8GXEXOx1Wrgr4Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVTT/BNaSONZu9DZO+5jKu38zqPHUE0wyIgsVVhfVBjZyepoZOthVLnVFzzGFt4pj8YGGxuXgg37VFxUplC/CdR6CLrEnwqWHOv0b/m3iYdioHtarvL8emAP+VoC1rfJmj+Imzk8TRVLm+pzMBQYnlCUuugbU+p0y4C+YS/ZIYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOCp6cVH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOCp6cVH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32326789e06so1109372a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755190303; x=1755795103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYjGIGZKNjSwwMMePRBYpKkbHMPvIH+4uqVdBTFlwQA=;
        b=WOCp6cVHtiRd5YG9nvhC3ZcOGziOH2u3vZGttyd9O5JI3gy5XKMsglVoYidUDPFrhL
         B4ci1HTYT1awXXYDgsIPVubbU09aHKPMQ3Yt7M0+2IgwFppCgh/j1aHkjpeG2pFdiYOp
         mPUCSKW+ciZGyMA2MWTcK+6W+geitGOTjP8LxssxI1pBMMa6RczvZs1lRtwpycPn02gy
         V3Yp7HzUKsXI2OWBlgafuk/XYLN5TBeBA+NBwlkdbi+dmOFZQqg9RxD0VSL6OAet4v9m
         5crPStxo6SVnMSK4755HoXQITPMnACCIDuWrUEQ4vWQIhVicd3gpn9vAhLrPjLH9t7Qo
         gb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755190303; x=1755795103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYjGIGZKNjSwwMMePRBYpKkbHMPvIH+4uqVdBTFlwQA=;
        b=Cv1ujgDap+vWU6J+uV+DKfnmSsPEgCPDw/iVssUn8lzdFtl4boOS7FMRIcN1CWY/Iv
         OQLu8M+Lhkvp1Zw4tWCq9E4bMCbYuU5iu/aeNk343OI9sMYfAwzDBMIxHTuFOKku/JAR
         oHXvaouWOD8I2mzL0PmroqtJjWM0GVbwn6kUUmOBC3ZZeqiDJSlvw2VXXYBh0cL2aMEM
         rG/WbDHLuEFzDE4mpnO3OGqrgfcUuO8/2bOrWoFgC3ti5z0E9dqddJ3/2mOxsxObpY6K
         TEbzdHSf+/+Qt3DLcxzwYO4VBO9rdJIuutLfY4/PtxPBsJPt609zb5iWfxmiMo762kih
         Bciw==
X-Forwarded-Encrypted: i=1; AJvYcCVTF3sarZp8A6hg5bpTgHlJENcC+7Jj2aFT7QZOVMS5xbRnKK+N7HGgRY1UtAbKcT/BeLO9dj0wG+xwNVEXHOfz4izUvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaiFJ4xTaYcw627oFg0YWbRdla25/G4cclUlVMuHXpWpunnS7h
	JXhpKeSC9DJzDE8/IhDwMmets3DJxhe5MfCy6zXausYR4+jDJnBZztG4
X-Gm-Gg: ASbGncvquldpp7SyuwGqKhfPBMdcmUwqXxI0zpzoa72bfhKV0RLWtkKlqHJQKlwxoeV
	Nvvshs+dUE+FaQYAHiF0aW//Di2yP1Tqd+bfuLyCglAwRsHdyshB4wc2PjHT6GuxbzWEWrG+0AH
	dhWKiAt3wQxEjQwpO6zvUsAgAxHplzWAP8hZePHJp0vXX2WWk2imDnpKDsybKeIMhhvH21qdxxL
	IryL6c8EEEQoCtoSJ6aHgW+ujyIfRTkjMEovF9KWU5w+3gwfw7Pd5drHzDZUglxrlexzBiLIqGb
	j5VvTl8O7Sof8a1TTEVyKs1ze4Fmkw5qzMnAKtE2sAkoejjRRkMDnCEV2hGqAKrES38SzkdWsDz
	+M82WRfW9XolwLbkNT95NCiqF2QSraydtQ6TG8HNLqDpjXzlUR5TPjmeR3jY9ZYGHH9bc+ETTD7
	E=
X-Google-Smtp-Source: AGHT+IH0MiMwWgviaw/mGxe0R76GtgG7LKjx1+p4CKRkJ7nnW7Xepyw7mwzYq4K+Ze8wJkhejlul8A==
X-Received: by 2002:a17:90b:4b03:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-3232b2c6659mr5225771a91.21.1755190303196;
        Thu, 14 Aug 2025 09:51:43 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com ([2401:4900:1cb8:7b85:37eb:c20:7321:181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32330f9297fsm2375904a91.4.2025.08.14.09.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:51:42 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] drm/tidss: Remove unused value
Date: Thu, 14 Aug 2025 22:20:56 +0530
Message-ID: <20250814165058.615884-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value "ret" is being assigned to zero but that statement does not have
effect since "ret" is being overwritten before being read.

Remove the unused value. This issue was reported by the coverity static
analyzer.

Fixes: 7246e09299455 ("drm/tidss: Add OLDI bridge support")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
Changes since v1:
    Fixed the commit message and Fixes tag message formatting.

 drivers/gpu/drm/tidss/tidss_oldi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 8f25159d0666..7688251beba2 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -464,7 +464,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 				 * which may still be connected.
 				 * Continue to search for that.
 				 */
-				ret = 0;
 				continue;
 			}
 			goto err_put_node;
-- 
2.43.0

