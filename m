Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1BB1FDA89
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 05:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749790963; cv=none; b=IXfP7R962ks0DwGxXAzGbzm4TqZ5NE4OpDbLjXUz1sJ1EtScn50AFF7fMgjxgPCkaCKr/tVT0GOQBOCVLpSlUe19a37D+zDXI9IUZQ8rc9F1oOeVPck5s/kpVutiazQGnjt9Ps2kfNXZiQuR5uXw47juZRENWYoY3uFoHeWkBU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749790963; c=relaxed/simple;
	bh=ih4/xa2KkoXBJlt31uSLZyLlwq1jhZSsfTgNn0bdHtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNncFiUvUwA1JLJtcOOCjAWw1v0ekQoVLVbkaDxqSKgz9CYgY4pQ8olickrkgG8EOXRGx1Gg3wnlq6yuWdbIkslNQdy3oyyipdqslvh6L0h9aVmPvQMm6P3EA2/+nLn/SnfjNcxqDhMV4QrFLh8jbCEvvT2+GoUMtRYDZ9WQioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdQVYI3k; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdQVYI3k"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3138e64b3fcso1600046a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749790961; x=1750395761; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcwj3yAJ7pyDvm1tu7+3gSa4GtMgtj32T0lLORRGnzY=;
        b=UdQVYI3kAyXMCRO2+1RQSh0d6zExFzoDEZY6WxxGt3mHViQa03+jFhPqvDQByUuL7O
         6SV843I+QpxKqbsMON0/uM9ZhZm2jvy6OcYmZFMH05sYzB+n/LWZJeIfTPkYvKgmSYky
         iulOfufcdK0A928zzkPhwtcYXe1nYGREgpfAXnnpwGbCdcKFYGKw1YuVeyx8AAfzMfGv
         FS48FPkBlUTO7w+wQZCzHJvfYvp5Mwu7IQyqJfglqG7VCnsikj8ljOLDBp9Cr/1/v4Bj
         ne7KIcuwrYXoVCuoFYMndaRas9AsTbixXZ4VfXLMdGlzznV4Yc8LcOMMfp6KPL3ny5P7
         yPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749790961; x=1750395761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcwj3yAJ7pyDvm1tu7+3gSa4GtMgtj32T0lLORRGnzY=;
        b=Pn69jnePo1ukPl1OrASp5GwAWNEGiPfQklVmDJJjWxS8DFacfOAA87xzIKlWVg5KZq
         Q6vPF6sjq94rP6TOXVed5L/trRpl5FPlUvjL/AR+4fO92Ss8Gf2IFohJrwt3XHmZTAG7
         sH2o5yxTiRSFqoQGQZBKKKoKOoH+y6gVLdVH/h5hSxqmdLGD4QeEniWRc+Z9GnvRaez3
         bszoLoHR9inCjII2QozEVt/eypPjLPEtw6apJ2bvbHH/qlPhv7pTByb+pB7wdxcJEaLm
         dvrmLfgUERkPzdFdhvHqK+eEU1e+molmJObRoT+ARR4JugQjwPDVbEz1eNV1UTqdd5WA
         VTwg==
X-Forwarded-Encrypted: i=1; AJvYcCW6r1vXcSaiuQ4enxNYBVLXcgHd+3STnvkwCJEGtya1vCwra50kWygOYQRVetrXksxC3rUU8dyuONWEDaODQewNP9OF7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfTXp3z1JDDHYAMrXE3nz4ubwnrpMQ2gfu8gx5xJoGlPrWExY/
	b4YpwPVr9rbx+VOF44YMNXWWWRn8d4QF97POVd/AwxQNoNYKth8HDbv7
X-Gm-Gg: ASbGnctMckCoprd8MNrcKTexN8zKP3dNu9ZFChLI/LUDxTBeF7TMuEHlHSdWQSVoy+f
	hRkQwepfaDUQ4O46rTTLB0vJLWo2HY5dKMOJz6BZ8/ai/9aqOuIvT1d2fiMeoWKQLSp/cmVXA85
	wImiaFi5uDsqFfjeOE0G3i7YHg+8pax6BWU/qBYWtlJWqsUMjYYQI0xMmsiftEbCSw8mwrp1O6v
	H6j8jt5ugL4EYkBVhUseUZiJLi0hW5zXHKqNZrcW9FfgyEHZD78D2qpHkre5vMX6FBAYusFRY2k
	7hkOSCJYyrvE98N4wcbGEPF2vHSPFgbeawuGkdDC3pH18RdPOPns5VXNrNUnzA==
X-Google-Smtp-Source: AGHT+IHj9asMbod66o6NA5yopeZ8imOgK1x8/waa6ZVfyYqH+0n6eUNCQ3F6hlYMLPVZggDbqcln+Q==
X-Received: by 2002:a17:90b:56c4:b0:311:9c1f:8524 with SMTP id 98e67ed59e1d1-313d9c7a6bamr2790183a91.15.1749790961390;
        Thu, 12 Jun 2025 22:02:41 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782fcsm5915585ad.104.2025.06.12.22.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:02:40 -0700 (PDT)
Date: Fri, 13 Jun 2025 01:02:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEuw7ls9hieUv_Ox@yury>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613033447.3531709-3-richard120310@gmail.com>

I Hsin,

This exact change has already been submitted by me and is under review.

https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/

I don't understand why are you undercutting my work, and moreover do it 
for the second time.

For the first time you submitted something that duplicates my another
patch from the exact same series. John Stultz has pointed that, so you're
surely aware.

https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/

Kernel development process implies that one makes sure that his work
is unique and doesn't break someone else's development, at one's best
knowledge.

What you're doing not only breaks this rule. You're in fact trying to
get credit for the work that is done by someone else. This is the
definition of fraud.

I cannot make sure that any other patches from you are unique and
written by actually you. Therefore, I will not take your work anymore.

I encourage everyone else to be careful working with I Hsing Cheng
and check his patches for uniqueness, at minimum.  

NAKed-by: Yury Norov <yury.norov@gmail.com>

Thanks,
Yury

On Fri, Jun 13, 2025 at 11:34:47AM +0800, I Hsin Cheng wrote:
> Utilize cpumask_first_but() helper instead of first using
> cpumask_first() and then cpumask_next(). The logic is the same here,
> using the new helper will make it more conscious.
> 
> Use bloat-o-meter to check the impact on code size, the result is the
> same, does not have positive impact nor negative impact.
> 
> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Function                                     old     new   delta
> Total: Before=22590709, After=22590709, chg +0.00%
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
> Generally speaking, I think this is just a small tweak on the code,
> making it more readable. However, no benefit in code size or performance
> as the implementation behind the helper is in fact the same as the one
> used here.
> 
> Maybe more tests should be done to ensure the change is solid, I hope to
> seek some suggestions from everyone who has any ideas, or this is enough
> then it's good.
> 
> Best regards,
> I Hsin Cheng
> ---
>  kernel/time/clocksource.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index bb48498ebb5a..12ff0c048570 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
>  		return;
>  
>  	/* Make sure to select at least one CPU other than the current CPU. */
> -	cpu = cpumask_first(cpu_online_mask);
> -	if (cpu == smp_processor_id())
> -		cpu = cpumask_next(cpu, cpu_online_mask);
> +	cpu = cpumask_first_but(cpu_online_mask, smp_processor_id());
>  	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
>  		return;
>  	cpumask_set_cpu(cpu, &cpus_chosen);
> -- 
> 2.43.0
