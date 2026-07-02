Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B0343D86
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Jul 2026 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012367; cv=none; b=A3z0kAYYf+GDhriOz7rLwHsKkttgBET4w0URMHh7rVlsrjkU0NZIB6xo6QSBJmUz6XxDUd+eo2SIofCCz/nh12/4q2yIDiW/JxWEdSkyUf+cV0WLfNVxGQiIyNCtRvSudY+NqwPzA+lrLFEEFWHPWykj5ax4lG4+GulnFUxnpeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012367; c=relaxed/simple;
	bh=hslD0RxxCSuvDFNHuDmSu+4NnDOItkzQFlnoRY7Hjzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DQd6VU9qXMYgpE3eVwoxAU690ifCSk4ceXj8Fx5BxOXphUaZqN0GjqUoaGpsZP1dYqXhF0aBxUBJrTXiYEdAlhSfhy3Bpv+Gdbj2D7+bu9O+AaAIiu8fp4eOx9YEWP41W/y68UevnHKj7X6pru0T5fqeT+Pk3gxMBVIGCXtk7/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD2Qq8B/; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD2Qq8B/"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8fee9f63d5so1101990a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Jul 2026 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012365; x=1783617165; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STd5MQvh0NQAJtVTzJOmHeJBNZHmtcn+Q1hAWhkb67w=;
        b=CD2Qq8B/sx8Go/yZ7hr1vDKephM8oSGw6oCzJwVGyPCVaTEIyjAAxNWJdIkB6P6sGY
         //GGqfPUcl4shXgHODYAol4MKrFpGL+B+eKqNbabLalNudfcrpNEJ+iIM/X5Q6jCaNMi
         u+bzsh8Az5WFN4xznEAI3A4DqlRR2njOtwRGPQJUeuEj0xtIVeKth4Nr+QepNrRbh0ri
         TAPexzjzKr37icrOnRv4333pUoteFDfxDa9HiYgpqjfkKF7DP6BTrkYN99h5vFpV51Ey
         0qRmpdPYj2P8XQpQdC4jcwOVvP9R2C7poA4ApeHLtce/hYWSo2gbLcuwFLWdCjJix5FB
         S/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012365; x=1783617165;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STd5MQvh0NQAJtVTzJOmHeJBNZHmtcn+Q1hAWhkb67w=;
        b=d3TZZWPXx7NRuOZ6oqyQ9M0451yTNJ9Eq2mViDN5swW6i2w4HVRbQvJYTjQdp5Cz+O
         gNTxHhl2TL5ByjJ0aWyKUs5G0zA9wRTKK784RcU1Y7iQEwGtGMB34jsGK3A7SjOJlkBy
         q69lF1MVosSOrTAck8/yiw522l6JdwBwVGZvFrdz/WMggYyWfb0vkj//NKtwy6wp2HW+
         MAzDM0DnB4lZrfl5701ruqpeaZnyAp3TFK9nmNxj4R1mgtZKWspId7uw2hB9lBVZR1/u
         S6+zM9crJPgURjlu36i4CR3NaaXyGCyeNARP0mAEMeZnZinu1McYUHRCd6DoylRYugyo
         qITg==
X-Forwarded-Encrypted: i=1; AFNElJ8KzJppwIyy7lo8yKAUwoYRpbBJKV+R7rmme5IZsMXKi1RHMrwHyhNsFNLBt7UlS1hFIZ9C9O71YmC9jQFj81J3Kz/pSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqbLBSVZhp20H67GmZXNbcAW9Wd79qWvqLNXR3Ja5J2Nj107XL
	921PVvZF6hnjrHMVXE2CzrYF1RaEE90c4koNe9046gbIB0/alvrQuPQ=
X-Gm-Gg: AfdE7cnZle6mNLrJKlXj9K/+PhQI1WuKOS9X+B3iywayPxrs/wsJy9oGWW+VCAohOhg
	+ubAT0HG+ieHFRCd/sYEhZ57b4L394y/CGtiwesoHvepbV+qxH31IrNDpUyi6fBrj+3uBJQlD8S
	FjRIPhgz6gCRntzFdtI84YmrNWxpTBZebB4s/TzBVNJH9/ssOOsbQoT/fNjRXcj8G5dSfX0ku1Z
	qRFaiKFyHFxQZogDONdFN+ZLmgcPqNRqUy3LHhm87ay+fDMWSk2oT3RO7TcGcogBxkDBHXZApz7
	ZWz1hDN6ULbHonJ0O7n4+potIu51GWAcMsRiDrgMdlfiqKyCLPODXPtGxDXbEpSIsk5UzU0U3Ag
	0ZXmrnrdrh5uK9OVQtnE6l6+fYxxRPVLimaDfEkHkZGtTV1xVALWBNOgrP7UkxYKdnqua9Q1KwQ
	UFRJAZBu/hoGZ28JoVez+VSBIAq8YeD4qn5Ba9SbDoySyt1Kk2g+vvPbXEvQVs+PN4
X-Received: by 2002:a05:6a21:d84:b0:3bf:7189:2d1f with SMTP id adf61e73a8af0-3bff422a1c2mr6819657637.31.1783012365278;
        Thu, 02 Jul 2026 10:12:45 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm1644370a12.6.2026.07.02.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:12:44 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: docs: remove invalid struct member
Date: Thu,  2 Jul 2026 14:12:31 -0300
Message-ID: <20260702171234.31030-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the structs dma_fence_array and dma_fence_chain, the field 'lock'
has been removed, but its documentation comment remained. Remove the
stale descriptions to clear up the following kernel-doc warnings:

WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'

Fixes: 5943243914b9 ("dma-buf: use inline lock for the dma-fence-array")
Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the dma-fence-chain")
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 include/linux/dma-fence-array.h | 1 -
 include/linux/dma-fence-chain.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 1b1d87579c38..0c49d7ccefb6 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -28,7 +28,6 @@ struct dma_fence_array_cb {
 /**
  * struct dma_fence_array - fence to represent an array of fences
  * @base: fence base class
- * @lock: spinlock for fence handling
  * @num_fences: number of fences in the array
  * @num_pending: fences in the array still pending
  * @fences: array of the fences
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index df3beadf1515..42289f505164 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -20,7 +20,6 @@
  * @prev: previous fence of the chain
  * @prev_seqno: original previous seqno before garbage collection
  * @fence: encapsulated fence
- * @lock: spinlock for fence handling
  */
 struct dma_fence_chain {
 	struct dma_fence base;
--
2.47.3

