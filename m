Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3F2E717B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761552857; cv=none; b=Js2M8pimtaK1oqwXoimxnecgdEucLOytOWC00RiXMZ9UOpioe9B03J9ceDVFIh3MMDvGBRI1EozHbRELKnAY+HuHbJ8/ApBtLTWgbAvoVaMcI9V3mJkq7GEBvlSD/wWTNKSllGESt18J0e0ZJLOo5Iu+1Xu8I8Tftf7Z6AvdH5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761552857; c=relaxed/simple;
	bh=etqLAq7gFst0cSiu6SvH9Ue38STXBB7ceWx2V9z48vY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmlWqd4kv1ib3fvJntC2ByPWI8waPXPoZopRKDBjalr79458KYbQkjezhwEK2tKg4XahyXXuEZfsCtUuiQlj1migyfs8apJwRci6St6cvQu6TGfQ79zZL52ACpsphwpbU41JFHPs05B9ottlz3Ni1ec+VsC361NUlDBUn2mniTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHLqHMe7; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHLqHMe7"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C4CF40F0C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 08:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2S3uejRaqUJz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 08:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=olsajiri@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A7A740D04
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A7A740D04
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hHLqHMe7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9A7A740D04
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 08:14:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4711810948aso30927215e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 01:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761552852; x=1762157652; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSHu/ivuk7OTgOMQRpfxc8sNj6kHssvRHTUG1SNhELU=;
        b=hHLqHMe7harktfdn/pYQZ41/V/VF29e4TjCYK0pTouSlJ40bMz0D9WXIh/Y/C2PbMQ
         vxkQ3TsVbG3i08CM2kxfe7w193tm5/EfHaSyXl6hO6CndipECC5xmhLldnhJht+3/CXE
         SIjICatmxtqkB9HJBYmvMynFgEfqxmL3uNfmZ091deIqETvYGRJu38SOc7cLCnULihzv
         FvURTu2GlS5RIxO/KDwrsOotZ6/2AAA0NJydVE7KHmKEvCGJ1XFO7gk7CimpDSeVDrpL
         UDom/gt96VJuvuwEzcntqEcMZPwRdyctAz8GcKFma5Z1rQz8jHNErb6MBjoRfu01b9hm
         +4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761552852; x=1762157652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSHu/ivuk7OTgOMQRpfxc8sNj6kHssvRHTUG1SNhELU=;
        b=iNdLrIwnYrRs0qM05fDTnAwJTmNfglWowlqIznKdjj5p1rTaR4fqyZR/oIqJoC04FF
         NrE1De7bmq28SO2qIzz3VF8LnATqhujKke8LyErvTzKzRu3UyGT6Ks9QVUf1XrVnO5dp
         avLsRJue9RAAoLNZIECTRQeAr5bV/gtu2r7XSs2E4l1VZ9AxzxLVscwQdOeULj8H3Wt5
         MdYFMnJ/MW3DW2jvii5BwPFSpgrBaeUONDYIggkz2KgDBrLDcPqXiV3VI7g9pueHxD36
         cRenooWAHrO/5zuW8XtgyRodu33h26HK6HQgay21r9ku7q+3GI+NKPIU/nhJGig7jLfF
         vzqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx4X5Ihan5EVzxV6yYTv/Ln/t75dA6rKBR0vzF8LnSVqnPve1JtBYPk6pIDDwDifNKRSVK3axayIsAHjPeWwK/6nbmqg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz3jEPkiqvcgcU6/i1HTt6sbVPQ2J60q3t4EKUK2TSFUNd8vHrj
	15bK8KgBteTUBd8RbDUSoPW78iR+/zCPE615Ngp+Z1trrqqWuPKO8alj
X-Gm-Gg: ASbGnctNunpEXoHX5IAvUDYr7sjrHfoVsOGDUT0YydRRa1rSiHdNSnRuCpJ6F1xkRTF
	/VD3rTvtuc3H2/UlYH06Crlxq5vRa9d4F7yjVabGvN0QQM8qRQ2QBmsL4ehpbH4JTEY2SSBzY6l
	ToIiw8XT9DAPLxPLa/vxiNGe6Zvof4brTsWRNKNZ5z8gC6eUmLs9UWafYQ2TKySn7MUy+mVOOXj
	sp2pVUHhbeEQrRqRRybstFsMHvXJ+AGELYfDRMDPaBv9biDN9XZMujlEW3qgxbe+dKxaCP4gDTL
	r3t+dQs+j/+tmXeK8T6bsNA+P9KzOY4qDPdXBwE3PpdjV622v8yk9l0nc9p3W1XizKAzhaaH2gs
	st7sf9hif0BuhbUiAAIXutRMx21uhpjwaGEjMZxW1NHABnmSOvDNnFHSYx8j+oJaMdwHRSZQ=
X-Google-Smtp-Source: AGHT+IFFKQfLGx2QdYO29wjJqWg+dPw9x5/f0UKf4PSXFO3HYbVj3gV1HeTpZudQpFAVTpuMJ53ygg==
X-Received: by 2002:a05:6000:4a09:b0:427:62b:7f3 with SMTP id ffacd0b85a97d-427062b07f9mr28406369f8f.33.1761552852032;
        Mon, 27 Oct 2025 01:14:12 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5768sm13058047f8f.24.2025.10.27.01.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 01:14:11 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 27 Oct 2025 09:14:09 +0100
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev, khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jiri Olsa <olsajiri@gmail.com>, sam@gentoo.org
Subject: Re: [PATCH v2] selftests/seccomp: fix pointer type mismatch in
 UPROBE test
Message-ID: <aP8p0Td0LLa6Odit@krava>
References: <aP0-k3vlEEWNUtF8@krava>
 <20251026091232.166638-2-nirbhay.lkd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026091232.166638-2-nirbhay.lkd@gmail.com>

On Sun, Oct 26, 2025 at 02:42:33PM +0530, Nirbhay Sharma wrote:
> Fix compilation error in UPROBE_setup caused by pointer type mismatch
> in the ternary expression when compiled with -fcf-protection. The
> probed_uprobe function pointer has the __attribute__((nocf_check))
> attribute, which causes the conditional operator to fail when combined
> with the regular probed_uretprobe function pointer:
> 
>   seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
>   expression [-Wincompatible-pointer-types]
> 
> Cast both function pointers to 'const void *' to match the expected
> parameter type of get_uprobe_offset(), resolving the type mismatch
> while preserving the function selection logic.
> 
> This error appears with compilers that enable Control Flow Integrity
> (CFI) protection via -fcf-protection, such as Clang 19.1.2 (default
> on Fedora).
> 
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>

Reviwed-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 874f17763536..e13ffe18ef95 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
>  		ASSERT_GE(bit, 0);
>  	}
>  
> -	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> +	offset = get_uprobe_offset(variant->uretprobe ?
> +		(const void *)probed_uretprobe : (const void *)probed_uprobe);
>  	ASSERT_GE(offset, 0);
>  
>  	if (variant->uretprobe)
> -- 
> 2.48.1
> 
