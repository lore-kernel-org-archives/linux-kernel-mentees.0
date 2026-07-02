Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2F335564
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Jul 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025895; cv=none; b=Ve5DIeMZgIEAuvWnj19pEAIlofLX+RDVCTrikB59JSrYHlzzMOwp9Yva8jzuuvvypSBvUJD43p3vZvxaa3yxn5/zgiYLBIsOsJRfTYfkpYHoDjYZxxtdws58dSD73O1I6B9APEUxcYDYdZ/XwXUEfC0wjAe6P9LN0DcpZHlOrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025895; c=relaxed/simple;
	bh=eF5D6+Wt5BLWEeYKq/RyVR1wdlMPFm78cz7Uq2W8x2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XoMBq6rfMkCWRHvap9dFs8oI1TYrSx2S7i8DrCXZbkl/uHGM62XSf3XF55AalRpruurO+ysOW0hPZGecqfdf4Qe8Gq1g7orAmZrEs+bZs0FTwwNFRcGv+35Op9J5BldS6JQna/2PyuAUiy8Z51dgAv8VpRfbp8W1773CrQKx/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daRM8eEi; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daRM8eEi"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845ea8924fdso2050590b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Jul 2026 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025894; x=1783630694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCqGLz9eDC84KN5xIK2F/aNKUXkei/tGGB2b27ruMZU=;
        b=daRM8eEid95BqOqy/H+/MutxTsG9kpmBPybvbc+D7hQ2ZcCLrZ34d9heP/PkuB/TV+
         I10EVA+0CjLzKMrH6pxqP2Na4+MT6jcMECw/6a9mZ2eqfIiVVpUalkDU4sNHb5HM7Hm6
         OqWZCkWL1VyMn3hq6nuZ5Ldts+Slg6QVAAMgURldtLh4bm/cqkM0TqOZCHXwuYV2eusb
         T6bycKDm2nI01tQraUZ/aUTARPrCdXyL7Jmb2hYxcH3NN8buy7e2eUge+BbYV8WFCC+V
         MyQYI5ljYjShvaOEJrfDsl7UvhnO15hF7m6gD+/uGDJKHUjxWpy56UOnEndci6Tjt0hE
         Vd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025894; x=1783630694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCqGLz9eDC84KN5xIK2F/aNKUXkei/tGGB2b27ruMZU=;
        b=jwdjj4H4pwGHdDSGbOQ34Hro2sLfk8LRpe6kq9+62aWJriLuO5XMquEBR2sCcTXkVu
         pBIWIpFQjAn898szqlnUCie5QRSWz+4gJLaMPgBB8dCKFfyPnc6DmHxGUoIsYuKwEelH
         V+iNf+kCDLIywIfKQy/1vWAjyj9nGqLzlUWRHkUITpjtiK2UzHO7YbgtZ2DsMBnzuFge
         srrVBeE9urxTMvXOu9tBV6hT+JZNgogdSDrZ3W95DLW/jd/H259j8zaFRvwrr+UuW7kd
         72iGEDQ4VIwSwGLZytH9DpOaV0EP5wlCBzjrjpzZF35J7+fhLoJAGSr8/xX/btZFAFpR
         +F5Q==
X-Forwarded-Encrypted: i=1; AFNElJ94p3JVyQnfZ0Ouji5G0y6wNhiR6OAMHRb6Tr+fb27iuj1RVQsLmL1qlIp3OlbzlKB4SxPPyyo1i3o8sXnBQZx9zRTPAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIf3HVjAvpUcJLfB4mzzYB03c3ljKGa6ygc5mcIBF4kXSdRIoH
	UdSG6LWSgGb2gljebwiGOyBuZlT5Epkfp7SBqWJYvH7UQ4P0QA24EW0=
X-Gm-Gg: AfdE7cmqR/pnTHR/13C1Ae63OV7g4opjFQqs/FHFcUIWB74O2/ADx0j0hmZ4OpKxtb3
	qqVjbQGq60EgTIwX1jp9w//cewzGjX6wJSh0HzLfVH67yRUfmZacHkJbSgtMpYGv2awXFdchQI4
	CCWw1r/kDJnKH+sWUeXy/V4UaRRIH+X4+Fr3z6XaltqxVeJ92AWKGoqGZCaKASfqgtqHXyhRcvo
	tpC++IFpMi5Wd7L4n+WMsC2E+fTINPNaQY5YaWzEf6FHBLggSdlc66hJ0fe4XimvOijlv9WXUnB
	/QKp5+nzasveDiFApqwfgGE7B+ee2Of4lE1sj+4bAHJsGDUl4BdBv6Egddnt4fL6U+wNY4QHrMH
	gM6mzM8VPBQPWojnKh56bORj5EhNUue7II5puQAGAfSWrtzdKW4B0ipOy7FsFKo3vEOlKNjV/GW
	GjAWGFYuWQrzpWO15O3XSufjBkwx13mLq/WWdv0+6h+T+Si+DIjg8Wz8MGSXDr0xzF
X-Received: by 2002:a05:6a20:734f:b0:3bf:e2f1:1b17 with SMTP id adf61e73a8af0-3bfed5d84b3mr8082450637.50.1783025893429;
        Thu, 02 Jul 2026 13:58:13 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc3ea61sm13220729eec.30.2026.07.02.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:58:13 -0700 (PDT)
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
Subject: [PATCH v2] rust_binder: use pin_init::zeroed for file_operations initialization
Date: Thu,  2 Jul 2026 17:58:00 -0300
Message-ID: <20260702205803.552476-1-nico.antinori.7@gmail.com>
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
Changelog:

v2: Removed zeroed_ops variable and moved pin_init::zeroed() inside the
struct initialization. This is just a code style change suggested in
the previous patch.

v1: https://lore.kernel.org/rust-for-linux/20260626214404.852685-1-nico.antinori.7@gmail.com/T/#u

 drivers/android/binder/rust_binder_main.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index dc1941cd2407..cc9b10e41807 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -314,9 +314,6 @@ unsafe impl<T> Sync for AssertSync<T> {}
 #[no_mangle]
 #[used]
 pub static rust_binder_fops: AssertSync<kernel::bindings::file_operations> = {
-    // SAFETY: All zeroes is safe for the `file_operations` type.
-    let zeroed_ops = unsafe { core::mem::MaybeUninit::zeroed().assume_init() };
-
     let ops = kernel::bindings::file_operations {
         owner: THIS_MODULE.as_ptr(),
         poll: Some(rust_binder_poll),
@@ -326,7 +323,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
         open: Some(rust_binder_open),
         release: Some(rust_binder_release),
         flush: Some(rust_binder_flush),
-        ..zeroed_ops
+        ..pin_init::zeroed()
     };
     AssertSync(ops)
 };
--
2.47.3

