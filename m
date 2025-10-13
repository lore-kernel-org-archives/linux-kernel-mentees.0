Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1783B22156B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387135; cv=none; b=nkYWOTz5sMZCcNHb9MCXP4LhexCMy5jlVOTwYRSs0Lh7cQL5Udg3kkndKlL50dROF/VCV+vm4sdQOhKxGayYDT3GrU0dnzxVoZ6oXb/0Xan7c28bXzGM569LiXn4Z0f7DSTKOHT/WRJ+OdsHSNvsUaXEQwCTOmhAtQqqAKnezXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387135; c=relaxed/simple;
	bh=RgDFfsGyDh2D5MZcZfHuN8rC9xBKfq7IaWMUdV3rWwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdu/UBCAZygjzgx9K+B7jWXf5ivjlUe8UCCM73dKnZ5B/WPpuxQLEE0enyczQ5DrxwT09OUcQe0Q3qBjmTPUhJoRXcSHcLUg1BiG601JlCVCVf66YkPEuxU9yYR1FsFgYnlZRDy6TbjIV7w72Vk3PaNWuJbSLuCwuFk34nTZktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpImoiEE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpImoiEE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7841da939deso3976160b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760387133; x=1760991933; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvmwG/OTTSp/sDxZm7NpYcSINRgarbkV9m7iJQxM6OY=;
        b=BpImoiEEA01v4gNJUIKR0AaB7fO7yLOFSXUvk2UtA9KmbXiAjLa3+ZT6dQjw+qqNqN
         GbQk2We053SVCzdReRepeV68/C7gKiKsclTgqUxa4PiBG4ux63M7/ea9Alv5nUvTrsJa
         hw/rG1gzz7kVALq1YQBZjV4oPLTzqE1wETPiPPkLehjuFJ17b5rE0PzQO4XGaVfJRxo2
         CQY5XLMuS9VXLd8QkSRrLZDjC70cM85nc6YgTump87gwlWTwY8JY5JcOr3Qq4Dvac94N
         3BPBhiD3+5b43NYLMSYrOk0cywGaOJH3/h6WM5UGSTsXNB43UolOjIUDSEzcV+tFKrAB
         u7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387133; x=1760991933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvmwG/OTTSp/sDxZm7NpYcSINRgarbkV9m7iJQxM6OY=;
        b=xJ0Q6+zjLRwxgZQFNuaMwT16nV8s7m6TEh9lK0DuBl/FI+7tu8ILq8pvwApVq1T2Hs
         ycTSvUHVpQsUnicK1qauVNBUVhcnz6b0rfVXjwthdr089Yor+IOYsKoI9Tqs+nkjJ3Lg
         nGN4xLuI7smNZCACWKbwxwZOAFTFeqQF6UquZwTX2EsB538Pv9rDf8lHaKjWBNCo7igv
         wtOhXdfeO2KQbmTm57UReJAbqKp1vdPeXkXhlQ6JSSvbcE51IFIDvIx8ziUCGU/AWuzT
         GBRBda+4QR8aKnXFTqRuVmcyFBdrzY1WOMUiFTzq/3SmVRcNjzPSvpBTPggq5oJajJ/e
         w0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUo5Ks0aViCe89fI6Fu/zT/L9ii6g2+uDnuz96samIs4cAffnWjJaQuecnSrvYHr7ijIJAzBLeZjQtp3eX98F+2i887A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZkX5GuAYvvK8Hs53s8c/dOTVpXQX501v3F2o0qt5V9Co+IOxu
	NMFazSskq/1DTyiIm7LBmuiqSh3l0qtWuEFYNlzXcFr5ovPcNdp0PizL
X-Gm-Gg: ASbGncvhOngKqPC32I2OCjBJYDWpLIdoP5CYSyFRhWkJjixePbIsir2UGgxB9LktSwA
	3FTP2SIV2xaG2yr/Ib7bxW2JjJYn0XZXgTG1Fw7c0ekTeu73todT2gYRxdK5N6nqm1HzCuvWCj0
	HJ9Hnoc73yaMrsEMM1TPMDf1WP8BXXGW3OvUtxQUJ5zeRvKspvgSx+BTFY1l1ZL/CS6zF+VsJUq
	Tnqsk5od1isjJaV+CVAHKcr9gcngJJNWaq3Om6aIa5/B+qGklOjT3hBZUlVnLzY2SE7HVTF5lqy
	SkGYsKCw38pEeDVTjY6eOAu3xkERozf8bTae1KeszDamjI6dOFANDZO9va9B4NL1rJm7V9OseVO
	aQYiLT9+0KoGgGHNyqwfDr1ToEzsLBPtQe5MUPaBgbE+9LzSz50zMC3HqrBmwSgteeJzeTbEi4D
	uGYprv/YNtY9KnhQ==
X-Google-Smtp-Source: AGHT+IHAJQJ2TBajBhJIXbDbxqDBZKtz7JTXJySkvaBi6lA42nmISYhfTKtZHx4S7eLGHCkr2tWSgw==
X-Received: by 2002:a17:903:2acb:b0:268:1034:ac8b with SMTP id d9443c01a7336-2902739ad00mr311295215ad.26.1760387133317;
        Mon, 13 Oct 2025 13:25:33 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f941a5sm141937435ad.127.2025.10.13.13.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:25:32 -0700 (PDT)
Date: Tue, 14 Oct 2025 04:25:29 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Ankan Biswas <spyjetfayed@gmail.com>,
	Lasse Collin <lasse.collin@tukaani.org>
Cc: lasse.collin@tukaani.org, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] lib/xz: remove dead IA-64 (Itanium) support code
Message-ID: <aO1gOckA14Ed/26F@visitorckw-System-Product-Name>
References: <20251013173446.8692-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013173446.8692-1-spyjetfayed@gmail.com>

On Mon, Oct 13, 2025 at 11:01:58PM +0530, Ankan Biswas wrote:
> Support for the IA-64 (Itanium) architecture was removed in
> commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture").
> 
> This patch drops the IA-64 specific decompression code from
> lib/xz, which was conditionally compiled with the now-obsolete
> CONFIG_XZ_DEC_IA64 option.
> 
> Note that the upstream version of xz_dec_bcj.c still retains support
> for the IA-64 BCJ filter.

Not sure if it's necessary to mention this, but I guess it's fine.

> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> Acked-by: Lasse Collin <lasse.collin@tukaani.org>
> ---

I'm not quite sure what you changed in v2 compared to v1.
Usually, you should describe the changes below the --- line [1].

[1]: https://www.kernel.org/doc/html/v6.17/process/submitting-patches.html#commentary

However, the change itself LGTM, so FWIW:

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Lasse,
Since this change is located under lib/, I assume it will be routed
through Andrew's tree?
If that's the case, then perhaps we should also Cc Andrew.

Regards,
Kuan-Wei
