Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD5910F9
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 00:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747441593; cv=none; b=WbIUh4gjGFvtaZelqld38l05yo9ROn8Wy7UYsiHln7sw4mInMKyVv7j1dbvjJf1i0QMdYfqphkxwoFIvuDgSwjwyDgEE2oxPErr7Kfg5xdpxcxh98qS6ffPJpRvSZkgskNxIc+SKo0JB0NMrI02tMsCV+txe0ifCBlYvQVu68IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747441593; c=relaxed/simple;
	bh=zlrbIwAQ5POYVrxJfi7s5KGoorg3woWKF0a4UQh93SA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GREm9z5jzBwTQBfg3nStmDTHV/pYgLQ26D/iVNNxza/xVsPSl5aY4S5WKUR5YpdCi/SwS/jq6re3xaJNeyRt4N5Bwij9ZLq3YmZjOqBgGpaZpF4+dz3HaxfE3OxCp4cehubN1N89JgE7tQzhjbptKyYWi3OfA9/siHf9+hmokM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHOdz5aF; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHOdz5aF"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f89980f659so30174896d6.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747441590; x=1748046390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkeSuzOefGtKsCiZB8NRqe5D9W7igkX7GFlxpgW3Auk=;
        b=gHOdz5aFzXAYKSFjy1ez4mtU6D+AwFElmh/mcS7acVA04903ENwIperv7GZ5ZjWAby
         bCbAPM5TOlZhOPcp5W3+3hbFh5flZSCQvzpWugjOCwuFK+h5tNjaq92WbtJ1/X73RVHv
         WmvgEgGYJw7qxaQb42eOY0PBKpLaOr6Ab+B98XT43HUr2hcbPFeHvmKag7N+xSsjvOwZ
         0DyAe6xzsESXfeImz1ZG7wKx5f1dkGfw+IWdrQOAq0xW9y1uhzHQIoWmZVSYBaKjmW1N
         6N8csZcCS13P9UG/0rWLeSOmSFjLmIqtOY7JtXcidJpiL7RPaY302haJZqfNrzfZH9xh
         IxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747441590; x=1748046390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkeSuzOefGtKsCiZB8NRqe5D9W7igkX7GFlxpgW3Auk=;
        b=tJgnfJZZ6LPE+tktjhJpNWkFo/GZQYEKAVCTfuwDVZGlUmyX+zVDhN/+vIUxjQ2cRO
         iUi0mr3sizQ718JeeMfLo7x2hVB0qOD/vMZCWSA6LJOfxRQDzVbPwx6D9vsRcm5P1gXM
         +xCJhBKAehpFCuLrcXa6+qcTankyzGVU85L1NDbIm0FWdu2UhQ5pF82Z2J+PhQZex0Lf
         B4VH7BMHOpa8Jbs/Gc/FF1i6QnuX4e/oDSqTN2UUNvcuoUjBSVzzW4pbmaF04fUv18qC
         XvIzBeFWAuoDVa6PkdYWF3YVScmliJJ5nBnTTn9Y+OyLEpngLn2geTdgIw5rZBarW9eY
         6SHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUcIO3Nwp2u1etx/cwvFgagkcUFoYcXZh1ndLitcD0mf3lOxEEv1Y+owdPPDqItVl6dN604zaGa0K/fuWeyHTyRV8hNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YykxyVxKzkyMx6GNnmmnVqB6dzUnJVv4Vc6P4JlLuI6CRU/341E
	e7WW8xJmqiU/XGaU/+tfhzoWGS5/Zpo1sh7c6naXuKhVjM87uPhPUPg=
X-Gm-Gg: ASbGncsqtJckKSd5yiBN5ZZ+pQJDCaVvbwJtec75Nyu1T04Ef+giJrXOI1PGUe6rVgo
	Bp46LeWK42+0GzfxKqgxwkwr8P/xUQa+9l1uoIc61udqF2mjlKy3sht2z3KT00fN5N6nFLjbse9
	CXbl3Pg6gj2UgEo9ecz9ibZdoRzIXRmGgC2aRZxK7G6PWEJPa8fV5j7Sw/tLPRjdkpH26YT4U9P
	zIiZGHdBUg0mlE4ansHSEx3yVtgwZAH9jh5rFEJ9/gA9jyvOlmfebT242dFVlSFxjUeJaZnVDVE
	FpXyo6DKbnugO0v20j6FInziHITLPSeOb02JLmcwVnYveAuObZwH6wLKa8Jqhwk1sG3jZlewRbJ
	H
X-Google-Smtp-Source: AGHT+IFZX32EhiUVhM9GlmidKs9HUmMOL7d4GicxhiyOfX1cbT/pni4hoGzriuCztbCNheL5RyPY7w==
X-Received: by 2002:ad4:5e8f:0:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6f8b0873ba6mr98217166d6.36.1747441590299;
        Fri, 16 May 2025 17:26:30 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:224f:4011:50ae:ea20:4b60:8f04])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08be133sm18344776d6.53.2025.05.16.17.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 17:26:29 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: skhan@linuxfoundation.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] docs: fix typo in rust/kernel/str.rs
Date: Sat, 17 May 2025 02:26:04 +0200
Message-Id: <20250517002604.603223-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixing a minor grammar error ("then" to "than") in rust/kernel/str.rs

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
 rust/kernel/str.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fb61ce81e..42f355f74 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -752,7 +752,7 @@ pub(crate) unsafe fn from_ptrs(pos: *mut u8, end: *mut u8) -> Self {
     /// for the lifetime of the returned [`RawFormatter`].
     pub(crate) unsafe fn from_buffer(buf: *mut u8, len: usize) -> Self {
         let pos = buf as usize;
-        // INVARIANT: We ensure that `end` is never less then `buf`, and the safety requirements
+        // INVARIANT: We ensure that `end` is never less than `buf`, and the safety requirements
         // guarantees that the memory region is valid for writes.
         Self {
             pos,
-- 
2.39.5

