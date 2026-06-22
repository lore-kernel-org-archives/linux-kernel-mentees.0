Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8D38BF81
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117841; cv=none; b=PNHbZMYq32N5itrsdWKp5P/uz+iNEvNqk9sNFLpVaJDFVSL58VHWjdRsTNfwwXR93WKElfR965AVcVyyX2T4zGgzLN/nT/64C4mrrfbYL8E3/IDl2LSxJbiOOvbL+YY/KiMO8wsy8WPJQs/0g1HtcDMgOe786Iz8WMxDsuskfrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117841; c=relaxed/simple;
	bh=g0gRsy6zFiomxjase+ZA4WZlkxxDYp7gD/XOpVGQPhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heoUq0wS/gongLMF/ApQMVoXWRej9SinfzeV1HeM5psTTec8JtuAUH5Vz7Gp5Nc68R2F8PeU8NK4CMlHmOu1WVv2uwhjP21B6x37VpqSyW56cagQCHpB0bFA2ZFcAsbAbTGliekSTAhjOxBZ7WazJn8O/5TThsx3f+rF+cFGMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UudAfglO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UudAfglO"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-befee9e5ef7so503740866b.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117839; x=1782722639; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LR7honTOmyUatu9A73ADWJH5CaZ3n+G3Y/QkgDQI0TY=;
        b=UudAfglOsnuONBFgXve0vSOq1L2c0kr2rRaxHp3jQXdFkrImb9QU76mrhtWysYVNrq
         kLQ954BQmk1gqVTC3n1eTsSnPG6Ld3HH5G1dyoKG966gfEtJ8S3KIpuuYGjeQwdWSqeh
         YO83RqwexzJDIbc3F9YhflgFBL415W6c0zClN1UGDPJ/WY9+APVfINGu9Gq99UzJKUas
         9RKS0kSja99ODwmOkRc0I+dzMR3gAGGF9lm6Wi0gp9RRszNqXf76lenfIn4K2ZkXwP8y
         NWnrjmqjEsOyun49DEKHY2DEu4hAqK5rixqcusJOWFeiV5zwj85Y3PfELiEb7t1iJZI6
         COtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117839; x=1782722639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR7honTOmyUatu9A73ADWJH5CaZ3n+G3Y/QkgDQI0TY=;
        b=piSo2jvnf2WWzjM8wpvvSu5x/B3iASc9sFkMDtyhKblYVHBZkNYC/CAHFtDVYez6Y8
         ykj6O4YCAU7mMuO9vw0/CQrnlSWH4NsdyQZ7U5xysoLdy8tgf9jah7DJzMocqycZdlMs
         uVPrdSIJ6rwR231pQ1x8MU+ybhH5k3TJfbo3LB3Z+1Q62WyW3EdaFCZ0dWDRat/avqaO
         THg3wCFfO5Hzl3OsRrMiH238OMgYe/UqYJTXyUVScSzrwOj92kgQCeqtpCtpXZT7wfPB
         iHxMDs2IDnWT/U8/4bHh2McnmwfZrkBxJH3CT/6UEIH2/ju5dFPQ0tvZzJIfDPJD/PGU
         m17A==
X-Forwarded-Encrypted: i=1; AFNElJ/lD+b75gb9SgP1qRWfsfOU5rKIo3Ifr2V/VFn4qb0bEWiqTGXsQW2n86MUwmgDY5ohnNuuYYTScRdpV7rUKY8EiH/CJw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7nq9q4mNMfo4Awv6cHEctxkf0Nmnp/pOfYKeLN/R8MvYdik1C
	bKQ2Iy2BrtfG8nhnDJRTgxSjgXcP1GfFt1QRDgh83GHHGrLEA0D26Q6Y
X-Gm-Gg: AfdE7ckjRCgsp4mm9RihZIIRfV2EYhf+O7QdfpIE/uxKL0/iikmUDN6x4b6m/glhunP
	8UeAtbYhjMzBCvnGbep+RjnFaw4/uub3R56+cNBe+IZ5qRmCAPEfoqkQ9egCSghZNa5IURMqPRH
	nasYU1zbtobzMvOXnyLRWx4vBhOsbk/Y30j+jMyBv8vjEDWjrCRxGffQQZDNkLKfqgzBoebTWni
	9Gaf8zehxYN5JG5Q4hFeuVhCtVFguXaiW+66v6d397ROkwWrwHdnya6aosr8y3/+ywLSaBvWodZ
	ga4ePWBdz/upKQAJf1Sh6zjO5/RYgyWhizhkWne0ClpFsWZeM3gnwt98e/6hCGHdtiFEWzTiS1c
	E7zyahUlUizrc9DfXSvPCQITFYa8qRtLObXUcNXxXeO66xw418uxIfUPtG/wFrlwZn+A/0BF92z
	MqobsAlwHB
X-Received: by 2002:a17:907:c12:b0:bfe:ed35:e859 with SMTP id a640c23a62f3a-c09904f9097mr699871766b.53.1782117838777;
        Mon, 22 Jun 2026 01:43:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5ef8eb38sm313992266b.28.2026.06.22.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:43:58 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:43:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sajal Gupta <sajal2005gupta@gmail.com>
Cc: linux-raid@vger.kernel.org, song@kernel.org, yukuai3@huawei.com,
	tomasz.majchrzak@intel.com, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] md/raid5-ppl: convert pending_flushes from atomic_t to
 refcount_t
Message-ID: <ajj1yljwrUk0bZwp@stanley.mountain>
References: <20260622080656.22786-1-sajal2005gupta@gmail.com>
 <ajj1WdhoW-Y3GE4Q@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajj1WdhoW-Y3GE4Q@stanley.mountain>

On Mon, Jun 22, 2026 at 11:42:01AM +0300, Dan Carpenter wrote:
> On Mon, Jun 22, 2026 at 01:34:32PM +0530, Sajal Gupta wrote:
> > The old atomic_t based counter allowed ppl_do_flush() to continue using io
> > after it could already have been freed by ppl_io_unit_finished(), leading
> > to a use-after-free.
> > 
> > Convert pending_flushes from atomic_t to refcount_t with a proper ownership
> > model. The creator holds a reference for the duration of ppl_do_flush(),
> > and each submitted flush bio holds a reference until its endio callback
> > runs. This makes the io lifetime explicit and removes the need for the
> > second loop in ppl_do_flush().
> > 
> > Fixes: 1532d9e87e8b ("raid5-ppl: PPL support for disks with write-back cache enabled")
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/all/ajJF2wKYWRk4GGCK@stanley.mountain/
> > Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
> > ---
> 
> Have you tested this at all because it doesn't seem at all correct to
> me...

How I imagined this would work would be:
patch 1: add a break statement to fix the use after free
patch 2: s/atomic_t/recount_t/

The difference between atomic_t and refcount_t is that refount_t warns
about overflows and underflows.

regards,
dan carpenter
