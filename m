Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFD216D9DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722895020; cv=none; b=pzV+qH0znGvosi4eebwdg6oiQw7YwkhZ3Gqv43aTdZyQkrh3739ELvYqnYrSqrtWx7VfFJ8czJq4P0MTp9ghIapfl7UBN9ohx9pdWdQz+eFpb0vkcCjVXmaaBPfC3Bgk1LRzhopdS429R/2RhY+HujiWm+m/hcwuWhW9vMyc0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722895020; c=relaxed/simple;
	bh=ZgDcPUTpCF4Mm5Z/yZQGDB6kwws0YMUdErBwO2XQ4o8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WXjiS9ylifqu37zh5KaBsUqvkTk2RNzGb62eou2AewBpvvGAiJ3/05ZDTG3h+pdn/TzBMtK7WyHAe0I0bhYeYLR4aWkEXPhcjkV/2rv6ytmhwiUAr+rDiLucvV4gMTacCLsK5OcbDUebNOnZM0/NA3lDCbcisPIlcKrH7WzKWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK77G7QS; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK77G7QS"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C2B80F8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 21:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MId3VfftqidT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Aug 2024 21:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A912780F8B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A912780F8B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FK77G7QS
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A912780F8B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 21:56:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so537995e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 05 Aug 2024 14:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722895015; x=1723499815; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28/uDi1EiKJll8jhWDtTNE12TCXwHFNwlesnqMVZB28=;
        b=FK77G7QSKvXYS8EM8pXhGHaRhK4xOa9F2hTJeYABpjpAWqfLc3SFdAcPleXgKf35ov
         y41CmbH5oH2GuMeBR5KmHAEihYZ1434mOE60sLinM47xTrgwcqrQD9gjXjuUAM4Kx4ns
         tS6DkG7Bng9p9SAq7HYYx0knxa5ZJSL9O2uYe2Apd50S7YnS0TsBdxIHRoIfATnk3Lq+
         p7G5XbB8SggYT5890AHghpN6Cj39OFwKRklzFFWPrILS3X4RSp3rGn+9nd4TWTOTe0Cb
         0ZEPOi1KgDUswgCwP/FSywpJ2Dk1X2SVSUEM6ETIwSckU976ikKXOVqdkjptXhBW6B5W
         MSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722895015; x=1723499815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28/uDi1EiKJll8jhWDtTNE12TCXwHFNwlesnqMVZB28=;
        b=EA1d5z8nAG8w/zjrGYzRKbo3IJ6K7N9GuCUfHx+9mNVRSllFJdl7pvBakX+zaa/CxY
         eYOQiT5M5zRiYNRbm6vZ0uifdIi4VGaE+CCSWPH2MxWg4TSuqTAlkAu9NWksJdj0LZzx
         2ACJkqWgZtklpdbJPuSBH6izk17qx8gVp7wJKFykXVbz4pAiIxQqa1hf211bKlpA20JQ
         BSj9v3XMZufG61eEeGw5kfw2Q85Hejk2a5e3PequtRq/vA2aIOY90BA3+iwTZYDYiLWl
         fzXsd/JTXde2IIZiEQtU2LePmAM8AdSpVvxoBv8dG/kZWsHjCL17CxmMVCvP9ctY2W7T
         eKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUojsl8Vg74vV86kKpT3TmyAXEvN7+ngRWSNjXTrmb/U2xblXUgZ/by0NqevUL2uZXDEAoPajBIq42kHPjYi/Hu92DHt+mXmat7cilZvh9GcgMb+NVD7oB2N6VEPZp8
X-Gm-Message-State: AOJu0YzixYafjsTeUMpi4S1KsPoH7srgg/8FPcjGkQ/wDmWAxexOOb14
	TzIwUwRdeATNKLJ4XUmrWd5FEdpKQmB56c9WwwMISi42P879wCtu
X-Google-Smtp-Source: AGHT+IEUPcGHYYsoUSKcErZm6gE08kk6KDrurtp/QGjGvauxalr2L6o0kQ5GMjJyBLFnQKsWU77Ytg==
X-Received: by 2002:a05:600c:4e16:b0:426:5b51:109d with SMTP id 5b1f17b1804b1-428e6b83835mr81794195e9.36.1722895015250;
        Mon, 05 Aug 2024 14:56:55 -0700 (PDT)
Received: from laptop.. (220.red-83-52-58.dynamicip.rima-tde.net. [83.52.58.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428fe2d4adcsm2688085e9.1.2024.08.05.14.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 14:56:54 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	sergio.collado@gmail.com
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
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: [PATCH v3] Kunit to check the longest symbol length
Date: Mon,  5 Aug 2024 23:56:22 +0200
Message-Id: <20240805215622.102133-1-sergio.collado@gmail.com>
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
in the reference [1]. This patch adds a kunit test to check the longest
symbol length.

[1] https://lore.kernel.org/lkml/20220802015052.10452-6-ojeda@kernel.org/

Tested-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
---
V1 -> V2: corrected CI tests. Added fix proposed at [2]

[2] https://lore.kernel.org/lkml/Y9ES4UKl%2F+DtvAVS@gmail.com/T/#m3ef0e12bb834d01ed1ebdcae12ef5f2add342077
---
V2 -> V3: updated base and added MODULE_DESCRIPTION() and MODULE_AUTHOR()
---
 arch/x86/tools/insn_decoder_test.c |   3 +-
 lib/Kconfig.debug                  |   9 +++
 lib/Makefile                       |   2 +
 lib/longest_symbol_kunit.c         | 124 +++++++++++++++++++++++++++++
 4 files changed, 137 insertions(+), 1 deletion(-)
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
index a30c03a66172..4587466f7d07 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2783,6 +2783,15 @@ config FORTIFY_KUNIT_TEST
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
index 322bb127b4dc..4241807025b8 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -388,6 +388,8 @@ CFLAGS_fortify_kunit.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
 obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
 obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
+obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
+CFLAGS_longest_symbol_kunit.o += $(call cc-disable-warning, missing-prototypes)
 
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 
diff --git a/lib/longest_symbol_kunit.c b/lib/longest_symbol_kunit.c
new file mode 100644
index 000000000000..557ad6eae56c
--- /dev/null
+++ b/lib/longest_symbol_kunit.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the longest symbol length. Execute with:
+ *  ./tools/testing/kunit/kunit.py run longest-symbol
+ *  --arch=x86_64 --kconfig_add CONFIG_KPROBES=y --kconfig_add CONFIG_MODULES=y
+ *  --kconfig_add CONFIG_RETPOLINE=n
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

base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
-- 
2.39.2

