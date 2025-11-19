Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A18A2D738A
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566586; cv=none; b=jAgChapkcQ0vJK+GvzPdNgO+3shxdGlgQNt0nqDgvwELYasRBdieirsWi3YiHGzvTrX2kDhs6XnGnGGo/dom/zPwRo3twq7/43H3A2jBQxdVy4qEhSSVILDj3Sy6Wxv7O1vYUSxnwbeb3mUoeeWpbelGmgfX5W6bHiJBuR4rq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566586; c=relaxed/simple;
	bh=Bktrwsq5+7yCJFVDpveZivsZ+fXgrngE1TVR89p5UGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhmYY97uBIEX/+XxAF+6PXR40fzdX3ipdxl1wp5iMIcHdcBdHgb6FCBEOWnNNQxWlEFW3A9043SeEMM1rp1JOj4bop6ptSpkOoslDNLW/muxwBU+yUUd/N37q+odHmKYHc/sSo99ptb3XuNSP6sJzf8s4+TQJHiMqkCNNFMxqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uL9l4+G9; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uL9l4+G9"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4eda057f3c0so65870281cf.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 07:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763566583; x=1764171383; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZX/aEko5V4LfrBu8HxDRWLbIYPckCIiKwT1n1JYaFI=;
        b=uL9l4+G9SGYPNEFgwhrSQAJBjEf5wtSyIlTwg8Ng4ubuvq4Uvj12nd2X6YUFNN4nIa
         rBkcGA/9lHZTjxb0n6ixBfP7WWJfp77ia2KzPyco/XBlpimxC9AJiQkUUW+wbgO1W9bh
         rVCPYaFMYi82NXbc+x3TpfD7zfFLUnJIYEGOL8dvZ/lS5qLI4b3Kw+ztksoXWSYWWI8G
         QutYIcmlX66Ovp4p9PjQP7T2pzXg1He070rzXTqS1+DEPuIaflmIk6OQ8RGK8c8XXDAL
         bqq3/P7A/6SQhtEWPGSO8f2+aXsjMCYxfxKR/ywccmP1xjaHJ4s2oHEdHXq2Td/4icD6
         hg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566583; x=1764171383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZX/aEko5V4LfrBu8HxDRWLbIYPckCIiKwT1n1JYaFI=;
        b=FduLorqP8sA56G+pwplAzFPxyN6Tc7lAe7+cQfUBTBsJLK9Gni54fFet8rIHXgJ/XK
         KpqZ7mtBk5cok+/LzIVIz0cseGkwINV8W7gDDd1ZL4e3dAuEujkUh2zpsCWkqznzU0eA
         tDl8/GOHkD8nXQ+RaS6jmTCnoENMYeuXHWqZatbOUPb7UNemWAHUgHIZudT7zaJks7ru
         C7eC6HZ5Tsmkp6NU13gWAHs01gmsPb7FTemIcshUmgDTxAC/vr7a95h0M+JXOjCDRmIK
         d76qUpqeLhpx7f8508zlWb8qSpRYePreFzGLO3r07foj9VKVI7+iOAOp38uj7FHM03d8
         p9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbaIzQ315ojfTZlveK60FASk49KtliloH3YHBqHEI7oGuvysPJh2MRc3K+MKmwvujgHiBzbrnrnizXFM8i05ITe7lZmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq7wrr6Xc9/hW7UfS/wW+x7f0+LmzKFegtwaMoTYzITtbe3v0C
	Ey6EylcFDaS46boHcBQDuATvMgAbA5p0VY6qhGb6Gea+6Zq5pQ5/2n5fFCvB+5Qo+Q==
X-Gm-Gg: ASbGncs9tOCM38dg6b7W5ktLF0pBmACPVjSEe/qPxbV4e6pw5nKQE2mFGjCj/d2IRQA
	ID0nD+E+1l7sYggI96tqeokM8tPzwfnpMA+Zb0AzmDps9UGo0Rj5rAuV0LioTswg/VHPm8Qjv7c
	+Qbkk4r/wsBgdIWCPug6EZmzcil9MwEmAkSQeDhu+P2baY1W0cgJwvEiFgWTZaiZZa4q6VgCVqF
	Z+mCF6nDi3n0DuF5JoGD9mJ/EsoHV6S7r2dqjBKQ/Q54CRr93mLNeCD5YmYvjmTQTEIN+eIxqr4
	6JUFajH+wWO2urSx361tNF//C0/w+cZX7tpxkXlUTOCSdYbdek3tA7D7McZUwnDcOIZRrjG4PFv
	+Ph8gJtNAD/Mw30BKBPyoK284Yfy0qdAYtsOk7b/pZnmHEU4GT6x7Gq9Y14Bl4tkBi25Y+M3CFp
	2HDz0ER3Uqfe+1sWU039BDdAuqXg04WQ==
X-Google-Smtp-Source: AGHT+IHVhVSU1qBDJkojbnSozu1+lqfGiIw0rFX+kgWlXx9u3BF4Debl3tEJRFOjOf55dzdBtqHWOQ==
X-Received: by 2002:ac8:584b:0:b0:4e8:92ff:753 with SMTP id d75a77b69052e-4edf2066cb2mr239692421cf.24.1763566582824;
        Wed, 19 Nov 2025 07:36:22 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee0f0d51bdsm84521401cf.15.2025.11.19.07.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:36:22 -0800 (PST)
Date: Wed, 19 Nov 2025 10:36:20 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH 4/8] usb: gadget: dummy_hcd: fix block comments, blank
 lines and function braces
Message-ID: <08e6f306-f105-45db-9846-a50ae7e3219f@rowland.harvard.edu>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251119130840.14309-5-clintbgeorge@gmail.com>
 <2025111922-improper-sensually-13b0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025111922-improper-sensually-13b0@gregkh>

On Wed, Nov 19, 2025 at 04:29:13PM +0100, Greg KH wrote:
> On Wed, Nov 19, 2025 at 06:38:36PM +0530, Clint George wrote:
> > This patch updates dummy_hcd.c to follow the Linux kernel coding style:
> > - Align block comment asterisks properly.
> > - Add blank lines after variable declarations where needed.
> > - Remove unnecessary spaces before semicolons.
> > - Move opening braces of function definitions to the next line.
> > 
> > These changes improve readability, maintain consistency, and make the code
> > easier to maintain.
> 
> And are hard to review :(
> 
> Again, please break things up into "one logical change per patch", and
> that does not mean "fix all coding style issues" is a "logical change".
> 
> Also:
> 
> >  /*
> > -	EP_INFO("ep3in-iso",
> > -		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
> > -	EP_INFO("ep4out-iso",
> > -		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
> > -*/
> > + *	EP_INFO("ep3in-iso",
> > + *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
> > + *	EP_INFO("ep4out-iso",
> > + *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
> > + */
> 
> Why not just delete commented out code?

Or in this case, replace the code with a comment saying that if 
dummy-hcd supported isochronous transfers then endpoints 3 and 4 would 
be dedicated to isochronous IN and OUT (respectively).

Alan Stern
