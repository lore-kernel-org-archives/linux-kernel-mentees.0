Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F9BC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 16:42:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74D12065E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 16:42:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="l4b5Hqho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74D12065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 573B1876A1;
	Thu, 16 Jul 2020 16:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgNook94h0kW; Thu, 16 Jul 2020 16:42:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C445487694;
	Thu, 16 Jul 2020 16:42:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C032EC07FF;
	Thu, 16 Jul 2020 16:42:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 030DFC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E16972039E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RzgjmQ0HwSe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:42:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 419D82038A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:42:25 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id el4so2970944qvb.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=LMlqxALUY61jlVk3BUiDy9VLg6DTugrK02O4xaMAXeE=;
 b=l4b5Hqho974uh2PmbRJzJutQgFImeAJVlHlLkooGLhdZe1nS7mvf+x6gt/QOZw/qL9
 A84pVZc5FD32JGLt4LlnzFB06rz+hmPXLaI8hDe2fLxz/921s2jVMy4thipSXuNctzI7
 HkMqqpSinh/agWeAyLOt/K2QJIn1uTWJuHTPMTVpaO76a66+rxTTbLjEM8mQcObpOs2+
 8BUxyfhfHcFtYnPUbTfLKKZrZtVMp7BOCDW5a6netEOHL7Wv1pCOt9WjfJdZ1HyHyp9F
 K/0MQrVQdEzKi3vmuBUuhAa8yjbOADZqvUk0N5rSn5dQnSeMoHx9kweWpQy1527gH79c
 KhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=LMlqxALUY61jlVk3BUiDy9VLg6DTugrK02O4xaMAXeE=;
 b=QhyHDiI6ld193WHynBgX5LgpraImC4Xq/j2pfoJQh5CVqjTdM3j9UQEYNisgLImtWZ
 +79XgrA03579JMoVZCuUYtsBECRLibx4TDT2XdqlffAHUGoOf3DscP2pKdL6RQpqH3Yt
 q+EBdxWBbFLcHSM+Q0a6AbtugqUPOgdVWtFbJxBMQbYAheppkdN73kNVUoCpvughE9b2
 QnAKpyblHsthlTFh4d1gTTm3LKLtSNiwPHe9S5O8fbVzk06F0xt+DTOUtMrc89n/jd1j
 5DUxZcZGv2TBHpcxTqs9T8O2iRM/j3xrE4YoKyhi6lCRIGP3V6NT0cw55nufXDYIoXDr
 1ecw==
X-Gm-Message-State: AOAM530f1HaEFfhwbiV4+C0XPbhWZIQhiF3FbHXIgUkefMeGRvemrIPW
 mkfuav+Ctwym20tOhh0G90kznA==
X-Google-Smtp-Source: ABdhPJw8zMN/1FPYzX107TEkRXoQDL7PDsO3bU5e/CmgTIDO5o48Z06Nsfr79DuiczClK4visvbI1A==
X-Received: by 2002:a0c:dc07:: with SMTP id s7mr5275693qvk.122.1594917744190; 
 Thu, 16 Jul 2020 09:42:24 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id u68sm8060659qkd.59.2020.07.16.09.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 09:42:23 -0700 (PDT)
Message-ID: <b3703bfd299c4156e44e5887dcc47e7dcc88dae7.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Kees Cook <keescook@chromium.org>
Date: Thu, 16 Jul 2020 13:42:20 -0300
In-Reply-To: <202007151929.7A4E04E@keescook>
References: <20200715031120.1002016-1-vitor@massaru.org>
 <20200715031120.1002016-4-vitor@massaru.org>
 <202007151929.7A4E04E@keescook>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
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

On Wed, 2020-07-15 at 19:34 -0700, Kees Cook wrote:
> On Wed, Jul 15, 2020 at 12:11:20AM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the runtime tests of test_user_copy
> > fuctions,
> > from `lib/test_user_copy.c`to KUnit tests.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > [...]
> > @@ -16,6 +16,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/vmalloc.h>
> > +#include <kunit/test.h>
> >  
> >  /*
> >   * Several 32-bit architectures support 64-bit {get,put}_user()
> > calls.
> > @@ -31,26 +32,16 @@
> >  # define TEST_U64
> >  #endif
> >  
> > -#define test(condition, msg, ...)					
> > \
> > -({									
> > \
> > -	int cond = (condition);						
> > \
> > -	if (cond)							\
> > -		pr_warn("[%d] " msg "\n", __LINE__, ##__VA_ARGS__);	\
> > -	cond;								
> > \
> > -})
> > -
> >  static bool is_zeroed(void *from, size_t size)
> >  {
> >  	return memchr_inv(from, 0x0, size) == NULL;
> >  }
> >  
> > -static int test_check_nonzero_user(char *kmem, char __user *umem,
> > size_t size)
> > +static void test_check_nonzero_user(struct kunit *test, char
> > *kmem, char __user *umem, size_t size)
> >  {
> > -	int ret = 0;
> >  	size_t start, end, i, zero_start, zero_end;
> >  
> > -	if (test(size < 2 * PAGE_SIZE, "buffer too small"))
> > -		return -EINVAL;
> > +	KUNIT_EXPECT_FALSE_MSG(test, size < 2 * PAGE_SIZE, "buffer too
> > small");
> 
> I think this could be a much smaller diff if you just replaced the
> "test" macro:
> 
> #define test(condition, msg, ...)					
> \
> ({									
> \
> 	int cond = !!(condition);					\
> 	KUNIT_EXPECT_FALSE_MSG(kunit_context, cond, msg,
> ##__VA_ARGS__);\
> 	cond;								
> \
> })
> 

Sure, I'll do it.

Thanks.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
