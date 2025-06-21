Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC135977
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 16:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522543; cv=none; b=ms0K6pXjFUj8iXL3blWw68PsU9s/nHORqbzZAwxn7vOT8qwb/zjP4K2GNP51bwP/k2jOl1ahAGkp5aJTyXpeKSQ+xBT+0VvMC82HcHVj11fZUfCgO22pumPOrJg7PJC+IP3hkINk563L+7r05xzCndC+frIju9YdXh4iGLvC1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522543; c=relaxed/simple;
	bh=BkUZHxWuDCBAQER5ld+ZZ+mr0I+SwoBxQU3VuNcheKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVShSUsBz5j/Y+pQLidIWHl6Ef3ddCdYXDy3u832nFx3eqe8swLcMRCLq/s4uTMnCcUQgfolQlmQYOifVLs/QgEVg0pJW9NoaKH2qyxNYrnFaZIFc5r/Jr0DLpaiqhBtvZVS9amcrz9FXGa3sS7qvNXC3aRgV6iKNSp6SaSY934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FT5fF+QJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FT5fF+QJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ade48b24c97so467287466b.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750522540; x=1751127340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9MerQjCeoB/tfauO+gxNkhr//t2Y54VYSS0pmA0OG84=;
        b=FT5fF+QJohOvJvTjS0kXF2TzHO2MUWqRaYZmVBxC0LZNg1uzu4kLksxGrw/gWFFfbv
         xJFPGiTdTnK5a+2c8+AJzfFig4kzNa64+R0EOO4SoZi2O0Nmy7jk7WBSKDByvNdSwHqM
         ++vxbwyU48bZn0X0uua23FqsqgsbhnojzIR0vhD91D7Z0ARGBQZaYB3GR058XH83W7Td
         65INL4a78x5lRyCVUT0OhJ3xXjVTNgMzAaZGT4GaR6Zr+eSrzXMyLq92/B/xy0dqBJ46
         hUro5S6aEnV0D6JWXrIQ30CWkPeYJ/p6Zh2bVxVV4EwOQ8N5cuK5va7pz54O6KrcgNY6
         1pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522540; x=1751127340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MerQjCeoB/tfauO+gxNkhr//t2Y54VYSS0pmA0OG84=;
        b=BWsuQs8Ao13n62wM0gm01C18zHlzspApyc77E7sLsaOr3gWjA5iJitBQ22b0jxkwMz
         oGKIaAdukkVKtBbCa7YJDvz3WatWjFC2Ah0/Ud+9X+40V2t6uhOHmJZBcxWMLIciknb1
         RIKvrjkFBE9eSq+tyrc3SHnGRER/bih6aEx2Vdmyg9srnLwimw4NFgRc0y6wZP7K+Irk
         gqavlfmWK3eMIXrw3VzMToLDf1jrLHJgnB49EWFFSgHsg4Agcs6W0L5NxwI4FccmARAp
         R6VGVpd1zFY2sgVBScgLWJaerTmiYS2HriILz0/lqcZb0rK+c8pfDGR8CD4mfjH/gAFy
         FGQw==
X-Forwarded-Encrypted: i=1; AJvYcCXpOncL6BM1Pyd4nLNRDq8l3+90dzynDGIHlUC6w2CQJCynfGAcW9SMwjvrgJZfQ/Wr2fpQ4x3owzjrnW0VkXU/U+hC6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCDeZHrU+Cq7WeGslX2uC1sFIsottyAmeyw1tChpPW1cc0lgH5
	61Vsqr8zWJvjoReuwwVa+EuZMsBgj3oOgya2fnMLUQHQVPOlnNvAr+NR
X-Gm-Gg: ASbGncsvY822jW+4SalT924MMRzoX2yjMJRwQYKLlA0PPzqnbKvLj9o6pWjDw2D+8GE
	xDiNxMkbdCifj+FhBdrQVAyOCWvYgiofdfI29KLzSOoT4BLK6anhcsMAmzZM2dO3pMy/i2AhCGF
	KBuaf/qvqIs6O03NDlohLSLMdS1Kz01lKnoCHiXgRuyJLiebnxYEB2o3RzbNTnfRTcdnQOlPhdP
	x5CWHd5zF0t3vQ93ZDRTnOyt3V0pT8iqloOXUWT/oi/3fj1i74lmhW9YSar57hbbX79q+yieDMi
	g2bF6xW5Je9tWFt688ZTC5bAS/eYONydzta5TGCLTP1mRMCImBYkyvCI
X-Google-Smtp-Source: AGHT+IEV3zNBZRAZaL6Ty9ZazSqmnCQisegd5org4xX7GQNi4SF20RwV+ACtN3Sv9ZZx5uzjTUvwkA==
X-Received: by 2002:a17:907:6088:b0:ad8:8529:4f9b with SMTP id a640c23a62f3a-ae057bc4354mr695132566b.38.1750522539633;
        Sat, 21 Jun 2025 09:15:39 -0700 (PDT)
Received: from localhost ([185.246.188.73])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60a18cba458sm3425202a12.59.2025.06.21.09.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 09:15:39 -0700 (PDT)
Date: Sat, 21 Jun 2025 19:15:31 +0300
From: Ahmed Salem <x0rw3ll@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <7rv3j2it6wbv4gu7jgsews3niste5y52h67scwwjpblhy2royh@hqfmpbjzdj77>
References: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
 <aFZ_YJH30f1WDneD@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFZ_YJH30f1WDneD@wunner.de>

Hi Lukas,

On 25/06/21 11:46AM, Lukas Wunner wrote:
> On Sat, Jun 21, 2025 at 04:55:52AM +0300, Ahmed Salem wrote:
> > --- a/drivers/char/agp/amd64-agp.c
> > +++ b/drivers/char/agp/amd64-agp.c
> > @@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
> >  
> >  		/* Look for any AGP bridge */
> >  		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
> > -		err = driver_attach(&agp_amd64_pci_driver.driver);
> > -		if (err == 0 && agp_bridges_found == 0) {
> > +		if ((int *)agp_amd64_pci_driver.probe != 0) {
> >  			pci_unregister_driver(&agp_amd64_pci_driver);
> >  			err = -ENODEV;
> > +		} else {
> > +			err = driver_attach(&agp_amd64_pci_driver.driver);
> > +			if (err == 0 && agp_bridges_found == 0) {
> > +				pci_unregister_driver(&agp_amd64_pci_driver);
> > +				err = -ENODEV;
> > +			}
> 
> Is the "probe" member in agp_amd64_pci_driver overwritten with a
> zero pointer anywhere?  I don't see that it is, so it seems the
> else-branch is never entered.
> 

That is a great question. I thought since pci_register_driver calls the
probe function, it would return with or without a zero, saving that
value in the .probe member. (I find my lack of C
experience...disturbing)

> I had already prepared a fix for this, but waited for 0-day to
> crunch through it.  I've just submitted it, so that's what I had
> in mind:
> 
> https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/
> 

That one I've seen even prior to catching this one, and this is
originally what I had in mind based on what commit 6fd024893911
("amd64-agp: Probe unknown AGP devices the right way") removed (i.e.
!pci_find_capability) when you suggested checking for caps beforehand,
but I figured "why make other calls when .probe already does it right
off the bat?" Clearly, I was in the wrong there.

Nonetheless, thank you so much for the review, and Ccing me in the above
patch. Ultimately, what matters to me is getting the right fix in order,
and learning not only what I'd missed here (i.e. Reported-by trailer;
just wasn't quite certain how to approach the situation with SDN in
mind, as well as the original Cced developers), but also fundamental C
knowledge I've been trying to acquire. I appreciate you!

--
Best regards,
Ahmed Salem <x0rw3ll@gmail.com>

> Thanks,
> 
> Lukas
