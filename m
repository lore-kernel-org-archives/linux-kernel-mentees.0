Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2A28BABA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755619101; cv=none; b=D2cvdxp0F+tP7rKlY6Ghj+mwpQMpt7orDw8ulSZlQKQE3OXGBeV+EOCC1KQl0TEGyO0ITxHNCK3l5SQ29wYhoDxpBHedmMTU0l6abwNfn0AlsDyEeYaIhqr77KSGs96j4VWIK9bwpZh5GK2GHdz44cJk77kssPy7sVzaHj0Nnxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755619101; c=relaxed/simple;
	bh=m9dSNoor5c3jxuIbjHd9hSq6RwgNDQDjHqmYeR5iK7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oda4XvcnlwlrDUt78BK5qDTS/AVC736dINVbiBVn/BSWBxHLj0mNjN/u9RrVhW2X4W8yX3tC06B4limLEMQjLvcDt5/8ya0jrwh+9n1W0g5U5ifizj9R8rCbJH/+QN3u7ZnrxdwrnVE21ehttVZKwR6PdS8sm1pDAphH8kB06lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE230PVT; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE230PVT"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2eb09041so4657666b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755619099; x=1756223899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAC9ZIG21u1yEagYiw0bsnH1lXES/tFXaANXtN9HVbc=;
        b=iE230PVTirFnQo0A1WsGs22Adxl7Pthh/kRQtHn6L7y3GEVV/v59O2bbj4h+Od4pcu
         Jk4C7TmgEI+X8qDjYbcGgnNkvLIZdS9M+83c4tZeN7LOKItTMAid9GCmVDmk/6TyTnkt
         e0LN+XPMilnD0PTC+b5jmtg2umDBVdATHU/H0m4c6dHBZRbRg8X43QCyVJBeTLBUZYP0
         IGkBMm0s0yYCFt+vAVruOWPuUGRoBNr1R+E7j3/SiAhInss5XvW9Nf/IwGoy6oYkudzm
         OiZi4CUPK/PKgEPk0723E4Qq/JzJuwzyDfbaCnYsKHsMP50XuI6S1y0T+IhJqvleh+dA
         cZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755619099; x=1756223899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAC9ZIG21u1yEagYiw0bsnH1lXES/tFXaANXtN9HVbc=;
        b=R+RfGbbFLW3szmDo3G988Ju7TTGIytsPZqEcif5lO5lDkilPjxhW5gp5Z8Fa/NpoG0
         KAV4ADQ40ZGef0/ttTequ31vLfJuvE711MuhTW1oMYNwVmakwZXBpCftgmmvmLXIFn3B
         PwrpYyo9De5puBaFDzn+A5v1dX/Tda9GWS+SVe+WHqEGT6n6xYt4HVCW04P54dH/dixj
         7Jy1p8lP6riJjApRoHxUvD6fXsLlYcEqCFiMr3GS8X/zYOFkn8SiE06Vl+zjWpM3ycYl
         b+sfAqer6p5Kh/qjX1q2NOebLyW851gVRwVGVdZGXupW66WQSihWiI+ARuwojHPZSwRH
         NxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3c7njTnhJt+bd05bHiWOFsCN4KgagiTV+ok+MqwWw0FO0I4b5aHEre8L0BApDYG2RJjcclsSRQcHyoqPB4VR3Z/31ig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi60yxj3bUSTsMnRq5cKAX+5j6XTed5a5rlOK0z3RrnxUgMMtu
	1tmuJz1c2jHHH59BMDMT98MjcG+XJqphTj9jEhDml0/ezrMY2j9CGxou
X-Gm-Gg: ASbGncsAbJDoToyxqH/4C/LaJ0rGVeI0bDD7sJ5x/9sKuXZsVLVw4EzwU9GBa0fMErt
	aURpMKLHVOJhgM8hWHOQ+jWX0AbpHjj1R2xm+RyMZjpk0Lcl+bO4kvevWxhyfqlMxKXj4ph9/Jw
	+eB640p409cyz7sxfxXvY8WFk6atv2OIEnI97h5tkM1nR9tl3DrHf3danmczWLsDLnjHWfAOysu
	7D3oikkPNHD3MMij33qYVhCZrMjjiSm9gH/c/W/t1kCFgTQxU2G6eJMF1VLJnrKUPYtK0l3HmQP
	h/lFX3+R8rAFMAmmMe/NayoLSsF8ozP+D4lnErc04xT/yBBFDSDMdq69xorWHmX81sNatcSYXl8
	1wnsAuYqYdQUlv1AagkPLx7FoSjKSnzDJx/1h+/14H3s=
X-Google-Smtp-Source: AGHT+IEZIUicpIBsSqReeGItn8Ta0qk2ND7WkfQv4jrxRViSC5kLH4Rhy0axgGq2EVDXnuOiqOUZuw==
X-Received: by 2002:a05:6a00:14d3:b0:76b:c882:e0a with SMTP id d2e1a72fcca58-76e80ecc347mr3176011b3a.5.1755619098531;
        Tue, 19 Aug 2025 08:58:18 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d16adsm2870331b3a.14.2025.08.19.08.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:58:18 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: tglx@linutronix.de
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	mingo@redhat.com,
	peterz@infradead.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org,
	bigeasy@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] selftests/futex: fix typos and grammar in futex_priv_hash
Date: Tue, 19 Aug 2025 21:27:53 +0530
Message-ID: <20250819155755.4665-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819075511.6mHXEwdt@linutronix.de>
References: <20250819075511.6mHXEwdt@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple typos and small grammar issues in help text,
comments and test messages in futex_priv_hash test.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog :

Changes since v1:
  - Dropped hunk which is already addressed by 
    https://lore.kernel.org/all/20250808112458.831212-1-colin.i.king@gmail.com/

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

 .../testing/selftests/futex/functional/futex_priv_hash.c  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index 2dca18fefedc..67be60a8238d 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -180,7 +180,7 @@ int main(int argc, char *argv[])
 	if (ret != 0)
 		ksft_exit_fail_msg("pthread_join() failed: %d, %m\n", ret);
 
-	/* First thread, has to initialiaze private hash */
+	/* First thread, has to initialize private hash */
 	futex_slots1 = futex_hash_slots_get();
 	if (futex_slots1 <= 0) {
 		ksft_print_msg("Current hash buckets: %d\n", futex_slots1);
@@ -232,17 +232,17 @@ int main(int argc, char *argv[])
 
 	futex_hash_slots_set_verify(2);
 	join_max_threads();
-	ksft_test_result(counter == MAX_THREADS, "Created of waited for %d of %d threads\n",
+	ksft_test_result(counter == MAX_THREADS, "Created and waited for %d of %d threads\n",
 			 counter, MAX_THREADS);
 	counter = 0;
-	/* Once the user set something, auto reisze must be disabled */
+	/* Once the user set something, auto resize must be disabled */
 	ret = pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
 
 	create_max_threads(thread_lock_fn);
 	join_max_threads();
 
 	ret = futex_hash_slots_get();
-	ksft_test_result(ret == 2, "No more auto-resize after manaul setting, got %d\n",
+	ksft_test_result(ret == 2, "No more auto-resize after manual setting, got %d\n",
 			 ret);
 
 	futex_hash_slots_set_must_fail(1 << 29, 0);
-- 
2.43.0

