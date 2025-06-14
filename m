Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376D54BC6
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 16:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749919857; cv=none; b=YZCkvgoI2p4bVjMQVXrRne/u79zwjjo2f9Q9O0RCHFe2eQVIl5+VloXnnNpPBs31+anFYsCoPUJtZMiSGBFEDa8cPZFQUWQRFsJ+pBrmbdQZIYjw09xCkrOJVyaW3Jn2Tmyfkv9yd1BfIey1+ofIIq4blVnYiVbdgCFWaDW/QQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749919857; c=relaxed/simple;
	bh=rd9D6vXfiouDoZibLkBP+KGC7JtWSXdHkWI/RtrABBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOBw9CvFP114yfj1B4H87eqasUnX6BBfzPqgxt9nPUuSZJQnDOmLuZQPRUIHIssVYvgziEiUe11eUx6G7BPDSElMyD0c5nhrFWm6I4sA4k4bPrYRmVn3YuJqukCzgZur0rSu6prPKrnuzrZ63vkmlMlzJxz2cjGVstmHTz0yCS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9tc5Wv+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9tc5Wv+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-236377f00easo43749015ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749919855; x=1750524655; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo/rTFc0fGJaKALKD1UaXa5kUFcuQAebo6syJ+Pl5AM=;
        b=G9tc5Wv+O/YvEjlKP+Q/kgLXjbvJYxmdJ+S6FJcGvrYE1bSXhW+WK0bku7tk9i/vLy
         /T61mY6wyaAflmBjjoFSQnoA1OKEd8zYUgAthoWJXiBxd8pPWuAZGKDA8nZ4xHOt5UUC
         Cg+ag/0NNQ7QOlvkz4GYuou9lkFM6cFoB+aUEPPMNf5t5msMuZZibe+szVHltWq+fBSO
         sLguJ5HJnaSu3Ew6/o8s7dayoqKKq36+rUNXdnQ+cEkUYXiu4GmSsECg7hBAL5wSrL22
         qwOJJ7OiNXxWsJe/exwwBKWooTqi+l0ooURAMlQR4hnt11zh2g8Np+IkymYUZbCkqKRr
         Ra2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749919855; x=1750524655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo/rTFc0fGJaKALKD1UaXa5kUFcuQAebo6syJ+Pl5AM=;
        b=UWI2GP+p6s9j9aBH575UubGuGVcQgTFjiOD5DazMWCw+3RiLYWdUO9YtUbWq/8GrRO
         XpEZfNkv/fR8otd8HqFtyNC7XVUg41OSYqqlZDNbZlTelDoJgb4mMkLiBDLPxdNVRhq9
         VzAWsWi1Jwdf+YFc+QsT8q7cwy/6Gi8RutwZqkAGus9crUSu/AYp2/X/Aa7/blAf874X
         2C0WFVBKaFf6y4MJ86NNz5A5RpZQsDu7lGeXxpZH9sXI8HaPlbsGLqsE1aJiYfqgmzD1
         5ko6y6yRpqHRMmDGhWErXLvhpQLyOwcxn/Z2CwdwzbUd0f5oS+4c217h0yDYHh7nB5Vn
         djIw==
X-Forwarded-Encrypted: i=1; AJvYcCVvOokWqbj+hn37AsMe80LRcknwXH7gdiVaM5u0TX8/QGuAaS72ow+74BRCDg87RvaJrdoNjHptqjwtxw2uVG9fn89ysQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWfeYPJPR7OmxPcWa3VtRbsGWYg9zD++PXCDVqwCskmhquukMi
	5IgXoyI24uAtk1uYeQMeJhsTyADX4RtVjeUAKQCL1oOIMletpJZvs2/K
X-Gm-Gg: ASbGncv4NHjMM4CgnvcRqguDkqXsW89eFT4oAmYbd0MjHG3DKUUdtQ5CJcTtHM0X7mk
	xjfLbbX7QFluHkINfIM9X/xftTzRVtM0qblXm1FLy+p/hylQLzqC/LnoBsvHQDjtby2kG+vb4hC
	4bbHU0Gv8qqhIEIL99Mr695hW7OdJjj0SV6mvVj7Aq/6XdzALh9mhB88GJg+qYATaEQ+w9YTtGK
	oqVp3pUM+edGTO3F0JhtW8xpVcm1yTxv04riP0xm1BPkZhF0RPmtrUfdvaIcVBb1Rnle8Zlcm5c
	6Ylejz8iyEuK7p0Ve2vQHvecFNp/Ay6NgcnJ0v2Z9G9anyaugoqi/rE4tekqCA==
X-Google-Smtp-Source: AGHT+IHvU25p7Riq2lVXT67dqLp5ReyxB1xy5OlCvUmmxAziHkguuCOxMB/8OgZ+cDgq1ppejNq3wA==
X-Received: by 2002:a17:903:98f:b0:235:f4f7:a654 with SMTP id d9443c01a7336-2366affbb33mr56731775ad.22.1749919854769;
        Sat, 14 Jun 2025 09:50:54 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1fa0sm32389155ad.86.2025.06.14.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 09:50:54 -0700 (PDT)
Date: Sat, 14 Jun 2025 12:50:52 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: jstultz@google.com, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v5] clocksource: Replace loop within
 clocks_calc_mult_shift() with __fls() for calculation of "sftacc"
Message-ID: <aE2obOfz6KHXRjKP@yury>
References: <20250613035239.3571301-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613035239.3571301-1-richard120310@gmail.com>

On Fri, Jun 13, 2025 at 11:52:39AM +0800, I Hsin Cheng wrote:
> Utilize "__fls()" in replacement of while loop counting
> for the decremenet of "sftacc". They're equivalent in computation result
> but the former is more effective.
> 
> "__fls()" will return the bit number of the last set bit of
> "tmp", which is 0-based index. Plus 1 to convert it into bit width as
> desired.
> 
> Note that only the lowest 32 bits of "tmp" is taken into consideration
> of the operation, since it was already shifted right by 32 bits, the
> topmost 32 bits should remain 0, only the lowest 32 bits are possible to
> be non-zero.
> 
> This change is tested against a test script [1].

And because [1] is in temporary section, git readers will have no chance
to follow it.

> Run the test 10 times for each version of implementation and take the
> average. The result shown that with this change, the operation overhead
> of "clocks_calc_mult_shift()" can be reduced around 99.7% .
> 
> -----------------------------
> | old version | new version |
> -----------------------------
> |  11500.6 ns |       44 ns |
> -----------------------------

44 ns is more or less minimal time delay that a typical x86_64 machine
is able to measure. What you have measured on 'new' side is pretty
likely a single timer tick, maybe two. The reliable time intervals for
performance measurements are within few milliseconds.

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
> 
> v2 -> v3:
> 	- Use "find_last_bit()" instead of "__builtin_clz()"
> 	- Convert the type of "tmp" to "const unsigned long *" when
> 	  sending into the function
> 	- Highlight in the comment that only the lowest 32 bits part
> 	  of "tmp" is taken into consideration
> 
> v3 -> v4:
> 	- Use "__fls()" since "tmp" is of type u64, not cpumask
> 	- Refine commit messages to match the current implementation
> 
> v4 -> v5:
> 	- Update commit header to mention the use of __fls()
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

x86 has the accelerated __fls(), so employing it broadly is a
non-questionable improvement. I don't see any benefit in posting the
snippets of that sort. Does somebody doubt that one wins over another?

The problem of clocks_calc_mult_shift() is that it opencodes the
existing helper, not that it does that by using a naive shift approach.
It may not be a performance problem if it's not a hot path, but it's
for sure a sort of coding culture problem.

If you want to measure accelerated __fls() vs generic___fls() vs this
naive __fls() performance, it may be an interesting exercise, but
definitely out of the scope of clocksource improvement.

If you want to do that, I'd suggest to extend the find_bit_benchmark
test.

> Best regards,
> I Hsin Cheng.
> ---
>  kernel/time/clocksource.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index 2a7802ec480c..1e3dc68c696d 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -66,10 +66,19 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
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
> +	 * Using "__fls(tmp) + 1" to get the bit width:
> +	 * - __fls(tmp) returns the bit number of the last set bit
> +	 * - Plus 1 to convert 0-based index into bit width as desired

Please don't explain how, just explain why.

> +	 *
> +	 * Note: Only the lowest 32 bits of "tmp" is taken into consideration,
> +	 *		 since it was already shifted right by 32 bits, the topmost 32
> +	 *		 bits are guaranteed to be 0.

Then tmp should be u32, right?

I think compiler would warn about implicit 64-to-32 typecast for
32-bit targets, which would be a false positive in this case.

> +	 */
> +	if (tmp)
> +		sftacc -= __fls(tmp) + 1;

Suggested-by: Yury Norov [NVIDIA] <yury.norov@nvidia.com> # for __fls()

>  
>  	/*
>  	 * Find the conversion shift/mult pair which has the best
> -- 
> 2.43.0
