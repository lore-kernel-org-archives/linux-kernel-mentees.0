Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7422E03E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826004; cv=none; b=Dz1OA0A4gDd9cX4kBy4EjpspnpmNV0N9CKLg3gh0SYy40noogLcYbvIwfDNNv6hfag/ePLGs7nPpAfp+Aajeh/TEEUFEU+sQZSAZyzIlFGF0OQu8ikgNNjPEgiBUOkJJqOXPgb2i29cQ05nMC/770YOK6FA1VB1Zt1LKQ5N43d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826004; c=relaxed/simple;
	bh=XfnN1y8TR9d0kJhrONqUSjYTGcbs0xeo8/JSjdx4LAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W8jrmi0fC5ev268fibJXjxDf5dswh07bpSdYwMNP7hNLDrudrAtbYirPZbm4Grgnf9VXcaCapGe5p9wpiWqjySqYEEQKFPLrs8Y9XiNNVJqD5wRP97KqpeDR4qRFaLkUKBKREUqkqXkGMiiqRObOoRSCVnJWNNnMaqvKR3vw1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANG52qPp; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANG52qPp"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A965B84418
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 08:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWidymUR14WZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 08:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EBA484426
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EBA484426
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ANG52qPp
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9EBA484426
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 08:33:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e509368caso11046695e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759826000; x=1760430800; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/5lpEHR2FrKfoBetfp+01yqZYBFD8BaIlepSwlcmXqE=;
        b=ANG52qPpGd5P2U5SrKLT/2RnFnOE/DDEntfGG0pwxIISdBEYOMaTpfkXkKeQllUY0f
         O0yBagpMwyt8K0N74s2rFE/FmrijgHMMv3d1x+KWnDzoYUukmu73DP3UU28uo/5S8fvG
         I3tENBvWHHA4NN5Vmn+ZJc7bC5SpXzDhXbJB4aHR6aaM/2hgvUbUjfLWUvjJdBs7KytR
         KxYkLTLJIJFn2LaBv7CyO9C85ymeEybkPguiyi7kQhkS0BDBffC5FYSLJ/SeiWTOl1lA
         FfaLQhRVAVNw2M9JpzuKCapsgw9nMoiSE2Eu8mwFn0yW2ERYvFRWcMcpVzPPjJemL0ft
         CtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826000; x=1760430800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5lpEHR2FrKfoBetfp+01yqZYBFD8BaIlepSwlcmXqE=;
        b=EBVXR4+1ENkFB0q6QLmlTDYYf2oh1ZWYZ/JoXj0UWJyMRgZc4ixTsEDtK8LMpjre68
         z4qYIEitxDqVkHNeZgJ/gDPg8HHUbVtnuYzZOJokoj2bOCjWSp5sc7kjy902EYndEcB0
         ugCzCLtoCDq8LRA8I3eJQe8sDE8ood/T71wbXRcHBkTJvy73xJBOAubcYSH/6p+6P0vB
         CbCVj+mToyN1OzmKgev8mkVI77zOdBjMyMsuxQ4fgfmkKOokJ6hwvK50TUPGtX02aNg+
         OLUrDlJcSFYSLWX6hXc7Ta9j532fsYCSBnDqgbum4NBvu3vnIR3aLevMdtmPMu5Hg0yd
         zS3g==
X-Forwarded-Encrypted: i=1; AJvYcCWWbal+Q+hL8lEs2tO3fr7kn3PI+ByIWYVbDRrcdHbN4UPkmP3EssLvIhv1xVooFoO+4XsfJY/daD0t7olPDEOJO+tn+g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwgPuQIWrXsm2G34CveTfZ7qcXgy7Fm4XGz77dzMVU5WM/xlbtw
	P+JlcJxf7p7StQUqNWX1IO2u9lJj0WgucDUfK5jY9rjf42HnNQ96vmi0
X-Gm-Gg: ASbGncsyapEDXGd4XcTofT7ptrvPhntJPR0CbVbTL835U1UO2nogZWd5ln8B3xD3+Q3
	bh6mJDCFO98RcnBXAbshok3k9kO3IvDu3qRUVGWY6LHxT4HgvjX6XW+57fYVSJH1NJJtBasdb5B
	Ort+q0TiBwoJ8D9dVGnR0ykMjqeqXE9nbdYYfflEpYSQ56zKhT/KN5CYrxw5YVpSSCzXP2aI1QD
	r5APDWJ/v8HBYyN9F94EPEH2OfMJrjSQpWjkJ/ZFt7vlp8G7hEmP9UDerUnexDrdXSiuuOLqCIB
	5zN2etSJGOuE0ZvYKI4QtO2pIcJsvAPBdvrxYaY0kQSw/YNG3pn2olOM466JCyeJK2LKs1xTmmX
	lcB0iOfzcf7tbFClJhaLtTg+qeNR5RWKr93Kmlf3Uf3t1+n4SdK8c7zvF
X-Google-Smtp-Source: AGHT+IHfsj3QYJwF3EIm/+ncIkc3TJT6L6wdnZ1V99H9OeKwvXsmjTC5NTDVxYdVGhOUR7h94+1oiA==
X-Received: by 2002:a05:600c:1993:b0:46e:477c:e4ff with SMTP id 5b1f17b1804b1-46e711549admr58886835e9.7.1759825999419;
        Tue, 07 Oct 2025 01:33:19 -0700 (PDT)
Received: from bhk ([102.155.185.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723437d8sm197395365e9.3.2025.10.07.01.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:33:18 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	mingo@kernel.org,
	tglx@linutronix.de,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	rubenru09@aol.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v3] drm/gud: Use kmalloc_array() instead of kmalloc()
Date: Tue,  7 Oct 2025 09:32:40 +0100
Message-ID: <20251007083320.29018-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
calculation inside kmalloc is dynamic 'width * height'

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Changelog:

Changes since v2:
-Reversed width and height in parameter order.
Link:https://lore.kernel.org/all/20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com/
Changes since v1:
- Use of width as element count and height as size of element to
eliminate the mentionned calculation and overflow issues.
Link:https://lore.kernel.org/all/20250922174416.226203-1-mehdi.benhadjkhelifa@gmail.com/
 drivers/gpu/drm/gud/gud_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8d548d08f127..c32a798ccadf 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	height = drm_rect_height(rect);
 	len = drm_format_info_min_pitch(format, 0, width) * height;
 
-	buf = kmalloc(width * height, GFP_KERNEL);
+	buf = kmalloc_array(height, width, GFP_KERNEL);
 	if (!buf)
 		return 0;
 
-- 
2.51.0

