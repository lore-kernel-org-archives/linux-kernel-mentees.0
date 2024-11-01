Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D21E2609
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730494902; cv=none; b=Ty/Q2MN8GSRQZ7b6zJLyGfR1+WHZTlBfZdXxGRJDhaXVNgna+JrGXEoJMEcs6cySGUvd+DGUms47thybfpFtDCFSyPj9lXLtOaou9r6dpMAyOFbUwTqXDurGIVMM37k3d0CrxJbOd246xDsMNmEAdJYL9PMmaxz9zC06d7zrqI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730494902; c=relaxed/simple;
	bh=7WUOsbtapu1VrdSJ94c4nil6RKKgZVcwbVqFxzdBsY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjEpNc8T+rBvaP0dG43XKJQ5NPfd0ZONpYXfu/jZEfXufaVi5lx9wQEIAGucgxJoyUCu8sqQQw3PTJc5PMeqdTVWN0nrO2W3Mp3B656CjZnUHc+jflNr/qp/f53dC1EPA2iBVXYA0s8Z/gJrLy8H1cYx0RsrtBgszVS69X6b9Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKTlFjyd; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKTlFjyd"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00AE0606A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 21:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15CMRKb6PHfX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Nov 2024 21:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D125B60663
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D125B60663
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bKTlFjyd
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D125B60663
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 21:01:39 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1e63so2677532a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 01 Nov 2024 14:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730494898; x=1731099698; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ULQS1Fh0p2h2tCv5f59FuL6fz9MzVkqUARVb0MPWMFw=;
        b=bKTlFjyd0pYgJLSznFfB2sQRwHMCWaY3POdCJi2P1La9XCKd25wicByzsZ4p89UjWc
         ac7uT7vS0l4rsjR3tTf18JSOVcpoaNhxKP8oTfV2S8KVhzmVm+azltFsALd5wQEcHsKU
         CmRfa9p4yQV0BSUSQ6WZtLw+VR9AA1GrlfnoOYAOYAiCsclqNUfcF2XfkhO7d29NPzqG
         SSqCy9mk2CVoUSU0wN7sAz3uwEIZENdiCdFGNoW6VclxaHrvythMkbRDJa0lUkEltLgG
         x8mkj5vAY2pUEl7j6W5lblmtCOdYboD4aZvcs57QM/84lzBwG/cP6GIwPcJvfmxFxJ/c
         CdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730494898; x=1731099698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULQS1Fh0p2h2tCv5f59FuL6fz9MzVkqUARVb0MPWMFw=;
        b=ToV12d58pxpoiZv8wDENKAwa9Q3g94lKIlZongOwMbo6e3QwmBpNteAvCFiV6vmVIh
         y6RmoK+zDW7AYXlquRwmr1w6IYCBDdjQWtKGkS1mgiiQXKpJ5fq5uY7qR13mEjkIjoi5
         LCGeJUUR9m6vZgbTF1UefL1/2fuSP4GDHbIms+KWprYmKFXl0+uhAA0emzl4nudIxMZo
         03sVOKeDyGesY2GXlIC7JOJkhks3OuEOvnULm1YVu0wYOueC3UFN4z3WEDCNhAe1dfdm
         +NoIBGoOmnuJMDkq5A1V2NKBABYqSQA4RlmznGR0Onm5uK56Io+Th33HJjWtwZUV/Q0W
         fuIg==
X-Forwarded-Encrypted: i=1; AJvYcCVX0aRdbXrqTMIcR/v06yj81sHO48te3MgL6Op8pjMR3/ULmJdLeo09uaYcaNAcyg1sVDkV669OiaklthWbOp6DGQ1aiQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxhqifXR7v0Uc2VbMQOUV3SUiQyZ9K3jyZvnAwnBePOpJ62GuMs
	j1LYR3tibZK/5hyVpqcLfJmuMtsP35usfabkB8TMDYDGctgVnhEe
X-Google-Smtp-Source: AGHT+IFEApOF1Lo9/TyFpjCDhKN18ERbosd95+bzaI7jVQFZEZIKNnx9duFu7BhgRLy0vnlUL6vm9g==
X-Received: by 2002:a17:907:8693:b0:a9a:e6:a031 with SMTP id a640c23a62f3a-a9e50ba22d9mr665890566b.59.1730494896037;
        Fri, 01 Nov 2024 14:01:36 -0700 (PDT)
Received: from x13 (185-180-222-125.hosted-by-worldstream.net. [185.180.222.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564e8e6esm229051166b.94.2024.11.01.14.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 14:01:35 -0700 (PDT)
Date: Fri, 1 Nov 2024 17:01:28 -0400
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, brendan.higgins@linux.dev,
	davidgow@google.com, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v3] lib/math: Add int_sqrt test suite
Message-ID: <ZyVBqEgX-z3flsDT@x13>
References: <20241030134355.14294-1-luis.hernandez093@gmail.com>
 <c213dbcb-35de-4afd-9d4b-f42f6a9e3de6@linuxfoundation.org>
 <20241031173941.3487ccbfd7421d81d9b0cb97@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031173941.3487ccbfd7421d81d9b0cb97@linux-foundation.org>

On Thu, Oct 31, 2024 at 05:39:41PM -0700, Andrew Morton wrote:
> > > --- a/lib/math/Makefile
> > > +++ b/lib/math/Makefile
> > > @@ -9,3 +9,4 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
> > >   obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
> > >   obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
> > >   obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
> > > +obj-y  += tests/
> 
> What's this change about?  It seems somewhat unrelated to adding a
> single test.  I mean, there's an unrelated test listed in
> lib/math/tests/Makefile so what change does this patch have upon that
> one?
> 

Hello Andrew, I apologize about the late response. I made this change in
order to try and stay aligned with this previous patch moving all
lib/math/ kunit tests into lib/math/tests/: https://lore.kernel.org/all/20241005222446.10471-1-luis.hernandez093@gmail.com/

From my understanding, kbuild wouldn't pick up the entry if it
was just specified in lib/math/tests/Makefile without a reference to it in
it's parent lib/math/Makefile. I didn't want to this
patch to end up in a situation where it would introduce an explicit
object entry in lib/math/Makefile pointing to 
obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += tests/int_sqrt_kunit.o
as is the case in mainline at the moment: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/math/Makefile?h=v6.12-rc5#n8
This would in a sense introduce a regression in the organization of
the Makefile in lib/math/.

I apologize for not adding the reasoning behind the change in the
original patch.

Best,

Felipe
