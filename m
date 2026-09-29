Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50EE4E50B2
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 21:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718528; cv=none; b=fLq674RUJftRV1YAaEOYXz4YUlH6bZSIy07Hds6ZB0ujFsHk5jdJHT8Dw2cAtgkbs282YGKnxz/FiRwSGEFvevd4MWJ/HrG0CSA48qT5iqJ5ZY3JD99p+9YzVpWSAi47K/tZcblIG1ghN9nRcmJLmmFk83au2eQvB63ky/yVJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718528; c=relaxed/simple;
	bh=jEAlHCaf7HwrBMr2fEr3XlegkapBlO+MtAspedqTvo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2pqkmdNYsuyLR3fFjQqiI29fPkmHzzaru060/AtDw1RhuZstsz8u+lo/U9PVMIo8D8azJpB4oHAe5ApMWxh8+So6rVHwapqwHF20cXSjEVEs1rRm3HzgGxeM/vlagJvwRiGdPdwncPISAuBEs+o0bdOzHyu1A4vEePeEkWg2GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=VGtwie+d; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="VGtwie+d"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868cfc5c244so1537544b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790718524; x=1791323324; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnGR8D9Ofu0keKVSYqoY+bfqxp7ik+ClHNVT61CMuqY=;
        b=VGtwie+doefHPsHv2vrksrH1NCXkDfcJ9aiw4tBclmKBIbk+Ey1/PsGhLrUqxj+K+6
         lKQytDehHDwa09ilmJWJxelI3cq5v4sYB6Iqls0ZyyiXZYt5aaHV1up+6uCLBOXzav6j
         7+evvTAu4MIUt5NOjHl9kOW7VUksZf2HQJs1H988nT4TepLnPQsqSSqH0Ij/KOiIODxP
         M9Fw6LLWFwfY3NJKSMSUHcDKQdd9KIO2xCOSdEJhCJJjfKXdQ6SqvzbYeFmjPysXXB/c
         YOglqr7sMIIo19yThagp+rzdOfDjV1qNr3GtdG+ChAsZuH8pOET3uRs1N62vaMbpM9Md
         lXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718524; x=1791323324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GnGR8D9Ofu0keKVSYqoY+bfqxp7ik+ClHNVT61CMuqY=;
        b=TbCuBZSwelyaPC4UIRJIGr+54+pdIzhOa+qLGepO+1w8m9EKV8uQLlo1yMLfL8kl36
         xSaArHDEP9nUSh62N9q38mqEeMzuW5GwpJbPVro0UZjdbsPmJdE/EgD8AbLa5fgqvNpD
         sqsqlLtsRcJjCBcyfWqsc5lAvxVLxerq6CJpsjZTf2DHVeokc2XZF10XpGQ9XE8Zra8/
         kyIUF6ZM2yUAyjWAgd6vMIl5U5uOCwvkwPiMAKJGc8YhRyQ0bINIpH5xdPDGolROibSD
         lRs5cPSn7Bp1I33WLfyzMXU/qeFleQ/WZUcI7Oom8ZigWcQ8RivP4507twmw9ENjDpfq
         e4ww==
X-Forwarded-Encrypted: i=1; AKwUvBy8miVmrlT+v28vDGgdbNxbR4GSzEo0KtDt0QkUY6SpxovwzLXmzGlpj1nj35jZwoF5e8YdfXYr69kiuZ2pln0DYeaXLw==@lists.linux.dev
X-Gm-Message-State: AFuF++mx8s/BtJEVMOEItpVVPr5QzQAKYHIJphweZvgn5z6f8H4k7k6c
	x14P4YjyRR34RR6Z9UgogBeOnbKdRwauCYebq9956bd+AxXBMkb6SHArGtmYXv+vfy4=
X-Gm-Gg: AYBFou33YUrNbeutRK/vg7m+QhFaiE6xMORQdvH34PQKXkLYFgcuNZsRMNuYcXS8CLs
	4Vp99OAlJjXL+nAoxjiQ1o9ayjGuqhsrlhcGfhfSu/Tn/p2XQc8NnaRJdOL1H3ntl9nhEu9dTNR
	xA9iBdgKVCeCWgdl9K0B3Co5NseMEmjuB6d1w9RS1Q03nZK5jPdWIC1V6hFL3HqXdAvM+soo9jo
	u4zxUnQDkR5ICgiXblnl+d3nHHY4OXch9UrNpLpAtkp5qYB/Bgb7nulfhB71Aeumwpk4DbEoLA6
	UKxGNs9tbQr1pVnbtiy0lSGyAKdg5YnEy38yEvsVZRxn5RyCyE40KoSn0kX3Sx3ab9WCMh+VibZ
	XoaECgbicW6zesGL0iaVGdeNATS4JTbEqm9+CZTvlQjJJN6cgnSNRBWT6TmYlhj037lVcGsXots
	UYOsZXv4qnx+Vz5TOvwiEwfhexY271dCU4uQXIcWHseZc1Hf3zDHu92FdWoq2OYxMcT7+awPDZ2
	UWFYv9OoUr+mN0ZtxWeLC4=
X-Received: by 2002:a05:6a00:3005:b0:874:705d:f63e with SMTP id d2e1a72fcca58-886c48b3682mr475937b3a.32.1790718524401;
        Tue, 29 Sep 2026 14:48:44 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868ccc884csm451233b3a.50.2026.09.29.14.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:48:43 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:48:42 -0700
From: Joe Damato <joe@dama.to>
To: Ayush Yaduvanshi <ayush37735@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net-next] atlx: fix kernel-doc description for
 atlx_tx_timeout
Message-ID: <arwyOuM3q36/q4RX@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Ayush Yaduvanshi <ayush37735@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev
References: <20260929101714.51579-1-ayush37735@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929101714.51579-1-ayush37735@gmail.com>

On Tue, Sep 29, 2026 at 03:47:13PM +0530, Ayush Yaduvanshi wrote:
> Add missing @txqueue parameter description to atlx_tx_timeout
> 
> to eliminate kernel-doc warning.
> 
> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
> ---
>  drivers/net/ethernet/atheros/atlx/atlx.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Joe Damato <joe@dama.to>
