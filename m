Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B3721422C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085499; cv=none; b=MJZmEyqk8TvTu8oBxoWFdJH2GihcsfUReR8BGUS9FwQnS2DobaWTmxhLYn4Vds5ERrPHeO9U/BvTw6YRSems+WmRZXFN9jzNkb19qa+BpP5HXNGDDOMHQme/Nxl+f6jABtLoAM8N1/gEDfcDZqPy7hMFAv3p5K1EXYs8ZsJ12n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085499; c=relaxed/simple;
	bh=yEABp3GiFg/+0kZlvIxOmAhS8Jdg7pfZN6WQVp7VoUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbpXkefjAA9/v0f7GBCL811pbheO/G+5MsvblyD8mv8eAlZwvdIcVCcwXuqvNJZCWJfnw3ZEfL8dYWZcbOa0Ndr9ZUHCrvGXK3YARlYaABN1BoNZfJaXJjW+cx+Xjv8kYqnQryK3XoFRiAAggbbrUCfocFbWalAqZZhmm5gAQJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxOzEJH1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxOzEJH1"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so1633191a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743085497; x=1743690297; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui62GSc9Eq6wueICfZ+2gQlUUj34FyRWiYMHHZxzwpY=;
        b=SxOzEJH1UTJeIAEmphNSLlqIKv+XHtw38KdnsgfUGH6n+3KLgQXY3sfbSIP1Haq5vF
         9GZQmCSeoq3cHJ3GaMrSSslVW8pHoV23rlO5OZofN2+ypDlnvzKuDZ9jS7qCBICpVLA5
         R+CmqwB1YORDeqPGXLduwOtjvTjnXR/8l3rtGfvwfThUxVCc0m1w0HnEUS0zQQjH88mr
         TJktwtAElgIuk+paHqShvjoq6xjGIKUrH2ho3ZEziQotvziQDY5hrcyw2NBT2i0RB1DP
         R2BN2kcD6MTLnUusrXOuskPL1iJjKqfeVcQG3Z9bt2b4v2wWK/ySKhDfBr5tiBEu94aD
         PrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085497; x=1743690297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui62GSc9Eq6wueICfZ+2gQlUUj34FyRWiYMHHZxzwpY=;
        b=gOhw7Vq/GCD3AMFI/M5vboWsBEsGSfBEkzQKSSDO7QIfFNKFTAjKLPtl9dly1tDqOT
         XME9Pc6cWCnh1Y/2OCWP6GewyfD73/8CcGpJ1xLBYuujzN4kcBJodzCCGj6hDD79ZeNR
         tMD5IMWjy+467lGVkeGSDldfZlm9N+xEZey/jnsADTb4oZFWYKaFNEnM+bhtaLhmzhil
         ffGK1V757RdBzLUOyGw2C13vN1B+/SNmVHWGLMoqYYDGq+JgMrLBmS8Bgl0Fmvx2T44r
         LhPlchaZGqZszp9m01TUaOzlYC/X5yv1gX/3YcW+PsqMm2IFFdrt0YxYwzQYQ+A55RB1
         zR9g==
X-Forwarded-Encrypted: i=1; AJvYcCXqPnsz1mZ7tIskdH5XDAwMr2+g755J3ztK2WlbQvtuVOvkArvG8P8kBoz7ZYVBWShGOsX6vv1ww1xMk4SgRkf1EGbrIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqFyRHbNhRm8cE+hpXH5CqTxuovQ2NRgqD5+iAmW1+tuEgpMM1
	Xfyo1lFqxNwEf6H3h7ABeGz1YkA4VGBIEKdI8LnmG8nPHD49TnbEr0/MIg==
X-Gm-Gg: ASbGncvh7aeFNfYT43r+o1RDNUqRUXLJvs1pd+buRy1TyxXdBx98gcsK3qh10qZBpVR
	r1R801SOe/jx/viH/QscIFIq6UHk1KX8YxYyzC17ZfqyVNO+FmOT9lIfBrxKyKSXKtmKAkSyZfD
	K5ZohK+ypgi9S9Cm38CltJ7bJjiQPswAhRdON4rDK9x+0yO2+kHrWM71YgFtRxpmov+V1WIYtoC
	lognG6CEFIl9Ci76hWyQO90rRfXTmFJ5q2sQe8hofZvLHeekTgkN46tjsVnD+oC8yu24OlU8DqY
	Xs0OIj1FcL74FvFf4hd4ZfCphsJQyk2oBJOaL04snFDjBrBDShXZrALgJPXtsw==
X-Google-Smtp-Source: AGHT+IELMj2xTDIqmJ3olXE5sPSsOQeADisXw6ErmX9HsLW4/v/8UhpHXEub4NyNRuVwWrSKIIhZQA==
X-Received: by 2002:a17:90b:4a4f:b0:2fe:a77b:d97e with SMTP id 98e67ed59e1d1-303a7d66285mr5967141a91.11.1743085497131;
        Thu, 27 Mar 2025 07:24:57 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:ccef:3c67:33df:4a11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f65casm128759295ad.230.2025.03.27.07.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:24:56 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:24:52 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] wifi: mac80211: Replace strncpy() with strscpy()
Message-ID: <Z-VftFBpDBT6l1f6@vaxr-BM6660-BM6360>
References: <20250327141108.182585-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327141108.182585-1-richard120310@gmail.com>

On Thu, Mar 27, 2025 at 10:11:08PM +0800, I Hsin Cheng wrote:
> The name of vif which is "vif_name" should be NULL-terminated to be a
> valid string, however "strncpy()" doesn't guarantee that. Replace it
> with "strscpy()" to make sure the content within "vif_name" is
> NULL-terminated.
> 
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  net/mac80211/trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
> index 72fad8ea8bb9..37f5b1c87709 100644
> --- a/net/mac80211/trace.h
> +++ b/net/mac80211/trace.h
> @@ -1725,7 +1725,7 @@ TRACE_EVENT(drv_switch_vif_chanctx,
>  				SWITCH_ENTRY_ASSIGN(vif.vif_type, vif->type);
>  				SWITCH_ENTRY_ASSIGN(vif.p2p, vif->p2p);
>  				SWITCH_ENTRY_ASSIGN(link_id, link_conf->link_id);
> -				strncpy(local_vifs[i].vif.vif_name,
> +				strscpy(local_vifs[i].vif.vif_name,
>  					sdata->name,
>  					sizeof(local_vifs[i].vif.vif_name));
>  				SWITCH_ENTRY_ASSIGN(old_chandef.control_freq,
> -- 
> 2.43.0
>

> The name of vif which is "vif_name" should be NULL-terminated to be a
Or maybe it should be trailing NULL-padding when sources is shorter, if
it's the case we should consider strscpy_pad() or other alternatives.

Let me know if there's any mistakes or tests I can help to validate,
thanks!

Best regards,
I Hsin Cheng
