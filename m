Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB9355F54
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Apr 2026 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201994; cv=none; b=Iic5Rqsz4rTH22D7a+DIcLsGrkW50E9kU7xQcACsIiyUictCSJ2pRwqZDto+/iejoMysZL3icLN+to87Jd7RaFz2YPmuZ3JCaxHWfXDhvHoIlpxRl/qPiYT5ye+LgUqyiLlnWU3MuHx9yMT9OUUClHHIzyuJOqW4z4LpVSUmBs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201994; c=relaxed/simple;
	bh=B/9eEE6B2PxEEwz8XP6be4i93RoXNRJ69P6xJrqTv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dkfprj2hc7A7YHz1lwpZmyhGF8duI8PfhUOlyQp2jzpQT3nmggCJEiZKJfgrmKw8BdJIfUw6Oww44jaHLthNgXoZ3fm2egSUrqgc8zVJVR43SVp3chOFN8qmiiOrNZcQYlmDp3kSkFLo9ZbvY6MyqynbBcKEGKAu4X7jwREA4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmqbKJrW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmqbKJrW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b2503753efso96762335ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Apr 2026 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201992; x=1777806792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9JOiMw/TUHAEKpVZ4imVP6XP0XS06uXgFI4h8oSnkI=;
        b=OmqbKJrW92nVDme2wW2/6QExs1lEYSJwPmRZ0VFefMnm8ZTVgca5nfKlnhl+Uag5jn
         YhyFF5tNTymw9C1ow2bzQwWtHyW89cE6BhMtl9VsakNZTfT/9f1kcrXgx5Lw/hYO/3A5
         JmS7EjSL0JWb4G3DaHe1w/NgOdl1b1vUJIajYe7vs2JMffPJt4m3oCYMXKA3cHz64fL7
         Ba2JP2PeZhz6HXJJW4ZCyjKL4LvmP/jB+h0XwSc0eevJLPV04tWq5EvS+xUkCRmCnqbQ
         ixpu/boZEVqKcktR1nZ9lyipbuy340p8PL9U8Ie8tpKl+e10VY1EWXD16rllflMbpoWi
         T2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201992; x=1777806792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9JOiMw/TUHAEKpVZ4imVP6XP0XS06uXgFI4h8oSnkI=;
        b=BCnaf/fX+zjEEbKQdRVsmQsrQJaN5x3sBc1IrKo7w2klD2Rn9h4rSbE4/VCLLjgnMu
         t6v9i7bRCK9bOvkZABZ39aUVBcMAO8pYoVFF/zV/l6yRuhRqs0c/bAz6H/eEcpL3YtSg
         y0RyBy/Il99hTqPRoKp8gcnyj2eaJQWmJ3A5qX7x/VoiDLFdKDufdTfbrNtXW3N83oaf
         WI9rFcPF3e3P06KnAR6DD6vjnIKICH0ZYXALm0fLcsAIWbg24tbzPYFsrSm+POrjf9wq
         bZDgRi7I/6PXMTp9an7nRF2qBFIeepDoGC+PFFdv81OJ7b+FB6BDo2d8gCbpQpi1ji4j
         h77g==
X-Forwarded-Encrypted: i=1; AFNElJ+AQ4uRlB/VyFE6zHBereVL3npigtNJ6WeaCaxYW2Az4Nx2eBuTmp408ZVa4IgVC33r1xQU/T7XZ8cOvl6bU9KXf1RtEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYQz2jnfLBtAviG4/a7bid1Dc7PL8GGFZtHQx97X1P4k6CAoAu
	pCr7K2DmSLDnvB49ew+jgCVPUtndPHcgMKDnV2XT1g+R+zVF8vx7FU09
X-Gm-Gg: AeBDieuWL5F3B72sLgaQIfhvc8aq7QE7KlKfFk5Wpzw2hhHvEdNp7Xo8t18GqPVxkzR
	rORr1CY0MvwWoSB0LXCm2wIABMwAtl6dLoAlww3WV+QTBRMomXGajkXfkaBO6XAC9mEzcQwtuAj
	XaDaTbirues4DxUrhcD8Af3nihQ8S6hwtKtoYH/yxeMQAh5ZiNMNpH2HbRBsu/QTmaH7pIinU9b
	+8b1BF0Rjqk+13mKRrUkpaKO7eF/F/nNmv5Rkd8BizyDM2HvbB8TTItBQufbTY9VlzJfG0XnQne
	A/8luAa8S4BxYT28zaCcwlCilsTpMwkK/jP8N6jJxZxBm6xI9RGRnTwMLAjUgQk5fDNVR5LvlGt
	nSD1tS7YgGpLLSJJtmt28EFnOgB1AomDcav7FOpFLmFcdorBTDHkk3Q7/NvdRhEoE2zX6OKfOaI
	Hd5D9CgioVXH/Br6KhpSwn/NctPT8rYYcvASncQBiOXZ3vTnxImhrcAQ+Gvg==
X-Received: by 2002:a17:903:2654:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2b5f9f4e6damr310434855ad.24.1777201992565;
        Sun, 26 Apr 2026 04:13:12 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab32cfasm351390385ad.69.2026.04.26.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:13:12 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: clemens@ladisch.de,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] sound: ua101: fix division by zero at probe
Date: Sun, 26 Apr 2026 20:12:39 +0900
Message-ID: <20260426111239.103296-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing sanity check for bNrChannels in detect_usb_format()
to prevent a division by zero in playback_urb_complete() and
capture_urb_complete().

USB core does not validate class-specific descriptor fields such
as bNrChannels, so drivers must verify them before use. If a
device provides bNrChannels = 0, frame_bytes becomes zero and is
later used as a divisor in the URB completion handlers, leading
to a kernel crash.

Fixes: 63978ab3e3e9 ("sound: add Edirol UA-101 support")
Cc: stable@vger.kernel.org
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
Testing:
- dummy_hcd + raw_gadget emulating a UA-101 with bNrChannels=0.

 sound/usb/misc/ua101.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 49b3dd8d827d..d129b42eb979 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -974,6 +974,13 @@ static int detect_usb_format(struct ua101 *ua)
 
 	ua->capture.channels = fmt_capture->bNrChannels;
 	ua->playback.channels = fmt_playback->bNrChannels;
+	if (!ua->capture.channels || !ua->playback.channels) {
+		dev_err(&ua->dev->dev,
+			"invalid channel count: capture %u, playback %u\n",
+			ua->capture.channels, ua->playback.channels);
+		return -EINVAL;
+	}
+
 	ua->capture.frame_bytes =
 		fmt_capture->bSubframeSize * ua->capture.channels;
 	ua->playback.frame_bytes =
-- 
2.52.0

