Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B50CC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:14:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2202072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="DGWXCaTY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F2202072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED195881D0;
	Mon, 17 Aug 2020 07:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5JoTd0nMymx; Mon, 17 Aug 2020 07:14:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE0A8881AB;
	Mon, 17 Aug 2020 07:14:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB60BC07FF;
	Mon, 17 Aug 2020 07:14:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BF79C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 30E4B221B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjazuLnzC0t2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:13:55 +0000 (UTC)
X-Greylist: delayed 00:06:00 by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by silver.osuosl.org (Postfix) with ESMTPS id DE1FD22234
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:12:37 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id ba10so11438898edb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 00:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3ZvbvvosG6I7wsjApE0BjLkAaZkKZ2tdfYfQHRAdMLU=;
 b=DGWXCaTYy5NVkneXdSYdjTlBT1eQtZBGv420YzMhXMnKAfVtYKvYfgQl2tOkehBTUm
 aIwrpTLvumyUtSHmgNhsWwoqInH/4fySSiAr+Ldtrxh8+Hr4jMurU8kx6LZFhaMeUsoE
 gwtaLUkG56qr9N6TrZqr7MIs/Y8xBa/jh+KFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ZvbvvosG6I7wsjApE0BjLkAaZkKZ2tdfYfQHRAdMLU=;
 b=eQ/hPNJ4dvSE1OwwpJFEr3M3Up5aF54X5JAqOU0zfbsK/fc66X1plkIuLBYjzVZFtD
 GkHTCocSx3I0I4EAILvU9DK8UOEe6WC3XH8HRcWAd9E7CKC2ADG7ru3+pYMB/NP6gTk4
 AvC5Pt9IDgaAuQa+r/NS07+x3NgzRJQ9fnsJjSml1AW01lGeX5uioaspNFp1ahamgvph
 vQD8NJ+YJCug9+HluCgcSVrxkPgR0xLY0clTW2hY/PI1A0Q99UXrM5RRi5um57mmSMBd
 UigXFa4+Bgd10o6JZQ4HlS1MQ9YHmOwQDvFsAo/EfjNHBeCq0swosPyi4O4m4JPS70Yq
 n/Pg==
X-Gm-Message-State: AOAM530x38Fco7pLdYJ/wHfGae1769zGQzmxI9apfp5R+3SitFoFN0ac
 u0dF0GTMLR6YdiRNp1+38kOo6+zaq0XzL6Ma
X-Google-Smtp-Source: ABdhPJx0FQlIMH07y60AOp8FWIeK7yINY4Q7g/X5/Z9UDGrRMeSl4OiXsC3siraqCPgZP1xZE3MMKg==
X-Received: by 2002:a50:9e4c:: with SMTP id z70mr13300819ede.384.1597647995423; 
 Mon, 17 Aug 2020 00:06:35 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id j24sm13514238ejv.32.2020.08.17.00.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 00:06:34 -0700 (PDT)
To: Arpitha Raghunandan <98.arpi@gmail.com>, brendanhiggins@google.com,
 skhan@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
 pmladek@suse.com, rostedt@goodmis.org, sergey.senozhatsky@gmail.com
References: <20200817043028.76502-1-98.arpi@gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmusvillemoes.dk>
Date: Mon, 17 Aug 2020 09:06:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817043028.76502-1-98.arpi@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_printf.c to
	KUnit
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 17/08/2020 06.30, Arpitha Raghunandan wrote:
> Converts test lib/test_printf.c to KUnit.
> More information about KUnit can be found at
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> KUnit provides a common framework for unit tests in the kernel.

So I can continue to build a kernel with some appropriate CONFIG set to
y, boot it under virt-me, run dmesg and see if I broke printf? That's
what I do now, and I don't want to have to start using some enterprisy
framework.

> diff --git a/lib/test_printf.c b/lib/printf_kunit.c
> similarity index 45%
> rename from lib/test_printf.c
> rename to lib/printf_kunit.c
> index 7ac87f18a10f..68ac5f9b8d28 100644
> --- a/lib/test_printf.c
> +++ b/lib/printf_kunit.c
> @@ -5,6 +5,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <kunit/test.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -30,79 +31,61 @@
>  #define PAD_SIZE 16
>  #define FILL_CHAR '$'
>  
> -static unsigned total_tests __initdata;
> -static unsigned failed_tests __initdata;
> -static char *test_buffer __initdata;
> -static char *alloced_buffer __initdata;
> +static char *test_buffer;
> +static char *alloced_buffer;
>  
> -static int __printf(4, 0) __init
> -do_test(int bufsize, const char *expect, int elen,
> +static void __printf(5, 0)
> +do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
>  	const char *fmt, va_list ap)
>  {
>  	va_list aq;
>  	int ret, written;
>  
> -	total_tests++;
> -
>  	memset(alloced_buffer, FILL_CHAR, BUF_SIZE + 2*PAD_SIZE);
>  	va_copy(aq, ap);
>  	ret = vsnprintf(test_buffer, bufsize, fmt, aq);
>  	va_end(aq);
>  
> -	if (ret != elen) {
> -		pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
> +	KUNIT_EXPECT_EQ_MSG(kunittest, ret, elen,
> +			"vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
>  			bufsize, fmt, ret, elen);
> -		return 1;
> -	}


IIRC, some of these early returns are required to ensure the following
checks do not fail (as in, potentially crash the kernel) simply because
they go off into the weeds. Please double-check that they are all safe
to continue to perform (though, another reason I might have put them in
is to simply avoid lots of useless collateral).


> -	if (memchr_inv(alloced_buffer, FILL_CHAR, PAD_SIZE)) {
> +	KUNIT_EXPECT_EQ_MSG(kunittest, memchr_inv(alloced_buffer, FILL_CHAR, PAD_SIZE), NULL,

> -		if (memchr_inv(test_buffer, FILL_CHAR, BUF_SIZE + PAD_SIZE)) {
> +		KUNIT_EXPECT_FALSE_MSG(kunittest,

> -	if (memchr_inv(test_buffer + written + 1, FILL_CHAR, BUF_SIZE + PAD_SIZE - (written + 1))) {
> +	KUNIT_EXPECT_FALSE_MSG(kunittest,
> +			memchr_inv(test_buffer + written + 1, FILL_CHAR, BUF_SIZE + PAD_SIZE - (written + 1))

Why the inconsistency in what a memchr_inv != NULL check gets converted to?


>  
> -static void __printf(3, 4) __init
> -__test(const char *expect, int elen, const char *fmt, ...)
> +static void __printf(4, 5)
> +__test(struct kunit *kunittest, const char *expect, int elen, const char *fmt, ...)
>  {
>  	va_list ap;
>  	int rand;
>  	char *p;
>  
> -	if (elen >= BUF_SIZE) {
> -		pr_err("error in test suite: expected output length %d too long. Format was '%s'.\n",
> -		       elen, fmt);
> -		failed_tests++;
> -		return;
> -	}
> +	KUNIT_EXPECT_LT_MSG(kunittest, elen, BUF_SIZE,
> +			"error in test suite: expected output length %d too long. Format was '%s'.\n",
> +			elen, fmt);

And it's ok to continue with the tests when the test suite itself is
buggy because? [*]

>  	va_start(ap, fmt);
>  
> @@ -112,49 +95,46 @@ __test(const char *expect, int elen, const char *fmt, ...)
>  	 * enough and 0), and then we also test that kvasprintf would
>  	 * be able to print it as expected.
>  	 */
> -	failed_tests += do_test(BUF_SIZE, expect, elen, fmt, ap);
> +	do_test(kunittest, BUF_SIZE, expect, elen, fmt, ap);
>  	rand = 1 + prandom_u32_max(elen+1);
>  	/* Since elen < BUF_SIZE, we have 1 <= rand <= BUF_SIZE. */
> -	failed_tests += do_test(rand, expect, elen, fmt, ap);

[*] Certainly this invariant gets violated, so we (may) provide do_test
with a buffer size larger than, well, BUF_SIZE.

>  
> -#define test(expect, fmt, ...)					\
> -	__test(expect, strlen(expect), fmt, ##__VA_ARGS__)
> +#define test(kunittest, expect, fmt, ...)					\
> +	__test(kunittest, expect, strlen(expect), fmt, ##__VA_ARGS__)
>  
> -static void __init
> -test_basic(void)
> +static void
> +test_basic(struct kunit *kunittest)
>  {
>  	/* Work around annoying "warning: zero-length gnu_printf format string". */
>  	char nul = '\0';
>  
> -	test("", &nul);
> -	test("100%", "100%%");
> -	test("xxx%yyy", "xxx%cyyy", '%');
> -	__test("xxx\0yyy", 7, "xxx%cyyy", '\0');
> +	test(kunittest, "", &nul);
> +	test(kunittest, "100%", "100%%");
> +	test(kunittest, "xxx%yyy", "xxx%cyyy", '%');
> +	__test(kunittest, "xxx\0yyy", 7, "xxx%cyyy", '\0');

Am I reading this right that all this is simply to prepend kunittest to
the arguments? How about just redefining the test macro so it
automagically does that instead of all this churn? The few cases that
use __test may need to be handled specially.

> +
> +static void selftest(struct kunit *kunittest)
>  {
>  	alloced_buffer = kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
>  	if (!alloced_buffer)
>  		return;
>  	test_buffer = alloced_buffer + PAD_SIZE;
>  
> -	test_basic();
> -	test_number();
> -	test_string();
> -	test_pointer();
> +	test_basic(kunittest);
> +	test_number(kunittest);
> +	test_string(kunittest);
> +	test_pointer(kunittest);
>  
>  	kfree(alloced_buffer);
>  }

Even better, since the whole thing still relies on the static variables
test_buffer and alloced_buffer, why not just stash the struct kunit*
that the framework passes in a file-scope static and avoid even more
churn? Then only the newly introduce KUNIT_CHECK_* macros need to refer
to it, and none of the existing code (or future cases) needs that piece
of boilerplate.

BTW, does the framework have some kind of logic that ensures nobody runs
the printf suite twice in parallel?

Rasmus
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
