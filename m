Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC494F30CF
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 21:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718154; cv=none; b=FmVr8rVJ4tI9QthNovw9s8h1ciJUx/LwBkkxrE+BIZDtWFSwxojOMZGZJDE5PKxjsLGOl5uiUXaIMoxv4vmJS77aSkbTewa0Ze/oSVwSgPBQg8yGw6oAqSk718bSxixspwxQU+qqNmASoypXLHVg7Es5s1kTq4E9TmouEGGnbZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718154; c=relaxed/simple;
	bh=vAh0olsRx5ABWuvRNHU1s7TXHPVpxAOLHBxwtRzERqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcnaAXemj0YMbKPzaP8z/Ocb2PPBNAMJ0NH6danNsFQKU+09T8iy1ZcYCXZmYXALci85v2k3Xu/gCoqhFnxo7z7Kx2qPI4pCK4Y8KCVtg0tOuKl2kQ26crBATaqPXYYfoF4wH6/o2Ge7PP0xHIzZKf+g63Tt9aTSPFNJpKU9R7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=UlxPJdxW; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="UlxPJdxW"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e22e123350so15070765ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 14:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790718149; x=1791322949; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6oioSubLVdAHgriYty5R95qbHjT0ztj+ARCI8yRsl/I=;
        b=UlxPJdxWzpf1dWqFXJyl9i7oZIHbNZVSyXxh34hNxmpKXx/9Bw2koLUGUP4GybnWJ8
         3mSanJJS/taU/8oedC9aNdfO03hQVagyuW2PqvW6ktk4aOxwDDwAq7SBzhYdFDtir/hk
         s4yiFEKLtu1KdckfxNhUKOC/jn83ohnKdeK+WdrypYL3LjsfXP+lbuX3V3GGEaaYbZtA
         jwlN9THFvnZfiT5I21I1N6TNuGoUqAcZVz33IU+yGbs+IPQO377NRBjXCki6xxe8Ew2o
         ZQFW3uauwlRD/H9zJTUnHror8XNJFY6iK5Qm+AuGJ7wcMrzQZH7JKudUPjU+uhBOzZX/
         NowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718149; x=1791322949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6oioSubLVdAHgriYty5R95qbHjT0ztj+ARCI8yRsl/I=;
        b=GZQSfOussGpNcNmLxyDNZ0RSS/LJiC0ttUxIvWM4jtwuKIque6fvcFWglNSKG52IBg
         6jV+VVh6JX/JxWURAgT6pYM9DGl14An07bCOrVutRGmx/xdsUXU+aFTsQLLfvFFDKCLc
         nePyDzi37+95rvLYyUbq1qx/+QjRQ3LokX50GP0/s8VrMRw2kvhxim+ietYWAlsCMUEG
         oVXmflp3EhHms641gNBlf5jW43y6epT9cE0iP2/xuv+b5yvSDH9fGcyJ2U4VAI/yQPO9
         hB/M4bDH+m4ghwgn6SFXaytbnPnn5oBiwQT46JGov7ZFqk1AmJYKUslWiRy2M2ZMVoEZ
         BOtg==
X-Forwarded-Encrypted: i=1; AKwUvBzlYo+aAs6+LCLGBAvsCXm9A08w0SnZ/2LgtBXjylcdpNeAH9T7tU7XjUqePj5Kesgef3h3hJ3L4buunjUn7CS+vOfzfQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0WdCKZxkJdSL6JzQTlyX64WjzfnmTT6Xn+EtiAomfRC+Z67hn
	1T172K9ZgfwJrILumdtnd+vw4Doo5+4oFwcTTWCJCvYaJUepi0IEQy31vGV/tQkrf2E=
X-Gm-Gg: AYBFou3MQslIQBupTm5vEJq0N0N8nY2HhR0sYN4VKy8DsYJZTyDDiAeAq4EuzK0Ahey
	ixCTIISNKuAuCjCl+n7IILWuatWW3C1tWZA1mjxGdJYFNgTyNMA3/g3F/uJb463sL7teUzj3E9e
	nK07q8GXhOFY4v2QoCZJc6eLktDDVx949LvxzjlyaXnQ/FgTVIOq6afhwGK9FaHxiD7Jn7pfUuv
	R1LuYfQUIBhc2GAkh/+t66oQ2sNcbEoempQ+Uz4HgSCgiZBVeo2eXx1njjjGKKhzy9XW5UY6BfJ
	iO5olzMT3v+wagVYKRuKEWmDoDCat9G1NP1Q91OTh7smsKl80VSRGVB/yoNxViIG4Ch+EoltM9+
	eXnIrUBl/OnhQ0l/AnAsAWjNwHhbZMgyFbqvLbaJKWr/hNTwrXeqGAZpsim1fEfQp/jc9manboI
	XjW127z2zktjsiDMrMZkXhUo7vRzJrbfV9PYbye+D9tltDqxs/ljYwID5TmcT/GYijbAhJdiDC6
	r/eUVRUdumm
X-Received: by 2002:a17:903:8c3:b0:2df:9d04:403b with SMTP id d9443c01a7336-2e2de5447d3mr2955125ad.32.1790718148606;
        Tue, 29 Sep 2026 14:42:28 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dda537f7sm1327195ad.47.2026.09.29.14.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:42:28 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:42:27 -0700
From: Joe Damato <joe@dama.to>
To: Ayush Yaduvanshi <ayush37735@gmail.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net-next] sfc: fix kernel-doc description for
 efx_ptp_timeset
Message-ID: <arwww1y7uMnBmh2B@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Ayush Yaduvanshi <ayush37735@gmail.com>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
References: <20260929094211.48125-1-ayush37735@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929094211.48125-1-ayush37735@gmail.com>

On Tue, Sep 29, 2026 at 03:12:11PM +0530, Ayush Yaduvanshi wrote:
> Remove excess @valid struct member description from
> 
> efx_ptp_timeset.
> 
> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
> ---
>  drivers/net/ethernet/sfc/ptp.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Joe Damato <joe@dama.to>
