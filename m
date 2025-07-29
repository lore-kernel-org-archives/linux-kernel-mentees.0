Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA48224B04
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 04:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753763192; cv=none; b=ojwg9sd9T5YCPDLW5VsBO9bQgnAEE5RWFNVYBbc1eBBZ1szwU7qTMmvI5W5g03jidqlQkUFXkV3mMvC8jpSNUZzQCkw/EhaYt9zZrP7iBDZSEQEDhKGHtg3pWYuVWTWzqRFeez0p6YYO8qaZZqkW397D1+G7c2PNg6ijgbyX8T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753763192; c=relaxed/simple;
	bh=CvKeu58IXrAdvxQcD8lmzf7MZU2YYjTVYOF+YIPPfv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hSgdpQVQpFBNzORVgOxdCcJPDDI6qFuXFRqHQnS+MqSAAKaW2ni894IhydJCNHDnkbGjnhTwI9Qz0tZJ1l/PLPJJ8VUjx0UUxIY30PfLGwPDQ1Pgg39I+FEaGIabaSajQq3rrSDOVGndCn1VB6ELETFff7RWlR546fQnGWQfk0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmL4M8cd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmL4M8cd"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-769b19eeb3fso280805b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 21:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753763191; x=1754367991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ilKaDFR6OrZjzX6D5Zrq3NqUyxXJfxnBkaqIM4VqV4=;
        b=BmL4M8cdUXWa8Jt2nHj7obbuENdJldJKe9SGv0NU8QUBYItuMDk5wB1vHoJZt0dtT6
         2oVip325se0lAgk09LonOkrC1j68YbdAwW0PHKKSJ08TFlBolzQ9G7Z4wMzZOF6Aw+UO
         qQHWbWYwdBg5Q8gY4A4sjRjw4y4VMchpB8MVYAO99tgGvC6mzxkEJGFIyoI1oZD4w0Dx
         tQuc56QL8zM3NO0xH5Vq2z0W/mh4BHG/Ib2KvH4JZBp/DoLG9/WI5Yee48tNJ9Vd5v32
         WUfxTjzGeEzI43WTHZlmlsePANLvnHlvNSWhPoCFiCTNQZ9YbjCXIETX2WKrSJLoMm6J
         3BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753763191; x=1754367991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ilKaDFR6OrZjzX6D5Zrq3NqUyxXJfxnBkaqIM4VqV4=;
        b=jjT8FI1a1yDYgzxNhwzbEtTE7uNbIIwu9Hpxu9g8LZDoF3dXzRFpizh1aH3gjVebUJ
         ypLJB+BJJT+EpS84ZAUNhrMgsQfk/Imkl1RvHFJLhHd9mwbjsihduYO/LqLjxNCyug2Y
         d/bGrTs0lRiHuV+yY/V1+OUJjUeRMt5Z2hlXwYBBcpmcxbqrdZ73LmhCb29kkHAy0PE/
         5r+hKYE0S8RFlD0Rune3PMEo/sl5W9WqRpe91CcaYIkq5gfXACzHOKtDyAYLYof70Qca
         WMiicPYECOZ+IvEfVIs1Uwq2LTeyqA4jlEw6J0G6AFTJd/zQCpXUP4IB+y8lPLjAZcT7
         +KSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHQa5SGLzZhDPkfOVkG+roQYkh8sDIlAPhtjOaLQ1CERwI/fktGR5amtIvLXnKWC6RwOW/2lSUooCsBsnVqRwam2GNrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcdpFfOiI9+/9CLXIP51hOrTc5YhJyqF4hPIQCZVV956FsDMmp
	94grVDpKTKF3noDCN2bpOvabfb7fdXC+RcnCthwHwAvBbh6kJWkLWRfM
X-Gm-Gg: ASbGncvEQZqHCwpH6RCNq/PUybvz/X1AKgKiIJ3ZIustWDjWeCF/a+tIDhJLYqfpZHo
	lgpupeumAa0hfmI0GKH33e3P0sFG1IR+Y9pyw/PZdJptdYQsRUaqkYn1VB2l8WDEz5nHWX0AsjK
	OTylAu12EWC573rHbcCw6jb3omfDGQ1YRtxPPMentLm5U7HE1FyAIu6MsjY+sqLEoMtrWLpJM24
	sIo+umvi+CWiKEaJsRz0ZKNc3xCw2zgt8iC9Y9MaICU/R/W7v+fs7VDBG+xxDyLdNvSEG15lqUb
	P8irs0LuMLYJeg8hCgD+4GToiouQmWLLE9g++QVqBPa/Q0f3JK2OqJOTqmBIXZvGD9ZTK+pcioY
	DrRuv5KezMRWLkz+iD+L6HfwHnoEktA==
X-Google-Smtp-Source: AGHT+IG1Wq72gaOcqPtisiStSjKio1cSFV42RF5HqkyXJmQ4IEvYZhzGHHenUOoI0rFgFuBCBhkGDw==
X-Received: by 2002:aa7:8885:0:b0:749:93d:b098 with SMTP id d2e1a72fcca58-76339370d7dmr20500083b3a.22.1753763190556;
        Mon, 28 Jul 2025 21:26:30 -0700 (PDT)
Received: from archlinux ([38.188.108.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76419d84234sm6742570b3a.57.2025.07.28.21.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 21:26:30 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	darwi@linutronix.de,
	sohil.mehta@intel.com,
	peterz@infradead.org,
	ravi.bangoria@amd.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v2] x86/intel: Fix always false range check in x86_vfm model matching
Date: Tue, 29 Jul 2025 09:56:21 +0530
Message-ID: <20250729042621.6403-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a logic bug in early_init_intel() where a conditional range check:
(c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_WILLAMETTE)
was always false due to (PRESCOTT) being numerically greater than the
upper bound (WILLAMETTE). This triggers:-Werror=logical-op: 
logical ‘and’ of mutually exclusive tests is always false
The fix corrects the constant ordering to ensure the range is valid:
(c->x86_vfm >=  INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_CEDARMILL)

Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural
constant_tsc model checks")

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

Changes since v1:
- Fix incorrect logic
---
 arch/x86/kernel/cpu/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 076eaa41b8c8..6f5bd5dbc249 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 	if (c->x86_power & (1 << 8)) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 		set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
-	} else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_WILLAMETTE) ||
+	} else if ((c->x86_vfm >=  INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_CEDARMILL) ||
 		   (c->x86_vfm >= INTEL_CORE_YONAH  && c->x86_vfm <= INTEL_IVYBRIDGE)) {
 		set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
 	}
-- 
2.50.1

