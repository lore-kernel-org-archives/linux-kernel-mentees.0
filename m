Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AE525B68F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Feb 2025 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209983; cv=none; b=Vq/URMizw2LTMX2xMgjPLD/GqlBKIQ7gwV8FIbDoNs1ubneesL0RbtajCfjrLby4pcXhiD1iVE8gHuojulsUmx1n4V/G5iw2K+BoVbXeNcBc4hzr+U7LERcuEWerJy5bXtuT+5zo8ebBXzzdjq/H+RjsA4b2iwelFODct5pXQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209983; c=relaxed/simple;
	bh=3XYMsF/JltYobm5fpigCYAMzJ/N6sXTC9v0QKmfknNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f1hKoxRS8xASACcYUOrMDQboclaGX5Nzvx648olHpHHnHGguzAC8k4f7IoBdiHSVyfkl7fgD3D05pIK87mKukVQdGd5Er5BXNsEe4L8jH6xYR7Op1c5ghlmyLZAlLVKkgdnN7IuhWkYpQil2jt1YX2/3n1e8AE/SVNaExXkQYM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=r1zK9/oR; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="r1zK9/oR"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD57880E4A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Feb 2025 17:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XelWgz0kYd53 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2025 17:53:01 +0000 (UTC)
X-Greylist: delayed 341 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 10 Feb 2025 17:53:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEC3080C28
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC3080C28
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=r1zK9/oR
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EEC3080C28
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Feb 2025 17:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 246A7411A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739209632; bh=usCSxGFJFpJfYhpfqyEEgAs8nuXlxyQs97pnBTa6Pmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r1zK9/oRJPorE3jiKrSIuTe6/+g4nPKkjFDco4pbk2pYf21qOObqJaV87YXQRW8Ov
	 ToEMWtHcPXOVyAhdRjApStSk3OjGXOQ77XRzUbXUO+jlURaykhcmqYCYtEg9z30mrl
	 Vb6g84UPdL4ZPX428ABdNkTGIkaQb4mzHbBMVjMf51Uo6dYj7TMo4wMLVX6sHkeyXn
	 N2VvER/RqelNs+BKYaSXbuHd5QnnmRds2kx/D4JsJ9bhifMzI6rMcAvtL+1jd3Lzo2
	 hbpZpq+RTC87wzKgnK1l/xifpLWPIIj3wmlCiWOYSwSNvuaCB97xkB9E2ZDUWfg3uR
	 J0hYWZzNEUCRA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 246A7411A1;
	Mon, 10 Feb 2025 17:47:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: ritvikfoss@gmail.com
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] documentation/filesystems: fix spelling mistakes
In-Reply-To: <20250210043937.30952-1-ritvikfoss@gmail.com>
References: <20250210043937.30952-1-ritvikfoss@gmail.com>
Date: Mon, 10 Feb 2025 10:47:11 -0700
Message-ID: <87frkl1ylc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

ritvikfoss@gmail.com writes:

> From: Ritvik Gupta <ritvikfoss@gmail.com>
>
> Corrected the following spelling mistakes,
> based on the suggestions by codespell:
>
> 1. Optionaly   -> Optionally
> 2. prefereable -> preferable
> 3. peformance  -> performance
> 4. ontext      -> context
> 5. failuer     -> failure
> 6. poiners     -> pointers
> 7. realtively  -> relatively
> 8. uptream     -> upstream
>
> Thanks for your time!
> Regards Ritvik
>
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
> ---
>  Documentation/filesystems/9p.rst                              | 2 +-
>  Documentation/filesystems/bcachefs/SubmittingPatches.rst      | 4 ++--
>  Documentation/filesystems/coda.rst                            | 2 +-
>  Documentation/filesystems/debugfs.rst                         | 2 +-
>  Documentation/filesystems/netfs_library.rst                   | 2 +-
>  Documentation/filesystems/xfs/xfs-delayed-logging-design.rst  | 2 +-
>  .../filesystems/xfs/xfs-maintainer-entry-profile.rst          | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)

I've applied this, but ... for future reference ...

- As Randy noted, the "thanks" message doesn't belong in the changelog;
  I took it out.

- It's not really necessary to list every word you've fixed; "fix some
  misspellings" is sufficient.  I left those in though :)

- This patch did not apply to docs-next - the bcachefs file you change
  only showed up in the mainline yesterday.  I pulled docs-next forward
  to -rc2 to avoid making you redo it, but it's better not to make
  maintainers do that in general.  The proper approach, which would have
  been needed for a more involved change, would have been to send that
  fix to the bcachefs maintainer instead to go through his tree.

Thanks,

jon
