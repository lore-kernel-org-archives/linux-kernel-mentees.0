Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9467733DF
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277146; cv=none; b=utSEkf3GSrOx+J9O/AwiwZtFAcBd5GWbuK6A2lhpgf4XmkGy8LC8Y2HxpVw6ut7MNKkAr35sRhm/nrnsq6iwVl3UVimZ4nD9a8obgSxDoEcxZZ5XWbNKH0Hnl9vTIQaUuxKnQHyjePEIc/h+Foqejh48bfR1K3nZ6wObYN3X9Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277146; c=relaxed/simple;
	bh=IRWOjBedd9/hnuVTcXrjjqnFUAKjZDKX/qV1HyL1jLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVFQW2fzpRyImPe3/Z8/CmkUWgyq7wNmwvU4u/8A4J4PwpYKg75feyIC8xyzZkepGKtOIvCHnxqsTbIjN9KX98tcjJCGiHDorhKpflQC7UviaZRdrkXURBD0kn5fqWRDtrif2W/bvitQlNhCqCsEuHJ5LL5838X/5B9cibWmOBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=Vc98fKag; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="Vc98fKag"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso4018309f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753277142; x=1753881942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jOFjaGN3CsVqLePSDjEetRndyZpxQTsvQQ0tgo6UDc=;
        b=Vc98fKag0J4w9WpBHGO9Dxye9gJyiolFfZxXfKR5r5CXB/VhWB4w8uL4dGOCeEDjvj
         uBt5N0k6NaHd3f6ShRwfjxtQzKTtATszeb0iX3P7AVfZXlVSHHp/eNhSTcve1RaLPCny
         5Ohc+WLRtdNxyfcWDBT6MAjxavrXLpdyCKOwkr7THuMHUpZuRZIl78SHVpkSMQrlcZtk
         Cw5pEV4eV2q3BFIK7enMXtP3m2bJobvGcqAhXB+2pk65kqCVL2h1Iiz2Ib8rLiYI7dmY
         +YSVhJYkxNTtSlJ/m5sII5GAzFhfd2N9Sy4GTvj55hI30AW6B3AwbQLRHPlN9gk+yhsM
         hAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277142; x=1753881942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jOFjaGN3CsVqLePSDjEetRndyZpxQTsvQQ0tgo6UDc=;
        b=VAbHLAYqBDDhRHh+XF76plZZ3HdEgmcaeXURfSYsrubL6GAe8uoa1rV41WS9O2v069
         /knCFC7d3bcEv2wnj0wUI8FJwXNx//c5CwrRyjnoevL3iwaHcy85MBrW9VboCNGGvxFG
         l2/Qi7P/A0mAzat14w2TTJk3p8LQcuAn8heLK7SH9Acd2MnxRJy9OdeOcikYpZROCmXz
         BBm5TDHVsTLoDPKhN+9b81sThu/uQYiiE+Dsf/Mayu9xjSap2nlI0CwRtZgjMIoSNMPI
         cchd/qzMpaXktvJbrJYRtusyTkjcwatmEniMoQIPX078tOZVxJDoE07L9Y23Buyc+x8/
         n60w==
X-Forwarded-Encrypted: i=1; AJvYcCVgu9Fjx6HEFRgAMUBDsuxToH6i0LriVrMOJO/qsiJbLectXRDspU6lS6V+HS5szdRAlLfVIIi5igmgs/Q1Lf6Xn+tptA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOA7KVmBYeViAZlidJZxpp8FJuE2tFBhqei4tAB+sS9MquSFzv
	EwhjYalwPB5Ofg1+MXIcuphRSJL5w9jHWqonRXvEBhqosvkuI8HVYQlnT7wM6sbeadg=
X-Gm-Gg: ASbGncsZm/0nsQtI8sf24tSj12H7gfryYlwwA8TC+ooKhpJ48oF0N3tc0xKxnzRjvLc
	Xoz+H9vTd3pTVh7Dl6ICTFAEueVnJl2/SS1++/UwIhbG18WsP+MugNUt7TYFviA+egW97YoHgiJ
	f69DGUUoD/j8ayRPIUp6v/Oo0TryJaZtptYM/9iP2eJ86PtKQDRzdj6O8g/z7erJrJFBBp++hGu
	b1m+QH2FDiNsqwwI8xK8UJBI+RM+WToHH5Amj26ORp98OVgc93xLkUjWd7OIHy6GBXkbHRBiiAQ
	0m5PiVP28cNzboGlLYMSSAzItF8lLGgN2dxUeJNwhbGjcd3iTuXafk6sYqQCsqXfL+jKrdXriXK
	P6mhFcxK3dxKrRw1N1asQuUHmdh+Tn20Bs56O8yfDuyR0e4NDSA==
X-Google-Smtp-Source: AGHT+IG7lEmEEOErHvtFjRdp4cL9IAeiY0R7yViDRurEsfQTfNPWbZmrOYW259gPKET6e12uFu2ovw==
X-Received: by 2002:a05:6000:288a:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3b768f16391mr2725907f8f.53.1753277141746;
        Wed, 23 Jul 2025 06:25:41 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca315basm16320109f8f.39.2025.07.23.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:25:41 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: sboyd@kernel.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
Date: Wed, 23 Jul 2025 15:25:04 +0200
Message-ID: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function spacemit_ccu_reset_register() allocates memory for an
auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
these resources, resulting in leaks.

Fix this by using the appropriate error handling path.

Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- Properly place the Fixes tip.
---
 drivers/clk/spacemit/ccu-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717..5bb85e32c6cf 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
-		return ret;
+		goto err_free_aux_id;
 	}
 
 	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-- 
2.43.0

