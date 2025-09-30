Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26341E260D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240056; cv=none; b=dGwfsRkjFuCiZDnjsguFTIIYXsh5igGVfa83mCruOTJURiRVKYqbTGLlJymJwfHsb1K+b5QbXEJ/g/bu2F9A9LT0oq+t/q3JOI91tkRxbxku5qAMatB6ITVYgo+iQZiAVfX1ExNcFLDVkiEIAsXPmPG24xNfQO8bQbDJYuixvvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240056; c=relaxed/simple;
	bh=djWJ3WSoFOE7AAiVgSgO9kaO15CNySawak1vG1iZbXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ukfcy3uZgCLySkcf/quJ+KTGHUfp0JZulE6UW9DlEm2bX9SBbq3S06LxpjIpoR522GcV0Cu+iK1Sph15ZcQT5kRF4yRz6DA1uG3W/6V4AGyR4c1kyR/2S3ySTkvh0sXREaDDpO6bM8reoFB58YTMUG41zcHaMXhLwTYHxX6KIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ1Fp7C5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ1Fp7C5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26d0fbe238bso45848865ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 06:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759240053; x=1759844853; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jMdofcUVGSrS6vDNWwFHz9+M//WqgG/7b80iTTRoas=;
        b=gZ1Fp7C5bT9QsM9vhzCt1ToAakElpDkbBcsqTG8/J4Orogv+PiOriqppMvOTxrGYZC
         YG6RcTbgQ2UatUf7u9Myab7iMDQUNNaRh4an7XRcF73CMfEGgopyDKziX2z/XJmkdPQG
         couY6v5Ed9Ibusc+dpOdyu+TZS3DvR/MZFPBsx7UHLgTaFQ9idOQxgGN1GYsL1SBkrqV
         P0JsZYCcb02OI/VaVPiwNwfOa48zaXnKk8gogDypPxkGc8UWcKYz1vvSgKhwQMMHFWz1
         u0/juAnEPiXFibe/yEBxbkSSDiTscbU04grHpG0UwKoM5BiP9KV9ghtOUwRxjKWOb0ep
         7eRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240053; x=1759844853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jMdofcUVGSrS6vDNWwFHz9+M//WqgG/7b80iTTRoas=;
        b=HwAOOk5jEn3xDIh3/lThYAS+P7rr440SCxEA+ebGJHbN4H1Nsiu3JSNdL41Y5lPEJD
         +eIW+dW9saWWLM0xY+CuE7k1E5XaPxxtCNpRfgf70QWdO5elOP2QJF1kxuHVcPUDmzmK
         nvIti8o7FOcOHyygqB/Jmy8ZAi3SbmzY+rEy7ClQzFNY+r9Il4GfNufyfcUBBxeu2MVl
         RI4rOoSmae/Z3uaJeaspWlppgqZ9CjHNHrTC1dxaHNx9ACPXmB6kHXxg5qzZ3uTtyB95
         8gHIHD5GZwzYs3E7zYo2KmgDEiwHI/9G5PcRc6Qtf6XinRoXQX5p2ZzyZehA5GKb6Whm
         FVAg==
X-Forwarded-Encrypted: i=1; AJvYcCXXeoIlmwBZzTjC1rdsSXWggTQjyy8IPrcKo9Oh+qKIJrwix54YzZ0aiZCohv63Mi1tiVwVANoBMAg2oymVoeP7X2qxyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGNQ2vaPYVOXj0z+2S/28FqaskhJZsLUru/YxnvbC8sodMwhHB
	CYC43jtLDGzl92r2SiifvXkT1pcMQNJLGAeRjdNdBjRCT4fysRpT2azx
X-Gm-Gg: ASbGncttXkgCQRQt9cCZk6dOyTea5/1nv201O72juMLglal5OcMnEfeUTwTOoelf0Bc
	TV4962TETD3wS8xBzrW9sjKZClVEGzrXAfHjuoqilULu73+2xhfhacgsbOcAZxvIIpLMGMsOcFD
	uvBsXVpZoDPmr4t1tarJLcP9+Fp2azz8JZBx/6NlM1hQ68bKw8MmwJyQclqaKfRagf8DDwaAos5
	aQzQCKdV5J2Lhp01S5jaFVjf98AVoK3yVhx+Sd+pk2ECm4eorbXEkcJi1qpXInUeIRFg/9YtZ8h
	Jib3chKnqnB+1xKN559U/JGztsqtp/Ve0YsRmdyVH6lVBaT2cfglK9e7dxQSW2QjdNdfgePYpL+
	6Z5ifRTdQrUKqO3uYpzCs607sJCV82rTLIpuWbylPQr+PYyvHzk7sKjVnx35m
X-Google-Smtp-Source: AGHT+IESYq35TAQFLeBWF4OxglXdXWfZV95e+sPc0Kl6L4WvW4KjgdJME1j4/hRI2m+l8euIgk7tPg==
X-Received: by 2002:a17:902:f650:b0:24e:81d2:cfda with SMTP id d9443c01a7336-27ed4946b7bmr211097935ad.0.1759240052489;
        Tue, 30 Sep 2025 06:47:32 -0700 (PDT)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-281fd60835bsm99535715ad.19.2025.09.30.06.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:47:31 -0700 (PDT)
Date: Tue, 30 Sep 2025 19:17:29 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net-next] selftests/net: add tcp_port_share to .gitignore
Message-ID: <nebdn6xrcevewtcv6hbumf5tdh4p4patujhdojc7hn2yppwil6@jqbfz7q2ljth>
References: <20250929163140.122383-1-krishnagopi487@gmail.com>
 <aNucABvb0PvBtCxr@horms.kernel.org>
 <aNuci8Y9ZO9pd0Ua@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNuci8Y9ZO9pd0Ua@horms.kernel.org>

On Tue, Sep 30, 2025 at 10:02:03AM +0100, Simon Horman wrote:

> On Tue, Sep 30, 2025 at 09:59:44AM +0100, Simon Horman wrote:
> > On Mon, Sep 29, 2025 at 10:01:38PM +0530, Gopi Krishna Menon wrote:
> > > Add the tcp_port_share test binary to .gitignore to avoid
> > > accidentally staging the build artifact.
> > > 
> > > Fixes: 8a8241cdaa34 ("selftests/net: Test tcp port reuse after unbinding
> > > a socket")
> > 
> > I'm not entirely sure this qualifies for a fixes tag.
> > It is user-visible. It's probably annoying.
> > But I'm not sure it's a bug.

Hi Simon, thanks for the review. I also feel that Fixes tag is not
required for this change. I added it based on this earlier
commit(7ae495a537d1):
https://lore.kernel.org/all/20250307031356.368350-1-willemdebruijn.kernel@gmail.com
but other commits similar in nature dont have the fixes tag, therefore I
will remove it in v2. 

> 
> Also, FTR, fixes tag's shouldn't be line wrapped.
> 
> > > Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> > > ---
> > >  tools/testing/selftests/net/.gitignore | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> > 
> > I notice that tools/testing/selftests/kexec/test_kexec_jump
> > is in a similar state. Do you plan to send a patch to address
> > that too?
> > 
> > ..

This has been already addressed and will be in 6.18-rc1 I believe:
https://lore.kernel.org/all/faf206d8-ccd8-48b5-8e7e-d596ddbbcbb6@linuxfoundation.org/

> 
> Please note that net-next is now closed.
> 
> So if you do respin, please wait for it to re-open once v6.18-rc1 has been
> released. About two weeks from now.
Noted, I will send a v2 for this patch when net-next will be reopened.
