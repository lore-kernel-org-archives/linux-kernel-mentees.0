Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8F52D949C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766646505; cv=none; b=N3cDzFWSX3ZCxMKKs6x4OAzzxIaG95cRkWx52kMevfdoTsCSbwiObmXrtyBu36XrvvJeYr13FEivd29BI8b4DSOIo2g211zcpOvDVd/K8qPgldiZhtQEh3PED8/nuqundqZbCAc7HDRBiG6Zmer6lX4okk7KLc/e6hgVlBp/w/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766646505; c=relaxed/simple;
	bh=CG/moFFtL/ZvcK2sU4KPzNBuRMark1gy0LiWEe6P/58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHtAQlGySe5/1T8tTzI4NbNJdDFxJTvJLDNxnMim+ZHeEx4wQo1IQyziuN+SsqjKmJfWeA+dX3t+6kRyakSkGWcuiLRHtVQehlg5bkewAnrAY0hHoXZWFIlTNABdDmBsorSmr3+hYbmdhaynucP6br7WFPrNsdnKcPUMygi07nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yv8vMZOq; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yv8vMZOq"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a09d981507so46211395ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Dec 2025 23:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766646503; x=1767251303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2trtGlNXZKZVCUn7XC47iovlx+cgHeYtiSGP2VJpxo0=;
        b=Yv8vMZOq+II7xfusWim4uN90djdjDbddMuAxhTUZCZgZxE11qbf+lQtk6pgKB7dOcO
         bNLOlLG0PkSjg4c64GxFGrOThm55WYqxA0IBQq6cLaPuInWr4dAat2Jmn/XI5Mge4OhQ
         /GmYXUR4rYXKUnWFXi7aQJmb9Q5SoYAJri4CaWPTeFgwliH5ks/APtdKQHchRJskEqzw
         cncwzRBEjyK4Rh7M3uzktpRvEqC7MezEBIu5E1pY/Tc3NO/C0efDrZYVlH+fCJZUjkMw
         /4aAcP7fqfB4ol9bm/c4F0g9o72ELIyh4KGm7V3RHdyMSWtkP3rUiE8RAQuhh8zTtdQB
         rd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766646503; x=1767251303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2trtGlNXZKZVCUn7XC47iovlx+cgHeYtiSGP2VJpxo0=;
        b=JH1HLotYrSG+UdeW9ljjW1Ngk+ktbtGr4fGt8USvMuxFJsBI76PnCnQAsuMxxCTBls
         iOdki50F80bNd8gw70ENeN29HTkqg3dI19HtMXV4mw6tFKDmiWIo1mZQQyjkiFrTS4Jk
         TLgnwv0m4PYAEf7+R0VUGdwvooEHRXAZCIapK7jkFHPcpVY1W8oSeVJ//wb0KBdiko0e
         Ni8rUyElwSE/y/cfo7gbn+lQfwC4kToTBIlNucVhL+3+DXWofkbkxqKdSA7i5zNMLErp
         ImEtMJJ7pXXgKV49nygHDJWTlDu74/Q2fvp30PyHcPc08+bTobypW1k/lhDkZATck3AM
         kKVA==
X-Forwarded-Encrypted: i=1; AJvYcCWhsKAytp7qqbAwhFJKx4JxjQsvjnxW+ZHmsdR45hsbLbIb2ZdAHTWWgFpQQ91JGXG1ptce0VOtuc/VmMCTgsFBfAE2Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFkVp5p9il47yw6wk8qvu0uTA+fJPADBD0PRtwE5mhd0AMuFs2
	NCrwbSk6UbTkpJoFY7stGIZcRMCWmUDTeigz7W1tSFnmqM+uoIXSAevV
X-Gm-Gg: AY/fxX7MK0n2cA6h3eCppawg+gvIKPSV2f53gn4djfcnr+OzZdjmN88D4sgcTKiSU0i
	s7ZBl1Lrxra9SchdJ2GXnsfH7v1akT9neL/vipe/NuJYiN4Hgmyl16PoMseQBswtZ3pHXxjPy6P
	w2rrkYUAFQ8jp3LGtnU5px0pX4cJTM/R0s7tAndxt38grSkLS27z/kJ5excMI6Kzuu5Byid+JQl
	J1nh+PPx6LOWuo7PCz2KV3+aZmiLEK+bysKiRTPVImwmFHgB244+iMX9VeNuVORXA6AkmZP9RL7
	hhD9U3Yc71QQIHJNPItYLSueGu4TeLNYZ8TzU2OFMPcTGTn4b6fVz0nIGQcKn7Q1yXeiccAB+IN
	xlBDHbMl+OiaDaFkJCw7RnU9WDmD5C6H4ff/oVYbml0bG9TtlPsYNzW0zsX2OmP4DQXzc3PgXRh
	d6A15vABoi23c=
X-Google-Smtp-Source: AGHT+IHj4b0UoCCHB7eZW9m4bhaWfyAyco74NqzkA7/3+8fypn8585Sl5u634QiMVlYAcwKXwYCnGA==
X-Received: by 2002:a17:903:2307:b0:29f:2734:837d with SMTP id d9443c01a7336-2a2cab74c17mr267904165ad.28.1766646503484;
        Wed, 24 Dec 2025 23:08:23 -0800 (PST)
Received: from inspiron ([111.125.235.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6d557sm169812195ad.84.2025.12.24.23.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 23:08:23 -0800 (PST)
Date: Thu, 25 Dec 2025 12:38:15 +0530
From: Prithvi <activprithvi@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
	brauner@kernel.org, jack@suse.cz, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] io_uring: fix filename leak in __io_openat_prep()
Message-ID: <20251225070815.s5ahm4t7yfd6irjo@inspiron>
References: <20251224164247.103336-1-activprithvi@gmail.com>
 <dc51a709-e404-4515-8023-3597c376aff5@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc51a709-e404-4515-8023-3597c376aff5@kernel.dk>

On Wed, Dec 24, 2025 at 11:01:55AM -0700, Jens Axboe wrote:
> On 12/24/25 9:42 AM, Prithvi Tambewagh wrote:
> > __io_openat_prep() allocates a struct filename using getname(), but
> > it isn't freed in case the present file is installed in the fixed file
> > table and simultaneously, it has the flag O_CLOEXEC set in the
> > open->how.flags field.
> > 
> > This is an erroneous condition, since for a file installed in the fixed
> > file table, it won't be installed in the normal file table, due to which
> > the file cannot support close on exec. Earlier, the code just returned
> > -EINVAL error code for this condition, however, the memory allocated for
> > that struct filename wasn't freed, resulting in a memory leak.
> > 
> > Hence, the case of file being installed in the fixed file table as well
> > as having O_CLOEXEC flag in open->how.flags set, is adressed by using
> > putname() to release the memory allocated to the struct filename, then
> > setting the field open->filename to NULL, and after that, returning
> > -EINVAL.
> > 
> > Reported-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=00e61c43eb5e4740438f
> > Tested-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> > ---
> >  io_uring/openclose.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/io_uring/openclose.c b/io_uring/openclose.c
> > index bfeb91b31bba..fc190a3d8112 100644
> > --- a/io_uring/openclose.c
> > +++ b/io_uring/openclose.c
> > @@ -75,8 +75,11 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
> >  	}
> >  
> >  	open->file_slot = READ_ONCE(sqe->file_index);
> > -	if (open->file_slot && (open->how.flags & O_CLOEXEC))
> > +	if (open->file_slot && (open->how.flags & O_CLOEXEC)) {
> > +		putname(open->filename);
> > +		open->filename = NULL;
> >  		return -EINVAL;
> > +	}
> >  
> >  	open->nofile = rlimit(RLIMIT_NOFILE);
> >  	req->flags |= REQ_F_NEED_CLEANUP;
> 
> You can probably fix it similarly by just having REQ_F_NEED_CLEANUP set
> earlier in the process, then everything that needs undoing will get
> undone as part of ending the request.
> 
> -- 
> Jens Axboe

Sure, I will send v2 patch incorporating this change. Thanks for the 
feedback!

Best Regards, 
Prithvi
