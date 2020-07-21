Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C928AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 19:09:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC39206E9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 19:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="icFK+j1Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC39206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8546188228;
	Tue, 21 Jul 2020 19:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uh0wvlakRlgX; Tue, 21 Jul 2020 19:09:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D22498819F;
	Tue, 21 Jul 2020 19:09:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCC46C089F;
	Tue, 21 Jul 2020 19:09:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9392C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A52E62270C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3TzeogILdEU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:09:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 386D4203AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:09:33 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id mn17so2014554pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NAFt6C2lnvpS45jVhw23Ap3Sp8296UwbtX9tobHLa1g=;
 b=icFK+j1QmdrfPm1agUfJealBTpwFHPXzo+8S/+STX6KNUWATkXlIlCEWGl2IAB0Kaw
 81hUL9l2hd6YXn1feWWISzSrw+hQRCIGKNVJbWKr7A8mt5ntyHbZ7HqDqAM0G+A1AosL
 C4oIXZNzgs1qwn+vlMLHBWHD7jiCUNtg/I8HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NAFt6C2lnvpS45jVhw23Ap3Sp8296UwbtX9tobHLa1g=;
 b=epJfqQBn26Y04+RdttJveIujRmRN4LlpAJQYaI8D9QIIgSnmlJTdBfd05cd4Lxd+pF
 e5ROWbsI8RHUsAjkxh/BJFPuQfWtApc4Yzbg3sn9UKJOjtRYv5fXb/Iqmein6FrQ4q8u
 to/23hCWOB1UHhjeNOKvrBsd7Sqb41wXRMLaxD6a3KY3sYSN8kewQGnVruOhVednRHwQ
 VYk8JlAgjmECLYngrKFbkwsIaCv+pdPtBr8DvZECZmnB+iC1gDgpH23H65vdPi2If3ud
 LGee3VP5R4YFbA1BJ6C8Re0X2gRJ7hK315mYhI8LiRWv0NYaEI407I0H62C+c59lrqfZ
 RWMQ==
X-Gm-Message-State: AOAM530oXJMFUqnvHTAqs4DQCwt3uxB+MB0x8dwD/mnDATTOFjiJwkaW
 Fd2Bpy3zQ3eoiURgwAAW5bqiVw==
X-Google-Smtp-Source: ABdhPJzWAwKHQkMx9PJ9EAZVnXplkjPUmWmAhBJFL+0Oc7tM+S4Ojo/uUW20rsqp3QBbghADINzeSA==
X-Received: by 2002:a17:902:7612:: with SMTP id
 k18mr22356298pll.187.1595358572696; 
 Tue, 21 Jul 2020 12:09:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c139sm20745411pfb.65.2020.07.21.12.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 12:09:31 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:09:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <202007211207.5BAA9D8D@keescook>
References: <20200721174654.72132-1-vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721174654.72132-1-vitor@massaru.org>
Cc: linux-kselftest@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, davidgow@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_user_copy
	to KUnit test
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

On Tue, Jul 21, 2020 at 02:46:54PM -0300, Vitor Massaru Iha wrote:
> This adds the conversion of the runtime tests of test_user_copy fuctions,
> from `lib/test_user_copy.c`to KUnit tests.
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
> v2:
>     * splitted patch in 3:
>         - Allows to install and load modules in root filesystem;
>         - Provides an userspace memory context when tests are compiled
>           as module;
>         - Convert test_user_copy to KUnit test;
>     * removed entry for CONFIG_TEST_USER_COPY;
>     * replaced pr_warn to KUNIT_EXPECT_FALSE_MSG in test macro to
>       decrease the diff;
> v3:
>     * rebased with last kunit branch
>     * Please apply this commit from kunit-fixes:
>         3f37d14b8a3152441f36b6bc74000996679f0998
>       And these from patchwork:
>         https://patchwork.kernel.org/patch/11676331/
>         https://patchwork.kernel.org/patch/11676335/
> ---
>  lib/Kconfig.debug                           | 28 ++++++++------
>  lib/Makefile                                |  2 +-
>  lib/{test_user_copy.c => user_copy_kunit.c} | 42 +++++++++------------
>  3 files changed, 35 insertions(+), 37 deletions(-)
>  rename lib/{test_user_copy.c => user_copy_kunit.c} (91%)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9ad9210d70a1..f699a3624ae7 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2078,18 +2078,6 @@ config TEST_VMALLOC
> 
>  	  If unsure, say N.
> 
> -config TEST_USER_COPY
> -	tristate "Test user/kernel boundary protections"
> -	depends on m
> -	help
> -	  This builds the "test_user_copy" module that runs sanity checks
> -	  on the copy_to/from_user infrastructure, making sure basic
> -	  user/kernel boundary testing is working. If it fails to load,
> -	  a regression has been detected in the user/kernel memory boundary
> -	  protections.
> -
> -	  If unsure, say N.
> -
>  config TEST_BPF
>  	tristate "Test BPF filter functionality"
>  	depends on m && NET
> @@ -2154,6 +2142,22 @@ config SYSCTL_KUNIT_TEST
> 
>  	  If unsure, say N.
> 
> +config USER_COPY_KUNIT
> +	tristate "KUnit Test for user/kernel boundary protections"
> +	depends on KUNIT
> +	depends on m
> +	help
> +	  This builds the "user_copy_kunit" module that runs sanity checks
> +	  on the copy_to/from_user infrastructure, making sure basic
> +	  user/kernel boundary testing is working. If it fails to load,
> +	  a regression has been detected in the user/kernel memory boundary
> +	  protections.
> +
> +	  For more information on KUnit and unit tests in general please refer
> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.
> +
> +	  If unsure, say N.
> +
>  config LIST_KUNIT_TEST
>  	tristate "KUnit Test for Kernel Linked-list structures" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> diff --git a/lib/Makefile b/lib/Makefile
> index b1c42c10073b..8c145f85accc 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -78,7 +78,6 @@ obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
>  obj-$(CONFIG_TEST_OVERFLOW) += test_overflow.o
>  obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
>  obj-$(CONFIG_TEST_SORT) += test_sort.o
> -obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
>  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
>  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
>  obj-$(CONFIG_TEST_PRINTF) += test_printf.o
> @@ -318,3 +317,4 @@ obj-$(CONFIG_OBJAGG) += objagg.o
>  # KUnit tests
>  obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
>  obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
> +obj-$(CONFIG_USER_COPY_KUNIT) += user_copy_kunit.o
> diff --git a/lib/test_user_copy.c b/lib/user_copy_kunit.c
> similarity index 91%
> rename from lib/test_user_copy.c
> rename to lib/user_copy_kunit.c
> index 5ff04d8fe971..a10ddd15b4cd 100644
> --- a/lib/test_user_copy.c
> +++ b/lib/user_copy_kunit.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/vmalloc.h>
> +#include <kunit/test.h>
> 
>  /*
>   * Several 32-bit architectures support 64-bit {get,put}_user() calls.
> @@ -35,7 +36,7 @@
>  ({									\
>  	int cond = (condition);						\
>  	if (cond)							\
> -		pr_warn("[%d] " msg "\n", __LINE__, ##__VA_ARGS__);	\
> +		KUNIT_EXPECT_FALSE_MSG(test, cond, msg, ##__VA_ARGS__);	\

I'm surprised any of this compiles with both a macro and arg named
"test". :) Can you change the arg to something with more clarity?
"context" or "kunit" seems better.

>  	cond;								\
>  })
> 
> @@ -44,7 +45,7 @@ static bool is_zeroed(void *from, size_t size)
>  	return memchr_inv(from, 0x0, size) == NULL;
>  }
> 
> -static int test_check_nonzero_user(char *kmem, char __user *umem, size_t size)
> +static int test_check_nonzero_user(struct kunit *test, char *kmem, char __user *umem, size_t size)
>  {
>  	int ret = 0;
>  	size_t start, end, i, zero_start, zero_end;
> @@ -102,7 +103,7 @@ static int test_check_nonzero_user(char *kmem, char __user *umem, size_t size)
>  	return ret;
>  }
> 
> -static int test_copy_struct_from_user(char *kmem, char __user *umem,
> +static int test_copy_struct_from_user(struct kunit *test, char *kmem, char __user *umem,
>  				      size_t size)
>  {
>  	int ret = 0;
> @@ -177,7 +178,7 @@ static int test_copy_struct_from_user(char *kmem, char __user *umem,
>  	return ret;
>  }
> 
> -static int __init test_user_copy_init(void)
> +static void user_copy_test(struct kunit *test)
>  {
>  	int ret = 0;
>  	char *kmem;
> @@ -192,16 +193,14 @@ static int __init test_user_copy_init(void)
>  #endif
> 
>  	kmem = kmalloc(PAGE_SIZE * 2, GFP_KERNEL);
> -	if (!kmem)
> -		return -ENOMEM;
> +	KUNIT_EXPECT_FALSE_MSG(test, kmem == NULL, "kmalloc failed");

This would need to be an ASSERT, yes?

> 
>  	user_addr = vm_mmap(NULL, 0, PAGE_SIZE * 2,
>  			    PROT_READ | PROT_WRITE | PROT_EXEC,
>  			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
>  	if (user_addr >= (unsigned long)(TASK_SIZE)) {
> -		pr_warn("Failed to allocate user memory\n");
>  		kfree(kmem);
> -		return -ENOMEM;
> +		KUNIT_FAIL(test, "Failed to allocate user memory");
>  	}

Why FAIL instead of ASSERT?

> 
>  	usermem = (char __user *)user_addr;
> @@ -245,9 +244,9 @@ static int __init test_user_copy_init(void)
>  #undef test_legit
> 
>  	/* Test usage of check_nonzero_user(). */
> -	ret |= test_check_nonzero_user(kmem, usermem, 2 * PAGE_SIZE);
> +	ret |= test_check_nonzero_user(test, kmem, usermem, 2 * PAGE_SIZE);
>  	/* Test usage of copy_struct_from_user(). */
> -	ret |= test_copy_struct_from_user(kmem, usermem, 2 * PAGE_SIZE);
> +	ret |= test_copy_struct_from_user(test, kmem, usermem, 2 * PAGE_SIZE);
> 
>  	/*
>  	 * Invalid usage: none of these copies should succeed.
> @@ -309,23 +308,18 @@ static int __init test_user_copy_init(void)
> 
>  	vm_munmap(user_addr, PAGE_SIZE * 2);
>  	kfree(kmem);
> -
> -	if (ret == 0) {
> -		pr_info("tests passed.\n");
> -		return 0;
> -	}
> -
> -	return -EINVAL;

Does KUnit provide a end-of-test summary now?

>  }
> 
> -module_init(test_user_copy_init);
> -
> -static void __exit test_user_copy_exit(void)
> -{
> -	pr_info("unloaded.\n");
> -}
> +static struct kunit_case user_copy_test_cases[] = {
> +	KUNIT_CASE(user_copy_test),
> +	{}
> +};
> 
> -module_exit(test_user_copy_exit);
> +static struct kunit_suite user_copy_test_suite = {
> +	.name = "user_copy",
> +	.test_cases = user_copy_test_cases,
> +};
> 
> +kunit_test_suites(&user_copy_test_suite);
>  MODULE_AUTHOR("Kees Cook <keescook@chromium.org>");
>  MODULE_LICENSE("GPL");
> 
> base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
> --
> 2.26.2
> 

Otherwise, yes, looking good.

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
