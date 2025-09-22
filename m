Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2ED27F72C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758539259; cv=none; b=k6ejGbnIvGOwLqJFQ7PfOgnj4a3dNvx7dpdZ6O4fsKgwt2EfUDgC5kFXtygpS5J93tQkW3cKtRMgSsUW7K8DNl341dcikl7eU5yNf6MWYvXxFZcqf5MjHxmoRxmncNR2W9+fi3KVk1vBW1vxIGk50J4XkFEJ+krXnnu8+SdyyT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758539259; c=relaxed/simple;
	bh=ha7vhXQnkq3dGv29WIX3tV1ew5TCRs9xmyteSmU3niE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SkV4XZOhh9LqJJHBS/vZM/6OcAlVRui6E7yKbWtJuE/3VSGNT38TQdJmkt8FRRDREwYekbMNKLiYtOhEzfnhKpT+k057nkJDulCZbJRQkPQFnIUGRXErEfWhDd/+dT4C7FY04pbJgrLyQSBZbAOGTbaENN53heUFVCmQ5LJlkZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9CLGKDr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9CLGKDr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f31adf368so29932705e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 04:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758539256; x=1759144056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXg/GxymvCtNiazPIaxXzRrcAnchuXSa5kiiDg/krUU=;
        b=F9CLGKDrs6HbN+f/DA6cKmLt9poI/5tOl0oRdT+/28/JL4NskEVxhumR5Q/RXfKDGf
         9aFhU8e3fOCSPdZldkq/ZQ5mFsV1EWjR7E5PG73CAMFycJ9MKIqUMGH2mBaagNF4JE7H
         3WHD7EQsN3NgI52nG3l8lUS4bUysaLV0Fv8lH/mAcuAgKhBXZWQ4xuBOoVjflQ4QiFfs
         fVrRw98ck9mPTVJY+6280Kw9IZytQa39eSxVd/ASCx34FoXLo0XV3Qa8tFl9Bl3KoDTX
         OtHxW2W+KsZyh+wjayMUNGT2v1opxRWZcm2BqZsqQ6mCHUzyY65AYvgVRlrfcTJsvW00
         WsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758539256; x=1759144056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXg/GxymvCtNiazPIaxXzRrcAnchuXSa5kiiDg/krUU=;
        b=JdD2pUkBnBI8cujvDQeYwGoiZhSQG0Radxv5+BS3AjZEZ4oVG4umFwJvYX2rE+HUht
         MpEqmTHSyHk0zx2cBoF3z+tzbpbjJU7lzIIA/vZ8phNTOH0VGWSLIxkqBZq9iCPd7zKC
         B7kSkXrNyRq3N8w7E42P1ImEUw9wd6itmqxrevj43HhQk4XmB6YAGa/muaHPaesJsPjI
         o5jpC2EijvvMhF/QaxWyeaOUOFq/CAsapoCUL98J/dwMog5laBj+r4hRdqD83QsX/zBp
         WN4OdvMEr+dHVFnYMxrzfgZove92sWbHUU8p/HRPPNcmlMfZxj2Bw9K2VuJq8BV0GkR+
         mxEA==
X-Forwarded-Encrypted: i=1; AJvYcCWsQ9d5BuGYDNMkeA4TUuSWaeeKQddI7tnuqPkfdT7ujOcAa7WwMA7QHGhImbfP+6Woe/D2Eiap695OGzOVssiy8vJkLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRQzrqdq9TV6HPCY3vSL9xG6kWB63H6m32IDOVqKW4ZumzLnRl
	CVjVmli7aYp/N1C2YpJDWBnlr2+64ZNLmbBy0q87w6bn4cn9RhM8jyKF
X-Gm-Gg: ASbGncv3bll8hic0jEtjTKdHCxxOlGwkzrcgy8OKdgPhf1JOn36joDslyzpoWurd27I
	jg/b1I12LiHyrkNZ0K8BlpOwt8QdYfTnxgnGYvtiim0c31n7jJQvFT/RgM7x285qkI+cPaGcjR5
	ekA4oFCDncnBiErVZu/ZKnWJP/4nb3hw1sfc3qFJsvi5YCisSdtEfNV8ykB+qjdaTaidQHqZarI
	O+JPXINpF6Cvatcvh8RS7cL+kCv3rEPraG62gI6REN6H+8PCKfmOpchGrrx+R5G/7x2QyOaTrbg
	62PspdQkO/GU19fe3NboqB4vjcycnI+DBT/omiY9mjYLwugM6h+rT22VzQzdxKBcpOqdjxwJobN
	vF0I/1miEtyaKFRXBtwFNdL8mKTmLc2I=
X-Google-Smtp-Source: AGHT+IGuwhHEO83sfFCU12OTOC2+vkw5qcfiySY1IUg+z3oQVKsK98ybPmO83IDuQ6N/NzO8qDOnLA==
X-Received: by 2002:a05:600c:1d0d:b0:45d:f7e4:87a3 with SMTP id 5b1f17b1804b1-467e6b64fdfmr112379105e9.3.1758539255657;
        Mon, 22 Sep 2025 04:07:35 -0700 (PDT)
Received: from pc.. ([105.163.156.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f53c4sm19524684f8f.3.2025.09.22.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:07:35 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands
Date: Mon, 22 Sep 2025 14:07:27 +0300
Message-ID: <20250922110727.1423318-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of a jump to the  err label due to atmel_nand_create() or
atmel_nand_controller_add_nand() failure, the reference to nand_np
need to be released

Use for_each_child_of_node_scoped() to fix the issue.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index db94d14a3807..49e00458eebe 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1858,7 +1858,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
 {
-	struct device_node *np, *nand_np;
+	struct device_node *np;
 	struct device *dev = nc->dev;
 	int ret, reg_cells;
 	u32 val;
@@ -1885,7 +1885,7 @@ static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
 
 	reg_cells += val;
 
-	for_each_child_of_node(np, nand_np) {
+	for_each_child_of_node_scoped(np, nand_np) {
 		struct atmel_nand *nand;
 
 		nand = atmel_nand_create(nc, nand_np, reg_cells);
-- 
2.43.0

