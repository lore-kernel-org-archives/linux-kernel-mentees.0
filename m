Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F64854E6
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633267; cv=none; b=LRQf1KILySa031eeO0YHQb2dYhx7ZmIDwa+U9pKpm7z477Gh4OhRG4Eru3WsZHdOWlMJBTxG2GX4zfXBfXByVomodzCZ+3kTFKtR2JGPlnlzmJBFwN5o5r3uWrkxU7pV9U6w8NKMNTLfpKfIGaKcRLS2VmxZxrShJgANmJbWTmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633267; c=relaxed/simple;
	bh=xJ79EtUrHEeuEYbAOfI9CE6RiB55ObHJWLRCeFudrRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jneHzgPOECPZmWoEk/A5h6FI0i9T5rm+7gC4ODsqCr0yEQEyh5QNGkQn50abcaLV5yaEyHbha9jcF2ZHKfGp4sKqkD4dRP0zxl/hQIp2a6FH5AZHzvzOmq9ZJ1/ewTHMiba0HYtHfiIv8jjlJJaCaul6NOOZZcxupDHeOtUALJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9x6k4Dv; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9x6k4Dv"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-930c0f9c1b1so137632885a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786633265; x=1787238065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWO/kZlEzRmoI80cXBVDsIHqzzbSVdIgM/uL6M2n2SQ=;
        b=G9x6k4Dvbtw4rvn5ZlEryjDor40UlvamcKqbbW9ivVQvYADl5UZvAZ7mAnN9o0ehhe
         jQtIm+zDE1D7s5taQ0/HgYbu3ixT3FD0B4Dgu/7l16eKCeoxvUXwEsmLawxhWaeuQQtF
         EBmGVsZJQY/z5E0w0ovmO3p+YqDds3yV5Wf7ewy8KfRcEQNAwWRvSvy1eVQJgPe4f0qd
         bmpSSiEm8FrpD1HN4OEVRdo1P9ZLO6oK8FzICRiZwDdjnPyFNxfrVeDW58RJ2+7K6S4A
         g20jBnwxZZvlraQO5ybPJOKRh2/fYA0IBUfwE778qWh/p96AkEj1vFixPtxm0zpgNbgb
         9wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633265; x=1787238065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWO/kZlEzRmoI80cXBVDsIHqzzbSVdIgM/uL6M2n2SQ=;
        b=BzdBx2EykyOsWTdHmIx/F+smaQkm16l2W2g3bZ+R3UcJN/zbuqnCjPOv/rXAgxpCZ6
         ViQHdglqrD+R8IMrdwLv9ZsVm6+Au0/1izDNzfOneMV0GveRcVRiKnfQO1Jn/hK0Xp9z
         4S5azsIf6+QOLCEhILVd06R57iVPfJo1C0KFYGYCrmnk9n/Eqc+UTv8B+NmuDgsxbJIe
         bLmgQKRs41uA4PYpm3gLXERX5fDw81nCFFcyjyfyMwXQxYyAlvaZGztrtV1Xk0x/Y5of
         qrb73oMRVQeCzC3vKmTLeTJB3FJbLmXivfJMjqkyMUwUuus+lzLWxsBeGq0IopKyJNac
         xUgA==
X-Forwarded-Encrypted: i=1; AHgh+RqQAzNRE+hovZkL2qADQ/DvGIlnOJldPyKBOwhev/56eTqB5HnCYQ/cO7bvPC49hMToKyEuOR0x6VAoqIguQIrRnT3KVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz96Aq1iNQAs4RAZcKcY6XfAIJ85Mj7OKKO2s3zR1L0BS4zoHNC
	EPLaSCuvPPHN/B62wltuYteMNq2+xYlhnOWSyZshVSsYrYvG59pno7pU
X-Gm-Gg: AR+sD10t+02soJs17ElDpruYFvzJz81KxZkHqK7vS/me+tqwkbJMN5GBqGhRPhB1Wmi
	PgFqi5tqWjchuvzXRKBR6QAee7B3aGJiAIvZoPfSsEq3yN2t9t9TrXaYvon/Y14Dwj/Yr3s5PRT
	su4rfuk0/BnGMMa2GKre4ML4lL2ffQx1W0oC1iWHj/ejbA4n7Bj8HuZB20ANg9VkIBOBw91kjbW
	s2Wf7gLd6fgLm4HMDhJvazs3koL84M9eDsB+NJyWVj5kE1I73FhUx0MSITV/jKNGuVuqPx5dXX4
	3VTnhWGiIhYOhNfKvhZc1nzMhzmfYV2se8ai9+guFedfmaYTZzjznrQjxLICo/rNOlUK0i7+wcl
	ScAlaXLzNQKkUezQiiCwwJ397b6fdwKVGtA2IPccGXCf7MD6Qh8Sf54u0+I4OIyg5tnjgmkxzvq
	8jonlp1EGJdDHp1nQBm/qpQDp2+QygXRQGGsJwPl8CUjpXQ+4J91C+jfC2CPKolGPWKrc=
X-Received: by 2002:a05:620a:8ce:b0:92e:745c:6c5a with SMTP id af79cd13be357-936bf91774fmr525733585a.14.1786633264617;
        Thu, 13 Aug 2026 08:01:04 -0700 (PDT)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936cdf54cffsm406785a.9.2026.08.13.08.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:01:04 -0700 (PDT)
From: Marco Chen <marcochen.dev@gmail.com>
To: dan@dlrobertson.com,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	jagathjog1996@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v1] iio: accel: bma400: remove completed tasks from TODO list
Date: Thu, 13 Aug 2026 11:01:03 -0400
Message-ID: <20260813150103.56350-1-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two of the four tasks in the TODO comment have been implemented.

Interrupts were added by commit ffe0ab6a9698 ("iio: accel:
bma400: Add triggered buffer support"). Support for events was added by
commit 961db2da159d ("iio: accel: bma400: Add support for single and
double tap events"), among others. The driver now has an interrupt
handler pushing IIO events, and event configuration from
read_event_config(), write_event_config(), read_event_value(), and
write_event_value().

A step count channel was also added by commit d221de60eee3 ("iio: accel:
bma400: Add separate channel for step counter").

The power management and sensor time channel TODOs remain unimplemented.

Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
I would like to take on the remaining power management TODO. The driver
has bma400_set_power_mode() but neither bus assigns a dev_pm_ops
struct. POWER_MODE_LOW is also never entered. I don't have a BMA400 but
I would definitely buy one to develop and test on. I also have access to
a logic analyzer for testing. Is this a patch that is desirable?

 drivers/iio/accel/bma400_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/accel/bma400_core.c b/drivers/iio/accel/bma400_core.c
index 7e3cff4cca91..6bc64ca87f4b 100644
--- a/drivers/iio/accel/bma400_core.c
+++ b/drivers/iio/accel/bma400_core.c
@@ -6,8 +6,6 @@
  *
  * TODO:
  *  - Support for power management
- *  - Support events and interrupts
- *  - Create channel for step count
  *  - Create channel for sensor time
  */
 
-- 
2.55.0

