Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C31B2194
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591860; cv=none; b=uuFeQXt/WHRAmhL3fjX6txVuX8cZcc7BLOoKjtBGVLPXEPdqSZXmMaiK7Sw1UsVzHWFlPQAfvTUX4jQs4JmzVSAC5Owv2qa565mzhmXGPYF7tPSdMeoB4PPHi1xM8zY+JhOOq5I2HGvq0PkQbRzr8XCnne4u8UNVs9zR3n299q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591860; c=relaxed/simple;
	bh=ZWyiDX/vDGiAqA0tRjbykGLrDq3j4KxRc+K/r5na4aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVe2VMY+C3A+R9gjQYzc419Wx81mGK8BhGgc0FMv/HcS2OVgDYSvapTH7hgKN0pOdmNzMhBwTAPTIrS77nUQaeMJAzNDciCequVJGvbme5m7IaC3i5cYXWBIbfW3klW2Oqlqo5OaV/gK5TOp0lHGCgM5ABn/7HVoIY6HWSTA+7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iL/8+x03; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL/8+x03"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22423adf751so51857725ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741591858; x=1742196658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbrw9fKYJUWReB0Z6L2vCwEnh6k+VDvJH5rqaU18azM=;
        b=iL/8+x03vSex5NJodd6ddcTlIRb1DhgfdPg8quDUSZWGtjxw1K64bxUTKyJapLkl/6
         yanbc6HdFZYYtj4ygJzGBwaJqCZVctLL8RcidZsX1sPLS+oHt64wHF1jWGrdNcqSIosa
         QK8GYrdP/TUykHMumr9hwQEOn02GPIAPvB1zlyK3KBGR0aTRmpWhvQsjmae2G1sJiQXg
         ZqJ2TtcrRQ4OKt+z5uNjRh/LIguyioqsfPOGq3wEVbIHX9+S7TCl66VqkVFzarmf7qOg
         m+/AoICrnYHMLOi6122ReX4BurDFcESyRszhsHpCTT2K5mnJEbyoUTFJRMANfpnFFRky
         vWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741591858; x=1742196658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbrw9fKYJUWReB0Z6L2vCwEnh6k+VDvJH5rqaU18azM=;
        b=dRlz7FSIQ3uX0sQQHd/aFtAoptwVvpghxYZr2J2Ds8MfQncMkRBilYGvlHFgFVgvRV
         zUTg/SmFW5Mro1H3JtZJGDethVqgmgtP1lh6ltue1xXAcWwsuWLnQE1AtUk7pcN0Clx9
         pRAJFKuQWYKn2jKA7mb5SjrX3pCnG/o92F5mmaiDm1BBcvnXEXijmWzYX+DO4t6yVvON
         N7Koax1YNSOFHv8xfujTZ75fVIRIoPNig/vQj3Np5SKEf9sdUqfw6oEJ1Ah7q6dPzHFZ
         QtxTpg92imAXE/eGcT4SPt5iQudx6x3N7KZuUXnfE2+m1Rhet3WA9dwxaRIcdJpgU1Xg
         CO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+gsNaiRw/WQ+c4WasbHEJgmVi8LI0Yp8F46p9mvbLAns8tMaa9tiZADw6PMlW6UB2yERl3hvkfQjGR0mFdEnEMAgd3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzO2C6j9z+VXONsutXGnzK8GRPC5UA6dUVETDDngHa05YodR7Ej
	2xOuac6JAwLjb8CcBiJ7CrtPMld+CVl3v4xjzB15+6UZ/UgIzBks
X-Gm-Gg: ASbGncu79+E3ReddkAQW1MdBEbH2+ovfbaW7PyhfG0zFBLRQGFDzlwYBoUL2yvVKBUh
	scBpkzWn3gTMhXZVz3rPzEb6j9hbKGq8+KG0VjCuJU1/+kUDa9GJ5phuM0A3a7a5S1zwJROviXm
	NY8kUBq1qOsLev+zAkNHrh0KhYqcCswT9cEAd6A9jrknvQxvBGLF8jUUqFMD8GytsxwggQu3ujj
	zL0XluMwy0JYiU9Wpn4GzR58qUeuorfeJwTAse/0ejv1OJ7WYDKodi5mBpRqaeiccS+T6fzzZj/
	+7b6hzl1i9Mj0MxqyO/QOFtdA9lebYBzNuGSafKNiLZ2KOlFeHwvW2b2UxMzUbvHYkXqkZuIvA=
	=
X-Google-Smtp-Source: AGHT+IHsKs1IEPx0zVJOtYDvg2NEVgoS3BbGZqnYfDtmOAWe1ErF1lt0JxUII7ucqC81s+4W77tleg==
X-Received: by 2002:a17:902:dacd:b0:224:2717:798d with SMTP id d9443c01a7336-22428bf725dmr181608585ad.50.1741591858392;
        Mon, 10 Mar 2025 00:30:58 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:7ad0:37c7:5275:4b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f773sm70840715ad.117.2025.03.10.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 00:30:57 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: ojeda@kernel.org
Cc: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH 1/2] rust: list: Implement normal initializer for ListLinks
Date: Mon, 10 Mar 2025 15:30:39 +0800
Message-ID: <20250310073040.423383-2-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310073040.423383-1-richard120310@gmail.com>
References: <20250310073040.423383-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently ListLinks only supports to create an initializer through
"new()", which will need further initialization because the return type
of "new()" is "impl Pininit<Self>". Not even "ListLinksSlefPtr" use the
method to create a new instance of "ListLinks".

Implement a normal method to create a new instance of type "ListLinks".
This may be redundant as long as there exist a convenient and proper way
to deal with "ListLinks::new()".

For now it's introduce for the simplicity of examples in the following
patches.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 rust/kernel/list.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index fb93330f4af4..57d75ca16434 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -158,6 +158,16 @@ unsafe impl<const ID: u64> Send for ListLinks<ID> {}
 unsafe impl<const ID: u64> Sync for ListLinks<ID> {}
 
 impl<const ID: u64> ListLinks<ID> {
+    /// Create a new instance of this type.
+    pub fn new_link() -> Self {
+        ListLinks {
+            inner: Opaque::new(ListLinksFields {
+                prev: ptr::null_mut(),
+                next: ptr::null_mut(),
+            }),
+        }
+    }
+
     /// Creates a new initializer for this type.
     pub fn new() -> impl PinInit<Self> {
         // INVARIANT: Pin-init initializers can't be used on an existing `Arc`, so this value will
-- 
2.43.0

