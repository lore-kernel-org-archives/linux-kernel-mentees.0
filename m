Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52203C1D65
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691274; cv=none; b=ZrRg7pI0mWk+QFYRCd3mv4iuEJjMP5z0B9VxApuRA9n0SKvqhx7uGeGgQHabs3AwKA9Lz1BSgQuClLBdTBAhoJ49ebhMXMyKbyPq7ovgvUfPgKMvQLjDC3SdEuwX81wnf/W+MmIqyRH4azHySYJBkj7EhA5JNlzH5t/lSBhTzqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691274; c=relaxed/simple;
	bh=q/uIYLcPSFObDJjtPbKhA7rAxxJvoJzI8r/TGrW80ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qs/vSLwacq8e2A4yUO4m+gJzM+1hlLALoLtLfka8nCYCflIt/DtUw7TXS+Q4rBnI9F8t8wSdNnGY2BqhD1jagF2qLoBp/yHFayTOU4FvwAdCe32Wsjm1Gps9NMQQfSFASCKjV7HCsBSbldFejJPXnMaBdsFa114K5xtZ/45Fbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1aQ0Bk8; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1aQ0Bk8"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bcb929cceso294918eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691272; x=1791296072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSqpMHsSCgHMp6sYSZJ0Zph1nPml/+XmXvdv8QAUIRw=;
        b=C1aQ0Bk8yo3a51bkeXEd2t6uPecHN1tsVLLWU9CfaxVNBVmgdSgtxbJLCr2bQtslTB
         OWvT02WZRTv/HFwPZzTIHTx2h6O2+/SgWfP/x3VF8Oc2mxR5TihD2ElrC8WGA54XUmsF
         b7LIvo0de34vn0cGrlZ9zam329WFTW6+UfWUIjYazk/Wg0MXNOKaRZOb80zu6rZ0YR3x
         dx/vWbKA2GHN8PhE2MHNA26hSivU+1NaxahLlYDkzhcgoNQKl4vAHaVPtdWN0B0v/LtI
         n3yxXeKvKGDnXW2W7QBAM0MRyWPzinvUAwI36j3P+N/kxEmOrjUL27cI1PwU0IuzFAXI
         snRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691272; x=1791296072;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSqpMHsSCgHMp6sYSZJ0Zph1nPml/+XmXvdv8QAUIRw=;
        b=fLbfQJrT3HM8VpuwGmXKnjKpdQxgTPCM6lIKjVaqvL4zt6IKem8x2FfhBrAO1+zURM
         PAmxbFurbQ7wT1YfFTtauRFeF1DQR+I0BaN3BsJwkddyB7wSU1GS0Fz5VVjHUqpbDVqF
         sCQGJ18GFfBt5d6DO9IXJYQ94G4WS7OcNcB3GodzX8DE0HZ5mgVZpGXddxGbDAesMNui
         VKiYciFe3dfPzUEEQVUHRiwzaiOXB59zSd3ojsihxTzXqmA0zZutGPOVu9A7Kb0xyjn2
         4MurKFwWufgZybZ2UBMdiZfWTh3uc7K6StaxoBxxdJs1Gnp/YzRuI7YOu09M+qSBHcjY
         eI0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqtLbi/1VCcoMaW++ctwxlyH0TsHVShAqxZJkCw8OOxi957gmXO8Vhr0I/KqPz6oJ0zeN7AkeHNDpMGECsmBcqvYyMbg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLHFJIcFcT7SFyNeMuK14Q776fQmDVniOtTjl2SjwyMo+x8/raK
	p4fOE6js+50MiUObVvWYwmlOSlqbDcnv46w/yu6glnA9/7OYmA5y9RA=
X-Gm-Gg: AYBFou0Div5UY8qEVnrAErx77sVFBYX/KQCbt77h39KWMj7oBXYawpzintWY2HKdQvr
	3LHkWb3cD/ojadTl86/5TIy7uQBW1vMHhocU9GTC2HUQ6wHsTqFwwJpabQJ6hgTZSImP75vyaKk
	4Dv4M7boTq8bBj9V0+/iSScpnDrMg2GEdnSmmHKulKx6ulEUmEoFQ6Eb8bzf0LPiw7GR87fby7+
	ctRa1ZjcH2HG4kRgP3EGcGlJi60/6ASrY9OgB7NUrLsAlcg/F09ofV/EHCNlfUCWTteLd80swVw
	xGmuRPfsui/SHNNiqKT6KMq87Fj6FnDr6jAk0SLnxLkl/jqA3tQvlEV0WWkVZ+VhYA09dU+Rdlm
	cUsk1DcgwjVWUVnYx2tXei3s8drJcCe9iQuOjSPrdizsP0cyhh19LJ3r92ouBfyA0nKedmEXTNM
	G9USaxzheiiFi5CDzuncgBZYApS58K7alL2gqSbCtjfEF9vl02KqYHlC6xvj37MPUkekX/6TUOi
	EWgRCc7y3fLm6ZCrg9lRsmke/G7pXYKeIANxYhb85XBJ9enWg==
X-Received: by 2002:a05:7300:80c9:b0:334:8fb7:1dfd with SMTP id 5a478bee46e88-342700c75e6mr17555271eec.8.1790691244787;
        Tue, 29 Sep 2026 07:14:04 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:14:03 -0700 (PDT)
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
Subject: [PATCH 2/3] rust: kunit: allow same test name with different #[cfg(...)]
Date: Tue, 29 Sep 2026 11:07:42 -0300
Message-ID: <0f710a749bec162c3cf96f83d8425e7ad48e78e6.1790599486.git.nico.antinori.7@gmail.com>
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

Sometimes it is necessary to test the same code paths under different
configurations. The `#[cfg(...)]` macro can be used to check if specific
configurations are enabled and run tests accordingly.

Currently, defining multiple tests with the same name under different
`#[cfg(...)]` attributes results in a compilation error. This patch
removes that restriction, allowing identical test names across different
configurations.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/kunit.rs | 22 ++++++++++++++++++++++
 rust/macros/kunit.rs | 20 +++++++++++++++-----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 5fa4d994e0f7..5ff988ab76a4 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -347,6 +347,28 @@ fn rust_test_kunit_in_kunit_test() {
         assert!(in_kunit_test());
     }

+    // Tests with cfg have the same name on purpose because we are implicitly testing that
+    // tests with the same name but different configs do not throw a compilation error
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "y")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        assert!(in_kunit_test());
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "n")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "INVALID_VALUE")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
     #[test]
     #[should_panic]
     fn rust_test_kunit_panic_in_kunit_test() {
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index f1d0210e6a49..18cfa463c8db 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -45,6 +45,8 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke

     let mut processed_items = Vec::new();
     let mut test_cases = Vec::new();
+    let mut test_cases_cfgs = Vec::new();
+    let mut test_case_number: u32 = 1;

     // Generate the test KUnit test suite and a test case for each `#[test]`.
     //
@@ -135,7 +137,7 @@ macro_rules! assert_eq {
         // Add back the test item.
         processed_items.push(Item::Fn(f));

-        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}");
+        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}_{test_case_number}");
         let test_cstr = LitCStr::new(
             &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
             test.span(),
@@ -172,15 +174,23 @@ macro_rules! assert_eq {
             case.attr.rust_should_panic = #should_panic;
             case
         }));
+        test_cases_cfgs.push(cfg_attrs);
+        test_case_number += 1;
     }

-    let num_tests_plus_1 = test_cases.len() + 1;
+    // This dummy array is used to calculate the exact number of tests cases that are active
+    // depending on their #[cfg(...)] attribute.
+    processed_items.push(parse_quote!(
+        const TEST_CASES_COUNT: &[()] = &[#(#(#test_cases_cfgs)* (),)* ()];
+    ));
+
     processed_items.push(parse_quote! {
-        static mut TEST_CASES: [::kernel::bindings::kunit_case; #num_tests_plus_1] = [
-            #(#test_cases,)*
-            ::pin_init::zeroed(),
+        static mut TEST_CASES: [::kernel::bindings::kunit_case; TEST_CASES_COUNT.len()] = [
+            #(#(#test_cases_cfgs)* { #test_cases },)*
+            ::pin_init::zeroed()
         ];
     });
+
     processed_items.push(parse_quote! {
         ::kernel::kunit_unsafe_test_suite!(#test_suite, TEST_CASES);
     });
--
2.47.3

