Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F492E62C7
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753274552; cv=none; b=XVy63211wmuy1XwNiAmBDKQRAM5MDHmO1+I2eL44A7DN7eBcpxKQijmI1aac0zQzJ3S/iUbTti02RUPA63aHIhDKr0Gs/T2yN1012meOWh9zkGdasLRrSblhrUoTcFr9yWadURsmnitWCrKTGUckia5UUkjhbA+6GUUEQXeHNJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753274552; c=relaxed/simple;
	bh=Dd6wnE/Sf3IOuD9VVTmszqaQpg6KTb350GWEM4m2a0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCuzsBQHFt96jPZfyYbaZFnVWigAoMC2Vt6FxAYVLO8FHVB1iUZGebuibzC72yHJC38O5c5UWnk+AVw4XuTBxOLSKVCQvYq8HndgxzIzcNpSikXIPoiMMF/qgujb1grXIcRx3zSgx2QqcPBcIGdrZd1cllciAUOCEvvFicTR8rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=p/iXuWZ/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="p/iXuWZ/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so47085165e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753274547; x=1753879347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4veeSt022yF8JfTtf9KGz2ZcsYPnUB3umlBs+pcOABk=;
        b=p/iXuWZ/uBIlJ6eqsKxhZwkJqGaw9Y6zmdpzPDHdApf6eBfNFRWG2B5eHNR8J+Rhvm
         epMQT+qNw5BxFz19Ip0LrOCW4vTFMyCL7xlVzZjPlZmKVZJBnaiIxHuIPzgDohbctV4M
         XRC2FooLLz31x8rrtK1BcXCa+5t37XnDMPl4U6QvjBgAeXWqMSmSVTN0Xf52qCfY9TuV
         DCnHbhTISl7VjJX4Km4o0weAGlI5evrMtGe/HfeVNE4Pdl5D7rM+X4B+CwsDXgXBzCBp
         kB3O5VLJ3Y5SWjAV3co40AsrxnvLapDpASXPFXQxjyAfnJPQKZ55YXJ6dcDqSEiwGRD6
         c0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274547; x=1753879347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4veeSt022yF8JfTtf9KGz2ZcsYPnUB3umlBs+pcOABk=;
        b=qB1QF/1ZVcj1ZyRVRHJvGtaV9HtX39wfubMtTz3HMeck74VVq0YI87tj9V4Nk2F2Cs
         gr0rzXRIrnDnnfrzzTujwM5eYBvaY9jcHeafT4WPeEF0S8PVZ4AdajC5jGqNf+hZjYsC
         Ri9VXUUC/LR0D6SWZ5JEZ6wbxO6XlIFBRcbJO9u1BDAn5844S1ls0Mms6M19ajpijnDz
         xXF+kN4rW/8Zp2hxamGAXI7jYYCnxMGgbiS1KzQhojC2x1RbWrK6T8w4lbo3SpedKtNX
         7tzfA97P7i6dczTAuoJn+nR54h+pbqwPUjTeEVEzwkV7hxceX21BlUVXUVbeGL1SfS6f
         ZQrw==
X-Forwarded-Encrypted: i=1; AJvYcCV9JHmZ5OVjZtXYEejDFAXosFSQtuB07nAhpmtgxQXMBECMC4krfePXV1qwycaLx6e+xtAC4H/GTDdbDIOwHh3ojo5/9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBU7l7LkDd5X3PS4KPqIDzwT1wiN4usGhapmjXDm1jYIDgaewQ
	USTFpLPX4Fg5H6zH2DcTMDzA5KBUsFXMgr82MZWaEL3HrrJzc41gy6B1DmJTt/x6hcE=
X-Gm-Gg: ASbGncthmiMTfOBbDYIlHuoUYgCbHDMpw3pVqPC+rKjrnud+W5TL0rPl/zk9JUoUpq4
	+wz/xdc39B3/iaWv+atSYRCeymlpuNWbPw8GpPb7kp43C8huoAMiyrggJZrLqWP7Ria+/2eybj4
	kXu2j6LzMyd86RTVHLitblgXviLV/LH/dNYuXpA/qHFooY1VlHXwKRkzs1Ng8acm4LmViuBVnGu
	KCJSAJi4pAYDEc89dG1th9ZxbM0YFga5Mq0Tf7spy8KJzhtiXaBVOy+yMvm2/8x6BwQlRRCNZkm
	jsi6WThUP8sjlEUz0VRc1KewFbjOoAvnMDBbHeW8ORh63Kti7+XYgNHW93ofjlrNNM7y14+i93Z
	lRYtJoDoR3ugd8yiTHyeoknpnZL3QO0rRvDDArf+N1QWHj4RpBg==
X-Google-Smtp-Source: AGHT+IGbJ4sHUsE4vetWaUrzV0GCHvxK9m7lFsG6KCeg9nkDSwfu/KGJ+XeTwbxg+UQe31rImyB2lg==
X-Received: by 2002:a05:600c:4e47:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-45868c9d3c0mr26871425e9.14.1753274547109;
        Wed, 23 Jul 2025 05:42:27 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458693ab0besm22035165e9.36.2025.07.23.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 05:42:26 -0700 (PDT)
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
Subject: [PATCH] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
Date: Wed, 23 Jul 2025 14:40:20 +0200
Message-ID: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
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

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
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

