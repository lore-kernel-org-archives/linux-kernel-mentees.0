Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1B1DE894
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Mar 2025 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741822690; cv=none; b=ANa5ZAsN8PUvD+HTMbv3nZEpeXF66V3I515qT3gmAG3R906YuWkjMaqyUnwqyQJ2F4LiirYQw5BJHmMDq3oAfN3V0effuL1Av/LJ37HLY88UEevq/NYl0WoekAM0177WbTvxCD+WsLo97MriWN4e+jX8JlxM6ryVHuGWZkE56/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741822690; c=relaxed/simple;
	bh=vN3VEd66BFpxzGPu+gzWhrvDg3yMVNnbOuWzXhos1NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDj3jjn65rDwIgVXKhCLjvKCH3oUxCMjsBh3XystrhgvI3tkKGY8J6rPStsbPg6VtNpGIXxlLrWDc4QGG4HjsN4JF+2E9fyxnpJxKzREFtqsAYQdaE2uSMYTeLWMC7fD9Jx8U0cM6Ecc4s+twztdA6vxnmOsCtmOXa/8Q3SKbQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Njou/o7i; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Njou/o7i"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22401f4d35aso7124335ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Mar 2025 16:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741822688; x=1742427488; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv9X1O+iJ055EOoqMTSQh8pZkA9omS3qAlLfPhpnypc=;
        b=Njou/o7iHAE6sIzBDk3HDOLj9YWpy8QAS3wGdtkxL4Loz2rhpq5Of+kHdn7NHDnnHC
         HIo6Eij43shVW88pulyK1gQWdMCVkxqEdDYQJRt6wogdB9nO2Ssw03Se7SUHLFvixPAi
         /5vmZpCjkWU7/LpnqNepgKjKY9A0IUIl8onGb70dlZWkJbFr6xNBu43KY8wplFg4sZRb
         DkLIvqYOwyg544uLWOSrUXMhVhzjPJu5uQsQBV4EILiNRvw/hxhXIzaoSgkcx63emEiu
         fqZmPo62IiKd5gg/XCcPNOaW29q6pD2wpEt6kRmtANL9cDNpaghJHQb5o8tPOFyXDUZi
         ng4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741822688; x=1742427488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iv9X1O+iJ055EOoqMTSQh8pZkA9omS3qAlLfPhpnypc=;
        b=WNlwXgs8fxiaaYD84P0CJZ8u2ALriPSY2oSdQUoJAPHotHk+LDYHQCKRClsSsMnJSY
         KcklUIWSQOwkRJI7JjClmwlafqHT7fLOGwcDbYZffwTkQScXdnc6DdIgdDkPmSwHbYfp
         7e0F7SPJEiGH7TtL9wECTyQ5/mFX9g4HGEgvOmJHqSg7Vzf8gqNygaZy77YT+oylHFaD
         yjw7r4ggVI1Bcd9GOHq7jzpGpknEwazFIGemYnJ65IY+DjnU9GPMwuSKGntehc3K9beG
         ptJ+4r56zDUyTuhHLoTAB1t5hobW5KMdI27yRlrFJVbNCTqCHV29BwsrYtLUlAb22ACb
         /GSA==
X-Forwarded-Encrypted: i=1; AJvYcCXTmTYNq5cEGXuL83Z9ypYeHjj7+dMAW0jsaWulqH9m1TyOc4hB1uHLh9i7j6u6itKhvyp6JpxNLkkKqZ/biHAeUhM0Tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLUY2HnZu6YTTHCe6iANTC7a2xhpo9NhFH3Jy17yrvcSboOYCm
	HS4NYpjYat1hnRm0ea0c38cY/JDCvh1eWffR6YZdnf2PRql6Qp1i
X-Gm-Gg: ASbGnctR4VnDi9/ZjkHIyoEx5Lv1OuidL6Tj36aGaT8NwvsCMezg56bH//2cnKwEp5m
	KkC6Atgdi2hdj7SpyvpK/6jQUFHgJQ5mwsP27LlimwhjxVlPOk1QGc0TP4lUddvrnbbWyWNB+dQ
	csclUCfpvZd5MlM6L2PL2qA6MkO3BG0njOgAWTFoHVJoWg528x9w7UXsz+Wlu6L2wHoJW1ZOvWg
	xV4UFZavDUqcl7iX6Mtyd2z86xgEP5d39pAYEthvFdjpzrMyQn8nGUB6uL3mlxkRwEdz3FKE5jH
	NhHe+ngYGGxjpf8IeIE617G4ayV6Fch8W1u1xynEnu1r
X-Google-Smtp-Source: AGHT+IG5xBWHcUI1ZiPr4lIPXq2LhR2k/iVfRjmn8GAY/lSsqcezJg1grQWMvGOFPF2cHAToz5e+tw==
X-Received: by 2002:a17:902:f54f:b0:223:58ff:c722 with SMTP id d9443c01a7336-22592e44a1fmr156857395ad.28.1741822687725;
        Wed, 12 Mar 2025 16:38:07 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68883d0sm1323525ad.10.2025.03.12.16.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 16:38:06 -0700 (PDT)
Date: Wed, 12 Mar 2025 19:38:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix test_and_{set,clear}_bit ordering
 documentation
Message-ID: <Z9Ia3AMqFpNj6fUb@thinkpad>
References: <20250311-riscv-fix-test-and-set-bit-comment-v1-1-8d2598e1e43b@iencinas.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-riscv-fix-test-and-set-bit-comment-v1-1-8d2598e1e43b@iencinas.com>

On Tue, Mar 11, 2025 at 06:20:22PM +0100, Ignacio Encinas wrote:
> test_and_{set,clear}_bit are fully ordered as specified in
> Documentation/atomic_bitops.txt. Fix incorrect comment stating otherwise.
> 
> Note that the implementation is correct since commit
> 9347ce54cd69 ("RISC-V: __test_and_op_bit_ord should be strongly ordered")
> was introduced.
> 
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>

Applied in bitmap-for-next.

Thanks,
Yury

> ---
> This seems to be a leftover comment from the initial implementation
> which assumed these operations were relaxed.
> 
> Documentation/atomic_bitops.txt states:
> 
>   [...]
>   RMW atomic operations with return value:
>   
>     test_and_{set,clear,change}_bit()
>     test_and_set_bit_lock()
>   [...]
> 
>    - RMW operations that have a return value are fully ordered.
> 
> Similar comments can be found in
> include/asm-generic/bitops/instrumented-atomic.h,
> include/linux/atomic/atomic-long.h, etc...
> ---
>  arch/riscv/include/asm/bitops.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index c6bd3d8354a96b4e7bbef0e98a201da412301b57..49a0f48d93df5be4d38fe25b437378467e4ca433 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -226,7 +226,7 @@ static __always_inline int variable_fls(unsigned int x)
>   * @nr: Bit to set
>   * @addr: Address to count from
>   *
> - * This operation may be reordered on other architectures than x86.
> + * This is an atomic fully-ordered operation (implied full memory barrier).
>   */
>  static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
>  {
> @@ -238,7 +238,7 @@ static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long
>   * @nr: Bit to clear
>   * @addr: Address to count from
>   *
> - * This operation can be reordered on other architectures other than x86.
> + * This is an atomic fully-ordered operation (implied full memory barrier).
>   */
>  static __always_inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
>  {
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250311-riscv-fix-test-and-set-bit-comment-aa9081a27d61
> 
> Best regards,
> -- 
> Ignacio Encinas <ignacio@iencinas.com>
