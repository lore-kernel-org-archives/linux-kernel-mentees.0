Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAB308F39
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507002; cv=none; b=Xl3aoQqon2CbT7hmE+XeQhhoYT2w/MQXYQm8N5K55/LD8Azy9Bz/mwQFrjwaEjBnZPDvhbsCqQjphNMplm9nVLtF+NlVMmeVt3XejZa2cBvpYAe3RjaQXxBCl86/qnONbRaIpVlKxad1Q625xsdbtMtVbIAYzGug++vZx3q6yZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507002; c=relaxed/simple;
	bh=5qY/6592ZN6hUTDDrFmtMOeCukxo2QrAHDQySYUCnho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QhUbiWp/rlIgALhZcPeHRsiX9pe5ORGmVe94BZDgg5gIY6u7kKKSdeAFoP9SmR2JBXi7TyjN66YODhJg0oqczg/F/YwwdMp6ZBkEljbG5BLotyguNdKWTMP7hgqkrx9nkdOtXbz1DcyimIhJJyW08AI6jmPsVOukur40iwXngSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlKgHebR; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlKgHebR"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84eb992a881so933270b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785507001; x=1786111801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMmR98zYdJ3/hNNg4PWjtIFCt0ZaQpb0CEXhOAdim3c=;
        b=BlKgHebRq1oa6g/aaXiZkoiO66ZdLnP7tTrGCmZN09A7skH/DyBi0kQ9euE0M1oZnr
         ukweq+dkQTe6792NpV1t0959BDSsugw3MfNHc/DIJBBzNHpvcVW5jElSYV+cf57quhyo
         hO3JED3v4DkrbfrQri6i+JZJ1qVB7sPAtWRn9+kNQP7M+n2sjTfgvaio+13Nah+rUwV1
         k8w+eZm3AR9qxM5hFZmGeXH+37Mp00nHWwLqE/+D/x5GFb++nsmRZJ3jFWyANPXA9nNR
         UwLd8XmEG9ILGRsbnxs1UDns8EilZryBU/viu7qaayvl/zkxpbHaPM6uruzLHGW5f2ta
         lkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507001; x=1786111801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMmR98zYdJ3/hNNg4PWjtIFCt0ZaQpb0CEXhOAdim3c=;
        b=Uosd+s+qzlcAXr01LI7RgfsfRL28vI7AhFCebyBDjbzMuIH9D0gI+kiMALzfOaMmcK
         pNHgiPfH5h0wAvl4eZ8NcaAqLXEtCctJ5Z65j4s8EIiAusNMcCfyj1NSFtIyf6zm8+be
         UrGVckz6ABgnKLybyoU5Y/h0wPTBwR+bHJS/FCEL0xrF50B2Y8RiX4/bwjDUr1ZRu22R
         x2kEj4tq9Z+p6TOG1t6W/0lzB23t6uKGxZVjHCJYBQyhsRIkZ5W3/7Fkau/nRkOvnlFm
         7a19shuXzjLbs4/uBX1r+8pa8WRq7kchqwLbTcbN15+FpU0cKmv3GJAq+6941azfTLzm
         eEig==
X-Forwarded-Encrypted: i=1; AHgh+Rp6F6bXK5DBlK3Ikz+RPCQB+82KHAn3Bxk0r1wI8YNk9+VIz7YiJxNNvgPHm8RApA8KQGzAh9kM/9qe90K21Jpsnsbz4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPHre31txYX648kEo2QRdpTtkbFTlcM9ZMF3hxg67nRoGgZ4Y6
	8iHFViG9ZU4SfnOpOTesaRNy890KYoUtnlvR5B8kmdL18fmB+ft0+ToProdu97uQ
X-Gm-Gg: AR+sD13f35m+hl2wfMmUMyEFfQq6qKRxnBU4ParL8+Q/qjnAX+waff/1YiVOTVaoVQ9
	jNAcbXcgzvqHUc8dKjTzfQeQGLsiDuiOvP0nCnoNkHzfnaKO1JhgMss+OvFYwVNV8Bho7HboLvV
	1wsTvYEpV9GQAPd26obG7AZyDAr/bCV4tc75+bm0q5K90O8n+SUaHsRhoeYU9g4pGbGsCTzDK+4
	vtKAsWiSTKwV4u4urqrG0OrszlmWC7osZzTqxPSB9YiXIR3x/yaDpVRNJRjQHQiQBciUUn6uG1X
	fmST0J+oG3mHLTpCLNqZ63d6zPidSdJbP+YM7b3rwnMaIDNUMqgMrMtP9nJkmLY2djjfn4j3eJN
	FY1sRl0hXH6QgpvL79D2+K7nh/g8aD9+Bh8AYzuG1jwChe0tlZXcyzLgeOEFg4H9IG/MDoWMS63
	4Qmw4umNVqLopBuAbQLo4YLKkMEoMXeMw5VBBCR3od5pUHvEQw+zC9jDv/oGEdRcAzGhLSkuVfb
	NQhwz0NkpG+AZkX62vAqI7YpPYDt82HgIRF+d8pdO99edj14ylIIjykWMrGSiA=
X-Received: by 2002:a05:6a00:8997:b0:847:8b11:596d with SMTP id d2e1a72fcca58-84ed726695amr1276807b3a.41.1785507000538;
        Fri, 31 Jul 2026 07:10:00 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29ebbcsm506071b3a.34.2026.07.31.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:10:00 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: hantro: Harden MPEG-2 control access against NULL
Date: Fri, 31 Jul 2026 14:07:51 +0000
Message-ID: <20260731140751.1183-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MPEG-2 sequence and picture controls are validated
before a job is queued, so hantro_get_ctrl() is not expected to return
NULL in hantro_g1_mpeg2_dec_run(). The controls are nonetheless
dereferenced unconditionally.

Harden the invariant by checking the sequence and picture controls with
WARN_ON().

Found by code inspection.

Fixes: f329e21e9dad ("media: uapi: mpeg2: Split sequence and picture parameters")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged

 drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
index e0d6bd0a6e44..6a942f4b8a2d 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
@@ -161,8 +161,13 @@ int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	seq = hantro_get_ctrl(ctx,
 			      V4L2_CID_STATELESS_MPEG2_SEQUENCE);
+	if (WARN_ON(!seq))
+		return -EINVAL;
+
 	pic = hantro_get_ctrl(ctx,
 			      V4L2_CID_STATELESS_MPEG2_PICTURE);
+	if (WARN_ON(!pic))
+		return -EINVAL;
 
 	reg = G1_REG_DEC_AXI_RD_ID(0) |
 	      G1_REG_DEC_TIMEOUT_E(1) |
-- 
2.47.3

