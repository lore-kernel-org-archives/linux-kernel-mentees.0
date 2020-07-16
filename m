Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA89C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 02:34:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2798207BC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 02:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iBaOVvOB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2798207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7156089D97;
	Thu, 16 Jul 2020 02:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMqyN2ybVzKv; Thu, 16 Jul 2020 02:34:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF57F89D9E;
	Thu, 16 Jul 2020 02:34:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE054C0891;
	Thu, 16 Jul 2020 02:34:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0120C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 02:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E622089D9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 02:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZq+8gmjpVTM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 02:34:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6E70489D97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 02:34:08 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u185so2993080pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 19:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OBHFrLP+zznPw6dlb+xXG2h+uzB263gsWgoLrOM5A/U=;
 b=iBaOVvOBp/8cpWJBRzkHXXsvpirEoq1CjGUnb1KIpi1G+rcRPDkFLIFlGBCVL54pKM
 s7xII+/8u3NGU8VPmuhB1E288OtTD10FzrwznllqHJ7H13zf+muLeTiFCh3hmbfAJ7bU
 rkAfVlG5pbOycj9rqP2MwkqPEtLXoqGt4BkMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OBHFrLP+zznPw6dlb+xXG2h+uzB263gsWgoLrOM5A/U=;
 b=bDfwSI6l99trXLV9VPGT7Y1+CvDOWt8tGpo7BVUxHrgojkb8X7StqYOdvpWWUq4ry/
 m7GdFf6SjxyF4/FcxSL8rsrAqkRgHjC14u0x9MaiqKt5d19dhH+AgZ+A0aNL1GWRGalu
 masJHB21XEEpnvWMPsMCnravzb6PFT4553KL5KqQqQICPweyOOXV900MQz3MqKXVZVlr
 e2vvqDlw5eWnEN2qvZHB8Tw91yvxRR/ulzUaSHZCJkQ5Wh0pJYLIZuF6hjQiTy/tqa4N
 RYKk9i/Otd/xVPJhP49+k9pigH3JXYznmTk7Of3RuCbzEuNh5jSzUmK3FNZsjgGIH2Og
 HW7w==
X-Gm-Message-State: AOAM532vGJUZ2yfEdP5e3DY5JzLkiCnEisa5vkakOeEJh7X420/THWLl
 ORcU1qNsPPDVQG2mJ5c/0Nsx7Q==
X-Google-Smtp-Source: ABdhPJwT2W5XcXGiXUbSxWDU3H1XbGT7OIjiB+N9Wb/ir/tyFHQzD+xKtJnodqbNxpjPU8gbPlwKtA==
X-Received: by 2002:aa7:8597:: with SMTP id w23mr1732977pfn.219.1594866848006; 
 Wed, 15 Jul 2020 19:34:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c139sm3047867pfb.65.2020.07.15.19.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 19:34:07 -0700 (PDT)
Date: Wed, 15 Jul 2020 19:34:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <202007151929.7A4E04E@keescook>
References: <20200715031120.1002016-1-vitor@massaru.org>
 <20200715031120.1002016-4-vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715031120.1002016-4-vitor@massaru.org>
Cc: linux-kselftest@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, davidgow@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [RFC 3/3] lib: Convert test_user_copy to
	KUnit test
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

On Wed, Jul 15, 2020 at 12:11:20AM -0300, Vitor Massaru Iha wrote:
> This adds the conversion of the runtime tests of test_user_copy fuctions,
> from `lib/test_user_copy.c`to KUnit tests.
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> [...]
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/vmalloc.h>
> +#include <kunit/test.h>
>  
>  /*
>   * Several 32-bit architectures support 64-bit {get,put}_user() calls.
> @@ -31,26 +32,16 @@
>  # define TEST_U64
>  #endif
>  
> -#define test(condition, msg, ...)					\
> -({									\
> -	int cond = (condition);						\
> -	if (cond)							\
> -		pr_warn("[%d] " msg "\n", __LINE__, ##__VA_ARGS__);	\
> -	cond;								\
> -})
> -
>  static bool is_zeroed(void *from, size_t size)
>  {
>  	return memchr_inv(from, 0x0, size) == NULL;
>  }
>  
> -static int test_check_nonzero_user(char *kmem, char __user *umem, size_t size)
> +static void test_check_nonzero_user(struct kunit *test, char *kmem, char __user *umem, size_t size)
>  {
> -	int ret = 0;
>  	size_t start, end, i, zero_start, zero_end;
>  
> -	if (test(size < 2 * PAGE_SIZE, "buffer too small"))
> -		return -EINVAL;
> +	KUNIT_EXPECT_FALSE_MSG(test, size < 2 * PAGE_SIZE, "buffer too small");

I think this could be a much smaller diff if you just replaced the
"test" macro:

#define test(condition, msg, ...)					\
({									\
	int cond = !!(condition);					\
	KUNIT_EXPECT_FALSE_MSG(kunit_context, cond, msg, ##__VA_ARGS__);\
	cond;								\
})

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
