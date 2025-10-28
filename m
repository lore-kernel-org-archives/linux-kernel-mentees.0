Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3A41D5ABA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 20:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761682563; cv=none; b=EEbLkJW+2TZ5Wp0inaIdc7mSeNxp49iWVjLHR8iEyDLibBTzH4HThcdoGg3x30qslTEh9inJtJBY0kQDO6rNY/6tZSY9tnZQEVeNBgnt3rYDEIYSwwH9rD7mRsRuAA6vABDtlbgxEaGGCVVeDQ6402bdsu9fyPqR4II39XMdoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761682563; c=relaxed/simple;
	bh=BM/drt1Kw/lCtndnSgTN6wHlOq9MSst/ff0sEWt9SEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4M7JvLXSapbWfnNxDTBSMLt+uvqFEyj2fbvdPTBrHx8cvYL+PWYXrPiMkmPIZTX0Ix8TkoXEKWxZeKINdU7xnbRBPrH+6ngZHyKPu6GQzhI/oLGDhFMsgt0+6gVi4tpidTpljYFmWp/FzQC0la0tqqsZcCvm28EQtgGoyvcAik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEmPPvwb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEmPPvwb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475dae5d473so38512225e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 13:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761682560; x=1762287360; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8sbXcQ5lD5cCxutqIUWwx12KWSx0PkZ6JH0o6eFGGg=;
        b=EEmPPvwbvZtBxpWi55/HACUr5gHQahBOv94cyQvSjPl9+laTpXVFpT8GUHcRKWBhNM
         EVw6L0XeNJGx4XQdKplRi7JYtul0LreIMPpjqGBDgX0JEvCB65Uyqb2eRZYmfGuKwWyP
         retmuGxGxve4P5ulNosUc3OaHqHZHiWDqV5EbNU9pXqgSXUAFX3ORfNDedEZ7C24DRu4
         Hq1RIBju5NKLXX0RqqeTGdk/icC/18oktryJRTLZOWJty0/1ix4Pmmy9k1yOSEXXkA38
         jvO+V195Em1K9Jwj0se6TiB7sQHvYkK8R8u2ki+DwTGyNgjN8T2f3eBZ+IPbh0FVgE01
         ho2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761682560; x=1762287360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8sbXcQ5lD5cCxutqIUWwx12KWSx0PkZ6JH0o6eFGGg=;
        b=r+mt/Fwsm9Mpn8ZrGD/rybFnUWoK8xHdX9ysKj5F5aTi33XGFZlcMKYOn0PH4TKUPj
         h0VyDnt3Euoi6zUifpB0YyWn6e7bWymILGoePpBfEVbHyfEPFXFCdEZvkdZZNmle9JMs
         jGL+8k2yALEmDsOyWyhJjdZ4GbZM9zy8UauuoZSkRLIVbKmXKhDB5vZ/NktbKKIAXg0R
         9nj2Uo5yBzzSDEQArLd/QVLicpV4xBvtlDIetPvUGfXpcGT/ivLb+Ql1MQV3BSGQY7nx
         0ydQTStVVK+2CIRTaz6U7csvqOxdqJ0y9gLVyJIE2SjBjNqvQvOoJP4MsPBD5CTg+AB0
         xvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnge2lRcz/uDus7T/FxWxsdYPDZg2ZSyX21kTjg0HiYvHWa8mEvCQG2MfELLRnawK6+zsfof8olGECMeheSshmc+HwFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YylrXDZ1OkLIVv3EmuGmHly5ZenSI0cNiCuPzwk0U2LWX9zbc2Q
	gfXax65TYL7h2m7D6fKmVx7GHY0EQ9z7hCzVMm9UL5vscQWX95c6KBQDFftmhUSm6HBqB9olEme
	m5uE+7646mxkB7wdf1SLvDsRdGPTSas0=
X-Gm-Gg: ASbGncurap8QUo8kAx9N0QWWEowVeSHuv++yXZNpO8Xp63SPw9txiivX5mOnmWNDBg0
	52NtGFMe9tTz/GVYiEWCg6ozmDpXLQiBCAnhXUKfyya9esF/f2DMBZGS+ks0ikicZbLcU2qM9JP
	ZVW3GIufrdeK9CZLly9mmKsHMq1vy3GNXrbY0AY8wFmqnnMqN16xbEONcilgqH/ygT1QLUndyUx
	g+R+ONWRmWmhNrnG1V40l5BUsjCmwMOficOxPgCQ7Kezp3ycQFhypoBr5XVqh6wtgFTB3QtYlL1
	3bOppi2vEVcKHT99VQ==
X-Google-Smtp-Source: AGHT+IH8GZm4jB2bptQiSIyNDsqdA47qbhPsbgo1JM5SGKK5xL+QrbeybCdL/wavQXil+cg+EkPuHY3/sqmCyLrg608=
X-Received: by 2002:a05:600c:5489:b0:475:dbb5:239e with SMTP id
 5b1f17b1804b1-4771e2248c2mr5265385e9.0.1761682559479; Tue, 28 Oct 2025
 13:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028165659.50962-1-krishnagopi487@gmail.com>
In-Reply-To: <20251028165659.50962-1-krishnagopi487@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 28 Oct 2025 21:15:47 +0100
X-Gm-Features: AWmQ_bm2C0BdXgXZU7UzFGNl63fc1nW7YzeP97hg5BdICc-hcGNcMMHXSO8p6_0
Message-ID: <CA+fCnZeZ+c15X8BXg59ppbEmEUvp64aMaTPjXARyO_0x6KL+eQ@mail.gmail.com>
Subject: Re: [PATCH] usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: gregkh@linuxfoundation.org, snovitoll@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, 
	syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 5:57=E2=80=AFPM Gopi Krishna Menon
<krishnagopi487@gmail.com> wrote:
>
> The previous commit removed the PAGE_SIZE limit on transfer length of
> raw_io buffer in order to avoid any problems with emulating USB devices
> whose full configuration descriptor exceeds PAGE_SIZE in length. However
> this also removes the upperbound on user supplied length, allowing very
> large values to be passed to the allocator.
>
> syzbot on fuzzing the transfer length with very large value (1.81GB)
> results in kmalloc() to fall back to the page allocator, which triggers
> a kernel warning as the page allocator cannot handle allocations more
> than MAX_PAGE_ORDER/KMALLOC_MAX_SIZE.

Ah, right.

>
> Since there is no limit imposed on the size of buffer for both control
> and non control transfers, cap the raw_io transfer length to
> KMALLOC_MAX_SIZE and return -EINVAL for larger transfer length to
> prevent any warnings from the page allocator.
>
> Fixes: 37b9dd0d114a ("usb: raw-gadget: do not limit transfer length")
> Tested-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
> Reported-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/68fc07a0.a70a0220.3bf6c6.01ab.GAE@goo=
gle.com/
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index b71680c58de6..46f343ba48b3 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -40,6 +40,7 @@ MODULE_LICENSE("GPL");
>
>  static DEFINE_IDA(driver_id_numbers);
>  #define DRIVER_DRIVER_NAME_LENGTH_MAX  32
> +#define USB_RAW_IO_LENGTH_MAX KMALLOC_MAX_SIZE
>
>  #define RAW_EVENT_QUEUE_SIZE   16
>
> @@ -667,6 +668,8 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io *=
io, void __user *ptr,
>                 return ERR_PTR(-EINVAL);
>         if (!usb_raw_io_flags_valid(io->flags))
>                 return ERR_PTR(-EINVAL);
> +       if (io->length > USB_RAW_IO_LENGTH_MAX)
> +               return ERR_PTR(-EINVAL);
>         if (get_from_user)
>                 data =3D memdup_user(ptr + sizeof(*io), io->length);
>         else {
> --
> 2.43.0
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thank you!
