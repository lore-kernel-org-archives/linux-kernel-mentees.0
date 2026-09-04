Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE2B4A5EAA
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Sep 2026 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529595; cv=none; b=JTqzLVmDb/7dSUWMpzPpuTrdzJP7sfU+XXsuLj0Vh6XUwoBSlLXf5S1bHp3T52+uO/5ZVrFeZK1twhXXuj/B2PXW8fX7nLnrf8bXWQ9ix+3qE9LSMyRqVLNrSa9rjsoQtGwRkkdjR/bFaSpQJAN25QoJi/iZ0Doiwy+m6Y/UXEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529595; c=relaxed/simple;
	bh=m6CAE/76TRzV3kyyElyOiCVIZXdgvxUs4/XakeqgH64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YyFb30URJcHTFt6aKsUJ8Tnx880G8Yg8lGN3Y4+xMCIvXT2YsJo5KWrguhMEBwEhCD+c8CAnH9LBg9p3O6OMzS9a4UxzcCnMBKanTpBAxtPUPsFw4dnxrWtOeKi+csfT5agHsDoH7et/CZTpPA3f5r3TBfeDKIPTjcummIUI1Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3M59Ypg; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3M59Ypg"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-871c8a36fe3so7814557b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 04 Sep 2026 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529592; x=1789134392; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5E1eI2EQTTOSHZEjahKUxEQTbKv1V9kJEXVEsMI2UI=;
        b=W3M59Ypgc4mn56bvQ4rgAtyOQ02dsxFNB1Bp3X9LPEbhAJbihJm9l9JJeWGh6IMU0m
         B0T8hDhO84S6N9F2iVRykmeoFf+b8bYUbICvDtdRmHrMM5Ji5OV/K8ba6CDICDvp/rgi
         9dVeIVDWOP3TU447CsnYTXaSNEpF43L7T0Q9Gy+EUIjGwd32h4t/P4M0kBJTtViduPwk
         ebaPlbIzHlHQ7cAEAEZS2esPHQcy0ca8Ady28EqbNEfS1ZrANMVg07gwmM5+523WhElp
         vqF86OpSj0r4ijel3uJD4VLzwBIBvtOLa2KL4jPPDASTc+V6z25eKEVLIE8G8OKS18Ef
         rnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529592; x=1789134392;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5E1eI2EQTTOSHZEjahKUxEQTbKv1V9kJEXVEsMI2UI=;
        b=OnPNfzHZrByT8rxfEea1OZk8g8AsCkKQ0m3LpMoLuGDRTEugH0+LsN5R2kAGvQnjeh
         2Xaokoag3chvfAk0IcQLP+StRVHMfcWJBCgM1YiUYVNowi5y14vE6Nzk7MscumXfJTWu
         DwQb9Wohlt08Wgm6ycmgBuO8cBqXrdl9x2KSPWLd6cmZ5DBBIrX+z/aJ0pel3mgmXdz7
         7grflGmCNjB2OKa6/LtyqBsQiJ1QeggZuLEpESlZDzx0WDRaR3O8HTIkQpMH1H6XkLW1
         k+3Oej6xQwCOLfC6JwEd1Uln8OPpWemMyHLrpykM1BzYS7798COP6PRU166okRjO0lWV
         qhRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1sTA1cHRkyw5O0lKB0JsQqFyDfsWdcI1SN5XC2ASPgZUK3rr3zwHbCmRuBh/Q41VZwjGQWMRj29diBdg+DFkvOe/icg==@lists.linux.dev
X-Gm-Message-State: AFuF++n3e85r3TlIR24W7hYZ4jBBxSErN8xpgGexLsekXR8/7CoqP7tG
	tOrB8eZT+n00IpLQ47ekRqla+JWuFtvZ5rCN3fmjiemzvixUu+m7k7I=
X-Gm-Gg: AYBFou144K4091Y3EOjlcpkHBvRp4aiOhL88tbkUfK/zCKoH5RrnDWRUUFrTxmQM7xV
	AptWWB71uswMzzrWqoLImDpGoJ4rU8+8jDc1aFDHOGdZNJWBSwkVaiASoAzBevUj1ckn8VqXLgh
	EvxYN82S1DuNLPrNUhF/bcWFqeYaJaElBWS8MmiWu8AJXmvof7kNtRAaxgGesMWDpCvjwkF4rj5
	L8HMZ48/z79WqWo1/XsmEaE6oh8ytREwKLRuv1pLKJbxLxPen7XZhhZipWvwb0i/OAcXZkhjbMY
	u7nKNUuuvQA/VWB1bzrYoE5ZCOydXbIOPCNw9sFOziD+NSMVVwuD7Gek0SR5RiKZJcw/0PGJDSJ
	yv5h+5lPWVMMtWE2vA3ytsFNVgWi0z1yq/2e3G1oLM/q89SKeuUcVNdPRLE7U4iCqrfqzHVsm4O
	cdPNn10qJ0USC8qu+4TqNKIZscpU3c7CY1hyF/3cwFY6t4fg05c+fGm1bLn26JKZbQ2HWipfWT+
	GkoFqPJFU6l0rnTxpHF6L6Oqnm/JfiBNx5BzVQ=
X-Received: by 2002:a05:690c:e646:b0:873:5bb2:6c29 with SMTP id 00721157ae682-8735bb26efdmr2810627b3.48.1788529591777;
        Fri, 04 Sep 2026 06:46:31 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714a49a660sm18067947b3.27.2026.09.04.06.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:30 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] i2c: rust: avoid locking when performing I2cAdapter::inc_ref
Date: Fri,  4 Sep 2026 10:44:43 -0300
Message-ID: <20260904134600.340991-1-nico.antinori.7@gmail.com>
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
named counters before returning the adapter.

In the Rust API, the `I2cAdapter::get` method returns an
`ARef<I2cAdapter>` upon success. Incrementing this reference count in an
atomic context (for example, via `ARef::clone`, which relies on
`AlwaysRefCounted::inc_ref`) could trigger a sleep-in-atomic bug due to
the mutex locking inside `i2c_get_adapter`.

Since cloning an `ARef` implies we already hold a valid reference to the
adapter, the IDR table lookup and its associated lock are unnecessary.

The fix consists of bypassing `i2c_get_adapter` and instead calling
`__i2c_adapter_get` directly to increment the counters.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antinori.7@gmail.com
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Note: There's Trevor Chan's patch [2] (make `AlwaysRefCounted::inc_ref`
associated function) in review. If this patch lands first it may cause
conflicts with that one. Please let me know if it is better to make this
patch dependant on Trevor's one or wait until it merges.

Changelog:
- v2:
  - Implemented suggestion by Gary and Igor to add a C API and call it
    directly from Rust.
- v1: [1]

v1 Note:

Citing the second part of Sashiko's report:

> Furthermore, if the adapter is unregistered and removed from the IDR,
> bindings::i2c_get_adapter() will return NULL and fail to increment the
> reference count. Since inc_ref() ignores the return value, wouldn't
> dropping that cloned ARef unconditionally call dec_ref()
> (i2c_put_adapter)?
>
> Could this lead to an underflow, double-put, and a use-after-free of
> the adapter and its module? Or if the IDR index was reused, might it
> increment the new adapter's refcount while decrementing the old one
> twice?

I don't believe this situation is possible. When `i2c_del_adapter` is
executed in `i2c-core-base.c`, the kernel waits for all references to be
dropped prior to removing the device from the IDR. This guarantees that
no `ARef` is still alive when the IDR removal happens, effectively
eliminating the risk of an underflow, double-put, or calling `dec_ref`
on an invalid reference.

[1] https://lore.kernel.org/all/20260615201141.8920-1-nico.antinori.7@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trevrosa.dev/T/#u

 drivers/i2c/i2c-core-base.c | 17 +++++++++++------
 include/linux/i2c.h         |  1 +
 rust/kernel/i2c.rs          |  4 +++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ddaacf876dad..03ad1bb539e9 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2632,21 +2632,26 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
 }
 EXPORT_SYMBOL_GPL(i2c_new_scanned_device);

+bool __i2c_adapter_get(struct i2c_adapter *adapter)
+{
+	if (try_module_get(adapter->owner)) {
+		get_device(&adapter->dev);
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL(__i2c_adapter_get);
+
 struct i2c_adapter *i2c_get_adapter(int nr)
 {
 	struct i2c_adapter *adapter;

 	mutex_lock(&core_lock);
 	adapter = idr_find(&i2c_adapter_idr, nr);
-	if (!adapter)
-		goto exit;

-	if (try_module_get(adapter->owner))
-		get_device(&adapter->dev);
-	else
+	if (adapter && !__i2c_adapter_get(adapter))
 		adapter = NULL;

- exit:
 	mutex_unlock(&core_lock);
 	return adapter;
 }
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 14ab4d3055af..56832c8e58f5 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -907,6 +907,7 @@ static inline bool i2c_client_has_driver(struct i2c_client *client)
 void i2c_clients_command(struct i2c_adapter *adap,
 			 unsigned int cmd, void *arg);

+bool __i2c_adapter_get(struct i2c_adapter *adapter);
 struct i2c_adapter *i2c_get_adapter(int nr);
 void i2c_put_adapter(struct i2c_adapter *adap);
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 0487bae811fb..2fc818da80cf 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -419,7 +419,9 @@ unsafe impl AlwaysRefCounted for I2cAdapter {
     #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::i2c_get_adapter(self.index()) };
+        unsafe {
+            bindings::__i2c_adapter_get(&raw mut (*self.as_raw()));
+        }
     }

     #[inline]
--
2.47.3

