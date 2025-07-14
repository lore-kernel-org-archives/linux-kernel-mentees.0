Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263AC263F4A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752520440; cv=none; b=P89l6pgEi3cK+8H6Sv0xtsbEqBeSMpTWSC4/VE31rnK/JDgIBHMMrg3iEjoqY3XG7Rf7Pzo5e8FrEUc9ZBhj0zDrubXWGgWDRpfw7vTmnnrWDy6LHsiJG7GsEY+lfsPUc3m61Pd8wct8Wjb+np/oCzc+ihMrwnwb7HwVuEszCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752520440; c=relaxed/simple;
	bh=aWSA0NeB2N8SKMfIQkj++0xm9IpdgexztD+pfuz+xao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJuLyQbj4AtM7qHOffU9RMA5CjeU8pckkKJMWQX+uy2XzfYHs5xQZ0ZX737H+RgzCpwGhzgXglYRfre2++2mWJtH9He8nBl9eR5UjAOU5qsGUM/ZK3ekROpwaFk6/ER+9peXSXWbpZKqPk4JXupv8O+YENP3/u7JbRc35s/B8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YEb4uB6J; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YEb4uB6J"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-41baecbdd33so342b6e.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752520438; x=1753125238; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UVaYjGM1v55Zie9CqXx+YSNagSNn6vwPpEb5of7g80=;
        b=YEb4uB6J3jticVAU3mNog+Hpi+nLsm6FTCIkc0WnMSvg/Ff2O9XVONVrX1Vu3DtmJ+
         yeztfPd/cvVOkvtI0glksOkH53y63nSkwFziKZrlrYb8dMYnvwAmZsDfwQOkbsfu/7DU
         NnP4EVU7sLcuih2DuT/ZgaQssrJQ2xdVRzMbgYgmt6tNJdF5cm2YUWbusioKNQOLeqBZ
         EZ3LSdV5i38nqiIMEe9fjH0WX8utftFwUgKRSyN2+k5qPBAc217/lPxSWpd9oo9ImQJX
         Nmdv+b16QxIsLP3dpz6ZlS4BXX4dL+V6plCqVomQdztFV4hM5btb9nOAGipPr4P56tVz
         0WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752520438; x=1753125238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UVaYjGM1v55Zie9CqXx+YSNagSNn6vwPpEb5of7g80=;
        b=nuvsTZnNSdJZm2uxhHjRtUympY4Gx+cVBGFiwzECBdMU5wZHn3Id/2LGUW5b56Yukq
         NYCR3GIre9O9s8NGwQ0L5dRuJhazlhpA5Lj9lETuaeZ1JFFZ4z9cmmg3+M7E3eAiI9yn
         axZDRKQqnacshw1eQDJJ+sCxZ4j3PRzZ0ZcwTbmZKRWI9t2xkyZ3efS2A8r2Pj0M8Pb7
         7Ybt3qGm7aNNrd7rn2p5vQXJT36KVFRpyXFC6o/1qfsChxQDVrk80OJiGLX+jeMnzCQ6
         +9a/94Zw4QP8DtONSvsl/juG8K2UTokoMTNhG6Xe+WoRj+tGTerwyCpq020lwH9rL0Bt
         CVvg==
X-Forwarded-Encrypted: i=1; AJvYcCV402m8ZVnbsVPONDda0+SnBML5hJ9cdyhyPxa8anKkxoZeorkr/5Zlf36VqRCBFaJ9Tey+JKxHR33bpm+Aw+pFv2xWfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YykyO0xEiIVnFgX52NMHgkqU/7hT/Bk1/0envrrwIxSkABQyU0l
	/KXORiJ0hCoJ1hvRzpyhA2xrKSZFo8+55UbT81P7PPiqCm5X45Q/yoA4Poqo+9HwEH8=
X-Gm-Gg: ASbGncvJaToMJEI9OpIVU4oKq9IHL4STI4HlWp0Oz1nzYWw5k/GCkVlnHRE4yFFdCIQ
	vwd25A1Ia9oGiX1A03xrCkmez1tEEJmDoGa9v0YhKZEfRChUFR5Lm8jelwb3d/3VmANH8lsTlFg
	kzGqF3Q82Q2i1qTTl8gVKqvCWSM8LQ0cfGWxqHoV0n/2TXGpLJ0v2onUFvPt+IWZqv4iVrzjIWv
	LFUQKEej+N0skatlVKolgLn1kSXbkVskNq2AVSJZDjQBSStx239PZp/+sx6/MrRbh79AVjGC/Np
	sWuxK7K4iYtK9A2sfw7Gruv+A13S3G2WruqBU8uP1ty2YYAxLL0Xrt+j8m/AJq7CHOjkeMGUi4K
	mgZz2iDPUZ6CxIkbkxABgFMpn/U89HRORTv3uGMQg
X-Google-Smtp-Source: AGHT+IFH25xfCXqy4HNmWhH2hdq7v13qGSG5LkuyX6YKupHH2sypWxOCMXdK0skrCkcbTnCc9rgkLQ==
X-Received: by 2002:a05:6808:15a4:b0:40c:5b58:c9f9 with SMTP id 5614622812f47-415393d693bmr10038069b6e.22.1752520437869;
        Mon, 14 Jul 2025 12:13:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-414161e2b74sm1622747b6e.0.2025.07.14.12.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:13:57 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:13:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, mchehab@kernel.org,
	sakari.ailus@linux.intel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/2] staging: media: atomisp: return early on
 hmm_bo_device_init() failure
Message-ID: <8372cba0-61da-468d-97b2-85deb8bd4129@suswa.mountain>
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-2-abdelrahmanfekry375@gmail.com>
 <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
 <CAGn2d8PjT+gE2EH0+YT_-ivfcXBuBM1OxTLEAvy+sFctpc66Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8PjT+gE2EH0+YT_-ivfcXBuBM1OxTLEAvy+sFctpc66Aw@mail.gmail.com>

On Mon, Jul 07, 2025 at 05:15:20PM +0300, Abdelrahman Fekry wrote:
> Hi Hans.
> On Mon, Jul 7, 2025 at 5:12 PM Hans de Goede <hansg@kernel.org> wrote:
> >
> > Hi Abdelrahman,
> >
> > On 7-Jul-25 16:09, Abdelrahman Fekry wrote:
> > > hmm_init() would continue execution even if hmm_bo_device_init() failed,
> > > potentially leading to bad behaviour when calling hmm_alloc().
> > >
> > > - returns the error immediately if hmm_bo_device_init() fails.
> > >
> > > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> > > ---
> > >  drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > > index f998b57f90c4..c2ee9d2ec0d5 100644
> > > --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > > @@ -36,6 +36,7 @@ int hmm_init(void)
> > >                                ISP_VM_START, ISP_VM_SIZE);
> > >       if (ret)
> > >               dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
> > > +             return ret;
> >
> > You need to add { } here otherwise the "return ret;" will
> > always get executed since it is not part of the code block
> > guarded by the if (despite the indentation).
> >
> Yes , sorry for this dumb mistake. I will send v2.
> 

Smatch has a check for this.

~/smatch/smatch_scripts/kchecker drivers/staging/media/atomisp/pci/hmm/hmm.c

regards,
dan carpenter

