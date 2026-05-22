Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8E3BA244
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453269; cv=none; b=DB1uIY3yu/HfWJ2T5n/WeUqAnMTOz+bV7pcox4hiACvfayFf8sRmBO3m/mYikOWZdGCoxKfQWVzwfzApAUlWYQhqE9eHrVlo5vt/7D4kgL4I5g8mBHiXaO2gbgUd7UYhpj4QwayraFDA89Wjo3GUR5BB8X5LaZ9HTwA9hSeMyF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453269; c=relaxed/simple;
	bh=ynhxuTkN4BN6oQfGbm87LslmDHKEkF+o1fRrWqA4b9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EvHl24OvtlzZ3VCa/17fQfKWn97HiFHZfwqPaAai0M9yZRhc4e7NQAfH3eeh/UAKUky998JeNU6FArMYDX5CQCjrsuWQavHOLLVdj8gTjTIzILpT//rsi9PSM2tGTaG5G02ApqBaiSnL7A94M/6W6DimvXgUqGfejzKyzytVKx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/s2JFel; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/s2JFel"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso17378645e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 05:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453265; x=1780058065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy2/x0VnVRjssoU/WahnWMqOpw1Hx5k8ab9OpEH/mx0=;
        b=s/s2JFelqh4Mvo+5LjWOX9F6ysx0RE0xtK2cIARCLLiwuytIalLYZ7tTNcPtcfG4vd
         Q/JU76d6x/ea/QgjvTxVMfJW84sCaii/7w03TYujSOkGw475dQPqMzzrqTzLzGQsku2e
         iFLL8tKN/EfSJjPmYy93csJ73Hczeav6FPHwv/VmjphK2jBEfMilsby3m01NYZq/Uydi
         emnfRGALWMALmhmD4SqEhcmXvXfOmzJqrw9hiLJB/ECi2yICT2XpN4i6El3HfC0rqCsw
         d2JkRp85g5UMTucE7j/TVof7juDjvHRqtvjN0ia+JWe2lK3LsahxJFWfVjW4KbzmGtBj
         TrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453265; x=1780058065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yy2/x0VnVRjssoU/WahnWMqOpw1Hx5k8ab9OpEH/mx0=;
        b=SudquBcShKTF0daJ0ctxqwE2RGN7hhRe7i4tENyRnd9Pl1Lk3yGhwDRS1yBk2kmH4O
         BW9p9Tfv62Nro512HvIFuSvHDhjc4pQjXhV+cQlW/X8Kwj9C+oTYp9FUNmcIh1DfcvMV
         EVsetbFOGgTuVNJwMpXHpUqBGFSzSSdj2MHkU+wYcNhccCwnKjRQoHnuqs42j0X9CfvF
         Zr5dJOYzvMLTGOM26rDVOMtBEDr+I66cLKW7AVxFumwYNMkAW5J8ZjEuFahnIO4Kdavl
         4mkNz0gAIv2ORC92xyf3WOJ0Hh/h6aKPJZ3AHE4qs7tJ/r4is7w44svcMNsTfAq3LDKS
         U8IA==
X-Forwarded-Encrypted: i=1; AFNElJ9pBUtmNmSZujvyfu/zel8l1RqBoRuU5SvSG/kNjfO7dDnQG/0AcNDnabM6kc9R4xWDfMWGXgCkh/5geOw3/ggTVmmdaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0iXIw1i0rR0VMappgZ87cOvlT9d4wOxq76O+p+sa9BWAK0hNL
	6e0HUrPMEniBkN9WG1n8HfXQwlQke87tMqfd1P5wdN8viP+5GX4Hc8td
X-Gm-Gg: Acq92OFGJjtwslsRbpmNd5QejE5P7W/l2nXUR7KI+GrsORTzdwTX7wzhreyLsTKznRO
	Vl2Bbh4LDD1T/QXChi+onIVcr++CZQmpw09kkRQrph18v/LqUQF6pOnRN+Gesf5pGkhVKPrlahB
	0rZQUs194wk/66czDwVyD31gtQZVbYTV7S4xKrLbdU1KsVLKLr9D/5fLO6/r68/EWVZllaZBlZq
	585W1qX9/hT1yiGjslWOR+9lhZ4OJXrAzcpGL/kSpxMIJC35p69K3m9SY4KmHJMF01sIm+J75/z
	g8emf1isxFhnrofT1HM5b2AzFpE9Qw4uCxF+GNEvsuzxU6FQ/DTdTR/phDra6nY1A+o5WlgfVWI
	aBRsv0mqWEU2WCPTrvZozaUBZe5NOpCGEzOIfQ07lxwIn2LMSuUgTonpHzHUdjpb08/H3R9Eycp
	4Pok9en7TS7jKsGmBgIX/cMQ8zU30u1K3WeFbY3IUkDWhTKtaOhfjV
X-Received: by 2002:a05:600c:4510:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-490428ddc9fmr45980945e9.32.1779453264941;
        Fri, 22 May 2026 05:34:24 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm14760175e9.31.2026.05.22.05.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:34:24 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 4/8] iio: tcs3472: use ! instead of explicit NULL check
Date: Fri, 22 May 2026 14:34:15 +0200
Message-ID: <20260522123420.45495-5-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123420.45495-1-aldocontelk@gmail.com>
References: <20260522123420.45495-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'if (indio_dev == NULL)' with 'if (!indio_dev)' in
tcs3472_probe() to follow the preferred kernel style.

No functional change.

Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v3:
- New patch.

 drivers/iio/light/tcs3472.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index b31714040a02..d7b5805108f6 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -452,7 +452,7 @@ static int tcs3472_probe(struct i2c_client *client)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (indio_dev == NULL)
+	if (!indio_dev)
 		return -ENOMEM;
 
 	data = iio_priv(indio_dev);
-- 
2.54.0

