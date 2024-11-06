Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEC020CCFE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Nov 2024 21:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730927844; cv=none; b=oRP/fPVsxCjmR+BOJ/J5aEK61EHXk8/WEJwWVs8WMSbsYxwKyUxQOqJCa3MCqnqcTYL3M0f8xFC2028U8Mubvd4yZgGC0NPDmPrxMS1mVXkU8j0w2MpfkhFaH+3FFkWhpUDkHnhSjaCWLbzrlkCFyLmiOkD7B2+wCqUw4LEZTDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730927844; c=relaxed/simple;
	bh=UVIVzkxgnorxFMAYc29bFffedWIX/7PJbZ8MAWTGHHk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eaLlVauGc5l6efdf/Csj7ci+naYedvodz29bfNg2jxEMzzDbDYswU7WyG795tSq0zFiCrD4HZB/nkVFYI6Qz6klO37s2/4tBsWqquJIaf4F7Zc5v2UNaPZ4BGdA8QpTbIY72+dJKvYNy7n6UkWF4DFZnpBwPLiCcozSjttawspQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VCtggFHt; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VCtggFHt"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B8360A9F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Nov 2024 21:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1PC_4O_Mo0B for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Nov 2024 21:17:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2ADE860A5D
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ADE860A5D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=VCtggFHt
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2ADE860A5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Nov 2024 21:17:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97F82A444BF;
	Wed,  6 Nov 2024 21:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2FFC4CED0;
	Wed,  6 Nov 2024 21:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730927840;
	bh=UVIVzkxgnorxFMAYc29bFffedWIX/7PJbZ8MAWTGHHk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VCtggFHtCZJcnKvaL5gL67E9uejc+5iNSlBQMidKQzvPnqyI2/yN4GWvT5JzfsyOK
	 xA4X+UGM4DLOMeP0V7IEuK+qJX7KAUZBfjP8gApyYN9rxWY/TADf6n9xgqQ/vmbnfr
	 hW7g+Xfeh9/vGiHCpF1jbztKwOmDkYmug/9uOXnA=
Date: Wed, 6 Nov 2024 13:17:18 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>, Rae Moar <rmoar@google.com>,
 Kees Cook <kees@kernel.org>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, Stephen Rothwell
 <sfr@canb.auug.org.au>, Luis Felipe Hernandez
 <luis.hernandez093@gmail.com>, quic_jjohnson@quicinc.com,
 macro@orcam.me.uk, tpiepho@gmail.com, ricardo@marliere.net,
 linux-kernel-mentees@lists.linuxfoundation.org, Nicolas Pitre
 <npitre@baylibre.com>
Subject: Re: [PATCH 1/6] lib: math: Move kunit tests into tests/ subdir
Message-Id: <20241106131718.e0899c324941f63dc931f0fc@linux-foundation.org>
In-Reply-To: <CAMuHMdVQ-Fmnti80_HoX1+6L8wNUghpuJzqpT_g0SJQG-oq6RQ@mail.gmail.com>
References: <20241011072509.3068328-2-davidgow@google.com>
	<20241011072509.3068328-3-davidgow@google.com>
	<CAMuHMdUdotDYAgSDDrWi-TOj2o=5a53n452DydhD-Q0fjiGhew@mail.gmail.com>
	<CAMuHMdVQ-Fmnti80_HoX1+6L8wNUghpuJzqpT_g0SJQG-oq6RQ@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Nov 2024 09:33:55 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi all,
> > This conflicts with "[PATCH] m68k: defconfig: Update defconfigs for
> > v6.12-rc1"[1].  Of course the proper way forward would be to add
> > "default KUNIT_ALL_TESTS" to all tests that still lack it, so I can
> > just never queue that patch ;-)
> 
> What's the status of this series? I am asking because I am wondering if
> I should queue [1] for v6.13, or just drop it, and send a patch to add
> "default KUNIT_ALL_TESTS" instead.
> 
> I saw the email from Andrew stating he applied it to his tree[2],
> but that seems to have been dropped silently, and never made it into
> linux-next?

Yes, sorry.  Believe it or not, I do try to avoid spraying out too many
emails.  David will recall better than I, but things got messy. 
https://lkml.kernel.org/r/20241009162719.0adaea37@canb.auug.org.au was
perhaps the cause.

I'm sure David can being us up to date.

