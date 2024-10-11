Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8030209690
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631344; cv=none; b=LekuUeX3kmAqqOUrw5nMPpox4NRkBUspzK1e6h5eBiUQZUuHpA4SOnzYLBF75T7zcLX+x0sTtLbrUApQjBkLkeppbhhkS2U1M8rbDIWXD0C5NfXMctg2/c2MeOdNXv+xvnEnHFU4/tvO2UtZ2RMK/gRKzjHLfSFWYIFpXPri1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631344; c=relaxed/simple;
	bh=HElWpvfK/zLLJoDSK+Xb532KfvxZQ7n5+unYB9WQAXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/NWehTfiyMxKJm8+tjfBpUxmf452Z32AYoBUHLVvQxyxYmoK3TlnEoiO9jAtkGxZtafcuNRAirTzzAu9qviSgcL5RGj6uhS2OLAUzDRnZhTLD6nxVBP2/kojmelHlBXo5puspnKd3vgcgzZrRQzaV22eP2rqBA1AnS6aisIfKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UfZcFLPV; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UfZcFLPV"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CDA381FFC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gq7o51Lf0VOY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 07:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=davidgow@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CB2981FF2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB2981FF2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UfZcFLPV
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1CB2981FF2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:22:20 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6cb3d2ce75eso25350696d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 00:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728631340; x=1729236140; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FlSPkdXemg7W1vZg4C0LLfFYmgyR2A86kYuPJQkmSHQ=;
        b=UfZcFLPVprhDsogzyG+N1/2/d/hsmOK97uRqci9euyqq32tXRm6+6aHFgp0Si/gEVd
         8V0bpD+7lvE/yVO6oLsSKCq7d2e768N/N5ge9VNUvFy2Qm3zFt2dSVuXwrwUsk+sx9lU
         p7ac52Bu4RWq/HqFDcHwyeAZ8z+PSyk+NlHJ40SqMLZ/b2UuBMOgVTxkHwWWyVeJDnrD
         /NlOSaEOB1pxejOR6+BkLTNpWxHpdua/YQBP2oR+00W7P4QyIvEXMEme4JXuxDwVmI3y
         g0e0/l2WLhw3TSBaf2UHW0hszOXh+djpoeOSabzlKDtNnZVj0r//7Mm/wvKyjkpMG1U+
         EYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631340; x=1729236140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlSPkdXemg7W1vZg4C0LLfFYmgyR2A86kYuPJQkmSHQ=;
        b=o5IPVfFNhP8yAzQveCdYWIiIZSXzLFrcwk1myXT0unO1PuCNuREXuSw5CH2aggQpRJ
         N8mh2+fD1gZ9HZOsky6iVXmHHm5EWZIs77JGxZeSJGaVm7+2Cv4x/uZ+CsAEiPvcD2Ms
         94lj/EHOJWSBZ6LSUmCL+vg2NHxXJGwD7aieEnaZvs1sAC5VjQiJc1Q+7IoHIBrWPu8m
         BbTPZapJ0ldhCDfmXWh1HPRnwOlB1A9IUHdAjAQhxXJk8y/637hkRPy2ri99uRETxmC/
         qMbM4eCRUB42h8zavJvsYVRlg2MxIkjBWtB97UoaCrKM8TMhkI3rryHZB4mJMKssfEHm
         M/Hg==
X-Forwarded-Encrypted: i=1; AJvYcCV9ZAFpI09EmgNlswGx36TidKPksPeQcxWemg8Do0+qAtAhBPh9MWYlxCCvq/8byaUq+rjZXcZNVMb05R/XYxG6f1RB3Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxgRflKPaf72zzoiOY0S8PGISoWcXpwsxOW+pF7T/OFx4NPghCs
	CyDPDG/o4yo57SD9BAhkfGbo4asxKtiBr7GHPdKMObrRvFhAdX44yjPb834o6qrND2tkuHkFNY5
	lURkRi1cNcWd+F4syK6uJhx5PSX2pQDq+4sms
X-Google-Smtp-Source: AGHT+IEoPkWHUdUL14AAY6rQqGn6+kQLjik/juhEUBaoESFlHM4a9yJ7CA1CbwDu58rHs+R35b+6tGObvP1GjaLmnxE=
X-Received: by 2002:a05:6214:5690:b0:6cb:c6c1:a2b0 with SMTP id
 6a1803df08f44-6cbefb161a0mr27456656d6.16.1728631339326; Fri, 11 Oct 2024
 00:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241004184713.25262-1-brunofrancadevsec@gmail.com>
In-Reply-To: <20241004184713.25262-1-brunofrancadevsec@gmail.com>
From: David Gow <davidgow@google.com>
Date: Fri, 11 Oct 2024 15:22:06 +0800
Message-ID: <CABVgOSnGjgKetdpQKEmpUbMLE-peTqmn6y=V_ARsZ9tG_o7wSw@mail.gmail.com>
Subject: Re: [PATCH v4] lib/math: Add int_log test suite
To: =?UTF-8?Q?Bruno_Sobreira_Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, rmoar@google.com, 
	kunit-dev@googlegroups.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f81c5006242e5843"

--000000000000f81c5006242e5843
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 5 Oct 2024 at 02:47, Bruno Sobreira Fran=C3=A7a
<brunofrancadevsec@gmail.com> wrote:
>
> This commit introduces KUnit tests for the intlog2 and intlog10
> functions, which compute logarithms in base 2 and base 10, respectively.
> The tests cover a range of inputs to ensure the correctness of these
> functions across common and edge cases.
>
> Signed-off-by: Bruno Sobreira Fran=C3=A7a <brunofrancadevsec@gmail.com>
> ---
> Changes in v4:
>   - Rebase on top of linux-kselftest kunit branch
>   - Fix spelling mistake in a literal string
> Changes in v3:
>   - Fix checkpatch issues reintroduced in v2
> Changes in v2:
>   - Fix the overflow warning reported by the kernel test robot
> ---

Thanks: this still looks good to me.

I'm rebasing it and sending it (along with a bunch of other changes)
for inclusion in the mm-nonmm-unstable branch, which will take lib/
tests to avoid merge conflicts with all the moves/renames.

Thanks,
-- David

>  lib/Kconfig.debug              | 11 +++++
>  lib/math/tests/Makefile        |  1 +
>  lib/math/tests/int_log_kunit.c | 75 ++++++++++++++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 lib/math/tests/int_log_kunit.c
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 0d6c979f0..1d7dc494c 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3104,3 +3104,14 @@ config INT_POW_KUNIT_TEST
>           function.
>
>           If unsure, say N
> +
> +config INT_LOG_KUNIT_TEST
> +        tristate "Integer log (int_log) test" if !KUNIT_ALL_TESTS
> +        depends on KUNIT
> +        default KUNIT_ALL_TESTS
> +        help
> +          This option enables the KUnit test suite for the int_log libra=
ry, which
> +          provides two functions to compute the integer logarithm in bas=
e 2 and
> +          base 10, called respectively as intlog2 and intlog10.
> +
> +          If unsure, say N
> diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
> index f9a0a0e6b..89a266241 100644
> --- a/lib/math/tests/Makefile
> +++ b/lib/math/tests/Makefile
> @@ -2,5 +2,6 @@
>
>  obj-$(CONFIG_DIV64_KUNIT_TEST)    +=3D div64_kunit.o
>  obj-$(CONFIG_INT_POW_KUNIT_TEST)  +=3D int_pow_kunit.o
> +obj-$(CONFIG_INT_LOG_KUNIT_TEST)  +=3D int_log_kunit.o
>  obj-$(CONFIG_MULDIV64_KUNIT_TEST) +=3D mul_u64_u64_div_u64_kunit.o
>  obj-$(CONFIG_RATIONAL_KUNIT_TEST) +=3D rational_kunit.o
> diff --git a/lib/math/tests/int_log_kunit.c b/lib/math/tests/int_log_kuni=
t.c
> new file mode 100644
> index 000000000..40b5a6813
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
> +       {1, 0, "Log base 10 of 1"},
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

--000000000000f81c5006242e5843
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
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
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
eDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQghY9kHdqwQO2ajJ7y18EPitIH+rir
OsfuoTyqxl8UpKswGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQx
MDExMDcyMjIwWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBACiHOyweqkDD/CuZjg+WTOGyMNLqkS0xIuVfxb8PEgLriJ5t
rTBhIJ0AUg6fMLckksDNckPVC+XErmH6Nl39B6gxXR8Ssm9uTUZZ4Mr/e0ardGGYquoOMysVIEOt
+0BFkVfDRmcpNUAtRA5zLxDKbujRJj9tvR1BQkQl1kmnjYvsa+FeZ4fTPnG7hT5t1JuKCRMadK4a
g3YPoslmKv/LFyiGJ74/bzZiO3O5JuB031LOu9DEPPGfkE3u2XmebPHkAIvO/ctxazYy4qRSmVKE
aVNYgrF/+nRZ+Wrkoh6vTbShxOtmLT1BcWKoxfjo5kBHJ7ybgDHg8uQ8ZZ9Xr2DGwvk=
--000000000000f81c5006242e5843--
