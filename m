Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F463BBFD7
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Jul 2026 06:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305217; cv=none; b=CmNfU1w2sqwNkGWq16Cszs9sQTLcNzmvqk1Om5grNk+xH08zXNUkL8qDfvooz7CdJjMfeV/yOcBlAw6WemVDMlYM3Qv96XKzGjV4MpOWgBqGkyru7iCEaR95RIc/Ueju1h7miDKCvxH4N83LqVJX6O6Gmi+RTFPWPDIfvhGcTcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305217; c=relaxed/simple;
	bh=QRxN5MDr5FIc8PSFipSzi/f3VAveC9b8plWzbqt7zQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVzmKzMh0Kp7qe8wuoHYQwBDN1Ir3MIxSZWbf3p9AHVnE9z0G8Wd6E0JvgY6075bjLUfLLju9t/CtLT/fsIYAloJqh6RYC8+vpdBn2jQujIBC+X4myVelcqE8v4SadJH1TIcer334nT1g055QF2utpoflE6/E/ynX+P3Y+YlRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/uHsPTv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/uHsPTv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848d21bbaffso618555b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 23:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305215; x=1785910015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qs8cSOjWBzZH3Gfw1u3IO4v1AqoupOCUcrhQMOFV05g=;
        b=d/uHsPTvEzHrmkMo8ajLT9c6P/ePA0TuOEMtO/bOvS2ShXIKDRuu9lNFfpPjo3B0hV
         Lil396fBLQYsDVcm9EmvS7cuMgt8RYsNC6mGk5O+5Vut1Y1p6L1bDDqP9OkA324nsXWw
         TEeOXYhVktaqpCXndwQAyNlgmLqlYR5MoIDzGmhSzCBwk51kRhAH26WabHpQceLocbrS
         ZqXDvRdTwNH+mPBuO90+ynIYQzhc4PkukREBu8g62WXhYgkYEfFcDDzBJR1xHglxkDNr
         l41LznVuCcJZbdU5ubFiqNUUSEejTf7JVKbxyD2imoMS2KpU3JHs909iMOqyk6ETOd63
         g+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305215; x=1785910015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qs8cSOjWBzZH3Gfw1u3IO4v1AqoupOCUcrhQMOFV05g=;
        b=VKnA0sfDQN0593XF93Yb4YT1U01nthIFt2PbJTvR/X/D6Fh3XVl3bIARLtol1KuAbr
         yamHCX3ypWBqDpk8+XF3TSyp8kbBN1uxPhybAWA7vLnRdS7kUZZ0ZpdWcp+BW7EtsgQY
         OFyqg/+J+bPj6Awbg8bvwVLmZYtPH6kfoys/qVvVo77vYjlv2BABBvtHW+JOw8oM7lVU
         rM1t0cy5ITHXx/TKcxYyosPKqjPUoTAXB7NcNcR80QXrmGAV5/kRrtWwf3bUkR7TVv/V
         CB1Zs/+vujPvmS66nuDdSq/3fzAQJpGQtQ809TBT8kTEmh1nEpVo12v6VQ5D+y47I0Yq
         IY5w==
X-Forwarded-Encrypted: i=1; AHgh+Rp/eS6kAVDkxCkrjUVQUU9Ullz+FTkOW+pBjokmBf6eQ45ppj6PDYsx+SWD5eTaqB5tz/4YD9mQwJTqV7nBJDKOfVMF+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt806cz7cEnZlf7JtiH0z3vQfSZz7cgJpLBdVenQwyPelkCgSa
	5F52V1raf/WULi5veBlynWD3jVGTkSmLcDAcp+8Tvwa5rcXm65zBt1RSjVlcNg==
X-Gm-Gg: AR+sD12gW7XuQS9V3IrUU7XnIT5G1UWovsToyPsyw3lGlENXVGJezan4CISCGTdZ9WD
	u0uVBTzkDpz5PB0mxT8Und09dhxUSrw4RGTSTF7Hn1mlrMLtUoTrvfFY6Os41NTPFUxWooQ9Jch
	2xUZr/OYWP69pbwIqxwb+x7GOhJu3fK2TVPuJUB02C/u2ewpg78CzyeFqjoFdMwv7UqAcEcFn35
	bSS2K9B5mtK/c9uZce6lpkPkmYIHJv7Qs5z7vVInurnCAqhj3okDtaLrB4K/HrlS60RTst1ND3v
	ihkaiftgeMMa08zUjX/fPoJrxApfEYW5eK8nSOZfkIvLK7Ioo/GIY59hOX2DJy47bTqkCOmtQ2E
	cOjgicvrrmg8V7CtIn4r8VYQ0zSBfuCurtXlwrs752AnHdgFP8z1KqhAOEPYKEKzhhGlTN3EcI2
	lQ4UKgTpeIgjaDplUYI7t99rM4FSfEWuK57/yzC9Ri4gXaaTCTyXHbFU/cqxrdYXeRvYkzdawGv
	+JipKXv1AELRLy5GD3h90O6569vq2X5Pf7PH8r+B+nxG6xw2Go=
X-Received: by 2002:a05:6a00:4614:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84e93264595mr5862999b3a.35.1785305215191;
        Tue, 28 Jul 2026 23:06:55 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:06:54 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v5 0/2] media: hantro: fix runtime PM resource handling
Date: Wed, 29 Jul 2026 06:04:38 +0000
Message-ID: <20260729060440.2092-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hantro device_run() path acquires a runtime PM reference before
invoking the codec-specific run callback. Failure paths can leave the
runtime PM reference and enabled clocks held.

Patch 1 moves clock enable and disable operations into the runtime PM
callbacks and releases the runtime PM reference when device_run()
fails. It retains the existing CONFIG_PM conditional so that the patch
remains independently buildable.

Patch 2 removes the explicit CONFIG_PM conditional, defines the PM
operations with DEFINE_RUNTIME_DEV_PM_OPS(), and uses pm_ptr() when
assigning the PM operations to the platform driver.

Changes in v5:
- Split the runtime PM changes into two patches.
- Move clock management into the runtime PM callbacks.
- Release the runtime PM reference on device_run() failure.
- Retain the CONFIG_PM conditional in patch 1.
- Remove the CONFIG_PM conditional in patch 2 using
  DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr().

v4:
https://lore.kernel.org/linux-media/20260728045921.4761-1-tharitt97@gmail.com

Tharit Tangkijwanichakul (2):
  media: hantro: release runtime resources when device_run fails
  media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS

 .../media/platform/verisilicon/hantro_drv.c   | 75 ++++++++++---------
 1 file changed, 41 insertions(+), 34 deletions(-)
---
Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

