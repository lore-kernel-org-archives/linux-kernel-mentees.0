Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CAA33F5BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 May 2026 05:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169232; cv=none; b=fn1GfQZu5iGjfFfof8y98i46jxqu9kqno3fJdkhufyiye7XqGVOW0a2dwcIMtsHME6BUDhNlfw8aKLzZMCg4pm/3csP1uFsDUErlOUhN/hbxsSh3hn5AW8s5hJpj2Z1vTp3aqaplei70oBJywqaXGXx2F+0xLIqgZc7iBvMJ/2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169232; c=relaxed/simple;
	bh=LGUOcBBjpLtj4Y1JYl5LcWsQBF7rLYN6gfKM8t/7vPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4mQm+K2W0ocXVZQ/xsHHhYBv4YDKO5cwu7/4KhVPey/HEBR4MZr6WOhiLWXeaXjew5IQW90+gtFsCHqSkn+8eOHpal0Q/55s7iXGqYfpN+QGMUwfOmfG0i4zhDtgnao2vt/uejRPs3yFcrd7Ey3kNej3ALUafGqCFGc6WfrDEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krrHYgA8; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krrHYgA8"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D61405E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 May 2026 05:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDtRXeIvvi9l for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 May 2026 05:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18E9A405DF
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E9A405DF
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=krrHYgA8
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 18E9A405DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 May 2026 05:40:29 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ba17c8cfacso30072345ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 22:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169229; x=1779774029; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyasRdVNP43J/qdjOUHHjkFB5jEV1GwjVuC9P7OygY4=;
        b=krrHYgA8W3N5pkMndC46IffX54X62Z+61MOq6+/aaveUwGTQnitX7w/ZTiAKT7yoYQ
         ARpdagKsqAgNg336tRi54feuhzadk4iJNgRBVWCCEbOKniQf6uGxP2iUld5HzrtONRN+
         27pJCFItdZ5MtSEOqcAMcphJ9j6AZZ9qNHYNpgVptg1Ywh2eCfOx1QzGCOC7bdsXjGas
         Zq7BNk+o7TkHs1hgckvyMZ1DImz50+zIaLN5vOpIhY7UpNhGFBJM8Zmh8uUQ5YqFW3Dt
         Njlru77QWf3aS3Clsk4w3GcochpbOigKkEIycKtUdQoyxglkHEu4bWvwlpyRCtiMehHE
         7mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169229; x=1779774029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyasRdVNP43J/qdjOUHHjkFB5jEV1GwjVuC9P7OygY4=;
        b=iTX/zjCbKoW1ulz92yasXDaEvcvCz1NULmMnq41AXNzzAe70S3c9+0Vff9MVJ6N81/
         /lgfH+EEN0KAL7YumytA9injInfGrBc96w54Ds/JfQ4buWKir66Cqx7/5RAVyqmIIgNw
         63EttrWuZEDE36dZHpWIFHEPasPLpoEkKYGns7XafyAIErbPPPjYBG/MsU4ROpnSWMA5
         2+zNVaSnLmUYEXLMoZZ7hj+RDROpCPIOpQzXUTBIWbcgPhT/u0cw2+LnmsWd/3j1BxSL
         YjPU5rA8/YHhVdXZuE1HcjvncTTx+DY36+GdX20D8MjVTHkqS/nBu5GJ3mTwtRexSvat
         1pEA==
X-Forwarded-Encrypted: i=1; AFNElJ+7sHSbAqKxR/f9OK1P0tQmIY4JcAJ2nAbhILaqBbTKTKeVyiRZkP7WYvPm1G4eqOK9b98GK3tHDYms6aaheSC/1QobPQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwWBo6ImHuuMuXFAWXNKFxagv+B22nU5xG9nwHLxWXfFcP/QZmk
	UMie6tRvzkRf95nNyROUY0I5L8Qhoo+ctz+i1kLz9GorOrdXOrtLoAwO
X-Gm-Gg: Acq92OHK+Xry0Ahg6Jca4pFGCTLKgp8Vn5PoxcrKZokl+uaQbsj3BONZ3L7rSSJ/h9a
	hkUbfeN3dCE/WkjFfjjf/zI/ccm8lXcslJ3CouYG4md6oXPuVxObrFPd6yKCJE0PIp7ckZ4Uk0x
	URgNVNKcGwDaHZr2ED3EPRUEN1f7zNZN5CeQL4jCKxHZPQ6ppAIJi2N5/Dfiw3paZRJEdAywJ+1
	NCoLT+EoS2DKv6s5mGLpgfpDEPvhMn3mOnC/QygbEmgUorPDGVJsgj4SBDepwQIxXnkbsz3U6Tb
	pPJtwh+xgaT6JI8ohhUSgULc0yLGi97egYnxarrkUJHDbS09sfrTkqJVTTxFcsfHy2rK5h2282x
	RtrqdLeTY1mmL2q72O7RmnGkWHjZkOvacBxOwj6JTqqVX9IsRgk+sojxu1vDc/rhotEl+x4xvoQ
	DovCK5AMeV9p/tMvS4Ff4uYtbrr0+r/J7jiRfFqQ==
X-Received: by 2002:a17:902:f64c:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2bd7e92c24amr206379245ad.30.1779169229167;
        Mon, 18 May 2026 22:40:29 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm172858725ad.65.2026.05.18.22.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:40:28 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] ASoC: soc-utils: Add missing va_end in snd_soc_ret()
Date: Tue, 19 May 2026 12:40:24 +0700
Message-ID: <20260519054024.274741-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default case in snd_soc_ret() use va_start without va_end to
cleanup "args" object which can cause undefined behavior. So, add
missing va_end to cleanup "args" object.

This is reported by Coverity Scan as "Missing varargs init or cleanup".

Fixes: 943116ba2a6a ("ASoC: add common snd_soc_ret() and use it")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I am still not sure how to test this change. Thank you.

 sound/soc/soc-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index c8adfff826bd..9cb7567e263e 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -36,6 +36,7 @@ int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...)
 		vaf.va = &args;
 
 		dev_err(dev, "ASoC error (%d): %pV", ret, &vaf);
+		va_end(args);
 	}
 
 	return ret;

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0

