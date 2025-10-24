Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C22EF64C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761337258; cv=none; b=nivrWTP/f1Weju+gn3cHajHZ1hVAiVIsmU+e/OqHVHjauGmxrlpP43qktAcykjZpbKX73gHNJP4byQw16xRhJ1Vp9SJWOhs62GEPxFc86kBeLXa6vdxFUjWhmSZk36IE8P4aRpjdL+sGRNJ4Myq3QAdF714K9E0PNDB84FHcc6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761337258; c=relaxed/simple;
	bh=6NPx+X2WywRhQ+1oS5o5Hec/aHLKkdUJXFTe4ZBYQgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lkHzYRpMGT5t/B1eHLFO7IhOkiiL4I+d1o6ZAnNFe4UY6BE9jvR5uHqafiUDZPaSydTs5YWMEjM5XZMZnWz51ulcNfJb6BFTUuNJ3TUEn8LOJx2P1YnjkRQNanDGTjRDmIl1abvJOYBkL1ppJH9UNQdslhvwGyJ+50xEx9/A8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlhNQNLZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlhNQNLZ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33bc2178d6aso1955281a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761337256; x=1761942056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9KRiNp1ap25NQp6V+0Xx5744wiQSngYoe9dljgW0lUk=;
        b=KlhNQNLZFCJ9OGW9v2CTZvQQuCBzknyiYwlVMLay1wq1lQC6eqw2rSAShEddtbed4B
         qxHjmEzrngTeCREPA/OvKAzLV27zqdkSVcJP6/P7mFNTH6SwtMDQaD0hdTWpxtT9ThZn
         SpXXUouib3bzunBzYG4+zsToYFpz/QqpuxZPvwQYAlroCQI2v25pHuaJ0m9xIQxAAU5g
         BQv2IgXUCpiPkVwrOl2FP2Zp1lseW9V//S16h/u2+gjMjVk/1Lt8CgLX/M9o8iPojRsV
         ksb7j2GRqtcnOYG7UACwFCP4ddcbZa0ZsTWQMuQtdQRw8tW7Iq3tVbBO38rH5u5nGX/i
         YZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337256; x=1761942056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KRiNp1ap25NQp6V+0Xx5744wiQSngYoe9dljgW0lUk=;
        b=w4cNC01ylYFXz8KNwJxBsy73OyQl9+7NneAvR/uVpI3ecTdjRO78XQRmvuxmf+aKwT
         hcgvp3+GJh4gFgy3cUfsa8tpR9NbnVgiBLm+tBGDJQv1siEFfKxSoP+JJa8W3qQ59wuX
         1Jqn71hv68WqO7pp5jfazZO0v0NdK4Q93lTgpgfU8e1DYduXDFhcpOknygt4uvBEA9fk
         7/hsMlTSX+/Uzq76bZWf7hbOuRsTIE0SVPJbnTKRv1skGpj4BDL2zoVL89TArwkIeflb
         5qfm3pvmMasJeNg/p8+m1alJjXLJTxp4wJFqobG4gZ5CyJH2Vgmz6jhHLP/TWO2lBQj1
         frSw==
X-Forwarded-Encrypted: i=1; AJvYcCU9WI9Zmi+CD3oUo4GfWt9HnWITFi4kmh8ua2UJmIbHFJ1UKXtAiyEQnVr4HXQqAd+H2jWhhE7X/2CBQAaoAH8WU0tNIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6skFh8W2gKOWLnleN3q5qK8WVXtUouALbvqDUS1BMEIsnGJjp
	yKz6NkhCHD6pja82wzaK4D9bghLyD6OrmwWc5MJfQiph99gw9WFcTl28
X-Gm-Gg: ASbGnctQJqkIBxZ6fDnobQOt01rLvza1boGoyXJcXYWfUuXnjQOv5FKsn+n6rJozi9M
	p4HVHowmbJA/fTbsC1DV/0jSD7LFLt6lEnoFjpa6sfYR1y6x0C/4O606G3ldoNfqrNV+qr6+KHy
	DyzOfkmcQTlOvrDobogE2pz2NGwNbzrSW9oFhQolQD7RH0aW/uG/jyKQ1K6UCrG6QE61Q2J3iIw
	jDgJ7EZ+lPgkpVevlJ1DEaPNQxZwTgiKDqQFmAgTTi7fYTVKNCacnduEsnHxobBMk0bWmgeGiYr
	Y9zb7B486Z3Y9lQL/ORQ/3KgqAwbQ24Sv/EAjUlFarLtFTu1rZC7YNEuZcarFOza/wQWzxdc915
	qz7/s/KsfuPigUP7N7VMelpOR46yr/XIMmkHaLlt51xJ5DG+3VZPcz8Dkacpf0QAQayhGl7q4l/
	0pBJMEd2kje345DkzzUFUnamtVhFIkmQ==
X-Google-Smtp-Source: AGHT+IEbhlPACOmKZ3NUiAKCZ74uClfD7T6fHIUOPv7o///eViQUAWbiITUiLoEhOia3JIqDriWEkQ==
X-Received: by 2002:a17:90b:3803:b0:332:250e:eec8 with SMTP id 98e67ed59e1d1-33fd65fe245mr3970297a91.15.1761337256432;
        Fri, 24 Oct 2025 13:20:56 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e224c9bd0sm10001563a91.21.2025.10.24.13.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 13:20:55 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: cryolitia@uniontech.com,
	linux@roeck-us.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] hwmon: (gpd-fan) Fix compilation error in non-ACPI builds
Date: Sat, 25 Oct 2025 01:50:40 +0530
Message-ID: <20251024202042.752160-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building gpd-fan driver without CONFIG_ACPI results in the following
build errors:

drivers/hwmon/gpd-fan.c: In function ‘gpd_ecram_read’:
drivers/hwmon/gpd-fan.c:228:9: error: implicit declaration of function ‘outb’ [-Werror=implicit-function-declaration]
  228 |         outb(0x2E, addr_port);
      |         ^~~~
drivers/hwmon/gpd-fan.c:241:16: error: implicit declaration of function ‘inb’ [-Werror=implicit-function-declaration]
  241 |         *val = inb(data_port);

The definitions for inb() and outb() come from <linux/io.h>
(specifically through <asm/io.h>), which is implicitly included via
<acpi_io.h>. When CONFIG_ACPI is not set, <acpi_io.h> is not included
resulting in <linux/io.h> to be omitted as well.

Since the driver does not depend on ACPI, remove <linux/acpi.h> and add
<linux/io.h> directly to fix the compilation errors.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

Tested the changes by recompiling the kernel with and without
CONFIG_ACPI for x86_64 architecture verifying that no
compilation errors are generated.

 drivers/hwmon/gpd-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 138cff0beb4c..4c45c0154a45 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -12,9 +12,9 @@
  * Copyright (c) 2024 Cryolitia PukNgae
  */
 
-#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/hwmon.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.43.0

