Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCA829D0B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Mar 2025 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741700051; cv=none; b=uvBlaN5mj8ve54wLmGUcgGPNk1RoKrYYlfmOwh1uUIVItvBJr3c4AHkqzTG/2DYjSuE85kQ9ZJku+hxcbbY8G2H5hcSdQDDAjRW1KUvqw2myypsmtCYIfwwBbxZOz9OtC/dfCM36/7XpNftMq5ZLncTx+Gbunwb5qrJMwqlEVbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741700051; c=relaxed/simple;
	bh=i1xj+zFG3UehjU44ahmp1dt39i4m5KVte78HhzKkb/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dqmMJl1repJOZTWiSWd9CAeK0r+AsIqkGNj51B2Xm4TVEivSjfnfV2zmKF3qaqFuSe7pSC6HDkOFPVwi9IT3bLcMA8zfI24oiq8NB+w7zvWKP8mK3yARZwQIEtiAM0p+waaNzf8XmFYgW08Agd8tDpJMwEeXY5KPM/4BUK+6DYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EysPkYqn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EysPkYqn"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22409077c06so11018765ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Mar 2025 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741700048; x=1742304848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/e1H/WN0SKrMg5KpGRPOz286h8sEdauBj5iHRxNHp8=;
        b=EysPkYqnPQHZePGkPuWG9gn4ZzWORVhXtn7dY9CdiqTxG02l7tmfkdFmBtyxhbLhAS
         y9My31ACzMaeRG3OuARshOcFAQqyF3MAz4pW87MfGf3xfJcPU11ylfQ+h3vN9HN4Sfw4
         pf0WlsmF2edfMMPLxkjUH5eUQeEF/JS6eiito4jwwCYpbyHGVuC0Bbs1Y6CTw0FLaHlS
         7vd+3JVKNWOUvAPX+wM/+YETZUQFNIt1M4T5QfN9n77yFgtdsbOOkZ61L9uSII7YaGfR
         r2ul2+4gmObngeXYPGpt66hXudeJZoDTjhfl8/jgoI8Ld3nloWtrlwd9xNpIFEuHk9o2
         Aowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741700048; x=1742304848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/e1H/WN0SKrMg5KpGRPOz286h8sEdauBj5iHRxNHp8=;
        b=WjeWnkC8mmBOJ6Q0ufTEloQET8Au/hs+KGND0n1vO3WKfvChwjacmtGBOhcklsPqUN
         cgyMY9ejW194vwpPkzEYdZe2ZYn31SGFg4qsW0XMf/qq9QaulBRRfPSQ8dG+zVV/QCVT
         V15OIPeN0binBu9EfusT3YfGFnhRYiDDQk4scrv9jheONS8T15Qxuq5p19PiUKPX0Ke6
         HVLjjXklK2LuxWYuoOCIol1deO4Jzf29QZGkw+xfIkXEUFG3zvyb42sYgyNO1iWYHpDz
         8YHp7XaFev8ZBiJR5h5ZjohdMRzU/BM2AMBtSVGOTwjXObpCCouZbvhU9xTqmaw4aVlm
         7Uow==
X-Forwarded-Encrypted: i=1; AJvYcCXWOVBQEjWgOvWY9kvb59yMe4CFyZRTvUQwN/QcYcV1gHWIRjTe5tDj2RoAu3esht39UF1ESSgVSV+ctPSojovRSUc3Zg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt76gY+2G2N1o/h+zRjrJwcQs9LRGqAOf2kuzePORgAHxP1333
	Nibr5tN/Q896v/FSkV+etDkL8wvYpsFiIIgCfBh1IZe/i/k/4IYu
X-Gm-Gg: ASbGncuNLjzIbfBPXEBbwqee0QKo+KcQX+aEElWQ8uSs9tswdSA+wkwlV3A7YLcKnms
	4TL5AFM+xjJ74zmLf+nxFw7/ua2jMsnsJ5ZXA7PUCIuOHg8NN5M4UvY1Cy7iHQHNyn5Lx63n+m/
	sTkDE1Z9/OvCiQv62HvaTDxIAsdxqHDqbBF/y8vlg8p1pWsIL4lUgUefXUkeIbVL6neoUXA4eBK
	u4vuhtIoYczeLPeCTRznIT2eqABK3SJgSvZQ/UjmQphrP5FZubk2f0bYgCIVZRULQLMxKOMjEmn
	DyJQfR4+gi6K58QDUtX/+6dIeOR9W/mCaUZ3e2Hh6CuLGo++jl2gzJg+caHRxCzcHQTnYEFdQ9g
	=
X-Google-Smtp-Source: AGHT+IHuXyhKb1RBCu+eBFncNy9UpOy9LOExMY69QgsrQX+D8NRENRqvH1GWrXfdX3vSR02LO3SFPA==
X-Received: by 2002:a17:903:1788:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22428a8ca41mr290901485ad.24.1741700048488;
        Tue, 11 Mar 2025 06:34:08 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:fdf7:beab:3280:ac4f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f96bsm97398105ad.133.2025.03.11.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 06:34:07 -0700 (PDT)
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
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH v2] rust: list: Add examples for linked list
Date: Tue, 11 Mar 2025 21:33:57 +0800
Message-ID: <20250311133357.90322-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic examples for the structure "List", also serve as the unit
tests for basic list methods. Including the following manipulations:
* List creation
* List emptiness check
* List insertion through push_front(), push_back()
* List item removal through pop_front(), pop_back()
* Push one list to another through push_all_back()

The method "remove()" doesn't have an example here because insertion
with push_front() or push_back() will take the ownership of the item,
which means we can't keep any valid reference to the node we want to
remove, unless Cursor is used. The remove example through Cursor is
already demonstrate with 'commit 52ae96f5187c ("rust: list: make the
cursor point between elements")' .

Link: https://github.com/Rust-for-Linux/linux/issues/1121
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Changelog:

v1 -> v2:
    - Abandon new implementation of method to create a new "ListLink"
      instance
    - Rephrase the examples' comment
    - Increase the coverity of the examples

Tests was performed on ubuntu 24.04 with x86_64 architecture.

$ ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
...
[21:13:11] Testing complete. Ran 615 tests: passed: 563, skipped: 52
[21:13:11] Elapsed time: 23.020s total, 0.001s configuring, 10.985s building, 12.020s running

Rust related unit tests are all passed.

Best regards,
I Hsin Cheng
---
 rust/kernel/list.rs | 117 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index c0ed227b8a4f..b88b63432e02 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -35,6 +35,123 @@
 /// * All prev/next pointers in `ListLinks` fields of items in the list are valid and form a cycle.
 /// * For every item in the list, the list owns the associated [`ListArc`] reference and has
 ///   exclusive access to the `ListLinks` field.
+///
+///
+/// # Examples
+///
+/// ```
+/// use kernel::prelude::*;
+/// use kernel::list::*;
+///
+/// #[pin_data]
+/// struct BasicItem {
+///     value: i32,
+///     #[pin]
+///     links: ListLinks,
+/// }
+///
+/// impl BasicItem {
+///     fn new(value: i32) -> Result<ListArc<Self>> {
+///         ListArc::pin_init(try_pin_init!(Self {
+///             value,
+///             links <- ListLinks::new(),
+///         }), GFP_KERNEL)
+///     }
+/// }
+///
+/// impl_has_list_links! {
+///     impl HasListLinks<0> for BasicItem { self.links }
+/// }
+/// impl_list_arc_safe! {
+///     impl ListArcSafe<0> for BasicItem { untracked; }
+/// }
+/// impl_list_item! {
+///     impl ListItem<0> for BasicItem { using ListLinks; }
+/// }
+///
+/// // Create a new empty list.
+/// let mut list = List::new();
+/// {
+///     assert!(list.is_empty());
+/// }
+///
+/// // Insert 3 elements using push_back()
+/// list.push_back(BasicItem::new(15)?);
+/// list.push_back(BasicItem::new(10)?);
+/// list.push_back(BasicItem::new(30)?);
+///
+/// // Iterate over the list to verify the
+/// // nodes were inserted correctly.
+/// // [15, 10, 30]
+/// {
+///     let mut iter = list.iter();
+///     assert_eq!(iter.next().unwrap().value, 15);
+///     assert_eq!(iter.next().unwrap().value, 10);
+///     assert_eq!(iter.next().unwrap().value, 30);
+///     assert!(iter.next().is_none());
+///
+///     // Verify the length of the list
+///     assert_eq!(list.iter().count(), 3);
+/// }
+///
+/// // Pop the items from the list using pop_back()
+/// // and verify the content.
+/// {
+///     assert_eq!(list.pop_back().unwrap().value, 30);
+///     assert_eq!(list.pop_back().unwrap().value, 10);
+///     assert_eq!(list.pop_back().unwrap().value, 15);
+/// }
+///
+/// // Insert 3 elements using push_front()
+/// list.push_front(BasicItem::new(15)?);
+/// list.push_front(BasicItem::new(10)?);
+/// list.push_front(BasicItem::new(30)?);
+///
+/// // Iterate over the list to verify the
+/// // nodes were inserted correctly.
+/// // [30, 10, 15]
+/// {
+///     let mut iter = list.iter();
+///     assert_eq!(iter.next().unwrap().value, 30);
+///     assert_eq!(iter.next().unwrap().value, 10);
+///     assert_eq!(iter.next().unwrap().value, 15);
+///     assert!(iter.next().is_none());
+///
+///     // Verify the length of the list
+///     assert_eq!(list.iter().count(), 3);
+/// }
+///
+/// // Pop the items from the list using pop_front()
+/// // and verify the content.
+/// {
+///     assert_eq!(list.pop_front().unwrap().value, 30);
+///     assert_eq!(list.pop_front().unwrap().value, 10);
+/// }
+///
+/// // Push list2 to list through push_all_back()
+/// // list: [15]
+/// // list2: [25, 35]
+/// {
+///     let mut list2 = List::new();
+///     list2.push_back(BasicItem::new(25)?);
+///     list2.push_back(BasicItem::new(35)?);
+///
+///     list.push_all_back(&mut list2);
+///
+///     // list: [15, 25, 35]
+///     // list2: []
+///     let mut iter = list.iter();
+///     assert_eq!(iter.next().unwrap().value, 15);
+///     assert_eq!(iter.next().unwrap().value, 25);
+///     assert_eq!(iter.next().unwrap().value, 35);
+///     assert!(iter.next().is_none());
+///     assert!(list2.is_empty());
+///
+/// }
+///
+/// # Result::<(), Error>::Ok(())
+/// ```
+///
 pub struct List<T: ?Sized + ListItem<ID>, const ID: u64 = 0> {
     first: *mut ListLinksFields,
     _ty: PhantomData<ListArc<T, ID>>,
-- 
2.43.0

