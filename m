Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59119D891
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Mar 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741250983; cv=none; b=LUnRwvXRc2bGEXAroCd+0KroAe6aUr/7aJlSRdIp5VEKcJL4PRWC6afc8PYUQGtooKj38D9/JKauhKgXFxdYe2PoSR8CICcrQU9CoQhAOYU17uyKwAvWu6dcfrEcfQAmRk6OMWKsnPOJTQ4/PCtlyACKXsaYoDu14a1jiy/rwtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741250983; c=relaxed/simple;
	bh=+JMIF5nv1JW6AAUeomgberOu7YOgUGgzWRtym6vZ8jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/5x5yGWk230HQYT1rTNgvoRsrZH2b4G5M0BLyuAvkHMJ/F/K2UkOMC7Ukm5dnqmJOXhRTjmVhWBiWN5h+CL1AhwM2wIyzXpp8tnrDSG0MAOXX2BuggZs3pdnW/pgd+1DLuuBEEw3Ph76go+RrfeWL9Cly7CcN4Edm6tD8EDP0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wwdpT5qp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wwdpT5qp"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22403cbb47fso6128285ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 06 Mar 2025 00:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741250980; x=1741855780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOTsx+ET2udwRwOl4LMvTIaV72hOacAVf21e+cPMpSk=;
        b=wwdpT5qphgmfnBZK6VkylGPs3jUuJQTcTYo6243vVuYrBNSXVzGgDs/RxF2F6j9Aqh
         iLmoQU3pqn+foYA6/aqyYAAp+BfEtKTiUWYYPLx/fWNKVXiAx60Kmxo1ADvdqPeU+YLb
         cvTZdoIZfQtwC7zVBsU0HgX90Pp6ErQ3QLy8ZgQirI1pZ/GWarKgGoatPSzPkQE/9i3V
         MYGT2yO06FJn3R67Gj0ieqlpKbYidF/KGLZWjE4NCwuA8ZsHXqnaVJYZnQSFL/PlufCy
         nIe2c0cYa4jIRBsfZT8X5hjxTennSOZM+xy3KhKi74a6AzM+F2Bw4QsD47+Iim50chWD
         I7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741250980; x=1741855780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOTsx+ET2udwRwOl4LMvTIaV72hOacAVf21e+cPMpSk=;
        b=tFryTNkAmsVU4LEtx4TPl6TumORk3QqrAafiR/WdvqesNwKh6INzQFpNKGav1JwnJS
         BqwiKB6KmGFLUmSH9If10HZ1lqymDYG/UymLGU2hY2N7uRA3B828xCK4yKeU4880JP3E
         //IGmWGf1PgPOVl9JPA/D4DHJGjYp/y2hNh9yx4oFp9p8W9H8vHvNo6qXxapYBByaRrj
         UAdWxoJtObXgJ5fNvNb310HCnrh8FzFn/UeVkXQjjwD7O0aFogX+bFho+OBI0SEdUSBR
         wpVxlYWnMakP2aDBraiOH43x6wOMPFz+9HfU59aR24CP6LJgtQgaZFQaIWFOTUOML7Hi
         KBtA==
X-Gm-Message-State: AOJu0Yz7mDkaMrAZm0jowHn+5n732BNFBu28bcd6XoHghj+Bfj/6FJYT
	0zsUSTzj6uR1bPcM9E9mD022OxrAJxPJ2vlnnMgRQYFOFJZIDNemF91ji80JFnuPcbUZbASwNXu
	c
X-Gm-Gg: ASbGnctI0N97pzD+/DNCyTWwdXHWMD0nvoTyr2dFFrTHVxFgZBX0GebBVM8bQv/aVWD
	fv4CuJmt09s07VCu3L744OZp/oL+qXIgEUHmJ7ON3IIXZpaFpcseBDnlLV+Zq24aMshhcJVQrrR
	2qBdwUXKskNrWySWPOs5/R58gYHchVnP3FiUapPK3czKcZ6avghuCe9I5KJSX/dgK1D7cJRK9vd
	YESczfuYmy4LBt5g9lZL6v5UiFnoic2S8LETDo0S4cZQZld4k8rfpiEMgBEGeKLs2jzw49EXLKq
	mHVm5+Cp2IhtjVH/05/jx96PnNXfT3REM1M50CGG
X-Google-Smtp-Source: AGHT+IH1GEQtPc3doXxTnYpQvOe64EMdhiCow6f81zGlmJXK3+o6BGbwtqTdcVYdbtsYbbFP1fY7vQ==
X-Received: by 2002:a05:6a00:148a:b0:736:3fa8:cf7b with SMTP id d2e1a72fcca58-73682beac25mr8907211b3a.13.1741250980111;
        Thu, 06 Mar 2025 00:49:40 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:2536:10cf:d064:60bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736982077dfsm799045b3a.35.2025.03.06.00.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:49:39 -0800 (PST)
Date: Thu, 6 Mar 2025 00:49:37 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ignacio Encinas Rubio <ignacio@iencinas.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: riscv: fix v_exec_initval_nolibc.c
Message-ID: <Z8lhoTd3BwPWQ0f_@ghost>
References: <20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com>
 <Z8jG1ViOUbw79cEN@ghost>
 <f3bde84d-b53e-4b81-b995-3b81d614b789@iencinas.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3bde84d-b53e-4b81-b995-3b81d614b789@iencinas.com>

On Thu, Mar 06, 2025 at 07:31:22AM +0100, Ignacio Encinas Rubio wrote:
> 
> 
> On 5/3/25 22:49, Charlie Jenkins wrote:
> > On Wed, Mar 05, 2025 at 05:39:28PM +0100, Ignacio Encinas wrote:
> >> Vector registers are zero initialized by the kernel. Stop accepting
> >> "all ones" as a clean value.
> >>
> >> Note that this was not working as expected given that
> >> 	value == 0xff
> >> can be assumed to be always false by the compiler as value's range is
> >> [-128, 127]. Both GCC (-Wtype-limits) and clang
> >> (-Wtautological-constant-out-of-range-compare) warn about this.
> > 
> > This check was included because the "dirty" value is an implementation
> > detail that I believe is not strongly defined in the ABI. Since linux
> > does always set this value to zero (currently) we can safely remove this
> > check. 
> 
> Thanks for the review. Just after sending the patch I noticed it should
> also remove some code that becomes useless after this change: 
> _prev_value_ and _first_ variables were only needed because two "clean" 
> values were supported.
> 
> I'll send a v2 tomorrow. I'm guessing keeping your "Reviewed-by" and
> "Tested-by" is the appropriate thing to do as the changes are very
> simple. Let me know if that's not the case.
> 
> Thanks again!

Yes, those changes seem small so you can keep the tags :)

- Charlie

