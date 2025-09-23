Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF719D8BC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625251; cv=none; b=c7pq7xndDTyb56uMZDJPR5n/Yb8r+1wqlEjNQiDVAKpvcCK+RmuSLH4+0MYO/N/olRPFty8IZi7Smgaz15ul7Omfx6+vK+uiif79Q3acf+A48FFdf8zVTmqRE6IET9g4rQReHms8xyq1+a1sh9Tbqga3hf2h1NRk5+f7pW7nZUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625251; c=relaxed/simple;
	bh=VOhlJp2hDQQqdHrgA3nU9HmR9/uEeMtfiVz263i2Fnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pwiEu/zfj4hmtU1dBpVdlMgdk6Cm48XZA0SoQGMMfX/KWY3BY54log6C/nIq1iJKRJgKpezTdCFEzlASTTyJ3KsONE8jjPtMyc1jf2tQ2TK2Yu8cFmEvF6H8gQEMYM3qQpKTafACPGTutafl/hZjT8GT8hZNvEoi6qrx5UWzmnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA4mt06X; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA4mt06X"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDEA9810BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 11:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkj-N0qlki3N for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 11:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=rk0006818@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 424C98113E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 424C98113E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hA4mt06X
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 424C98113E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 11:00:48 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b550a522a49so4674836a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625248; x=1759230048; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J+d0uNuVR4m+R+a1nNiakMPI+senyqQHCOr95TAfxeQ=;
        b=hA4mt06X+bRXo+DJ2l+LwFpUCS01c6VwAdNvhJrItF3ftfJEDwcEb4Nu+MNp1dXpKr
         XxdPWoXiBcKSzBDPq9kLYhhP7IO79B8O9h2dE/nhsXl5WzKArHWBMnJGLPFCYA8TG1Bv
         A0wQ31rMWBu6y48piJCEyMo4YubZAsKEovqkSOJZ627Z89JGkSWjf9OV9eiQllpYCEyG
         5QJeiZ+cuDwodaJ2fzXE34Vu6fZfYVpXeKpc/hNT6cm/TcintK1rUKoPUyp+KfBdTGTo
         LSvBzMICJayQAwzpVMlderUw1JyUGayMg+kApnAp+8WxMBsbisUMpUwnN2gK52c6WY9J
         8wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625248; x=1759230048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+d0uNuVR4m+R+a1nNiakMPI+senyqQHCOr95TAfxeQ=;
        b=r/HfROPPFRt4ny2vmj1DxzW6ykRfMxXBTIeNYhJkG+zvqaP1mDauVyL4I5W0cTnqa1
         DmILPmjwfHuml4HnhR3qUG3zWi6LEporxXwwWgCibvX/IChox7bf7BL3Axd18tVLAcFD
         O2VWNUkpBOBPwH1j/Yy10KKjYQNOgDyiLWccG2kovlVaovs49ywCSfdyvm5/EviyG18o
         VH941j3x40S8AylrhWg2SEpobhls0nnQxjlkNQJKye4qGmAAUAdH82pc3kzHPQpg72/F
         S0dDydvVi3hbzB/orMMggisGExfNpyjkcz/ZWeWxGfyvwsR4JVw1tGbzjJfhtF6u9XRi
         ZP8A==
X-Forwarded-Encrypted: i=1; AJvYcCX5W2cXul3JtpYAppgwsggqrn3FLlv96qBfM3AIFlHtsV2qBwbMQf1LqpTpjGgdoKRs2w/RuMvq8/7VbUjU74dpn1HMGQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxrnqzH+KFmVR9eRTtgNGAdTVRCnT+NSrGeJ5Ul57/XhVyCaq19
	iV6ah5k59OC8A1I1ID2PX6D06T/RbM91UQCiJsMNrlcb6q3DUJt3g+IE
X-Gm-Gg: ASbGncvcBVL2/J8VnPQ6CPkzM2DdezCU4yMtHvtERioT1i8xzRThAXvu9wZT8f5WyYW
	dthOtCq4jRkbVQjo10ZLLV1aR2gqNus2NwhI3GRfb9od0Zq4074htihguUz00RkXXC1drfMnd6e
	rDLIR3u32IhigDwsVsTjtxVi8/B2BbzzaujyQZwGlNhwzONF14AbqBl5uKPtS5ozhg/gIDsF3yX
	MsW40HTAInQ88Ko/Gwmpk1sOABWL1XxD7jmZO7GlqSxKNUY4IIQS6jEKdmJy2K5PqwnfGyoKQUv
	A9lGHy9U3UZpXSk4qHgWitoUB7P7siofIzGK9ZVhF7YZbSF85TjBYU6dZVJhOaukzp/x9BDZL8e
	uT1eitVwFYBrB8Wbh+2Kd137lXYkxmP+RNS4bvgqECWcT5YE=
X-Google-Smtp-Source: AGHT+IEYvec2VOJUIP0HzhEx0k08gqrbQ//jHK3lUuVH/vw6V0w+nLGE6iuJ0m4g0yvADc24CIGTDQ==
X-Received: by 2002:a17:902:e5d1:b0:274:9dae:6a6d with SMTP id d9443c01a7336-27cc5624d90mr26228805ad.34.1758625248034;
        Tue, 23 Sep 2025 04:00:48 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2699363989fsm151910135ad.92.2025.09.23.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:00:46 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: lanzano.alex@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
Date: Tue, 23 Sep 2025 16:30:25 +0530
Message-ID: <20250923110025.1358920-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array() in drivers/gpu/drm/tiny/repaper.c
to make the intended allocation size clearer and avoid potential overflow
issues.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/gpu/drm/tiny/repaper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 5c3b51eb0a97..4d439a2d973a 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -535,7 +535,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb,
 	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
 		  epd->factored_stage_time);
 
-	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
+	buf = kmalloc_array(fb->width, fb->height / 8, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto out_exit;
-- 
2.43.0

