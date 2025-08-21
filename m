Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8282E4274
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797405; cv=none; b=SQDYKHhzxGGKux5rh5LlhAi+dnNH5pibv5v2oNrqWKMOsYRKuLvO6NcgAt+GzuF4LDY/RFXUD8PZC7Ia0I4li3H53YyRww8kYraH9qAyLlKPNS+Ap06b0Rfb+l9FkJ1JO560Tc8zuuLZaX+0bFEXaEQoPvOxk80iaT/5dzMFaJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797405; c=relaxed/simple;
	bh=sn1buapRH2ms2tbodlcvPWyrqxckZxxFbAXmOu+7vuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lays0biDqALWDtSzk2H3GQ/ZulHMEYQ1VdpaKbUt4uHdWCffPDgnFNL9EDlwzFbbRZBdOzWU6fnBe3sDNa/EzpKtJPiJni4g0kCV4G4HlaIKV+qyrc4AgFbNK8ouCWAqLlV5LFJ9petMJS6BhikR890dsaSOETvCV00aI/gm2S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fw3iht1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fw3iht1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4D2C4CEEB;
	Thu, 21 Aug 2025 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755797404;
	bh=sn1buapRH2ms2tbodlcvPWyrqxckZxxFbAXmOu+7vuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fw3iht1Nt3iX0t/ofiqm/yG48/Er4G2Mo7E8k44Yzg3mUxOz49SpErOjQt46sddFb
	 MzbfAkzJHzsIxoYIGipdYK68EAtnvbhne/PH2yt7RNxAG9qZgJ1Xah8caURIHAHQL0
	 pbB+Yyn73dG/R5TJ1AI7yKwu8a7IDATQICEQua5M=
Date: Thu, 21 Aug 2025 19:29:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] kselftests: ntb: fix spelling mistakes in ntb_test.sh
Message-ID: <2025082140-untapped-superior-4dc0@gregkh>
References: <20250821164910.2167-1-kerneldev@debanilchowdhury.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821164910.2167-1-kerneldev@debanilchowdhury.com>

On Thu, Aug 21, 2025 at 10:18:57PM +0530, Debanil Chowdhury wrote:
> Signed-off-by: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
> ---
>  tools/testing/selftests/ntb/ntb_test.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I know I can't take patches without any changelog text, but maybe other
maintainers are more lax :)
