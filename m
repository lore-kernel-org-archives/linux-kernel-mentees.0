Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915CD1DC075
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 11:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750590832; cv=none; b=eJTHAEEb+EtWXSctdlsP7xGriQiI+hEt1LUICGQEl/obgEifIH37zcQCX+iLlyBfiZjBzhU1zRA6+hGBaccfZ8rOD2gcSNO5bnc47ocW/E8iNAGbmE0kWqbM6kIy0YW4eoeq4cMSd6qN+41Wp3iF6zr4mKrt5/hQOXE569PuYW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750590832; c=relaxed/simple;
	bh=OttfpWvRHtVLmW84FaMi9+g8U21TmEvH9AqsrpyfgM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZF4S95A6o5OaY2yYXyfB5IfXJ/R08pS3gm4w9BWB6JpOLFj9gLm/CQ23vjdp+BhGlkizjB0vIh4uVnkw/QsUfDXSywQ0wrByfQo106reaEva2BKdXpONiEw/MqkKYSEM+Sp9h9j6FRrezd/TUXxlVKnTLd+qFylpwfKy2cy8y9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3HWZwDp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3HWZwDp"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so2793497f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750590829; x=1751195629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MY722r7fjqtwDH04kCsFQsJl/eGG6zaBtiY49RCnDQs=;
        b=H3HWZwDp/anBJRNiv13tpgo7PSZ5C6K0zC95V0bnEUWFDf1RYezSyBFa/gP2zGT1Ie
         kXNSbjk5HZJfnTbEeU02320uBHSu+sK+EqXzb1spA17+orO8sljfHR8mk8sYfz4i1kOh
         eG+o2uos2BE6+jWIni7ckujI9whQo9LuTlOQImNzXNPWbfwy7fBc7+/Acje6LNud9dsj
         cfBZkWXWyjSrV0PceePHbdy1ZnWnQ9A5YOzEzoitx868el9gycey5zd7gIZ8dUCtBjei
         e60Ji6+MSAoAzVT8I5Zpan0AFuUs23icGRL5xk0bewlpAzt+Ws5un5qmhi8uWK4cj6Ag
         6C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750590829; x=1751195629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY722r7fjqtwDH04kCsFQsJl/eGG6zaBtiY49RCnDQs=;
        b=Kp2dO19c+M6IN5Jad6QpyaCgP8BvbcBtfVRigbHbzywh5dsNnz3ghyonzvk3I38bH9
         pVbmKXLKVAfIKvzY1ESTqe8ePvb/Omb1kSYEmI3pQjUFcni0zmvliBf75Nn1CVdESW/C
         nGsJvOnQGlbr/+6GG7erDUn0eJd0tTFEr//VEyWVOyWmrcLIIiuMNvtCYP5J53g3Nnkq
         DXr6xo/CyqRaT8ezZX/R0ZK9JiK1xygYsLKA4rcBhFCcq1/VVl4W6Jf/zNWk0aaFcu4x
         0ZVm2BUCfxgsmX1MStV6Q5JIKHKM0aUFY4xpw+EGwkR5yQPNcL7WTPqzUpHCRjoEHY0H
         zFWw==
X-Forwarded-Encrypted: i=1; AJvYcCXchSZLIySsTptBCeTLGeod02zV8cA6Du3DcCgELglT3czbpTUSsIW0WDOXDbrDQvNCriolqrte8yABwg5FERrWzzWUvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyB0naePiErNckDwKzZehWG5u52iy2Xn9Efp2SLhgvMSmnfcDG3
	HNdnJPGxacpAxtf0D5m2o9Yr4PO/4EqrEGJ5Qwp2ocAo0smp+NbYZHlR8b3/vNU4eFk=
X-Gm-Gg: ASbGncumh0sgxgvKg5NnvwoMPey6M8YhJWvuIPEslrhZCHPxnGtiX5DOVMb/MoJde09
	oUQ0kEj132/+UTBj3TjZHidQ+l1zc93bIhFn1YGtI5+iBrFlQn4KxzlPO/H2RlD3j9Rzq3gCnEj
	frPnnsJsshtgmt+x1ObjP+HHp8gjs3J2qwdzg/zh904hAu6sxMgAoLAEP10rpl8TmMC620L5Fzd
	/t0lGuPWXfCxFqLHqwockZ17GLEW9lT9fw9DUgWLsB21Y32Hpg0p3rCKaEDFozuBHHOIpY6xasC
	aO1V+4H4fiDv1AYjGBVfixVm8RHXqfGrtty1rN8Dcu6S7BVPK/h3Fztv4NOOhNA9GpT0NDHvmGf
	neFWFwFmGXyc+L+6lZ0R2YL4oA3pS/EbfBgxGoDkP
X-Google-Smtp-Source: AGHT+IG3zrYphVYrlGBAXA2y7n8eF2Xc/nmKRF7gU5JOUQ44PRhFzXNNRprLlU5eqnSCppCm70ausQ==
X-Received: by 2002:a05:6000:200d:b0:3a4:e231:8632 with SMTP id ffacd0b85a97d-3a6d278b163mr6831282f8f.12.1750590828483;
        Sun, 22 Jun 2025 04:13:48 -0700 (PDT)
Received: from localhost (tor-exit-96.digitalcourage.de. [185.220.101.96])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6d1187e5fsm6760648f8f.70.2025.06.22.04.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 04:13:47 -0700 (PDT)
Date: Sun, 22 Jun 2025 14:13:39 +0300
From: Ahmed Salem <x0rw3ll@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <vzbw4vskuqsiyha4tmjgoybaet667oed2czai4evvxbzewzofb@v6xb2p2m6qmf>
References: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
 <aFZ_YJH30f1WDneD@wunner.de>
 <7rv3j2it6wbv4gu7jgsews3niste5y52h67scwwjpblhy2royh@hqfmpbjzdj77>
 <aFcGSaxeaDphIhUU@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFcGSaxeaDphIhUU@wunner.de>

On 25/06/21 09:21PM, Lukas Wunner wrote:
> On Sat, Jun 21, 2025 at 07:15:31PM +0300, Ahmed Salem wrote:
> > On 25/06/21 11:46AM, Lukas Wunner wrote:
> > > On Sat, Jun 21, 2025 at 04:55:52AM +0300, Ahmed Salem wrote:
> > > > --- a/drivers/char/agp/amd64-agp.c
> > > > +++ b/drivers/char/agp/amd64-agp.c
> > > > @@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
> > > >  
> > > >  		/* Look for any AGP bridge */
> > > >  		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
> > > > -		err = driver_attach(&agp_amd64_pci_driver.driver);
> > > > -		if (err == 0 && agp_bridges_found == 0) {
> > > > +		if ((int *)agp_amd64_pci_driver.probe != 0) {
> > > >  			pci_unregister_driver(&agp_amd64_pci_driver);
> > > >  			err = -ENODEV;
> > > > +		} else {
> > > > +			err = driver_attach(&agp_amd64_pci_driver.driver);
> > > > +			if (err == 0 && agp_bridges_found == 0) {
> > > > +				pci_unregister_driver(&agp_amd64_pci_driver);
> > > > +				err = -ENODEV;
> > > > +			}
> > > 
> > > Is the "probe" member in agp_amd64_pci_driver overwritten with a
> > > zero pointer anywhere?  I don't see that it is, so it seems the
> > > else-branch is never entered.
> > 
> > That is a great question. I thought since pci_register_driver calls the
> > probe function, it would return with or without a zero, saving that
> > value in the .probe member.
> 
> You'd have to add parentheses and parameters, i.e.
> 
>   agp_amd64_pci_driver.probe(...)
> 
> to invoke the probe hook directly.  However, that wouldn't be an
> acceptable approach, one needs to go through the API of the
> driver core and not do things behind the driver core's back.
> 

Noted!

> 
> > > I had already prepared a fix for this, but waited for 0-day to
> > > crunch through it.  I've just submitted it, so that's what I had
> > > in mind:
> > > 
> > > https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/
> > 
> > That one I've seen even prior to catching this one, and this is
> > originally what I had in mind based on what commit 6fd024893911
> > ("amd64-agp: Probe unknown AGP devices the right way") removed (i.e.
> > !pci_find_capability) when you suggested checking for caps beforehand,
> > but I figured "why make other calls when .probe already does it right
> > off the bat?"
> 
> Right, it is somewhat silly, but this driver is for 20+ year old hardware
> which is likely no longer in heavy use, the driver itself isn't actively
> maintained anymore and might be dropped in a few years, so this approach
> seemed like the least ugly and most acceptable option.
> 
> The real crime was to probe *any* PCI device and even make that the
> default.  I think vfio_pci is probably the only other driver that
> probes *any* PCI device and it does that only if requested by user
> space I believe.  We'd risk regressing users if we changed the
> "probe everything by default" behavior, so that's not a good option.
> 

Gotcha..That clarifies a whole lot, thank you so much!

--
Best regards,
Ahmed Salem <x0rw3ll@gmail.com>

> Thanks,
> 
> Lukas
