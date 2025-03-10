Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9C227BB9
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741605292; cv=none; b=nVSrE4R0C1x+VMejDW1r74XpzaWfBFRdCHBhoWXqz8APiIvEM6ZSDcBtmT41HMymCsTxVkblBPpcJRlD2A5liycgsQEu5wHEkHWqEmm+BCSMzgVIqz2MDQbId16ysDgb4j6y1jX7IFdldDSJpxJqjda1rPj6WNx8ER+WMJ+SmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741605292; c=relaxed/simple;
	bh=J54wRrQQVJSLJARGl+xEZiKGzz8RGZc2ZSKwijSxwcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqjewJt1/1EGFEjiEbuwUcnlq9/r/TPvkHGR9CtSYR7s8kUC+w2im9qV7534bIPGLaVSEMj8rz80Gjpv/TqQHFrCqqGXA9odGW/HKVyNbD1j+HxEpr4rkJpSeNquxoc9XFeaKyQzCReZS8ydOR2hxUaGU8y09T/xhihc9E/MoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clb33jCp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clb33jCp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22409077c06so2115195ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741605290; x=1742210090; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGMLPsPxAByIoDsl/7WiYU+MM6XdL4aeR3jkWi/CCYg=;
        b=clb33jCpdPJv4hgew/IT1PeNt0EzSz6fGKqJiQ6cNvdX8N7bia7tvOkxRI4k3SpUhM
         2fBAdGjWDwV+x+aGk4kObfmUqhfWUecNdqLfUjBZnAkRrhWXoJqly89E7eGrUf/WtFnU
         +k4BAYkcXdPJgnCdo5znBPsczb+S5MAN/JvZGTuJOcff7QqSTBI+AZTDpcnhNtRzWASE
         4D0vPTSxIKe7pbk34HDk8WY9Zhc4IQzwXgrBOcRe3mgee2bJHs/NNg9lSEjgG0qAuPVy
         O9KP9yLVGTDYN+wl08QR0pDIpiFqv8GYSE36cxecqAbpdQDS55P5o7fG8C0QPtn3ph4u
         leFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741605290; x=1742210090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGMLPsPxAByIoDsl/7WiYU+MM6XdL4aeR3jkWi/CCYg=;
        b=Oi+h5JmVrhzTJvoTf9FP1xELyuzwZU06OIviNODvYsX6WkhWwk5glO/Qe+E2NhDmWH
         lKCGROIz9B74BS6ZSVBZYm9LvGY24/1Is4wROpNyUg7ksMuSz1hD9wcChnfG3HHTIDlB
         bcKrdfr9vrr8ce4wkMTzPm6evPB9l1ynvJ/Kk9VWJ7dd/93xvN3hOuoQg6pAq8dSQ03P
         YUSPxqOYY0rDqU5L6HLc0nsA7HjbWze1/D6T6b6+KIaPlCInEjmGCD6qT/3iWLIvJL5V
         6SwZlmd/LUVEPx+jxK/MClAwTVeLSBlJczBuQ0b1uxw7s9Bgn2BPd+ALai9rtpHVORk4
         joSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoxzJpdLMSjzil44Sd/8sFWgFFdaM/VBOU3SZ9jTWFI41iZIH8/s4n7kMR+vebDS2k2wU90LqPzBAqs2V94BXIaXS3aQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOZUpsqva3eBYXURLHSWHAdu5CseiwAJiKDOUsGymTTqgHbhsZ
	Te7n68lGkmxOLR/vx+/9V9B+O1AsF3I4KDRXYgwPe/R6nKThds7T
X-Gm-Gg: ASbGnctiTMFk2APxSfxWWsf1G+okvkVA6vIqPBidBRYsxRcS4mHA6pfjnMa5hXQ7ezA
	R1oWEsSiUsDiho2PPpLKvzVqMXQdJ8oMoTRoR5ppFZ0eKCWqMU4XL2flJPA+MVEGdkxIuk1bJwb
	vDIPjntdYQWiy4Oy+mAku6Yt0OL/hS5WYGeljzMEihcIwUVOnfIvBKPvJUHojDmm3VD88BMAkHX
	oMMxm3vd2yJor4+0vuY663Pw3GS6uyovEywZEfWE3eQ6TT+z7xEf01VeHPLGeHwnY5cP6Rd4eJw
	Lywlgbm4DoGGXlrHenN4LaX63BKq3M/M0fuWpAV63AokG3iF4BwrS5wee+QaVjzgcD6pSb1d
X-Google-Smtp-Source: AGHT+IEKcMqT8qMmkXop6BbmEzOjN9wFaJDBkqRHfpR/m+dq6KKezCtMdPfy5IDlm/YNjV+o9m6GgQ==
X-Received: by 2002:a05:6a00:3c87:b0:732:a24:7354 with SMTP id d2e1a72fcca58-736aa9e74b6mr16966200b3a.4.1741605289737;
        Mon, 10 Mar 2025 04:14:49 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:ab5a:ffac:d2bd:d230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736a93be530sm6555245b3a.86.2025.03.10.04.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 04:14:49 -0700 (PDT)
Date: Mon, 10 Mar 2025 19:14:44 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [RFC PATCH 1/2] rust: list: Implement normal initializer for
 ListLinks
Message-ID: <Z87JpNJU5gxN0YgS@vaxr-BM6660-BM6360>
References: <20250310073040.423383-1-richard120310@gmail.com>
 <20250310073040.423383-2-richard120310@gmail.com>
 <Z860iWGtaEFMD2hj@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z860iWGtaEFMD2hj@google.com>

On Mon, Mar 10, 2025 at 09:44:41AM +0000, Alice Ryhl wrote:
> On Mon, Mar 10, 2025 at 03:30:39PM +0800, I Hsin Cheng wrote:
> > Currently ListLinks only supports to create an initializer through
> > "new()", which will need further initialization because the return type
> > of "new()" is "impl Pininit<Self>". Not even "ListLinksSlefPtr" use the
> > method to create a new instance of "ListLinks".
> > 
> > Implement a normal method to create a new instance of type "ListLinks".
> > This may be redundant as long as there exist a convenient and proper way
> > to deal with "ListLinks::new()".
> > 
> > For now it's introduce for the simplicity of examples in the following
> > patches.
> > 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> 
> This change is not good. The ListLinks type has an invariant about when
> the pointers are null. The existing constructor argues that the
> invariant is satisfied because pin-init initializers can't be used in an
> existing Arc. Why is that satisfied here?
> 
> Alice

Hi Alice,

Thanks for your kindly review. Indeed , I was trying to find a way to
cope with "ListLinks::new()", wondering if there's any macros like
"ListLinks::try_pin_init!()" to help us deal with "impl PinInit", so I
try to send a RFC patch for it.

Sorry I overlooked "commit 52ae96f"[1], it demonstrate a good way to
handle the basic structure for "List", I'll fix the patch and send a v2
as soon as possible.

Still I would love to ask why don't we provide "ListLinks::pin_init" or
"ListLinks::try_pin_init" to support for the pin-init initializer
returned by "ListLink::new()" ? Maybe there're special reasons behind
the pin-init initializer here ? I would love to learn if that's
possible.

I tried "Kbox::pint_init" but it
wouldn't give variable of type "ListLinks".

Best regards,
I Hsin Cheng
