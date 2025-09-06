Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343FC315D35
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  6 Sep 2025 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175749; cv=none; b=J3oy4O0cG+3Tsdzt+A2hxEvVZlMJiI7rIm1xGLVWRtMMpAyjlf2JKoePmBQ820C+9hTvm7W7DH0Mga7YyzX/9/w+qT1mifAqD6+L3XRLQU9Sak2Qh4if0Keadggm5CDFFb96rPrBGJPqy5QG17FPk3GiMKMYVIh14T4chmT8o7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175749; c=relaxed/simple;
	bh=voqz/lldR3MtvnYRpvt2t1gVNeBXyIkE5wcOtOujWOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7hK0lQxq/C+wZVe1JVY2cOiYkQPkJhZ73Kgala7q8o4zKslrbambLSsjQQ7jjAPc4rK4VLgj9x7c1u3tA1lku1Z/CfMTjlxZtF1UPG+Tuo4Xq0DjFJBuOESdc7gTyNJ0dsMwm371U18ltu4sFuTCDK9o1H2NI81t6O0WN4yums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEuHwxRL; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEuHwxRL"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7723cf6e4b6so2385817b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 06 Sep 2025 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175747; x=1757780547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQo+kYxh5d7uaeK3dTcGAsSe4ub2bXjjCadCyIZbnuY=;
        b=nEuHwxRL8eo29dCPvhXatFAbLniyyXhWKAMsDwGb0ucWkHuPZ6Iw1MVbmQo9l9dLEI
         J4fm6RFyIzSdp5z9+CH+OV9P8TRqwOKtqkj+XczJPaNwEtlL4i/5tZO68qFDth0lfRP2
         RqTeLUyPxyCpC88JmtsxfNKYrcK/GUvdAlLbnr8GD/IvjG/sXWY1r4F1CpToHou80RLh
         45ucqblW6qi/fj6SbpciXB2OSAvoBuD+iarMWVM+hfxQdNuNCdZnx7nQhbXTngJ0tWBB
         tErUaqelUSihft9DJ/eIONAjFLVKtSbkJIwYrl4oST9a0xGzqBrHbYt3pzH8JO9eilI1
         J0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175747; x=1757780547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQo+kYxh5d7uaeK3dTcGAsSe4ub2bXjjCadCyIZbnuY=;
        b=GJjQcybuk2W5qyN9rZ6sW0/c04nfzOIBPqLimKJ1bPK0rEkT6IiMaxbD96B9BEyaBU
         XJy4Wp5Im7bJjy6G7SU/K/6vxHNwuDI4dHLk4MgMpVwTxdAHTaBK2sVUDAQ8J+l+PhGQ
         K86p52M+m6YWUlluCe0XsEiAbV3D2rbe5dgydtu2XR6FwerzGnpNHygnhM6+u5tTgGTI
         9LY4yHigvaNCIJhBIJTiinSFTq7rtpqiy0Qmdd27mzSIwz7AfPjzgZdnJJa5UcaTNayi
         83txO8J97msbF8pS3fW2oe3juMMAESjTJjLB4hL00x6A60FqeFM8dBtrSrgR4IGCxFfs
         CpGg==
X-Forwarded-Encrypted: i=1; AJvYcCVzvL/htSpv1u7iCTrFu+Z6c8hTW2igT6owrvQMOqremG3VK7HSaqVZ4uP2R2UhqFX7JMF9U8xPOXAslq7oL2OC1o/CYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd4AjBuxY4Q5Xy9fVs20puF/p08AGGhEQJL71nSomNhbfbWGc/
	efvdPbW9C6Ovj4gjj9OSqofIwVq+eTZDr3TVxqTYR8eCfk0HfeWKzDZt
X-Gm-Gg: ASbGncvmBqNCx8Ga346Xg2Lh2KSeH6vEhBHSlt7bcIqJ800hCJfrxs31oKK6qPGeqwq
	j/qrnnH+3lmSpWaqyqOVJADVQIPW04g/GTt+rRw9bb8oiqPKu6P0+FTtMDY4MCJGBhY4u/AoiTJ
	XXPHRgBamHZWGaz0fKQOG0W9Q1NbsB+n/ywEAXJ7grgRCYWewUGAtOOtSgphvj8tO+a8ISXizYI
	gr4IC24OXsOjXsjO1JeyXP1dyg/Wl7+tkX+f/gq62bQfOcoou74EoG3p1puVcgNftQYXYGRYJAU
	5IR50XKHIPC6qy/dutKpOWfa0tFJRbHTKrgqEJRUmfhODcKyhEHh3xUS8NHvyHmWdM+/AqqYQgN
	EE4mSX6h8jHv/lK2harFqXnoV2G/JBlcA/7tsx8qnOBvqSJ3vT1jnPkb9K6PK64dOvw==
X-Google-Smtp-Source: AGHT+IFWoRPvvlOwfAtgp1V1eszZ5qd0gF0gJ/wMnrLO7QEtTJFa/jslg9wulGzvHPRzNw7LtCBnXw==
X-Received: by 2002:a05:6a00:1a8f:b0:771:fab2:83ca with SMTP id d2e1a72fcca58-7742dc9e36fmr3285197b3a.4.1757175747387;
        Sat, 06 Sep 2025 09:22:27 -0700 (PDT)
Received: from chandra-mohan-sundar.. ([2401:4900:632b:25cb:f51e:8e8e:983c:5bd4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b362dsm25103474b3a.32.2025.09.06.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:22:27 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	phasta@kernel.org,
	linux-sound@vger.kernel.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] ALSA: cs4281: Send the PCM period elapsed notification properly
Date: Sat,  6 Sep 2025 21:51:54 +0530
Message-ID: <20250906162158.564899-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of spin lock code cleanup using guard(), a new
variable (period_elapsed) was introduced. However this variable
is never set, causing period elapsed notification to be not sent.

Set the value of period_elapsed appropiately.

This issue was reported by static coverity analyzer.

Fixes: 7a5127c2c8a5a ("ALSA: cs4281: Use guard() for spin locks")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 sound/pci/cs4281.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index c519fb9cdd1e..d00b2c9fb1e3 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1752,6 +1752,7 @@ static irqreturn_t snd_cs4281_interrupt(int irq, void *dev_id)
 					chip->spurious_dtc_irq++;
 					continue;
 				}
+				period_elapsed = true;
 			}
 			if (period_elapsed)
 				snd_pcm_period_elapsed(cdma->substream);
-- 
2.43.0

