Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14538A715
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Apr 2026 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545267; cv=none; b=TudI6dP8gQnV9Z31Cp+tLSMoOBf4PM1ohsO9g3qEqs7yBb6nDiM0vlOIFpCIO24wxBbN/zwf9yGx6C2pWvXSPXRE2pjJwyf/dc1YYcbZHsLFqPg3PTabgDWgzbXLW8ccbGUsT2IFsU3D/bobjZOLn0ol5qNwrYTu9ELXhuNVvd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545267; c=relaxed/simple;
	bh=aSwGS1w+ZfXoSis95cwWOn4rxKpecTfKYrW/bnEVBdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJJLs/h1OTjp91d+X/0H4qsizCPU5c/2V/VFlmcT0A7cpykMPwmGje94nMcvQr+5izS3q5kZCDsRAF7LrwjRPNTxd8P7CwB1DMEncEAjdU8FC01p20cVcSpwZuDweFVhwaCahVuFf6avxKxLigT4LrfKQHkCNZ+jrxpZx4ekAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qABm+4q8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qABm+4q8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfd832155so2835035f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Apr 2026 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775545264; x=1776150064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEY1NxXfmQL2tnAV7Ne9RR9XDQ3JvcVvXSPGw7dtyYE=;
        b=qABm+4q8uDnaBUW9ZPcyCeiN7KdB2rD7wAqn733gfMJMChNZZOqRTW+aIfw444PcMT
         Cx47hTYH3KuuzGrpRe3Eb6caxAK/+JPPcenYZcstnVFsIK3VWJeY3EsyEACeuth2gvdb
         kUPRy12+Dc753Umo609HWtr5HMnxXQeuUoR5i9TVdP+gDmwUd98QLBM9PhD/mM/e0oHV
         d6Gba9nnjwaz8Us9lbOnrNYlw9RpzV1S0H3nXIPlEbyTCt+H7hva8+dQx0Nf4QFsnGzQ
         t4FlYJF95jpTPVMeoI1vg1/XhZ47830rKegLxZpwALcDPRgRNQv3hFj2YReNlMPhqIH8
         b5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775545264; x=1776150064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEY1NxXfmQL2tnAV7Ne9RR9XDQ3JvcVvXSPGw7dtyYE=;
        b=qERJu3ueTDz9WvPPamUtwoKBFbHhNygbmW2xSpXUfw831M3cgjhvX3Bkkt21zgPe71
         9Q6q5EjnL0O7pBqx51KNKTtvXtZdtZn3nnrkNaIQjkBT2c+kaeGVxZMPoTkAlW9UIhrz
         IU4dvTaHxEwZVZ9r0G/ZyRXjEe6le+1MvBfjfKC3Ru5rA7f/2E+FFKEktjM9ZyQmsC0F
         wABrQhl9hM1Q+C2ToN49lWKyjUSdgPLtTY6nogey/FLsErKohulh/MjVJj/NiFYQOG1B
         o+moX/JGWPUj5LhWXKWMgUpaVrHHtDIR7Aa+A7jeWfIofnBSlScWXjyXSeYM7xdTLOzx
         XrxA==
X-Forwarded-Encrypted: i=1; AJvYcCWT2pasrJp+mu55CR+ry9l66ufA0dpM2bfQxiwjJw5U6w68OQ4WbxbdougIInugvEUorZOvMt5OGMXE5VBespArtt7HWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUHNirBVnvWVovj+kjqBwO0L5wQfKTdXuloTM68s1DWR1Zazht
	pnSExEiwxjKJgX6acetWCCMPu63jGMWysiRofuBDoKlEj67cI4ITRBoD
X-Gm-Gg: AeBDieutybllKQNgAI4bWVFdzA7SOB4xN66FEuxBSUGxM/s2mRDlpH6tk+miJ6hqjn0
	9640Lf2zMtmbIDg8fw6FhlDXR1002UqNkDbNqeBUhxCIshGWCCHmremWlP2T+CU2bftGWUon6wf
	XOdB2wjuFQA6tpCmnC0+5Sr8mXi8Z+pLPVBPyLYcM7et1rtvtZIzI5a6+SASvoS9qlgxQ2lIl9p
	XiyJgFaP1qM8YCrzM5ZceCdADAn30ikvLBrMFHWeklA/b7ewGo9yCigWVZ9R55M67LjjSrX6I7N
	qPNFLU2RBzO5Shg+f7BmOudhpitaa29gkP8JTOY9vsLPgOWIykGNBQr0ltzPXf8+KwChWTg7kRu
	iHRGCvBLbAWuA9sAxs06pFIJ/r7269FjzWSamrpRYXpjwUZsHaYXC0VOgaxbdegE3vK5WzWaacR
	0hF3dZocgRyE1C0b3bnWmzirKh937kk3WyEKHXft1xyzj3AqR+lTJJ
X-Received: by 2002:a5d:5f92:0:b0:43d:184:8aa2 with SMTP id ffacd0b85a97d-43d2928f9a2mr22347092f8f.16.1775545263749;
        Tue, 07 Apr 2026 00:01:03 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm42167576f8f.9.2026.04.07.00.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:01:03 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: ktsai@capellamicro.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	daniel.baluta@intel.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/2] iio: light: cm3323: fix and cleanup
Date: Tue,  7 Apr 2026 09:00:51 +0200
Message-ID: <20260407070053.9359-1-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Series fixes a bug and does a cleanup of the CM3323 
color light sensor driver.

Patch 1 fixes data->reg_conf being incorrectly initialized with the 
return value of the i2c_smbus_write_word_data() instead of the actual 	
register value. Tested with i2c-stub on a Raspberri Pi 3B.

Patch 2 converts dev_err() to dev_err_probe() in the probe path.

Changes in v3:
- Patch 2: remove extra blank line after cm3323_init() error path
  in cm3323_probe()
  
Changes in v2:
- Patch 1: fix typos in commit message
- Patch 2: add struct device *dev to shorten dev_err_probe() calls
  to one-liners (suggested by Andy Shevchenko)

Aldo Conte (2):
  iio: light: cm3323: fix reg_conf not being initialized correctly
  iio: light: cm3323: use dev_err_probe() in probe path

 drivers/iio/light/cm3323.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.53.0

