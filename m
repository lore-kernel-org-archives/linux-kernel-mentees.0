Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04112E0409
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 24 Aug 2025 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756059276; cv=none; b=Wv5BRlbTXxKI8l7PUIhKpmVZT+oib1BpIoiiHlomHwXoR1Pm5QU2iZwIJHtlXv3NB5pvX6ugZQ711yxklasEh4O06072akGkjWQCSLCUnjRQ2b7EuFYH/+bV257ASV+9TujRgLCV0YfMU24nfDCn927ke3TpsWgVaFgeOeShvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756059276; c=relaxed/simple;
	bh=E6qlPit+0JLaINuwDuMheNspfBMT2l7NIZsN5O8KaYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pLhbPnHuEIntb8AFJiHs4JHUTwey03xSNByErYOcVLJxUSw21OKLz8RILom4/h9vqY9fDn8P9DEYAd6S6Ouqq/tTldr/aF9rijtEp5BAGnLj3cihDFBIz8FrKKhJZTl2F9VA+IBeY2bo9DL/UlMbYBr5iQP82Cd2fyzr8DUg03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9YVI0Y1; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9YVI0Y1"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3252589a4afso1719604a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 24 Aug 2025 11:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756059274; x=1756664074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsEKZRNy8m/8mJKxoM3IpgkHHrCyJtWTph1N9Xq1rI8=;
        b=A9YVI0Y1svWB9ugPmK+Fp2EBG4Z4y1dHCoGUWEtgKspNDmOeHHSJfQSsLBsa6V/XP3
         bMdQmaaIFfc3ZpBCR7purqdK0qmg+0BWJEWLdhqIbqZv3NZS9xvvfF5ITPrXBtBL8Jmv
         mxK2ewuN+aQmKLTGqp9ArPLQj8ZalfL2JSWgVTfAqU3RpzuwvapefWtOxfNiEL56SirB
         J7BrCLD/weCd/jg75rZCoJhoBZQIu56PaT6SAlomQRoXe32YyLdlPzixo0AghvN5E73N
         oAt4zFcujBpoVnb4Ky35x4ifldqhg+elxRvvm28Imk9uzXUf4s99iQ9Q4oZGC9Buu2z6
         GTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756059274; x=1756664074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsEKZRNy8m/8mJKxoM3IpgkHHrCyJtWTph1N9Xq1rI8=;
        b=FQlJ+UBzUzQcTIy33sGuV9KLawE3NI/IdZArZoRbUEUkJMOsaoXgTw4BG4L3/DbFLV
         vtHaT6Pu7pKxXreROj7ZKIE9OcQFtMCs4ibCRmbFSlBIexZPGOJFlxC3NBiurKl2ADGS
         qEL4aFPca8uYTW+9Eff3GdwYtXA0CtXr6IHdLyZCLsQ194HnuDuR7LeHiWwDzPWIquAK
         +qhTaNd+I9PL3FaIp7vHxQbviitmxIWxWtfvO85eNDxV61xLk94smDFPBFUj4Nlxg889
         lDiAMmxibXy2gF7xYlnKQ/mw5b4uZniKD0dF8pUTRJ47CxEwwE+HMWJTyApNkv6aKC4F
         O+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXesLqv65lrHbsdPvNNlFk7y0imSXdaZUn2mJIPqBewem/WRjp7NQIGEFnGoK3mutlk6/2Ciz5eP09OvfN75IczAT8OVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFLYq0V4piKgCQWWcxjLsK9anqKF8MYOA3/rSLO/ayKlHZhxkf
	LyO/Isl5Pzg5Bc/Omx7ms5PhYkVUyStH9Qe6lXuLAM59sc4zLp70z3T7
X-Gm-Gg: ASbGncuzMozV57+0KGiZU26H85ToLI/Jzl6igQbChqFeXMF0pmjo26RHgvP+5X4hkzT
	rISKQ2iFK3IQL8dw/UvCn8Gx3mwFwhCMbd86noD+867Ew8Z+jev4FE9Q3F7W5Z0VD2JQjJ9+Z+9
	5Hv5b8Q0A6DHHb8mW/WkleN0DQfqpAxnWjwHJ7reY91d4dV4trezS06NFV5L7sUtT+UaN8Y4pvL
	V6JcWFl+FbeRWnHGe4maZh1N523NtlJmfSSuct24PYiBxgmdmeRLke7xE7m2FUDQeHrWzatpbRk
	owxCWg31GBIhz30JSkrx9fXZrzaFNH10CiOSOawRAADSSFgCAysqcp4DJACWhDgNSVdC59wkNp/
	5K+oMFK1yLwBymuJeA/A5z53C
X-Google-Smtp-Source: AGHT+IFubpj5H1hvOrgzW5L0eyEspCbDndCahow9ISpyF+VK4PFOufJKUIFrQzP0yKsCCaNX+Tn7yw==
X-Received: by 2002:a17:90b:3c47:b0:325:1d6c:f220 with SMTP id 98e67ed59e1d1-3251d6cf486mr11713931a91.19.1756059274054;
        Sun, 24 Aug 2025 11:14:34 -0700 (PDT)
Received: from linux ([223.181.107.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb7b6fbsm4756532a12.30.2025.08.24.11.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 11:14:33 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: peda@axentia.se
Cc: wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] i2c: i2c-mux: Simplify boolean assignment in i2c_mux_alloc
Date: Sun, 24 Aug 2025 23:44:16 +0530
Message-ID: <20250824181416.4316-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor boolean field assignments of the form `if (a) b = true` to `b = a`
in i2c_mux_alloc

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 drivers/i2c/i2c-mux.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55..abf63758856b 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -241,12 +241,9 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 
 	muxc->parent = parent;
 	muxc->dev = dev;
-	if (flags & I2C_MUX_LOCKED)
-		muxc->mux_locked = true;
-	if (flags & I2C_MUX_ARBITRATOR)
-		muxc->arbitrator = true;
-	if (flags & I2C_MUX_GATE)
-		muxc->gate = true;
+	muxc->mux_locked = flags & I2C_MUX_LOCKED;
+	muxc->arbitrator = flags & I2C_MUX_ARBITRATOR;
+	muxc->gate = flags & I2C_MUX_GATE;
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
-- 
2.50.1

