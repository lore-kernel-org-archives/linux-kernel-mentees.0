Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FEF44C645
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Sep 2026 19:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501029; cv=none; b=l2hlb3ZLktxJARUXjdSSEdtlEK0IZjUD6ayukxE1v1SpsuXJ7FB9G8BfPCK7C/myWCHGzv1tZdBVyachublwDLNzuPlgK/IvgmItu/sb6/xCHPPlkApB99ASIMRrhm33OkFgvqYQQ761O1KopUTHjgrr4iSW555+rHeKx4BEFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501029; c=relaxed/simple;
	bh=iQpFxkadxuZthWNzpNDmq94Hthwi+6Tsc7gHXxzEn3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tx9O8QbaALagfdfFmeNwfbr4SF6t1qHN37Y5IWVexZBYmIK2Jb9liC8/Djy7EdeIR1G1ra+qNC0iwTsLOoWa5ABla8CkaSLUMIAOo9B4o4EQYazBxkaGSAV2u7NMLGsf798t3Qil2s+IsvNKUdnt9odsJrbndIhhBgqjxDVom20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K70u38QE; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K70u38QE"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78a53fe85easo44100137.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Sep 2026 12:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501025; x=1790105825; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=K70u38QEGvnm/I9deFYuYUQouzVRAU5w7pnMRgbRkQHiqNF8cgRTj7bZziL/8Jre60
         HGwCitYxW6tbFd58OY+/LDWw3+Enlay8MDbPvq+76d3R+ljz+CmL0RLsfCt0wseqFg3f
         FwMYE5gz53ZsHmwNXitOiUHRFXR+/aUTfqNKeVwzyo2OiyUkUVYfCz/lMLFJfExA2TDk
         FhguaMuGxWTrrQ4a3n2+iZBd43UTse1aWfTfUa2NSIA0WWFLD0S2M/uBYtqJzQkXFblq
         wr0XLF4KJNQLTMik896HoCocxK8mMu/3GxHyUEk9Bb/mmsLLlhHceYBJVnDGUSAmiybk
         UwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501026; x=1790105826;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=InTQyP7WEA4vZTrBIKmgYK9qFdWjOaJBaiLNAPEriNYSz0fns3KWSVPyK7nPQi4G0X
         nq1k7jUKYILgOLD5arV0Ule3VEZ2COGHEbWagQF1dj1PLAA7yLnQIWLlab2lHvK/aqaN
         LKqSDMbN/gmtBPD8d7Scd6vONO6O/QQw4dixmBx+3BKjImS+r8RNwtWk5/L2ckpCAwLI
         nPF3wM+yoxS8z36RGRVUKigK6pzAer7P8BIQ40uvjXI24DAhush9f1UArwzrzbHmH3eA
         opuauouvGb4V0atUt3dAvcA6YE6HSpifmEjRxO+R6jhXd25fvQLNZAMqjBHmYJI0y6r2
         aBCw==
X-Forwarded-Encrypted: i=1; AKwUvBzr1558SKDr/SX+X9FMickFh7i8Og9g2ePnggEQya26tKlAASYizT7NJyDPHhz8MTdYUKjOz+gVXq0+4Lw+OSLqh/6Gmg==@lists.linux.dev
X-Gm-Message-State: AFuF++nVKb2eOBHBINi5KXApMJ5O97JFrWrhpdxcZxLZC4muje6P+EkN
	HorkjH/Ea2BxICLdoEYGh25XyqRq2gtrcKxNWJvzRf9CbU/Oli2awt0=
X-Gm-Gg: AYBFou0rHpeN2WGr9aDR3c4dAKBmeaM5tPkRb6rLwumJBEeKcW7NLsMRXWRvHe9xxS+
	FMErDHOkSVxbTIkT/APoRc6Ci2Qg47CO+Yq5T7jqQj5Y7/SaZeI6Uz7tGqTTMVES/ODgI52lIQa
	rT0Z6Uq78EcGVikI8Pt+F0thALIsjjreq/mvO9zD8NadVuWgPO8/fqXxMwtpoCLBQWrocGpeBQc
	GvOfHceOimjTYRhvw2fzxSG++lAN++VRrcgXc41MiMGcMTUYa6/RYX6lmDgF1I3mj6TqGmd4IXd
	P1xpLbDL8QNKRsaJ5fOhrLwdbecG9Ao00nBT5VS6h9CHSVOc6vJ57Kx9RuQ6JfpaKg9C55QhPK0
	cMG+WesXecW6v6U7h7qYXhhJp5DA82RxSNR6EZhnsJ+r9wcFIbL9zeQrcqN1ZV2whxJ98wnamYd
	pAx7uIKMrX9jdTfezNAv3AgH62dqjfKEjBfuQ1L4dtA4AwbPliVqEz06HLe0GE0iAEYCAUr8cTF
	s1zlX7nXAT3O3WoDzErQGCdl9r+10oSNilHfH+HYk95eQNgLQ==
X-Received: by 2002:a05:6102:5607:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-79b5bf316f7mr12420909137.8.1789501025587;
        Tue, 15 Sep 2026 12:37:05 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb1148f57sm691450137.4.2026.09.15.12.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:37:05 -0700 (PDT)
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
Subject: [PATCH RFC 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case
Date: Tue, 15 Sep 2026 16:33:54 -0300
Message-ID: <1a319df6587bfdcfa497fc964a9a6d21a8988e54.1789500084.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789500084.git.nico.antinori.7@gmail.com>
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
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

