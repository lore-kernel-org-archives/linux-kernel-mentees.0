Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B2F2C0276
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764794031; cv=none; b=lVxB8lyLjBVnZYZAWbif5ZJPYGPP5Xh1XF+rOCdmeg8ZlOKSx3XXfsXNpAJFRsx9kLM7RJGQ2SSiNFLH8qfx5e9ggvVbdawbbPvy9E9E4C2B1clQJKJi6+Y4Wp+Z3hdJ7gL/LTgTy9QtOtCk+jF7tpDyoJ/eoXrxJ1RNw0bWMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764794031; c=relaxed/simple;
	bh=J+muBk4mTDgB1RI1ZZT4tfVZdbWbgRIBau1QJ8gHEE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o6hlpCG6YwrUmuiOLNJAK3/A0/IcWrBK55DjnzB8o0TRNOzggnVxMFUI2yPVEAs4Op/6qTO+nkZexmrNV1jfpcrpHyBeF38rwQImVpLi6G33QhNbiiGg2YGRsr50ZMyM6291Z9l/ZHtm/lzcH1rEHB2beSt7wdetuuP4/MMXbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTdxvIeX; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTdxvIeX"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72F7860E1B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5AsqJt5D9zD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 20:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94F8D60E16
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94F8D60E16
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QTdxvIeX
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 94F8D60E16
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 20:33:47 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29844c68068so2404265ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764794026; x=1765398826; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbcoowEBKtv4dFsBzZpZawiDy6BLzWshOi2J6vbhmoY=;
        b=QTdxvIeXM3Skh4UgV+b/LW7MKn2YsYO6MqCL7Z1yPa3ok2n9vB8jvzgZoDNVEBkVs2
         LsOBU4ZIgHvLgw83wrfiQANcevM3gS/gTPdCxSg+T/wuzA6YqTc/rvqy0is0atxymREH
         G0PrH1CVfmxuFqDA8qc/6pgnUQzOjUnt4Zl9qizsN4cGN2Hk9zwrb/TSSzsgnreaCF8a
         Us1tdZB9pd0rBEIs31olXqg4TRR6Tjhbk+rOnOpOu+phcD9MkyDuGpe/tgcNiINTMup4
         xSeDTQjMsPABCmeJcom5TBx6UoEgaSObK3fNAwgh3O9xPW6TS4muWnGN9ClNzS83nhf+
         LONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764794026; x=1765398826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbcoowEBKtv4dFsBzZpZawiDy6BLzWshOi2J6vbhmoY=;
        b=QrYwjW0YluGQ3D8lTLLGSqe2EiAVidWpAHctVDJhTm9LdqN6KucPTmJ2korgHXePkN
         MENjacfitqCuNi8hZcmwKU2Qqx7NaRhGykLtaM0iWGCiojK2AWI38mX7SOm12/dZxW0N
         /8JP1dFwOBt0gV51s39rF/de+JaRF0kp21MSdXuJMsQi4miNlx9b6dlC2JZBvHaBHqKj
         vou3ky3bMLOw+4mHWW2SVUJ12KD892es8zhkpZeGCcWw1i+WZuGU8PhVFOCtgrbweuF2
         2cLiwltQqIQZqU6t+vnkv8uTzPpQjOrFh5lEceOr8+KPzGRy1F9tNuZg9w3YXqApIyXx
         a1yg==
X-Gm-Message-State: AOJu0YwOQgZEcg83uEoZ4QyO8doVxcAwDEQxID+Cy+iplohAastaMUpj
	GA8t437GOj15AAdxkXg26q60TVlxzcxoj2iUWQY0wYjID+amEa0Rlo4REubE5gwY
X-Gm-Gg: ASbGncsmhM66U94X3EqgGJ/XGpefa1HyNAkAxQYMUDkq8ynJv4o98IGVGkRDZxQjrOt
	Koo9NwKLPtbpObtryn42cyEgYigkonOpUpbICd/h+gggoyRu8vVcKzvkBzQ7n3FSnQZRfuMPC4i
	+iVgTggPc7bTdxK2vYd5kn1A7Adp2yy0pVCspM2oejGjlEPonURYdAxE53WY99D9/YKEg6SIkny
	0AFmtXoB0fShVlPIgS8kZVG0bC8rtfaFYRk2hjq8296PpLhNqlFE4DoHAlVgZfnZgkdAeLRfmqW
	Sf6ZwVI0dNCfJM74Y+zDjT0vLcAHrXLJHjS4nb5DYqxxGQWRkh17mq/bpkFKjXj6qrmhxt+vtMv
	Ecf5Xc105cBCP4tIxKmFISJ5bCyc1K4Zp8j5WzQb1p8cT/mzTFttJBhCO6JahLWvJ9tYZISrrAo
	XjMXwyY21j2XIEmlMzbn/1vMXYQ90CxCU=
X-Google-Smtp-Source: AGHT+IGo6ueLf9xzDjn3LAVkm/0AniLnI9rrcAGxICx5w71zIEegF5JfoZlBRnQoR43NUz3WU9Qb0Q==
X-Received: by 2002:a17:903:2446:b0:295:73f:90d0 with SMTP id d9443c01a7336-29d683d359bmr39224885ad.50.1764794026121;
        Wed, 03 Dec 2025 12:33:46 -0800 (PST)
Received: from soham-laptop.. ([2409:40c2:116e:6f1c:ab6e:2f5d:e763:cc6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce477e94sm192002545ad.43.2025.12.03.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 12:33:45 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: sync: ordering: Fix dead link to LKMM explanation
Date: Thu,  4 Dec 2025 02:02:22 +0530
Message-Id: <20251203203222.70415-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the reference to the LKMM 'explanation' document, using the `srctree/`
prefix triggers an htmldocs warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508301445.KuPDLTET-lkp@intel.com/
Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
No functional changes.

 rust/kernel/sync/atomic/ordering.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
index 3f103aa8db99..d71c4f582f75 100644
--- a/rust/kernel/sync/atomic/ordering.rs
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -20,7 +20,7 @@
 //!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
 //!
 //! [`LKMM`]: srctree/tools/memory-model/
-//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
+//! [`explanation`]: tools/memory-model/Documentation/explanation.txt
 
 /// The annotation type for relaxed memory ordering, for the description of relaxed memory
 /// ordering, see [module-level documentation].
-- 
2.34.1

