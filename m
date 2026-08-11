Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB38478851
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477361; cv=none; b=i9d2OPAIgOA0sthsELaWh3b5u8y/xPxQTvMYVRCFwN3yUxhCoPb+QLDHRxmtAl7LU5HgixreVVI7UFJUc9ToZHNKcmHo9DEw2xvJVs7P8Wzk8ldLh7AVxZ8tMdaxDLj874FoPaqnc5CghVHYW7xogzB5tI3xwZ1iLF2xQ9d0Igo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477361; c=relaxed/simple;
	bh=CYnkpkr4TWMQEU1CSglaoIvs+8o64rzVixD4hFsF4jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dJpggtzHQL0FYDhsM3cY+R5sQIERPGUFK4zagESGkJwJbuUST8Rj8R4F+hRavCQzcchHjx2Q418UTbWyhkVmbzf5t5W+5DO2gPnaUqXBz5+4JHnZ2TgcHRrZDBPBPoSz3lzpTjn9juCIoMSlnlnYBeKR3wnkOFRJmhmJw38gO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghLbymVM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghLbymVM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso1289565e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477358; x=1787082158; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8E5dSahX2t9e8TS2QmwDHlG5eYqVM8lZBQUBjnN4jo=;
        b=ghLbymVMYV+M+kSPhwgFSYoRwNGGAZOStAAMKxdk36KPYoJ83gmLKd4rvZKdcJ9HLv
         RdfAPr9uxLZ8eJV9YtZ9D+RSCVOE7P5h2X9hG5hEGLovQ19li/7ysdX+vlrf5FV2GgWc
         6kcJtRD10k1pBd7CrJfzrBPddSgTWbWz1AYPAjUMtrLe/Tg2DOPqUitT1yQ/Fra5JbpZ
         6cjidxDyRcbaQ4s9WqAWjsOC2L22QpnOuqLlXaS55SyAP8zMo/2S7yRO8j+WG9EpmHqe
         H9l8cqTGJCJ5Ga+NHCky9Gvk6l4z2vkATPLi0K9dHifVdkbqqKhUZJnmIuoUDQkZjvdI
         dyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477358; x=1787082158;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k8E5dSahX2t9e8TS2QmwDHlG5eYqVM8lZBQUBjnN4jo=;
        b=RavtB22kaaw31X3dswQk/pM73N5/AKQUc1a64/86qmpHXtTfwCSL+NbyP7OqnLdcvm
         PBsQpusTV6C3LdgoHGKjsQ+pjtG8HvcpyFvGYWCVx/oS/gWiwOB7qhNO7RDyRSy+fOCb
         T1zU77b+rZN5EmEWsvIyGUa1nl6DHKHdULS467L1OfCiVarWUxzfdItQso7zQ/8zdFPH
         BXX5J5OtMLUIj4hy22ojty3I1S8rqSUC91JU1cm6RCic212Tc/qVAfYy7hfOYwBRw5k+
         o+lvxeW3YgMFpUCMi6TJlUM6swQfQ62dDMEu0Z6t+klcFSBO60O40t5tZ7F03/qOy/t/
         iGKg==
X-Forwarded-Encrypted: i=1; AHgh+Rqa32TIM7NWz56XC47BCfBEqmFE3ZP9djIw+v+oBASOTvuPmiEU5d2nTm8Gg2M/3VHKcAxHpYVb1rD507SiDnrmvrb4HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwagZrcVagoYCWv41QeMHQonzRNy58VIbAgWFAP2wXyM1Z3Z4HC
	kWkGvvT+1tWOu/HxVo4I7730O1LQy7xMXhcWloKxf1Fnk7/SrBpqq7sP
X-Gm-Gg: AR+sD10CWKpwhFH5uPPrsIqs6zNR5daOLXN1f61m94Tcp8rmdb0RZmZWbtaGpU4E1LT
	mdXKJjJnUEwnMOdA63jw5nxdw5080woxJn+LPcnzqsPOKQvIpUA59Q8GHJtjphDw4rlI/+dnNNJ
	RTF2xyeNfC1+JTpCEg57puPLiwQ39Xsp7JcTS06R0EXgtHoTljbMG6Vhg9E0eecccr1FvniMtSS
	UjuTa6W++EKho46Tv4MV+xgG4BxYblF053Fm4YAo/+rNXCl+Ho/0cIv61CK59o2Y3BVIkpQ5T8m
	xhMRVvN33bWaph7rac7BFpyTFve+IjEn7A6ShA2oyFv/6vCtzWkdPrGA/+pI05kWs8Dqs+TJpPP
	0bZzKwAL56U+QZkA1Q3Lj40VkDIoH0TZ05Azg+VgockbhQ0fgFF/jb4exYl/pn8O0K880bHnaY7
	+Dp7BtrrQpLPkPQrM5XkB1M+t6vT9qbek8VCKXe44Mbcx08R1DowbnMAvaA3sWpAFiOWkJbE4Wy
	paSJ3SlrLiB+BiQwsUw7X69n0QkgXeJuuZbFARUbBTsNFcdZQMxv2T4UTT03yk=
X-Received: by 2002:a05:600c:1c19:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-4997842aa4cmr74169505e9.3.1786477358290;
        Tue, 11 Aug 2026 12:42:38 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997adad05esm3986195e9.3.2026.08.11.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:37 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v5 0/6] Series from memory leak on qxl unbind
Date: Tue, 11 Aug 2026 21:42:15 +0200
Message-ID: <20260811194224.121597-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a series of bugs that leak memory on qxl unbind.

For test you must apply first ("[PATCH v3] drm/qxl: fix use-after-free
in qxl_irq_handler on PCI") because if not, you will get
"---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---".

Link: https://lore.kernel.org/lkml/
20260727110212.64913-1-megia.oscar@gmail.com/

Óscar Megía López (6):
  Memory leak error in qxl unbind
  list_lru_init() does not check return value
  ttm_pool_fini() does not destroy list lru
  ttm_pool_type_init() does not check return value
  ttm_pool_mgr_fini() does not destroy the list_lru
  ttm_pool_mgr_init() does not check return value

 drivers/gpu/drm/ttm/ttm_device.c |   4 +-
 drivers/gpu/drm/ttm/ttm_pool.c   | 194 +++++++++++++++++++++++++------
 include/drm/ttm/ttm_pool.h       |   2 +-
 3 files changed, 161 insertions(+), 39 deletions(-)

-- 
2.55.0

