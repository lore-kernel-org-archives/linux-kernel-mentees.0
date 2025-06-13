Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FB41EF387
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 03:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785696; cv=none; b=Nop75a0NapL2IUgLiF64REzKtEWgo0FXVl9BRewm9GDJIXkNJonvISF8uaeyZv0cgjRCFpYvFnaU92adVD2JCy0jEg2qEM4CoeTCCdO09jQR0/oDdU8x5MDjeeZvq/ONOFHRo91LCDBoZOX1m0t7tJ0dU6xcaYcVZDM3wGnFFxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785696; c=relaxed/simple;
	bh=FpD4wwubMc0fL6XWCCErw5r2dsG/NeLaImzcOMDvjmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L387VlnFvK7DDWwBGHuTN47qLFmPaLFNJ2LIxWkq9mx0/FaxoxGfdVPI0QbwqYP8UPxR/3X2sVd8+vFyNzyjX050xNxKsIj1RakTjpEj/AbXbXlnAkAQAhlWTTK89PmkW/0AxtRVHzk52lUO8HeyHwGNv/ofvlo7BhtFIoqLkHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2QB9u+U; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2QB9u+U"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso2041963a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 20:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749785694; x=1750390494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh76012cmxJ3NTVwP7C3j18NZLE+AAnhKDkHiE+sAeg=;
        b=L2QB9u+U2t8gV3GX0IVUGqkxFcCHqHIKGyy5S0gRQVDAKgMF0nvdX5NMvGCaf8E7H1
         mNYGGkNTJtbuUlcWiiwC1u/tpVLVS+A0Y8zBJR1WllqdxrFYTFvqrsJGbE1aVh0CKOyD
         4xhMsAu/fdP7Wr4p0u7URawCoqIkfjFy//Od4VH0O+nCt+0rnzJTXcFKBFJxSjKrzNBX
         AreC5rY9LlxkwnebEcDRAhz7VWGh7P3tfs4/CzyXRl1mK8NUlqt2MxlzRDk8HYTROIKk
         +fL2SpSSsva1e3F11dORPZ7OeH0l5GJog4lI2LPQlW0iz1hQkZ2h+Rth2at/nSn864pr
         plbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749785694; x=1750390494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oh76012cmxJ3NTVwP7C3j18NZLE+AAnhKDkHiE+sAeg=;
        b=EbB4CejdeCgoc8evLoqw+/LgbEqpGgeh3Fvskjvcc0gWlRuYrQ1ffBQKxc4KzclFCQ
         GDOVkMBME3xFsgR1Kl1sHTLPWo0mEGotjPqvLNbzcabbTocW92yRIxu+3zO/Uniya9WJ
         TH0YI7kVtqauou4yo0/sglV1c7HFnqcBKUHuu0PeuuTyPlvluPzCLx+AXrqNfk4Bhm+U
         NOzr15e5YyfKuovsYDkCE556nBBVvw764D6CtTqmJ2XVTy9kl7/63D5DOgtx16LC6OuH
         xmJaBiOWc0uofNAeIx9/dDVAFa+HfuJ8gsrYtCQElfhT9I0NsrSMOUt7tlJH6DGW042r
         o3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfdwY8+gACQPrZrBnfCHCRvRQAn/mb3ZtT59cEfSlDlF9TIbDgAQQzWMucEDGuabxD8C3xipBlYHp5jJSnh13TreXQrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTFanZIotc4WssjI9/oOnNYTeLFIKbPR7bezR5K80X+8cY+Hnc
	mK2QKXLdyhhYZb6ZLE8p2ctvz92RsbZssa3gI2SplUVd9AFHwkDriSL1
X-Gm-Gg: ASbGncsb1sPCTdJR9KVAddxTSY2m6FrReQ4K78h4ZAn/dSxTS6MBe1P1F3bGx0Iu99S
	do8pzuUnGCnPzUiAL7r2W6vET7hH75y4l/5sDcfN2mGsEq7P/f6he00XXXyNEeCNeEAetlPqt9g
	vGynMLunISvvDb4tjeGpx1m+jPywlOQ7llu3i71jrj/9BVDpLHIzvZtIZcDCe3NDxqNwBQY+6NN
	Zuy7EOh79UKCBgWcAm669QYZ8YMzrs2pk8A0h/zzf7aOkKr72eQAwum+Ue45BfPLkE5xFZnNqGe
	y2I0J8o+DxcK2qW/cAocAiPKV7StmaecDBfW1SlRELIJsnOPD88s0xPEvqxP4HSemREvP9IGXG5
	M9gCkicFv++8bsRQ=
X-Google-Smtp-Source: AGHT+IHOuufe4CQvc1BCE1L8Rd4qCJR95BXpD9Vgy3EK1zdiYvsdX3GgAEmHJMXIR72cM/pSk6zPgw==
X-Received: by 2002:a17:90b:1c04:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-313d9eb63b0mr2164949a91.30.1749785694357;
        Thu, 12 Jun 2025 20:34:54 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm2339081a91.13.2025.06.12.20.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:34:53 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH 0/2] Introduce cpumask_first_but() and use cases
Date: Fri, 13 Jun 2025 11:34:45 +0800
Message-ID: <20250613033447.3531709-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduce cpumask_first_but() and make cpumask_any_but()
a wrapper around it, just like other cpumask_any*() helpers, they're
some wrappers around cpumask_first*(), except some special cases.

The patches are scheduled as the following:
1. The implementation of cpumask_first_but() and some
positive results of making cpumask_any_but() a wrapper around
it are attached there, including performance and code size.

2. Use cpumask_first_but() in clocksource


I Hsin Cheng (2):
  cpumask: Introduce cpumask_first_but()
  clocksource: Use cpumask_first_but() in
    clocksource_verify_choose_cpus()

 include/linux/cpumask.h   | 22 ++++++++++++++++------
 kernel/time/clocksource.c |  4 +---
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.43.0

