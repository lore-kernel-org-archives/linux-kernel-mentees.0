Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223CC3890FD
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Mar 2026 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368162; cv=none; b=OGsEWmvg+vMIP/BXluFGXxhoECTjLfCIuPP/Iar8sZH3A8upvAglutLke3YVGHwv0DIixFoXIkCBqSTGtIDqZG4ibJLv1Yz0Fy9pTrOUPhgwsl1HhFlSV61rNF1NDt1K65PjWO4Z4/wZNSrPRm0t+dDaL29OZ/X3x0NAJW0rYIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368162; c=relaxed/simple;
	bh=hADOC70/M+NEjwt5RZZfzdPDG/oNHiFrBIei/R0sz7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvrdnCNTASxxpSuvlJDKFVHsmc665ksLy5ZYlTjgoQkKch5zTjkeIdNlNYD3KtXTamyiYK1JQCHHSM8PGrXB99kzB2f20k01UdYKzg4TGAFRk4nwQ2B+uhsJmBbhWFxexxx4x5vmN4F7epSLaizD+d8akp4NlJUMRtoQT5If9MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQbXA/AX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQbXA/AX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8298fad2063so2794763b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Mar 2026 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774368160; x=1774972960; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01MTEviaqya1lZ/9VOb5dr7IW5yElkiwRu996//fvBg=;
        b=BQbXA/AXC1hEONNA6Uv6EujonfnqXg0FwrDEWIOUCSKuK6tQRJAiRwSj1ZGKJpuPSl
         qTnu9YcCr/H3Bp1ZsqYqDoJat4m06orF9DZSpW2j8BYSEHI7zXYBYurEWnjSv6LukZgH
         lxtxxSv8PD2RZdpmRpQut0QzTsU2JCjrIKXvr7yiMX3cm5dz6PLyIuWNbnl5arwTKuP2
         DWZPjs/siSuKTOS6ATghYn9omVO0Z4Lymc2+dkiIWK7AtCyHahv4OBKEoJ/9BbeE3eaJ
         KsKEoyz31ELN4yERrr0cJu/cuTlV0dX9lmgfbry60er0wOP/hdnqaG6JYFtdTOjRaGNe
         +K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368160; x=1774972960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01MTEviaqya1lZ/9VOb5dr7IW5yElkiwRu996//fvBg=;
        b=GFIEN0D7eZm1QAyEF8Ngy+nmp5r296uSWP1mb9bMUHkiR1MoSyXyWRQqoaGDZItnH3
         lAk8h9M68KgUIsC0hWCOvwh+DN1DtIsSqQd7VUzFpP7dHHgD+WbY9Y7XYYxCI5RizBg8
         0wyJLaETDG0zVrKSW3/amZ+3FLmsVNHinhB8N6N0o25nuWZ4TILt+ZAEQhMe4mae4ZU7
         Ioz4bDcbJEevYbiqigQ0wmkaccynS5UMRLYHNgGWKo+c8Ir+SHJEt3+TvXPdNhxo8ugF
         dQVmOxJJSg4xcG/HAip4FjbimrLK1BUeIAvA3CAnBL/JPeEhxJJ1HofJfTbLJor0Hxik
         EFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE4VA65HoECHK2PxXY1YtmZGq69JlaYjmDgD6k0T+Xe7PyUw2pxWx8/fR2u/qYOMCZbH3ukNmGPAPljVlqb2K7rmB5/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjy18+AYvtMpPeNZIhchSzcOMxIQf5eofZn7QiLj1z9N6qUXr9
	NdrdUVZu0K/9YKKhDnfmBXMJLbXE5WRkNu0c0Na9B+COdQjI9oinZWgF
X-Gm-Gg: ATEYQzwXOcbog76KL5LhjDHEuPGYVozWFG2o+yshhxjm8ou7m2LM2FqGVclqSweerYt
	doNct00W547fNTvr1402MDffPggql8xeDjAhJBqayyrnJfHFKlX6Ps+75eyQp29FUuu68/ZzpBo
	7uFXH2RJ0ZpcG7RGdWpLsGGAYc/U9kZtmX0W6gIKtjhMiY7OEUz/YQB+WG3nLKhxNRwKyagTQTy
	D3D42LHOvjeAFloDTRvtA5CCE/K0VIyW66Dx/kHiTwqZu2i/7k8E5yyFEfbEjqdeNDCqSrC2Otf
	CpBym8V5Ra97GgiV9CThXK06p4aMXsWB2pDyGE3qKxqRddPX8u+ZqOOTISV++vlwMF35mfw4JBM
	i0mVO6Xsv1VndQ+XvcCSJpezdO1OkyPYxqXkEYhHTFGtkXAAnoJkZpFehcNqrlE7BuQ+i4vyaa1
	01alq2A9zropfY41z0FVddzlA=
X-Received: by 2002:a05:6a00:3017:b0:829:a3ed:9749 with SMTP id d2e1a72fcca58-82c6e100f9dmr120877b3a.57.1774368160275;
        Tue, 24 Mar 2026 09:02:40 -0700 (PDT)
Received: from inspiron ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c6dd2813esm140015b3a.26.2026.03.24.09.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:02:39 -0700 (PDT)
Date: Tue, 24 Mar 2026 21:32:29 +0530
From: Prithvi <activprithvi@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	lukagejak5@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <20260324160229.f46h25ebd2mxcfiq@inspiron>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
 <20260324135551.grth7jfjyoh5krzr@inspiron>
 <acKaP0Jz-VqfmEqj@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKaP0Jz-VqfmEqj@ashevche-desk.local>

On Tue, Mar 24, 2026 at 04:05:51PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 24, 2026 at 07:25:51PM +0530, Prithvi wrote:
> > Sure. Also can you please guide if any testing would be required for these 
> > changes, or I can directly send the v3 patch?
> 
> It's implied that the author of the patch each time before submission (either
> a new version of the existing patch or a new patch in general) is tested and
> validated it.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Understood. I agree that patch must be tested and validated every time.

To be transparent, I do not have access to the physical Realtek hardware, 
so I am unable to perform runtime testing. However, for this v3, I have 
performed compile testing and ensured that the module builds correctly. 
Will this be acceptable for this patch?

Best Regards,
Prithvi
