Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235121E2853
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Sep 2025 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744199; cv=none; b=uxpKYxkQ3Dh9raKB9OlpDTgqkAsVDTik013WMxO5fGVs1h1fNFxSKGToKjHmMaKkzhR0qACGVH6dtfXlGLoYMGwXFCO04Y0eAfFL93y9YNh+W0SKrHuHt6yhd3f1Ei+NPfeRiYxyKwkR+JQjOCItpj55ILI/KVehRVaKgM3hYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744199; c=relaxed/simple;
	bh=Cegi9Vay0HmhYLXWon9aWkLCgXSsP0pqKpB4+mmsybs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=llU0+Ons2QZ/MPzt4XAVPyu+saZdfYNZqjC1tPwsS2oOZh5r2agCfkLCOrNnDjgkllJlzdqlI+inJVvJ2CWoq1zY1BAGPd3g9aAByB0SqdBWbvunclHnUCk+9P/vNcKmZtuNwT5LEfn3Rm+tDUYaI5cBVH7WMf+QX3+HRKhPdEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOWrupXk; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOWrupXk"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7722c8d2694so2514851b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Sep 2025 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744197; x=1757348997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVHaqA8d+A2A0VFbozpT9QFVxWs8tE/ZHH5kQY3aPwE=;
        b=iOWrupXkfy16cBISfKFVqgiTe50w06jwU/x6KWDk5gL7yXQqM3V7/tUNFXVBDiICBT
         KoGTHTIQiVvBQu9Qi5kldMu4fP8z/eBXXNrKEpUEt5NLCcAqgMJCtWrNMDDFOVPmQQxM
         8G7TWbI5Wu5bJM+0SekLZCJ28RWMW5YZroBJQSoT0EzTyiPbefH1w3FkTygQzOMX8Y2y
         LGpYnuDnRcunvoLn/QzZE6aDjvfVM3M0NtPxgyTQQdAueOQXxL8XIyo/AEtu8etvgdgV
         jc2GUBW6hqWgRAhyj7q7LzRkv9plMjAlk7AlfVfju1rACDOU6mMxDgJddQMa5bKqne2y
         +IdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744197; x=1757348997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVHaqA8d+A2A0VFbozpT9QFVxWs8tE/ZHH5kQY3aPwE=;
        b=jY0lnfXKSZloFOLaKGJi0CWB3KtQWRuEXLsUiiEixdLnKCyzrXv83O+NrdN4WIKPlN
         2K7KNqIQ/G5hPr6BXack8IZ5hXpubU4RybjwE61rBLziHyZKBvjUQ1Y1nNCpPaauKZmt
         Xd5Usy73nHAF1Z3YLFiaO3S4McrOuMk6R3g/fcp4rMzARvjOcwEPb6Jl0kM5TnqGPxC1
         b3/D6BqnBHwS3ZqBK0RSRrNbixsBFx/BcRM4pnh0GfJ8fdvuzk1745TdkPwnwbgZSVkc
         vt/p4MejnZGfBtq4FditvzG6iZOUEjfIIjehn6fpmGb0S7KoqL9oRmNgk1VPM4PJ8F39
         raQw==
X-Forwarded-Encrypted: i=1; AJvYcCXLTNJDMF8G9CN9Ugp6YNV1muVpKuV6Lhv9/ndD+gVhJqF/of8VTT+7Ydk+pqjhxXf/j0d2QOi9PMbN3BDbpr8Ipks5zA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKfjEg4GhxT4b13CrSPaiIg9ZBlPPTYj3kcWsKmXPHSoyYE3Zx
	a9ccl0ZGf6oE4mft7FbF71y41ZTEKAl2yskOykYi6dnVTap9f5lySR+c
X-Gm-Gg: ASbGncuayNp3mV7c0bLurQtCZ1fTTgyTEQURLHkShMhMioM8RxZvqqxMNh0dEWa5Lar
	SYUsjkblSS+J8/Plle+H4YFd7/l2spiDMFbfB1PEvDgZXXwdpFLoLic3zVysJkAyjf7pH/L+WfE
	LQ9Nxbqgwus16w1HjgaJjK0hpNohbjhGBNYcvQwQIbkSs+k18mRW/RgHlLIv0NQ33MXNziQ63+P
	RH5IHfpVEH8AAtV9D3fD2E8oHjfQ+925fAq16K6vn0mqkZehI1g7i2nXtxvSFO/Gr+Jq277s64H
	qTCCEgKNIJLe6Vj1nYJuoIH9m7h/JtKOJrFDCegw8ANSiqPISTgMlS1lJ0OpZsk9n3apK9VQsFF
	JfW/AVr9ESlsGxgbx7ylKPBPhlzerD4Qce+7SMTXm6Oz01mN+fTfMdvqifTanXXTWSm5odzHxGw
	dbRryI3VhFtf+N
X-Google-Smtp-Source: AGHT+IHDnXCAQnNUmI8qNWb5RwrdWnFkkRDolPpQXrlpFtU/IcyeaIWbVczNvnOTJtU0k1FJ5hH5Ow==
X-Received: by 2002:a05:6a00:1398:b0:770:4eff:a300 with SMTP id d2e1a72fcca58-7723e224647mr8756780b3a.8.1756744197369;
        Mon, 01 Sep 2025 09:29:57 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com ([2401:4900:1cb9:9f52:dc55:7aae:b6df:e6e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a3e3sm11231741b3a.13.2025.09.01.09.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:29:57 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH net-next] net: macb: Validate the value of base_time properly
Date: Mon,  1 Sep 2025 21:59:19 +0530
Message-ID: <20250901162923.627765-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macb_taprio_setup_replace(), the value of start_time is being
compared against zero which would never be true since start_time
is an unsigned value. Due to this there is a chance that an
incorrect config base time value can be used for computation.

Fix by checking the value of conf->base_time directly.
This issue was reported by static coverity analyzer.

Fixes: 89934dbf169e3 ("net: macb: Add TAPRIO traffic scheduling support")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 290d67da704d..e9b262a0223f 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4104,7 +4104,7 @@ static int macb_taprio_setup_replace(struct net_device *ndev,
 		return -EINVAL;
 	}
 
-	if (start_time < 0) {
+	if (conf->base_time < 0) {
 		netdev_err(ndev, "Invalid base_time: must be 0 or positive, got %lld\n",
 			   conf->base_time);
 		return -ERANGE;
-- 
2.43.0

