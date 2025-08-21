Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A132EAB89
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 22:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755814460; cv=none; b=VVRXDhnjTs1dzOjmtg7fyMHbch2QV+O7880ERHK8jLyTwEN5xFR4CKVq6Wz8UfOc4S+lw356hoeX1aR/6Vu7ciERu9eT0FFmkKJhLnTJ0EItrM6FjbN+YMvpsQ+IdxMtFHmb9iEVPI2xy7/LYAmQsMUzWFYv47ZNFFCmSSqon7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755814460; c=relaxed/simple;
	bh=S+Trtko+0wRKZhE6JSWDniCh6IfrnPbrR3w4hXx+v6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Myfz/i7Jvsk8irhZZAtvukMH7mButbINg3iukRSoIgBVmeUpoHgfu4aXviUXQ1s4ab1Rg/RyB76DRQRC+vaNE4YamjJA70ePgKE8TezoQ+dGL4Y6pNHlzZhH+XnX4wxXzq01QjhVdxXemfV+rQA4p4TlOTywB2a3Rb5+lkT/2tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=h3P4Sl4U; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="h3P4Sl4U"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A174A403FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 22:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nby77c6YKvgh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 22:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B060403FE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B060403FE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=h3P4Sl4U
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7B060403FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 22:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 53AC540AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755814454; bh=Mi8nBCWTguqPRir2kyPNhtQ3kf1zAQLHtOjWErpNaMw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h3P4Sl4UvlEg5OiJabnH7iF1K4tXUnOeHA1vrIX3dGBFsZqf1IZwfkpzOogYNUmKY
	 fnVVMk3aKcgP1ve9imHvnbsifWaOMFiDinlE8J1Vcc5my1JhcOM8goZgp/Yhx5IQZE
	 M9qW+Ym0d0yiBX1n0yp3u4CydG8sTg/ejzF4kXhS6TXsiHtz7EM95WfmItvyCVclnL
	 phSKGKXAEY8AGOxTzVX+qslBCPM+g4xWSJfJh54lPEuOXR0VUq/y5K8pe1v8UXf6iM
	 5qjFU396HS3t181C9ibg8ONt/JkzUJqWYKzwz2V61+F+R8mOz0xd4LJPrtShD23ngO
	 3JulSAeCmVKwg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::824])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 53AC540AE2;
	Thu, 21 Aug 2025 22:14:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: paulmck@kernel.org
Cc: Nikil Paul S <snikilpaul@gmail.com>, linux-doc@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v4] docs: rcu: Replace multiple dead OLS links in RTFP.txt
In-Reply-To: <972cf9c8-f8a6-4a5a-90a4-696f9a4e0f6d@paulmck-laptop>
References: <20250819180545.3561-2-snikilpaul@gmail.com>
 <87h5y07e6y.fsf@trenco.lwn.net>
 <972cf9c8-f8a6-4a5a-90a4-696f9a4e0f6d@paulmck-laptop>
Date: Thu, 21 Aug 2025 16:14:13 -0600
Message-ID: <877bywqq4q.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Paul E. McKenney" <paulmck@kernel.org> writes:

> On Thu, Aug 21, 2025 at 11:54:45AM -0600, Jonathan Corbet wrote:
>> Nikil Paul S <snikilpaul@gmail.com> writes:
>> 
>> > This patch updates several dead OLS links in RTFP.txt, replacing them
>> > with working copies hosted on kernel.org.
>> >
>> > Originally posted as part of a 2-patch series, this is now being sent
>> > as a standalone v4 patch to avoid confusion.
>> >
>> > Changes since v3:
>> >  - No change in content, only resubmitted as a single patch instead of
>> >    "2/2" from the earlier series.
>> >
>> > Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>
>> > ---
>> >  Documentation/RCU/RTFP.txt | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> So this looks good to me, but it should really be run past the RCU folks
>> (and Paul in particular) as well; adding him to the CC.
>
> I queued this and checked it and it looks good.  By default, I would
> send this during the upcoming merge window.  But if you would rather
> take it:
>
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
>
> Either way, let me know!

It's all yours.

Thanks,

jon
