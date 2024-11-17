Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2411DA61E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Nov 2024 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731873583; cv=none; b=dPJ0I+CQbcoG8ZLMXxg7sLDihytYM+x3V50ainU97dtqqnUcAWk/C94OL3CNIqreW6hUoTvOxhnzJNLTN8gJ9La28FTiWagrl0lJo88xG6Xc4wDHtpY9bAQeVXS5EbYAyJmEDX41nbXr7AuG323z6UE1bftMm0UHtA544Nsto/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731873583; c=relaxed/simple;
	bh=A7LDR2WTm3yVtB3dfTI27AwAg+BuKvY+MCssOoBp/h4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Q4Lpxy2MRxVqq/IoOuVYUU8/lZyLczPGdHdbiBtZkA898Y11AbBl/3xzv60Tkg5ygPlZNGRfBPz6XzVeuhARgwQFKpnHz0aTESUxTHxpjjADLD0DJk9Uy4WBrFfvRJeKgN6GFY4wrvVZG7/vu6HUcwbhWn/4gmGiS0KqL/okmQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCwkJVOb; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCwkJVOb"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27AEF4065E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Nov 2024 19:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ts81ttO9z302 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2024 19:59:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 599DA42B6A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 599DA42B6A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XCwkJVOb
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 599DA42B6A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Nov 2024 19:59:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so20751465e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Nov 2024 11:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731873578; x=1732478378; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EiBOHVcMoMswdgMmKr6JYU8va6d9TXoWr7RAG09NnWs=;
        b=XCwkJVOb7YABIpPXBRi9Y01Kj9neg1BWvqIB3oeVLtbayjJiIING/yTeyxEvFnSpl2
         QXSm+1/61Mo0hFJYeYZsyP7cUqJqwe+sRbKXUb6axa5jYxzb+Oks+YxY9cPG31aB0DCF
         1UKNuQrmlSb02d4GpNhY0sI1+C1QeYeak+79PXPp/pnft1ySGeD8JNzZO/S1fT1xLVsk
         0AqoaObpzblqFb1m7lP5Nc67vH5ararxFUcPrqngHmnT/LENhRBeGWxtLlK33SM+nWxK
         akZp0ng5WWTL5b+OWPJ+yHpdVJY2hAfIpfaihw69/5LpggciawBzN8O8IENRb80qhcU+
         PQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731873578; x=1732478378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EiBOHVcMoMswdgMmKr6JYU8va6d9TXoWr7RAG09NnWs=;
        b=TxlWI4CJBPqunzWqtcdyP8j71j7ivYLpoKG1P0Ol123b4i8Xycivjej+LSrljhx/yG
         3bfMJAZx7x+XY8CaRxYOxPy6cHZ+KHv7xQc2e12tXkvry3J1/wqXLgoQy5zaQdmGPzUV
         3no5LwmCL74zEopiw5OKowIYggAddD/BW+k38NVxxZyDVOsYj3XFxTsiB0i/gQj/Q8mP
         HcOTujHZ9l97B7MGNmT2IhrDHVLiX8vVrvNJTXRF6BkI3Mtl2UDLpnd86lfN+xLewK20
         4by5ejUSSv7QY+NZhGSADEvCv7fbuPv1quafIM/X+C0sQfoKOFS2ib+tQ5tKNoAZSFME
         PzAw==
X-Forwarded-Encrypted: i=1; AJvYcCUnAFjX+WA7ILsaJKbkGoemDnbzrPWOIkLv2U2QHnSfHyIVWN2G9lnWCJ1wV6D7BZEQRsiebRHt9CCL56KBdrN4vsUGpQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyRYpUaMSNDQUoOYjMohXpVqmxqBqrqvNA/U4/0MK009uqRrqIq
	KjXB1SwZet5jw0uSuzttPRAE2cGq8CygxZDISSHEPLQVyQHcsamx
X-Google-Smtp-Source: AGHT+IGHz16uBjxfr6M5/r6dZ6u+azz5dnv8gCKBG0haK/wioig8XT/U7uzRkfeb7BHm1eZVGPoQtQ==
X-Received: by 2002:a05:600c:501e:b0:431:4847:47c0 with SMTP id 5b1f17b1804b1-432df722c63mr100667095e9.7.1731873577623;
        Sun, 17 Nov 2024 11:59:37 -0800 (PST)
Received: from laptop.home (188.75.217.87.dynamic.jazztel.es. [87.217.75.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da29989asm131574375e9.42.2024.11.17.11.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 11:59:37 -0800 (PST)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	sergio.collado@gmail.com,
	Dave Hansen <dave.hansen@linuax.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Rheinsberg <david@readahead.eu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	ricardo.marliere@suse.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: [PATCH v5] Kunit to check the longest symbol length
Date: Sun, 17 Nov 2024 20:59:23 +0100
Message-Id: <20241117195923.222145-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The longest length of a symbol (KSYM_NAME_LEN) was increased to 512
in the reference [1]. This patch adds kunit test suite to check the longest
symbol length. These tests verify that the longest symbol length defined
is supported.

This test can also help other efforts for longer symbol length,
like [2].

The test suite defines two symbols, one with the longest length defined,
and other one whit the longest length defined +1. In the test suite
there are four tests, three positive and one negative.

The first and third tests, verify that functions with names of the created
symbols, can be called or not.

The second and fourth tests, verify that the symbols are created (or
not) in the kernel symbol table.

[1] https://lore.kernel.org/lkml/20220802015052.10452-6-ojeda@kernel.org/
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/

Tested-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/504
---
V1 -> V2: corrected CI tests. Added fix proposed at [3]

[3] https://lore.kernel.org/lkml/Y9ES4UKl%2F+DtvAVS@gmail.com/T/#m3ef0e12bb834d01ed1ebdcae12ef5f2add342077
---
V2 -> V3: updated base and added MODULE_DESCRIPTION() and MODULE_AUTHOR()
---
V3 -> V4: add x86 mantainers, add new reference.
---
V4 -> V5: fixed typo, added improved description

The test execution shoud result in something like:

```
[20:04:35] =============== longest-symbol (4 subtests) ================
[20:04:35] [PASSED] test_longest_symbol
[20:04:35] [PASSED] test_longest_symbol_kallsyms
[20:04:35] [PASSED] test_longest_symbol_plus1
[20:04:35] [PASSED] test_longest_symbol_plus1_kallsyms
[20:04:35] ================= [PASSED] longest-symbol ==================
[20:04:35] ============================================================
[20:04:35] Testing complete. Ran 4 tests: passed: 4
```

But also there are two warnings like:

```
Symbol snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7ne too long for kallsyms (512 >= 512).
Please increase KSYM_NAME_LEN both in kernel and kallsyms.c
```

Because the tests try to generate simbols of the same length as
KSYM_NAME_LEN. This is the expected outcome, as defined:
https://lore.kernel.org/all/20131023130753.GO29695@two.firstfloor.org/

---
 arch/x86/tools/insn_decoder_test.c |   3 +-
 lib/Kconfig.debug                  |   9 +++
 lib/Makefile                       |   2 +
 lib/longest_symbol_kunit.c         | 125 +++++++++++++++++++++++++++++
 4 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 lib/longest_symbol_kunit.c

diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
index 472540aeabc2..3bde35ea4188 100644
--- a/arch/x86/tools/insn_decoder_test.c
+++ b/arch/x86/tools/insn_decoder_test.c
@@ -10,6 +10,7 @@
 #include <assert.h>
 #include <unistd.h>
 #include <stdarg.h>
+#include <linux/kallsysms.h>
 
 #define unlikely(cond) (cond)
 
@@ -106,7 +107,7 @@ static void parse_args(int argc, char **argv)
 	}
 }
 
-#define BUFSIZE 256
+#define BUFSIZE (256 + KSYM_NAME_LEN)
 
 int main(int argc, char **argv)
 {
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 7312ae7c3cc5..1f3059176637 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2820,6 +2820,15 @@ config FORTIFY_KUNIT_TEST
 	  by the str*() and mem*() family of functions. For testing runtime
 	  traps of FORTIFY_SOURCE, see LKDTM's "FORTIFY_*" tests.
 
+config LONGEST_SYM_KUNIT_TEST
+	tristate "Test the longest symbol possible" if !KUNIT_ALL_TESTS
+	depends on KUNIT && KPROBES
+	default KUNIT_ALL_TESTS
+	help
+	  Tests the longest symbol possible
+
+	  If unsure, say N.
+
 config HW_BREAKPOINT_KUNIT_TEST
 	bool "Test hw_breakpoint constraints accounting" if !KUNIT_ALL_TESTS
 	depends on HAVE_HW_BREAKPOINT
diff --git a/lib/Makefile b/lib/Makefile
index 773adf88af41..fc878e716825 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -389,6 +389,8 @@ CFLAGS_fortify_kunit.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
 obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
 obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
+obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
+CFLAGS_longest_symbol_kunit.o += $(call cc-disable-warning, missing-prototypes)
 
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 
diff --git a/lib/longest_symbol_kunit.c b/lib/longest_symbol_kunit.c
new file mode 100644
index 000000000000..ebd26eedbf7b
--- /dev/null
+++ b/lib/longest_symbol_kunit.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the longest symbol length. Execute with:
+ *  ./tools/testing/kunit/kunit.py run longest-symbol
+ *  --arch=x86_64 --kconfig_add CONFIG_KPROBES=y --kconfig_add CONFIG_MODULES=y
+ *  --kconfig_add CONFIG_RETPOLINE=n --kconfig_add CONFIG_CFI_CLANG=n
+ *  --kconfig_add CONFIG_MITIGATION_RETPOLINE=n
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <kunit/test.h>
+#include <linux/stringify.h>
+#include <linux/kprobes.h>
+#include <linux/kallsyms.h>
+
+#define DI(name) s##name##name
+#define DDI(name) DI(n##name##name)
+#define DDDI(name) DDI(n##name##name)
+#define DDDDI(name) DDDI(n##name##name)
+#define DDDDDI(name) DDDDI(n##name##name)
+
+#define PLUS1(name) __PASTE(name, e)
+
+/*Generate a symbol whose name length is 511 */
+#define LONGEST_SYM_NAME  DDDDDI(g1h2i3j4k5l6m7n)
+
+/*Generate a symbol whose name length is 512 */
+#define LONGEST_SYM_NAME_PLUS1 PLUS1(LONGEST_SYM_NAME)
+
+#define RETURN_LONGEST_SYM 0xAAAAA
+#define RETURN_LONGEST_SYM_PLUS1 0x55555
+
+noinline int LONGEST_SYM_NAME(void);
+noinline int LONGEST_SYM_NAME(void)
+{
+	return RETURN_LONGEST_SYM;
+}
+
+noinline int LONGEST_SYM_NAME_PLUS1(void);
+noinline int LONGEST_SYM_NAME_PLUS1(void)
+{
+	return RETURN_LONGEST_SYM_PLUS1;
+}
+
+_Static_assert(sizeof(__stringify(LONGEST_SYM_NAME)) == KSYM_NAME_LEN,
+"Incorrect symbol length found. Expected KSYM_NAME_LEN: "
+__stringify(KSYM_NAME) ", but found: "
+__stringify(sizeof(LONGEST_SYM_NAME)));
+
+static void test_longest_symbol(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, RETURN_LONGEST_SYM, LONGEST_SYM_NAME());
+};
+
+static void test_longest_symbol_kallsyms(struct kunit *test)
+{
+	unsigned long (*kallsyms_lookup_name)(const char *name);
+	static int (*longest_sym)(void);
+
+	struct kprobe kp = {
+		.symbol_name = "kallsyms_lookup_name",
+	};
+
+	if (register_kprobe(&kp) < 0) {
+		pr_info("%s: kprobe not registered\n", __func__);
+		KUNIT_FAIL(test, "test_longest_symbol kallsysms: kprobe not registered\n");
+		return;
+	}
+
+	kunit_warn(test, "test_longest_symbol kallsyms: kprobe registered\n");
+	kallsyms_lookup_name = (unsigned long (*)(const char *name))kp.addr;
+	unregister_kprobe(&kp);
+
+	longest_sym =
+		(void *) kallsyms_lookup_name(__stringify(LONGEST_SYM_NAME));
+	KUNIT_EXPECT_EQ(test, RETURN_LONGEST_SYM, longest_sym());
+};
+
+static void test_longest_symbol_plus1(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, RETURN_LONGEST_SYM_PLUS1, LONGEST_SYM_NAME_PLUS1());
+};
+
+static void test_longest_symbol_plus1_kallsyms(struct kunit *test)
+{
+	unsigned long (*kallsyms_lookup_name)(const char *name);
+	static int (*longest_sym_plus1)(void);
+
+	struct kprobe kp = {
+		.symbol_name = "kallsyms_lookup_name",
+	};
+
+	if (register_kprobe(&kp) < 0) {
+		pr_info("%s: kprobe not registered\n", __func__);
+		KUNIT_FAIL(test, "test_longest_symbol kallsysms: kprobe not registered\n");
+		return;
+	}
+
+	kunit_warn(test, "test_longest_symbol_plus1 kallsyms: kprobe registered\n");
+	kallsyms_lookup_name = (unsigned long (*)(const char *name))kp.addr;
+	unregister_kprobe(&kp);
+
+	longest_sym_plus1 =
+		(void *) kallsyms_lookup_name(__stringify(LONGEST_SYM_NAME_PLUS1));
+	KUNIT_EXPECT_NULL(test, longest_sym_plus1);
+};
+
+static struct kunit_case longest_symbol_test_cases[] = {
+	KUNIT_CASE(test_longest_symbol),
+	KUNIT_CASE(test_longest_symbol_kallsyms),
+	KUNIT_CASE(test_longest_symbol_plus1),
+	KUNIT_CASE(test_longest_symbol_plus1_kallsyms),
+	{}
+};
+
+static struct kunit_suite longest_symbol_test_suite = {
+	.name = "longest-symbol",
+	.test_cases = longest_symbol_test_cases,
+};
+kunit_test_suite(longest_symbol_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Test the longest symbol length");
+MODULE_AUTHOR("Sergio González Collado");
-- 
2.39.2

