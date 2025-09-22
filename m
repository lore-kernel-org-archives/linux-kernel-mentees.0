Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB931A551
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758567414; cv=none; b=cA7iyxFSvWw1VDoSTBmqAdw+pp4jVuUhNSxXKRMu2KRnrT6YmVfSYplzL4Nc8m8gJDz2g3lv/MjX5eczdwkqkzP2nrtO2Z2rSs9Hix3qELBgh9xrhxl2i9c3EuxBCAu3vhGaPxMZH2SZBEoN+exKKiAYTYrt66PnDKFNHUkCNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758567414; c=relaxed/simple;
	bh=pmtmdIqpwp48d4/s32BjyKje6zxImLmxuZ9drhEB0mg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ALw7OtEVOJ3ed7wL5V7lJqTDXOIQCISuq4HzO2nry8lSCs4NIjfvabsjVgY5DuU/j9HLKZJ/kpMQGqE4HWrVWGffX5U9rgws+bjJ6XCUEfdoV3D06arzLf1ULPH5OMyIsBUuAINAQ8GSOzcQdqCIJGrWlpfjfiEF4UqReDhxmxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSNUyAaY; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSNUyAaY"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE45461AEF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EW6DELgJSVNy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Sep 2025 18:56:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=smokthar925@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EF2361324
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EF2361324
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WSNUyAaY
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0EF2361324
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 18:56:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso30599975e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 11:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758567409; x=1759172209; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyJq43O++KjLnjYoBP21Xp+znz9y7wC4OFS1xU5rHgk=;
        b=WSNUyAaYf/ANcdGXF8ZdcqOSVZF3/U7QGsrIo6tKzVAwj32HwDUXuDVnrszLkhbIbE
         mAkxQyPS/RXrVccUHqrYztaeeHQxN4Gk3ABd3JGL3G4crVJt7tO9eAx5+j+fCipaGFBp
         aqWaSbN9HCzzk4Ovyijzw2XB3IDRLm64HL/wSULJ1vh4IupHHFBYLGQLmnjxKmOS/n37
         dOn0KumFBWgUUSm605oOGDBTkrH+Q/hK2QxSsifqlpbkKrL7dTTTK5IZqI6sKWMeHKdZ
         pgWlYaS1Wl9r4hHmTqYUKIFAjvyU5dB+j9z5xhTZ7GjZ+rYDTB48eORGLmZ68RYzyJTy
         +cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758567409; x=1759172209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyJq43O++KjLnjYoBP21Xp+znz9y7wC4OFS1xU5rHgk=;
        b=VToUo9Uys2OCkdPY7UYqo9yZmQJDd/MxKqgb9rMT3zUkgjROIGqKM3mwyZ1qOes92d
         2zT/wP0RQp1Nugcdi53M/Zd6Rs17vB5PPZCsjk0TdV2rhAhCnbg95IOWG8EW6oVCyk+l
         51XqNFxftP0IVjmC5S/NX0FJI/GLvPtboOfvHATAqX7Fz1GS4SvopULQQAronHobGqBJ
         fdkamu/py517qVnKi7hzfUUPWtcNrWMxzSo9zn+Pnj3qZZxgLwdEx0VRb0s2iABEJs6S
         KFfD6SL+LGoPTnNq4CqsJlxMnKqm4+s3x4NQahfFXgs1jBej8EgTM004HdermXIrhXrO
         BhRw==
X-Forwarded-Encrypted: i=1; AJvYcCXEeBlKpYzSsawO/4jfbSV1RUUpGunnRVJSR7be50X7/qHT1VfmF9cjDVRAIQDS37yyvDNVDV2qj6C5mNXCkH/D6ZyrxQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz9N8qlmdGGzGqkGdBB5EN9MwLZ4vqZPKmm6fNmIm9Cs/DJ2VFG
	IMjgoDMSn2uFJepWav7rqsgSUU8aR5/s19CUiv4lqIJxvFk2G1mLJRYB
X-Gm-Gg: ASbGncuxNP3jqEF71VjvQZP5ypZdciLQ/NsXKaz6MWr6u/8ei1/hIrFFtoMj+eEKubm
	6mVWWKxK7dLIcQ8vkwC+96KT1ylaJ36Lb46YJLV1Hj5yAW2ZD0VGhqlxz83iOTCwOMEhogTKfgO
	8YsFaHT1rQYt5PtdDe/DthP6Bqvpx/9hNtKCl49AgHSOwijEk4YJ+RIkc2ISKswIVb5YsbhLGUv
	oNJeCpF5wQJmtkxLxHrNjdyjWJtA/Fa9a1cl9bwVf84lICQQM0gtq+mDuSlK77YV1W90CXSer19
	LBwfZ/kNwrDRn7tmSJXuHTiVLFmjg8f18glBZgQegEOJHYB7W6VoTKF0pjurbL/BcV7tlnoKC0e
	Nk2IL4GbrUxtT2rKxbO2tkkyIokaDkuA=
X-Google-Smtp-Source: AGHT+IE2hNAByN1u+WlmeKvdGqq3iQsBllgNjf2IKG0z3jtosjk7L/KvCjfFpn/X7tEHILQPO5GNNQ==
X-Received: by 2002:a05:600c:45c9:b0:45d:d1a3:ba6a with SMTP id 5b1f17b1804b1-467f15d405emr134177295e9.33.1758567408745;
        Mon, 22 Sep 2025 11:56:48 -0700 (PDT)
Received: from moktar-desktop.. ([102.31.181.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac439sm241209755e9.5.2025.09.22.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 11:56:48 -0700 (PDT)
From: Moktar SELLAMI <smokthar925@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hawking.Zhang@amd.com,
	tao.zhou1@amd.com,
	lijo.lazar@amd.com,
	ganglxie@amd.com,
	victor.skvortsov@amd.com,
	candice.li@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: Moktar SELLAMI <smokthar925@gmail.com>
Subject: [PATCH] drm/amd/amdgpu: use kmalloc_array instead of kmalloc
Date: Mon, 22 Sep 2025 19:56:35 +0100
Message-Id: <20250922185635.50828-1-smokthar925@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc -> kmalloc_array in drm/amd/amdgpu/amdgpu_ras.c .

As per said in the Documentation/process/deprecated.rst, dynamic size
calculation should not be performed in memory allocator function
arguments due to the risk of overflow.

Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 540817e296da..8dbb9e349a8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2566,7 +2566,7 @@ static int amdgpu_ras_badpages_read(struct amdgpu_device *adev,
 		goto out;
 	}
 
-	*bps = kmalloc(sizeof(struct ras_badpage) * data->count, GFP_KERNEL);
+	*bps = kmalloc_array(data->count, sizeof(struct ras_badpage), GFP_KERNEL);
 	if (!*bps) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.34.1

