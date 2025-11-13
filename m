Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC610342514
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Nov 2025 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051953; cv=none; b=BOg5p6urg/x2zEuSFfapFAoGbApfXQBVJA1aq8bSo1NsiQgUfLhUysv+ZVy7vhNV3qfULYJunkKQYw3/+BrGWXEZnmcIcCQMV7Lu+dfQZKQsittbNjy1HI85p6NM36PKeKnUQZH1o0B33AD6XEGcFWeW89F69VaoZjwongLHP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051953; c=relaxed/simple;
	bh=jMiV4RbMNeOesGqKgORN1iKerZRElW5XEIqKQrbUT2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpQgCQpXQtFZheJgA+Hxkb2YTEzgaKiWET9z7ez2f1P8kcbdLqS2dNkH1l1jjxWSOjq6RVfpb3oFB8xDRV/Rk6Ot8LK6hLburVc5VetyJYZCVg/5jewEZx/byVcAi0CuSl8qZunOSDtPmzizkAjYGBLQQ6IbtBUGyESkfV1u7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dc5qfme3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dc5qfme3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29555b384acso11115455ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Nov 2025 08:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763051951; x=1763656751; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/ucMNEdTPs4tdBdIab98EcaF+7fPlknQB7RoGYRpzI=;
        b=dc5qfme3MVaLi5Ho2h6bHOrD/IwMmDfWFyAGS5/7YYoHE4KeN9Ni29Id5Ft2fDTm8a
         J1AAy7FWOxqpqg+8BdaVV0dfGdf91kbEgVTuqJaGz7LOLKGfAw5y0eO3NYeD8ooq+E0o
         r/RxQ6G739Q9tTHpEkuElLI/FLsD+qXDxCkFtOywW0FzTwyxbx5MteijZ5RvJqgE+PpB
         MgfumjwLNetEn7zpiA/ytsdF4GA0WtTayOq4VifFPtIT/MDhHZXq5t3y+sj/zcN5JMgE
         tsX6F7/+TU1s3qn1+A3Qe3to2vznMzNBmfegB+3Zppumt8gYy1PRCw9my0XZE85toM0k
         3D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051951; x=1763656751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/ucMNEdTPs4tdBdIab98EcaF+7fPlknQB7RoGYRpzI=;
        b=Cb0c6Hu4ozAi0I+GYXmGTQrEMRty6p1yUIe+r7ti5sIueTmsaKOU453W8kncxdxgeU
         w0piKrdmAmmuOxW9rlATIn64NaRRls8jk/yNANBpYpGVfJCk14ZPJ5IUfdNMi7X/Bi9r
         cE4jE2FlTGqJ5dqHUvGAxRMXPPlkV+CHvY8j9CAyz44oZ6QOdu1TgfttXc+YRTxcHztB
         1vmMMOLrPyPOwD8O65Vhyof0WOjo1v25GfAAYsBBv5Up5U5YH6BkYk7oWjQ0tVq2r9Rs
         1GI2Ni7jJLGv0dSrV/dZAoPRd7kxFOiGFvp1/3P3bRFCt4WStSg+QCRkqw5BknLf583j
         GXWA==
X-Forwarded-Encrypted: i=1; AJvYcCVveHoIRf0tOxrJmlbFd6axBB7YZiAg2En4aH0v088stQpN5s19ZA69Y3V4k+5Cn5mvy/U2tBHEPui7G8elZ/0p60zjZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgpDQqlharffQB6Wnh4ai/NwqQEeDnTqfJvY1s6g9VtzP/yak+
	H8XgpZEMVmZkpuMyT4GGvF9mVyzAoZo5JGhxIr48JGY5Eo0ejULSjo2i
X-Gm-Gg: ASbGncv2gCjUZktcas7IZaEDVDdQTbM8KLHNDr2uusbJiUKXhfpDkS8VgLjC5LqKX0V
	XNdUgNXGrm7FcYKIk3ev6FSqYMck3ZrTqamwxENnjgPfHTDyVATPZU5SEHuO+5YZShxxcLIcRfH
	qDv8A7yzXFE9tkBjiUZ+pkIRXm5B7OOQTckyYb3IZcy1HG1qNvbS1vNIAy+lKNDDdsvjLTgbs6r
	0XG7b0DcTwoMDp0EX7Gk/fZk+pgdgrwS2N2f4IHLu4jaQV1c/dJ5fwJXOXa8sry0trIDsc4TRFV
	GY1kgac3RHXWo9qcMvchtMfIebiVG7yEyeaf6Lw+nchlfpap9JB/cpDGaYa2XlCYIg1FGhGydiB
	IiPmyyBAgml/DFTJaeEm163IFfhIY4aaModf2CKu5rikmq001NKeSVxKUSlClxsgETAZm8Sd/n9
	PUpFg=
X-Google-Smtp-Source: AGHT+IEs0sHw9yn/h78U4VzfNtAGyDH+Vb8Xjj0sh1kFUc43l7I1lswC+8d2RPaL8vbpculyPwUdyg==
X-Received: by 2002:a17:903:1a28:b0:298:485d:557d with SMTP id d9443c01a7336-2984edcaaaamr90085595ad.45.1763051950935;
        Thu, 13 Nov 2025 08:39:10 -0800 (PST)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2cce59sm30165515ad.105.2025.11.13.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 08:39:10 -0800 (PST)
Date: Thu, 13 Nov 2025 22:09:08 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: gregkh@linuxfoundation.org, snovitoll@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: raw-gadget: cap raw_io transfer length to
 KMALLOC_MAX_SIZE
Message-ID: <u3okc42qhpzi2uorrdei3jigq5wwgdqb66u3u5khtuzxhwbamx@f3dh3fivx3uo>
References: <20251028165659.50962-1-krishnagopi487@gmail.com>
 <CA+fCnZeZ+c15X8BXg59ppbEmEUvp64aMaTPjXARyO_0x6KL+eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZeZ+c15X8BXg59ppbEmEUvp64aMaTPjXARyO_0x6KL+eQ@mail.gmail.com>

On Tue, Oct 28, 2025 at 09:15:47PM +0100, Andrey Konovalov wrote:

> On Tue, Oct 28, 2025 at 5:57 PM Gopi Krishna Menon
> <krishnagopi487@gmail.com> wrote:
> >
> > The previous commit removed the PAGE_SIZE limit on transfer length of
> > raw_io buffer in order to avoid any problems with emulating USB devices
> > whose full configuration descriptor exceeds PAGE_SIZE in length. However
> > this also removes the upperbound on user supplied length, allowing very
> > large values to be passed to the allocator.
> >
> > syzbot on fuzzing the transfer length with very large value (1.81GB)
> > results in kmalloc() to fall back to the page allocator, which triggers
> > a kernel warning as the page allocator cannot handle allocations more
> > than MAX_PAGE_ORDER/KMALLOC_MAX_SIZE.
> 
> Ah, right.
> 
> >
> > Since there is no limit imposed on the size of buffer for both control
> > and non control transfers, cap the raw_io transfer length to
> > KMALLOC_MAX_SIZE and return -EINVAL for larger transfer length to
> > prevent any warnings from the page allocator.
> >
> > Fixes: 37b9dd0d114a ("usb: raw-gadget: do not limit transfer length")
> > Tested-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
> > Reported-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/68fc07a0.a70a0220.3bf6c6.01ab.GAE@google.com/
> > Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> > ---
> >  drivers/usb/gadget/legacy/raw_gadget.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> > index b71680c58de6..46f343ba48b3 100644
> > --- a/drivers/usb/gadget/legacy/raw_gadget.c
> > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> > @@ -40,6 +40,7 @@ MODULE_LICENSE("GPL");
> >
> >  static DEFINE_IDA(driver_id_numbers);
> >  #define DRIVER_DRIVER_NAME_LENGTH_MAX  32
> > +#define USB_RAW_IO_LENGTH_MAX KMALLOC_MAX_SIZE
> >
> >  #define RAW_EVENT_QUEUE_SIZE   16
> >
> > @@ -667,6 +668,8 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
> >                 return ERR_PTR(-EINVAL);
> >         if (!usb_raw_io_flags_valid(io->flags))
> >                 return ERR_PTR(-EINVAL);
> > +       if (io->length > USB_RAW_IO_LENGTH_MAX)
> > +               return ERR_PTR(-EINVAL);
> >         if (get_from_user)
> >                 data = memdup_user(ptr + sizeof(*io), io->length);
> >         else {
> > --
> > 2.43.0
> >
> 
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> 
> Thank you!

Hi,

Just following up on this patch to check its status.
Thanks again to Andrey Konovalov for the earlier review. Please let me
know if any further changes are required from my side.

Thanks,
Gopi Krishna Menon
