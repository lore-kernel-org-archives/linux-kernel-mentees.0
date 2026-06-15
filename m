Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A0931716E
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Jun 2026 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554383; cv=none; b=a/hnWlCI9aQB53ydGcx13FcbwTji9Fwk4NlVWGix7KVQqfMjMhbuUeCdDt0elkNSFGnt5hnAFhQLB49prUMUBYZYf8ddQ645cIfFmMHNWB+KpHt5ZWspfFe5HMNb1KiUVSU0slgdy4smxKKlSmGH1/9Qtss35/75ZLa0HxJdl4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554383; c=relaxed/simple;
	bh=0Rsy20ctkEXTuUbFJ2QSbssdVnjkdeJG/mDaljBum/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DSlUsWohZcBlptdYfR2PRA+nQqEGj2yoTaP7lF1+cALZqlG46xmu3kEcE0dlmNbZZkbOGFIwKP20dBMilrQSmIxzyJrpI+lXXo4t5Db8DZnsBhU1BUswnaJnF2E0tFyXdoZ5Zntbg+Cb5ARL9CYEiqaDE0gOnC5FNNL6IYuHNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAqfj7Kv; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAqfj7Kv"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13986d61b4fso13966c88.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Jun 2026 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781554381; x=1782159181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=saDGeFnt31Cq/ume6/7BHto3BEV/oz/g09aW5LaWmQQ=;
        b=AAqfj7Kv1TezDiFWl2RzVDU9u3r4HHWXTJju3X+/nSTIxfFD+HEGkmhoOxzG/HWbnp
         tMqLmyJh0CxMHHcSgH8u6NWNB902O//5LSEtB4ZRPQLk6MBi1eqEDLfO9fV2rzLY969v
         lQnHLEE+XSsW+wwu2NSDfeJfh/wBr/g70uqAEu4gdgMRzL6gBoobsy8IIDZ6wSyAXiIP
         eek/AhpiFZoipZqQr+6SqhVZEnBQr6VoQ+HDw1mfkKnnlDN+ZKQhv/gC0ygu01j/B0la
         XgDCPL9uJJ3Jleg8e3h3GALuu7KvgaEzXtpuwuB1eKQkdBykboFpRKsrXfLBxRnManee
         tjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781554381; x=1782159181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saDGeFnt31Cq/ume6/7BHto3BEV/oz/g09aW5LaWmQQ=;
        b=ai7iDyG087lMiHb8fvLmMNorDrSzNyqvOBzbv2y1Bm6Ad3HcpIQOr3Pi1G20S7D29g
         Ab/JEYoP/Z5S2y4XDrdkcx5sf74o3RD1EI59opLGarsgAeK8E5KFvNXmYsSXxkkV/RIH
         EKdKaqmj9SD/BrlgPow+IOZckBEJjomhZ0duHz9FC3s5Nj26rL0OtGXPqt1iexpilsnG
         Lc+AvQzX53WBl5ev0Ku9YTGZn7IzCkLn0KRwSpCVfL5nvL0bLPFzj58XD2nhQQ1bVtS/
         Gw2PYXRjv7sBsfFymHfmxuhFPt9LN9bLtzSkS6zm7MWTbn7nJc6cZ9pf07AX4grkP1LO
         8A9w==
X-Forwarded-Encrypted: i=1; AFNElJ89Z49hGXAgDK4CXthccCfnpNkuIc8cY0jLWfKWq25K0+vYniWkc4L/EF3ylTm1sgfuYgaT9QNN7e0X0c2UfgVm8K1ylA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCQtk1A564Q0TcG0PNfRFgkuIIiRu8VL8JQ33Epxsu0ScgUQfb
	AqmmbEVd6C3fFVGRYpKXbOw7Z06yN01zKU30PK1QLVATjyIO7yqUSJw=
X-Gm-Gg: Acq92OEMaomp7UFT8Qv6M/dN5TQEJVAILpG7Klavj4XF9SbK3O16z5jLbQ8FY/3BDsb
	mEBOevvP6NLwspo9sfmyknSb/XXHwruXquCr1ob2plSoTckDucdCojZYo5X76sP660GYnMYX6Hr
	Xdu1PXuXQ2R6JSKl7v+HTCqwTuqCW+p+cKYu0MSLyKbuF0XsAlkHwndDXaE9tap/oAg8Obsk/lV
	FnJ70M5VKnhN2InyO9PSreJVfgt41QSKFIv1STEXA9qYY73LgOjOe3yRLUJ/X1WqbahRXZiUAL7
	yvNjtVTfNf3pLSt1Y9PHWmWCtsifNt0T2XGoBUkIzvEKitb9XfXOSaF+1oR8xHdNAHBIpZTkhPJ
	AMkpHSW8etVsI/5TdHHRnp3oPuuRFgsjHLGJ/2gK3fjN7fEISolyUcvV/91/l20F1zGe4iBfCx7
	52tTIa1SZuHHtd8yMJiHyk+KUKbyDhnQCL8R9aspyxS+mrr5xgqa5qUEWXKsvqziNRCeV8CH4M3
	xpI
X-Received: by 2002:a05:7022:1e10:b0:137:567:14c4 with SMTP id a92af1059eb24-138707aa18emr5391868c88.29.1781554380814;
        Mon, 15 Jun 2026 13:13:00 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b96d6c4sm11684171c88.9.2026.06.15.13.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:13:00 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>
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
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] rust: i2c: avoid locking when calling I2cAdapter::inc_ref
Date: Mon, 15 Jun 2026 17:10:49 -0300
Message-ID: <20260615201141.8920-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current implementation of `<I2cAdapter as
AlwaysRefCounted>::inc_ref` relies on the C function `i2c_get_adapter`
to increment module and device counters. This function acquires a lock,
looks for the adapter in the IDR table, and, if found, increments the
counters before returning the adapter.

In the Rust API, the `I2cAdapter::get` method returns an
`ARef<I2cAdapter>` upon success. Incrementing this reference count in an
atomic context (for example, via `ARef::clone`, which relies on
`AlwaysRefCounted::inc_ref`) could trigger a sleep-in-atomic bug due to the
mutex locking inside `i2c_get_adapter`.

Since cloning an `ARef` implies we already hold a valid reference to
the adapter, the IDR table lookup and its associated lock are
unnecessary. The fix consists of bypassing `i2c_get_adapter` and
instead calling `__module_get` and `get_device` directly to increment
the counters.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antinori.7@gmail.com
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Citing the second part of Sashiko's report:

> Furthermore, if the adapter is unregistered and removed from the IDR,
> bindings::i2c_get_adapter() will return NULL and fail to increment the
> reference count. Since inc_ref() ignores the return value, wouldn't dropping
> that cloned ARef unconditionally call dec_ref() (i2c_put_adapter)?

`inc_ref` no longer relies on `i2c_get_adapter` to increment the
reference counts for the module and the device. Also, being able to
execute `<I2cAdapter as AlwaysRefCounted>::inc_ref` implies the
existence of a shared reference, meaning that the adapter is still
registered in the IDR.

> Could this lead to an underflow, double-put, and a use-after-free of the
> adapter and its module? Or if the IDR index was reused, might it increment
> the new adapter's refcount while decrementing the old one twice?

I don't believe this situation is possible.

When `i2c_del_adapter` is executed in `i2c-core-base.c`, the kernel waits for
all references to be dropped prior to removing the device from the IDR.

This guarantees that no `ARef` is still alive when the IDR removal happens,
effectively eliminating the risk of an underflow, double-put, or calling
`dec_ref` on an invalid reference.

 rust/kernel/i2c.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 624b971ca8b0..d89c42691dfe 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -426,8 +426,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 // SAFETY: Instances of `I2cAdapter` are always reference-counted.
 unsafe impl AlwaysRefCounted for I2cAdapter {
     fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::i2c_get_adapter(self.index()) };
+        // SAFETY: The existence of a shared reference guarantees that the refcounts are non-zero.
+        unsafe {
+            bindings::__module_get((*self.as_raw()).owner);
+            bindings::get_device(&raw mut (*self.as_raw()).dev);
+        }
     }

     unsafe fn dec_ref(obj: NonNull<Self>) {
--
2.47.3

