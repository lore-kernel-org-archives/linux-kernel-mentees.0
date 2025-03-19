Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF9A4A0F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Mar 2025 02:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742352143; cv=none; b=BAvXzm6XVShnZLTSCdLfOYcASRWpGvsaE5pMXmX+LlHBKhMqrpKXeKs4B6ms5Y1xkbcbZHYeam/+akRoA1MvPBhKyyYXI3Zsa1QZOd+KWtnG/LdaheBUWbmZWPPpLQWzxZHJ5fF5XRhZp8u1juq66AYH8S25NThL5/CkeQDxAQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742352143; c=relaxed/simple;
	bh=Yj6T0X/2HCiSmRuSpotaTytF5PjAW7Yi0axKCWTjt/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQBirkUnfVeViUiT+X+YpxztE6Ct5FYC55URWo6WDxdfZbixN5XfAgJXUWnrlGCMmLJU326vv/Oyl6Re+rACMDR/7H+CcJC1ydsIqZepPVCTcIohwkCT+vtOd9Bo3RvCWLx4OuXNqaHHii/YjiIH3u6ULjL7JeJJ3oHBr3PZeK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ7iEiaa; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ7iEiaa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223594b3c6dso136998245ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Mar 2025 19:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742352141; x=1742956941; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5LIIm36cccYbao7TAk4Hq5YU6PWgxen0Sg9TmOOAtlo=;
        b=cJ7iEiaa2yuSiNoQM3Kq5smZNfnM7VU+uK2mqtZipQG1fZ3kBl+RsmgBkCxO3KLPZp
         /O59X0zSQvYFAciO33aL9D0E+rPaNjGSBrHMc5Gw/Mgxjcfmu0tyFEdAckSv6j37mRIc
         l9FwPr9L7owOxHdNup1y9L4P1RsKhM/yWgDP/rVojMRuGtgxEB7pjUxS2lYxiy/ogEEW
         i94/5J6TX3N+ORFKeMIQOBPe4EEbju4Bn9soXddjdvQMaG+gX7RDXpO+eacFrrOuUHRm
         coJTibTGcJC5TT1RBWj+gaO6uJhWiYwsi5HXN1ecHaQubIbS+B2k0FSbJ9igFvcYRfWq
         goNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742352141; x=1742956941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LIIm36cccYbao7TAk4Hq5YU6PWgxen0Sg9TmOOAtlo=;
        b=EWcjjXShOUragGly1GaRYsYpk0pwrrPu0DE0m3/rBXfVzPmdavtC1uXPsME5z4I+k3
         cKu2PpORxbAGBqoYjoUNc1n37KK7QWHze+eWbAIZX3cZcISzIGAUimpgB3hWDuTcEKDy
         piOXlyxiKKbuppnvvBk1rIJOXxD4yH+en6moNoZMdlPd+5140Zymk17Ip+frdK7qOl5+
         SRn6y86nmefWOrftEM+adsByxIoqBqsH1dxdSz/pumCGh4h0/W03Jz7Sgv+MrnZTsEmr
         wUHAW4kGhvjV/f1zxgbcUZaFy6ZGw7P++sVhggLUpIFS4yHnlcjOiZjVbho7m+N0+BSF
         ZcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYYRLzb3y0rkGkV1y5PBpPrbLQnlXYsFh/E/snfIyS0XfN/tgaC8INmoef6xpv0aAMzkEd51Y1u3XjlzCox/ezbmyudg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsKrqbl1EKWpfFrMogSa+5oZvHMn8asL5yUlV8bNsLv/scFNQC
	+0w0gZcZwuOc5l+0Vp1z23DPs38t6QYbE02KDHWSI0PxnwJpjcks
X-Gm-Gg: ASbGncuyfKMajrejs/9bjxiOSPU4t8pqmkTRn5j1FXlpLhYzfZDZgEUJN5beHK3EXko
	H5YteYs3XHUTgZ6fjkseVuyyG+8xa8lvJIgOJs/Jq7Rq7H/eBq4KqR7QkjsdfZaR+/Uj4EZDPwL
	+u8YzIQ8Irv1Py64AQKdjaRvlqSEgBfJujdu9YklSsF0W8Jl0OzcXwKCKkjGr732gtUAi5k/pUz
	R5F9IV18nIlKuERiD/7/AtImqYKpoZ6iIO1yMpUktpLYKOAo8JSIygFt1ZoHhJtCRoDqtHh5SVP
	VIu/NwdFEg8ogKqz23kGX5I4+gu12y+ygCZEX4W6kV1CO/VcTc9mpa19RMh75w==
X-Google-Smtp-Source: AGHT+IFMTPVzGmKOB0374Xwm8ymMGdht9WZf9KthbF99f4vKTy64/tyWlMgtJ/3VRoo6H4DyUbtn7w==
X-Received: by 2002:a17:902:d54a:b0:223:6657:5001 with SMTP id d9443c01a7336-22649c8fe35mr18839615ad.40.1742352141212;
        Tue, 18 Mar 2025 19:42:21 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:2ccc:91ef:96dd:9ad9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbfdfesm102855595ad.203.2025.03.18.19.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 19:42:20 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:42:09 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Wenjia Zhang <wenjia@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, alibuda@linux.alibaba.com,
	jaka@linux.ibm.com, mjambigi@linux.ibm.com, sidraya@linux.ibm.com,
	tonylu@linux.alibaba.com, guwen@linux.alibaba.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] net/smc: Reduce size of smc_wr_tx_tasklet_fn
Message-ID: <Z9ovAYqk8lESCug2@vaxr-BM6660-BM6360>
References: <20250315062516.788528-1-richard120310@gmail.com>
 <66ce34a0-b79d-4ef0-bdd5-982e139571f1@linux.ibm.com>
 <20250317135631.21754E85-hca@linux.ibm.com>
 <6191739c-93db-4a7d-8e83-3168909315cd@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6191739c-93db-4a7d-8e83-3168909315cd@linux.ibm.com>

On Tue, Mar 18, 2025 at 09:43:07AM +0100, Wenjia Zhang wrote:
> 
> 
> On 17.03.25 14:56, Heiko Carstens wrote:
> > On Mon, Mar 17, 2025 at 12:22:46PM +0100, Wenjia Zhang wrote:
> > > 
> > > 
> > > On 15.03.25 07:25, I Hsin Cheng wrote:
> > > > The variable "polled" in smc_wr_tx_tasklet_fn is a counter to determine
> > > > whether the loop has been executed for the first time. Refactor the type
> > > > of "polled" from "int" to "bool" can reduce the size of generated code
> > > > size by 12 bytes shown with the test below
> > > > 
> > > > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > > > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-12 (-12)
> > > > Function                                     old     new   delta
> > > > smc_wr_tx_tasklet_fn                        1076    1064     -12
> > > > Total: Before=24795091, After=24795079, chg -0.00%
> > > > 
> > > > In some configuration, the compiler will complain this function for
> > > > exceeding 1024 bytes for function stack, this change can at least reduce
> > > > the size by 12 bytes within manner.
> > > > 
> > > The code itself looks good. However, I’m curious about the specific
> > > situation where the compiler complained. Also, compared to exceeding the
> > > function stack limit by 1024 bytes, I don’t see how saving 12 bytes would
> > > bring any significant benefit.
> > 
> > The patch description doesn't make sense: bloat-a-meter prints the _text
> > size_ difference of two kernels, which really has nothing to do with
> > potential stack size savings.
> > 
> > If there are any changes in stack size with this patch is unknown; at least
> > if you rely only on the patch description.
> > 
> > You may want to have a look at scripts/stackusage and scripts/stackdelta.
> 
> @Heiko, thank you for pointing it out!
> 
> Even if the potential stack size saving of 12 bytes were true, I still don’t
> see how it would benefit our code, let alone justify the incorrect argument.
>

Hi Heiko, Wenjia,

Thanks for your kindly review!

> > If there are any changes in stack size with this patch is unknown; at least
> > if you rely only on the patch description.
> >
> > You may want to have a look at scripts/stackusage and scripts/stackdelta.

Thanks for this, really appreciate! I'll try it out and see is there
anything different.

> Even if the potential stack size saving of 12 bytes were true, I still don’t
> see how it would benefit our code, let alone justify the incorrect argument.

Hmm I suppose smaller memory footprint can benefit the performace,
though I agree it won't be significant. I'm not sure how to do
performance test on this function, would you be so kind to suggest some
ideas for me to test out.

And I want to ask why's the argument incorrect? since I only change the
type of "polled", maybe you mean "polled" itself should be an integer
type?

Best regards,
I Hsin Cheng

