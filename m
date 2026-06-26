Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02F39B94C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Jun 2026 20:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505903; cv=none; b=uREurLRcvqmDJKfSD3i895fF1GXdkiMlyOH53tMpv83Ekodfyed4+fi11VHEI3EReS+jGN45unSDxUBt9wPyUVZBdtKjVaHvlg4pC45vtemDK+eZxGg7OQ2LCeoAZoM1/3o74+DqQBvRirROW/bEgoYzqe2VeihG0jtAKhcWmq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505903; c=relaxed/simple;
	bh=8COOnbZMJUxF4xVAYNoIlb7bDxzTG9J03+R0KaoyutE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JCCxbRGjH97bKmww6GQeyExX7+tPLGo3vDRqpCJCYF/mpNtOX+D1gugQy+YOrgEhQimA/uQJDDnFY5tgHRFARTaBCXdx7t3pSmu6ZwqAIR60Yr90VI7tMphcne4d0LRGyJy0U2+n75s/7+ai7+W3dP4Q8WwouK+7mevMS5NKwo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPBvAzw2; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPBvAzw2"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bf132969bso2157263eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Jun 2026 13:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782505902; x=1783110702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=saLU0AoA9Cmy1VJ6xB3QXKeFOZEGeKiaAK6r/QB287s=;
        b=NPBvAzw2BP1kvt/zq2WErw2KNb1LkYyCBZKl3xoaKLnRFq73nbTEoRpXeH7prRqbz2
         OUe55sBhZ2h7tqTx+AfcCUy5jQimOdyPtI7JoBdsenI0j2IB8T74bAf0ysLRoHxTMJTX
         KwAwwRcQq2J4Mz1yxlqZCxkHGhMCWKr/qF/nWil2+tJog7+DDdg1RQG71QxUO28EuVk0
         /ViiJVj/blYq2OAqnjSUH4mAD4awFsCGv3Tulv2lrVsNo7bEoz5gRN9x8f7U25ekESxC
         2Eih4miKogEIEzZ0TBryAVXKu30eGSzGnabY9BfFlVQsmw7c6FrOV7/j0EMI1ANXSkVd
         o+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505902; x=1783110702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saLU0AoA9Cmy1VJ6xB3QXKeFOZEGeKiaAK6r/QB287s=;
        b=N1hfakYZIR8kRxPdaMf6iZFCjE347TaslKDV+ZwBimMaqUH7xCdaI+/ahhMgnfNBR8
         ae9i7wJ5DbcRMqgBx4pF6UFtwQAz6sCc4189vUDCyhRp+JgyXxXyKZIlcUQivT5Ebwk4
         soXo80BjwTHsdZU/3sL1WBRmVVqDWHpxxKUllFpOkwwVN0gXVXm42KMuHJXjmYIU8hwF
         WJtkK59EYUuQoBCLI2hWBqpiprgTGzHCvkzjGTmT2Fhzk4nyIH3NManXSc71jYvx3Fds
         dUImYpMpUDMADRQ2Ntmb1j5FrTkVyD/OYK37NCUshSFi17xl7rHd/wokqTQvj5KQyxZe
         wctQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcgLLZnkqFVKeAoC1b2Qj2JpVzXkKIPEr8ob8aSe6sMuAtEqxmEERtj/e9NggTrOuugTj/4Ypz0907/VQmwiyw83MNnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb6dFDDvkgRDJAI7PPFnJ61XJHjT3fgHP2JB4QNtyuj8Wf0ITT
	HHQLNOdO77tU+nQ3jQwyB4h3gi9nLpWd1nx/6dcH8Qj6s6rdhRXGHNY=
X-Gm-Gg: AfdE7cnKeyMnPKyIjuAq1X0qk+JsbCFWMTz6qvzgmgZguLSBu12+lamh5iSK77MLcXU
	RUT3RmsVS3vrh2m+qYdXJdX3ppecwaMJbhXYLXYVYbRk2Gk7dxh2jEix+20Ugsds/gY3X3A6sfv
	OffvD3U/mWhXiHBM7VNUNXDK/SoSsA1X/7iiAryviMRZe6A1aPgMxWHp55rsyrFz3LK2egKxhEW
	9l/x8DBWolx1Tdl114ROFgv42dtYv/b+gUUQHPB6MPdyZHKgkqLxZzcHt5WDCePpXD9ubgkPDmP
	OK124Wpcsk+ZRjOC8I0L9z8rwVAZw9mZ7AZj73MlrMEz+fuwyoGP93fCVZwp5oPL8aa5KIA/rq+
	cUSMHlrrEXYYSwFw8BLmTcFPDKAcdRPf5lEu0Yj9oAh1sRckXGxCp9E+ydEfWOkYtvl1vb1D7u5
	WRWRLxhcPxHy4F5GqnXqQqmiKt8Tgn4eC3jpyMH0la/SzuNRKQRXB94iBA4d5nJug+
X-Received: by 2002:a05:7300:7246:b0:304:630d:e4ec with SMTP id 5a478bee46e88-30c84dc428cmr8616976eec.28.1782505901801;
        Fri, 26 Jun 2026 13:31:41 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c58831asm22580134eec.13.2026.06.26.13.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:31:41 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] rust: iommu: replace core::mem::zeroed with pin_init::zeroed
Date: Fri, 26 Jun 2026 17:31:19 -0300
Message-ID: <20260626203122.713317-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All types in `bindings` implement `Zeroable` if they can. This enables
using `pin_init::zeroed()` for `io_pgtable_cfg` initialization instead
of relying on `..unsafe { core::mem::zeroed() }`.

This change improves readability and removes an unnecessary unsafe
block.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/iommu/pgtable.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/iommu/pgtable.rs b/rust/kernel/iommu/pgtable.rs
index c88e38fd938a..8faa1d8d9fad 100644
--- a/rust/kernel/iommu/pgtable.rs
+++ b/rust/kernel/iommu/pgtable.rs
@@ -102,8 +102,7 @@ pub unsafe fn new_raw(dev: &Device<Bound>, config: Config) -> Result<IoPageTable
             coherent_walk: config.coherent_walk,
             tlb: &raw const NOOP_FLUSH_OPS,
             iommu_dev: dev.as_raw(),
-            // SAFETY: All zeroes is a valid value for `struct io_pgtable_cfg`.
-            ..unsafe { core::mem::zeroed() }
+            ..pin_init::zeroed()
         };

         // SAFETY:
--
2.47.3

