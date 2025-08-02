Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E725743E
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  2 Aug 2025 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754162764; cv=none; b=UwCnariZcJNrS7TSgXE+xNXtqb37fVx6BIe3SL7no9U3PQ6Vm9RqJ7ee12CMuZ+gLiHH4U6gjJ8HXOT0PjQa5Cg/dXshPTjHLu6w2SMUXqivYAKEjtaZbEjwtloZFdvg4EcZuCq/y/wCdYZTawrpyFKHCahu+UA0pGnKNWOM66U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754162764; c=relaxed/simple;
	bh=iYFZqe0FJwNf+ajNL5XFSo87/W08KOgeD3yFN7dsGdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFe6PUp7dvWs8XkaFSU2B6lgGhoMOtN1Pwvr60QGTcSQJRYexEFtF67uDn2iDpGLDHOKnMYb5ko7SQ4VCC7KGgUjur0nvR4zknOQlyspJE2pWFSad3kQYe7AoCmli/vH6KyuNvLrOb11szJAnNSKISpK0aV4NVEqZ9q5DZ37cfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=J0ipzRRW; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="J0ipzRRW"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b422b31b1c0so1866061a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 02 Aug 2025 12:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1754162762; x=1754767562; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=patF50HxwBAOhfbawHD1F2SI7QSAZ2zNgVR0o2+WGJc=;
        b=J0ipzRRWWsslypYsU8rWc+K+i4oUIgbhU/4kbgktPDTbvwuCnSweDf/OAC/k2RKe4R
         OtHD7eBnEHPd1hV0jW7FiFei1EEu8TJrF30wl9OaYHady23gG/dJVO7Jwq6iRPtSR0e6
         pvsKnBKt/wu2kGa+5lPcA+bfTlVNvvnk2kuzKrY5bRjha8n8Kkuu5qQ3xuLfqqRd1jtN
         SJgXr6RyBGssuzBDZ2G2G2UDxs/NRXtn+wupx3PF4szoXD9TKiq6N8Qb5IL7RReB9b++
         a0hmFdXwJ+p59vzLVl/s2FFH0AllAarhpbwSDCcgwpXtbs9fk/10761PmyN5Jb1kW/CE
         8Y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754162762; x=1754767562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=patF50HxwBAOhfbawHD1F2SI7QSAZ2zNgVR0o2+WGJc=;
        b=kklQIMFvM2K7say/dvpICM+kdot7MgJ1jDGf8bm43FXF2rolM1QNyZyJZVK6dM/H2g
         dCAO++vQeAFEL/35P2EWU8A3MSoaLGA5SCfkfbwBHxGJnpj5/EQSJHU5tbgcZ5lCi+8B
         /WHyLYOt1vqNd4JJeCg5/u8hn6QbENVedH7k9ENHT58j31FK79VPQrM6ss18gTswvFzX
         Xn7wgF9xyeP+UIE1Z35wH7l5QxDZwhfw9FO0Crs+KV10xBsqWBJT2Ar/j845+zJI0BUL
         Xyb7VEb3fkVppvpwaFHQaAaQEeqFamWeohnp1RCWMYmZruvEChf3xMbz4rdjwi1Aty/Y
         yJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVixlaR67OydvBLVBOI6N5pTZhkarlKB8Shsfi+twvyRBdKkM9S/Gi551LcC7e60gHxDORqEEmdtZlgMRthxcbV44Q76g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIijsM8CcgcIkqzeoK7zPQfKHyE9NEcqZg8CMnKe2BNulB6nlT
	C1LkMMJXYDFesh7iLsxj2cEx4s7inRANWZ2dNeLwCofNzZNs68j4wifataU9cehGSU8=
X-Gm-Gg: ASbGnctnSJBFm8sZVBIeZeqcplEYl1P903omE8ZwQYzcKlqgxMIhOTDNBCeXovZT1N2
	cyq4LcGJU3C334KHfv6OW7TSG4/EPvo1G3cVQTbufmt26R+eERuXcnHSLDROz/jp6WgZ5vKwoTG
	usERQ0tqyLa+8G/G0jCWkhpFbQNxIyoT/WHxlMZpMO6ng9WA6Lx/JaVJzluJZzQ/1yyoWA2pKhx
	QMjGQ4/HW3nU+yES3QBEP0276U0c1UkMqJ0V5BocF9ovjOH8j4wn5ue/LDn+JXUHxjMs1NMmZRr
	cwmkhoMPmIG6ORIEuOSkC0XuxXhTjxXgOOE0BJtCxl2OPSJhPp/mclT34g+pIDxCmLgt/sk8lGq
	DdCoYLwJWhJXDWXhnk5XnVGIwRpAjF925ta4=
X-Google-Smtp-Source: AGHT+IEUNY6RAxyfm2o8WI4OeBc0W8xJUgXWURl0s22NPmAoZ1ZpBLFdr2EyazqR3HO82uxLuqL2Qw==
X-Received: by 2002:a17:90b:53c5:b0:31e:f397:b5b4 with SMTP id 98e67ed59e1d1-3211629df4cmr5741060a91.22.1754162762276;
        Sat, 02 Aug 2025 12:26:02 -0700 (PDT)
Received: from mystery-machine.local ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207eba6bb8sm7887583a91.4.2025.08.02.12.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 12:26:01 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Date: Sat, 02 Aug 2025 13:25:46 -0600
Subject: [PATCH 1/2] accel/rocket: Fix Rockchip NPU compilation
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-fix-rockchip-npu-build-v1-1-fb0f0dacb3fe@brighamcampbell.com>
References: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
In-Reply-To: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Brigham Campbell <me@brighamcampbell.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=me@brighamcampbell.com; h=from:subject:message-id;
 bh=iYFZqe0FJwNf+ajNL5XFSo87/W08KOgeD3yFN7dsGdc=;
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ0ZfmpvMtp8XL+wJKPaa55a2Y/8OLnU1fccyu3VHF0hFN
 cWcyPreUcrCIMbFICumyKJya5b6xcnWjw5G8E+AmcPKBDKEgYtTACYycSbDP72cuKMr9q5a/+7Y
 umopowoTD94pHJ/elRnqHa14MbHQ/C3DXwHzdV/2T5oWmCJykrmf/SEbh+R8rRXTmVs2bfRR2aN
 8iwsA
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449

Replace DRM_GPU_SCHED_STAT_NOMINAL with GPU_DRM_SCHED_STAT_RESET, in
accordance with commit 0a5dc1b67ef5 ("drm/sched: Rename
DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET")

Pass extra parameter to drm_sched_job_init, as required by commit
2956554823ce ("drm/sched: Store the drm client_id in drm_sched_fence")

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/accel/rocket/rocket_job.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index e731da15ebffca12e74035d2739a666a8e02d747..5d4afd69230623215e3105da7153d2d010636d52 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -390,7 +390,7 @@ static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_j
 	atomic_set(&core->reset.pending, 1);
 	rocket_reset(core, sched_job);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void rocket_reset_work(struct work_struct *work)
@@ -552,7 +552,7 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
 
 	ret = drm_sched_job_init(&rjob->base,
 				 &file_priv->sched_entity,
-				 1, NULL);
+				 1, NULL, file->client_id);
 	if (ret)
 		goto out_put_job;
 

-- 
2.50.1

