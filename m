Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554AB3D79F9
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Jun 2026 22:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781649393; cv=none; b=GM1zZeKoiaVaGN7c2GvNupS1HRlrqYQK8BQRBcNS7+6vuurkwAQ3AVwQJd2OcZ8jItM4meloBgZm1SVC0FG0kgHpOdIMnTcoew7xE9kiqzhGxCFoghK+ivgeH+KKjsw8zvKM2DBou/3yRMnNgjdxMlYRof3+h6IlUvWh8/BWcis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781649393; c=relaxed/simple;
	bh=NACjCW4uUizcEdB6sSH9ZQ3fbHHJa6g3OJEVl5rRkRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bt0Aaop4hQuJWz8KGH1+8pdfApq0vjf+q8FU3+q+rGVeUZwwOCO5IVO/h6Ii4OkzGCG1edB075VE77Hg6r+bBxFCJOETFo43/ALjlIOl7xaoKtF0/omP4iFY+B65C578qJcdi3R+d8c0S8phyieXHz31Rb1Gw9MNzK5SbcFy5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIjoAVb8; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIjoAVb8"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-91587626a3eso539422785a.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Jun 2026 15:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781649391; x=1782254191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IoJP3ySdUx4DkxskDKQ8frRVgBTvEGDGFX0mngUY5c=;
        b=DIjoAVb8pUaZQYbupDEZFkEwsufDeIUQYe0iBqOUQuGGRgzdoYF1ALugluR7p/cgWo
         NiYJ+XDaZx9d2/faaZ22QJXkcTFgHR66oKOu2lWX2GdVPciz40QbYY+/9OFSuBiglflX
         11bFTYRtwTpbced0bYf63yjS+avULne+sY0pItJHwasv+kPOeLBSTSWiHI35i8vPBAyK
         7huqzQ62/hH7GVuE1CMqxc0JVWnwT+8ykcUdTgPEBrfbN+8eUmsMiHOz0NR6lrBQTeEJ
         f8Cp00FUVmsjwgwgxpDtYz7sNjpB21YEI5YhHE6f/gRvGjJaGO2P+pXH6hDeX4cE2aEm
         0sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781649391; x=1782254191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IoJP3ySdUx4DkxskDKQ8frRVgBTvEGDGFX0mngUY5c=;
        b=suTncxNfUKRPcNOsL/hOcRXtUpiOvw0BOuSAMelRceQNL2PMiV7H5i67d7fmqviNnG
         qNc+q9k2PJMT6dZsdJOui224W3jSnGBbKz+QLGbQMSHbKGZ9zfNXKfcG/1a39dNlPGrT
         Oe7pJjTC+1aC3H5b76oeAiHgCThG1Bhzq8SXB50f9XCnXJ+RXWzd/kuw0cLEKBbPyjsQ
         dTIDGSQRe/WhEKo77TDW72MrEU2VjEOYbGwkHXOPozZuxTX+crr6461GfnCsHIZ3u/tB
         zPDlM+ny5Ce1ySQ36Wr0LJUxUpG/yvQVNjOY17UgTXHWTxktoZShQcN+ybOnKZ63No2I
         R02Q==
X-Forwarded-Encrypted: i=1; AFNElJ8lNhQ22lvTCAZp5dfecefWej95ARLOJn1TZ+h/36IRfeQbMa+C/+KU1s2RryFjYAddV7IKylfwhZnUqKbjs1DInewyFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoHHtNUhQksfD40GqMHSm1qXiO6jvDdMCvd936l04CfTMdJ5Vf
	U5/0va8+1XF88ScQbz+LlXdko0MqKlksO+hSA8iPG5gUzCmlZQnkmqU=
X-Gm-Gg: Acq92OGidvwW4EiwlK6NE7uZLx1W/N7Arc9ImEcwohQ6uNbPSnL0vyD9INfG6KS3L3/
	NbXomj8at05s9QcRcbKFogmhqRGuSkHRysKBcLul/18He1hYXPG3GInbZIfphDJC3ur6UX8hfvD
	zRtUchfzAzL/70TPD6ZQujvqRQgINydBV0Y/aqkDPs2xpYvlcEK7GqvuUKwBgL0DuZ8p6Px25FO
	oK8t/Fhq19uYKEkih2/jQh4PxZm/dwZFzJpuCFm9ll5Q14HHdS7ZISEASoI6fLaRYiGz8pdn/2E
	Pqd43ifiTRuLUOEjGlEKFxQ4BeUoObc75kBz8Ubgxt6gqTXVmSQMBPHWnqOswwNW2Wp3wpF3+SO
	3FTjKuYm2Li63sqktpmqTPAy6BxbBLRAgYXUX3DpwxQhI/HZ4/7pOfNzvZAiSPsdSdps70TxEod
	vPxsg2A2eQXbW6AZa60hwVkuQbB1o3Xt3Go3GORbW3TqtaqN99U5iloCeXWylE9X3d8txc9y9m4
	LY=
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr140872385a.27.1781649391215;
        Tue, 16 Jun 2026 15:36:31 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006ef0sm1524236585a.24.2026.06.16.15.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 15:36:30 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] usb: rust: mark Device and Interface methods as inline
Date: Tue, 16 Jun 2026 19:36:06 -0300
Message-ID: <20260616223614.16444-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
following symbols are generated:

$ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
...
ffffffff823f2490 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefCounted>::dec_ref
ffffffff823f2470 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefCounted>::inc_ref
...

$ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
ffffffff823f2450 T <kernel::usb::Interface as kernel::sync::aref::AlwaysRefCounted>::dec_ref
ffffffff823f2430 T <kernel::usb::Interface as kernel::sync::aref::AlwaysRefCounted>::inc_ref
...

However, these Rust symbols are trivial wrappers around the
`usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
functions. It doesn't make sense to go through a trivial wrapper
for these functions.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/usb.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 7aff0c82d0af..efbbee319b1a 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -393,6 +393,7 @@ fn as_ref(&self) -> &Device {
 
 // SAFETY: Instances of `Interface` are always reference-counted.
 unsafe impl AlwaysRefCounted for Interface {
+    #[inline]
     fn inc_ref(&self) {
         // SAFETY: The invariants of `Interface` guarantee that `self.as_raw()`
         // returns a valid `struct usb_interface` pointer, for which we will
@@ -400,6 +401,7 @@ fn inc_ref(&self) {
         unsafe { bindings::usb_get_intf(self.as_raw()) };
     }
 
+    #[inline]
     unsafe fn dec_ref(obj: NonNull<Self>) {
         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
         unsafe { bindings::usb_put_intf(obj.cast().as_ptr()) }
@@ -444,6 +446,7 @@ fn as_raw(&self) -> *mut bindings::usb_device {
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl AlwaysRefCounted for Device {
+    #[inline]
     fn inc_ref(&self) {
         // SAFETY: The invariants of `Device` guarantee that `self.as_raw()`
         // returns a valid `struct usb_device` pointer, for which we will
@@ -451,6 +454,7 @@ fn inc_ref(&self) {
         unsafe { bindings::usb_get_dev(self.as_raw()) };
     }
 
+    #[inline]
     unsafe fn dec_ref(obj: NonNull<Self>) {
         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
         unsafe { bindings::usb_put_dev(obj.cast().as_ptr()) }
-- 
2.47.3

