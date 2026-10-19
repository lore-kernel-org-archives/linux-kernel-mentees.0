Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423421;
	b=2yOaBD8wYyVLGhP86CWqPwsH8KSvY0NP1BJQ1z+9W0QP6Em0AkGP7IYvCiXY8J4oJlk9
	 A6xo7M4rEuR0DbRg9YVtOoZfBY02g4KAxNultzEStG/LIdl6zx+MsOwhRi4KJrgsyI34+
	 MyLPzI10EtLMcjTFHjWTh67C/j7AiTIunORv7I8M4JHX572Y2xVzznJLduaBFsl8DjcC/
	 /CHOV7C8V1vHCw7Hvt8ULJlUpIgpIEMoZXrZ9/XdQbzuKNxY3ffhS9k5fgYfJ6YycsBOx
	 RDzSmnpBxitLXbvS8Sk0GXsToT3cHm2OwEpCDRkc2UCMmyb+cmbL1zhF+a0Ec5fp17w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
	b=gOj7BuqPKQ04KZU8SkboXE1B63ThPraNu3W1HOPur18f8YgLjgNx5zqTUHczs6aSlfHs
	 +lmYJYZFDt93gdPX/JVC0WQresyqT/aq/TujASrMA/fsO4BQ97MbQz68A1W82GjlnmsSd
	 TkoJg1LxGqlP4GUuvX0Vk08ukrutIMts2xXY19Dn2V9NRkJkjFcpcGbxXI1AO9SLHPLgR
	 3jjchr9fnisELJHyDLEjfiLpS6kRpCHknzfnsuQE6P4M7GMmMua7SIjCmreR110je7RyV
	 ikxhGULk7q462vRoGCOWNZStZKKscZJ2Q6Rc5mWi8lIGBuYp4MAmY5qwNE5QJ8TL6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oEVFSvY4;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7060ACCEA
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 15:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE7060ACCEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oEVFSvY4
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso431709241.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423420; x=1793028220; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
        b=oEVFSvY4fVww4pH7jIR8BalMNlk0ZdoijX3XDLTM0Pyu9ehkDp50Re5IQqJv2F+3bm
         Qe8rbDehKGvBJWLLlAb6REHo1mo9+cdMzI7+xo8Z71Xk3x5Vixy/smCMDncmFKgrc2I2
         TEcy4WARFp4nEVLXHoLIfka4T5vMiSE1JpqCxC87hSZUYh2XoOeT5T0QGFV+4zPH17UA
         8XpElcCZOnIItbpmdlXiKFXTJYjXIsJ1PMJ35hJqa+KCaYlDlzpvjQiVyL1YdHjjeiFn
         k7kpygbvkf9CXLIkutIb4jO6OS/mQ51gJ0rY8DEunDFojUX9d6aPWQ/pxDmz7bzMt1tW
         s42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423420; x=1793028220;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
        b=zxHqCdc/3I3jAoqLDS/dLa+ouKCohoFfes4kv/bjirrnUlVojjPoSSABZNl6A/H8Nk
         8fyU0nKHldf9kWr4Y6QwzZO/kdVc2zoCJhNtZGBbh5yVfphssRFae0lkdJGHXCKz5NN/
         cOQxv2EsWAliOeX2LIYoithL5oPtzTd3kkfrJd0gIx+D52UYe5CuIPyGQ8wyWVTsa2UG
         V2lvVGLJvd8VCDg4f8fChbbIEMUcOzAKQMNgndmzkoONXphdxYH7xqOWlw8CXVsqA0YQ
         jc90bvxhJwEzQeEuh6G1WVbv9trHrsFXl6RlvFZ4MBKr4aG0iCUnz7AGhmr78IKXGtU1
         V22w==
X-Forwarded-Encrypted: i=1; AKwUvBy3y+ZqK7n+o006Kj1GPWfE7taqoK09W+0SWW2nULEKlwDGVnxd5l7At9WMCVRseZ4vQNUCNl2MCjz4yMpLOVW5d8nFGw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLezOWZ4B5rqJEJvUnO7fJ9XbyJfclu5B5zeKbZtMXAcPbrImCq
	rymkYXlIilzr/+61sUtf/wwYQ5jwPPAHjHe1fWdeZeh0ggiB9ky+gpk=
X-Gm-Gg: AYBFou3K6ZiXiTToXVV8cWJ+w4WnFMspg13WXf+inQYvPcXXtfjNXIPX4kvXlmHqQxz
	LbrVfbImI6slbvkvERakoXH3jkBhSx80gD51WN8DmUttiqdYrZlgcbGs7TajLQisJKUpFDPoyXi
	lRv/MTMsfYMNMoNb1eMOLxy/aSImH029aMFJx9WJSFL0h7pbZUZuSEsZg7cR5YA6HzA+u0AjCiE
	MwyDRDw6ZASQTVz+lYbY1WEFvewJPRAYdUJ5xjR7dYQTMt6dDIymuwQAHGBEPDONyboUeIUaS2V
	Tx5mAy73FygHVySXYQf2L6mtnyXhAtNMvBYtfyAIg2SfcUd5/K2g4K9Wak8MWQB6A5zxCHtCKa2
	FoE4ts3wRHH67hK6jnlVUcRAymfxCovfZLu3QPKNCxUgLhsRthTX7T9WIC2wWxy/pl2D4PyTx5W
	ShTGFwWoAc+dYOebolsaF5phk4c1uHIPOPHv1kzdUA94F+rxB9kkxZ9bRjebxN7s640LH4fuhYF
	AvOxvXRSNLS3sS+GJsGzPoM1IHzen0v+qP9XC4rVpmQyoJYMQ==
X-Received: by 2002:a05:6102:5127:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7cc36aed490mr1758525137.31.1792423419903;
        Mon, 19 Oct 2026 08:23:39 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc77198ec5sm453357137.4.2026.10.19.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:23:38 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
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
Subject: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for &I2cClient
Date: Mon, 19 Oct 2026 12:23:15 -0300
Message-ID: <20261019152329.620610-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
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
`&I2cClient<Ctx>` since it has had no users since its introduction.

Fixes: 57c5bd9aee94 ("rust: i2c: add basic I2C device and driver abstractions")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
To make sure that there were no remaining users, I checked for usages of
the `try_from` method and the `I2cClient` struct using rust analyzer,
activated the modules that were using `I2cClient`, removed the
implementation and compiled the kernel (did not trust entirely in rust
analyzer because it does not find usages that depend on this
implementation like the `try_into()` automatic implementation).

I also checked for usages in all major versions in most recent versions
until the introduction of the trait implementation (from 7.3-rc7 to
6.19), rust-next and linux-next to find the last usage and mark the
commit in the `Fixes:` tag.

 rust/kernel/i2c.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 0487bae811fb..b4ff25c830fc 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -5,7 +5,6 @@
 // I2C Driver abstractions.
 use crate::{
     acpi,
-    container_of,
     device,
     device_id::{
         RawDeviceId,
@@ -517,26 +516,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &I2cClient<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if unsafe { bindings::i2c_verify_client(dev.as_raw()).is_null() } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the type of `dev` equals to
-        // `bindings::i2c_client_type`, hence `dev` must be embedded in a valid
-        // `struct i2c_client` as guaranteed by the corresponding C code.
-        let idev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
-
-        // SAFETY: `idev` is a valid pointer to a `struct i2c_client`.
-        Ok(unsafe { &*idev.cast() })
-    }
-}
-
 // SAFETY: A `I2cClient` is always reference-counted and can be released from any thread.
 unsafe impl Send for I2cClient {}

--
2.47.3

