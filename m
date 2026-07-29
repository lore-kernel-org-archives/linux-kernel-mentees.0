Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698F3B8135
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Jul 2026 06:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305260; cv=none; b=NxiA5/KIA9Aa6U6s7ANpCeI3xUxeMssFZmnsd1ElEFKS/MjDAmbz8zir3SLKbh0O/5fDp2lC2mR+PlQvPMt/NZ1b7lUB4stjomLV+4tSPHB1eNvTmjh7e1JslzKND2SwTBUksTt1dEe6ycdmwyjaxCP1+Bh1n3ukJSwaxD/t/4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305260; c=relaxed/simple;
	bh=/0LTD+YuOEMyez71enerk8KZbgf5cRv7+phqHZi7pfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQPjFKY1JrCX7yWexAJKCwsit+lEdt4Gr1mNec1l3i9MKq1YrPfRZKx5PhFpehzUAvz2KXdT1g85dsO71warNzKC2bF41gW9YGsuv/btMbNHE3Wx0SFBRy2xy83PzxdTVwLoE/YgH5KRE1LvHpttf7UqI5h9DOtiR7L+YNiasGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcE2ojRO; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcE2ojRO"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so483445b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 23:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305259; x=1785910059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Au3B6tmLC3tMUt51a77RTkKN+/zhxdhlLpZElLCtiTw=;
        b=NcE2ojRODFBflCADe26idUiev5B3fyxHmfvolRbXhbJ2uL6Cq2sV80BHnEeGdW0YL5
         oDjlKAms7VPP5xYB1Uh/ymNUDm0zRFF8wki9VPE6pCJ70aBNgZleda50tEtns5DAzOQd
         1zC4jDiAOs5sLBymX7uv+nRoo2CwyuqyMXE7TLfLGry9vH4xhl8QT904P1Q6pcW1dFmE
         HhyHUcOCYaRDpHXs6ALQ28d8fsiDLQbquEAA9qeiUTlhBQq3lJtHd2g0kBj+/2eQlgWj
         ka0KgX+4jMfHM8Jf1Y0ybhAHMxsLPfNbmiBeLabT6ExW8Elf99F8XIMH5S2htTUgymWK
         neVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305259; x=1785910059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Au3B6tmLC3tMUt51a77RTkKN+/zhxdhlLpZElLCtiTw=;
        b=eQNgLpQ6unSEfTZ4l8yQfXDQgkQnOAKHZXaLsowMQ9ubvI7g2ENDV4Hcj7fM2Plfys
         wY6MRbZNvdH8fXnltxhn27ibLxDNgEA5+nj/lyjAFML0RlMb+sz6A+4eT47GES9auIne
         llyl3geMuM8TvpGDdWxjFRWeEI80Z7VZWfBkFJdmjwQIAItCImywkvJEsOJKcZlf0yUg
         71rC20dY4PQByz+Z+p7gvJ1yesss3GyeRz45jJdxwGSVS3BMETe7h1v1qFGsRrZTwC+O
         nosatxHpA58n2WQFJGg5oqKGQHxQe0qKWqVa9kcycVu4rBUwYvNpb1gwbWQba9/VJzTH
         LpPA==
X-Forwarded-Encrypted: i=1; AHgh+RrU99tmh12nsG0s4/XBjT9xSodrEBy9/0LIfyZgEBsCYl8+z5F5/EhxwhpJaWcW2fbLsEuRnyyrzDA6+MnRz5hQ0v33oA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAl//VvyvsUHwyifqw/mDYrTVVaYvtVU85ZulcSVu2eAEzut/E
	e8aSQR1ZCAESKHP3QcnTG8kEcFgPGkJ868cWztjqXTOU54UGtbY5wwYS
X-Gm-Gg: AR+sD12oKCxgkvbp/D9rwnD3DZ27LSIe4ExSYGGdQbCX3uIDZiiHYE2SVZF8qbkth/1
	mDj0kbB2lek1bWJQ6xTC2NnIxSi+Lkio8ewU/s+/o2vdNCnHflhBorfwlL8B5WW2emBVMae34Q4
	89eFpmc4m6MjpGy3vdN2th2yXK9xBCD43goyuTMl3aaBYEna/Pu3+xb5PoRZnn2fTSUWeEqr333
	jx3+CnA2BZulS5M7rqOk5F6UqAZfgPb1M4ojmfwUkzWx/GhlyX+wEGzyJeZAbOkhLJB4c7+6mGD
	DiZ9P5bTzP6YNO/iQ/tuEhLNFiG0gvkRZU2jMPD56Ys/rYODA3RbAGxvZb/PsqGL0e+Osolfljf
	KMV1r8T4IVgvxnddpGOwKk6rs0JlEhSxNn3JIj6zHnSgjmxYZ/bcShgEXd4VjyxKn8LdVsCxozO
	41TsCM5mvYeEOPmrKFDL+mYAQnvz3EeG4XRlI6pk1/Gi0NVM0yEpo3YP/6kCMblHPIdnNahVg85
	Qzq3LtEcpJcyMZ6ADWkuCPFwppdPcYd7aR/U74x6siNcsgWBqs=
X-Received: by 2002:a05:6a00:399a:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e932ca215mr5555635b3a.65.1785305258751;
        Tue, 28 Jul 2026 23:07:38 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:07:38 -0700 (PDT)
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
Subject: [PATCH v5 2/2] media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS
Date: Wed, 29 Jul 2026 06:04:40 +0000
Message-ID: <20260729060440.2092-3-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729060440.2092-1-tharitt97@gmail.com>
References: <20260729060440.2092-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime suspend and resume callbacks are currently guarded by
CONFIG_PM. Removing the guard directly would leave the callbacks unused
when CONFIG_PM is disabled.

Define the PM operations with DEFINE_RUNTIME_DEV_PM_OPS() and use
pm_ptr() when assigning them to the platform driver. This keeps the PM
callbacks available when needed while avoiding unused-function warnings
for CONFIG_PM=n builds.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index d6fcd4f7f9da..35302cf9f233 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1284,7 +1284,6 @@ static void hantro_remove(struct platform_device *pdev)
 	pm_runtime_disable(vpu->dev);
 }
 
-#ifdef CONFIG_PM
 static int hantro_runtime_resume(struct device *dev)
 {
 	struct hantro_dev *vpu = dev_get_drvdata(dev);
@@ -1314,13 +1313,9 @@ static int hantro_runtime_suspend(struct device *dev)
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops hantro_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(hantro_pm_ops, hantro_runtime_suspend,
+				hantro_runtime_resume, NULL);
 
 static struct platform_driver hantro_driver = {
 	.probe = hantro_probe,
@@ -1328,7 +1323,7 @@ static struct platform_driver hantro_driver = {
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = of_hantro_match,
-		   .pm = &hantro_pm_ops,
+		   .pm = pm_ptr(&hantro_pm_ops),
 	},
 };
 module_platform_driver(hantro_driver);
-- 
2.47.3

