Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E443CEDD
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Sep 2026 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501014; cv=none; b=RMgIxEIRUqjncF2eVNqmyhHbxq72Fgxg0h04ar3FDsqdnL/jyedekAv6t373Qp3OTDBsdcW9jg+FTlLNinM5MfZ0iPMqvk5MldSQFZIZ5HVrq/h42SRpkadbcKLabcWxpQCBEou1IAHtEByc72vJoulpT+Ptxgaxw3lkbZb7o2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501014; c=relaxed/simple;
	bh=+iRmEeBjlr3/YDeOaNs/gKK7p0cdRpBI+YfHHlG1884=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pBoP9k9IymEFBIQRKbvWek1d12kGykgcU+oX2yqwty/UDQHoCEDM0KlLpR0620LHSnEJQDT+smd/Y0+mUnikFtIF3SuBrYO5MtkvzkOMiNlRVKSeiXT/7Q1ElKfPdrn7RbFiWVOU5FgsRI+Z6RyvmVrYsrEipHWB0MwAsBc/zAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzDgP4TO; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzDgP4TO"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982e8fa91d3so25375241.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Sep 2026 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501011; x=1790105811; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8pR1KvLC6hY0Jo9rktWgyCwoo7PEpaTdDrv6JZT+Rlw=;
        b=BzDgP4TOAAcElvU3u7NT1aWg1031tR/qjn+JQ5RurkQeMPpnQ6XCaVj51HkTAsDK6k
         RwnffGFs5+EFIV4/7559eybyRkh7gIKmLtLxclQ5gHFng2U111qQNQLmowNqGg1ntYfa
         kkFlYkyL8iFLwmI8QGvwSz77AxUXnHlDaKq2zgkVcQK0z/grZR7v1JX2SNEC+BzCxZJB
         5V9YdWOPtHSl8g/AE0ubEfxldpR4Z5uvl0fM58W5BWs9ouYwWrkbV9taPKiXQuDrnie3
         cJRH0oKs15qa1984JAErAcNJxFmuXjfp66JDF7nM5Rr9zuBKs1Hu4oUlnu7x6bydqSoT
         GIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501011; x=1790105811;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8pR1KvLC6hY0Jo9rktWgyCwoo7PEpaTdDrv6JZT+Rlw=;
        b=xSvbqqACsr13A/t1V1WPHyo2giiXSsEHn3VelCppMYsHPExaQTKEIP/DdgTPfRmRXh
         vQUZyyHqMONOMREGM3LACRwJpJMHdKmb3E+/O243mpfGZwLl4y4kKouL0owKsRNSbtfo
         LigyyWY2w3XMN6FHIJvJ0gLfL4AgUmxwcdq2w3TEh4V7ZBhIF9gdIEjc7fNUhiVZNhgM
         e3NvCP27WVpHFIX8Fuqkq2pJYVAc6yvdScwcekEeclx/Kp6Q+mb17BdavJ2VPyXAZNO/
         09vwpX+HyiOu/pioQ/L6197Gwq4f7dtBDaSu9vpRiNGRG52lGCUdOuMipsR7XKcBqQYU
         p/Sg==
X-Forwarded-Encrypted: i=1; AKwUvBznsngYNUyLejeve3Ul72ZbbhEfmio+QMSKyiF8tqbolqwtucM1ph+ur260m/NC0WBj02++AJbAMq0FaNlHtnGBlg5KuA==@lists.linux.dev
X-Gm-Message-State: AFuF++kbC0FxCaXLriKF/w9v2weJvlbaXZ6FWQ2AFNL0Xw+qnWmhSoxq
	GYMeZMofrHSLEkMBdqpxds28wie+Lj+U0/BX5p10HE/qdZh5ixyRmJU=
X-Gm-Gg: AYBFou2oacqWbBALt0AMh/n55AXvl+0kbnJo7M+FFwTDBdKo7XPEVX/mVH639lPjYvf
	yjp4voIowZCAHBE7Wrf3Z1iuKk4wC2VkKQKSi8KjXwCdrPiK2Wy80/OcIxvA73Y+ttniig3ORrf
	ZI1HSa1WYfOwa0ppftu+tSOFTkbta8dyGTXwOESnqtPyI7GOAJdj+WyG2fraBtnD47QT7dcR8rf
	jHaWkhkvLxNvvBMno86v629IjCJFIc9V7nljJQqk7m/OTUFjpRkSOtv3pnK3rHn5lv7mbcHJpED
	MMO3VC/6lifUzd04FOOh2V5d7deB8GbBTm+nbfrLUORI/dLuQHT5rw6FST2sMoeOWPZbL6dFyCd
	L/rns7vJk8tW4vEgC3El8rqErT+8QyeOTdSehCVV8FWaHvTj2ZQ/qubJQM9V7PzMAQu+GJoRhpz
	1UT9IszfXWdOEolM4yXDFkOmJ19ogpoY3sKvy8G8HGGWgbriHnUZ6pNUUMIdKLPj0vhZxIGkdxs
	iVJ14Ag+B8dSPKFHo2O+gkF/UBXD5C56NWaddmsGsWfTKrVng==
X-Received: by 2002:a05:6102:32d2:b0:798:24e8:23f4 with SMTP id ada2fe7eead31-79d25ece59bmr2938976137.7.1789501011162;
        Tue, 15 Sep 2026 12:36:51 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb1148f57sm691450137.4.2026.09.15.12.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:36:50 -0700 (PDT)
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
Subject: [PATCH RFC 1/3] rust: kunit: add #[should_panic] support
Date: Tue, 15 Sep 2026 16:33:52 -0300
Message-ID: <f9a3f490689322638b45d29351f1fa3cdc4c9f0f.1789500084.git.nico.antinori.7@gmail.com>
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

KUnit tests in Rust are written using user-space like syntax. This patch
adds support for the `#[should_panic]` attribute, enabling the user to test
conditions that are expected to cause a panic and report the test as
successful.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 include/kunit/test.h      |  1 +
 include/kunit/try-catch.h |  1 +
 lib/kunit/test.c          | 14 ++++++++++++
 lib/kunit/try-catch.c     |  7 ++++++
 rust/kernel/kunit.rs      |  9 ++++++++
 rust/kernel/lib.rs        | 46 ++++++++++++++++++++++++++++++++++++---
 rust/macros/kunit.rs      | 21 ++++++++++++++++--
 7 files changed, 94 insertions(+), 5 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index da5312e0dfa5..8b42f431e1c1 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -723,6 +723,7 @@ void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt,
 #define KUNIT_SUCCEED(test) _KUNIT_SAVE_LOC(test)

 void __noreturn __kunit_abort(struct kunit *test);
+void __noreturn __kunit_abort_expecting_error(struct kunit *test);

 void __printf(6, 7) __kunit_do_failed_assertion(struct kunit *test,
 						const struct kunit_loc *loc,
diff --git a/include/kunit/try-catch.h b/include/kunit/try-catch.h
index d4e1a5b98ed6..a47b1cfbcf93 100644
--- a/include/kunit/try-catch.h
+++ b/include/kunit/try-catch.h
@@ -54,6 +54,7 @@ struct kunit_try_catch {
 void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context);

 void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_catch);
+void __noreturn kunit_try_catch_throw_expecting_error(struct kunit_try_catch *try_catch);

 static inline int kunit_try_catch_get_result(struct kunit_try_catch *try_catch)
 {
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 09e3dabfac0c..32e5419a2d52 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -323,6 +323,20 @@ void __noreturn __kunit_abort(struct kunit *test)
 }
 EXPORT_SYMBOL_GPL(__kunit_abort);

+void __noreturn __kunit_abort_expecting_error(struct kunit *test)
+{
+	kunit_try_catch_throw_expecting_error(&test->try_catch); /* Does not return. */
+
+	/*
+	 * Throw could not abort from test.
+	 *
+	 * XXX: we should never reach this line! As kunit_try_catch_throw_expecting_error
+	 * is marked __noreturn.
+	 */
+	WARN_ONCE(true, "Throw could not abort from test!\n");
+}
+EXPORT_SYMBOL_GPL(__kunit_abort_expecting_error);
+
 void __kunit_do_failed_assertion(struct kunit *test,
 			       const struct kunit_loc *loc,
 			       enum kunit_assert_type type,
diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
index d84a879f0a78..123e1f86a5b3 100644
--- a/lib/kunit/try-catch.c
+++ b/lib/kunit/try-catch.c
@@ -22,6 +22,13 @@ void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_catch)
 }
 EXPORT_SYMBOL_GPL(kunit_try_catch_throw);

+void __noreturn kunit_try_catch_throw_expecting_error(struct kunit_try_catch *try_catch)
+{
+	try_catch->try_result = 0;
+	kthread_exit(0);
+}
+EXPORT_SYMBOL_GPL(kunit_try_catch_throw_expecting_error);
+
 static int kunit_generic_run_threadfn_adapter(void *data)
 {
 	struct kunit_try_catch *try_catch = data;
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 91eaff8c186a..65a1040ee2b0 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -9,6 +9,9 @@
 use crate::fmt;
 use crate::prelude::*;

+#[doc(hidden)]
+pub static KUNIT_SHOULD_PANIC: u32 = 0xDEAD7357;
+
 /// Prints a KUnit error-level message.
 ///
 /// Public but hidden since it should only be used from KUnit generated code.
@@ -345,6 +348,12 @@ fn rust_test_kunit_in_kunit_test() {
         assert!(in_kunit_test());
     }

+    #[test]
+    #[should_panic]
+    fn rust_test_kunit_panic_in_kunit_test() {
+        panic!("This test should panic and pass");
+    }
+
     #[test]
     #[cfg(not(all()))]
     fn rust_test_kunit_always_disabled_test() {
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 4d5c96ddc49c..0f6c3c00ddd5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -174,14 +174,54 @@ impl ModuleMetadata for LocalModule {
     };
 }

-#[cfg(not(testlib))]
-#[panic_handler]
-fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
+#[inline]
+fn bug_on_panic(info: &core::panic::PanicInfo<'_>) -> ! {
     pr_emerg!("{}\n", info);
     // SAFETY: FFI call.
     unsafe { bindings::BUG() };
 }

+#[cfg(all(not(testlib), not(CONFIG_KUNIT)))]
+#[panic_handler]
+fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
+    bug_on_panic(info);
+}
+
+#[cfg(all(not(testlib), CONFIG_KUNIT))]
+#[panic_handler]
+fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
+    // SAFETY: This function is safe to call even if CONFIG_KUNIT=n. If a null pointer is returned,
+    // the panic is handled same as if CONFIG_KUNIT=n.
+    let kunit_test = unsafe { ::bindings::kunit_get_current_test() };
+    if kunit_test.is_null() {
+        bug_on_panic(info);
+    } else {
+        // SAFETY: We are in the else branch of kunit_test.is_null() condition, meaning that
+        // `::bindings::kunit_get_current_test()` returned a kunit struct successfully.
+        let should_panic_ptr: *const u32 = unsafe { (*kunit_test).priv_ as *const u32 };
+        let should_panic_code: u32 = if should_panic_ptr.is_null() {
+            bug_on_panic(info);
+        } else {
+            // SAFETY: Already tested that the should_panic_ptr pointer is not null, casting it to
+            // its value should be safe since kunit_test is not null and KUnit Rust tests are
+            // initialized by assigning either null or a u32 value to the priv_ field.
+            unsafe { *should_panic_ptr }
+        };
+
+        if should_panic_code == crate::kunit::KUNIT_SHOULD_PANIC {
+            // SAFETY: We are in the else branch of kunit_test.is_null() condition, meaning that
+            // `::bindings::kunit_get_current_test()` returned a kunit struct successfully.
+            unsafe {
+                (*kunit_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
+                bindings::__kunit_abort_expecting_error(kunit_test);
+            };
+        } else {
+            pr_emerg!("Invalid KUnit priv_ code 0x{:x}\n", should_panic_code);
+            bug_on_panic(info);
+        }
+    }
+}
+
 /// Produces a pointer to an object from a pointer to one of its fields.
 ///
 /// If you encounter a type mismatch due to the [`Opaque`] type, then use [`Opaque::cast_into`] or
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index ae20ed6768f1..2c6405cebc0a 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -106,6 +106,11 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             .cloned()
             .collect();

+        let should_panic = f
+            .attrs
+            .iter()
+            .any(|attr| attr.path().is_ident("should_panic"));
+
         // Before the test, override usual `assert!` and `assert_eq!` macros with ones that call
         // KUnit instead.
         let test_str = test.to_string();
@@ -135,6 +140,19 @@ macro_rules! assert_eq {
             &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
             test.span(),
         );
+        let assertion = if should_panic {
+            quote!(
+                (*_test).priv_ = &raw const crate::kunit::KUNIT_SHOULD_PANIC as *mut ffi::c_void;
+                let _ = #test();
+                (*_test).status = ::kernel::bindings::kunit_status_KUNIT_FAILURE;
+            )
+        } else {
+            quote!(
+                (*_test).priv_ = core::ptr::null_mut();
+                use ::kernel::kunit::is_test_result_ok;
+                assert!(is_test_result_ok(#test()));
+            )
+        };
         processed_items.push(parse_quote! {
             unsafe extern "C" fn #kunit_wrapper_fn_name(_test: *mut ::kernel::bindings::kunit) {
                 (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SKIPPED;
@@ -145,8 +163,7 @@ macro_rules! assert_eq {
                 #(#cfg_attrs)*
                 {
                     (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
-                    use ::kernel::kunit::is_test_result_ok;
-                    assert!(is_test_result_ok(#test()));
+                    #assertion
                 }
             }
         });
--
2.47.3

