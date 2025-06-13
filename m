Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DCA1F4615
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 03:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786652; cv=none; b=Laz+uft4UIt7r/cNQxfvgFnXZB88WaMs/oC9PWuJh1mNiU7wMQHR5tkWhRffzRtQjrH4DqQslQv6c7gw6oY0J46QPDY0L74u9KtthWZsLfm3Csvd0zLWqbrnyqhyVavRHtlVm1um5+sXCZnP+HIYw+GAtNap6ffQ+aqHCV6tN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786652; c=relaxed/simple;
	bh=FyREV5hEansDy5kWBpgh8hNq7Eo2WS5fk7zt/lg1QGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHsik83cKz4gK3kNf+y9uWVPv3hZeJOXE6BmyrcpXGaoURjYc7DS+baF7Vg1c4RQw/95ljD6/9u8GIa9Z4/qJeCZtvymeh0QHLtzCFrbeAOFvyc+/iyrpBL1pED2cSl6cpVFIDZzEHh2IeCe8Y9BcUHyIYlJnHWG6w7jXRw9/eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTZQvLYu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTZQvLYu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2350fc2591dso16214425ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 20:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749786650; x=1750391450; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgCY2yYF7kvXkiUfI0GdU1rGAEtR0Z0q4kcX+OIu/AU=;
        b=MTZQvLYuMnnj8xQU7nODwBJg/XJ6jyw5lxzvEoPNJQhASQOnjAhMmWftaV2Y/An26p
         Nz9+jETrS2G4HxIXtBKPgwhpGSX1clJuwEuEo/Hwx9A7dPtkcOxqx6IjZtQ8iplJn85f
         vTQQymxGkfh9lS4nlfw24qkO+HchqwQVUW68FyenZuWAoQdSIQkaOt7SuGHsAAMlKC7U
         SSWkNqn5wQqtWXYcsh5DWl8xzSdNAjmiGFvhdC+CyybLqTTkNUmEuarG/EtFSZZkIhzK
         N67EYIFQqlLNJLz8nnRAMcftTUittqud0yoEewHtDriUAum+D3zR4UcWa2b4Ha+DxL7u
         SgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749786650; x=1750391450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgCY2yYF7kvXkiUfI0GdU1rGAEtR0Z0q4kcX+OIu/AU=;
        b=UTeY2a6nxz7V9wog/yn4rMTJ1UrUAM0vPh92txOGKYIs6C9iHZDu8ozp3DgrbmYRXe
         tE4H+boV83KHzAVVcNKPLAVl2mio+wW0qd1z3mZEDbEUjG3rPp/bDxSGnmR2lozR21HI
         efbfdVY1melN8tmZxNsYJ01GBXpak4vK5OIcQ+MpluctCdeAoWAeCjUACP6cjVTFQI6x
         yY3/h1Hg8ZFgWY521vxaFRIJplU6iYrVUVs8H7va7o+6NOoG+EIN7lzwiAXjc6m/+FQC
         SBXuBPlvbki4zAhhmrl9vZmAl3nsNN4YUP89Q1mmRXRUSfhj5/iqybe4M9OIQibeLBpx
         AVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWchY86Y1RXqJaUK2Bf4FAgSw6AVRWn/X19nazVd0306WqDkNMnbQNBlPujUb9XY7VueMR7R1Yigxn3gXyiWhiZ+RWiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXrYKaszQ5pvY6lrv4x8DVx8TlpVSmQl2lxBGhiI329yqRweNK
	aScvOuRxUK730fYoXL3r5aAw3lZQY7NrJDSzXoc54zAU7lXnUOObn4J4
X-Gm-Gg: ASbGncvEOvWPVEMI0TjdY9rrMRvwGoEOyymtJaZpAY0BCaVyeG6VqfV0MzU3ZN53Bd3
	ftF+QJR53okMkj6N2gpV8srUfnYDD5ZnyaBc2IE3tnlzuRlNUEluQCSizFgw7eRnan2JIIl9AsH
	RcDMvz0pPnT9cIsVnUCQ3jTb/U3lt0NyT8Ds0S/q/3JuN69y7yZfBuuVmfflfP2KcHq9wkX2olX
	CXDxLq1Y2d8r31mwX7zNwtI0tEPuRFTkHJ6tRWaENlHn2h6LTa38P27mMegpv5hvAH6mdJ4JOpZ
	5VVOWL6IwFvN9rOuDhxfEIMh3N7Y3QiEVdaLQe3Z3XAuL/IEXn1UmAsCCdQJNBP6/Bh0UIgOHv2
	O/Pc=
X-Google-Smtp-Source: AGHT+IHxEICwCyHWrI4lAodRLJ/Ysbk1Bpm/8tFZlLZNEMN4v82oAgvzJPiBbGtq7KH8W3FLWPZMKg==
X-Received: by 2002:a17:903:1ace:b0:221:1497:7b08 with SMTP id d9443c01a7336-2365fb73f8bmr16766035ad.23.1749786650493;
        Thu, 12 Jun 2025 20:50:50 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a17b4sm5160995ad.60.2025.06.12.20.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:50:49 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:50:45 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de, sboyd@kernel.org, yury.norov@gmail.com,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4] clocksource: Replace loop within
 clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Message-ID: <aEugFauKbuRZlfBz@vaxr-BM6660-BM6360>
References: <20250613034855.3570641-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613034855.3570641-1-richard120310@gmail.com>

On Fri, Jun 13, 2025 at 11:48:55AM +0800, I Hsin Cheng wrote:
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
> +	 *
> +	 * Note: Only the lowest 32 bits of "tmp" is taken into consideration,
> +	 *		 since it was already shifted right by 32 bits, the topmost 32
> +	 *		 bits are guaranteed to be 0.
> +	 */
> +	if (tmp)
> +		sftacc -= __fls(tmp) + 1;
>  
>  	/*
>  	 * Find the conversion shift/mult pair which has the best
> -- 
> 2.43.0
>

Sorry, forgot to update the commit title, please ignore this one, I'll
send v5 immediately.

Best regards,
I Hsin Cheng
