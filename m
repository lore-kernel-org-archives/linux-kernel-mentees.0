Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426448;
	b=hdHiSA19Jg5TJySlMmqYm9rhhWEI/lazW+BjkRqOxWfGepr8RNmCI4CGZCGkEFR8uE+G
	 UeJJX0I6Jg6QwiN3vnsQihBlJj4niuLaVz2AS1mg+Yn/1arHwXcTLugs2OPjyxPSpnQfp
	 WkXN1tXfy/AEIcqihwxBERdRwUdC1UwrZ2nwruOIuOuTvWp+BLvxCiz4DLs1+wAITgnI3
	 OHIM9yZchKI2JDX2TS5QjF/KBFvW/wTYLWHu+l9COzbDuueYfSUtxhzxnH0xXsJuCI5fn
	 k4I1DYKrv84ZxBLPdg7tA1zc3QLWIPmpRfxqVVPzOfRD2NI0kI8ZT4EbR/iTf+DByyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
	b=qRA05457RKNeaocpCpx1zMLgDMG1VCBdTC5vGvCc3ouTX2Uq8yrwrJSg6iMcaMGimB7H
	 f8AI/XvHxGgxqynhf+yTZkTt7kHDa/kR0OGVqK5Y9E0j5Y5oDYnhpXiGrOsET8K8qjIeH
	 RgOZoD3kyKdZlAT5uQ2Lscg/++m9cZMHGQpSHhrcFUGQfdX8RHyy+8fc9lmk8rQCHiv67
	 LkGqo9hQgxk/8jUzsBTZFu47z0+Aw7QyRzqZF9PDGZdJkDONIOk76YerP9YPURcLKZKLW
	 2Y2bGRcar0v8WeZpkTlrycckxT3wIIlsZbp4JTp1Ni2I50Tq9KqQ1ohYW+KygqA0PGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HrVcAwKJ;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA83E606AAD6
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 16:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA83E606AAD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HrVcAwKJ
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so1165245241.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426447; x=1793031247; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
        b=HrVcAwKJlTJD8dHoOMH820KRoZfwJLpHwIJCp1100T0C5qzk1TieRimcnZ4+TMFwse
         iIHJwtVTOf3tR/G2hySIq9GeB+ytxj1r/BQayzIADHDdePxIDDnPepfCjubGUvDLo6LN
         1Qv+JdajewKfHNFD7PhGO4hq46ngxHP1ZLVwjUi0KFPJPlCr1oVCRZ7vDkOC4rXI4pWr
         g8w8qmUqLjuGFQMV9NrQy3JZ62t3Xr4Squ12vohkENWt1Nh2dZaCTxDO8zqGlwYcTDLq
         14T116bKfs2PdITY6kwMNSfM8g+Ui5aounEFTMIy7VW+0Asuvx3MH+b+xxrUJDo+Yn4b
         RF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426447; x=1793031247;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
        b=UsUXPEOev2tevIlJbNo/9aaqbrE5T5YW2TQaSu3U9dpkzRFGXjxvFD7T5OS4aPM4ro
         j50gclaUilhPwhW8zalyLiZvHgUlxzLTCbKP0n4DgsqmRrm5l+qQbx5EbfI58OTjvNKl
         leUrS6bDGrS1qLJCS4LA4qdGi2gOi6KcP/yMUkQvbejSXHIW3RFLMSrQATAvDlmBaMAj
         IaIqjlObBOdQvzL0jQEjP4PVrUR2C9Sp1dSiX8XmGPYgn9pvp/q3R/H3+LLjJldpuU3o
         d7KPIxarHyZzVFXJ4kebgzNEvK5lvfsG6oh1b+Qzuz5xOOkH90T7Qe6AYmpZop6tRNUy
         ii5A==
X-Forwarded-Encrypted: i=1; AKwUvByUcS/T8R6Gx47qH3ZDnhVlW6XiOA+nS4FlqXNOa/vQbyT+2igh5EuDWxg5eKNqmwyceReXFC5hYOZPNSx4yXM4X4BvTw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLIG4Siz6ddjkdW8rThsUZ6jvNjkEcjdu9LyADcT/1zvyNJc/pP
	oa+FQEsd73/6zBiM2W/SZmzLraTGPYvjafGyoVLWB0F0YxcRxYpgFEw=
X-Gm-Gg: AYBFou3Ev8kPCCd24ciS0I/l3eHYyDolTwOTqWpHigTi0tgLC60lZOzeOcNLhBTW2+f
	WH94+Hv4XI4tb1nFSJDdGO7XK0W2tJfvHTJFdgbNrb69f/9QYZ2Vh3/+BgfGr1Fawdc0yjjj51i
	1UcwFUACqT151HvJbvdllGiyGs/9z+AGdloLSXJesbYK55IbgWiDIvHlJk73kH0bFUgpOLeGXjw
	vX8cx6bI9X5Lhx//dueIK0E05tXbwyZKJBnQRargSYuCFBlGGkHWJnnECdrbW2IDZBGVpPup1i0
	IaRYHc/fmmyIR2NHz5rI9RmUjluLNloH1uFDSMY+3Bnj0SnVINaLlmtJPSld0Io2Wfgh+98B1gu
	EEtasUjcdibDB4bQPJF12PoDXC6JgqWIIwbeSs3GstlcUyG5sLNJYSCTc3rgcl3GjYyUQzNvDQH
	uP63jfPhSpjaNHFPoXOe7oWYi2um2YVTU+TMzeEWRpQoP11RLCG7k9dtBGGn0hZgXV6YbcL9lDl
	txV0k+tU3W17I/f98i+985jRT45rRXTbaYJaC7HO00tJi2qjg==
X-Received: by 2002:a05:6102:849b:20b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7cc3eb09b24mr1467266137.11.1792426446639;
        Mon, 19 Oct 2026 09:14:06 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:14:06 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/2] rust: pci: remove TryFrom<&Device> implementation for &pci::Device
Date: Mon, 19 Oct 2026 13:13:37 -0300
Message-ID: <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792417858.git.nico.antinori.7@gmail.com>
References: <cover.1792417858.git.nico.antinori.7@gmail.com>
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&Device<Ctx>` since it has no remaining users.

Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE parameter")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/pci.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 769d01d23429..0e9455fd544d 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -6,7 +6,6 @@

 use crate::{
     bindings,
-    container_of,
     device,
     device_id::{
         RawDeviceId,
@@ -535,26 +534,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_pci(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals `bindings::pci_bus_type`,
-        // hence `dev` must be embedded in a valid `struct pci_dev` as guaranteed by the
-        // corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::pci_dev, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct pci_dev`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

