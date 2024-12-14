Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D318E35D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Dec 2024 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734177932; cv=none; b=D2rlVHBif1/lfizqXcDgNMoOqO2NG2gJM57W3CduNBHoPoDodavP6CKSJ79jVhdF8F9+/2dYkU8Uy81ql4lekIU5DKM74xdU7hZ1JXDl8xcF8SkejRTra/DlRvRaok2wp/4VBJCaI3pJRLPbB86SP9HNvrHc0w94la1cI/3W8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734177932; c=relaxed/simple;
	bh=uX6YhkiCmepIGaM3RedGBgiedu7trgobYfPE4mkRYbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgMGxprV/q8ZdsUXLEy2jh0uDeAAwbZOcTehJdsk+lauNehWqb9PUSkZin1ezjSiZIfiWU880aWeFEdAFflV8dsOjG7szRbMFexI1q9zFE9E8upMd1BdqMeca0iTdLHgm7Gi0+NIoqR8ZSRZpI7VI3lLmzgkqYibn/x6AtbP7ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZWp6Rs+; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZWp6Rs+"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EFEE40229
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Dec 2024 12:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHCNGZKF2FpZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Dec 2024 12:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=visitorckw@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BEDD400F9
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BEDD400F9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QZWp6Rs+
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2BEDD400F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Dec 2024 12:05:28 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-728e729562fso2141869b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Dec 2024 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734177928; x=1734782728; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ef+KnOlI3Lc8v/jEZGInz0a4NzqY0JpgG6ovL4bxVRk=;
        b=QZWp6Rs+XcicwW8wGytaGp+fgJ5H1RuvWVSfPm9DxXZ+irR2abtTHSd7WpKc1dU1BE
         6PQvEhEzlfy5LmAPIzBawnW3Y5NB4UTd2Htk/bRxeAxFIToFe7vEL4mfa5bGsFr3J/if
         w6ljjJMu57+0bngF8+Ijde/WAUdkk4iPH3WvGfPJyiyECvupsPwXNDlNWsAsmFTaJJ5P
         qIkGpEnaqwY9xRIrXEtnuK5VS1bZmPLYQa8vK2YOAa86PnGYZCcKrKjzu+a6eDO7vplO
         3T2zet/j4xbCSiK9/7wOnx4lEQcl7EwLmBVOu1koS5EpaYuLdwSbo/Xc4iAGowZqlF7z
         BfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734177928; x=1734782728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef+KnOlI3Lc8v/jEZGInz0a4NzqY0JpgG6ovL4bxVRk=;
        b=VXM4S1u3kBORoM1F0NEz7lp04uPl9Zjb44chbsfp3urKPHAJRjSMrJb12jZBoJ3dS9
         PXVuJSoOUKenQ1CyfGIVfDvWiQZvjShKyW9lNhN2wfAogxcEvh0QXxnAw1n4LUcH+25n
         fwUe0LJmV4kt4XUVoiPUbsfM5iWg4oUlSgubuwXSr+aBW0RwrqUAww8pPCW4ZqFFrHsF
         5P43NLfMDNK+kqGDPZ/tzMWWp2pkgJAiLqFdgerQ2EPZFTJC6NKDO1m4FZeuj8Wa+LYh
         Mt8xmJ2eD4GZ0k8ewtt6A0noAW8sdW6S2aUV/+Aq3qJx+23zxLx/GyDdw5Cq1H5YjdLY
         YRUA==
X-Forwarded-Encrypted: i=1; AJvYcCWzDTQaoK15gt7gkJpvMG7KcC6WYIFkq1xvijYfrAFKg9b7Ac+C/qIs5fsGLZ5jmxIopJ0XKpvQ4fOqQEd60DDsabRDjw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxkRbNKZvM7aQs3YFe5yf1gyEMxdIcrvW1+P2fTDyCE/ytRvUnh
	VLjrTGLVEIgSOy/s2nhf74YRRVXIUGPOflb8h6H4YAuVtXpePY+3
X-Gm-Gg: ASbGncsdUpozQomKZ3RZPAnbAG5T2mjfjciR801wmp6xngw42HMwYt78irpSyWxlSHW
	0g01xeU5DKbpggfpOzam+2PDETJ2AUZLDXZxXuElm1lSpSrH+93/HlAUlNn/ouWG9iFG37zBvdb
	zWEstavsB8Op8uK2OBuuHnStFqNDp0W4kw+s/D+cxvjaHD9unidIgw5lC5Dovtnhyr2JyKNr5Ul
	wJumWFEFqaoJolup7wdJLoOQdJwetx+3QMdcti5Y4E8a/3Kd27+xTB962Y8+9xaAMbePXIx0em5
	P20myoqu
X-Google-Smtp-Source: AGHT+IHvzcNTUqoyCtnbQdcp35YCsUI0XyNH3LwqNAe54gEFhN/bp6EYFbVghSaJbTr8Z08v7Yy6BQ==
X-Received: by 2002:a05:6a00:4645:b0:725:f4c6:6b72 with SMTP id d2e1a72fcca58-7290c264663mr8773714b3a.25.1734177928187;
        Sat, 14 Dec 2024 04:05:28 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad6a8sm1282944b3a.159.2024.12.14.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 04:05:27 -0800 (PST)
Date: Sat, 14 Dec 2024 20:05:23 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: davidgow@google.com, akpm@linux-foundation.org,
	skhan@linuxfoundation.org, rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] lib/math: Add int_sqrt test suite
Message-ID: <Z110g9txzLJvZ7EM@visitorckw-System-Product-Name>
References: <20241213042701.1037467-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213042701.1037467-1-luis.hernandez093@gmail.com>

On Thu, Dec 12, 2024 at 11:26:50PM -0500, Luis Felipe Hernandez wrote:
> Adds test suite for integer based square root function.
> 
> The test suite is designed to verify the correctness of the int_sqrt()
> math library function.
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>

LGTM. Feel free to add:

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei

> ---
>  lib/Kconfig.debug               | 15 ++++++++
>  lib/math/Makefile               |  1 +
>  lib/math/tests/Makefile         |  1 +
>  lib/math/tests/int_sqrt_kunit.c | 66 +++++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 lib/math/tests/int_sqrt_kunit.c
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index f3d723705879..147d9fef42e7 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3161,6 +3161,21 @@ config INT_POW_TEST
>  
>  	  If unsure, say N
>  
> +config INT_SQRT_KUNIT_TEST
> +	tristate "Integer square root test" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables the KUnit test suite for the int_sqrt() function,
> +	  which performs square root calculation. The test suite checks
> +	  various scenarios, including edge cases, to ensure correctness.
> +
> +	  Enabling this option will include tests that check various scenarios
> +	  and edge cases to ensure the accuracy and reliability of the square root
> +	  function.
> +
> +	  If unsure, say N
> +
>  endif # RUNTIME_TESTING_MENU
>  
>  config ARCH_USE_MEMTEST
> diff --git a/lib/math/Makefile b/lib/math/Makefile
> index 3ef11305f8d2..853f023ae537 100644
> --- a/lib/math/Makefile
> +++ b/lib/math/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
>  obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
>  obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
>  obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
> +obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += tests/int_sqrt_kunit.o
> \ No newline at end of file
> diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
> index 6a169123320a..e1a79f093b2d 100644
> --- a/lib/math/tests/Makefile
> +++ b/lib/math/tests/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
> +obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += int_sqrt_kunit.o
> diff --git a/lib/math/tests/int_sqrt_kunit.c b/lib/math/tests/int_sqrt_kunit.c
> new file mode 100644
> index 000000000000..1798e1312eb7
> --- /dev/null
> +++ b/lib/math/tests/int_sqrt_kunit.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <kunit/test.h>
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +
> +struct test_case_params {
> +	unsigned long x;
> +	unsigned long expected_result;
> +	const char *name;
> +};
> +
> +static const struct test_case_params params[] = {
> +	{ 0, 0, "edge case: square root of 0" },
> +	{ 1, 1, "perfect square: square root of 1" },
> +	{ 2, 1, "non-perfect square: square root of 2" },
> +	{ 3, 1, "non-perfect square: square root of 3" },
> +	{ 4, 2, "perfect square: square root of 4" },
> +	{ 5, 2, "non-perfect square: square root of 5" },
> +	{ 6, 2, "non-perfect square: square root of 6" },
> +	{ 7, 2, "non-perfect square: square root of 7" },
> +	{ 8, 2, "non-perfect square: square root of 8" },
> +	{ 9, 3, "perfect square: square root of 9" },
> +	{ 15, 3, "non-perfect square: square root of 15 (N-1 from 16)" },
> +	{ 16, 4, "perfect square: square root of 16" },
> +	{ 17, 4, "non-perfect square: square root of 17 (N+1 from 16)" },
> +	{ 80, 8, "non-perfect square: square root of 80 (N-1 from 81)" },
> +	{ 81, 9, "perfect square: square root of 81" },
> +	{ 82, 9, "non-perfect square: square root of 82 (N+1 from 81)" },
> +	{ 255, 15, "non-perfect square: square root of 255 (N-1 from 256)" },
> +	{ 256, 16, "perfect square: square root of 256" },
> +	{ 257, 16, "non-perfect square: square root of 257 (N+1 from 256)" },
> +	{ 2147483648, 46340, "large input: square root of 2147483648" },
> +	{ 4294967295, 65535, "edge case: ULONG_MAX for 32-bit" },
> +};
> +
> +static void get_desc(const struct test_case_params *tc, char *desc)
> +{
> +	strscpy(desc, tc->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(int_sqrt, params, get_desc);
> +
> +static void int_sqrt_test(struct kunit *test)
> +{
> +	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> +
> +	KUNIT_EXPECT_EQ(test, tc->expected_result, int_sqrt(tc->x));
> +}
> +
> +static struct kunit_case math_int_sqrt_test_cases[] = {
> +	KUNIT_CASE_PARAM(int_sqrt_test, int_sqrt_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite int_sqrt_test_suite = {
> +	.name = "math-int_sqrt",
> +	.test_cases = math_int_sqrt_test_cases,
> +};
> +
> +kunit_test_suites(&int_sqrt_test_suite);
> +
> +MODULE_DESCRIPTION("math.int_sqrt KUnit test suite");
> +MODULE_LICENSE("GPL");
> -- 
> 2.47.1
> 
> 
