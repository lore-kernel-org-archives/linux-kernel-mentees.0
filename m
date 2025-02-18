Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03DC18E1F
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 03:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739849323; cv=none; b=UAk1Gj2hhNOLz9UqvHgQSf4xLQPDdv/R43zSr1/RTLdsmWCs0MfMG4ty7g1/+oCwjpvNQdx6ps0xdd3e9H+S/NuTcvAnZmk2gtVcYXUjDpK4SMIlEm0N0nbPVr3DantBmk3GBBYISmrO0fJlXrIdG605hjeuZ86PkZXWqPfJ7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739849323; c=relaxed/simple;
	bh=bYgPOv+udYmQjHG1rxQl8JOWvocybWdbv2xyntTv0YY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KkvQ3flQkdcNU9hV2l19RD+qogq595dn35hykDDrFJrB6jwu2XZ9PrGcm3qdQ/dCwKuhxkIIHq9aNa3usSTzJhve5jXEUuZYzh5lN6SsV+/mdB+X/GwMYBBwH23FUzU6P+3GHvB4S9bU2BUZDkoZJO64gNMePy6RqNe6Z5XOEfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqCFAELZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqCFAELZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22114b800f7so36132065ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 19:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739849321; x=1740454121; darn=lists.linux.dev;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i81mwYT0fECTAsOCSTaPmcrDTd/0Qvda06f4i7TI04Q=;
        b=FqCFAELZrkOIKJPpAqZF88RGWK+MtdCMCu2wlPq5fr3V9ivjSXDz28fhEudKm6Ojpl
         hyNZWWOW7uDXLhWZU1CrlckuIIDb4poqyz7ZiB+KQnk0Pp/yCQv7uW3eaIf7VrGMpOqC
         f9NovHCOqurkhqpTyAiPRZt0+GG9u1eytuyrp0CstkSDFIACLsMsZp9h/VKS1R0+zMgc
         ednr+VF388Ri1JvsdKaFzPMIQFef35omrEAmH76yuNXWBCbqBSVR4Gm7Ps/Ca/HJXHmI
         +LgXZ76INgHR4PCIzBnkY+VICGCsGdGskIUBcINvuaP+BFmy65hUDeRFSWQpSCWbzmUK
         wQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739849321; x=1740454121;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i81mwYT0fECTAsOCSTaPmcrDTd/0Qvda06f4i7TI04Q=;
        b=wU2L1k3Na5m0ZcqpXPa2GlpWS8cu94zUIQqBq5v+jaFshEaCtJ+vqbNxq7csp4pXPS
         SMvDmEsY8NT0YPnFUVmQI6hPYBZ47fFnoXiWz50ma0/zO3dmtLoVqJE3bECnYReAZx2/
         BNQfdYUiOIPxUTQCq13n1D1h1lYtn+/4BI3Zrq4c1B01CVMUx1JsTWR4S7gXtzial8a5
         a5xFpnyql4jzpRdu7JXGAVmf8y+O5M3jgFp++cSm61UENeJ6hDLXrt1p8z6C+btdJBq/
         azVKglN97g1LKlXdP52nS7bJS13Gq+YNXMHmhEkIQR7WLLoRKlqqZS991UZZ7nuLqCZy
         myPg==
X-Gm-Message-State: AOJu0YzXf4CGaB0gcXFh41UTjVY6ROet5va5JiVSNvZZmQEL3y0f4LCm
	4OTIoaXz3jJz656XeqRK7mbU14IT5udc6jmGE8TCB3KEBIQjll5G
X-Gm-Gg: ASbGncuxjd6BrMsnDcncnJ5GD8bCEJq7SzQp1A9/fPP3bNZ5IRNKiFdOw7YMW9plBmq
	YzsfK/ns/zlEzp0gMyYjwohYudU46NfdOfLxfRWvfb2IXpqo0u1PQOQ/WaV5bFTMozSsaWgujEI
	vI6FjLavmlQEZFLE81Ap49XtBE26HC7Dcf42F1aHQT2AhakuUlTMMIVGLaOKMmmLlCgbd6K+GgB
	AeQ8ZqMwN+ePoYpSyFwkrgHXTdVJ0rrrzJK60sJY18dlf0Qf5BV8xnwKG4GGNrjkF7E6Oz4Hkio
	MROpz91nQGC/oCvibiaKpS8Whkh4W9VCTWOfkmT4orxiwkfhGgCzHMY6buL/G7EkJmzH1RXUy+s
	QEA==
X-Google-Smtp-Source: AGHT+IFSdW9Bb9lOu1fZiGl9Ys+vYD2I4MuIfH/Ok4ebxZ2X1A4QlNGgFq/EaDBYCk7lGhojAAw2ng==
X-Received: by 2002:a17:903:2b08:b0:216:4883:fb43 with SMTP id d9443c01a7336-221040ab99cmr200345075ad.32.1739849320987;
        Mon, 17 Feb 2025 19:28:40 -0800 (PST)
Received: from node0.suho-241396.threadtune-pg0.clemson.cloudlab.us ([130.127.133.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ba6969sm8993391a91.47.2025.02.17.19.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 19:28:40 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] Fixed Spelling error
Date: Tue, 18 Feb 2025 03:28:34 +0000
Message-Id: <20250218032834.151392-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
Content-Transfer-Encoding: 8bit

diff --git a/Documentation/video4linux/hauppauge-wintv-cx88-ir.txt b/Documentation/video4linux/hauppauge-wintv-cx88-ir.txt
index 93fec32a1188..faccee68f603 100644
--- a/Documentation/video4linux/hauppauge-wintv-cx88-ir.txt
+++ b/Documentation/video4linux/hauppauge-wintv-cx88-ir.txt
@@ -30,7 +30,7 @@ provide for a handler)
 GP_SAMPLE register is at 0x35C058
 
 Bits are then right shifted into the GP_SAMPLE register at the specified
-rate; you get an interrupt when a full DWORD is recieved.
+rate; you get an interrupt when a full DWORD is received.
 You need to recover the actual RC5 bits out of the (oversampled) IR sensor
 bits. (Hint: look for the 0/1and 1/0 crossings of the RC5 bi-phase data)  An
 actual raw RC5 code will span 2-3 DWORDS, depending on the actual alignment.
-- 
2.34.1

