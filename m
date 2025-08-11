Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646F204588
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921249; cv=none; b=ijItZ/fJ4u+jmipkLNLHxL0EAuTEdcvb5dDm8MwM1GbQGwRslfHHzoF56ZWocuSRcfk5QtV71wXHj8M2QLxg92AaPE4QS2aoE/rjVIT1eCOdiCy6I84JbuNZNqaUChFGlJe5EVcpXUASsCvyemrw1cE9D3zVR8de7l5eWVwZOMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921249; c=relaxed/simple;
	bh=ceTF8rjnTlYm/3/Qvq10xdLBOEw2lohf+h2xKXsPNes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q9up0cBNLu/UJLWRrsmqGX0K5s5BqF7KI99AvWpBBQn/hf61q9ekA1iuQXyGumqgjKGodoPuYDYVwk7xl2SeFVZ66sCdlfG/N4fjPyZh3ZXaW0bIolSj2W7SOYjMSFkNRdPN8AzXVgLGbben8R5qd5sFe+nzK0xDAtOFTjZsRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=m+W4EZ/l; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="m+W4EZ/l"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C1F4540AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1754921240; bh=0+326FrtFy36rJekkvTDfG5k2SsVWQcX2jPtW1JbyS0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m+W4EZ/lbiscbulKhVxevtMaqjs/GhuCfROrQugUKLxpT8SOG8fJAxRr7Mf+ZWer9
	 fsbKFq4Xd21ZVFtlnIMhUEz+PJPVkb34hzqfkRlKbz8vDll9jMcBrCIFJI7UehIFBM
	 4x9l0wF8wiZ1BqmdA41KJvWtjQSb1GdSuCWnVukrVs7J65aHVfaSLC93wcpfrmy1Kp
	 6v6/dOLECEPc/aIlwstP8lAjJmrQ879wr+CGn5OQ3UskPogWAWt7nCwRyIEyxlzHy3
	 Jh05af4bSnbw0l1Q550lzpOj8BEMJVw/wLnez7m2Vx9XV4hWE9qrKjQxhO9bvHtvHt
	 UA02bYtgn0YSw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C1F4540AB4;
	Mon, 11 Aug 2025 14:07:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nikil <snikilpaul@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Nikil <snikilpaul@gmail.com>
Subject: Re: [PATCH] docs: timers: Update dead OLS link in timekeeping docs
In-Reply-To: <20250811034717.6100-1-snikilpaul@gmail.com>
References: <20250811034717.6100-1-snikilpaul@gmail.com>
Date: Mon, 11 Aug 2025 08:07:19 -0600
Message-ID: <878qjqgdew.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nikil <snikilpaul@gmail.com> writes:

> ---
>  Documentation/timers/highres.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/timers/highres.rst b/Documentation/timers/highres.rst
> index bde5eb7e5c9e..24dcc32f8dcc 100644
> --- a/Documentation/timers/highres.rst
> +++ b/Documentation/timers/highres.rst
> @@ -58,7 +58,7 @@ merged into the 2.6.18 kernel.
>  Further information about the Generic Time Of Day framework is available in the
>  OLS 2005 Proceedings Volume 1:
>  
> -	http://www.linuxsymposium.org/2005/linuxsymposium_procv1.pdf
> +	https://www.kernel.org/doc/ols/2005/ols2005v1-pages-227-240.pdf
>  

This is a worthy fix, but please provide a proper changelog and signoff
line.

Thanks,

jon
