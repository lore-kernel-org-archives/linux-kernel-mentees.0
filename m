Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5B73C1F26
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252640; cv=none; b=CXDAj0WY+JU18S5zcKRBvUPrRiwe/beaAxs5iJOXW0GGuIdgbc87T5fnebDF14fUQ+eybQa8jmjz91/4MZlDYV1IFjh15x719CB+q++DSMYL+kJKIQjlxuY7CExCahpjtKIH6vDx7RCmsvYBHHnIAsOShPoVBrqknOaE6WdiD0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252640; c=relaxed/simple;
	bh=2ZmnH69X9i6LOFCWhM4qK/TDF+q7CGkCI6G71ROtLpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBCGrTyvWs040ucfHJZP7UtBQbebFxti1TI4HxdB6XCgAy02WVP7ZLFyUq9JW/QeUZMQgLEk0xGNNROeaF6Sm6s8UR71fkwjC+zrWozFaUk6yn4ytb3n9edDSmO1ZVLQpvzQ6mcueLMUbRtX4jVxlpt0KvqED0QTbge5jw7reiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFRxpD8D; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFRxpD8D"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bf854d5feso781084eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252637; x=1782857437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zef6035xk0sI/Vr1UN1WS9r7Ogg1PRDClgF390fpwy0=;
        b=iFRxpD8Df2yPnkHtfvcImwN+8vupZ4cIVArfxytdyjLtnmJHzh/UqO8U4CmGu6EZx7
         cAk3DAOXZl42zMxyjrmFXfn5YmAC+MFJn0pBn2E76FFaXqDKAk/BoVbU42Iv5omhJVxu
         NdgDQ/NwRE1+B5ntQK6ECATFB3OKUAjDxv/YmMDbgGQsc63AFbWxRfuh84Ira3P+GiG/
         MOue7bRTeH2b27Nzs9RLdx+oYBnmk7oRkv3PNWxPZOBgDhzgO4g7A2oPbK7dTUKPk77g
         omXLFNBwkt9aZL8dyoF4Ht3Dum4rBawcroo64Y+sTFmtTSeZYqAbIeoTDOP6HgeNYe2F
         abeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252637; x=1782857437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zef6035xk0sI/Vr1UN1WS9r7Ogg1PRDClgF390fpwy0=;
        b=fc1/pSRj0755pneLMNrWBy82UcY9zrotnZz4xoo+OoDilDCnHxMEt08tg5MS5TMkoY
         ZXXmbpTbrHVngkR6QVpL9LmjFzwEm4Vbb2ecJLiPajx78ywkzSfM4P5BqzDW4xdNWb7/
         a0hFg1nqSkBaacheVFH3FXWSuRXcSoqszppZM/3NGLnQU6XNvAIDj/JKBJgVeCM1lO2P
         YHP/37zxnTW5N0EAgNPj9mLgul78cUb2Xp9uELANxw3//7twqVCbCSsKMqsLKmbl9J8I
         uTbXk9eomZGlY4HpqlTYNwGjyxJ3FWA7ZOZNsrcloIsKy7XasJKOaXq3cPFzVqV2vylt
         Yr0g==
X-Forwarded-Encrypted: i=1; AHgh+Rrq1TypV0r4B3JKK7/dt8TE9W4DbCQYxq1fWw6Ct+A9dFQ1ukX1qSNjhpxVjy1Z89t06t2sp9PsHdDnyRqnpwmIi/Yxag==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZvfv3EsR2B86SG1+f8pg/LsXfr/GuWXgdlqiI+DSlso0egNIH
	TEqhQ88IYR/h2PsAUFXu+waV1WSrRsfte4fbSYisBGdm6MZhgpgh5GGmGbXQyUP1
X-Gm-Gg: AfdE7cnhz+K254jZAPW+QM3fQNNYnW7zEfPej1TNX8veE6KBJHQIPMJ109VsyG0XDa2
	vxzTK4POF8UB2AXrJti9GKU3FCPuoeR91D7A+Ao7+luLh1fCU/LQDkr4H8n0VPw3zNCyoBepMTV
	k+zyeNcp5iY72uo8YsoY/TEZb2EY3CanJ107e/NDFSlpvfbwTQnMkignZJ68C4okBptdMC7H38l
	W23B69MvbYRB7sBXfPSnGUMIa5RAWohkjlhlnCA/61iuvPHUr+QweE3QjKC1uzZoSYYPxeNXeDl
	Iin4uBGYtg55wh2FeQwKzSVzmsVn+Idq0yus3uD8KQC8Q6dK57jOEyF41UyL/KZ0SnvXp62Tc2i
	5uLvpWYgkV8UCTaDR/HWN08Ijl7VMMCySa0cs69W1+jg1q2InHi7D1RwLtUb/LJTewswHIlQ+mw
	BIrSnd5V+BXKDb6lxP3B00eWdCWsz1hnn7K34ocCml0eK6ZO47HDANGhcwOKLdZ1wCx+Q=
X-Received: by 2002:a05:7300:b918:b0:304:de8e:17b with SMTP id 5a478bee46e88-30c68c4219amr1110911eec.5.1782252636568;
        Tue, 23 Jun 2026 15:10:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:36 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Tue, 23 Jun 2026 19:09:25 -0300
Message-ID: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several allocations in the atomisp driver still size their buffers with
open-coded multiplication, e.g. width * height * sizeof(*p). When the
dimensions are large the product can silently wrap, causing kvmalloc()
to allocate an undersized buffer.

Convert the remaining sites to kvmalloc_objs() with array_size(), which
saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
allocating too few bytes.

This continues the work started in commit [2], and picks up the stalled
sites from [1], unifying with [3].

While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
the touched allocation paths: the memory management core already emits a
far more detailed warning on allocation failure as raised at [1].

[1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
[2] https://github.com/torvalds/linux/commit/d178c7ca8fefc28115d35b94c3b1f4d653e34182
[3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Changelog:
v3: keep original author chain/tags at v2 and v3; minor cnt usage at v2 for readability;
v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Feng Ning (1):
  staging: media: atomisp: use kvmalloc_objs() for overflow-safe
    allocation

Rodrigo Gobbi (2):
  staging: media: atomisp: use kvmalloc_objs() in make_histogram()
  staging: media: atomisp: drop redundant out-of-memory messages

 .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 3 files changed, 41 insertions(+), 76 deletions(-)

-- 
2.48.1

