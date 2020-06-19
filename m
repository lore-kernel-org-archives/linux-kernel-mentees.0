Return-Path: <SRS0=oG7b=AA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91060C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 03:06:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E71207D8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 03:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tyyt/7P6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E71207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F0DA92736B;
	Fri, 19 Jun 2020 03:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WS+uyi1RzZts; Fri, 19 Jun 2020 03:06:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 790332156C;
	Fri, 19 Jun 2020 03:06:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 747BEC07FF;
	Fri, 19 Jun 2020 03:06:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABC24C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 03:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8B4D826FA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 03:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1m0rjGy5fAI1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 03:06:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 438C62156C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 03:06:00 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h10so3851575pgq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sl3yoM++/CNn9Byxz9TBqE1X2qyiA9tBa4xlvf5jcC8=;
 b=Tyyt/7P6Nb023Z1WyohS/89WAxXb1gDWTHicvBf+rCoanq5S04tRB2voXl3k9vf/jb
 BhKzbuuClnoaQVpR4bPoe315LsYdq5h97EifSmi0SlBckG5KMZeDONHKF2dx+Y602DhY
 c+h0LZbbuLJMWKDAQmg3AC207p2WZrVfgeUJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sl3yoM++/CNn9Byxz9TBqE1X2qyiA9tBa4xlvf5jcC8=;
 b=VVgrwiuCbhJDkjykxRebJbiIenR/AvIDxxXtGro0EKRSn2PlY3pPHDTjnIgGQlQ+Xb
 tsMBnry3C1Cp/TWaydc8UM6sYDiU5LsmQPfPnirXCLUE502DkMkLgD2fAlW26b90Yb5u
 KIvT1iv3RuXXR92JsjeWtArmB6rT+VmvUATVWKPONjtvqihy1fH0Yyfn5Y/5g2vsSlWD
 kp6ausqlO5+ui+Qs0vAZAu7dZo8F8rUgf79LUroF8Mlt5cRKlgg29n6GXAL+iVYjRupH
 fAxunR3xoDlSf6aPm0aaZVnYFxKNR8T0n1Ul+dtUyjQkKohN2CHouFI20gON6MsjcbGO
 /EKw==
X-Gm-Message-State: AOAM5310xyMFYtZ5nZWCKgepo67xf0olWLxqzNVAKbFDSW8wTWVxkcSp
 06j73lkopn/yYf/yFdIsFLySHA==
X-Google-Smtp-Source: ABdhPJykwMLIAa2d7nHyCMEfXBLzV1tFN6aDzIFdBMy0xAEFDINGsjKJ4Gv1L6HNe/ePJAbDPlePDQ==
X-Received: by 2002:a62:1444:: with SMTP id 65mr6153925pfu.294.1592535959486; 
 Thu, 18 Jun 2020 20:05:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j126sm3293706pfg.95.2020.06.18.20.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 20:05:58 -0700 (PDT)
Date: Thu, 18 Jun 2020 20:05:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <202006181949.6402C456@keescook>
References: <20200618140814.135948-1-vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618140814.135948-1-vitor@massaru.org>
Cc: davidgow@google.com, linux@rasmusvillemoes.dk, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [RESEND,
 PATCH v2] lib: overflow-test: add KUnit test of check_*_overflow
 functions
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

On Thu, Jun 18, 2020 at 11:08:14AM -0300, Vitor Massaru Iha wrote:
> This adds the conversion of the runtime tests of check_*_overflow functions,
> from `lib/test_overflow.c`to KUnit tests.
> 
> The log similar to the one seen in dmesg running test_overflow.c can be
> seen in `test.log`.
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Tested-by: David Gow <davidgow@google.com>
> ---
> v2:
>   * moved lib/test_overflow.c to lib/overflow-test.c; 

I still don't want a dash in the filename, as this creates a difference
between the source name and the module name. While I still prefer
overflow_kunit.c, I can get over it and accept overflow_test.c :)

>     * back to original license;
>     * fixed style code;
>     * keeps __initconst and added _refdata on overflow_test_cases variable;
>     * keeps macros intact making asserts with the variable err;
>     * removed duplicate test_s8_overflow();
>   * fixed typos on commit message;
> ---
>  lib/Kconfig.debug                        | 20 +++++++--
>  lib/Makefile                             |  2 +-
>  lib/{test_overflow.c => overflow-test.c} | 54 +++++++++---------------
>  3 files changed, 38 insertions(+), 38 deletions(-)
>  rename lib/{test_overflow.c => overflow-test.c} (96%)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index d74ac0fd6b2d..fb8a3955e969 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2000,9 +2000,6 @@ config TEST_UUID
>  config TEST_XARRAY
>  	tristate "Test the XArray code at runtime"
>  
> -config TEST_OVERFLOW
> -	tristate "Test check_*_overflow() functions at runtime"
> -
>  config TEST_RHASHTABLE
>  	tristate "Perform selftest on resizable hash table"
>  	help
> @@ -2155,6 +2152,23 @@ config SYSCTL_KUNIT_TEST
>  
>  	  If unsure, say N.
>  
> +config OVERFLOW_KUNIT_TEST
> +	tristate "KUnit test for overflow" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds the overflow KUnit tests.
> +
> +	  KUnit tests run during boot and output the results to the debug log
> +	  in TAP format (http://testanything.org/). Only useful for kernel devs
> +	  running KUnit test harness and are not for inclusion into a production
> +	  build.
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
> index b1c42c10073b..3b725c9f92d4 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -75,7 +75,6 @@ obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
>  obj-$(CONFIG_TEST_MIN_HEAP) += test_min_heap.o
>  obj-$(CONFIG_TEST_LKM) += test_module.o
>  obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
> -obj-$(CONFIG_TEST_OVERFLOW) += test_overflow.o
>  obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
>  obj-$(CONFIG_TEST_SORT) += test_sort.o
>  obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
> @@ -318,3 +317,4 @@ obj-$(CONFIG_OBJAGG) += objagg.o
>  # KUnit tests
>  obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
>  obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
> +obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow-test.o
> diff --git a/lib/test_overflow.c b/lib/overflow-test.c
> similarity index 96%
> rename from lib/test_overflow.c
> rename to lib/overflow-test.c
> index 7a4b6f6c5473..d40ef06b1ade 100644
> --- a/lib/test_overflow.c
> +++ b/lib/overflow-test.c
> @@ -4,14 +4,11 @@
>   */
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <kunit/test.h>
>  #include <linux/device.h>
>  #include <linux/init.h>
> -#include <linux/kernel.h>
>  #include <linux/mm.h>
> -#include <linux/module.h>
>  #include <linux/overflow.h>
> -#include <linux/slab.h>
> -#include <linux/types.h>
>  #include <linux/vmalloc.h>
>  
>  #define DEFINE_TEST_ARRAY(t)			\
> @@ -270,7 +267,7 @@ DEFINE_TEST_FUNC(u64, "%llu");
>  DEFINE_TEST_FUNC(s64, "%lld");
>  #endif
>  
> -static int __init test_overflow_calculation(void)
> +static void __init overflow_calculation_test(struct kunit *test)
>  {
>  	int err = 0;
>  
> @@ -285,10 +282,10 @@ static int __init test_overflow_calculation(void)
>  	err |= test_s64_overflow();
>  #endif
>  
> -	return err;
> +	KUNIT_EXPECT_FALSE(test, err);
>  }

Ah! Well, yes, I guess that is one way to do it. :) I'm just curious:
why the change away from doing EXPECTs on individual tests?

>  
> -static int __init test_overflow_shift(void)
> +static void __init overflow_shift_test(struct kunit *test)
>  {
>  	int err = 0;
>  
> @@ -479,7 +476,7 @@ static int __init test_overflow_shift(void)
>  	err |= TEST_ONE_SHIFT(0, 31, s32, 0, false);
>  	err |= TEST_ONE_SHIFT(0, 63, s64, 0, false);
>  
> -	return err;
> +	KUNIT_EXPECT_FALSE(test, err);
>  }
>  
>  /*
> @@ -555,7 +552,7 @@ DEFINE_TEST_ALLOC(kvzalloc_node, kvfree,     0, 1, 1);
>  DEFINE_TEST_ALLOC(devm_kmalloc,  devm_kfree, 1, 1, 0);
>  DEFINE_TEST_ALLOC(devm_kzalloc,  devm_kfree, 1, 1, 0);
>  
> -static int __init test_overflow_allocation(void)
> +static void __init overflow_allocation_test(struct kunit *test)
>  {
>  	const char device_name[] = "overflow-test";
>  	struct device *dev;
> @@ -563,10 +560,8 @@ static int __init test_overflow_allocation(void)
>  
>  	/* Create dummy device for devm_kmalloc()-family tests. */
>  	dev = root_device_register(device_name);
> -	if (IS_ERR(dev)) {
> -		pr_warn("Cannot register test device\n");
> -		return 1;
> -	}
> +	if (IS_ERR(dev))
> +		kunit_warn(test, "Cannot register test device\n");
>  
>  	err |= test_kmalloc(NULL);
>  	err |= test_kmalloc_node(NULL);
> @@ -585,30 +580,21 @@ static int __init test_overflow_allocation(void)
>  
>  	device_unregister(dev);
>  
> -	return err;
> +	KUNIT_EXPECT_FALSE(test, err);
>  }
>  
> -static int __init test_module_init(void)
> -{
> -	int err = 0;
> -
> -	err |= test_overflow_calculation();
> -	err |= test_overflow_shift();
> -	err |= test_overflow_allocation();
> -
> -	if (err) {
> -		pr_warn("FAIL!\n");
> -		err = -EINVAL;
> -	} else {
> -		pr_info("all tests passed\n");
> -	}
> +static struct kunit_case __refdata overflow_test_cases[] = {

Erm, __refdata? This seems like it should be __initdata.

> +	KUNIT_CASE(overflow_calculation_test),
> +	KUNIT_CASE(overflow_shift_test),
> +	KUNIT_CASE(overflow_allocation_test),
> +	{}
> +};
>  
> -	return err;
> -}
> +static struct kunit_suite overflow_test_suite = {

And this.

> +	.name = "overflow",
> +	.test_cases = overflow_test_cases,
> +};
>  
> -static void __exit test_module_exit(void)
> -{ }
> +kunit_test_suites(&overflow_test_suite);

I suspect the problem causing the need for __refdata there is the lack
of __init markings on the functions in kunit_test_suites()?

(Or maybe this is explained somewhere else I've missed it.)

For example, would this work? (I haven't tested it all.)


diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a..aad746d59d2f 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -233,9 +233,9 @@ size_t kunit_suite_num_test_cases(struct kunit_suite *suite);
 unsigned int kunit_test_case_num(struct kunit_suite *suite,
 				 struct kunit_case *test_case);
 
-int __kunit_test_suites_init(struct kunit_suite **suites);
+int __init __kunit_test_suites_init(struct kunit_suite **suites);
 
-void __kunit_test_suites_exit(struct kunit_suite **suites);
+void __exit __kunit_test_suites_exit(struct kunit_suite **suites);
 
 /**
  * kunit_test_suites() - used to register one or more &struct kunit_suite
@@ -263,8 +263,9 @@ void __kunit_test_suites_exit(struct kunit_suite **suites);
  * everything else is definitely initialized.
  */
 #define kunit_test_suites(suites_list...)				\
-	static struct kunit_suite *suites[] = {suites_list, NULL};	\
-	static int kunit_test_suites_init(void)				\
+	static struct kunit_suite *suites[] __initdata =		\
+		{suites_list, NULL};					\
+	static int __init kunit_test_suites_init(void)			\
 	{								\
 		return __kunit_test_suites_init(suites);		\
 	}								\
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index c36037200310..bfb0f563721b 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -381,7 +381,7 @@ static void kunit_init_suite(struct kunit_suite *suite)
 	kunit_debugfs_create_suite(suite);
 }
 
-int __kunit_test_suites_init(struct kunit_suite **suites)
+int __init __kunit_test_suites_init(struct kunit_suite **suites)
 {
 	unsigned int i;
 
@@ -393,7 +393,7 @@ int __kunit_test_suites_init(struct kunit_suite **suites)
 }
 EXPORT_SYMBOL_GPL(__kunit_test_suites_init);
 
-static void kunit_exit_suite(struct kunit_suite *suite)
+static void __exit kunit_exit_suite(struct kunit_suite *suite)
 {
 	kunit_debugfs_destroy_suite(suite);
 }

>  
> -module_init(test_module_init);
> -module_exit(test_module_exit);
>  MODULE_LICENSE("Dual MIT/GPL");
> 
> base-commit: 7bf200b3a4ac10b1b0376c70b8c66ed39eae7cdd
> prerequisite-patch-id: e827b6b22f950b9f69620805a04e4a264cf4cc6a
> -- 
> 2.26.2
> 

Thanks again for the conversion!

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
