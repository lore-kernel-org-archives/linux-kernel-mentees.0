Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E8B37179
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BYnUBMxl"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 763A580F66
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 17:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 763A580F66
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=BYnUBMxl
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2FxM2jU1mFu
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 17:20:44 +0000 (UTC)
X-Greylist: delayed 352 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 27 Nov 2023 17:20:44 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4872680F5C
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4872680F5C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 17:20:44 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9C47640E014B;
	Mon, 27 Nov 2023 17:14:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TjHxyBW3GjS7; Mon, 27 Nov 2023 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701105285; bh=1XsCHVs3G1AK8quCu6PRq/dRGJyYh/0vS/L9fgr5Dsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYnUBMxlUm/TeOHT5vbel+mUEYciMKpvvy+i3YEyhxclh1vMaMbB9Wdcrfgn0+Cr+
	 GIKWaOh16XC0T5xDMYAyjF10xt41gjmE4hMY6xzxao5+KbzngfJUuXQzobZDxr0SS3
	 R7YIYl8jGA+haI1u/73qjzSrfRQm+PCqOKnmwGrmZdCYpkENE/by7jpVjJYBqAeUlz
	 QtIs88mTZvYi7uE/oMoM/8xaZmCf4Nk2KzokmUhX7kCQOqD2P43jNGEtNV/MsWy4qA
	 EOyYJhLmgKNgvzl86irhK8LEDW1xi0f84Q3huE5tSN4WZhbKrH1Zi05fyhOoFva0L6
	 y7vGf2RDhrV2SRxhVPTmnMFI/235COquRZeyX/piq3v/ughSaGrvViR0oX/gO+dKE1
	 wQgt8I9CZADCeSsv+1gCPT1zxQErPcA0nsfqD+Wl94yxknBrBl/rnkhCE+Tz/3xoTf
	 +qJ27ibC2ldTHPbR1NckGyOSile12D0Dxx38HipK+75l14qJ2CxFVTy0bAXTaMiyn4
	 qKJswJarSLRRalEwOjHZs1cgHBzKcOI1MBSe3/lWorYuVnRf2J6Nj1KdGUphYMxs2M
	 mpv0w9U4kgcVFHtNfsSJqOzcSqSSW2a1rADflw2Go9zmbIqORCExdBVhXXytbJjRn5
	 87FeZVC+5BF6ZSqdTDwErw68=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A9BC740E0031;
	Mon, 27 Nov 2023 17:14:36 +0000 (UTC)
Date: Mon, 27 Nov 2023 18:14:35 +0100
From: Borislav Petkov <bp@alien8.de>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Cc: tony.luck@intel.com, qiuxu.zhuo@intel.com, james.morse@arm.com,
	mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] driver : edac : Fix warning using plain integer as NULL
Message-ID: <20231127171435.GCZWTOe+DQSy4kkuKO@fat_crate.local>
References: <20231109212157.1454726-1-singhabhinav9051571833@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231109212157.1454726-1-singhabhinav9051571833@gmail.com>

On Fri, Nov 10, 2023 at 02:51:57AM +0530, Abhinav Singh wrote:
> Sparse static analysis tools generate a warning with this message
> "Using plain integer as NULL pointer". In this case this warning is
> being shown because we are trying to initialize  pointer to NULL using
> integer value 0.

And that is a problem because?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
