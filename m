Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3752DB7BF
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Apr 2026 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336339; cv=none; b=FJBruXvrSBwz7GNpVS5+3cFR86yH73zfS5JyIXgFcY05ZuhW2zlL3X89HcgK90nRd4FTT7y9CBGkFUClE1CRuKx5l/GOC+Y9R294DHteZ4fcKH3OEfhAIIwMoRme5BBCJDH/Mpvnoq0bllHEwDHM73BAULc4o/KpvkbWd0G/zos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336339; c=relaxed/simple;
	bh=9nvdIFs0RiVU6vxasKbbrN5eV05nBxgSym4LflyWbDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X3HRcz+LQtF3ca5J2WtWwRkUq9Bk/5iirw7RoCMdp/xn0N7KPTAB7T1yTvADOoEQJoEmijzIWJY4E+CF0lSQiapGL6stMTMb4cdjAMb6UP5iQKmCp+QB72//TWZcuvk/ZzkWDFANeCzuDezlVAtQAeiTPAEll9SVEB7QwknG51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMiNeu6V; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMiNeu6V"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so28779305e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 04 Apr 2026 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775336336; x=1775941136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duUyI1SAeNVm/Wy4g4Wo7s4yIGMomxToV5BpPoZ9vuI=;
        b=jMiNeu6VBtveGTzOI7spEgPujcB1TaPKb7vTVnOhbQDB8MmtZV6aL45N7jGYe/fukA
         HSFQboN+xBtEEse1TKV9ocyEX8XIjc01kHX/s/bqlx2He1MT5F65T7rmWmupqO+lQyTT
         jQlrFt47BYJ3s/PVDFwJvznhhv/FYgdGNBmnUvC8wfV/VjT8EV4asoKWUWVZIG6h4Eki
         TiammBaGrS3G83wWuKtaxPgThaV07nDA+im0vQphxKlh8WOLI25ap+DJendfFO8fXTMW
         7iu9uCLiNo/L7iIXOvAeKnMX1x4LLv7icQ4v81aO61CEersukVrb3PCq0fc/+VbmA+WE
         SX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336336; x=1775941136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duUyI1SAeNVm/Wy4g4Wo7s4yIGMomxToV5BpPoZ9vuI=;
        b=jUffFOiCSPXMacdhCagymHFV8alQ8bKFGzAFBgR8ppEJNuVCrNqP4MM14wSppqdxzM
         5wDfQKg34+5dOFE7pDV7sJN1bQsIaHpiEtZdUObqty9XeLxDCAYw0/SlA6XVvr5klQFh
         wL1wIyciBlYFurSc433wunWSwvP4L/q1kdpHwZJaaBHqf3vdAMY38R6zSDqtZJVd+UoI
         LXr04ioj77YfU9GdwnlGnvGJJU64fxDHJQyb16DHUzuo33Re3wKSJZo9obwFmUkz/6Wk
         +X/mYSNxSGqjV9VgCICejXHteOYBjeOwLeQVEjr+WcQnUqe8G60L8u9JeHwZs9G93wyE
         4Tgw==
X-Forwarded-Encrypted: i=1; AJvYcCXkzAGiMpfw5IlbyMbJdXiJpdv/zLZJNtvDfYrzIiXCvi/rBP3UhcNDelf8l4orimNsHGLsaNqo1R3ivQSQnxO7iYviRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZL/srGEQV+SAuUA16muv2gQktthdXte6QHSdDFQWfmjtQlOv6
	2ieL+i31UpFSoQY0qFq5s7lJP3v0ZNmRlRsF2LVS2oZumvv0tGBAUurn
X-Gm-Gg: AeBDieuMHs9qAJg2xRTk0Eu7rOkil//KR81UInX4YmT0591RKul8JAWyzdZuYNmnjXo
	Rs9qhpW9/RP/Wz/ZwsVbvEPYRsODUTNwjkCKaxKe0UzxNrv4JMa5P8lQNKu3P8q8VR5k7f9DfiF
	l327CIA5PMXFUNHeNKRzyI26XmMg3SK/5D2DI4f91UbXZ4SQ9vuMZaoqb7nKqEtby8BBONMoTAm
	MqUPNqLYjQpBq39/4x8sT2xkuVC+NUU9VORv08utNDKpGybmilXTUb39SFdGPQyCn7CnPiHHgX5
	tHpr8eLKaEFLSBM8VC12koepIO68Dnc8vnoWqWfaUSpa3ZA0dJbhpZ3I8BC5nrEK1OQLNAvhX3I
	9gqe2n0c8cNgooLq1Qf1tanY/yjsFaw5rqIzXKkhwa+yACR06G73o1KY+3FIwkW+FOIqQRw6OhF
	KJTHZSf3azV2XQy/zjsnT2VOFfWoMtF0sPTD85/o80Dy1CgZoIunKc
X-Received: by 2002:a05:600c:3042:b0:488:a25e:14b2 with SMTP id 5b1f17b1804b1-488a25e153amr36322295e9.9.1775336335750;
        Sat, 04 Apr 2026 13:58:55 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([94.164.143.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a36f22b1sm84749535e9.10.2026.04.04.13.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 13:58:55 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: ktsai@capellamicro.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	daniel.baluta@intel.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 0/2] iio: light: cm3323: fix and cleanup
Date: Sat,  4 Apr 2026 22:58:50 +0200
Message-ID: <20260404205853.18559-1-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a bug and does a cleanup of the CM3323 
color light sensor driver.

Patch 1 fixes data->reg_conf being incorrectly initialized with the 
return value of the i2c_smbus_write_word_data() instead of the actual 	
register value. Tested with i2c-stub on a Raspberri Pi 3B.

Patch 2 converts dev_err() to dev_err_probe() in the probe path.

Changes in v2:
- Patch 1: fix typos in commit message
- Patch 2: add struct device *dev to shorten dev_err_probe() calls
  to one-liners (suggested by Andy Shevchenko)

Aldo Conte (2):
  iio: light: cm3323: fix reg_conf not being initialized correctly
  iio: light: cm3323: use dev_err_probe() in probe path

 drivers/iio/light/cm3323.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

-- 
2.53.0

