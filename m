Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E544F2253B0
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Jun 2026 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782427809; cv=none; b=ugX+Qb+kLcOCx3f6MjOXGlH1CuGJ8ea0ztC4hmTmSE9utFqowHAaJxkmtNRrXQ3CA1EH6mTVcZ5LQj5rC/5vFX9/iUJnA2QZT+o6D5QEtLy4mJm7yHO923QQFN5NWUq01tRrOwGQ86Dct/oMGaLaBdHg2iesmgMJS7XTFCEyB1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782427809; c=relaxed/simple;
	bh=7riy9zn2yRm3WP7DkxKFf+IbEEHQoczVIT4zDHaLIko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nx09SN/2wgRU0BschFCD/ANPwj55ABY5fdS5EL7j2n0Kvv8rBzNkFp9r8dgw4OSRq+MExaWkVxIflzPZ5ifYU5crPWxHjUpglFGBbevrm0FM6UcQmlE7EQGhODcM5djGRViAc+WSmHPtqOiNrA3c1Wz+Xjn6XDjU1OIkrw5ZrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kou49pcf; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kou49pcf"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1363fe80fe8so907811c88.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Jun 2026 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782427806; x=1783032606; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zP2Z25CXAppf+hFBp9V7dUyW6AOwxGrvIlERxMVxgnc=;
        b=Kou49pcfSsg+LVQ5D3KGBiKA5B88dxCGjJLeeDFkgOtN4yiB9W4sa8NyKgx5NXDH53
         TLUHDGGObiNnb/rkwc8jf3MFxlszbeTgOca/cr9gUDn0z0cRs8hXxh8ITdI1rZZsJe5D
         6JukdBgvDcRy5R10bSI+TXauV7aZwQ8YzRxMAkuWyBPJwctuODRj4gmwFXeyg8ZofGIM
         4BmO7chrc8315XCZ4qNV3ybTC7atw8Fyu26OKaJQZ5ljO+DThNkYGYUO4ZFjghlCImrW
         5utHGa3yBQI82W2dqEtuqVt0ISVoPfeThtDXa1kYUosTs+CD+83TPkvnM4VEgGGYBSvu
         Vdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782427806; x=1783032606;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zP2Z25CXAppf+hFBp9V7dUyW6AOwxGrvIlERxMVxgnc=;
        b=SOOMEjMHBGU77n7Rc1R5pS7OZjV4lLpj2HY6RwGtzGOYB22VS2gVQhMd8KwUayETb+
         JqgCkMBkp4UE/9sHLeqS1EUeUmW0xCwDR/JrTIzcLgsNgyC74NjK40kyjZEGkHe4KKF1
         /UzniRDaXAaFiF9r3XjCYNElZTPPEFgUwNeXq9NpaP5SA0pYMK1tzb74E752uOGvrJJL
         K3O4g19Purg3gUZzJSOnnwFibpr1YJA6xrQXS1VxJ6nu9/qn50V9Df5R3vjqiZO/1g2c
         Rtivh4M6+XDQTRCA3n2JuRVocj3/Ge7pZDSPImwD4rH9xyXwF1WfcybY44WyL7J1Kic2
         +1FA==
X-Forwarded-Encrypted: i=1; AFNElJ+zmi4lNuUQ+B9TI2XzBBTy/TjsW+GEIcxODWp9Bm9w/vAbkX95s5zzDYl6F6sPbRMulMKZAvS2oQNW3yGUb0ujnnzv/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf2gwZqLEXnAUzsBXGzyZjjv/AvtKvR+t3M8yQPFUbiSWsTkmo
	n9JL3nSXIQptgT9TxkLZN2JMMgk2lXjcJNOiIpgCW+ugkRAgqH9hmYI=
X-Gm-Gg: AfdE7ckLJSp20jRPuVReAGFmF6qxtXuk8vuLnR+fDHcU7bYkiYmqAaMvwUCPWK6GUdc
	Ch87E7cjqDney7Jqaz2/TVSCJj/YdiGFZdGPZ1WnjHbZ/+IIDhp7m6GS9g3XaH4ogMeZ/xa5F2Y
	5YgOK+MAxjNRJuWeLP4O0uw29Sb846XQX/YsSHy0az2SvwtsKa+bPumQejk+Ilzo4puo7OPV4Hh
	7EmZDoCRjbwBmuG4dS5keRPHgPbIGaIGfPtTrdjVwuaGPDNv835pQ0XdrQHXEMsaPtBLu6B+lNr
	2l1oacp3V1cjl+oKUtioKgB4xEAyH6ALy5Y5ORWdqWLqS9AzUR6ifVUOUtMvFMlafldymW4eUJt
	hZLeh5Wy+hZ/wg6lJS5gIc/BszfHEfKWnrCHaORTdhlMtcB0EHd2CnLhDZZeuJkmLvfJUboMhJ8
	ChFkrriDna+BYlHCYz7mkkSCK9QAqmVR0d6JvNZRJ0IY1nLBdvSRLY7S1jvQuiKLgw
X-Received: by 2002:a05:7022:e0e:b0:12d:de3f:f3e5 with SMTP id a92af1059eb24-139dbac8312mr4114702c88.37.1782427805939;
        Thu, 25 Jun 2026 15:50:05 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f77602sm10771239c88.8.2026.06.25.15.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 15:50:05 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
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
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] usb: rust: Use pin_init::zeroed for usb_device_id initialization
Date: Thu, 25 Jun 2026 19:49:22 -0300
Message-ID: <20260625224927.404258-1-nico.antinori.7@gmail.com>
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
using `pin_init::zeroed()` for `usb_device_id` initialization instead
of relying on `..unsafe { MaybeUninit::zeroed().assume_init() }`.

This change improves readability and removes unnecessary unsafe blocks.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/usb.rs | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 7aff0c82d0af..bbf85366d2c9 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -24,11 +24,8 @@
 };
 use core::{
     marker::PhantomData,
-    mem::{
-        offset_of,
-        MaybeUninit, //
-    },
-    ptr::NonNull,
+    mem::offset_of,
+    ptr::NonNull, //
 };

 /// An adapter for the registration of USB drivers.
@@ -130,8 +127,7 @@ pub const fn from_id(vendor: u16, product: u16) -> Self {
             match_flags: bindings::USB_DEVICE_ID_MATCH_DEVICE as u16,
             idVendor: vendor,
             idProduct: product,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -143,8 +139,7 @@ pub const fn from_device_ver(vendor: u16, product: u16, bcd_lo: u16, bcd_hi: u16
             idProduct: product,
             bcdDevice_lo: bcd_lo,
             bcdDevice_hi: bcd_hi,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -155,8 +150,7 @@ pub const fn from_device_info(class: u8, subclass: u8, protocol: u8) -> Self {
             bDeviceClass: class,
             bDeviceSubClass: subclass,
             bDeviceProtocol: protocol,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -167,8 +161,7 @@ pub const fn from_interface_info(class: u8, subclass: u8, protocol: u8) -> Self
             bInterfaceClass: class,
             bInterfaceSubClass: subclass,
             bInterfaceProtocol: protocol,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -180,8 +173,7 @@ pub const fn from_device_interface_class(vendor: u16, product: u16, class: u8) -
             idVendor: vendor,
             idProduct: product,
             bInterfaceClass: class,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -193,8 +185,7 @@ pub const fn from_device_interface_protocol(vendor: u16, product: u16, protocol:
             idVendor: vendor,
             idProduct: product,
             bInterfaceProtocol: protocol,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -206,8 +197,7 @@ pub const fn from_device_interface_number(vendor: u16, product: u16, number: u8)
             idVendor: vendor,
             idProduct: product,
             bInterfaceNumber: number,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }

@@ -227,8 +217,7 @@ pub const fn from_device_and_interface_info(
             bInterfaceClass: class,
             bInterfaceSubClass: subclass,
             bInterfaceProtocol: protocol,
-            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
+            ..pin_init::zeroed()
         })
     }
 }
--
2.47.3

