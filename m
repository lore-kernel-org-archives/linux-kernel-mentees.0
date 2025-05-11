Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF284315E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 11 May 2025 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746962619; cv=none; b=U6hcCbQU19/8oWMszRjILwo27unEssWvq1MAwxBXZ7IMI9q3Te9OrYJfDH+RK1udBrdJ9bG2Q3HGiY+a5+iF/yI+1q+cAGn8FaGyDHTXTrpA8gmHEi6QIsr/VaG9jG7+vc92GwlvNESJ2U9QRQGV6/6QLhkZ7QHVXMoGHDteJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746962619; c=relaxed/simple;
	bh=/Gbhq9OEP7Q5EqNR6lXTOPYylSQbyvdVHSXkwAmjPTE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MfFhskivnxKpFHO0SItKmRCo227Clke6EvONkXtsMG+R4SOAWQKtGJsr5f2LZSE/uOONQweE/bNa76HDQPBG9012N+rf9AeZ9laSTV3xByw73lVgbihTu2N+0lA8sDef8HOSX9bvz5zCQR+Muizp5+RF4QktuStyidQgqYWG/iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lE/+uRpy; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lE/+uRpy"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso1938951f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 11 May 2025 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746962616; x=1747567416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr62AM3KoGEBAH10wBbEzrU82okG3T/6xZVPR3kGFKE=;
        b=lE/+uRpy9UwyroamVdq0HN1T/J+9cN1zow1TYHlRnsIZVFntytqer11EAlqkegXeu+
         NMYzC7l1+SHPp9CVM90KAUKtNj8ijKn9FpKS4y2lW0Z2P8l3B0d7jmCyPwWDEkUfDaFl
         kDuql+7VIuRAQpR0UIMTc0smaZZ+QFqy+CymrORDQRDWojco2z0VoMGPavwAjv+nZ0pt
         j1gNgN2CwN/veqGCi9TRjLDMPNsKT/kXU1QHuFVdPSWkvAvWIXEX9B9W8WaVg2Xy1ZaO
         vGRzTi703h9JIxyVw6kjRtfrvlLAF0b8KcWHPRADn/KSYNDBseMdHs6VZIpCdHc1Qhjk
         eRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746962616; x=1747567416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr62AM3KoGEBAH10wBbEzrU82okG3T/6xZVPR3kGFKE=;
        b=BYSoJL1MDn7YI14+jsIS+aENSeeFU1Q15Zoo6toPhMtmgW44lFB+T9h8eTACqZ+opr
         DsH2kCYGvKtKMAf8+HYjbHPTQv0lvKyYU3AqlGtspNkxJZ0wzBgQQpD8W0rHA5E9rwXl
         GCF/uf0rh7CE7ovjHhFrVvJJtouqP48+j0gT25q6YR07rWLkyM2VqiVytrgQlIfKDH2S
         vq7XeEMqpnDmUJc84jbbLmJNWS3xVbxCDSCNyznotcf2UPFychHEe7MJGQoFBqsfCisg
         0hT7c2LACzu7Mwn4SlbiLFuGY+Y2i15kS6mBXbz2JnZnoLHSuQo6m8fP3xmvsJGqFjI+
         OiYg==
X-Forwarded-Encrypted: i=1; AJvYcCWd3ACdjd2URKE5LkrJ2iQVQI6wVmsdqNaY34RKP9Vw2HQYFqnJp9RM9jJ5y1zO9Y6waetVmJGjkEDO8PM/OtDKGbVOrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxapJKnZDPL1H6bSKgUC2iUmAIHP6G/Xqjrj8wayC5aOPYrF8li
	63hz5r87cjqzCJdLQwAQDXH6ZUdZGDP6Th1s17btPUfE+LKl3ASX
X-Gm-Gg: ASbGnctTI7WH8xtKTrqPoIUWy/jpAw2jXItKlpChai3ewBU1UmKiH5MrwkCsZFIXpnU
	nccvGQgbUuF6HyjlDcrcqERhqjYXH4qy1oLDwHHn0ees6XgqsOn5/bl4EKbLxSqchF1AebuDr8F
	eeuJiuUq4TuZMgkRU57AY92uI1p2ZNw9OWixbjVSJ6xtEK8GKVsr55V+83IAoYAufYsJmlDopKO
	E68x3qLyz8n/A13Vj5fmpTMS3SfJ6Fh/nLkS4z26TkbvO1wGT+c2o0nDCa5x4RH7gvLDYMLjTuM
	yR0gH4dCxN5A/vUFYnbcAwB6sXpAYuz6a35SyNmngYeWHIia84QviRqbvUluaOBTpmX9rt35I9x
	muXYVzroPJnmN7hTpzH0yulIO
X-Google-Smtp-Source: AGHT+IGqYzj25cJHQkUXe9+tpC/pNhXG07X1IG93ZPDwcMrzYGRzVt+SJJU2Lolx8RxeBWOFjdnGRQ==
X-Received: by 2002:a05:6000:2dc7:b0:3a0:b84f:46de with SMTP id ffacd0b85a97d-3a0b9941bd0mr11326589f8f.21.1746962616029;
        Sun, 11 May 2025 04:23:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf38sm8956991f8f.77.2025.05.11.04.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 04:23:35 -0700 (PDT)
Date: Sun, 11 May 2025 12:23:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann
 <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, Zhihang
 Shao <zhihang.shao.iscas@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 1/2] include/uapi/linux/swab.h: move default
 implementation for swab macros into asm-generic
Message-ID: <20250511122328.79e9a2d4@pumpkin>
In-Reply-To: <20250426-riscv-swab-v4-1-64201404a68c@iencinas.com>
References: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
	<20250426-riscv-swab-v4-1-64201404a68c@iencinas.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Apr 2025 16:56:18 +0200
Ignacio Encinas <ignacio@iencinas.com> wrote:

> Move the default byteswap implementation into asm-generic so that it can
> be included from arch code.
> 
> This is required by RISC-V in order to have a fallback implementation
> without duplicating it.
> 
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
>  include/uapi/asm-generic/swab.h | 33 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/swab.h       | 33 +--------------------------------
>  2 files changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/include/uapi/asm-generic/swab.h b/include/uapi/asm-generic/swab.h
> index f2da4e4fd4d1..232e81661dc5 100644
> --- a/include/uapi/asm-generic/swab.h
> +++ b/include/uapi/asm-generic/swab.h
> @@ -3,6 +3,7 @@
>  #define _ASM_GENERIC_SWAB_H
>  
>  #include <asm/bitsperlong.h>
> +#include <linux/types.h>
>  
>  /*
>   * 32 bit architectures typically (but not always) want to
> @@ -16,4 +17,36 @@
>  #endif
>  #endif
>  
> +/*
> + * casts are necessary for constants, because we never know how for sure
> + * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.

I know you are just moving the code, but that comment just isn't right.
Linux pretty much assumes that ULL is 64bit and U 32bit (UL varies).

So the UL constants should just be U ones (int isn't going to be 16 bits).

Not only that, but the code requires that the (__unn) casts don't
truncate the values. Performing the maths on a larger type isn't
going to change the value of the result.

Then we get to the integer promotion that does an implicit conversion
of the return of all the (__u16) casts back to signed integer.
So it may be better to leave/make the result of swap16() unsigned int
rather than casting it to __u16 and getting it promoted to int.

The only plausibly necessary cast is a (__u32) one in the result
of (except swap64()) to stop the compiler doing 64bit maths with the
result when the constant has a 64bit type (and all the other casts are
removed).

	David

> + */
> +#define ___constant_swab16(x) ((__u16)(				\
> +	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
> +	(((__u16)(x) & (__u16)0xff00U) >> 8)))
> +
> +#define ___constant_swab32(x) ((__u32)(				\
> +	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
> +	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
> +	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
> +	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
> +
> +#define ___constant_swab64(x) ((__u64)(				\
> +	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
> +	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
> +	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
> +	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
> +	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
> +	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
> +	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
> +	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
> +
> +#define ___constant_swahw32(x) ((__u32)(			\
> +	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
> +	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
> +
> +#define ___constant_swahb32(x) ((__u32)(			\
> +	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
> +	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
> +
>  #endif /* _ASM_GENERIC_SWAB_H */
> diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
> index 01717181339e..ca808c492996 100644
> --- a/include/uapi/linux/swab.h
> +++ b/include/uapi/linux/swab.h
> @@ -6,38 +6,7 @@
>  #include <linux/stddef.h>
>  #include <asm/bitsperlong.h>
>  #include <asm/swab.h>
> -
> -/*
> - * casts are necessary for constants, because we never know how for sure
> - * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
> - */
> -#define ___constant_swab16(x) ((__u16)(				\
> -	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
> -	(((__u16)(x) & (__u16)0xff00U) >> 8)))
> -
> -#define ___constant_swab32(x) ((__u32)(				\
> -	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
> -	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
> -	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
> -	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
> -
> -#define ___constant_swab64(x) ((__u64)(				\
> -	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
> -	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
> -	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
> -	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
> -	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
> -	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
> -	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
> -	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
> -
> -#define ___constant_swahw32(x) ((__u32)(			\
> -	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
> -	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
> -
> -#define ___constant_swahb32(x) ((__u32)(			\
> -	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
> -	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
> +#include <asm-generic/swab.h>
>  
>  /*
>   * Implement the following as inlines, but define the interface using
> 

