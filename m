Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60138FA3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730435256; cv=none; b=LQi53cI5QzAhqigi2wjRTB4lJ5kOoRjTAMdwcRcOQ+Vu1cEGwgYYDKPj+WyTcdKdIUXyEHaum7nK+b1GfI0F9BiGuQp2hO2RCwYhoH5A4hsNk8QEJ0DCBUeEaoDJa2q38r4gd/ltp9BCeuepbE1wE/CM/hJ2cJ2lIES7kRQqx4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730435256; c=relaxed/simple;
	bh=hhZoxops4zA8llcUsHMuU1AOkiWSqyAB6cRUDvkzSrQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jHpSbJfBnEZata+8tPPWQvY44j817TZKpBtLVz8GbCRrhPyaTT+E8Vwnl+zE0wxWUfyDG2ZzCwndPhQzbfMW8fWLVlAf2kUmYeVvYzWLnX3FT3wXhYInWiprpH9e85oUeJy1tt95dVsT4a847EnS2t127dS1FM69xB/Vg860UgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gBHSe0EV; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gBHSe0EV"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D429440EF8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 04:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3p7yigRW7dOk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Nov 2024 04:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8E6240F01
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8E6240F01
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gBHSe0EV
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C8E6240F01
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 04:27:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA0B95CB3D0;
	Fri,  1 Nov 2024 04:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481F8C4CECD;
	Fri,  1 Nov 2024 04:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730435250;
	bh=hhZoxops4zA8llcUsHMuU1AOkiWSqyAB6cRUDvkzSrQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gBHSe0EV10cklBjUg5DMrby74bXvhBuH1XlHoexxijs3vQoEUKIgMtWCtQ+EbFgrj
	 uK+EFyyeuEDS5J2LBQBiY/tE7U25bDg9ubCQVuY2EYert9wUQfbbUrgGHnA5eyLX0T
	 P94BrUYfPcA6I3pvamwOMno/t/k9nysz7IsAprfI=
Date: Thu, 31 Oct 2024 21:27:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
 brendan.higgins@linux.dev, davidgow@google.com,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 ricardo@marliere.net, linux-kernel-mentees@lists.linuxfoundation.org,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v3] lib/math: Add int_sqrt test suite
Message-Id: <20241031212729.af140fc927ff8f764448f072@linux-foundation.org>
In-Reply-To: <388a8b6c-1acf-413c-bbf4-3b23156117f8@linuxfoundation.org>
References: <20241030134355.14294-1-luis.hernandez093@gmail.com>
	<c213dbcb-35de-4afd-9d4b-f42f6a9e3de6@linuxfoundation.org>
	<20241031173941.3487ccbfd7421d81d9b0cb97@linux-foundation.org>
	<388a8b6c-1acf-413c-bbf4-3b23156117f8@linuxfoundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 31 Oct 2024 20:25:56 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:

> >>> --- a/lib/math/Makefile
> >>> +++ b/lib/math/Makefile
> >>> @@ -9,3 +9,4 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
> >>>    obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
> >>>    obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
> >>>    obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
> >>> +obj-y  += tests/
> > 
> > What's this change about?  It seems somewhat unrelated to adding a
> > single test.  I mean, there's an unrelated test listed in
> > lib/math/tests/Makefile so what change does this patch have upon that
> > one?
> > 
> 
> I think this is a new test. I can take this for 6.13-rc1
> 
> I thought the conflicts might persist in case you have any 6.13 material
> already in linux-next. Doesn't look like it if you could apply to 6.12-rc5
> 
> Sorry for the confusion.  I can take this for 6.13-rc1

x86_64 allmodconfig:

error: the following would cause module name conflict:
  lib/math/tests/int_pow_kunit.ko
  lib/math/tests/int_pow_kunit.ko

