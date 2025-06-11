Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DCA2620FC
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642609; cv=none; b=d4PYrVvhQwrhfU4LbPyr/GMQpLlJJH9x42CR/TQlCTK1jZv49Wj2KBMyRHFE4U8OZvPUqpcTbuXPjrQVgdiaCxZZg7DYqu43URP6DDmSnrwHTdpMFhRtQX9nqnYK4CQJ2z9GRSaQSyr1FYqh1KLM7sNQer35hBpANxFmqTPR2pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642609; c=relaxed/simple;
	bh=CWu6A+I1LjwFmAU+PAVS8KxvwoMO5RZ75mLuP8WTIVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqtBGAonkd3eBpGYy4Dl1jAkfcXOVSExnc3+R0IOx0+53zTpCENqYK0OtYDFQAlWgxlUdD6iQHBB2oo21cHzuSnZOClYITJK6CcfqIMGuAOZl2zX2hjeR/L1CtDAMg/R6OCNT64Jjv67g235lgkRukuO8o7bWuZ7+nqjCKYngtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDlnw7BP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDlnw7BP"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363616a1a6so18155805ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749642607; x=1750247407; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr1jR2n/3+iHKJOEuEz4EzcjD/8G3U4J0+bvzR27Ds4=;
        b=lDlnw7BPi85q342QlMTLEnBOiVErZzTxuMoXKTrfnhubJ/XCI/OMi0O9fv1AaEpfoh
         xIH00FG2c5RvSU3AfcsjHz89akPBlnkZOxX/NKaFt1/cC+uSUAlIeuYTdkNkd7JJ+qxy
         i6WcoATQwSgZXcYkbFI7YMQFyxDZgtytglYSY0nktbyL2M0qkb9k7c2QfzklrYOPl6m+
         Ra7TUCF1LAc0v7f9YrYzMc6pVMggAzlkOgF+ENyTba+gVRQcey7kM8/nujq0qU6qN7VS
         ycwUB+TVH5RmY33IjfRi4/QNtJQiOuzV6Pz07JZHr5hW2lxUKPoqB1A5btxi6XVfn8/O
         mHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749642607; x=1750247407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yr1jR2n/3+iHKJOEuEz4EzcjD/8G3U4J0+bvzR27Ds4=;
        b=AmQde+nH0Fsm4aeSPNbRInmDOubK46pWI0bmUECRVKgrG4INaje7FIC641AjU9Yea9
         55DWJS5SCRmVRvyACfhLzXxKxmO47HiikPTIUqxOeVnQDhp0YI5EDatD+wKJnM3u7h1B
         Bz9iVRV9Y08JpVvFBkWg+14/AmHkX3cxBbzSZSr/up6lSkxp5bMfn9PxUeItjnIu+WVt
         ylS2uMxuJkYhUPBYW5lsOouWXDbGg0fP+efzPZq/Ay3jPhh1EQpM9Ocxt9VKJhuVpndr
         mBGwJuFq5pSVOKGVMIINe0KU1VR2Rxrfdyi8rVTRoLCyG8UH4cqWXqFu62t/FcukcheS
         fxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpe0qOMIEH5aIAru7JQDnesNagdXGTu8n/81cmdHPI8jDVUno1fFxYXg5AtY0/Iojz9xZtfQnswxeC6w9sdB8Il1Tumw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkaVGU7MsERRsfqtM6n6pKMJaNfHpU3Zrf2EnwxsALibV0DieI
	UAS1+K5BpfHmoehcw4Y1hffq3Mm1X/Dea4Obv83JHdmLOPC86tjBg4ii
X-Gm-Gg: ASbGncsUXLy1boeTUk9V2XQEYoyH/raaSSqAZ6pMfNhzOB6QWMZ3BoGU/TEfKLUlpJ7
	h68p6HHM1QsrPK3wvZIWNek1pq5Z8ac7au6pCXnt3e/ELpeeL8F3Al3T1tXYNNFNAKDt9iC5eUF
	R375YkebBreEyJ8zPb3+FpzPHTdii0Ho6PYK/arKZpFYEMyOKczCYcU67gClaYYYX0woUoXFSdQ
	gJWFWMHFnM4EshzEFbG8zU67MHop1YyoNiFRM3rl8TsoQ+0GfxY+UcC247m6HwvVgrUvthNGOME
	sSPAcAPpYE0QN86Ci+JWH5r0EK/uQ5G0AkeEnIWSSEqNQy9yChFphGphRSFczw==
X-Google-Smtp-Source: AGHT+IH0mXPNVgqbjYeHRojtDfwaw37TfHsCnjGPZ7Ak5dI5UXEfPx4VvV1LNaJqLCESUv+gq00Mdw==
X-Received: by 2002:a17:903:1b10:b0:235:f143:9b07 with SMTP id d9443c01a7336-23641a8ac0emr42538815ad.5.1749642607279;
        Wed, 11 Jun 2025 04:50:07 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fceb2sm85893185ad.96.2025.06.11.04.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:50:06 -0700 (PDT)
Date: Wed, 11 Jun 2025 07:50:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: jstultz@google.com, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, yurynorov@gmail.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v3] clocksource: Replace loop within
 clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Message-ID: <aEltbEpA7US9h8qN@yury>
References: <20250611073608.2049793-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611073608.2049793-1-richard120310@gmail.com>

On Wed, Jun 11, 2025 at 03:36:08PM +0800, I Hsin Cheng wrote:
> Utilize "find_last_bit()" in replacement of while loop counting
> for the decremenet of "sftacc". They're equivalent in computation result
> but the former is more effective.
> 
> "find_last_bit()" will return the bit number of the last set bit of
> "tmp", which is 0-based index. Plus 1 to convert it into bit width as
> desired.
> 
> Note that only the lowest 32 bits of "tmp" is taken into consideration
> of the operation, since it was already shifted right by 32 bits, the
> topmost 32 bits should remain 0, only the lowest 32 bits are possible to
> be non-zero.
> 
> This change is tested against a test script [1].
> Run the test 10 times for each version of implementation and take the
> average. The result shown that with this change, the operation overhead
> of "clocks_calc_mult_shift()" can be reduced around 99.7% .
> 
> -----------------------------
> | old version | new version |
> -----------------------------
> |  11500.6 ns |       44 ns |
> -----------------------------
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
> Changelog:
> 
> v1 -> v2:
> 	- Refine commit message to explain more about "why"
> 	- Check the frequency of "clocks_calc_mult_shift()" get called,
> 	  it's not in hotpath on my machine, refine the commit message
> to avoid overselling it
> 	- Add comments for the code to explain the implementation in
> 	  more detail
> 	- Handle case for "tmp == 0" to avoid undefined behavior
> v2 -> v3:
> 	- Use "find_last_bit()" instead of "__builtin_clz()"
> 	- Convert the type of "tmp" to "const unsigned long *" when
> 	  sending into the function
> 	- Highlight in the comment that only the lowest 32 bits part
> 	  of "tmp" is taken into consideration
> 
> [1]:
> static int __init test_init(void)
> {
>     u32 mult, shift;
>     u32 from, to, maxsec;
>     ktime_t start_time, end_time, total_time;
>     pr_info("Starting clocks_calc_mult_shift simple test\n");
> 
>     start_time = ktime_get();
>     // Test with parameters from 1 to 1000
>     for (from = 1; from <= 1000; from += 100) {
>         for (to = 1; to <= 1000; to += 100) {
>             for (maxsec = 1; maxsec <= 10; maxsec++) {
> 
>                 clocks_calc_mult_shift(&mult, &shift, from, to, maxsec);
>             }
>         }
>     }
> 
>     end_time = ktime_get();
>     total_time = ktime_to_ns(ktime_sub(end_time, start_time));
> 
>     pr_info("Test completed\n");
>     pr_info("Total execution time: %lld ns \n", total_time);
>     return 0;
> }
> 
> The test is running in the form of kernel module.
> The test machine is running ubuntu 24.04 on x86_64 machine with kernel
> version of v6.14.0, CPU type is AMD Ryzen 7 5700X3D 8-Core Processor.
> 
> Hi John, Yury,
> 
> Would you be so kind to give some suggestion/comments on how should the
> usage of "find_last_bit()" be here ? I'm not sure about whether the type
> conversion of "tmp" is appropriate, though compiler will pop out warnings
> if not doing so.
> 
> Plus I'm thinking converting to another pointer type might might be correct
> when the endianess isn't guaranteed ? (or this endianess problem should be
> address and solved in filesystem layer ?)
> 
> Best regards,
> I Hsin Cheng.
> ---
>  kernel/time/clocksource.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index 2a7802ec480c..651bed1a53e7 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -66,10 +66,20 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
>  	 * range:
>  	 */
>  	tmp = ((u64)maxsec * from) >> 32;
> -	while (tmp) {
> -		tmp >>=1;
> -		sftacc--;
> -	}
> +
> +	/*
> +	 * Decrement "sftacc" by the number of bits needed to represent "tmp".
> +	 * Using "find_last_bit(&tmp, 32) + 1" to get the bit width:
> +	 * - find_last_bit(&tmp, 32) returns the bit number of the last set bit
> +	 * - Plus 1 to convert 0-based index into bit width as desired
> +	 *
> +	 * Note: Only the lowest 32 bits of "tmp" is taken into consideration,
> +	 *		 since it was already shifted right by 32 bits, the topmost 32
> +	 *		 bits are guaranteed to be 0.
> +	 *
> +	 */
> +	if (sftacc)
> +		sftacc -= (find_last_bit((const unsigned long *)&tmp, 32) + 1);

1. sftacc is known to be 32. Comparing against 0 is useless.
2. Just use __fls():
        if (tmp)
                sftacc -=__fls(tmp) + 1;

>  
>  	/*
>  	 * Find the conversion shift/mult pair which has the best
> -- 
> 2.43.0
