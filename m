Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D61C695
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752327376; cv=none; b=FJqYeCQtWvnuqsGjwR5WO/gFvmt8czkJvRFDE6aSdRPaFzI9eQgbn1PcYvEarqAnVMLmOKZW1zc0FsnW3zS7ULA1y8H4akhU6Gl5VNDPN31mxBCs+57cv7nmmCBooKz5EznqzwJX9iPyQioNpQHkXgVIaMoquX18PUZxXMyxmR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752327376; c=relaxed/simple;
	bh=fI+EHGaEFFccDbypWav4Dk55fmRU1wtd6n3cxWUVsGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U439KiG4rknwww6n2M9go1h8wn3reehqk3fyAPGErOy4K7oAk6IPcl2fZxwf0ojIejrMZHV7lfHyk2JD/2ZB+Igxtnm92XbsHsVPp2ZsyogysNu3BS0vvduI3dR7vEvJePic7PEnB+IJvBEe2AN2qJz7Hfh6Ocb09dBCM1Tl6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgxEIluB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgxEIluB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-454f426b3e5so7026805e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752327373; x=1752932173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8pUZ0sv18MpoDhK/ify1e8p2zlKRVv2EfUxVJ1Ymfrg=;
        b=DgxEIluBrf3fl6w0tKRT5rob76IuwG9aAYFXRRjZatDSKr3VSWqCzAeiX60G5MAhVO
         10T47hHS6VlvMdNR2z32amGg8DKHBxle3RaidZHJaAaMY7Q2IJ4ZJhmYnc0Kmf0OS5vU
         yR9Y/b9rI/ZLHmx6ppd2I2y3DnJBa07xZF7LuzMf4C55f80p2PwrLCca9LdIfzZKFSTw
         qae3vOzQNCHh7fBJhpVBaHL4vENougydhb2RVwpU9g4eKs/Z+WedZlzIDI6j71wYZpwu
         /IyO3LxyviCU++wQ8Vs5xQ73drTQ0/duoYGPDhFOYNvCl+bCvBcN5QKjRwPycD1OJFMg
         47OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752327373; x=1752932173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pUZ0sv18MpoDhK/ify1e8p2zlKRVv2EfUxVJ1Ymfrg=;
        b=Sz967MSIBcrwPrUfKfXHUUDld/6Pmb3Y01EofT6M3zhWaWlbeemdInOgTQvktMKjwJ
         Z06cGDeA4JKdmhQil7pGNZtuDH4CBtbnrVpm2T1vRlZ5Mz47MaaTs8G1tiNgO6ZrsgZU
         josPv2Oa8SXxqUTF1eC9VxyCbUdiNU9DUgDvu4QHCxoAbrmJ7nrObrWfDac8riSmXMv3
         G/ZR7LR/SZVZfZm07FPsoJZNC6C4SHfk4YPPBJ8UAv6pZ8tjkNmqBIMlbMS5GaIlWkTU
         QsrFRP34LC+TMZOOzS5at4t6Hc/itIsbxhfFKhfycq9h9+ggo6fOATr4ljA5JqleikG6
         rzAw==
X-Forwarded-Encrypted: i=1; AJvYcCX8uSEpl/VFJFLtazVcvZ9rQYvufZEKgyo5XGKIkDh07eCPnMlTLRFP73i4OBYKZlH5uqKDoRLLV0LWEYEKLl2ov7wxrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHmo8Nmymzw2FFvM7M0btenb2xoFaW3VZu+ycR7XbvcA5nb/57
	gOt0vRv+qFgHTj4GRUiEtU5OM14SdcSFR71HXLJdXZug/Rb9zEMXJyJj
X-Gm-Gg: ASbGnctrdq3oLaczejRdr6OY7WwSHupCvvgkk/d9OUzmLyUAFiSb6Z0QWfpvI1YBNtq
	+LvZbvhO4cPu6+nZeuFaHUKZfOxNUcExkFSSrrRDvJ91yfhTunkPVn7uO2MelDt3/PvE3MXUnmO
	sWy3Qi+5pePCJ+jExCsK1ww8fQmQpOR8KBsRtV7hKq1ePxoLCVTX+1aGNcfbaKeY6qHhr4fZXhg
	X8kUpfCACgF6f+9/gpruKu7pcvzXnj0RULBqjZnI46ZqcSFvYdsGOcvqGKwpnvFsWe5vPW1QjuG
	HlEJb88FcltcZJYvutsypwb49Dzx4Z9jisy25Dvghndp/4AJr+D2F8gm8RzPEgbdXkdIItdUidf
	AYaqeZ5H1Ed0dCva+DEIPUzTAPapXsZALAKeKGv3Qh/Pq508=
X-Google-Smtp-Source: AGHT+IG3HASTYf7cc5krk95istZ2ht/IcmtfyDDIqZ4We3a9kVh2QzYvzU9kqhCv8kKwdXp7OVDDlw==
X-Received: by 2002:a05:600c:8483:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-455bd87a4a2mr54822445e9.4.1752327372582;
        Sat, 12 Jul 2025 06:36:12 -0700 (PDT)
Received: from localhost.localdomain ([154.183.63.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc201asm7241267f8f.22.2025.07.12.06.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 06:36:12 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr
Cc: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] can: janz-ican3: use sysfs_emit() in fwinfo_show()
Date: Sat, 12 Jul 2025 16:36:07 +0300
Message-ID: <20250712133609.331904-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As recommended in Documentation/filesystems/sysfs.rst, show() callbacks
should use sysfs_emit() or sysfs_emit_at() to format values returned to
userspace. Replace scnprintf() with sysfs_emit() in fwinfo_show().

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---
 drivers/net/can/janz-ican3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/janz-ican3.c b/drivers/net/can/janz-ican3.c
index 60c7b83b4539..bfa5cbe88017 100644
--- a/drivers/net/can/janz-ican3.c
+++ b/drivers/net/can/janz-ican3.c
@@ -1867,7 +1867,7 @@ static ssize_t fwinfo_show(struct device *dev,
 {
 	struct ican3_dev *mod = netdev_priv(to_net_dev(dev));
 
-	return scnprintf(buf, PAGE_SIZE, "%s\n", mod->fwinfo);
+	return sysfs_emit(buf, "%s\n", mod->fwinfo);
 }
 
 static DEVICE_ATTR_RW(termination);
-- 
2.47.2

