Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD50489894
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Aug 2026 17:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786730093; cv=none; b=Fea+zatxII5DpO65G64cvvI1CCqdgLI7I2jO7Yv1QclJ4UPdLw8TG6FnX1GtzWio57lhguXve1QKWTaW+OJfUtVeUzmRnV7rQpDqTyxFNOnFnF6FxIj9j62AS7c7WTqaHfXzEUsAin0g2XcqaDFVcZCt00CFF5gqS9O92cBgFl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786730093; c=relaxed/simple;
	bh=kMgTpZFq7u5Mzq2u6SsEFzNK60Jy27f8eDeuQkZcDUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AdTyN1FYgMvGisZRkWSC4GpAHcAZqhHIwQi+KOcYjOTo8loqfenw6S2Jtz7AbT3cZSU7j0zVSvSU1ZcPNCMyYr8KTOCK+gERN7KWw8NCP5j1L6d4sv1Fwb0vXOwYqMJc43qDaYAocIBnJcrAmLe6P+iUUFHbp/Jt5Qx0JTsDVmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQMu3c8G; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQMu3c8G"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1714983a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Aug 2026 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786730091; x=1787334891; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pehI8bbVaub01Lzsw57p/i91GxlgKin3+Qkja70UH9w=;
        b=XQMu3c8GmA1hMXDhktahwEkdeWahE3dHNxa+sInagkmkEcPOO59BDmRYqsovpWOcR7
         ViKS6fs6sExFapjJI3JV7SkG2+o2lt018q0Rs1DRGRmTgA4rOfo93HiSS38u11ofy82y
         33fW73PYNFPLuSjGQb+SLmLU3nzlt/Zpc7JtiYBqtJEiJviGnUKx5yFcLndSm6BdD1G8
         nAuTEDS4w3zuJj45wvo/tU+bwx+aFHCrVSrBOL6wplHSULqb8IxJ9IxgPLuzqHT62aEw
         wTmIpVqHpmUZT4I5F/8IaUvVKRvxoKkUIbG1XZOqfUREwfvlqNULDfLzrYzfAT1lgKuK
         3rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730091; x=1787334891;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pehI8bbVaub01Lzsw57p/i91GxlgKin3+Qkja70UH9w=;
        b=CnkjNHRP9USdaOFm5Dz1/1YLYUeJw0vUvYNOfC+p+DjO0vUxmRtB3aWq8jDJDv80pJ
         UZAGnnFHE3QeDe6EK/ypsIBJPWGFy9QRwsuvETfHRDwc66PkXIX+XA5LHCCKWo6hubN0
         klR0ErOc1kluTCk4J6a05KgmJynErTLQfWkVLdKnWfsWAoNvQX2If9gsT0SWI9dnOyhs
         ogo+X95iHi4o5tYB6Hzr/9uoglZLtaZcY82+R/W5ByGfdIQQ1lv4bnbUSlvvOpAEjCzc
         DNP8hNek443hNMQGx58GqUb2aclZbJB+11D8u/lfOD7AGRR3NT3TC0xX423x8hDQDm8v
         i1yg==
X-Forwarded-Encrypted: i=1; AHgh+RqObUPO+fTAovhdLl5W0jqrPQbiyumfHC1cC7M/bp9E1YHqoXYgiXvswRpg5xN5aH9H36XQsP9O7IntJS92m4wx9AMw6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaoVpluwYNHxoHZXxsUdx+M3Ht4nbiU8CH2cYvlRsWtesVc1Iw
	xjZNgPT61IGK2RByn4dMfKtq5WRPwrcrrXc09JJs8xctQIHIXS6ymAA=
X-Gm-Gg: AR+sD11TQdaoPeGvbf0JqGtEwLFRtNF3oY7zPatjsfeLjjyDHrjaq20vqCrwqoNMB1c
	3eKkmPGuWsNCnAXURHNqIT7BirWsAclsevy1bfC4QF+C421LEFvCk4TRCBXbJ5cPZHwtly8TkYB
	VAxofCe6wsqtQOKcZVRofDNbz2Y/D/qM+bOVs2BebZWWkw4tzN2XxzMZTWpTI/HVXjHFM7O5sfX
	4e6VB3Kyv4gJ9ZH+z5Bw+eR+R5GmVdTeNNtGbLOatyb8ij0ZzvfAHc5lqo+kVtjTX9Y1SeEiyAp
	J9Rur8b2YsgAPwEXw1rdMC+5CWlzJFM/7bdPlTkZRtadhsvQtJRKCy464CVeC3HNExX+lCsSFGK
	xhObK9MgjdN1iSxtpi4oa5yDWHk9gplGgv20tJf7k1MSJOodxNWt9FlAedzoCQfRDkw/CS7TEV/
	qZTdanlNefz05Rx419nPw1qFD1Sjd41KrlxjO4889lDZqxnn+00Sp7VwB7bKR7bCwJnoTGrWdep
	OUSpWGTK3YDre522N7g64VgyeP+w62VtiMGAC/j
X-Received: by 2002:a17:90b:2541:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3933e5d2332mr8447176a91.11.1786730091422;
        Fri, 14 Aug 2026 10:54:51 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm11128710c88.11.2026.08.14.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 10:54:51 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/2] add support for Aosong AM2320
Date: Fri, 14 Aug 2026 14:50:18 -0300
Message-ID: <cover.1786725567.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
communication protocol and measurement conversions.

This patch series adds am2320 to the i2c_device_id table, creates
of_device_id table and adds both am2315 and am2320 to
trivial-devices.yml dt bindings.

v3:
- Added "aosong,am2315" and "aosong,am2320" to trivial-devices.yml.
- Added of_device_id table.
- Replaced using a constant for driver's name with chip_info struct.
- Separated code changes and dt-bindings changes in two commits.

v2: Link [2]
 - Generalized KConfig description text.

v1: Link [1]

[1] https://lore.kernel.org/all/20260805183733.1000550-1-nico.antinori.7@gmail.com/T/#u
[2] https://lore.kernel.org/all/20260810183337.451812-1-nico.antinori.7@gmail.com/T/#u

Nicolás Antinori (2):
  dt-bindings: trivial-devices: add Aosong AM2315 and AM2320 chips
  iio: humidity: am2315: add support for am2320

 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 drivers/iio/humidity/Kconfig                  |  8 +++--
 drivers/iio/humidity/am2315.c                 | 34 ++++++++++++++++---
 3 files changed, 36 insertions(+), 8 deletions(-)

--
2.47.3

