Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4152727E7
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633234; cv=none; b=RiECIFNPoHeHiI7nvlLUmgoquoZ6KGyitYZaN9uHh3/EkRUB75lvhIbmvJQD1+2zOVOUHru6TbHXcnFxVHjfDq7YuFHyUQp3eIN6PFo4dO/VNctTBKyfvx6GkU+dKXjt35v6THZvAENh+4WWJTt5ysm3dFuVahNNoh+7gigITXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633234; c=relaxed/simple;
	bh=opgNxRAaOOtS/qrf0UTSLIDcpgldA90951x4nR6F3QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0U/Z8W/8UMENIb8WrY/7LTwmRxzxQQopl7cdburYtBjEvrIn2pPtBCfRFIqvtNHRZT5nflTxO7z7SRr2eWX7Xu5a4fibgIHJwoGSz7paF926H8uf0cjWDAGijb9DXsZalu2Oic29mjZghbL6tIjE38YpxWwMdf2ZabNWBz6Z1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCGVLYMF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCGVLYMF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29555b384acso8522205ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Nov 2025 02:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763633232; x=1764238032; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wCzeYOIwu51H3UyW4Ii5cQmYLHYJ44tFCWOTtWEA5fQ=;
        b=nCGVLYMFIW9vdqkWUeHUfVn1fwTV0GhKCx+R03m9AFddhTfzbr4rHAa/3lyH7NTKN3
         GpSBdPuX1hpIYnPbyZAsjRuOslHbo4aOezq0cMiCH3SPY+FQUDKrTo8gChdwzoDTtAG4
         IfW3ys6/vS7RfGPEnDCwSv5Gt9IpLFggogHET2ppYq/LLzsEW20U/n688gSpj/DGLsDH
         kCJ4OVJgfTG50AkzVAXYXZZVqc6dvtDb28E1LyDrsOorELq43SjCiUaAfzpkf/ZhNwv4
         6lK8bD1AE258/H2zsqco95ERIp8SqmRVp/pWVxwJS/nEql9ME6v/yGe0XvgjRW+qIWNt
         nONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633232; x=1764238032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wCzeYOIwu51H3UyW4Ii5cQmYLHYJ44tFCWOTtWEA5fQ=;
        b=VWCJSHyzzU75Ej9v6z0oCuwAFOR7CyUfuR5LNh4P5MYeEfT5Fu/6bfq/I582u95LKB
         /l4eHFT/r8AgkmgaA90R/NBZbe+yiZR0gmV6tbQeqSwuoZ3JtYxW1VOlCNAePE3wvzv+
         ycZzGCp/C5C4lOTyKQmfEJB/ZA8VuinqxQg+d2n+ziP6Bj2q8UZnKHGgwtg8UWlmC9Zt
         JS1T2lQPDI2Ou4rttkntZN1zDY3OrDEcV5bbS5ACkZp1vIu3NWhsG1y9gVnyb7LhEX3h
         wMPAZ8vuwhCoEw/zzxEZ6fuegruqqvwN1TKD9yXOYM6SBcaDZ1qBtUCfgEwz6zJ4mofG
         D5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUv4/LqPzwxTiZxuaxisfCVz0ROsqaZXBXhk/uVx5A2CZGwBpda0nepDZYvAPW1AohhybZN1Iwc0TCaTCSURtjG4NH8w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+LSvKy9Nw9WqH/TgBG5grCWauXxH6bKLFAC6cs1ILz0gnxLRy
	s1cWtPzGA+X+MUAE+X/R0GE95OkGueZo6tokQXBz5992he7wR/z4ekFj
X-Gm-Gg: ASbGncvc8sJaPSGZkErWp42+iJkgy3Xi7cCU35vJn10OWW5PMuU8nCDXxgULVsCIKOy
	5kt6y0xUJLa/lkdbfzmxxFNeoCGv8hKUMtu51JA7p+cpWSMoacvKmOQWhuUrfQjLPq+aF8aArfp
	7nbCqPhCzBIZRVWUK9ZIm7Zwoa3PZpx7cn1nsEjYhReL7t5tD0JUVQfTvcUhj2TdqeRs2mxdFb4
	1oX8EX/QgLa+wjr22H3C9qxeR0JA+bAgo0CyW5V7IbHcKKmrx37dVxVyDQ0lR/pS7uLl8qNWsXd
	NVq7Yjj7fC+EimF1LINGQPcVkn4dodxQ0k/ADe/MgZTFky/yLZ9fVoVlUeBvfNYbdPDkTf1/meb
	CHZiAKtnFAm1/6NBFWScrZKjsLdnxTpn586SITQpDMdT38GTekcB39eXfWG0+7liQto6BXZdu7g
	8AqjbVte0vStu1Sw==
X-Google-Smtp-Source: AGHT+IEQXDA4eVnbwRmfp0Pn44ar1IzBX5MgtZIapxaMSNNKWSHkT2/53EC5ci2QDZoq3DsEXGghWQ==
X-Received: by 2002:a17:903:1aec:b0:297:dd7f:f1e0 with SMTP id d9443c01a7336-29b5b119137mr30569465ad.43.1763633231596;
        Thu, 20 Nov 2025 02:07:11 -0800 (PST)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107ee9sm21449425ad.1.2025.11.20.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:07:10 -0800 (PST)
Date: Thu, 20 Nov 2025 15:37:08 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: andreyknvl@gmail.com, gregkh@linuxfoundation.org
Cc: gregkh@linuxfoundation.org, snovitoll@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: raw-gadget: cap raw_io transfer length to
 KMALLOC_MAX_SIZE
Message-ID: <krqj4q5xxp5tm3ufwmoyb7qcxnz5xoj5clebegdokq6mpjqb4t@mxonqsrhx2wt>
References: <20251028165659.50962-1-krishnagopi487@gmail.com>
 <CA+fCnZeZ+c15X8BXg59ppbEmEUvp64aMaTPjXARyO_0x6KL+eQ@mail.gmail.com>
 <u3okc42qhpzi2uorrdei3jigq5wwgdqb66u3u5khtuzxhwbamx@f3dh3fivx3uo>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <u3okc42qhpzi2uorrdei3jigq5wwgdqb66u3u5khtuzxhwbamx@f3dh3fivx3uo>

On Thu, Nov 13, 2025 at 10:09:08PM +0530, Gopi Krishna Menon wrote:

> On Tue, Oct 28, 2025 at 09:15:47PM +0100, Andrey Konovalov wrote:
> 
> > On Tue, Oct 28, 2025 at 5:57 PM Gopi Krishna Menon
> > <krishnagopi487@gmail.com> wrote:
> > >
> > > The previous commit removed the PAGE_SIZE limit on transfer length of
> > > raw_io buffer in order to avoid any problems with emulating USB devices
> > > whose full configuration descriptor exceeds PAGE_SIZE in length. However
> > > this also removes the upperbound on user supplied length, allowing very
> > > large values to be passed to the allocator.
> > >
> > > syzbot on fuzzing the transfer length with very large value (1.81GB)
> > > results in kmalloc() to fall back to the page allocator, which triggers
> > > a kernel warning as the page allocator cannot handle allocations more
> > > than MAX_PAGE_ORDER/KMALLOC_MAX_SIZE.
> > 
> > Ah, right.
> > 
> > >
> > > Since there is no limit imposed on the size of buffer for both control
> > > and non control transfers, cap the raw_io transfer length to
> > > KMALLOC_MAX_SIZE and return -EINVAL for larger transfer length to
> > > prevent any warnings from the page allocator.
> > >
> > > Fixes: 37b9dd0d114a ("usb: raw-gadget: do not limit transfer length")
> > > Tested-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
> > > Reported-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
> > > Closes: https://lore.kernel.org/all/68fc07a0.a70a0220.3bf6c6.01ab.GAE@google.com/
> > > Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> > > ---
> > >  drivers/usb/gadget/legacy/raw_gadget.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> > > index b71680c58de6..46f343ba48b3 100644
> > > --- a/drivers/usb/gadget/legacy/raw_gadget.c
> > > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> > > @@ -40,6 +40,7 @@ MODULE_LICENSE("GPL");
> > >
> > >  static DEFINE_IDA(driver_id_numbers);
> > >  #define DRIVER_DRIVER_NAME_LENGTH_MAX  32
> > > +#define USB_RAW_IO_LENGTH_MAX KMALLOC_MAX_SIZE
> > >
> > >  #define RAW_EVENT_QUEUE_SIZE   16
> > >
> > > @@ -667,6 +668,8 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
> > >                 return ERR_PTR(-EINVAL);
> > >         if (!usb_raw_io_flags_valid(io->flags))
> > >                 return ERR_PTR(-EINVAL);
> > > +       if (io->length > USB_RAW_IO_LENGTH_MAX)
> > > +               return ERR_PTR(-EINVAL);
> > >         if (get_from_user)
> > >                 data = memdup_user(ptr + sizeof(*io), io->length);
> > >         else {
> > > --
> > > 2.43.0
> > >
> > 
> > Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> > 
> > Thank you!
> 
> Hi,
> 
> Just following up on this patch to check its status.
> Thanks again to Andrey Konovalov for the earlier review. Please let me
> know if any further changes are required from my side.
> 
> Thanks,
> Gopi Krishna Menon

Hi Greg,

Could you please take a look at this patch?

Thanks,
Gopi Krishna Menon
