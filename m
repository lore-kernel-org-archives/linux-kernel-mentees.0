Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5513D1E485
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652006; cv=none; b=ofbPQr/7iG51Ail2iMewfPJmTn5bIEmgnER/L50u+gobbN5Omd1H6ZKYBUoepkFw4sjbdF0sUNQhqszmW1wBf0Clhh5TMKIVcdq3qudGdB1vvffLH7CnfeQEjUrJwbkjymcbOtBVxTtNhhrlEcnanOt8xbShY02d25Gas6rwOe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652006; c=relaxed/simple;
	bh=t0kpz7pvCeH8E2yL46QfBqaRY/4ZUJel5yFsSnt9ujs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmutvALaIqPy6hZcitqprig1gTNXwpnQw/aVVHuDH+6joLBzro4jbebqC8T4s3sg3kXElLkLwefk6a0LLY4yUtsP+onHQC6UlfJ3Zm65/FlWaivO+QP9xNG89WaFMyNNNCPrHlZlWBhvBEwfqbknGwo3tqza8E7Fy72+nJnOgIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZW5BBwdc; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZW5BBwdc"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso5000042a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749652004; x=1750256804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DraqQelyt+bdJU5+YFLLhDQGQccP2q6ONNc7M1b6iwQ=;
        b=ZW5BBwdc7RD8q4AYKzNLjC841AJi3tEuR0peUuTT6KG/ayia62F9zv3xPwUs0qPSCH
         wj30sdScJNo0yfVpa6UVEdFo7Ri+DbJoQyU480QKA/XjgisqfdFqBHnnfzzDBcb4BY0I
         IPc9z4MZTaAUJ8bWVoA6DAFP9fn7iL+eHlPTmxJdtY92u7O2Vo95SImILk6NB3AL7pIW
         5DDYIvBp2Dl/Po4EOQfjGQRvITMdHrniwQvxzlys3BNdA/8e1tLUVFWe54siiyoU0PWk
         Zf++s2ujLuOXOSBHilU4Du264xLlSF+ZVZE8HKpCpT9yTa5gCh5YI0CBpvSui08F6e/4
         Ow+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652004; x=1750256804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DraqQelyt+bdJU5+YFLLhDQGQccP2q6ONNc7M1b6iwQ=;
        b=WdK1i7wf9PNKxI7n3Mci481jg5gucMSdNLb/dKMaf0jI0Mb/RduFi3iXaT3OEzhBSy
         7yzu9g0+J9SPePBP76foYGx9b1BS7Jo8mufbmPfD2Onp7O+kJCrc1CsR2XJt+tREOOBV
         EEyATtZRIcV74465lW4QWKbDEd3eunnNNvDLPLMRsnEvB14/VWqn/6HZsrDvHmFkgo8M
         rDlZ6GLwP83HzI1NxRsSh+eQGYVAo7NqcAJPDNrKWt6uHXAtMcXizsRqJbiRdSyrcz02
         TiNkXkfw5dPeDKjlS2JA4NbEJBMEBFed2J68b9gjUZHnIkuOBW538nUfmCDyRHknuiNQ
         tNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJU0XBNp/Y+dJi6YLHMcIQ+qeKIqAre9ym8J0pDf6ojTq4IymH1jGAlpWDtzbrp3EhcTNldDZA8tg9jEFYbPkh5bhtCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoyUcJY9cFATA0aLXDvEB/U9doWxWcU/Jjs6LfVRGdPs1mvWMr
	CIlu5wzKenN4SFyl0KPkVDAMBu2abSDMhomiaS0qVhg6Ck9VOWquAuDjMe/0WDr/
X-Gm-Gg: ASbGncvSOdlx9i45M8/TvVxlzIvVyz/2qMjCXlZkBC0NSgToYnMTSMuJrXgR5z72DGl
	6Z61aUVAhukVON3RyyXLckx9Nd04IMOW/W/yUNHE0U8BawIu56YRCIp1LsDlp8sDcIE96rCr2yE
	P0JRRXM7pSLuYy58xbzNAK9YNV3BED76I4N7M1BL0k6qNxsNDchLsj2asvXd7/765UGzg8KKzSC
	GAqt7HX824NI13AoAopwSKOIPPX+XTAqSPMiq9NvYlqpeLj5JNpsxAtfYuhE4H5u9cGQuaKQw1C
	ixdBNTZLtgXc1vyghuMpEpgmnGwoO2QRpG8J/JD53kC4LLFeJJs3SASij3sZT8Zd/bPkQDR3K0X
	PHw==
X-Google-Smtp-Source: AGHT+IFCy7pJmrhs4pVrZNcNeETyXGxqD+9XpTLoLS7EYamXpVVm7nhNsOc/iKkxIxzO8Vo/DPb30Q==
X-Received: by 2002:a17:90b:4cc5:b0:311:2f5:6b1 with SMTP id 98e67ed59e1d1-313b1fbe77fmr3324748a91.22.1749652004380;
        Wed, 11 Jun 2025 07:26:44 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:2c7d:4ae3:493:2da6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b2039bfdsm1346088a91.36.2025.06.11.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:26:43 -0700 (PDT)
Date: Wed, 11 Jun 2025 22:26:39 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: jstultz@google.com, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, yurynorov@gmail.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v3] clocksource: Replace loop within
 clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Message-ID: <aEmSH50geb-2qTBb@vaxr-BM6660-BM6360>
References: <20250611073608.2049793-1-richard120310@gmail.com>
 <aEltbEpA7US9h8qN@yury>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEltbEpA7US9h8qN@yury>

On Wed, Jun 11, 2025 at 07:50:04AM -0400, Yury Norov wrote:
> On Wed, Jun 11, 2025 at 03:36:08PM +0800, I Hsin Cheng wrote:
> > Utilize "find_last_bit()" in replacement of while loop counting
> > for the decremenet of "sftacc". They're equivalent in computation result
> > but the former is more effective.
> > 
> > "find_last_bit()" will return the bit number of the last set bit of
> > "tmp", which is 0-based index. Plus 1 to convert it into bit width as
> > desired.
> > 
> > Note that only the lowest 32 bits of "tmp" is taken into consideration
> > of the operation, since it was already shifted right by 32 bits, the
> > topmost 32 bits should remain 0, only the lowest 32 bits are possible to
> > be non-zero.
> > 
> > This change is tested against a test script [1].
> > Run the test 10 times for each version of implementation and take the
> > average. The result shown that with this change, the operation overhead
> > of "clocks_calc_mult_shift()" can be reduced around 99.7% .
> > 
> > -----------------------------
> > | old version | new version |
> > -----------------------------
> > |  11500.6 ns |       44 ns |
> > -----------------------------
> > 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> > Changelog:
> > 
> > v1 -> v2:
> > 	- Refine commit message to explain more about "why"
> > 	- Check the frequency of "clocks_calc_mult_shift()" get called,
> > 	  it's not in hotpath on my machine, refine the commit message
> > to avoid overselling it
> > 	- Add comments for the code to explain the implementation in
> > 	  more detail
> > 	- Handle case for "tmp == 0" to avoid undefined behavior
> > v2 -> v3:
> > 	- Use "find_last_bit()" instead of "__builtin_clz()"
> > 	- Convert the type of "tmp" to "const unsigned long *" when
> > 	  sending into the function
> > 	- Highlight in the comment that only the lowest 32 bits part
> > 	  of "tmp" is taken into consideration
> > 
> > [1]:
> > static int __init test_init(void)
> > {
> >     u32 mult, shift;
> >     u32 from, to, maxsec;
> >     ktime_t start_time, end_time, total_time;
> >     pr_info("Starting clocks_calc_mult_shift simple test\n");
> > 
> >     start_time = ktime_get();
> >     // Test with parameters from 1 to 1000
> >     for (from = 1; from <= 1000; from += 100) {
> >         for (to = 1; to <= 1000; to += 100) {
> >             for (maxsec = 1; maxsec <= 10; maxsec++) {
> > 
> >                 clocks_calc_mult_shift(&mult, &shift, from, to, maxsec);
> >             }
> >         }
> >     }
> > 
> >     end_time = ktime_get();
> >     total_time = ktime_to_ns(ktime_sub(end_time, start_time));
> > 
> >     pr_info("Test completed\n");
> >     pr_info("Total execution time: %lld ns \n", total_time);
> >     return 0;
> > }
> > 
> > The test is running in the form of kernel module.
> > The test machine is running ubuntu 24.04 on x86_64 machine with kernel
> > version of v6.14.0, CPU type is AMD Ryzen 7 5700X3D 8-Core Processor.
> > 
> > Hi John, Yury,
> > 
> > Would you be so kind to give some suggestion/comments on how should the
> > usage of "find_last_bit()" be here ? I'm not sure about whether the type
> > conversion of "tmp" is appropriate, though compiler will pop out warnings
> > if not doing so.
> > 
> > Plus I'm thinking converting to another pointer type might might be correct
> > when the endianess isn't guaranteed ? (or this endianess problem should be
> > address and solved in filesystem layer ?)
> > 
> > Best regards,
> > I Hsin Cheng.
> > ---
> >  kernel/time/clocksource.c | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
> > 
> > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > index 2a7802ec480c..651bed1a53e7 100644
> > --- a/kernel/time/clocksource.c
> > +++ b/kernel/time/clocksource.c
> > @@ -66,10 +66,20 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
> >  	 * range:
> >  	 */
> >  	tmp = ((u64)maxsec * from) >> 32;
> > -	while (tmp) {
> > -		tmp >>=1;
> > -		sftacc--;
> > -	}
> > +
> > +	/*
> > +	 * Decrement "sftacc" by the number of bits needed to represent "tmp".
> > +	 * Using "find_last_bit(&tmp, 32) + 1" to get the bit width:
> > +	 * - find_last_bit(&tmp, 32) returns the bit number of the last set bit
> > +	 * - Plus 1 to convert 0-based index into bit width as desired
> > +	 *
> > +	 * Note: Only the lowest 32 bits of "tmp" is taken into consideration,
> > +	 *		 since it was already shifted right by 32 bits, the topmost 32
> > +	 *		 bits are guaranteed to be 0.
> > +	 *
> > +	 */
> > +	if (sftacc)
> > +		sftacc -= (find_last_bit((const unsigned long *)&tmp, 32) + 1);
> 

Hi Yury,

Thanks for your suggestions !

> 1. sftacc is known to be 32. Comparing against 0 is useless.
> 2. Just use __fls():
>         if (tmp)
>                 sftacc -=__fls(tmp) + 1;
> 

No problem, I'll fix them up in the next version.
Just wondering the reason to use __fls() directly, is it because we're
sure that the value of "tmp" will definitely fall into
small_const_nbits() case in find_last_bit() ? 

Best regards,
I Hsin Cheng

> >  
> >  	/*
> >  	 * Find the conversion shift/mult pair which has the best
> > -- 
> > 2.43.0
