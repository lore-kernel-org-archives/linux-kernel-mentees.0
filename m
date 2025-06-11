Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA22BD589
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652241; cv=none; b=mNlCP+EM1a/VYKax26eLs9CsZdPvFbD3z3FOhpVfw4N1DbrU9OJh+C91GfL7FhvysKVKKLsTG6I3T2MUcYHvJZ50c0VCn2JGTrajlmkPkdhOWqXnPSRPyr0OcMv8gkaodsM49ecadYCoqV2390cKfFgEnjr6VAP3oz1cHz92B3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652241; c=relaxed/simple;
	bh=aFmitG4GGLZP2RIysH0rFcAxmrewRQ4O1r7kUt3WQyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbYmp0/ZAOnJiW5mdrSVlK4DBy6UKtsWsakuJk+mLh7RVl4nFOl7Cvs897FgY6mSLU+h0IyvJ+Y4epjcr3M+dwXMIbjueYZuq9f78lFznzbLGm+qPCeN5xbEhKBk+gYgRibVZDcHqhSBoK4xzDxjK1UABQLoHgFReMBgApSssys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEdax8a3; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEdax8a3"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-408d7e2b040so4232773b6e.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749652238; x=1750257038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enQPgRCJmFw7LiR6Wl3Xr1k68TxIo9wg2ECQ7hgm09c=;
        b=iEdax8a3n8aVR0k9wav1rlg2EH7gjxL1Sr+ks+gbzSE7Odo0CkjsJazTlhXQy+4krr
         42FhCuQRmeYB3s19iMSOUeLaZfPLzVQcLlqBHZpeVoawKXddIyneoxG+YQZpqrqA8IHa
         yA3kgE3DM+gOp+wYRU2vqV11l42l9iXcqjJkU5oP8gyfSFRICIFb1awnZOp+P6LOUGxi
         mN7i+92Im8mtdMsNzDAaSQsafeaNqF350R5+8+rcvhDqJF/41q4WkZoTGa0Bt3tWFWoD
         OKd6tJ1BEYySq7xMZB3Dh+nW5J/dS378pcU+wevFjMBuYoNSxttXb6WVYgzDtv4xcHXi
         aP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652238; x=1750257038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enQPgRCJmFw7LiR6Wl3Xr1k68TxIo9wg2ECQ7hgm09c=;
        b=rwIMQAKiD2wnSe+edcg1iyZm7ETqvOpyGGImqohyC6C6B9y8G2tfVIzgxwb1YtI7FO
         roPqszhf/CuJafksqX1Ksu2aJ0jKaIr97xlxMpbrxeSCSxnQiM5j7INZfPO1fFgXLVgr
         WJfAlAOzdZeFQJtJ/2OYULe7osRteru0iKfMKegp8jeSqPtBVPsKCL01BzhY7YHbF3GT
         DsDINkLFKHDgofMeyt/RhfXsoeajp5vKljkpmTQk3saprCMM2vV2CKlIUtBy7mhqe6+D
         PBIr2OZ9unhWj99Q/ceSj8VUqREv2idxfQcsXRJf8LLpuZ7n69e5x8enPDPMKTJ5coNw
         vHbA==
X-Forwarded-Encrypted: i=1; AJvYcCVwCGhn0p1I0XnlPx0mofxLeELy81cMlQEdlr1dVqepznfJH+2nRqPsUmAlr/JcAObkgqEJ9HHmNEIfgYZwis5Ui9CYqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNT1NBzWqG0tGGyOx3SyME41xlciyzy9m4v03j0FXa/xn3Lq0S
	TkQ1yWytGSMQEEYB47rQjK8DvCcdNzJBmSOcAtCHjJdgrn80ypo8s2lxivO3pA==
X-Gm-Gg: ASbGnctOa/hAPD7jShpg3YHf5uM0oFUVIGYf5YSPFSfS88976kl8ToJjM+iM5ZC1bLr
	5WEOF3jiBpUd6A+kHMglPsf5EA2ZQXcXzMRIqdTxdKevgmKe3th8rTaT/FvHkmA/45X5gJEnJcw
	uPZyrnGxtes3jT0G50sB2Rj4gwxxz1DM19FJBWWNG2z055grxtMgj+Vq/lk9gcGoIrCF1QgeDLX
	c6CUFyYNHQh2qpr519a/tmi+ZoNLu5Ei9AQQcP6mTRfYH5QzzmThnnO2Cp2ZHY0kRHCGJdbJSrS
	OLe2hACeUEyF26j/XOnq4C6tKFtSBm5Gc12xTRwTt9AkwehcNrpdCuidlWd6dwdeZ9jyBPP/
X-Google-Smtp-Source: AGHT+IEnHE0kT21oftfwsFW+OjfecHVoI/p6aDA1O1Vjub713TCN6oc5+A6aaLJ5zxZu4lw4K5Xq3Q==
X-Received: by 2002:a05:6a21:999a:b0:1f5:8eec:e517 with SMTP id adf61e73a8af0-21f8660015bmr5487664637.9.1749652227533;
        Wed, 11 Jun 2025 07:30:27 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f782594sm8558433a12.60.2025.06.11.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:30:27 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:30:24 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: jstultz@google.com, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, yurynorov@gmail.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v3] clocksource: Replace loop within
 clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Message-ID: <aEmTAMc9stMWMMI-@yury>
References: <20250611073608.2049793-1-richard120310@gmail.com>
 <aEltbEpA7US9h8qN@yury>
 <aEmSH50geb-2qTBb@vaxr-BM6660-BM6360>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEmSH50geb-2qTBb@vaxr-BM6660-BM6360>

On Wed, Jun 11, 2025 at 10:26:39PM +0800, I Hsin Cheng wrote:
> line
> In-Reply-To: <aEltbEpA7US9h8qN@yury>
> Status: O
> Content-Length: 5191
> Lines: 144
> 
> On Wed, Jun 11, 2025 at 07:50:04AM -0400, Yury Norov wrote:
> > On Wed, Jun 11, 2025 at 03:36:08PM +0800, I Hsin Cheng wrote:

> Hi Yury,
> 
> Thanks for your suggestions !
> 
> > 1. sftacc is known to be 32. Comparing against 0 is useless.
> > 2. Just use __fls():
> >         if (tmp)
> >                 sftacc -=__fls(tmp) + 1;
> > 
> 
> No problem, I'll fix them up in the next version.
> Just wondering the reason to use __fls() directly, is it because we're
> sure that the value of "tmp" will definitely fall into
> small_const_nbits() case in find_last_bit() ? 

That's because tmp is not a bitmap. It's u64.
