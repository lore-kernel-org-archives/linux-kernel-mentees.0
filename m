Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C4361DBF
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874038; cv=none; b=XjN4VOCyUUby+1Bv9WJPGFpDPW9cAApUYni64BlSsvrqqkVbUfXGF5xMcTNVhoUvnoboQd0HTKgpgqjzlteKm+dS7sP7wnYzgXiyDmNt/xyqlXZV/IW4EUuliKFnezhbzAPHrvWGeCHrYMOaT4upgiBFLMzkSv3uY8n8NQ7KSF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874038; c=relaxed/simple;
	bh=Ti+2vmguY1SICm2DICsmJgXZnQbOhyPSNbyWwHe3uSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDwbMEBTYVVuLv+ylrilzuL8pbM97ozeuYKqzM3lFV2fzFu0HByZ+yYN+vkRXE2d/PoTlNiAagOFlO1u7d6Rg91ApgZplWqBHFGeuPCnC+7EJ0tcFumRPywdl9PBOytRuhlJh09PZyeNhNbAxBm22xxefPG2PNMcE837n8jcqT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCZqZ/Ha; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCZqZ/Ha"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2955623e6faso36226755ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874036; x=1763478836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xk+ab9S/Fktn/kpjYuwQB6Q1o5rzNPQu+5xg+VUfK/k=;
        b=QCZqZ/Haon1Uk39EwzJM+O4siR+polae67lyb9QXN2XtoT1Esu1gm9alVBsc8DNCN/
         lZGE67IDr+Gon7e9rIC1dSOvdDMSJWMy5s8UUH4NhNa9a0A5LgZ+mzY3IOzkxIFgZI8b
         79OFj8+PShVKLUIfBIiiTS8mFpiytdq77CCVey55v+wOFVCR27ivkHkXJUdgFJFkOlq0
         OAgzYXnOlv90pjJ5NeVHMheJc+xoaG3WmnPF4Awb5JCL71zBzbnJsAeez6nRhdcPrWHb
         JQR+lpKsQeNj3U+PgJE+930wCUY1zju1XYgjaZOCktfVB150Sic3SEHZninwbcTf77Bd
         E1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874036; x=1763478836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xk+ab9S/Fktn/kpjYuwQB6Q1o5rzNPQu+5xg+VUfK/k=;
        b=dnyqtWlJDWccPJ37zTk1tM7+rgZw8JgblDt62xL3YTQGHnycnyPP+bqxKTiUeHgRnW
         WUqm7NLBxcuZib1mmjQwntbtgR/wBV2xEJfyizo6oxFuj3ZWaoiqn2/csjXNJtOQxXw0
         pxerp5Hf88RWlWcx+Hv2oFA+QM7NIbW0n0RK44KCLz9fJvsUuAEpN/ao+lyAE8eQbmvN
         jc+33Tl4tsh+jLPA1WyvprtBSjdYv68+K2EofxuETMCA/JHXFdJU0Yf4sL38xQGIk0jA
         Ste7gV4ik9ap2TU+ChBMPNZggjHMMHowxEF2WF1uSCEM9gGTI5Fqun0+x5g+vEjgscl9
         w3IA==
X-Forwarded-Encrypted: i=1; AJvYcCUWrIAGGFY5VWbFNd6d4ruAdJI5waaHwCD+ztHg4VxtC8bU1pxJpC5JOBCtsu1Ou4EytxNwx8QDXYoDFs6AhCdlCvs0qQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5qb1S+nplM/mbwV/Va5M5fBL62sb/aoNINqLKjXbStD9V041j
	e+gCGO8NxfxBUnXyvCsneeBDi1MR7KpJ7BCqu3kM7fN45AkNozKcgOIH
X-Gm-Gg: ASbGncuYIhN61mznfFoLIecfwnZi8fbJTDUgJMiYgUD/pAeswgvT8g+Io+r2CORjI9y
	hIk1G6eDr5ST6dt0mQULJl7aUqTE1A68LkAJU/xeiNR1nLrxLLdL+VmW4Ovk6h+xyuk3J+7eRnf
	VQtL5JMTm/0enZgL/kd64iu0W8LEWEiL1NZs5nT52xAMkWlKKeMtGRw2frzQGqdg14RJPcjxK3x
	Wthm2JyuvgBXQ4WTbV79s2G30amsCMhZtjB+1s7zwr0Cg2PNXA9kObDRJC4mvcfmVNlIasLNTCd
	JwkcuIRQUsh+yrlAxryqnmU6MpWlxy3iLyKTvPyxCv8ryYn/Lih8xwiwVAyQxiO9BNDiFuhGnlL
	kV05U1G4AyDgC39LLyteIfJ5vT1BiFrObBAD82GUX8hlPYB7LDURsFJ3eYckeqikneY/fiGuuFT
	2vxr/LyXPPRU8AStrYEXrb2i4t
X-Google-Smtp-Source: AGHT+IEblO7gaYyU/lmwayxhc2EstFsO1L99ch3o95EXeiAoO1u/jE9w5yzV57nNPGWEwlAqpZ+oTA==
X-Received: by 2002:a17:903:240b:b0:298:970:b24a with SMTP id d9443c01a7336-2980970b609mr110598135ad.58.1762874036156;
        Tue, 11 Nov 2025 07:13:56 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd050asm43325ad.81.2025.11.11.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:13:55 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	clintbgeorge@gmail.com,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 2/3] hangcheck-timer: Replace %Ld with %lld
Date: Tue, 11 Nov 2025 20:43:39 +0530
Message-ID: <20251111151340.9162-3-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111151340.9162-1-clintbgeorge@gmail.com>
References: <2025110649-elves-steadying-a4d0@gregkh>
 <20251111151340.9162-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace non-standard %Ld with %lld to ensure compliance with the kernel
coding style and potential formatting issues.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/char/hangcheck-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hangcheck-timer.c b/drivers/char/hangcheck-timer.c
index 21ef8a6a0..ff141fdb4 100644
--- a/drivers/char/hangcheck-timer.c
+++ b/drivers/char/hangcheck-timer.c
@@ -142,7 +142,7 @@ static void hangcheck_fire(struct timer_list *unused)
 	/*
 	 * Enable to investigate delays in detail
 	 */
-	pr_debug("Hangcheck: called %Ld ns since last time (%Ld ns overshoot)\n",
+	pr_debug("Hangcheck: called %lld ns since last time (%lld ns overshoot)\n",
 			tsc_diff, tsc_diff - hangcheck_tick*TIMER_FREQ);
 #endif
 	mod_timer(&hangcheck_ticktock, jiffies + (hangcheck_tick*HZ));
-- 
2.43.0

