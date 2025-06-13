Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60D24C076
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 03:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785704; cv=none; b=pU5mKWRaXHnQdern2dhKYr6PQqvti8gGMo0nQys4MRqIJlsz3KoIwXYdVD6Uhbw3a6GDU0xhYEXFK7fNHPyO0AO7MiH9g4e+A25Lj71E5nukhLvYNRMEb4lEDUsiuAFnJyX1Tgna5G1Rqjq0HR5/tiMNXvVSL4r7AaPo7OOe0BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785704; c=relaxed/simple;
	bh=Vtzq4OfDOPaA3phKqXp3fNWmDWjUoNtA06G+mvdfVLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aque2T+12hOUJAjbkTLb/D+DyGoKUtnbA6abaUR++WO7lLyRZBxSJ7Q31R9MSa2iMZtnPSfsTBJe1/bHY+WgohIA8sAQQSYqVWxG+OBoUrLQErNsJ0lNqx4SLeMbeXbmTG2gUY4/QbLyZFKj7++qsQ/D994q+AiXjDb9mdzeKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx3O/g8E; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx3O/g8E"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3137c20213cso2028360a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 20:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749785702; x=1750390502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV4uFc6vVwWL/rbS0pW47KvDrxXYmYxSN6tuasAUz2c=;
        b=Cx3O/g8ETa46tDScTHmNDWnQKKuSBpqxTXxJmdj5hL1ekl5d5Bh0PyTyXGnhnjNmN0
         W9Xbgb3qCP2iTBS9qqEsz7asCmTwiTEP8qVBb4xEBQtVyJR+FikIL2ew6xknyy5mN3Hw
         wYBOjuBVUoQYIeNwFwoNzdqKCGXOS2QUkSf8fRggsh/mDnrjxxeNh9xBH5TJWS3Ld8ht
         ElOhKni/w7joUCUHEaQqltsVHy2t4VMRFxUEsN8vqmkL8lnK1TOKLHyAeANstZ2tNU0p
         am2sR6cy0taWjgYGQZwO+BOMp7eksGdLVFDB2TKw0ke0YwBGzgBKRK2+EIq6B5APqu00
         cC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749785702; x=1750390502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV4uFc6vVwWL/rbS0pW47KvDrxXYmYxSN6tuasAUz2c=;
        b=Wy1dyphj+93gZVMkASbyDLXqtZjLJP+mCreY2oQBfmhF0JDVKwVqBGzS8G485Uryy6
         aCxtyd22Yts9V8a5367N+XWkGPGqddPMPdQhQ9ghst6XTVbbNKYyJ5UcUjFcQ4nSGWmN
         wuYLkFk/H82rNtdySigT2mpWywjKOnEp9E40VoSOq4X9dqcgfB4IGCpL6pP68bE8SN0b
         ov8amjr3N4+29xm+vY7Yr2pD+7g/qXQDJBHCOOXSLExNUt5Yv+wqqn14CTrITQQc8rT7
         O7wTcRWI8kUUUa1aOsdKERCMwisf3cu0P8fsW5y6Yw/sWxbr8S/k8/WfPyjfX/GG43Ry
         sxoA==
X-Forwarded-Encrypted: i=1; AJvYcCXc+RPVpgPpinr+RKPPsC1ZwtTIPuZJLxe9I+GnJSkGComyhbC6yNNYEmlyKkm0dHGKLFfi5CrVMzXUqkxoUUz6R3OgKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfclDnCYd7b/ANHkDTdOiSLazDEC6hu21Q2/fRgM6k2I/QLmBy
	AA9FuptPiDZGUIAAa4sLnevHzduNcBw3RgKazRpoUcszjvugVFoLVhgi
X-Gm-Gg: ASbGncvqTxY1MyUOKVnvqjSiLbxtQZXuwvIvWm4Rq/0s/6M5u4z1ueSud9i28goAQ6L
	XJTqgY0J1JFjo9ZdeE97DdAnjSh5JHMHbkY3x3cakB8A45BgOn19VCUscvCFiAklnvLXtQT4/Z+
	ZYxTAig1fb/cjbjO5FXC6luJl/W5F3YWyo+L2JrI/qkPggUkZeTHR2SZrsw0guL07xSZeWr5bNf
	AJu9PeMWTDs2td+JebZKSYhM9WwC+8xDJ+D/ERfev9tNXESqD0fxkINKVePiHCBzaxXOoJmO1no
	sxbv3+kgfpZYmWFfKQZHJl8lHzOX7w9Snefj54dL/vxftXlA4Jls/zwZu0sexnrefVJu9esBcTD
	8R6mb7SDHhN/dl+E=
X-Google-Smtp-Source: AGHT+IFBQD7BrhJhqNst/xSBfOtv3N+sY80Vdm7lbkC+9a42TrW8pSZIA5GyYozmcOrqH1QWVuN73g==
X-Received: by 2002:a17:90b:3f88:b0:313:1e60:584e with SMTP id 98e67ed59e1d1-313d9c34df7mr2348709a91.9.1749785702170;
        Thu, 12 Jun 2025 20:35:02 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm2339081a91.13.2025.06.12.20.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:35:01 -0700 (PDT)
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
Subject: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in clocksource_verify_choose_cpus()
Date: Fri, 13 Jun 2025 11:34:47 +0800
Message-ID: <20250613033447.3531709-3-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613033447.3531709-1-richard120310@gmail.com>
References: <20250613033447.3531709-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize cpumask_first_but() helper instead of first using
cpumask_first() and then cpumask_next(). The logic is the same here,
using the new helper will make it more conscious.

Use bloat-o-meter to check the impact on code size, the result is the
same, does not have positive impact nor negative impact.

$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Function                                     old     new   delta
Total: Before=22590709, After=22590709, chg +0.00%

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Generally speaking, I think this is just a small tweak on the code,
making it more readable. However, no benefit in code size or performance
as the implementation behind the helper is in fact the same as the one
used here.

Maybe more tests should be done to ensure the change is solid, I hope to
seek some suggestions from everyone who has any ideas, or this is enough
then it's good.

Best regards,
I Hsin Cheng
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index bb48498ebb5a..12ff0c048570 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
 		return;
 
 	/* Make sure to select at least one CPU other than the current CPU. */
-	cpu = cpumask_first(cpu_online_mask);
-	if (cpu == smp_processor_id())
-		cpu = cpumask_next(cpu, cpu_online_mask);
+	cpu = cpumask_first_but(cpu_online_mask, smp_processor_id());
 	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
 		return;
 	cpumask_set_cpu(cpu, &cpus_chosen);
-- 
2.43.0

