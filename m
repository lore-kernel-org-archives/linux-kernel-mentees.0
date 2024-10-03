Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4A53373
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727938853; cv=none; b=it2yUAiKbDeSUpLSl3QF4HTGemoMny2tPEyqbvSl1j0/QII7B0ylKSPMfqf+37TFp7El612LVDou4du8Yt9RotoqXFngGS/mHk2e3ukCD27Z4QifSgQb9olr8mbFlJ/1fHniuC5/GlTipQtZM7bCheF2e8dm9Eq2uzoXAiB9Q1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727938853; c=relaxed/simple;
	bh=Il0BaJlYQJrOJou0P80sTtiiyvrqUYht95X4yXg9l3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQT/R5W7ojKRpqFf1WtclqOSshXDoELuw3OUpTZqAOobjFsiuH+2DxQpPIVidanSpyrRUkSgdqJy/CAgPL9KbbBOjpxuYLaQ1Btf+kqvkggzisebAE4Vuq6e2W7of2BesQH7PFw09atdsjtLyVUBpksC/b7UnNaW0qyVbs5Wz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ro7AA1Sv; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ro7AA1Sv"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C1E9820B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 07:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nm9pGQISUyCU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Oct 2024 07:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=davidgow@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CE14820B1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CE14820B1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ro7AA1Sv
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5CE14820B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 07:00:50 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6cb259e2eafso5907176d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Oct 2024 00:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727938849; x=1728543649; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WjAVkqc9RXKv/JytEt7EeKWb9QU2D0PuhIYHqzZTXzQ=;
        b=Ro7AA1SvobFtGFas1K5o4sd78Yb7WapMzEtEpM4oDDo7YKPw6/K61XyyTb+9/J1Os3
         9l3QnUyJIW3qV4mSe3ovi07RTbKmBqxs/evHZpCVm4YoRtAjU9/pDdQKOj0kJfSEHUEu
         u7TtUWKBAqrwXmD4nN7opcEwwJgdqo3j2lCreucCvt7AQUbp0Yd2Myj8vu9OyXSjGgJ6
         oni+31XHNVrGWo70l0aP8V7ajvgvw/9ju6Za+XyFy8Gnbh/vwfwhLOsnpHMf81pAZxgD
         dwxxMhPewwASAWx71Ii1c1HhbtK1gYjTscxtAut7NNldMI7PVzluNBvw9RdC39VGYoLU
         6vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938849; x=1728543649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjAVkqc9RXKv/JytEt7EeKWb9QU2D0PuhIYHqzZTXzQ=;
        b=wu/FKxYTySzZqG81gtRXsQf4f7acuX3ysxoHOIkVty8Huvof6jXfi6QZ/bnUaL1Z7q
         N8VPztv+D50cm1Kqu3UvmqXYLUC7VbSjnmDowjbwj9S9EiE4i3s7Z0PuT/Kk0gakiXlS
         0ZH4tzvX1piY9AlHkvz/y2irxXgkHYthhV2+5W2E5rkR5glMap+gHni6MXCOfe0lTKSd
         fIeIUJi7aRmfN4v5ufImwkfa1FhCZBRQktAgN7UR8YC6Y/jcOOHou1bgCTOx5pSYFE7C
         tRk+e67bvwa6bsncwe2OzKjDU3K5I9cXseat9r8cQoNRfx5N8FjOZX9xAaWPtV1VoREJ
         X4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUN6ZwKtPsaHw7FBCnxEh66aG+a0Ns0a4dIC9JgpInVZJ2Uxt1lATQUHcMgnTGISAnROi/0BmFSCXD0GsnRm5z/VwTJBQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxyRAyxJpQrYJitPOfia6Flvz7YYICi56d5wK7dcfzP61lW8go9
	THUFOVbAeXOZC1HWgcE/Tb15Dn/rCQbiUE3FlThXhTQsNVZCBn8rRKC7cU6337WitT34uR9ULZq
	sAGbeK/0FLs+hOq0j0Jq//2/7bRLQb91h/l7+
X-Google-Smtp-Source: AGHT+IE8djiN0gS9brQZHWX3RPFyA5anqZoEt5DceQgL6a1kG9cuP6+lgS4Z0rZWhWpLFoms8FVnWdMKISEMVxNPKa4=
X-Received: by 2002:a05:6214:1c47:b0:6b5:1d2f:1d3 with SMTP id
 6a1803df08f44-6cb8fdbc4eemr34903426d6.0.1727938848749; Thu, 03 Oct 2024
 00:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925025606.1714-1-brunofrancadevsec@gmail.com>
In-Reply-To: <20240925025606.1714-1-brunofrancadevsec@gmail.com>
From: David Gow <davidgow@google.com>
Date: Thu, 3 Oct 2024 15:00:37 +0800
Message-ID: <CABVgOSmEHtSHHsreVq38AzD+PnacgY6h-+Cv1u4n4U-1yjqwUw@mail.gmail.com>
Subject: Re: [PATCH v3] lib/math: Add int_log test suite
To: =?UTF-8?Q?Bruno_Sobreira_Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, rmoar@google.com, 
	kunit-dev@googlegroups.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004ecbc106238d1d46"

--0000000000004ecbc106238d1d46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Sept 2024 at 10:56, Bruno Sobreira Fran=C3=A7a
<brunofrancadevsec@gmail.com> wrote:
>
> This commit introduces KUnit tests for the intlog2 and intlog10
> functions, which compute logarithms in base 2 and base 10, respectively.
> The tests cover a range of inputs to ensure the correctness of these
> functions across common and edge cases.
>
> Signed-off-by: Bruno Sobreira Fran=C3=A7a <brunofrancadevsec@gmail.com>
> ---

Thanks, this looks good to me.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

> Changes in v3:
>   - Fix checkpatch issues reintroduced in v2
> Changes in v2:
>   - Fix the overflow warning reported by the kernel test robot
> ---
>  lib/Kconfig.debug              | 11 +++++
>  lib/math/Makefile              |  3 +-
>  lib/math/tests/Makefile        |  1 +
>  lib/math/tests/int_log_kunit.c | 75 ++++++++++++++++++++++++++++++++++
>  4 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 lib/math/tests/int_log_kunit.c
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index bc8faa4509e1..b0f658b0f29f 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3089,3 +3089,14 @@ config INT_POW_TEST
>           function.
>
>           If unsure, say N
> +
> +config INT_LOG_TEST
> +       tristate "Integer log (int_log) test" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS
> +       help
> +         This option enables the KUnit test suite for the int_log librar=
y, which
> +         provides two functions to compute the integer logarithm in base=
 2 and
> +         base 10, called respectively as intlog2 and intlog10.
> +
> +         If unsure, say N
> diff --git a/lib/math/Makefile b/lib/math/Makefile
> index 3ef11305f8d2..c3fd967bc49b 100644
> --- a/lib/math/Makefile
> +++ b/lib/math/Makefile
> @@ -5,7 +5,8 @@ obj-$(CONFIG_CORDIC)            +=3D cordic.o
>  obj-$(CONFIG_PRIME_NUMBERS)    +=3D prime_numbers.o
>  obj-$(CONFIG_RATIONAL)         +=3D rational.o
>
> -obj-$(CONFIG_INT_POW_TEST)  +=3D tests/int_pow_kunit.o
> +obj-$(CONFIG_INT_POW_TEST)     +=3D tests/int_pow_kunit.o
> +obj-$(CONFIG_INT_LOG_TEST)     +=3D tests/int_log_kunit.o
>  obj-$(CONFIG_TEST_DIV64)       +=3D test_div64.o
>  obj-$(CONFIG_TEST_MULDIV64)    +=3D test_mul_u64_u64_div_u64.o
>  obj-$(CONFIG_RATIONAL_KUNIT_TEST) +=3D rational-test.o
> diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
> index 6a169123320a..83bbf1e47940 100644
> --- a/lib/math/tests/Makefile
> +++ b/lib/math/tests/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  obj-$(CONFIG_INT_POW_TEST) +=3D int_pow_kunit.o
> +obj-$(CONFIG_INT_LOG_TEST) +=3D int_log_kunit.o
> diff --git a/lib/math/tests/int_log_kunit.c b/lib/math/tests/int_log_kuni=
t.c
> new file mode 100644
> index 000000000000..025748cd0bbe
> --- /dev/null
> +++ b/lib/math/tests/int_log_kunit.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <kunit/test.h>
> +#include <linux/int_log.h>
> +
> +struct test_case_params {
> +       u32 value;
> +       unsigned int expected_result;
> +       const char *name;
> +};
> +
> +
> +/* The expected result takes into account the log error */
> +static const struct test_case_params intlog2_params[] =3D {
> +       {0, 0, "Log base 2 of 0"},
> +       {1, 0, "Log base 2 of 1"},
> +       {2, 16777216, "Log base 2 of 2"},
> +       {3, 26591232, "Log base 2 of 3"},
> +       {4, 33554432, "Log base 2 of 4"},
> +       {8, 50331648, "Log base 2 of 8"},
> +       {16, 67108864, "Log base 2 of 16"},
> +       {32, 83886080, "Log base 2 of 32"},
> +       {U32_MAX, 536870911, "Log base 2 of MAX"},
> +};
> +
> +static const struct test_case_params intlog10_params[] =3D {
> +       {0, 0, "Log base 10 of 0"},
> +       {1, 0, "Log bsae 10 of 1"},
> +       {6, 13055203, "Log base 10 of 6"},
> +       {10, 16777225, "Log base 10 of 10"},
> +       {100, 33554450, "Log base 10 of 100"},
> +       {1000, 50331675, "Log base 10 of 1000"},
> +       {10000, 67108862, "Log base 10 of 10000"},
> +       {U32_MAX, 161614247, "Log base 10 of MAX"}
> +};
> +
> +static void get_desc(const struct test_case_params *tc, char *desc)
> +{
> +       strscpy(desc, tc->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +
> +KUNIT_ARRAY_PARAM(intlog2, intlog2_params, get_desc);
> +
> +static void intlog2_test(struct kunit *test)
> +{
> +       const struct test_case_params *tc =3D (const struct test_case_par=
ams *)test->param_value;
> +
> +       KUNIT_EXPECT_EQ(test, tc->expected_result, intlog2(tc->value));
> +}
> +
> +KUNIT_ARRAY_PARAM(intlog10, intlog10_params, get_desc);
> +
> +static void intlog10_test(struct kunit *test)
> +{
> +       const struct test_case_params *tc =3D (const struct test_case_par=
ams *)test->param_value;
> +
> +       KUNIT_EXPECT_EQ(test, tc->expected_result, intlog10(tc->value));
> +}
> +
> +static struct kunit_case math_int_log_test_cases[] =3D {
> +       KUNIT_CASE_PARAM(intlog2_test, intlog2_gen_params),
> +       KUNIT_CASE_PARAM(intlog10_test, intlog10_gen_params),
> +       {}
> +};
> +
> +static struct kunit_suite int_log_test_suite =3D {
> +       .name =3D "math-int_log",
> +       .test_cases =3D  math_int_log_test_cases,
> +};
> +
> +kunit_test_suites(&int_log_test_suite);
> +
> +MODULE_DESCRIPTION("math.int_log KUnit test suite");
> +MODULE_LICENSE("GPL");
> +
> --
> 2.43.0
>

--0000000000004ecbc106238d1d46
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUqgYJKoZIhvcNAQcCoIIUmzCCFJcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
NjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xNDEyMTAwMDAw
MDBaFw0zNDEyMTAwMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMw
EQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIICIjANBgkqhkiG9w0BAQEF
AAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRFCyyCtEjG61s8roO4QZIzFKRvf+kqzMaw
iGvFtonRxrL/FM5RFCHsSt0bWsbWh+5NOhUG7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5
KE1SGooagLcZgQ5+xIq8ZEwhHENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ
3+QPefXqoh8q0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBhd8hY
dLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw77YcE1eTtt6y+OKF
t3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5aC0fzBjZJdzC8cTflpuwhCHX85mEW
P3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL6f7uj+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoR
h3CBCqiadR2eOoYFAJ7bgNYl+dwFnidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sI
ScWVZBpjDnk99bOMylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HU
Gie/Nx4yB9gUYzwoTK8CAwEAAaNjMGEwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFK5sBaOTE+Ki5+LXHNbH8H/IZ1OgMB8GA1UdIwQYMBaAFK5sBaOTE+Ki5+LXHNbH
8H/IZ1OgMA0GCSqGSIb3DQEBDAUAA4ICAQCDJe3o0f2VUs2ewASgkWnmXNCE3tytok/oR3jWZZip
W6g8h3wCitFutxZz5l/AVJjVdL7BzeIRka0jGD3d4XJElrSVXsB7jpl4FkMTVlezorM7tXfcQHKs
o+ubNT6xCCGh58RDN3kyvrXnnCxMvEMpmY4w06wh4OMd+tgHM3ZUACIquU0gLnBo2uVT/INc053y
/0QMRGby0uO9RgAabQK6JV2NoTFR3VRGHE3bmZbvGhwEXKYV73jgef5d2z6qTFX9mhWpb+Gm+99w
MOnD7kJG7cKTBYn6fWN7P9BxgXwA6JiuDng0wyX7rwqfIGvdOxOPEoziQRpIenOgd2nHtlx/gsge
/lgbKCuobK1ebcAF0nu364D+JTf+AptorEJdw+71zNzwUHXSNmmc5nsE324GabbeCglIWYfrexRg
emSqaUPvkcdM7BjdbO9TLYyZ4V7ycj7PVMi9Z+ykD0xF/9O5MCMHTI8Qv4aW2ZlatJlXHKTMuxWJ
U7osBQ/kxJ4ZsRg01Uyduu33H68klQR4qAO77oHl2l98i0qhkHQlp7M+S8gsVr3HyO844lyS8Hn3
nIS6dC1hASB+ftHyTwdZX4stQ1LrRgyU4fVmR3l31VRbH60kN8tFWk6gREjI2LCZxRWECfbWSUnA
ZbjmGnFuoKjxguhFPmzWAtcKZ4MFWsmkEDCCBeQwggPMoAMCAQICEAGelarM5qf94BhVtLAhbngw
DQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMzAeFw0yNDA4MTYxNzE0
MzRaFw0yNTAyMTIxNzE0MzRaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5jb20w
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDmB/GGXDiVzbKWbgA5SjyZ6CD50vgxMo0F
hAx19m1M+rPwWXHnBeQM46pDxVnXoW2wXs1ZeN/FNzGVa5kaKl3TE42JJtKqv5Cg4LoHUUan/7OY
TZmFbxtRO6T4OQwJDN7aFiRRbv0DYFMvGBuWtGMBZTn5RQb+Wu8WtqJZUTIFCk0GwEQ5R8N6oI2v
2AEf3JWNnWr6OcgiivOGbbRdTL7WOS+i6k/I2PDdni1BRgUg6yCqmaSsh8D/RIwkoZU5T06sYGbs
dh/mueJA9CCHfBc/oGVa+fQ6ngNdkrs3uTXvtiMBA0Fmfc64kIy0hOEOOMY6CBOLbpSyxIMAXdet
erg7AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFKFQnbTpSq0q
cOYnlrbegXJIIvA6MFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBR
nRJBmUP+IpudtmSQ/R55Sv0qv8TO9zHTlIdsIf2Gc/zeCi0SamUQkFWb01d7Q+20kcpxNzwV6M7y
hDRk5uuVFvtVxOrmbhflCo0uBpD9vz/symtfJYZLNyvSDi1PIVrwGNpyRrD0W6VQJxzzsBTwsO+S
XWN3+x70+QDf7+zovW7KF0/y8QYD6PIN7Y9LRUXct0HKhatkHmO3w6MSJatnqSvsjffIwpNecUMo
h10c6Etz17b7tbGdxdxLw8njN+UnfoFp3v4irrafB6jkArRfsR5TscZUUKej0ihl7mXEKUBmClkP
ndcbXHFxS6WTkpjvl7Jjja8DdWJSJmdEWUnFjnQnDrqLqvYjeVMS/8IBF57eyT6yEPrMzA+Zd+f5
hnM7HuBSGvVHv+c/rlHVp0S364DBGXj11obl7nKgL9D59QwC5/kNJ1whoKwsATUSepanzALdOTn3
BavXUVE38e4c90il44T1bphqtLfmHZ1T5ZwxjtjzNMKy0Mb9j/jcFxfibCISYbnk661FBe38bhYj
0DhqINx2fw0bwhpfFGADOZDe5DVhI7AIW/kEMHuIgAJ/HPgyn1+tldOPWiFLQbTNNBnfGv9sDPz0
hWV2vSAXq35i+JS06BCkbGfE5ci6zFy4pt8fmqMGKFH/t3ELCTYo116lqUTDcVC8DAWN8E55aDGC
AmowggJmAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAZ6Vqszmp/3gGFW0sCFu
eDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQg1Gdjo1CymNImMlj70LH7WLjRd5/G
cp2E47kZam4AZW8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQx
MDAzMDcwMDQ5WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAKOxBBx+chimEC6hyf59Og5aRz7T5Rm5EGqi2fTa2DCmX05Q
Jnhlb+j9ogzObcpD8zEcuxZsWyNcUQUg7DaNzONpImt99GNfVXHAt8RYt+x83JMwaFLDM5RSEMHw
9vX5bTUDF6HCg5zRMQ+MhTkRuIxNCM1LaVzuKrF9QgUmKoGxVpjPCox2kILC+BgoQJcy6G7YT8ne
ojPJIAW40u6blnMl9yO+JrT7WIUlQPFpNe7dUTQb2RM9d8bhqP8Pj3wNFG2jexlKV9z6K5mlrz+s
zNvkNP/qtlkcz8DWUIKcQVlvg6Ryey41DU8pp84cP3fwtOFNn5mMx4Ple5ihp4txmo4=
--0000000000004ecbc106238d1d46--
