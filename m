Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC3EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 05:34:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382F320725
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 05:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P10FY8t9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382F320725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0409E88373;
	Sat,  1 Aug 2020 05:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1iJFc1WjV2t; Sat,  1 Aug 2020 05:34:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE3F088363;
	Sat,  1 Aug 2020 05:34:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3D02C004F;
	Sat,  1 Aug 2020 05:34:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0EB9C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 05:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 83AAE220C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 05:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wT3RswXR6gWU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 05:34:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id B7A7020444
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 05:34:06 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id mt12so8338063pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 22:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1TQDWlhtOphocCqRWnO12Oowtj66Ozztswpjd6Br1ME=;
 b=P10FY8t9DFhbP2LrF/seKSO64NGjM0Fxh8iyoxHYEka9Cjs31RQSglzPn7M9K1PSHE
 tNFbvxBTwG89WvCNZRTNvksbKApNNNUb3TRfWjnRLF6FNi515lD7h9x0364dRr2AJxkz
 GVytwGczXN8CEV2ds8VLJeGY2E2Regz9SGYUdkD2HExdUKXG6K9b0HXnSGtEpl4jZmM3
 I9daV2466gKRtOKZKE4clHILqgLMQG1vQnp01W+B5gKBZ+hzTE8TVWBDx1dK3sDlkS4B
 pcYvD8vyCwTj7bdDVX7WsUtIo5rwRWI1CEg0rO8e5DzYn5BmYvZh/pxxcAjQmO+W8+yL
 uxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1TQDWlhtOphocCqRWnO12Oowtj66Ozztswpjd6Br1ME=;
 b=o8MQcbmK8D1X2rIFn2JuOh8sG16vBtyOqLoDyUXKxT18n1ZAoR+ofXF2KkBfi8luPE
 /zRfdiSvBbmwv+MRUYYD3SbuUy+Xg/ABsrwSxboZXwAsr2s+Wagm+ELlbbNWKNoeunNs
 YKhPgoQsslzap4S/SP4JCzbLbaj93bQkI0jMRMWCJaFuKm2pod8+xlbwFsJCkVWJVgK/
 W6w25kevDaRkCu6GdVZ08qyLPBUSxDT5Iuh70Nd/YOAdbN2tk55tIDIVxY3fSUwqKYq6
 dPo+j2WhGAWWmgWyE7lyuwQQQo4dZnbuUaatkn4zlnpoBwu1vYTpl/HljDtuRXHqd1yk
 xYtw==
X-Gm-Message-State: AOAM532EiFN2qIYJmQCtJTx45KT9bF5G6juJAkQ30Vdcx/FiBjIJKIe9
 XbZ19HmHtxzZeVsDkZEjVMNGCE22l/FFsA==
X-Google-Smtp-Source: ABdhPJynN7v62CK8YvHCBJB81lE9wGVDwVtkZZiIaUMWckfcBezDzoCoI13qYX9ssOHoQcD+9CfhNA==
X-Received: by 2002:a17:90a:fa8c:: with SMTP id
 cu12mr7498920pjb.229.1596260045906; 
 Fri, 31 Jul 2020 22:34:05 -0700 (PDT)
Received: from [192.168.86.81] ([49.206.12.123])
 by smtp.gmail.com with ESMTPSA id 144sm8745967pfx.116.2020.07.31.22.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 22:34:05 -0700 (PDT)
To: brendanhiggins@google.com, skhan@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com
References: <20200730121656.45302-1-98.arpi@gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <4747b45c-0429-bf2e-8c64-3f4bc6b95749@gmail.com>
Date: Sat, 1 Aug 2020 11:04:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730121656.45302-1-98.arpi@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_uuid.c to KUnit
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

On 30/07/20 5:46 pm, Arpitha Raghunandan wrote:
> Converts test lib/test_uuid.c to KUnit
> 
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> ---
>  lib/Kconfig.debug                 |  7 +--
>  lib/Makefile                      |  2 +-
>  lib/{test_uuid.c => uuid_kunit.c} | 84 +++++++++----------------------
>  3 files changed, 28 insertions(+), 65 deletions(-)
>  rename lib/{test_uuid.c => uuid_kunit.c} (48%)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index f174f8887ae7..330c0d1de50b 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2070,9 +2070,6 @@ config TEST_BITFIELD
>  
>  	  If unsure, say N.
>  
> -config TEST_UUID
> -	tristate "Test functions located in the uuid module at runtime"
> -
>  config TEST_XARRAY
>  	tristate "Test the XArray code at runtime"
>  
> @@ -2273,6 +2270,10 @@ config BITS_TEST
>  
>  	  If unsure, say N.
>  
> +config UUID_KUNIT_TEST
> +	tristate "KUnit test for functions located in the uuid module at runtime"
> +	depends on KUNIT
> +
>  config TEST_UDELAY
>  	tristate "udelay test driver"
>  	help
> diff --git a/lib/Makefile b/lib/Makefile
> index 032cc6c71a3a..62ef383c7563 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -81,7 +81,6 @@ obj-$(CONFIG_TEST_PRINTF) += test_printf.o
>  obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
>  obj-$(CONFIG_TEST_STRSCPY) += test_strscpy.o
>  obj-$(CONFIG_TEST_BITFIELD) += test_bitfield.o
> -obj-$(CONFIG_TEST_UUID) += test_uuid.o
>  obj-$(CONFIG_TEST_XARRAY) += test_xarray.o
>  obj-$(CONFIG_TEST_PARMAN) += test_parman.o
>  obj-$(CONFIG_TEST_KMOD) += test_kmod.o
> @@ -342,5 +341,6 @@ obj-$(CONFIG_PLDMFW) += pldmfw/
>  obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
>  obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
>  obj-$(CONFIG_BITS_TEST) += test_bits.o
> +obj-$(CONFIG_UUID_KUNIT_TEST) += uuid_kunit.o
>  
>  obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
> diff --git a/lib/test_uuid.c b/lib/uuid_kunit.c
> similarity index 48%
> rename from lib/test_uuid.c
> rename to lib/uuid_kunit.c
> index cd819c397dc7..f7f219ddecc2 100644
> --- a/lib/test_uuid.c
> +++ b/lib/uuid_kunit.c
> @@ -3,6 +3,7 @@
>   */
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <kunit/test.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -39,95 +40,56 @@ static const char * const test_uuid_wrong_data[] = {
>  	"0cb4ddff-a545-4401-9d06-688af53e",	/* not enough data */
>  };
>  
> -static unsigned total_tests __initdata;
> -static unsigned failed_tests __initdata;
> -
> -static void __init test_uuid_failed(const char *prefix, bool wrong, bool be,
> -				    const char *data, const char *actual)
> -{
> -	pr_err("%s test #%u %s %s data: '%s'\n",
> -	       prefix,
> -	       total_tests,
> -	       wrong ? "passed on wrong" : "failed on",
> -	       be ? "BE" : "LE",
> -	       data);
> -	if (actual && *actual)
> -		pr_err("%s test #%u actual data: '%s'\n",
> -		       prefix,
> -		       total_tests,
> -		       actual);
> -	failed_tests++;
> -}
> -


I have removed the above test_uuid_failed function while converting to KUnit, as mentioned earlier. Is this required?

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
