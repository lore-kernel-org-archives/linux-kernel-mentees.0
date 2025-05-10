Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D36253F28
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746874000; cv=none; b=gCI9CiPf+rPmz3ZKGL7SCQrSZhF+AJhxWQccDE2OPomuNjz8/o7yYBbCa3X/aQyUCBc/JD4XndbFCoGXJrKK656FvlVSiF0iv479hUYB1e0wJ/KlV/M3WNafErbpizTWAt9Q8g3wvowIqTPMgdo6+4HENh9/6PhjGKk7dz0H/Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746874000; c=relaxed/simple;
	bh=tONAWPbheqZjSOzRMjKyQd3ii5Bap1iy55kgm4/x4EM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sT2SX8oq1FCR4CfJ+gXTDwvzfOvJpMq8FwiTVTSVKPng9zlxaMxsL8FioctXsBdEZHN1Bemas2LUce2ZdKmIwZClvkD2jI2CTWQe1ZkeUx0SDxMrPwFNonePOz5RXcMieL/60XMspZ1YP5diGskOIFDClTu9AT+tGItvQ4uCJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U04zx3RZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U04zx3RZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30828fc17adso2872609a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746873998; x=1747478798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TD2h6O2ZELE0SEdlV6FfA/tFTtDWEG+f4vWQoSqX30k=;
        b=U04zx3RZzLMSRARz4nx+v/jlxAFoTxE5PKpgDBESZbvNc8mA3IifMg3I/IvbES1u9g
         etZIHDXDsh9kgNp3wqZ3uE22/qAKN4dYqThpv8xsOfGdtlycz16/CTMLsI8ePNvnH8QH
         agbvw3ICMQ+44NYmeFe1zaU2NnZf2WYOReMOAeI0QSDHC6diJjjE9wDFYT7pwLxq2r66
         ASZf4ha/jGIWWNB41ur5+W6QkmWjVXr292DtOtKqeR7kYfUrPD5Q77DSq9EMLlNQLNrg
         AEduApRZ53KpodZyXt/ZmgRqk7WBZ6PgDmQsvMiLOJfbdG1k55LzU2ocBNPXkqbjiCil
         ZaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746873998; x=1747478798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TD2h6O2ZELE0SEdlV6FfA/tFTtDWEG+f4vWQoSqX30k=;
        b=esDqSnC4ZgzSqgNFnR9KujHsbDXefNfh9eyzWGEdlkwSqCnPBOp5VbCUiaNgsWJFCy
         UvKgfIo/YhX0xLE/85sI3uPCwax0G5iPMJSW89ZZ7VM/bnLcxLnIqD4rYP0uzEUuZZSR
         lc2hxG/TfSeTFLWIjw1XUcZwRgV2rscgcdYh3kI6kDp7ypZ8kYXL9W/xaH95k9NBHpB3
         rMxd1VifAEusCcCWgKWens0LL0InBHIsyRsY/ak9TdRP9GsMXMfl5g+A3hhBxKepJqSX
         iKFoYKk9op/XHK8NVXR0gt87LvZChUoiVCLfF8HPvx3DTpsS+DzkebC2s/qRavzchKn3
         r1qA==
X-Forwarded-Encrypted: i=1; AJvYcCUOu6GR50qunY7x+G35YkQJ5FkR6Dr8Jks3PMIKonqeFb2RnF2h1R2qEuSLYbm3gM4Uri6ErbSRCL4bBgUeGv1Mr5s0CA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywut2ZU0alXkAYn5uwNurSmz5hPnuPfXJaFAW2IB1BtzEGWp1o3
	eAA9oq+QERxyWvhtY36xhEEGU+kKHEaXQOnoNFmJO4jMCLia0LF0
X-Gm-Gg: ASbGnctunxUfokwgC3xxTfB38gkIhKwGARO2iA1cNzE/MCTK4xJTqWjvFQFdoUeRh2N
	6qm923RTlxci5CixrsI3X1xOxg7MT62uZpXpY6p+6oHe8yAvEsK7PvrjkrArf43yGx/UNTBItpP
	tTNOOxrrEPfDZUS6fSlotF/mUV2thUVj8SCf0WYSfWr6nWltGXBz22jhNkJeFVl+9/muhoKE1WB
	EM1hgBgmP+kclyuzig2zDujLNHyXhMGgmXlgMYZx0I+x9UJ8eQDUVncdLEPB4eRjx/sm0149aOl
	SHCAbGoxjeg+yXdgTV+ctvq4r5MJYEVZwpBNeAdZMeUxEgCYOjx2PpPIos0EwjHS5bTApfPLel/
	kxyZiuMpUyl2cUpZJ
X-Google-Smtp-Source: AGHT+IFTgEnFdE5dvjzeRSVgqLCYcGRFUweqn0/qENQ+v45c1Fu0UEUqhvKAbiD6PjqCjOfkDBti8g==
X-Received: by 2002:a17:90b:3b8a:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-30c3d3e1bf3mr10957906a91.15.1746873997770;
        Sat, 10 May 2025 03:46:37 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:9e12:1c37:6e8f:31af])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e76055sm3223010a91.42.2025.05.10.03.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:46:37 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: viro@zeniv.linux.org.uk
Cc: brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] fs: Fix typo in comment of link_path_walk()
Date: Sat, 10 May 2025 18:46:32 +0800
Message-ID: <20250510104632.480749-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "NUL" to "NULL".

Fixes: 200e9ef7ab51 ("vfs: split up name hashing in link_path_walk() into helper function")
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index 84a0e0b0111c..a2526e2103fe 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2480,7 +2480,7 @@ static int link_path_walk(const char *name, struct nameidata *nd)
 		if (!*name)
 			goto OK;
 		/*
-		 * If it wasn't NUL, we know it was '/'. Skip that
+		 * If it wasn't NULL, we know it was '/'. Skip that
 		 * slash, and continue until no more slashes.
 		 */
 		do {
-- 
2.43.0

