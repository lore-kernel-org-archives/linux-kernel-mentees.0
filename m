Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFAA17736
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 01:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759368805; cv=none; b=gMVgn0nJ3xw7fj+DwbJ3fNEdyB6aZNydO97ZGkJSYJYAH3MRe0fQb7DwiWwNJHenhMp565+XOIf0iIECyTXcgFjIvH4vJlgEAp1WcZyfvojgvcNdSpQoRVQ4FI59NQnWUpIBpjZw/4XqkHyLBjqKxic8As/Bo1gprytEQi1i2ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759368805; c=relaxed/simple;
	bh=q1hY1mnC12g1KtRd75IAH05y6jDKKd01PVq8WO4mM3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fxt/DWvSD3EnkHnxYSGPP6XJUYM52wCi+lN9kDDnVpZeqqQiajFRjYqXJV+0IrsvIvDjyNkG1KniecZXIvvkihb/koKnyCocL6nfzOCkcFvXYbaleIK+fzPUHVl5GI62Zvv/NQsRteIMwxgJyknQTteZGNgr7lPwwqvTkTy01Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk4xHea1; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk4xHea1"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCFAC4163E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 01:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhyFyz7yPmMx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 01:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E95CA4163D
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95CA4163D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xk4xHea1
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E95CA4163D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 01:33:22 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32e715cbad3so575624a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 18:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759368802; x=1759973602; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RaVli6Y6NQOLGiB1OtRJiZY2C9eKiJeUFKgxLfZ7xKg=;
        b=Xk4xHea1QOc7efai0AaKqWgwGad/05QYv5Jj3Bq+lXr29aB9YWu2bCjVZ8p9HQ4/Dr
         3tyEUvM78Pcp3IqpJoywTaWVWrEPHA8n7TWta0mUaHfI9ZWOUnKEWjFh5p1R3dGTwcef
         WShhwMO7ak+3sl1uXLmp5HkJlDMDvzypj5mO9lmqyF+LD5tsAOT8xesk+aBb/XbgFLTN
         zVx0Xw98cULJo5URQNq418QkF+ceMVlMBFbPiHkGGqk2ZSGzW3gvc6fmpg4LYnj96+Bc
         TsQtR4pROLxoZigXrGq4QcQsaYw/nYjXF144YcLYxO2D8dwo/RceM9Ex4FX7j4NypQLc
         zj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759368802; x=1759973602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaVli6Y6NQOLGiB1OtRJiZY2C9eKiJeUFKgxLfZ7xKg=;
        b=OglA8tpwZGJcTZBOdnMlz4fi8/1NC1Vvl8zT3y5l4E2GDKRsCYo+3x/fHjty1SKO9I
         1drGtBtRt7jW37JV/5ZjBmRbkJkgeWRCWHjfr3vvmYhMgnltOvmUr7Lo0G9WtWFTWV62
         6ZEVK1xKM76Dh10weKheQplY6BNMLd2QswNqRiCDRJUqdhU0JbHndfoJ1FQ1JUcXTxzL
         p/m6lE70nXHxDhhaGeBr3Qdl30OiwiPZvTMfYI/VlBNbsPVFttMBsl6PyqQ6LEPp+tTM
         eqV6MhOnRGac/xTxHL8BPEvk5SXr846HtOewKz6In3eh8C9QYCyAZY56ln+AzL3e2MqP
         bwOA==
X-Forwarded-Encrypted: i=1; AJvYcCXiRXMVBtCyNyjqsFM1P6Rq06DnT7lQcCoQgDPGAqUmBoYaft5tsdDMrIHPoKsZFRv/TGjO40biUAUUsXeCsiRhVZG1zA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YytFwSizX0tgCauebTZNajPiTYWJd40Qtn97JcZ0vUPeKuO4B2D
	lGIaMSWKr87/zF4EEuBTo5wbfehyIKdsBSYUlbhwxyr4HMv5Vn/CZ18+
X-Gm-Gg: ASbGncu+Rx8h0qlxgn+fI8GWTUo8ehAFsCMtvlQn8Rakv5X9FqK8p1My+0GXKnOkW/l
	cdS02tuVnOYFya3Ibn2hb3GD0JKaOYjPj7IFlFcdC5h0XR0ozvuzFv3I9iRek0A3PajMcGerMJg
	1JAUlUZ4EotekYBrQfMshCIryAXxPH/9HKExl04gSU9V8344mCS+wN4tM00dlHgV4BxGqQjqzbZ
	vH49Bgq8Nxq4AhnkWVndP/E/qpJQRO9UswgnOu1rkSEOPK/T0t/CVKyV7Whg62pEI56u9KpWcC0
	x1JxF4pxBfcwpkG2hMopOy6a80fmqNiRtine+rgQVvEIAeMzA6GNNg7UJXAtWNpTblPc8+nfCNc
	8c+hi76KImSefwWC3UIcaZh/HeMcuXyL3h+bQcXf6zcAsQEBQxuqDCrCCU9ofoZSjUopw2H+ty6
	8=
X-Google-Smtp-Source: AGHT+IHy6EMUx48ZEgtNlsOfQJMXzUOSIEhbwLkoZVxOSg5RvomWwbNs2l7nDhzWak/dvpq2kvkchQ==
X-Received: by 2002:a17:90b:3850:b0:32e:e150:8937 with SMTP id 98e67ed59e1d1-339a6e2821dmr6968345a91.6.1759368801843;
        Wed, 01 Oct 2025 18:33:21 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.91.136])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm1008832a91.5.2025.10.01.18.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:33:21 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: avier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Subject: [PATCH] drm/ssd130x: Use kmalloc_array to prevent overflow of dynamic size calculation
Date: Thu,  2 Oct 2025 07:03:12 +0530
Message-Id: <20251002013312.67015-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kmalloc_array to avoid potential overflow during dynamic size calculation
inside kmalloc.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note:
 Patch compiled successfully.
 No functionality change is intended.

 drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index eec43d1a5595..8368f0ffbe1e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->width, pages, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1519,7 +1519,7 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(columns, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1546,7 +1546,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
-	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
-- 
2.34.1

