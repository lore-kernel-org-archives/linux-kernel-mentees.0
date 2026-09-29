Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809223C1D65
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 14:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691284; cv=none; b=ljOLbk4XITVMt100tHsF72CwoJ42yHTs3zr0vhkrP5s+5o6g5ur1ckS09X2idKo4yT9foHyq5jHHQFhn/0hRW0bqAnHiGnGi5hnG7HO0riaMInemDt+mWKgkN8OdpLUViE7bKpy4w99hw4EP/W2HbuX0JXtfwZxl1Dl6jr1VwaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691284; c=relaxed/simple;
	bh=iQpFxkadxuZthWNzpNDmq94Hthwi+6Tsc7gHXxzEn3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qYLozCONDDC2vMK3cAvaFT/GarbrhnNZPWaSzr5fFxGYQVqKpSKVx1KED/oPx85O9ioMBqEjw/czMeOun3tFfXcoowLx4a+QQGB7E4YWRS9y4KLAchFr7PfXl+8xdLhSCHcH7CgZtsZhhAd8oFYK9WXKp+6TXPzofelbpwFhwIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvfXrgxg; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvfXrgxg"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d06so3067015c88.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691282; x=1791296082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=QvfXrgxgFUc1dLlBeDe5YG+xxsuc5lR7NIUREH1cNh4BePpRpUxKYe82RUx25rjnJE
         o+BeBMdRjWjkhobYUlI7AGf/AavmFXx0gNTbtYrEeX41MAhHnvG/gPwKQnIYW1ZxuEFj
         Vuh9vYfy6VVFRKHxt8rSM0ISe+gSyGThoSNknWfvqpfvnIJbZQgSHS8saYP0DOFPhD5c
         pEkCFHF4mzChXvCD3Z1OWX+faZpW0N9vg7iDVE5Y0OHh3FnQlKpAUPJeCgJ2jO/OgvTT
         U7fRQ4WREH06PpY+54plEnylbpmKN9rOtL17oHkMGxh062TUJ1EyAViLeKoACur8XT+J
         L8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691282; x=1791296082;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=DoDMpBabNwlA1aZGHu7kTSINJhGYJy2tFG3FYRrA+2qF/270qBl7i3flBEFmdAFhG3
         QlvDnju/tM0ntJOxUKZlcIMAQIm929aKNAir2CPa8C8USvwHzTAmm1xWqJ8+kPH+FRRv
         fmLAAR+nO7NnWL0C9G7S5lFItdXDpXuD8CEbacHzRhf4RQsPOiBC2axDqhcZK0EtNtb7
         VbNRjJLzLz68ZeWS+0Q/aEF0DGpMbeuW4ComUq7zeA++YmhylGtI7m3zCJqTRKZvdaZj
         DQ/aowDI1kTW9z3WkS4eYmHupj2QhgmiFesvPgAV88vW+udA1cN9WnrlOY0PY42zqlXl
         tuMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp8wWyBOoe94S+u0hDPCty6xg1Op/GLe+5WimYLywKjr1RTqntWMoySVzoB3w0+5OW9MZKMP7YoH2Kug4eKqU4zQlJBg==@lists.linux.dev
X-Gm-Message-State: AFuF++l1sULqU9aZCvgQEAQZg3dmZISlSU79leNHfuV5vOCfJsWHHatu
	En/oi/VWn2mUCDtfamU4FLB2QkZr0r8rOjdcf2UPm90JrUCrP4QSyfs=
X-Gm-Gg: AYBFou2336190PQql27V7LGxsytb3qOl4eShaP15Q6C7i3hP06FRlSGUdV5OkXQru3K
	MBhV77kJCYxvJDuyzh8P7OI4cxu5PYlqOIlZst1ijrD97eUOmO1tWBqgMeSW6yMKbbjyUV4ciVy
	/16wh6ZABKNt8CmyL2HZZe6j/Z4GSqlw3ayve41MJAl++ESDspL3FZ/qn6etGq5O7HhuGs1Dv/B
	+o+NZ2xn7IqlhzU5O9fDeRBGI1NwJYsFnkhn/kP/uZR3s2UO62boOvsTbNj7NHTzl28W6ac1gCH
	g0FSIk75YsK3OxHV/GbZp58surWI4/5nmVZCEukqyq+ko1e/YjSIcujw4rDSt7kstWmW/qZPz9a
	Cc4rQbCR4JhrZxVxB+F9Odwvk7p4tPpOKr+I9uLrjmFwj9c6vmZSPllpYgJdqEsS66G07HApd11
	VKlmPZYCtSLP1AsrnAGsJi3ecLgg02hpMYVg7oUvz8bsSVI1r/AfAkxf2OU9bQS09erH3N4hfR/
	8t6m/ZgOLYC9byhpBuV1mtvOISJaDEx96o/7NlRYUuvHrLgc2hDKubHfkqz
X-Received: by 2002:a05:7300:d0a7:b0:33e:4475:5e02 with SMTP id 5a478bee46e88-342700be32fmr12739592eec.5.1790691267018;
        Tue, 29 Sep 2026 07:14:27 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:14:25 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case
Date: Tue, 29 Sep 2026 11:07:43 -0300
Message-ID: <19080a499f705990382dfcb850a17d71689f62ca.1790599486.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790599486.git.nico.antinori.7@gmail.com>
References: <cover.1790599486.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
test so it can be run when CONFIG_RUST_BITMAP_HARDENED=y.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/bitmap.rs | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80d64..a9935b2be8c5 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -571,33 +571,29 @@ fn bitmap_set_clear_find() -> Result<(), AllocError> {
         Ok(())
     }

+    #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
     #[test]
     fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-        // TODO: Kunit #[test]s do not support `cfg` yet,
-        // so we add it here in the body.
-        #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
-        {
-            let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-            b.set_bit(2048);
-            b.set_bit_atomic(2048);
-            b.clear_bit(2048);
-            b.clear_bit_atomic(2048);
-            assert_eq!(None, b.next_bit(2048));
-            assert_eq!(None, b.next_zero_bit(2048));
-            assert_eq!(None, b.last_bit());
-        }
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+        b.set_bit(2048);
+        b.set_bit_atomic(2048);
+        b.clear_bit(2048);
+        b.clear_bit_atomic(2048);
+        assert_eq!(None, b.next_bit(2048));
+        assert_eq!(None, b.next_zero_bit(2048));
+        assert_eq!(None, b.last_bit());
         Ok(())
     }

-    // TODO: uncomment once kunit supports [should_panic] and `cfg`.
-    // #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
-    // #[test]
-    // #[should_panic]
-    // fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-    //     let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-    //
-    //     b.set_bit(2048);
-    // }
+    #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
+    #[test]
+    #[should_panic]
+    fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+
+        b.set_bit(2048);
+        Ok(())
+    }

     #[test]
     fn bitmap_copy_and_extend() -> Result<(), AllocError> {
--
2.47.3

