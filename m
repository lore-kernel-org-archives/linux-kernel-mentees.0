Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834D339A8
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756091686; cv=none; b=mH2f5UYBRbGtgPY0FslCmJ88iCFd0DpOozUszN2ADQbybSIEfllTSLwK8Eb8pGa52AaXMyx8RKSTWplnEmZtDAGDQ8yszSSp6r+XmezkM2NGlJ6CbV8RvQwwb8OnWGhOaiTCESPpkGNUMC+L0J91zJpSHDCeyYWVZgR+7qIY1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756091686; c=relaxed/simple;
	bh=7ispcaVyIRZ5/+9jltafMh3K9aVRjMx0ix02kFpxxYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ry6qniIrp3FcknPuk+CMK+YIZJb41hifqrs42AS3ZTzXs/jd/zy/EIY0nr3Y7Drt+P9yAVYXgMhWjn0R2QIE84xWHMzlu8I+NDmfzq6QAa7DUwIKNcgR9kcLgkJl7iLaHcRO9Af+O5Cxirtdr/ftuUYXhbhk00mN7yTyHBDo+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZsO/pMX; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZsO/pMX"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3256986ca60so1356616a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 24 Aug 2025 20:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756091684; x=1756696484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbDkfYYEsVLJhNP0a8Qpsz+hz60XktfWQT+eId+bxvc=;
        b=FZsO/pMXZRnIWdK340a5GM+GtmCaqSirUHWBp3Z5bPT8lg74M82ls/0s4SGNDw/3wC
         b4qcQXOMnaKdbFTQHHb/7BpHROtLhTC60SIiMf8qq+ZmFmRRQApGah4IcvunyQ1QDafM
         Ykh+RPSFmaRy8Pph5gKWZozXCKitwsMmR2Fick6+dS1ngMyylvS8eAfizXNrlM4NRPcr
         wTenoxWgxPzzMMUlc7YHMLdUkareD43yPr+BCNKULs6y7X34hkPa5+3ndZFLVPg9KD0U
         p1yEqBrBwVNbqV1UqfK6ipWJEgcv9LJC/ceTJp8Lno73BCqGwtV0LnPkEdq0MrRc099h
         c/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756091684; x=1756696484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbDkfYYEsVLJhNP0a8Qpsz+hz60XktfWQT+eId+bxvc=;
        b=eG7CNf4M/7vV0VVbzl+iwUvtChOTVNlCUqqp85oH/T8Y8Biq9iYmgN4BN7HF7w/fkO
         jG/GzJhs4dFHiHHVGyrwlL1YItx26H3xxNznuW1/56/TvHIO30NT+unloI/7ZJmWVqQ/
         MUiM/98J+twgwJylhtPhCZTBqhA/EvI49Zv/cyWn/99Eoa/e9u8ns85zpAmPLwmuEvpI
         zhwawUoPCFk6JHEd8yxrHBF7vnIoDsahMKflx9iRvb+MtMlbPXgKINS59jmdGJAJDiBp
         ppvKOaqVBg2VkVWoHRHsL8lgvjk07pLVZGALpUvBSbdea0dv2iC5DytXyAkSkeYDNdH/
         PBng==
X-Forwarded-Encrypted: i=1; AJvYcCXeSF4JbvO9J6qxlonsRhKhU03sWO2+n4aqW8d443SaaAnoWlOFb5rCwQ+G7iRKYI/3Hz7y5J0tKi2COX2Wp/40C1wWaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6HiO1TBExeFPLLjJG/ENoWXh1C1mjz/FHpQPtcJQMHoLTiHcD
	K/+3Yq5yzYc+aS4rLEjtxcOXxXiLIw8elf5sAwIDfC89CHJ8K9LB2ka/
X-Gm-Gg: ASbGncu8Nx4sWQGFVhHnl+wGMV5DqEzGyjQNwwBJa6sKgPR15pRJHXCdF1jHznlmjRG
	93HEBORwWzyEB871+IT4UP6MEupqb+rWVqQk0mQ5SMwdUE3Ng6Ih/GH4073jt2kT0xd4Rov2QfR
	Df3tvMkDsyDj9Fddn26Wdy5t2osYLw1Y1REGYg7BPKbNZsqIAHrbVQGNEzkacG9CGYt3JJI1Cq6
	qQUSBns9Z8XaIkLNBU7WsSwZw2q0xlTNyKZEGHWuWl0SEau9OF8jWe8YrlbToHRRVhIgWpKf3XF
	zP4ctkYvEzKrMTIF3OZ5Vy28AdE6TEDukRGgtyOC0J99W5Z90YYRfMy1YpmE/n2SRjn9yiSojb9
	oUK+ti6Y4knoSVRSm1mavXEurYqVV7TP8kmM=
X-Google-Smtp-Source: AGHT+IGj1na0x2IMhWwnhwZtx6tPkKNpoFJ4Sadg4K9MqcpgWZjrlDL27dkztBwCKtrKl6GJR1OSgw==
X-Received: by 2002:a17:902:ef06:b0:242:9be2:f67a with SMTP id d9443c01a7336-2462ee0bec3mr148071585ad.11.1756091683819;
        Sun, 24 Aug 2025 20:14:43 -0700 (PDT)
Received: from linux ([223.181.105.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa4fc14sm5693904a91.18.2025.08.24.20.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:14:43 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: akhilesh@ee.iitb.ac.in
Cc: peda@axentia.se,
	wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH v2] i2c: i2c-mux: Simplify boolean assignment in i2c_mux_alloc
Date: Mon, 25 Aug 2025 08:44:30 +0530
Message-ID: <20250825031430.3001-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aKu8tBBOWqltEstx@bhairav-test.ee.iitb.ac.in>
References: <aKu8tBBOWqltEstx@bhairav-test.ee.iitb.ac.in>
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
v2:
- Converted the assigned expressions to 1 bit values before assignment to make
the bitfield assignment more explict according to Akhilesh Patil's suggestion.

 drivers/i2c/i2c-mux.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55..d59644e50f14 100644
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
+	muxc->mux_locked = !!(flags & I2C_MUX_LOCKED);
+	muxc->arbitrator = !!(flags & I2C_MUX_ARBITRATOR);
+	muxc->gate = !!(flags & I2C_MUX_GATE);
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
-- 
2.50.1

