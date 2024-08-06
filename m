Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1014901A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722972871; cv=none; b=t5xpJ+wTT5lkdvPY/k7/U+iJrbyNL4goZnl3sD9ZZ+kDsapuvhulIhVsya24IJOSpnc1O108NqVR4/N3tWNQGMKGIX9+hsu143bTORwoyPQ1M2DjqV1JYiwAu+ePxMfUT4YUxExbR8znzYQpsdfRQl5UhqVZAJbdVIetiEadHLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722972871; c=relaxed/simple;
	bh=eTj0TWL2vBtXKJLs5erh4BI8TewdvBdBvOodO4DPvdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2GTxMUsG23SXdOTtS1RAm1QHRpu99rf3Nzm7QwtUwT8EzFTHLSuLG4R+pFqm5EnF8K3A3C1P5c0381eoSL4yDmjx1of+FhMVsHMdoDUBto4kjbTjWlt41XUB79YtSuIC/vbubAo/TYTkcnX1oCLvhd2f89Y5tiT/3lXUrI+zLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdZFIVKK; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdZFIVKK"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0646540313
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 19:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4V3Xa06F1QW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Aug 2024 19:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kees@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FB6840304
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB6840304
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cdZFIVKK
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0FB6840304
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 19:34:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DCE10CE0CF3;
	Tue,  6 Aug 2024 19:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31499C32786;
	Tue,  6 Aug 2024 19:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722972864;
	bh=eTj0TWL2vBtXKJLs5erh4BI8TewdvBdBvOodO4DPvdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cdZFIVKKbK2oBPjIqsyRyOAMv+cG0btdr+BjgXqKHSZemwNZ8j6GsVHIw8HYxG1Zn
	 ieC81gIMp/VhRc0zHOBi5kUEQC79JTqcTPn29u/lZg71DZpqMThcq3MjvoTIniB6Pj
	 GlSd+L7UL84JgZYDBNs2PUHhpWbC4P9pfLYboUCanJi3Gnl9GgBeNmILPi3xlU0v6i
	 XrWaSy4I79FSiLzsxXwZ9WjJRP2T7QVkcVhAGYavMZhkn+IvsenJGzSV5ydA9nE0JL
	 0bzet8VAJgw+D6XtIGPnciACfAxzWhthRG2xmrOs4lLKSEuwpAE+Y/pNh4ThVH5zbE
	 qmAvQ9pduI+2g==
Date: Tue, 6 Aug 2024 12:34:23 -0700
From: Kees Cook <kees@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Vitor Massaru Iha <vitor@massaru.org>, kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	brendanhiggins@google.com, davidgow@google.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3] lib: Convert test_user_copy to KUnit test
Message-ID: <202408061232.B6382B6DA0@keescook>
References: <20200721174654.72132-1-vitor@massaru.org>
 <a41ab091-42d3-4e03-b0e8-89af354faadc@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a41ab091-42d3-4e03-b0e8-89af354faadc@roeck-us.net>

On Tue, Aug 06, 2024 at 08:48:43AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Tue, Jul 21, 2020 at 02:46:54PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the runtime tests of test_user_copy fuctions,
> > from `lib/test_user_copy.c`to KUnit tests.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> 
> These tests are failing (at least) for arm-v7, loongarch, and mips
> qemu emulations; see below for failure logs.

Oh my. Good thing this got added to KUnit, then -- the core of the tests
haven't actually changed. I will see what I can uncover.

> Any idea if those might be architecture problems, problems with qemu,
> or problems with the test ?

The last two look like NULL derefs (??) and the first seems like maybe a
test problem (the failure looks kind of like the CONFIG_MMU=n cases that
were fixed earlier).

-- 
Kees Cook
