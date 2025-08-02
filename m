Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC701DED7B
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  2 Aug 2025 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754162762; cv=none; b=b6n8/TuI54TpC/dyjq/h6fLcIZqJE8FjWOsdphe5Tw6jU9b9dn8ZyFR6LhNQworKVwOUSDUsXaAZjYOwSGMPRV+Xh59xsSNUEjPQOzx3fS/Owi6QpfBrmvEjLwL6MJDPHLVJ2WIb2uRbcQKSGHsH0RgUt8VTWCyh27igGORzoVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754162762; c=relaxed/simple;
	bh=C1UaNTuACGrRkW2E3FhQG0DrBcJFu24wR9QIIxX6tno=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y8zEDJiBWuvUblm7Y6aA3f++mzGAU6G/U3hZd+oJgJv4AzQj1vpRYeJlmyW4QkvKNioT74VQO7ZgyzqgUkfcEJFUWe240X5RSTTTTLMVZQspFEN+k2T9pfe5Btjr+S9fDGytNOAUaFtt4RTD/D4tPLr7nDofvzsCkoGACFyE3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=mcborUEM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="mcborUEM"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31f255eb191so2752699a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 02 Aug 2025 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1754162760; x=1754767560; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd8Da3JQX6Y4PSybA2tHWl8SitZx9sYR2KOlV5oLUG0=;
        b=mcborUEMSiy2eF9JE4pbqwLIHkL/DEhbCSZzj+23VWhUOjObbLEkvZk2kUFcuFlARZ
         lhcMMdkoWsdmhTHD4hP08jYCWzC4yq19BYDinGf/5ny9ABm7INRY6QTvuTUUE6AsHlSv
         y210jhHLHB4gIeaj6+QFeer2l0uhlGhMey2h7La57E5AJWikLHHPie7u2s56w7Bp82TQ
         t+85FpUsFrIALiK00NEINOb/hImntFrD2Wk6HbDavpFLKsK5XKebw/oQfIRlFmS11o2e
         dmjFSNxJi4HyqjXp72DIlNYY0MKeCZYsCbU5MItk/em2HZLMiTFnB4s8Ov35JkhN2Uki
         YUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754162760; x=1754767560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jd8Da3JQX6Y4PSybA2tHWl8SitZx9sYR2KOlV5oLUG0=;
        b=sOhqze6ztz13pir0sq97kptMXLl+vPpnqZjKckXY4077Fvgnr8NwLGuXLEXp3mecQE
         9r8aOf4yaWs/BtrWMVr7PDUAQ03MrPdtcpdQDjBwyhuDkNZzOKNxKLEgOl/O4BcpE5Ot
         iYZ4UqKLsHsD42ORWTPABfl+nGiyDX7b2sxbgT1H84uMe28zE/6uWpfz0ArAFA6vA/K2
         L4kWL5qLiShc2alnVTyJxhE9qQHS6Ev4zdGQwwaz11OmEOOqLenYeIJxGnd5gfyDD4p3
         Wrm2Q44tqwQd+AYcoKHXVu8KRlCZpk5sAD5r4iMEPC7+Iv9JGv3n/NNdsBcJotFHQYmp
         Qp0w==
X-Forwarded-Encrypted: i=1; AJvYcCUt2It727XQ99PSHF3CS5OUOrBtL8aaui7l9SVET7HcI4l1vfBYSHJCONhJaZOXbc1a5yIup5Zt5c/4si6ivPxhkrIqjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWAtaJMkIv+RRtwhypatm893VoFJ9zx4dtJ191pWaBX+GdXI9f
	AO+qEDgwn6DrMUxEqXyRZl/0dGUc2M1ttn7XSUn9Z+4LhyYR1tGjLmTQeBt3F3yNmLA=
X-Gm-Gg: ASbGnctIt5jMArPtBUod1z0VQFDuh1hmoCYRXMSqafA8O8OXzv8nx0WLMgIvD5dIWMK
	Sx0dr98bBshd4D6N4BvaakCZcNdtMDZFAqX+RJ0oO8FPbdU5kz5S3gjCLYp9YS4kVjzTdFQwJCu
	seBR5AEfw95QTr8aIuoUA+1pXoGkSg9onKhD4DBXZX6EJVofDiug0rGAZhZyF78Xv50wTwakiWF
	coa6SMoVjNvAZqFI+ntJ+yuJJGOQ9xoZVW53vetnGDyN/yY1vcRwVXi+RIwtYPr6jksxEoS6Trk
	gEr866yiisAwZpuUmOP8kV7Ghud0RYjOXef7MTrELWao3u2kTPktNFHmT3cr8fhk4WwK0KhYXFX
	QXSXUOD8uJ+bBGXAogkPG7prlcpSfFgx6J4w=
X-Google-Smtp-Source: AGHT+IHO/dHbjA7eIboeg3fI24euyvdKdfkdQISMXRwMVcyEDVOqzT7XWdU+bvEG1Xrt7oOpsscNCQ==
X-Received: by 2002:a17:90b:3947:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-321162dd19cmr6357739a91.26.1754162760525;
        Sat, 02 Aug 2025 12:26:00 -0700 (PDT)
Received: from mystery-machine.local ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207eba6bb8sm7887583a91.4.2025.08.02.12.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 12:25:59 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 0/2] accel/rocket: Fix build errors and sparse warning
Date: Sat, 02 Aug 2025 13:25:45 -0600
Message-Id: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADlmjmgC/x2MQQqAIBAAvxJ7bsGEyvpKdDDdcilMFCOI/p50H
 JiZBxJFpgRj9UCkixOfvkBTV2Cc9hsh28IghWyFEhJXvjGeZjeOA/qQccl8WDS6b4dFK6tFByU
 OkYr5j6f5fT8NmHveaAAAAA==
X-Change-ID: 20250802-fix-rockchip-npu-build-ca759ba8da06
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Brigham Campbell <me@brighamcampbell.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=me@brighamcampbell.com;
 h=from:subject:message-id; bh=C1UaNTuACGrRkW2E3FhQG0DrBcJFu24wR9QIIxX6tno=;
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ0Zfmtv7o5uupt5bnPdMjn/f526m5kVXn/6sVQpTOp96+
 PeaOuWgjlIWBjEuBlkxRRaVW7PUL062fnQwgn8CzBxWJpAhDFycAjCRwCmMDA/UMytqO5aUsglI
 KG23b5S6fGmhnm7l78kzPFQjDRn2yzAy7CmRdzylbH1S+l3i1E0JX9tXmZ0Nfqj0aUIgp63bdLs
 4RgA=
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449

Fix two build errors in rockchip NPU support code which were caused by
the integration of recent changes in the drm subsystem.

Fix a sparse warning regarding an undeclared const, rocket_pm_ops.

I tested these changes by enabling DRM_ACCEL_ROCKET and recompiling with
`make C=2`.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
Brigham Campbell (2):
      accel/rocket: Fix Rockchip NPU compilation
      accel/rocket: Fix undeclared const rocket_pm_ops

 drivers/accel/rocket/rocket_drv.h | 2 ++
 drivers/accel/rocket/rocket_job.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 01ac6e4e53b6351df42c97d217b0d2dbeef5c917
change-id: 20250802-fix-rockchip-npu-build-ca759ba8da06

Best regards,
-- 
Brigham Campbell <me@brighamcampbell.com>

