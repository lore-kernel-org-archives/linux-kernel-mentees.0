Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECBC43F8A6
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Jul 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425779; cv=none; b=JmAgcrRm0H1izi2TE5GZ9HYSKawwoMZKld9zrryp+Qg9XnYRwB7LiQGzzhz3BsKjY1J0wyti29B1Cxur/cNgHlyVRcjae97fm5+DupOhSt+pevfc9fStblrlXG2t0236mGPnNdujaqJxBkz3HavtBC2ml3syqhQLaNrnkmQpqD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425779; c=relaxed/simple;
	bh=prl3a0vkf/T6ZwK28gJkETuegr5G4y5J6+1qLJNyQ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2P6xW+HzucJa0iIrWLM4RoYYdhIhZSchIr2MctZ7MzZcFwBWq0Pl8wtEBmI1qHHmfAbq1KRX8NSAD2mUojDZSrlYU8TeSpJpSyY/kQ+/FisAMsfm7zSuFcJ7Evv7lS3tu4GA46EqmoSiEyjAa9NPOAAwvTB5H5k/LK9ii+gfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdkZvv5g; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdkZvv5g"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce98cb8165so10134345ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Jul 2026 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785425777; x=1786030577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eemCSxLVEosFJ70MWmOxEAPXsjZ44shUjMRdUXsw+jc=;
        b=NdkZvv5gJN6iOgfVx/4cagvuMwKeoNATrZbs20KgKa1SAikM0Rx1JPXH5EQjHFa47/
         vu47l1RW47GSrHe2RqMn9Z0BbjSsx6Iprop9tRosWj1tjTDNkBqvs+UpE6rFRkFPXUSE
         tDcRgwsR2Hg7PW9dFl6yN2XgikH0bqvmsBaFKTcra1394sAMwT+8O6wRI9Ugn83XenuJ
         FfxjKTGaBAfp+lZOScS1+UTMiqJZId7YOStz/f9hyTaECiHQ6GOKwHWijIPx7iq+aKap
         usc5fo7rU46320mzOSNvqcBop0IwVnQlF/F7oxPoTh5yrmcSsxfjJqAgsZPcG7N/RZi8
         7ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425777; x=1786030577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eemCSxLVEosFJ70MWmOxEAPXsjZ44shUjMRdUXsw+jc=;
        b=YfCxBLyzlNyf4uhJbggMNpupDyD9NoPYWipyoIqiBzaTaHUovdzwZzBii9ymlwOzr3
         Jz88pY+kR72jt1zq5nLBYJuYSaWMQEfPve49Mrjr0VxTFmNj2ECTk7xaJK+B25xDs2cL
         eRbexBsDJ7Wq4je4yV8lD3LPR5akj2bKFkFTSwtofjoBLz2H83MyQWvl1PJxmTN4WXCH
         22EyBHm/t3aSUIh+qecUtwd+O4g2t6u4MnLyHfSqx4Wb0spoXZEm9SqbYwkrNuvMVxtH
         xMwv73fyribqOnz8fawhpQTEYEMuVSWjwJtrX5rBBnJ2c/JlCxUDHyKO7aK3NKGDVsW/
         q/hQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTp+TEtHwJ58jfbPpuz18mvekmC96awWKemco6I4sERomlrf3D+IrE+jGsMNX595nxOCHnRL/18U8YA2mKvqcSCx//Ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOPyW3erBbgQOX+U5Z+Ka2x0567HNrYLmDn3mUNomGA7a5mjfm
	z+Jk4HADF0j3IW3BIWyzm+kS/pZGC0fV/Bf85wuIi5YyIFNWLmjols0Z
X-Gm-Gg: AR+sD10rMoKytGOCiSdrl6bfHLbbVjGfhr2VQMd+jRu7aeZtBqloi4l8wgWh94UQ3Nj
	htpk0rPekw73s8s2tWNrzOgwTrSsREgjJIVFGDrZjkzaWckfeMIUKodVH/wqhMuCsN8JlAPFSeT
	rwdwAXOuX7DVb+dPft15cQyIUEpaosQxuWS7KweqYwTJpJAQ1JgPm2IjYia2I16yUz4QO8jVCCr
	Ucza7xVmIXxAvSMsKeJrBxiBHyYN2ebim52PkkrGghmsX5feLIE7DcVAJYuvuQJWosAnla9gCze
	Bmc85eh/Me1hZkhaXF0DgHu/bjX1gfBrex+j/TAcpEbtGRJAQcJaFSW6BQ+l+tHpcCQIxeQAd9t
	hq5X3qdZdaqp2Bhqw0gNw7To9ijWkNwJtC4McypSyvnp1b4LkDb0gSm+ksTcmeZy3lEkm4vDRVV
	hy0oYrA0WX2EeQmti67e2SounEWNjvwHBulR69jK5eSKDXcfZYovxTsMV664UoefHFZExXWau7l
	t2FNpnWe/ZD/DoHCRUhK7y/5oQ/Mtnmu9Cdsj9EmiTd1A==
X-Received: by 2002:a17:903:1104:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2d03e9b6bd5mr5417115ad.16.1785425777367;
        Thu, 30 Jul 2026 08:36:17 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.25.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a46969sm28820085ad.25.2026.07.30.08.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:36:17 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: rkvdec: fix v4l2-compliance failure
Date: Thu, 30 Jul 2026 15:36:03 +0000
Message-ID: <20260730153603.5721-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rkvdec fails v4l2-compliance in two tests related to
V4L2_CID_STATELESS_HEVC_SPS. The Control ioctls test reads the control
with GET_EXT_CTRLS and writes the same value back; TRY_EXT_CTRLS then
returns -EINVAL because the VDPU38x rkvdec_hevc_validate_sps() rejects
sps->chroma_format_idc == 0, which is the value returned when the
control has no default.

    v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
    v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
    Control ioctls:
        fail: v4l2-test-controls.cpp(942):
	try_ext_ctrls returned an error (22)
      test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
    Buffer ioctls:
        fail: v4l2-test-buffers.cpp(3102): node->streamon(q.g_type())
        fail: v4l2-test-buffers.cpp(3157): testBlockingDQBuf(node, m2m_q)
      test blocking wait: FAIL

Provide a control default via p_def with chroma_format_idc = 1 (4:2:0),
which is the only value the VDPU38x SPS validation accepts.
This fixes both the Control ioctls and the Buffer ioctls failures.

Tested on Radxa Rock 5B (RK3588).

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..37603f049788 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -236,6 +236,10 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
 };
 
+static struct v4l2_ctrl_hevc_sps vdpu38x_hevc_sps_default = {
+	.chroma_format_idc = 1,
+};
+
 static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
@@ -243,6 +247,7 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.p_def.p_hevc_sps = &vdpu38x_hevc_sps_default,
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
-- 
2.47.3

