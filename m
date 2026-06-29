Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3315331214
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Jun 2026 20:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763888; cv=none; b=ZGHKZFMMKjOBfrb7dzovDbY+NTcq82OeYWrvNlt8A42PgqFHlSYuRkHJxvZ8WAPBJEBi1Gmekw1bEMI8sR0fUmtbUvEOSbab32nIZORP5NojqtyFct5vbXMUEyhYqnnd1RkWMKsC9ji7+SRQNsJ5+cLTlBuwdgRYG8LFx91RkiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763888; c=relaxed/simple;
	bh=eFgUeCGEO+qOSTEKY7myebbnHBLHZB0M4el90BZqF+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tnQgcVrYrZECLLA04+H0ZFKJlVkx7jzw2AYTxvd2cqe4rKMSmFFhvElYhNXowV7BxAyBaUcnE/g3Z+dENY3jNJQhEQ7X+Mz66g6dsLT7AXDp+od+t/C9i4l77sRv4oo8DrA3KnBLaQQcGeHKab1kiaftF96lqPfpUpuHJb7yYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2o45hZv; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2o45hZv"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-139f1dfc9faso3115445c88.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Jun 2026 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782763887; x=1783368687; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juwApRqdf9ZN9ohtGGzCpOWWFQJmTGs8EU4cohU1bSY=;
        b=O2o45hZvd/jVvLV/eWxCSJVPgdy4Fyp7toTDhWQhFJ1+rf3zcV2yQ4J/ZORqNiBi8C
         csdCZEKwofePpR+Spa6iD/JHzEn+O/o+DWLte8RJ4fp2c1vlPyuK9TlvLI6xdoj3RiXN
         tl/dOHXT/5NFbwEs5N8cZhioF4+GJVJx2zoEfnNp0Cs7VzHYzLExHn1jStJ8JvqNRp88
         jlJnWRezA6tVPw0tAfp9FO09jmo6huHbPD2Uj0+IGAwv91nXtMuTqYxTW2X3SRdomAmG
         91Si+RnANZZon5mebklmrwTZ3vy7UA44zoL+/Pduf5yOXrFlZqfEMQTgkdXOhOC9yAFc
         fhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782763887; x=1783368687;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juwApRqdf9ZN9ohtGGzCpOWWFQJmTGs8EU4cohU1bSY=;
        b=KnH4eYa948bVh3SkPUf9W3/TE5Afps/OaqhvU8Yn6FcnHPo8wbU9c+kIRjas6AAnC7
         YO/dfzmtmahh7+PYuVo4NBWPqtk1LZr4LajWE8xVdRku0O0rU5aoL8y4PAxVzz8hgDnG
         SpfMwf6FQH2qVIsHhlJHsr6xSjsG2cafAlsouG4UNqAg6VXFXzhldb6a7QgodJVsvTsf
         Hh9G2qax382fn+dD7ZqXtGF4dQ8tVmaMTB10+ChWqCEDeLCtTfn1/WqGijm0Grvx3/Wd
         x/KuAMH/Sv53TS+xGiZPRrwN6hTOQzRKgq8f2nG42aY3z1G2HEFN/biSiERhbnQpXjKA
         JpSw==
X-Forwarded-Encrypted: i=1; AFNElJ/YAaIl0q090lTUCxuiZ+8lX98t8B4oAU9ACKbwzNaQG2qXyk0BTNZ+xY2E03x121r/2SwaLDEsiq51SM+/wEz+Hx4ujw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbkESmeHQPh/gD0Xx/V+qOYfxBdOJM5PxkVYz9D3dNtWMockws
	pdSgJupUgD1zA0hPLj71bBSYTl/jYyGWXBIVqSP3n27VUtYR8pSJX3k=
X-Gm-Gg: AfdE7ck6iNEnisHXSFcZVoST+mk46tlU2cpaA07KOFTQSTFDe9hIJGPSr5Q7bmUK87A
	N5RzQD/jmiho5q9WDWE/G9nnTIQirQHwzY2XUUZhVs9AUbbz4CYN5L8sIKxrJQv38Ewl1wtUhjc
	Sp3UJyjvlGj8WulPuB0fm54pxDpIX4r1KoFsOBfz+wey2d8M4zjPPP3UvuYKZXpqIa6dFQtw6jE
	Yr3phRpFE9CPi6hxUHf1/noVPrImj2Ao8VJYTJCT73rNQLidaf5SxQe7F885HrspdPwQWEsXlqk
	vTv5gGIsDJZq8jV/T+27FF+pqSKZ1nCLLR5F4ywZXufMYbsSsjMXiHqwausEHaLoRDpMG2GhzCa
	Uc6l3I3QkH51y8mG7iaXHwqn5Xl9vnR6Z33hBmuoPccQg+1b2PorEp1gALwJTaVxHEhcaLVs/BI
	KYgX4Q81jtDHkOPtwpmap0iuLKjqB9e9EyfcGWl4tt+aQsZQRrqEp+yv8tkaQVwLXX
X-Received: by 2002:a05:7022:1603:b0:138:916:5179 with SMTP id a92af1059eb24-13b2a1605d5mr498783c88.14.1782763886832;
        Mon, 29 Jun 2026 13:11:26 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm1150598c88.0.2026.06.29.13.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:11:26 -0700 (PDT)
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
Subject: [PATCH v2] rust: iommu: replace core::mem::zeroed with Zeroable::zeroed
Date: Mon, 29 Jun 2026 17:10:41 -0300
Message-ID: <20260629201046.423464-1-nico.antinori.7@gmail.com>
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
using `Zeroable::zeroed` for `io_pgtable_cfg` initialization instead
of relying on `..unsafe { core::mem::zeroed() }`.

This change improves readability and removes an unnecessary unsafe
block.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Changelog:
v2: replaced `..pin_init::zeroed()` with `..Zeroable::zeroed()` as
    discussed in v1 thread.
v1:
  https://lore.kernel.org/rust-for-linux/20260626203122.713317-1-nico.antinori.7@gmail.com/T/#u

 rust/kernel/iommu/pgtable.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/iommu/pgtable.rs b/rust/kernel/iommu/pgtable.rs
index c88e38fd938a..eddda8d9d62a 100644
--- a/rust/kernel/iommu/pgtable.rs
+++ b/rust/kernel/iommu/pgtable.rs
@@ -102,8 +102,7 @@ pub unsafe fn new_raw(dev: &Device<Bound>, config: Config) -> Result<IoPageTable
             coherent_walk: config.coherent_walk,
             tlb: &raw const NOOP_FLUSH_OPS,
             iommu_dev: dev.as_raw(),
-            // SAFETY: All zeroes is a valid value for `struct io_pgtable_cfg`.
-            ..unsafe { core::mem::zeroed() }
+            ..Zeroable::zeroed()
         };

         // SAFETY:
--
2.47.3

