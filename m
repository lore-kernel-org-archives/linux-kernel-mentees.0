Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEEC221737
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591864; cv=none; b=LOu1pc7voldDMp96VihGfkYdmmHp+JLcfs72Mt2n2qMUEWQStWKZhKWJXmxS8NgFh9jVDO8XwG3zFzkipb3LGhYy4zhqY5lcKMGSDCdMNIn6O5Mzch2pgy7vo9QLGdjj2GT6uSpNtn+E1agmuoEAFumkD1JSHN4UFGJMMGTCrCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591864; c=relaxed/simple;
	bh=Zu63HHkaNmeHO+nk8MSfP7JWXnAppM72Ccgnmk4GrTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=domwyWDjd2w+ED9s9/U0dxw8AWyWEv13fSGgTmCwahUjjfEcjIcgnkMYZW9bdb3uhuJ9k9UxZkXrKgH9l6cdTI9We208F7F7RuQiOa3NvXDxOQ5uAemYiBLxULA4yLIaUdctIPPczPk7s+1l29x5w8ZopRdzERIoC5J9TsI7rQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uolx1Yl8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uolx1Yl8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2235189adaeso62888875ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 00:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741591863; x=1742196663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKmv+q9cPJk5vyRVGZkQzjZQAXXzEnVw5/P1XfmlNVQ=;
        b=Uolx1Yl8HNFDaBkJRMTydqqt6ecdOW5Tg0tR91J7lEhqc092BV243zCDHoDxGLztxL
         44KoVZgwULHkbW57mAGRKBsVQ8MQHzbPXqFIl7f+eUDljaYsQASPH40q/HhTKcq+SgV6
         p2BafzPGORoA2LKfP6nidbPNOos3FkVFMNkTHvlG4ah6gw0c7j4Y+rEeYv6wt1+/M9KV
         uB1JZ4t1DrUUXCNVvQiFJbZP1t87MdZ7JVwQRCBd4BaD/Gcm2V01DeI1zVNO/ecMJGkP
         qRfWlEjl+FiYJijpYNhRYPNsDgAKIf4QvsB7Wdb8tYuqLs6f5ETGS9x8jnB4cUHiP2+o
         AGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741591863; x=1742196663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKmv+q9cPJk5vyRVGZkQzjZQAXXzEnVw5/P1XfmlNVQ=;
        b=fSdR+jnzIW8jBwVJV0Mubl73lXsgZbZ1cYDbVmz66z9DPjXURBexci7fzmXCGhOM9M
         LaUzPsPZXxF0FYr3OZ6SSu9nnzpTgCH5BoLLWW/V5G3LSkmJDE6VfknN67JwwwKUvVyw
         /V2xe5985SBUi2QP9fJnI202Wb5Q17BIOKswC7L32EKNjpCqp+PqAd30aCiIt8KxBqs2
         TOcX/H7B1q3upgVN2bjlJoYrGJ2AUkXXXzcmYovdVoaxgHGPHezFRifUKtTyckKHAYlc
         PCWRPU2XgvyBRGEYWs8gvCtxLWblGosNIqRlr3i81FYYy0cr8Ucsl3Y9IUymID66iqCg
         9KuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYY/yYr5EDRsMev/0fXvcLlBVOoLuXlaWGryGf4OvF4E6eLltchyMhm1SGLTGkb1l2QAGLEupZur5jjcQpFwOoCz/S4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzcMOYDFDsizLP91UuCbiTcmLrQxN4YGUTUHOUYksmHm1NGuW0
	8FievYg66qmUlAHx5R7sanqtuhH0QqnbnuYDm2x17dVmmK1bRVAj
X-Gm-Gg: ASbGncuslZGmx88W0gwhBgXQ2BYcizHJUlmV3xKknnhzy+UcJf7yZzcpT6lfxmXqf7B
	1wne2KJguJ2YcUR+yHxymrYCgrMvBmvadxsOkYH2cUg7HGwEDkmfnSj7LiEj7A059hJQWnX62XZ
	/LRTVV4ynS8quHJ+ksU2Gp6MsPfXkIKKpL+YPEWj/0he1jCB4/qpLiXWxhcjXtzwsr9iC/XY5GL
	uta1WIg2OaaHqdd7xYp+vgDAYMImEHNdC8Nc7OT9rpHH/QkY2oBPu2MwwpROv09/Jr9KSBAVdHf
	Vy35nt66IbK09MSnafIBd0xqEVmaBUTQGqafUwSIaQJ5Q0m2dHgAgGINOHn/mkYPZU4W86jd+A=
	=
X-Google-Smtp-Source: AGHT+IEIZYO16EUwy5bWYTfuapkyReziPRqQOHrEE8d66FtEMAZjuctqsCd8Be6/ecyitm/MYSDiYA==
X-Received: by 2002:a17:902:db0b:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-2246454cf0fmr145304815ad.25.1741591862631;
        Mon, 10 Mar 2025 00:31:02 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:7ad0:37c7:5275:4b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f773sm70840715ad.117.2025.03.10.00.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 00:31:02 -0700 (PDT)
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
Subject: [RFC PATCH 2/2] rust: list: Add examples for linked list
Date: Mon, 10 Mar 2025 15:30:40 +0800
Message-ID: <20250310073040.423383-3-richard120310@gmail.com>
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

Add basic examples for the structure "List". They also serve as the unit
tests for basic list methods. A simple "struct MyData" is used here to
serve as the data to form the list, the members are trivial and naive
for the simplicity of examples.

The trait "ListArcSafe<ID>" isn't tracked here, dicussions are needed to
see whether a tracker is necessary.

Link: https://github.com/Rust-for-Linux/linux/issues/1121
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 rust/kernel/list.rs | 90 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 57d75ca16434..d1954c403f67 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -35,6 +35,96 @@
 /// * All prev/next pointers in `ListLinks` fields of items in the list are valid and form a cycle.
 /// * For every item in the list, the list owns the associated [`ListArc`] reference and has
 ///   exclusive access to the `ListLinks` field.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::list::*;
+///
+/// struct MyData { value: i32, link: ListLinks<0> };
+///
+/// impl_list_arc_safe! {
+///     impl ListArcSafe<0> for MyData { untracked; }
+/// }
+/// impl_has_list_links! {
+///     impl HasListLinks<0> for MyData { self.link }
+/// }
+/// impl_list_item! {
+///     impl ListItem<0> for MyData { using ListLinks; }
+/// }
+///
+/// let mut my_list = List::<MyData, 0>::new();
+///
+/// // The list should be empty at the moment.
+/// assert!(my_list.is_empty());
+///
+/// let item_1 = ListArc::<MyData, 0>::new(
+///     MyData {
+///         value: 10,
+///         link: ListLinks::<0>::new_link(),
+///     }, GFP_KERNEL
+/// ).unwrap();
+///
+/// let item_2 = ListArc::<MyData, 0>::new(
+///     MyData {
+///         value: 20,
+///         link: ListLinks::<0>::new_link(),
+///     }, GFP_KERNEL
+/// ).unwrap();
+///
+/// let item_3 = ListArc::<MyData, 0>::new(
+///     MyData {
+///         value: 30,
+///         link: ListLinks::<0>::new_link(),
+///     }, GFP_KERNEL
+/// ).unwrap();
+///
+/// // Append the nodes using push_back()
+/// my_list.push_back(item_1);
+/// my_list.push_back(item_2);
+/// my_list.push_back(item_3);
+///
+/// // Verify the length of the list.
+/// assert_eq!(my_list.iter().count(), 3);
+///
+/// // Iterater over the list and verify
+/// // the nodes were inserted correctly.
+/// let mut counter = 10;
+/// for item in my_list.iter() {
+///     assert_eq!(item.value, counter);
+///     counter += 10;
+/// }
+///
+/// // Pop the items out from the list and
+/// // verify their content.
+/// let item_3 = my_list.pop_back().unwrap();
+/// let item_1 = my_list.pop_front().unwrap();
+/// let item_2 = my_list.pop_front().unwrap();
+/// assert_eq!(item_1.value, 10);
+/// assert_eq!(item_2.value, 20);
+/// assert_eq!(item_3.value, 30);
+/// assert!(my_list.is_empty());
+///
+/// // Append the nodes using push_front()
+/// my_list.push_front(item_1);
+/// my_list.push_front(item_2);
+/// my_list.push_front(item_3);
+/// assert_eq!(my_list.iter().count(), 3);
+///
+/// // Use Cursor to verify the nodes were
+/// // inserted correctly.
+///
+/// let mut cursor = my_list.cursor_front().unwrap();
+/// assert_eq!(cursor.current().value, 30);
+/// cursor = cursor.next().unwrap();
+/// assert_eq!(cursor.current().value, 20);
+/// cursor = cursor.next().unwrap();
+/// assert_eq!(cursor.current().value, 10);
+/// assert!(cursor.next().is_none());
+///
+/// # Ok::<(), Error>(())
+/// ```
+///
 pub struct List<T: ?Sized + ListItem<ID>, const ID: u64 = 0> {
     first: *mut ListLinksFields,
     _ty: PhantomData<ListArc<T, ID>>,
-- 
2.43.0

