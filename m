Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C21E2BB1D
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 21 Sep 2025 19:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758481788; cv=none; b=lQFOwoFSuYQFbSPyutjFnfyVube8Q86+v7Js4yYRimZt4qdVjN6nRJbRkctH4cKXKfkAB685WYZqqdFCXgc0Cw4S/Xjwdt+nP44QPnsI2Uu0h4qqnqdjjM6LOLKLe8ChcS4UE7vRnqfIwyc6iM5taBG4R3PnKI4onWnBl9Zkl3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758481788; c=relaxed/simple;
	bh=bhwyBkoJNmuTwYaTU9uPfkgRnLFo8pBFncNjw30MzXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1stynRmhvkJtTPPDthZxEHtOasQYdrMTi8MEmj2OZ+q7ZEmf0YcEhism8srlIFKqieAsYT93qyxGuM0RCl8gYUgB1nLFyyCRGpbqVoHanad5ERnC1+7/XM+u5EGnO7woSWqxjJZ1XabVdua5mAxJzqNLBQIhivgKnANZRFsuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgcbXOHu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgcbXOHu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so2284246f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 21 Sep 2025 12:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758481785; x=1759086585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8l/I7EzBi404Jo/3iBCz0QrYvWOp6EDdOf9Z3x8IEU=;
        b=AgcbXOHuZeH02o9kdtpfnUpfV0CKdvWAZ+MM3pFpaKGISHmhdYJ3fjmW42uIIdNPWa
         vS6G7PwztX4ezVYG2oOvnfDKr5aVQWtee7trhltT3dE60RZ1bYiDQ7BuTckylZD+8/Rn
         uDb5BhLS9nMv8ABteNajoK+PW2RzkoTBm0mH2KZU37/aqWJN5NshTrGkTj3b/G80E6X8
         IyR1ZoRfbMrva3XJBBxjmTWx7rwgpg/yCPV7gQi8ar5NKwEEmbwclIjUHI/WPDvOMiZx
         ORQl5wdEQvUHRmCSGgCxF8yi+KlS45ORZdaA+z+9rKvduv+xzEgulkByf+Ce+KIPUbZv
         QetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758481785; x=1759086585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8l/I7EzBi404Jo/3iBCz0QrYvWOp6EDdOf9Z3x8IEU=;
        b=Db/59y6cDk9gpolVyewl2peNhNWaRbuntTJ01DS51zzJs3fG3a5/hOg/bDyDW1bEDs
         RxGaXlYUpV9cgl+kdDiLjGN7zE7AMhVugq2Y72V1mBTmRS+4Vf46Rt5xR2V7CPlIBIcL
         G2m6rDmeHJsG10a0pQs06vxWc212aR4z8RvghlHXb75n4jFbooqNiPKSdGr+OwcNmLNz
         YpIVHLc5YkG1etzzvvvrPHfz7GXVLzsbaLw1bf7Ayu3gkoPiALw7NgR1nbj8v497Q+ew
         WH1mQe5Ue/v4Hv3MYZHEgiqerD/ZNueiwNyBrcYGpf8DT+ZBoCodOqgHsZDMAqamQcpE
         xXqg==
X-Gm-Message-State: AOJu0Yzt6lN3ibNtPtTsGw1yuaRG3qQ/WCRcHFeIXcMIqxxqwDPP/QTV
	UYegtOQPTQt9WLgjP08JumRNkXPoG43NiKv+Th8qn4lv+qI0PAbYMO/B
X-Gm-Gg: ASbGncvnsTJPOep7cVqXa8/e5vmo5w/dr1YiuMjdDVK+q37axXiQ4R6PGRxj85BFxw0
	6eheg7S5RuxYFhHj3LyYgO1KD2enWVQWxz/jiL3N/Ilym9TYjt904QBwCbh+5rzflRqOBLOZBox
	J4pc44vdbHOVQS7cexjT1RTdPHAfR6lz3a8Fvt91XfuNay14ug+ecPWSwX0B9dS6gZksPKf7IMk
	x40dnUDdzlK04G0iEbK3j2b0owZVpPJuCpApUCvmn2p5VHs2M1GQgs7Jsrk+vTlDGwxM+RAVZto
	btgVI4tOu3/bi9H2QEIcWE6ff/XK0yBqWYiDLwR/A3ivZ8Qg8FE1MFrIa7LBzQxELIUUgHCcEp0
	Fj8uB0uY3uTgNfGI3jxsa
X-Google-Smtp-Source: AGHT+IE0mA/0RWQwc15UpDy7wLzFEpQ1RBLO/WB6bAjNWICjKqmeOhbEfeBlLQ+6+irA4hAbIqHN5A==
X-Received: by 2002:a5d:524d:0:b0:3f2:97a6:db6b with SMTP id ffacd0b85a97d-3f297a70589mr5203404f8f.3.1758481784474;
        Sun, 21 Sep 2025 12:09:44 -0700 (PDT)
Received: from pc.. ([105.163.156.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf1d35sm17771847f8f.55.2025.09.21.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 12:09:43 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: linux-kernel-mentees@lists.linux.dev,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands
Date: Sun, 21 Sep 2025 22:09:37 +0300
Message-ID: <20250921190937.1898682-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If atmel_nand_create() fails, then reference to "nand_np" still need
to be released.

 Use for_each_child_of_node_scoped() to fix the issue.
Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index db94d14a3807..a73c44d79e1b 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1885,7 +1885,7 @@ static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
 
 	reg_cells += val;
 
-	for_each_child_of_node(np, nand_np) {
+	for_each_child_of_node_scoped(np, nand_np) {
 		struct atmel_nand *nand;
 
 		nand = atmel_nand_create(nc, nand_np, reg_cells);
-- 
2.43.0

