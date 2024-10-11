Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2845320A5FC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631869; cv=none; b=BRhtvmkmHjgsTZ2UOqcyUhzZMPeGkarEAsPl60wpIDoJruHwOd0JfFO8As72IYX0K1mbX/c26pBo6Ck1EB9lt8Y/JdeAToUWKsyJvZwjO4PimuPvDAiQ5q9/OiniGT87N7O/iaaYtaE6+tCevNUUE7n0Wb479XN2DF+j8THhZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631869; c=relaxed/simple;
	bh=4UNA/bzgNeQKZNn+GTcFYWje5KcHYL5lIgLuvQk+bVg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u4dsktAbk2UygFoplJa0Go4Pj6WXauxKVs5sgz97NoxdSWgxiHdjLLgFgpBoNTfMl8BRb62g2mnhJtLEAG//8Uhx9mWvApclpRS84HhqG2jB/sd6/EalH2vttfeFcf6Ou5OgXX7lL5cSHEREmf3VJvk3dvtTUZg7hMHZ8+b6wMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LQOtWy0B; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LQOtWy0B"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD81660857
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.601
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJV_SeXm2X8S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 07:31:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3onqizwgkaemif0nilt1lttlqj.htr@flex--davidgow.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A78036083F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A78036083F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LQOtWy0B
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A78036083F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:31:06 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28ef71f0d8so2730670276.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728631865; x=1729236665; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyJ4dk3YkG68rGowxEN01juZ4Qxhn4HXMW65oX2xFoY=;
        b=LQOtWy0BwY+26YYPlotobFvkmeQO21zJxlDOpDcmmuTB59n0oXHYwlMOo1pZpucC+M
         hgSVMsT6hDqOJVSv1QFx66pKdbDrWGdunlP9zckzuiS5IKHA5pxLZDNQoiCu1UHD4J2d
         wxcTUz0CWzg8fBCjnWKd+vcI9o5icZGSfs4oc/wv6OcVZlkULRpf1gcoqAqpxKyGDUnV
         ESmU1ex225g8wfZjKaJKn6epw2UM4M6JQEP7gwJtbzhG+KfX2tT+L0HkZ22QjefhieWL
         1XJbOPTdHzhiID1c4+l5idbHpurE2yAJWiVUkDbCsr7PcaQme76qChlLtUKIRQIKTx6i
         Z3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631865; x=1729236665;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hyJ4dk3YkG68rGowxEN01juZ4Qxhn4HXMW65oX2xFoY=;
        b=V9nYizm3D91uG3fQmZj9VDcXHmJ1b5QrmiFBDtEq5sAYUOgJbUkHWWM81R1PB4JfSV
         MpFmJBdHJouJEnhz6kIBm6cS3ESx/voWdzMvdwBKC9kBicd5FSdl+tGmVcaj26j8CIm2
         glxmk9XIZiZzOY08ic8B+8gdRTNaUPnMCssGJQCz+29N+aW2Osmz/oXovFSpwG8CcIP5
         6t1KJ/ziUKWXUqATVOTUkystdfbxrPesffI8Cl5CJ22GPDaN5yXogvoRj/h1DiXOSQPT
         AbTgU0+JamZMsi0ZoqQHEUH1hInP9bh0Vqpu+fhkrafGW436GIe9fH2MYOBb6pXBkXRo
         EquQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdBZNojnosVLZ2pImatIi1SiKg2sEiIvBrx+0GVr/TwuEl3VrAcnKEqYKz7frvOKJsZChsMFoeod5SUPV3/zy2dWFrpQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxgeijlgGG1I+DCAK84GqRjdZOLctDdzJtHFArNNN4fObNMPq0h
	f71yuEPWOmGjDVip42bzrkdqUxfzZ3TV2aXLscvN+LzI7c2Uhbyy+0mYGcpYPws0uVtW6PgiTbV
	9jckE6a7Zog==
X-Google-Smtp-Source: AGHT+IEnt/DrbeHagqIrCVFokOqS9C4siCZ3tDEnNfDLr/bUT6Lkv6eaQ6re5XPXQMlsOouyNX83PB9KAt1ZSw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:b1:7045:ac11:6237])
 (user=davidgow job=sendgmr) by 2002:a25:844c:0:b0:e27:3e6a:345 with SMTP id
 3f1490d57ef6-e2919ff8519mr1303276.10.1728631864951; Fri, 11 Oct 2024 00:31:04
 -0700 (PDT)
Date: Fri, 11 Oct 2024 15:25:06 +0800
In-Reply-To: <20241011072509.3068328-2-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241011072509.3068328-2-davidgow@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241011072509.3068328-4-davidgow@google.com>
Subject: [PATCH 2/6] lib/math: Add int_log test suite
From: David Gow <davidgow@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Brendan Higgins <brendanhiggins@google.com>, Rae Moar <rmoar@google.com>, 
	Kees Cook <kees@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
	"=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?=" <brunofrancadevsec@gmail.com>, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Bruno Sobreira Fran=C3=A7a <brunofrancadevsec@gmail.com>

This commit introduces KUnit tests for the intlog2 and intlog10
functions, which compute logarithms in base 2 and base 10, respectively.
The tests cover a range of inputs to ensure the correctness of these
functions across common and edge cases.

Signed-off-by: Bruno Sobreira Fran=C3=A7a <brunofrancadevsec@gmail.com>
Reviewed-by: David Gow <davidgow@google.com>
[Rebased on top of mm-nonmm-unstable]
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/Kconfig.debug              | 11 +++++
 lib/math/tests/Makefile        |  1 +
 lib/math/tests/int_log_kunit.c | 75 ++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 lib/math/tests/int_log_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3ed6cf950f04..6571243ac232 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3009,6 +3009,17 @@ config INT_POW_KUNIT_TEST
=20
 	  If unsure, say N
=20
+config INT_LOG_KUNIT_TEST
+        tristate "Integer log (int_log) test" if !KUNIT_ALL_TESTS
+        depends on KUNIT
+        default KUNIT_ALL_TESTS
+        help
+          This option enables the KUnit test suite for the int_log library=
, which
+          provides two functions to compute the integer logarithm in base =
2 and
+          base 10, called respectively as intlog2 and intlog10.
+
+          If unsure, say N
+
 endif # RUNTIME_TESTING_MENU
=20
 config ARCH_USE_MEMTEST
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
index f9a0a0e6b73a..89a266241e98 100644
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@ -2,5 +2,6 @@
=20
 obj-$(CONFIG_DIV64_KUNIT_TEST)    +=3D div64_kunit.o
 obj-$(CONFIG_INT_POW_KUNIT_TEST)  +=3D int_pow_kunit.o
+obj-$(CONFIG_INT_LOG_KUNIT_TEST)  +=3D int_log_kunit.o
 obj-$(CONFIG_MULDIV64_KUNIT_TEST) +=3D mul_u64_u64_div_u64_kunit.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) +=3D rational_kunit.o
diff --git a/lib/math/tests/int_log_kunit.c b/lib/math/tests/int_log_kunit.=
c
new file mode 100644
index 000000000000..d750a1df37c1
--- /dev/null
+++ b/lib/math/tests/int_log_kunit.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/int_log.h>
+
+struct test_case_params {
+	u32 value;
+	unsigned int expected_result;
+	const char *name;
+};
+
+
+/* The expected result takes into account the log error */
+static const struct test_case_params intlog2_params[] =3D {
+	{0, 0, "Log base 2 of 0"},
+	{1, 0, "Log base 2 of 1"},
+	{2, 16777216, "Log base 2 of 2"},
+	{3, 26591232, "Log base 2 of 3"},
+	{4, 33554432, "Log base 2 of 4"},
+	{8, 50331648, "Log base 2 of 8"},
+	{16, 67108864, "Log base 2 of 16"},
+	{32, 83886080, "Log base 2 of 32"},
+	{U32_MAX, 536870911, "Log base 2 of MAX"},
+};
+
+static const struct test_case_params intlog10_params[] =3D {
+	{0, 0, "Log base 10 of 0"},
+	{1, 0, "Log base 10 of 1"},
+	{6, 13055203, "Log base 10 of 6"},
+	{10, 16777225, "Log base 10 of 10"},
+	{100, 33554450, "Log base 10 of 100"},
+	{1000, 50331675, "Log base 10 of 1000"},
+	{10000, 67108862, "Log base 10 of 10000"},
+	{U32_MAX, 161614247, "Log base 10 of MAX"}
+};
+
+static void get_desc(const struct test_case_params *tc, char *desc)
+{
+	strscpy(desc, tc->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+
+KUNIT_ARRAY_PARAM(intlog2, intlog2_params, get_desc);
+
+static void intlog2_test(struct kunit *test)
+{
+	const struct test_case_params *tc =3D (const struct test_case_params *)te=
st->param_value;
+
+	KUNIT_EXPECT_EQ(test, tc->expected_result, intlog2(tc->value));
+}
+
+KUNIT_ARRAY_PARAM(intlog10, intlog10_params, get_desc);
+
+static void intlog10_test(struct kunit *test)
+{
+	const struct test_case_params *tc =3D (const struct test_case_params *)te=
st->param_value;
+
+	KUNIT_EXPECT_EQ(test, tc->expected_result, intlog10(tc->value));
+}
+
+static struct kunit_case math_int_log_test_cases[] =3D {
+	KUNIT_CASE_PARAM(intlog2_test, intlog2_gen_params),
+	KUNIT_CASE_PARAM(intlog10_test, intlog10_gen_params),
+	{}
+};
+
+static struct kunit_suite int_log_test_suite =3D {
+	.name =3D "math-int_log",
+	.test_cases =3D  math_int_log_test_cases,
+};
+
+kunit_test_suites(&int_log_test_suite);
+
+MODULE_DESCRIPTION("math.int_log KUnit test suite");
+MODULE_LICENSE("GPL");
+
--=20
2.47.0.rc1.288.g06298d1525-goog

