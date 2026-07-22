Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C28735F170
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Jul 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736515; cv=none; b=JxrkJzyLe4/7M8HVFzdEk2BeBoM4qm0RrUkDjc54fvkWCNNmnhawroKAry3BxKxM4oWh6vH2Cr9zNYNnA9X3rooZg4Gsvs3expJpe8YbTD9d22Rjc/i+b74qFVvfnU4tHPr3cQ4SqD25kmADOyD5fqwtIrcNErFg5819RQ5+QIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736515; c=relaxed/simple;
	bh=dBDV3Nz2W+SaK9NOSESL8fUFa+cz4Y8LfqqEjxW+iH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mb3odhX2H6jonDo7EiYlT8oSja1q0uwFBc7ytyoZt67ljY2RGAxXU+l1QnNcBy3LBNEInB7bU5bTejUjT3Buu72KAGcKdSAdsXhnBAbQ4liGPgo96nu23nAgQ87z0/qDg2/yrVvZok+fPICtpXhdAk+hFB+3Op1YaXhchRIsBLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd/cAn6A; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd/cAn6A"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a2dcede83so12514899b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Jul 2026 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784736514; x=1785341314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgrQnMgwlgoUFEsEQmGeH4aaMMul+JyM5frck2aQVIE=;
        b=hd/cAn6AIFazn+bDqq3/Ve14CllxyE+mJidhYHgpskFJoAFT8SndkonkhkF8mhzpKM
         TDGoHI6ecp0cQui3aNjSHw3XNtpc5pEL1hlkR8yE5f/5F4CZiNd0CVEmU0HSBAn8BXcp
         Fe7zdMMBC1kxgvDE3myC9rg8UkociAF4ZiJ3elmFnvUq2BX4l6xMmycrJ+GNsYDlJaxX
         RtaT6XsFWukf2RrszNbyX/5KYbXzAgwnp/Ygj3MnLpB2uHOLJynGutFQpdOtzzi36fej
         pkSeyz7psI44Ygwh19zB9zTtXKfzler0iJ7838l2FD/Q7NMWQdWSXEZ418gI7ZpWV6JB
         oomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736514; x=1785341314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgrQnMgwlgoUFEsEQmGeH4aaMMul+JyM5frck2aQVIE=;
        b=PmLuAT6oVOQMZbIVuM5VQX5vxyflRTc6gOogir4AO8TlOMhmK+eP/FevNVKuyatNq7
         JJWBFc3OrJrAY7rhT2tK6HFT66ccvTSWfKCn0h6zbrDvYof81U38jK8CqcVNclSVCXLO
         6m1lp9h6TbDcKj03XZeT3AYAhi0STN0j4/JW6d1Dd6jTotRnVTGpgiWeG9DBacqDQr91
         A8TVuUk70p1fj9hV8ha74fFbCC+/5/+wle9yGyTQ4TAQP5iM+R6x8zJOzao7cCC4g7Cw
         6MDVTvcx2OeVlKiGO/WdLcMaGnLuOEvNor1RUuCPmnD+7UqF4nUGaQiv2O++fs7r/pAu
         yqMw==
X-Forwarded-Encrypted: i=1; AHgh+RqpEsP+CH8XNIuQ7DgImitnvEbbBx3dDF5qEocrINoa/lHvCAdtIb/iy1uLCNB5R5tYvyksPI8dnJcJm9XriRZ3t3JlBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+XlE1P+sCQR0qXlbqVf0MHpkhXlMLPP1tVe4iLFivFcU50s05
	q3vKsMV0rmnccxs7dJVvCXWqgAxegipv6aZJOs9QscOcABdxNidPY+bT
X-Gm-Gg: AR+sD10ZvZtKQPOeFgmwgtA4slcxPh6UaSf/VNrLiE2kOZRmhywrfbOlvV6zc0sfCgp
	QuWEFad+dEbKXqyG6B3N7sWpv4MRrVsStY6VvXzQHSBEiK5TzzdmxBMdnIQvLBCdBOHX0pYR/3Y
	eLalD74Bb/1uKJvJZN1YpIifts8RmLoXkvARJpBLUW4mt0BxnLdzU0sQFrEmL5GLmauc/hk5kSi
	L7BZ4vN/r9rFFq677zKKYNHGlyYBrVKaBhjdvGDJvGPmpZ/ovzCbE+2h7BTn32JMnctrFybJZyV
	TShDRVl1ZRPmOvc3axMdEtRBAPIhTnvR+aUOFGQG19KA3BvmqigseiUMuw2gdJMS1puwzVWUrnH
	MzK/HYCAEgJZ3VqT9gpnqGmPCFz6k04IpHRloPzdkkvqTlxS0tU4gsnY7ska2d9lzftDu3k4UV+
	IGooQYM6meNKjlXEhnMKe+lgpLFtBXDH4Ma6fRNq34cdhhoFC/DlFcdHDefNX/k9OFiM2fMgs=
X-Received: by 2002:a05:6a00:451c:b0:842:6004:3fda with SMTP id d2e1a72fcca58-84c292e057dmr23852827b3a.25.1784736513793;
        Wed, 22 Jul 2026 09:08:33 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.136.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175a64e3sm1639440b3a.42.2026.07.22.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:08:33 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcamplbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: hantro: disable runtime PM before hardware teardown
Date: Wed, 22 Jul 2026 16:08:19 +0000
Message-ID: <20260722160820.2401-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing the Hantro driver may trigger an SError on RK3588:
	SError Interrupt on CPU6, code 0x00000000be000011 -- SError
	...
	do_serror+0x5c/0x74
	el1h_64_error_handler+0x34/0x50
	el1h_64_error+0x6c/0x70
	regmap_mmio_read32le+0x10/0x20 (P)
	_regmap_bus_reg_read+0x6c/0xb4
	_regmap_read+0x60/0xdc
	regmap_read+0x4c/0x80
	rockchip_pd_power+0xe4/0x600
	rockchip_pd_power_off+0x1c/0x60
	_genpd_power_off+0x98/0x198
	genpd_power_off.part.0+0x178/0x288
	genpd_runtime_suspend+0x210/0x300
	__rpm_callback+0x48/0x1e0
	rpm_callback+0x74/0x80
	rpm_suspend+0x10c/0x580
	rpm_idle+0x134/0x1b8
	update_autosuspend+0x30/0xc4
	__pm_runtime_use_autosuspend+0x48/0x64
	hantro_remove+0x8c/0xa8 [hantro_vpu]
	...

hantro_remove() currently asserts the device resets before disabling
runtime PM.

Calling pm_runtime_dont_use_autosuspend() causes an idle device to be
runtime-suspended immediately. At that point the Hantro hardware has
already been torn down, while the generic power-domain genpd code
still performs the power-off sequence. genpd regmap_mmio_read causes panic
subsequently because the reset lines were asserted.

Disable runtime PM before asserting the reset lines so that no runtime-PM
transition can race with hardware teardown.

Apply the same ordering to the probe error paths as well.

Fixes: ea71631b7129 ("media: hantro: add support for reset lines")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..bbeec5ae509a 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1212,7 +1212,7 @@ static int hantro_probe(struct platform_device *pdev)
 	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to prepare clocks\n");
-		goto err_rst_assert;
+		goto err_pm_disable_assert_reset;
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
@@ -1266,8 +1266,11 @@ static int hantro_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&vpu->v4l2_dev);
 err_clk_unprepare:
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
-err_rst_assert:
+err_pm_disable_assert_reset:
+	pm_runtime_dont_use_autosuspend(vpu->dev);
+	pm_runtime_disable(vpu->dev);
 	reset_control_assert(vpu->resets);
+	return ret;
 err_pm_disable:
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
@@ -1287,9 +1290,9 @@ static void hantro_remove(struct platform_device *pdev)
 	v4l2_m2m_put(vpu->m2m_dev);
 	v4l2_device_unregister(&vpu->v4l2_dev);
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
-	reset_control_assert(vpu->resets);
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
+	reset_control_assert(vpu->resets);
 }
 
 #ifdef CONFIG_PM

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

