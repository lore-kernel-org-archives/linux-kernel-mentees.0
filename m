Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2153BB135
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Jun 2026 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782510265; cv=none; b=o6cv8Z59ZWE3KWtfQxKLSE+Ikm1XaEuarA89HPMBl+NSiWmWH67BB7KOLwD9nqUR/3Fg9Wf/TZ8KcBuBFfvW7g1E44Tybf8JHJqwU6BekwxPrzo4kiB6/JloeP89vBpN2wBiElDpcYfmu4W2EArsK1T/Qa7b17Cm5cOg27ku5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782510265; c=relaxed/simple;
	bh=gAB96cfT1IycU58GOBhvZ0xJjVQuojZ8XH82whF8zpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uTuqmtHs4bgO/nu02Ep+bf5AWp4GvI5FRodCchXP5Z7wl7kUwhZ0zMsQJ4YQvZgfNdKrP6gE/sx8k+P2lTNv8P8hBb/A2STxHlSvWxaRyKYnHxpukTqaByrLnEuq/ctN8rQ63GOW+WTgHGeVfN6M24empxogoZBN+DjJyZbWUKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O01a3Dv7; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O01a3Dv7"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3078e0dcd67so2432507eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Jun 2026 14:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782510263; x=1783115063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HYKtyKNxfrDbmxryHnfUDB/E5Eu6wwHMT69rmwfje3I=;
        b=O01a3Dv7LeWwBXdb/q63d/ca0FtArtm0ocpjw5Q8InuSL03UAZh8GQvwFselfpex6x
         n1IehJmoEWHUcYWylxZHmz7Eb4SoTyGPwy/QgJeDNzkjBhtIfopzOvJVzHbgKyywTRap
         Yj5nH9f61Z23qMfvIM/LjaOIIj/XU7XgSVa85L1WFMApv3DBQ1OPxC3GFlpjwILUT8qz
         iAxgi0FWnn22OMmOVB1wdyqV/Qa96tnclXxvPP4A/Fj02+pb5ruXEH1hrYVmJY8op6vI
         5p/Dvtq02Imx/YrgcmLhRIQBut/5rkDBe1hhR8fuz/Mo28zkovrzEw34emzvbKhVIfTN
         sXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782510263; x=1783115063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYKtyKNxfrDbmxryHnfUDB/E5Eu6wwHMT69rmwfje3I=;
        b=tDkZ4YO4/XZMfnehVrrcg5uG3P9eL5HK9fYQ4uFRh4y+wWyqE86dne7QrByEOG8rge
         DpmMMbmptuO+L/yYvfXuVJA1/MShgONeIZvT03PkZjxpd83QIAeCEt3lXvdlAE80M+hl
         OmNkWxSHgQeM2K6qzTUNdiHtQgri/8jt9pyPMmOV/Qea3juuP2JTI5g8mlL3LG4UZtb4
         l16fZAflonNt35HFXGERHANAl+k2v2+w+ZsSiFneZF3sYzaBsrvVL1nDGALIGXCm8Blz
         RlmbVM3EvEDarlMPk/j/ompZAo0r1/mmaOI54HEQ+azJX6iuOiOgQ3Ug5X8ox+vOqDIF
         vVIg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2cjls92AEZWDZ5EXH499F8gceqaR9B2Epm1ADdGcvVYWfVWDqgpQuoq+kxrSYluEBSDOV9+6fyGlW3UKRBzS3z147Xw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgVPgmszcap5uZcXD0IuuF9CmSwJ9lgGcdmNBKpjtyJ3NCaNP5
	IM9adGs5ZuQTg4PiOUIyKJfFqck8wPFdvyEBYd4BBLyysTeeS7SFUhvEzh+ueoc=
X-Gm-Gg: AfdE7cnBDL4CuKPEi2OchhPXGG827xCcTWdFVGU2MZuuenkyOPYKJMcatHntvOmYggJ
	WvXNYqPj8USHOy86p4sCLCSgIyeM53seDWObrpp22njWwo8X0jmrsHC19C0uUt/A+qaanWZkL0R
	WSMnrW81tX6fMX2v5iJbB7x8YWyYPZ7XUEf/VW9ZgqMCD5NYuJ1XuhY5aGvQHphxNDaoYMNJMjZ
	tBit/W3yHRTfMAd/J83v9w+mZj14skDKJb7FzWGVtya7zRShQ464/YzQpmiJhfrKq4mZVIs62cw
	fDzr7lQOfisXFz6C+Z1j8pjWixjqgQBFBF6SkdWOwxaro6bz31sU9e0FTNe8OC4bp8Dzi0IG83M
	weak7AvMvHi0auI29sPhyGTJO0MNrK8BdgV9ZDpwt3b1y5swxL8BtcI2DYIX4Y0NsimSdstW/J1
	0or0jyKR6jM3nKlfkGqeNPMunFicNPwbnD9L6XFEyAiXkfqTvjwJ6BDl8XLYglvkilp1f1rfVxP
	NA=
X-Received: by 2002:a05:7300:e801:b0:2f2:6dde:df54 with SMTP id 5a478bee46e88-30c84e0bb70mr7188051eec.33.1782510263309;
        Fri, 26 Jun 2026 14:44:23 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm20580189eec.18.2026.06.26.14.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 14:44:22 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Subject: [PATCH] rust_binder: use pin_init::zeroed for file_operations initialization
Date: Fri, 26 Jun 2026 18:44:02 -0300
Message-ID: <20260626214404.852685-1-nico.antinori.7@gmail.com>
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
using `pin_init::zeroed()` for `file_operations` initialization instead
of relying on `unsafe { core::mem::MaybeUninit::zeroed().assume_init() }`.

This change improves readability and removes an unnecessary unsafe
block.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 drivers/android/binder/rust_binder_main.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index dc1941cd2407..7f07fb5e171b 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -314,8 +314,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
 #[no_mangle]
 #[used]
 pub static rust_binder_fops: AssertSync<kernel::bindings::file_operations> = {
-    // SAFETY: All zeroes is safe for the `file_operations` type.
-    let zeroed_ops = unsafe { core::mem::MaybeUninit::zeroed().assume_init() };
+    let zeroed_ops = pin_init::zeroed();

     let ops = kernel::bindings::file_operations {
         owner: THIS_MODULE.as_ptr(),
--
2.47.3

