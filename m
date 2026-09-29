Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA664FD7AF
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691231; cv=none; b=VZa3OPRtWAVZ24eCeAdhnErkC7a/kqyMVDel+3N2VESPXDwzEwYBimqcA6XTBIsVaRSzc6v0Dwb8AaSO7ZVcORhdT7PHgPOh2dkBwAwsrv/9KV3xpDz3fCNjA7xDQJmrxCYHgxkBMdAWlVGnqYzaT6keSqC3Bkas/XtHUuRGNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691231; c=relaxed/simple;
	bh=DcbTLHD/tVnZXO6Wcep2ztjwIHfAxEpXw9x6ciDS0H4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MznIdjCrYaRBQ/ShtUAXObdalXcWVRmijwPT2YAgwfSUac3FqLQ5UXe3Vw84u7iMkKW4hCci/YID9Q46bT7xWTzeXb8C5O/Ia3OYWEjfvQOMIOek9jBNR5BCXp4Avi8NPK8LkmJK8LzXLdhsRCc+YKeOl+DkOAxur+Q0q9wpYps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwrKvEhw; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwrKvEhw"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso227790eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691229; x=1791296029; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0iuzWgmMrAdCcDL0sS3FSyhRSjl5Wen75MYK1Cmll8=;
        b=DwrKvEhwYZkJsoIOYon/piM2gR2ndQoUHJdNW5JEe9db+qbOHD6ch58ks1GD4Zsjb/
         XkNCqKR4547lX/08iwe0UNim7aCHYDC9ooFgN5JS/WR9jOr2QxCjBg7+EMBYWVQYeGv3
         HYBJz42RZvnAZkBBEnX4JhNT/TUJXFCY+5t8eqX0SmHNPw5oDL+/ZvQgvQlTKRiEGWUD
         RBnsCFa8FxvjEtXusw7vaVIss66MDma4S62wo81rA0rGlQXY4MBjZALJrctmoi5w2DBF
         wrHd6fZE8FDTDouCrBKNPuHMfEDCqyIxDi9gS0tRSjORBX+zV86dYMj95F0OFQ/1349e
         5X9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691229; x=1791296029;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0iuzWgmMrAdCcDL0sS3FSyhRSjl5Wen75MYK1Cmll8=;
        b=tn3SWvIGeWZFSG1uqj1W0MoSWQnlBrAzxLFSbocO9S0r1CByo3+oSIgmrdEupwDuDx
         J2063NjlybwCqg13bT1IkDIsjfNuqw0hymSaNq8fcXYdF5kk5lmp3/EtzXwAOnxWtrY6
         Bdi9Xxb4MVvcdfWVrpezzuaAY9kxh4HFbTzc9EQr2+kboGBcaGWgQq64FtMGAviPZyQ0
         maj1OYsarkdDvAeve79Tv/EHd7moZsScquMD4UHT1cJZ8HM36id5FZvOKijYJZ66ZE6l
         FDx4ZKJ06tJzSmizUjlc3h9UDsdLdVuDBgVhEV/+IxheVwzC0++zHfYXjcYL2KNkoA8p
         gcgg==
X-Forwarded-Encrypted: i=1; AKwUvBy7o0ammhHEf3a6qiOmfL+lq3UauI4gfgyvCObUt++7jhRizdHwPkDglq2VWTlzxAKbRO3RBICsjB/2GF9oRQe/46JerQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKv3NEOkrzmbEgLImzbR9Zvdc8SswthErJiPP2Pooer+2+mEDrc
	stvNyshEuErJF4TsczxNGj9++Lp/sz1bbLiWMaBTghKdmxLTFBBrZAw=
X-Gm-Gg: AYBFou1EbYQw4h2bJ9gdbXrcEOVDG49DI0xuNuUilM7DpO4+cs/1MYuE/tiJ96G8y5I
	BxBhP0L9Y01Ol9D4uVg6WV8trsf9Q2KxOVtVlQ+mPtkCIsoMlrIIxtkcurEIY9BkElYeBwm8X3L
	QYuREU58w9qmuS2sO13tMmgaMrcSQvZo2JuoHOt3FUM0IrXdX103dJmlBn4v6TIFwVEdAF5GtZi
	radNEYo0qdq9abm1chQ7Sb0mLuQJg03RN344C5d1+l17eRe8e8USPhg83KcV6gw+2D9pcZJ65QW
	+W3erUx92xKR8Pe7/3LPP03yc6iH31eSU81vbR6CbWi97U17bf4NPB/gVbXO74Dg2ZDz1l4sSfq
	RpYlbuVJMEXWQxAo+O+D34/ydiHhHGJuJKU5QpFPrasah0xUk0r2JPhnoZjqrROofNpoG461mto
	1xrxtynZ+XQGiCZqT/Ol12LqPwQjizox1a/HUXcHVStfD6JyHx+uwaFMbNrWWLe6LwUuYmkkbhp
	b5dfkUTTO41OXYdbiqENmfgUQ8OH5NjEDoEJotk3WAf6r/vjw==
X-Received: by 2002:a05:693c:65d6:b0:340:c464:1a2f with SMTP id 5a478bee46e88-34270ab09f7mr15069104eec.16.1790691213669;
        Tue, 29 Sep 2026 07:13:33 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:13:29 -0700 (PDT)
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
Subject: [PATCH 0/3] rust: kunit: support #[should_panic] and same test name with different #[cfg(...)]
Date: Tue, 29 Sep 2026 11:07:40 -0300
Message-ID: <cover.1790599486.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series intends to implement two features for KUnit tests
written in Rust. The work is based on a TODO comment made in the
`bitmap.rs` module [1].

Changelog:
- RFC patch: [3]

1. Supporting `#[should_panic]` [2]:

KUnit tests in Rust follow the user-space syntax, but at the moment
`#[should_panic]` is not supported. The first patch of this series adds
support for the attribute (only in its basic form, `#[should_panic =
"message"]` is not supported yet).

The way it is supported is by adding a new boolean property called
`rust_should_panic` to `kunit_attributes` struct in kunit/test.h and
check for the `try_catch->try_result` code and the named flag to detect
if there was a panic in `lib/kunit/test.c::kunit_run_case_catch_errors`
function.

The difference with the previous version [3] is that now, almost
everything is handled in the C side, meaning that we don't have a
separate `#[panic_handler]` when KUnit tests are active. In other words
there's no need of a Rust side panic handler because the C side catches
Rust's panics too, since the `#[panic_hanlder]` executes a
bindings::BUG().

2. Allow same test name with different #[cfg(...)]:

When testing `#[should_panic]` in `bitmap.rs` (check the last patch of
the series) I found that the test that was supposed to panic had the
same name as another one, but they were run on different configurations.
This caused the following compilation error:

ERROR:root:error[E0428]: the name `kunit_rust_wrapper_owned_bitmap_out_of_bounds` is defined multiple times
   --> ../rust/kernel/bitmap.rs:503:1
    |
503 | #[macros::kunit_tests(rust_kernel_bitmap)]
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `kunit_rust_wrapper_owned_bitmap_out_of_bounds` redefined here
    |
    = note: `kunit_rust_wrapper_owned_bitmap_out_of_bounds` must be defined only once in the value namespace of this module
    = note: this error originates in the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)

Now, only the tests with an active `#[cfg(...)]` will be executed by the
runner. Tests with an inactive `#[cfg(...)]` will not appear in the
report since they are not added to the TEST_CASES array.

[1] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/bitmap.rs#L592-L600
[2] https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html#testing-panics
[3] https://lore.kernel.org/rust-for-linux/cover.1789500084.git.nico.antinori.7@gmail.com/

Nicolás Antinori (3):
  rust: kunit: add #[should_panic] support
  rust: kunit: allow same test name with different #[cfg(...)]
  rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case

 include/kunit/test.h   |  1 +
 lib/kunit/attributes.c | 18 ++++++++++++++++
 lib/kunit/test.c       |  5 +++++
 rust/kernel/bitmap.rs  | 40 ++++++++++++++++-------------------
 rust/kernel/kunit.rs   | 37 ++++++++++++++++++++++++++++++++
 rust/macros/kunit.rs   | 48 +++++++++++++++++++++++++++++++++---------
 6 files changed, 117 insertions(+), 32 deletions(-)

--
2.47.3

