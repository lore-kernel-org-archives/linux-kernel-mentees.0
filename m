Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9DB24BD02
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794119; cv=none; b=N7a6+tJr0MXB1K5plGstdQSSmh7Or60rRvep6+yO2vgj9gPxNwpZcWBmJrLFcVytb5QToGvdms4ByW4c07p71qAbr/m7VT9ZgUe6ZDxDTNI4LvrPlZ7nDShyZdNoBGoJGgcBa7ZVJe0bowT1ohJ4G73mhlT72BIjqyNPnkkTk3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794119; c=relaxed/simple;
	bh=+cOmmUM74/tpV+I2t2dxh2EFwz5r9R46rJVnaQ++8g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzpsohOQcwyuHYNTQTe5DLbns8DMilVT7wMA0yL8LvEv1NEYLyGN0PxARJB7NAonuD3mrZnUT5B3CHz+quDDU66MJPOXptaNQK8SE9NCcw6VGFE0MvOoK0wvdqgKGYTFdW0qvm2cx1SizOPebpapf7KLeAneyAbgsQZ6lV/v6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hldUaDjF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hldUaDjF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c7a52e97so1652059b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 22:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749794117; x=1750398917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CJsbsFtvJh3mi6WqBDy/sZhRMjZIt1uqQYKG02JO95o=;
        b=hldUaDjF1saaFZSK5SSrkT4+BWIrjuOF3zV8en8hFimrAyk013Luxudt3s+phf28Wi
         kJVO4qv4nY8P7L304hNcPJGk+VLlJh0WJnR4pDIOf8QckgRewyRrp87AVZytN2Lg2shD
         nVqKOgqPOClbUL5RtA6BidMFuEuSRmO/4n/F9ENDEz9riq93gdA2937FJQFHOnTNdt2D
         7Cqec0WfYDdL8bP65bW68S3u4RHu6i6T9EjeNsOoIA9YjVeO0075yi2tjr+cV7AV3Tq4
         OL3FUtCnmclNweZpuYinmj34wWRBMOKKVrUw+uctKm+gGZA3+v6oDPDhiCEWTcLc+IwB
         9KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749794117; x=1750398917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJsbsFtvJh3mi6WqBDy/sZhRMjZIt1uqQYKG02JO95o=;
        b=wi5CxFbMugdJu5Nu7rVdh8sTJCE3pBIzSlgybmCjZGO3Jq3tLG9COWAlhy9BpqA4Bz
         7LygEMvBHUAcZ9oAZDvcezMhLWhigqwDZQjgIc7PFsSnGN60K4EC3f2pDVIjwc89H27E
         hqOxkDpCxLdRNB+U3/6rtwQHSA2D47jat63nQY/Ru7RINcF7WjBY1UJbGacAwJaK4+uD
         HkjnpIhmKFphbKbsCciJn1djwRPOfxUYi8wHkuxreKM7/IEV6Mb6xRmvfbRAgZWAEi8l
         2CQasqtDhhVxffPElhXQ3llY8nT3dO4DDMKXWtbkV9Yhw6SShWcazbMTy2ldUl4VJO3V
         tCcg==
X-Forwarded-Encrypted: i=1; AJvYcCUGU0f4Stmy11FF8G080qUpy8ofSbrrLhiKJW6dKqYOEceJYozrgAdCdX1br91OF/SaFgeUpqiKrB15K3wZzgTtQ+29cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YznxAEa0GQsnK5/4AMqScjigv97FDiW5DZtpdbJOZ39iTqOL73/
	+P5CSyxigAbcJwTtYTFms+s1/2TEIU81B4tA+ovuYmp2m5GzsAysuq7V
X-Gm-Gg: ASbGnctHgp3HpBmsuDFl7wxbeqIX4HgFNPY8dsYrbtW4v2EAgpjJy+aeUf/aHqsJoNC
	foteQDvipdJ5EQMfkA29FWf3yEJERW+74XIV4kYzGlXaVXyGMQu9rqdz8OJXgzLyb/ODGo54J/F
	Kw+kOlQue+FMCwxUl8yjy64LTRoGp+Blsug4CddMwv7kuzw0p+xTvnG44t5O4hINRvobTh+mrvL
	DPi0eGlgQBNVP2up3lV4oBx0M5F3m7ZQH9pLIhlqfHGv2OD5kadpTywai2Hz5/mvaws0T/5leKi
	5jxFDCqYb8eOi3xJ87Gv5Dn3951/WycUYDIAsCsumi+xOCzi/+9xmuURh+U9pkWEz+6zaa+99AH
	fsSf/hB6srNXVEfcypJKRtAsd
X-Google-Smtp-Source: AGHT+IFjqHaZvYT40439kqyyUl4MX/IbwIFjcF+jlPyoakwJlY3Ti84Z7N4Ww7tyqJbqNmhIaeDdjQ==
X-Received: by 2002:a05:6a00:2386:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-7488f73fb81mr3066784b3a.24.1749794116817;
        Thu, 12 Jun 2025 22:55:16 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d29a2sm777511b3a.175.2025.06.12.22.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:55:16 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:55:13 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: yury.norov@gmail.com, linux@rasmusvillemoes.dk, jstultz@google.com,
	tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] cpumask: Introduce cpumask_first_but()
Message-ID: <aEu9QQ0n8PEsLvRq@visitorckw-System-Product-Name>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-2-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613033447.3531709-2-richard120310@gmail.com>

On Fri, Jun 13, 2025 at 11:34:46AM +0800, I Hsin Cheng wrote:
> Switch the implementation of cpumask_any_but() to cpumask_first_but().
> Elimate the need to looping and make cpumask_any_but() a macro to wrap
> around cpumask_first_but(), just like cpumask_any() does, to make it
> more consistence.
> 
> The change brings some benefit in terms of code size shrinking of
> vmlinux, for NR_CPUS=64, it reduce 78 bytes in total, for
> NR_CPUS=4096, it reduce 2 bytes in total. The details are shown in the
> table [1].
> 
> Performance test is done using the test script [2]. Running the test for
> 10000 times, the origin implementation of cpumask_any_but() use 19665287
> nanoseconds in total, the new version of it, which is a wrapper around
> cpumask_first_but(), uses 19545574 nanoseconds. The difference is 119713
> nanoseconds.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

This looks like an invalid SoB chain.
In our private discussion, I did agree that you're free to build upon
my previous patch for further development. Since this patch is almost
identical to mine, I assume you intended to include me and Yu-Chun as
co-authors. If that's the case, you should also add a Co-developed-by:
tag for me. It might also be helpful to add a Link: tag pointing to my
original patch for better traceability.

https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

Regards,
Kuan-Wei

> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
> [1]:
> 
> For NR_CPUS=64:
> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> add/remove: 0/0 grow/shrink: 3/7 up/down: 46/-124 (-78)
> Function                                     old     new   delta
> irq_migrate_all_off_this_cpu                 716     745     +29
> try_to_unmap_one                            3380    3391     +11
> try_to_migrate_one                          2451    2457      +6
> uncore_event_cpu_offline                     343     342      -1
> calibrate_delay_is_known                     236     235      -1
> tsc_store_and_check_tsc_adjust               506     495     -11
> arch_tlbbatch_flush                          302     288     -14
> tmigr_cpu_offline                            406     382     -24
> perf_event_exit_cpu_context                  592     565     -27
> flush_tlb_mm_range                          1561    1515     -46
> Total: Before=23390770, After=23390692, chg -0.00%
> 
> For NR_CPUS=4096:
> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> add/remove: 0/0 grow/shrink: 7/3 up/down: 136/-138 (-2)
> Function                                     old     new   delta
> uncore_event_cpu_offline                     291     333     +42
> try_to_migrate_one                          2378    2413     +35
> flush_tlb_mm_range                          1476    1503     +27
> irq_migrate_all_off_this_cpu                 741     754     +13
> tmigr_cpu_offline                            353     362      +9
> calibrate_delay_is_known                     183     192      +9
> arch_tlbbatch_flush                          296     297      +1
> tsc_store_and_check_tsc_adjust               484     482      -2
> perf_event_exit_cpu_context                  546     528     -18
> try_to_unmap_one                            3560    3442    -118
> Total: Before=23448698, After=23448696, chg -0.00%
> 
> [2]:
> static int __init test_init(void)
> {
>     struct cpumask test_mask;
>     ktime_t start_time, end_time;
>     s64 elapsed_ns;
>     unsigned int result;
>     unsigned int random_cpu;
>     int i;
> 
>     cpumask_copy(&test_mask, cpu_online_mask);
> 
>     start_time = ktime_get();
> 
>     for (i = 0; i < 100000; i++) {
>         get_random_bytes(&random_cpu, sizeof(random_cpu));
>         random_cpu = random_cpu % nr_cpu_ids;
>         result = cpumask_any_but(&test_mask, random_cpu);
>     }
> 
>     end_time = ktime_get();
> 
>     elapsed_ns = ktime_to_ns(ktime_sub(end_time, start_time));
> 
> 	pr_info("Total time: %lld ns\n", elapsed_ns);
> 
>     return 0;
> }
> 
> The test is running in the form of kernel module.
> The test machine is running ubuntu 24.04 on x86_64 machine with kernel
> version of v6.14.0, CPU type is AMD Ryzen 7 5700X3D 8-Core Processor.
> 
> Best regards,
> I Hsin Cheng
> ---
>  include/linux/cpumask.h | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index f9a868384083..d91630a97d76 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -408,22 +408,22 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
>  	for_each_set_bit_from(cpu, cpumask_bits(mask), small_cpumask_bits)
>  
>  /**
> - * cpumask_any_but - return an arbitrary cpu in a cpumask, but not this one.
> + * cpumask_first_but - return the first cpu in a cpumask, but not this one.
>   * @mask: the cpumask to search
>   * @cpu: the cpu to ignore.
>   *
> - * Often used to find any cpu but smp_processor_id() in a mask.
> + * Often used to find the first cpu but smp_processor_id() in a mask.
>   * Return: >= nr_cpu_ids if no cpus set.
>   */
>  static __always_inline
> -unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
> +unsigned int cpumask_first_but(const struct cpumask *mask, unsigned int cpu)
>  {
>  	unsigned int i;
>  
>  	cpumask_check(cpu);
> -	for_each_cpu(i, mask)
> -		if (i != cpu)
> -			break;
> +	i = cpumask_first(mask);
> +	if (i == cpu)
> +		i = cpumask_next(i, mask);
>  	return i;
>  }
>  
> @@ -864,6 +864,16 @@ void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
>   */
>  #define cpumask_any(srcp) cpumask_first(srcp)
>  
> +/**
> + * cpumask_any_but - pick an arbitrary cpu from *srcp but not the given cpu
> + * @srcp: the input cpumask
> + * @cpu: the cpu to ignore
> + *
> + * Often used to find any cpu but smp_processor_id() in a mask.
> + * Return: >= nr_cpu_ids if no cpus set.
> + */
> +#define cpumask_any_but(srcp, cpu) cpumask_first_but(srcp, cpu)
> +
>  /**
>   * cpumask_any_and - pick an arbitrary cpu from *mask1 & *mask2
>   * @mask1: the first input cpumask
> -- 
> 2.43.0
> 
