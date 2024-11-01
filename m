Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393C415AF6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 00:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730421591; cv=none; b=fNfO0ai41CmKXrpFdefiaRHn1b/jd4FUsJvnFEpoZuIAACx6/4PuYQGNNp58QUo2Uyq1EbPH/auTSt+uj0Hi3q8qIwr0N+RHWLU+Et+nbs1d8ZOglGiTzZzj6WBAKU0eN05ibyZuvmL5ecOSD9F0SrboH++Fu8YthHEd2H7AmzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730421591; c=relaxed/simple;
	bh=CO96cJqEyqfErHIWmZZC2b6hCDnPOpFxc1rfqRsUVNs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qm8Zxup/KCLU5RQuDWx2BeGBL9PGiZnhDSt4zM0jbP8LnCTFHuU+Lu62N9T625Je67mxjLEn5UavFGw2F7RPBeIsLSvoXedn1bgjGUKFg80Z2U3QzLLWUy4Of32Mjof6DZd3iL7hCGvF5JDTK3j6FMNIqW607NuueiRl1zlHuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a1PJxLow; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a1PJxLow"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA882403CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 00:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vcr_9USc2gBq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Nov 2024 00:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC258400B9
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC258400B9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=a1PJxLow
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AC258400B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 00:39:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7D086A4495E;
	Fri,  1 Nov 2024 00:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7966BC4CEC3;
	Fri,  1 Nov 2024 00:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730421582;
	bh=CO96cJqEyqfErHIWmZZC2b6hCDnPOpFxc1rfqRsUVNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a1PJxLowaNXMaXSZWvACsrV3x9dMZ/s/iAtfwjqraHnhZTv6AlDeUt5XuJ+513uZV
	 TTI6e+e3vSzVc4n47ILbgdYrUN5GYR3LVHAUBaDZztPCBqrQ6EdbF6GeTBL2FoJmuj
	 Oqh68wzFnJSWAclQpOCm+8Tiv3bSgnSfXAwL83Wo=
Date: Thu, 31 Oct 2024 17:39:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
 brendan.higgins@linux.dev, davidgow@google.com,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 ricardo@marliere.net, linux-kernel-mentees@lists.linuxfoundation.org,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v3] lib/math: Add int_sqrt test suite
Message-Id: <20241031173941.3487ccbfd7421d81d9b0cb97@linux-foundation.org>
In-Reply-To: <c213dbcb-35de-4afd-9d4b-f42f6a9e3de6@linuxfoundation.org>
References: <20241030134355.14294-1-luis.hernandez093@gmail.com>
	<c213dbcb-35de-4afd-9d4b-f42f6a9e3de6@linuxfoundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 31 Oct 2024 11:50:16 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:

> On 10/30/24 07:43, Luis Felipe Hernandez wrote:
> > Adds test suite for integer based square root function.
> > 
> > The test suite is designed to verify the correctness of the int_sqrt()
> > math library function.
> > 
> > Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> > ---
> > Changes in v2
> >    - Add new line at the end of int_sqrt_kunit.c
> >    - Add explicit header includes for MODULE_* macros, strscpy, and ULONG_MAX
> > 
> > Changes in v3
> >    - Remove unnecesary new line after Kconfig entry for INT_SQRT_KUNIT_TEST
> >    - Correct int_sqrt instances with int_sqrt() in commit message and kconfig
> > entry desc
> >    - Fix limits.h header include path
> 
> Adding Andrew to the thread.

Thanks.

> I think this depends on the other lib kunit
> content that is already in next.

Actually the patch applies cleanly to 6.12-rc5.

> > --- a/lib/math/Makefile
> > +++ b/lib/math/Makefile
> > @@ -9,3 +9,4 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
> >   obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
> >   obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
> >   obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
> > +obj-y  += tests/

What's this change about?  It seems somewhat unrelated to adding a
single test.  I mean, there's an unrelated test listed in
lib/math/tests/Makefile so what change does this patch have upon that
one?

