Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D175817
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 06:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723788448; cv=none; b=k/9kIMhPHcdYJY3vqVGRL9gMZkqLfsDQvsPGCwrGIuVOjdS8nEfEJn17TqdqxslWYiwUzufwUBZB7vs8/3pSYRHlEoZFPZyi27w/M1hrQogELGRgd9s3nPcMk8vOUoQS7/YQksxPi4PdM50QPhcuR1xnV5jPFOM4iTc5ZPYuzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723788448; c=relaxed/simple;
	bh=cAjVXnCzG1abAs5ZrJ9XaoHvEPTxGhMwOFZdA6aA9Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Um/MyBm7sQZm9siD0xfT7U/rVp8+vpm0ovvbKkCQsYv8g/LmEXuEhzvJTDgOTntdpWpuwyw/k33iJ3S0SMbXoMYoNA8OVqSURHCzXHGq520JySSCs+1a+Oe4OccOUEagk1SBaj9XKBDcIOP9uzgD3OhRAvHewe6wNt7lnvBaUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aVNfs1p5; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aVNfs1p5"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4FE960732
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 06:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9X0JpR6dwsiJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Aug 2024 06:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=davidgow@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D195D606D6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D195D606D6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aVNfs1p5
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D195D606D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 06:07:24 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e115ea1b919so1586247276.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 23:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723788443; x=1724393243; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qLp9HDduVUB0PyyGW2N7FpRk7BfItEcMSoV1fEg6H/U=;
        b=aVNfs1p5bmPzXedPmRCL4KhqOboszKCTPALfBgmROkNB9jcGrsOjhKDfLupiCdHPy2
         DmGWm9B3W0KsEX7ymcDfv5fUHkhofBIsbkuYEbTaiGuCoegkvWZ5q7MobzpVAESXPzgg
         /hkXMmPkd51+iEwt1bVH8wwMGiEJnCWQh02FtaZ1+dc8nQMySGUqUnf3uGKAwlMCHDq0
         zhzHSg65SnQy3wHXNh0MYHjuBLDh2p9wJyNWv1dmlKBScxlPoBsnA7iFpfKzLPb6FzsP
         5Ko7zrXG633FYBI9V8GNc1tKwA+L+lImqX2t4s3measNMnUaAvD5BXwjke8PKU3OZbFn
         JswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723788443; x=1724393243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLp9HDduVUB0PyyGW2N7FpRk7BfItEcMSoV1fEg6H/U=;
        b=AeW6TC8jk20aD3qd3cdIyuIiRA33YBSm2KL/6YnV9UlaFImmm1q1HpJg9gKrYfkLXo
         wdI87tg0jgxjJQrxv+EQEMapY00sSeV8t+SP2tAAlbHypJgGeqgKIY3Qm4U3l/hSYZKJ
         SPP/KIpTzehhhaDYjGQOTemXUn4lgw9NlK9iAuXCnwsbXSlfkcr7FTBmOtnV8LFW9Ma/
         7yMBdnnTkw2XB7rrFqpPY/Ds8DxMFefNpZfummLQrogA22Odi3zeGEYZ69oygK4Sb094
         dmlxBUfK2a8wwFggaYLkedhI2n+ert8na3eWqmxwUOnIRw8cFf+3+jmWppQ/UZp5zcFf
         Zqbg==
X-Forwarded-Encrypted: i=1; AJvYcCWidF48ERkkyv3iz33fZRwA8uCxtnGUL5G3HfiJGBG1PU8Cl86kvh3O+CQ6vUgEq1UQ9jODBqS87EfUGBBIHT0Pgxlld4PRt9+Y7GTI6UyAHShKirGV6QLrq85ZB8m3
X-Gm-Message-State: AOJu0Yz4ctdVzSyG4uVpOBaDN/Vbe2s5P+cB448omHXmJQZO5pIRyqOd
	nI/8+dwwsi1rHkukCx8ZjlDLEGu+YST4DNp58IWDLlhWW+CaMqPCS0h5LdazxinWCWpkbDjRwUU
	CCogcfidwbWOVJ4W7ssYeUfXcZPJpd2YcuGjv
X-Google-Smtp-Source: AGHT+IFAzO9qZS0HaMgWvRKeZg6Fkx5dcrxuP2721vh6ttFmoShBcRF9PN4I8fC9A6WKcz4leTdl3DU8zNoE6H/3IbA=
X-Received: by 2002:a05:6902:11cb:b0:e08:6ce9:6e8e with SMTP id
 3f1490d57ef6-e1180f6d7f9mr2456341276.23.1723788443185; Thu, 15 Aug 2024
 23:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815020711.110640-1-luis.hernandez093@gmail.com>
In-Reply-To: <20240815020711.110640-1-luis.hernandez093@gmail.com>
From: David Gow <davidgow@google.com>
Date: Fri, 16 Aug 2024 14:07:10 +0800
Message-ID: <CABVgOS=-vh5TqHFCq_jo=ffq8v_nGgr6JsPnOZag3e6+19ysxQ@mail.gmail.com>
Subject: Re: [PATCH] lib/math: Add int_pow test suite
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: brendan.higgins@linux.dev, rmoar@google.com, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000dce9e0061fc6c5c1"

--000000000000dce9e0061fc6c5c1
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Aug 2024 at 10:07, Luis Felipe Hernandez
<luis.hernandez093@gmail.com> wrote:
>
> Adds test suite for integer based power function.
>
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---

Hi Luis,

Thanks for your patch. Personally, I'm all in favour of adding it, but
there are a few issues which would need to be resolved first:

1. You'll need a Kconfig entry to enable the test -- as is, it's not
being built at all.
Somewhat confusingly, the Kconfig entries for lib/math tests are in
lib/Kconfig.debug
The following worked for me:
---
config TEST_INT_POW
       tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
       depends on KUNIT
       default KUNIT_ALL_TESTS
       help
         Enable this to test the int_pow maths function KUnit test.

         If unsure, say N
---

2. Once enabled, the test doesn't build. This is due to a typo:
'UNIT_EXPECT_EQ'.

3. Stylistically, there are a few things which are worth looking
closer at. I've left more detailed notes inline.

In general, you should make sure your tests run before sending them in, using:
./tools/testing/kunit/kunit.py run

>  lib/math/Makefile       |  1 +
>  lib/math/test_int_pow.c | 70 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 lib/math/test_int_pow.c
>
> diff --git a/lib/math/Makefile b/lib/math/Makefile
> index 91fcdb0c9efe..ba564bf4fb00 100644
> --- a/lib/math/Makefile
> +++ b/lib/math/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_PRIME_NUMBERS)     += prime_numbers.o
>  obj-$(CONFIG_RATIONAL)         += rational.o
>
>  obj-$(CONFIG_TEST_DIV64)       += test_div64.o
> +obj-$(CONFIG_TEST_INT_POW)     += test_int_pow.o

The KUnit style guide now recommends using <test>_KUNIT_TEST as a
config option, and putting the file in a tests subdirectory, and
naming it <int_pow>_kunit.c.

This is something we're obviously still cleaning up on existing tests,
but for new tests, I'd recommend CONFIG_INT_POW_TEST in Kconfig, and
moving the file to lib/tests or lib/math/tests, and name it
int_pow_kunit.c.

See https://lore.kernel.org/all/20240720181025.work.002-kees@kernel.org/
for some examples.

>  obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
> diff --git a/lib/math/test_int_pow.c b/lib/math/test_int_pow.c
> new file mode 100644
> index 000000000000..ecabe71d01cc
> --- /dev/null
> +++ b/lib/math/test_int_pow.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <kunit/test.h>
> +#include <kunit/static_stub.h>

This test doesn't use static stubs, so you shouldn't need to include
kunit/static_stub.h
> +
> +#include <linux/math.h>
> +
> +
> +static void test_pow_0(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, 1, int_pow(64, 0));
> +}
> +
> +static void test_pow_1(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, 64, int_pow(64, 1));
> +}
> +
> +static void test_base_0(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, 0, int_pow(0, 5));
> +}
> +
> +static void test_base_1(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, 1, int_pow(1, 100));
> +       KUNIT_EXPECT_EQ(test, 1, int_pow(1, 0));
> +}
> +
> +static void test_base_0_pow_0(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, 1, int_pow(0, 0));
> +}
> +
> +static void test_base_2_pow_2(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, 4, int_pow(2, 2));
> +}
> +
> +static void test_max_base(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, U64_MAX, int_pow(U64_MAX, 1));
> +}
> +
> +static void test_large_result(struct kunit *test)
> +{
> +       UNIT_EXPECT_EQ(test, 1152921504606846976, int_pow(2, 60));

This should be KUNIT_EXPECT_EQ, otherwise the test doesn't compile.

> +}



> +
> +static struct kunit_case math_int_pow_test_cases[] = {
> +       KUNIT_CASE(test_pow_0),
> +       KUNIT_CASE(test_pow_1),
> +       KUNIT_CASE(test_base_0),
> +       KUNIT_CASE(test_base_1),
> +       KUNIT_CASE(test_base_0_pow_0),
> +       KUNIT_CASE(test_base_2_pow_2),
> +       KUNIT_CASE(test_max_base),
> +       KUNIT_CASE(test_large_result),

Two notes:
- All of these tests are testing the same code, just with different
inputs. It may be easier / cleaner to use a parameterised test, as
lib/math/rational-test.c does.
- Is test_large_result the largest possible result int_pow can give?
If not, is it worth having a test case which is. Equally, I'd like to
see a nice, small real-world example with a base other than 1, and
non-power-of-two exponent. (e.g., 5^5 == 3125), as that'd be a useful
case to be able to debug.

> +       {}
> +};
> +
> +static struct kunit_suite int_pow_test_suite = {
> +       .name = "lib-math-int_pow",
> +       .test_cases = math_int_pow_test_cases,
> +};
> +
> +kunit_test_suites(&int_pow_test_suite);
> +
> +MODULE_DESCRIPTION("math.int_pow KUnit test suite");
> +MODULE_LICENSE("GPL v2");

This should just be "GPL", not "GPL v2". Running
./scripts/checkpatch.pl on the patch gives the warning:
WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#100: FILE: lib/math/test_int_pow.c:70:

+MODULE_LICENSE("GPL v2");



> --
> 2.46.0
>

Thanks very much,
-- David

--000000000000dce9e0061fc6c5c1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
JEfDtvHU6wy3MSBE3/TrMFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AGwXYwvLVjByVooZ+uKzQVW2nnClCIizd0jfARuMRTPNAWI2uOBSKoR0T6XWsGsVvX1vBF0FA+a9
DQOd8GYqzEaKOiHDIjq/o455YXkiKhPpxDSIM+7st/OZnlkRbgAyq4rAhAjbZlceKp+1vj0wIvCa
4evQZvJNnJvTb4Vcnqf4Xg2Pl57hSUAgejWvIGAxfiAKG8Zk09I9DNd84hucIS2UIgoRGGWw3eIg
GQs0EfiilyTgsH8iMOPqUJ1h4oX9z1FpaiJzfxcvcGG46SCieSFP0USs9aMl7GeERue37kBf14Pd
kOYIfx09Pcv/N6lHV6kXlzG0xeUuV3RxtLtszQgxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAFsPHWl8lqMEwx3lAnpufYwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIKaVssnf+DUbOI3mM0sh08+4Sr6imKRCz+y/vgs25q9WMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDgxNjA2MDcyM1owaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCBvjOZ
iVd6hYWhlA4QHDl1diXTW9AmMdiCQ0ERvnsRIxNu1KKpa8/yAN5a9MPcu6Dl/IqcaGjoI5qlI/qm
MVdrqNNP9ewlxbHI84Zn2OStm4tDMo8nkWSQ2EskPGi9z9dZGb4ZZ7JBL+FzL49IeSOB4vXoCYLF
brj00gKy8otXpCyq37D/xKVZclyrWg9VhU1xoxMzxRDNvkD09yGxiq3TkYk7z+goIk6nuzQpNUoF
aqJ53pFyt0lp1tw+/x1toPi+t/nv7tfsiV49MXlTuC9+TWHeF0aqZv4jWtlboSTGfMneLQ8hglFq
xo7K3qRFGTRwA92xgawqVJd+2SbDrB8L
--000000000000dce9e0061fc6c5c1--
