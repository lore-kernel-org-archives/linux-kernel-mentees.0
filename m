Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426455;
	b=x8sgKyCxc5hDyPrPSjlvbKrHV8OdIS8QfZ7uP8fot+fxubt4exdYCFQF/rdFckraDk87
	 6BZa2+dE9QGHuAIztBC5i2bjyXR76NoyhX8i+DFiphEreeLCOR7YrNMBdv1/H3L6mdVCf
	 BcISeTpgnAcBftVljyVf6zsuVDw1WjhEUj/mHuEjXmnEZwSNoUCn5iR8zSgkNGa+3TDaB
	 BTdElt35JKBedwN0knK8/WIoI2Yhrnev+xqQfdr3eg1oZh74cl9riHLHe2bgo2SE447rA
	 9Rsi4jxIGiPfu4UUz9/uuZ2jVv2nOGXqJNuZsN/YkYQICXbNRUmoNBdvDVSC7PrYTRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
	b=TKcm+wg/ABXALWBWtx4sK3fjXzDZHLKopWQjaeAO6/56nxSgzmEBUQ+zDY0OEW8d9DLf
	 X3u+j9Nn6jyTYnlu6szF8At3c3ceuK0+cscLJhcTFIBp73OhIzglpJKZxxfa7OIXwYvWJ
	 Adz6Qa1dLpn9T7ykzsb7Be6R5aTr9s55nSkw7L1Daw26AH1QFRAckk1pGk35IN5U87alE
	 Bi2U6HEwqItfSFw5DzCacLXemd3cm57OIHzzP9Ar57CS1lTyfriqWQ4k9he934jAGiUkf
	 /yCFey0/tomCGrP4G1YiAaWAAT1jpjxXCc3POqj5MlqzFwzoTmdBkCzNhwm3DwPYi9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="scX/kUm8";
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFB3606AF81
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 16:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFB3606AF81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=scX/kUm8
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so457648241.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426454; x=1793031254; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
        b=scX/kUm8VijXJatUqxRKgowoLxluS6oFfQfVtpNNOZajFpIq62QFRjEzEwtKD1Yqzz
         fh8pOJanFlgWCszmbMCdYqlQCfsc1jpr9ef0OrbK9+p8OguWHX/XvA160s8bMm+nKe9S
         e34hC6JPvU314C0cHX/ri2iW6jB6jl/eF+CRANZY0wYTW0lsKU7dMcDNtYxnM04o7T4a
         0N1Rb4XjsUZD4Q7c4tkg2dKSm6/mIN1DodBQgZBZAmQC2MX8OcZtnl5LmwzoXK0lESiq
         KO3wAX07NtIVXwvUAFkJCqCZWv04u9y5tzqW37w9itUj0HB7RWWgdb7UtvsdfEpFjrIe
         y1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426454; x=1793031254;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
        b=VNW2xO9kerHm15qGxq6oHXAK2Zn/MVzdQWB7ipqFzXwym+lVLgrFKn73YuHpVmt6Ks
         L8FDxsVAhbXQXAj0GnQ6tc9+09UIt2Vq2T8ZbqBzcrMmA4Uhu+rdUXckRa9VjDspRrRQ
         +Y36qI0M2BCK3gO1nxRvOzdQBRYdLeP+kb8jBg/XPb4mjWrwOA0uY8GKRnetYMlSWvQ+
         7Jdfq+Op7DgQVUZBLHoChqLWR+PTuZJcqM5kzCq5l2FxJZAH3zWbsJiAANHxY0w7rtag
         HWpN9URhahBboe1ssski7zKjtCLJFH2ono8stLi4mGttxJV8Jqmdd+ffO6D5uWg15Kzf
         uvWA==
X-Forwarded-Encrypted: i=1; AKwUvBx4wxOKIavacJCvrZCJlvpwU2pObZb73g/4fZ6U55ptt6aClUZ+eiaeCqmTjgRXAvRlOyFoklIspSVaQ6MeBroEhiLSGA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLFB6pr9eoCqvCKrEXjzUw33hwGqZxf6u3WM0bk1FOudtavWgW3
	cwCVxHa1kLcnh76ig3xof3EZVqowz7Q3VmqmeV/wkRyDrAz+vFs5EnPGm17c
X-Gm-Gg: AYBFou3Pd8T9ADZjTW6Y9+5nxbAKsqu8Z9SyqvdPDDi5a+ECLDNW2YGDydKTcsH7PRa
	qd/wR7vJqRYvG+uK2IsPv+hWNn/LLn3qEFRzBKLea95vwca/qggaU+jlgp1gLlR/rRw54VvNlQH
	6cMX8z9xeHHGIZfH8csFMMMx5l8AfZWmn3EoHWUOWeo/K2SgZFD/kD/9OvKrWOXSUgDO/1eD2AC
	iWkQ9ySb/OtdDMGk/VLB4NBSLjc3g20WmnFSPhSDviRNY39rhuRBqL+2wPQM6mMwtAzexvanDVT
	vgl2LImY7s8tUjKJKOaZiI3PxPs7Osk/3bnX80RDtpy72hs2vSJtbJB5n51Zv1sbXY/1GdFoUA5
	Vcl0nRwh4cWHKS5/7UjGOUY/fH3GC6GcZtv/hIniqCO4Gx4ml1nMLd6yOvD8yz2kedZf3g7Qvgj
	jrfKEnGuE3PCxMLUeU4W6d5z0BQOixEwgcPjFYj3ldIUcj+YjA/EXXygKpEG0btNMNvu+XDE29m
	nDV4ggLuniE3kSpWiWmGWx3FkwuOhjKds6z3A57hqjYSEMNpw==
X-Received: by 2002:a05:6102:f08:b0:7c3:8ae6:d7ae with SMTP id ada2fe7eead31-7cc367321e3mr1998561137.1.1792426453769;
        Mon, 19 Oct 2026 09:14:13 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:14:13 -0700 (PDT)
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
Subject: [PATCH 2/2] rust: platform: remove TryFrom<&Device> implementation for &platform::Device
Date: Mon, 19 Oct 2026 13:13:38 -0300
Message-ID: <9a53f75cf2d607bbcbcf54777e75caf99dcf6318.1792417858.git.nico.antinori.7@gmail.com>
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
`&Device<Ctx>` since it has had no users since its introduction.

Fixes: a38dfd60fe53 ("rust: platform: impl TryFrom<&Device> for &platform::Device")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/platform.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ac0a012ae1bb..f49aedcc94b1 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -7,7 +7,6 @@
 use crate::{
     acpi,
     bindings,
-    container_of,
     device::{
         self,
         Bound, //
@@ -557,26 +556,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_platform(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals
-        // `bindings::platform_bus_type`, hence `dev` must be embedded in a valid
-        // `struct platform_device` as guaranteed by the corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::platform_device, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct platform_device`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

