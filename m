Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8A221F0A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759224219; cv=none; b=pFq3nfNG1Z7YfRQ7ha7QtEOg1FO2Q+Uh/z+5fnWgWt7x2eFr4DE1xuXOUs8aAqXdz08HWDobkB7wXWOiJHGi5z756XUS52j1VgNqVKCdoUxNKUJ0iTRLhIUhGprSyOvn46s/1oXW2rQNCpyCJ1pe+KvGgZV8AylcMTHEP17SgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759224219; c=relaxed/simple;
	bh=Kbs8JGrFduOaI/hjUJ5wKXWK6sCYJBvlyr+v6bAjmus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=feHVPJurjIlFKkEPn6LjMbWMPUB15OwpSuGYf+gsYgQuQ1dUZjunYCebph/nKSxvXSqcsTKEWqnWm+ln88mLNwdcw9WZ7z/va1ffrqd/OTxSsgx5ja4ZJ3TScRa/aqkhNapm02+UjP8OJnpRFTXtunGmpngQxeiUea/omCEJyn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBjwfqyl; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBjwfqyl"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 989E081CEF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_g41mdiV56L for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 09:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEB5581D02
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB5581D02
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XBjwfqyl
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AEB5581D02
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:23:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e2cfbf764so7713335e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759224215; x=1759829015; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TekYocA3NFc6wJkBn4hXZq1fAbBiTi5Aoq7kBmK0gRY=;
        b=XBjwfqylqZ5tnoiu5rTTMqudwDezZLJ9IFQJu9Q4bvetrtsxbQn134ezIrloLmwdUt
         DF2tt8b3YjvGTbUvYTlKvfqZxdc8E1YtcnD9xFCOstZCf1FHRxwoswaECRun/fhBiYkQ
         6IBCf2Q+sxUceOxQRWdNp/UtT7kXp1jC0oQNHwtoUVeaOdYxFREz4EZ1449b0TkEQhT1
         DvA0ISW3uTsE/7mZ6Y6hX4440YmCMSAfYHQmhuAfSL5Tq1FcArDxqoe8n7rGugNFPDMN
         pK+m61iYa3SCFz2GspDSMn3QmF5I91j7ortrby50A0GtSIWuRtGWcXopysn9Ls7zzfA3
         DgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759224215; x=1759829015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TekYocA3NFc6wJkBn4hXZq1fAbBiTi5Aoq7kBmK0gRY=;
        b=jdG3/kEt/aftm3NMn/ak2dz/uSLAjtAuiaZmd/seGJHRez3qcotpCEZcLVBTCGN7+K
         9ypVPPIBA6iAeUZI+LGcwlHpk6Ey0bTZVnRq/bmdsOrUWpO+JYAN6dcRXpoxjH20CTaI
         kqYUKg3197vnyu6MSJTSaVhXqvtirOk6LjgDAkm1AdSSvHgMCwRRIi3cFwElltuSCCz0
         i2evNjYDjZnfES61MGlM8W0QaKo80gqfg+vUPhvEyi4Ekn+ltMq/b/mJPIt53BkcPz9a
         8y1xtK9V0RCn64REfSjd+SvH4jeDk5HyjXP6djW8FNJ47gmSP5P5oZFwUHUnEjyPc9Qa
         wUzg==
X-Forwarded-Encrypted: i=1; AJvYcCUdy9tDfELaz7/anXwEn1uPy6a/jv/LXcJejpKKfM/VxabOCxRzRKB9XKRFdsGJecVTHwTpTJCDgW7ZiPR/ZmtYtO5XrQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwGlr/drV2/1vT6j1wPkUgeLqFy1La7TnkPaHVIwcQTkoPgXK/w
	Fewyp4B8u8Qib/QdcEixJTsI9F86R1G/CUF2LYgyYn7FTIEuFy/Zup+S
X-Gm-Gg: ASbGnctMMWn46sv8B+c7wIL0cntkDs5ourV4yRgUkygWl6B6HX4V65BKzroOLGDP2+N
	H3WTpw/ufgiLcfyhsuFZypMikjF9+YWu/pgkhIkmYtp/Ho3N/RZD5oKVzy7Ca4y0FTVFIGyWyiO
	i7df+TrcZ2k6XGBdu4yZS6vea8X0Wfs6DlAAkEEcCzRhOuoDxtrdSEIjwazTh21q6MfUq8W4fFc
	kZU7CYNwBrRHtXjSyn9rEwR23NeDxan8ITRfnG0r4yQaW9q8Y2Cy1rwcbEH0BcGzocYtLyQ549D
	P8dRU8SPPViQszYguvGnXIt+sSBbyOyaSJ0eQMorqsT8V9BtUz5RJDCFrLXGv0/uUuXsjiK9GbS
	oqM8OZRk6T9GZ68qmpBNGUR1AuVmu58LHq7F0HtLApXS7h31DwP3Jy2nrItHGtkm6
X-Google-Smtp-Source: AGHT+IFPizRa0ASKtki+ckYZRe6BE0jI/MUqHU6/hP1U8hUcZW/DR6Ot/O1lMO4myHbm/wTeveLEEw==
X-Received: by 2002:a05:600c:4f91:b0:46e:43f0:6181 with SMTP id 5b1f17b1804b1-46e43f065afmr70284335e9.7.1759224214578;
        Tue, 30 Sep 2025 02:23:34 -0700 (PDT)
Received: from bhk.router ([102.171.36.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-410f2007372sm21062808f8f.16.2025.09.30.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:23:34 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] lib: cpu_rmap.c Refactor allocation size calculation in kzalloc()
Date: Tue, 30 Sep 2025 10:23:12 +0100
Message-ID: <20250930092327.27848-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap allocation size calculation in size_add() and size_mul() to avoid
any potential overflow.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 lib/cpu_rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/cpu_rmap.c b/lib/cpu_rmap.c
index f03d9be3f06b..18b2146a73d2 100644
--- a/lib/cpu_rmap.c
+++ b/lib/cpu_rmap.c
@@ -36,7 +36,7 @@ struct cpu_rmap *alloc_cpu_rmap(unsigned int size, gfp_t flags)
 	obj_offset = ALIGN(offsetof(struct cpu_rmap, near[nr_cpu_ids]),
 			   sizeof(void *));
 
-	rmap = kzalloc(obj_offset + size * sizeof(rmap->obj[0]), flags);
+	rmap = kzalloc(size_add(obj_offset, size_mul(size, sizeof(rmap->obj[0]))), flags);
 	if (!rmap)
 		return NULL;
 
-- 
2.51.0

