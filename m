Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66709224B1B
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Sep 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758387147; cv=none; b=t7fqI4HOo+0Sg0LvG0YNBm062yJqMx6q1D0C/JyQ5e0EO0jhtJnb9+ITMW9mv3h8ypOkWQuUqsmjimY7FAFJ+TLCN2KZXM3DvyPuACfeCx3d6EDIbXfx052ZsdhWONlYdnGHVEkfLHSzwBVtN4h5G8YFINE2hPpTDi/JnJKSRd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758387147; c=relaxed/simple;
	bh=GWpvS5x6cG1Y4f2S24NEW8dN0quQ/cx+TBhU9hoDln8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0v0fQYtFqfQ4TgJp3mBJx7LEW+BV/BTg4916+40KEoiIWGAJskwLsXC/6e6buqRjEiKObC5W1wDa731bI/TnD67Im1Cw8rmxkA1lmp3j2b8tJMpl95WIsfcnzYn+5lhedpQIR7gmS0bRAY+50qICdY8jNdpIqYLU12Xjt2mN/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScR+COyS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScR+COyS"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso5606067a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Sep 2025 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758387144; x=1758991944; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6t0lvNAvBHvFjIYOZdnPwHv9uI7zn4mkRak4VLc3x+o=;
        b=ScR+COySpaVs+Ko5XL2ckDHEH5QuKQycRJWi60HyMtmVQY7yLF0EeUQt+XPiBpCJdc
         sPwuFu5+J9zcuHaqXEuxD/WcEDrAeG/MV8INYqmHCCOXOdoKK1O82rBrD0B71xXG08Fk
         8U1GAlZHKwmyAlQ6VQEzDM6JU8llxKSGLapzeXkTMW1SBbuxl6tBPCq6/+z8xAC0W+1i
         t01ubECd6mhxO1/axkBFgo8wxnTFPaAUJXwqoQ7cNFzNIgdYVwr8fBPfgOK5LKoBvcyT
         e8wr023Y3clV5oxpZV02QAaY0VOxeYT40xmjV5OwsdaW2WMZDhAy08WBo/3uWa4sjSVl
         SHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758387144; x=1758991944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6t0lvNAvBHvFjIYOZdnPwHv9uI7zn4mkRak4VLc3x+o=;
        b=vW8M83FdvhtCPy0cI+SpgURWjDW6f8gNFvRyBcTEbhrldoIEmyQfM8f4ytQo1+SgTQ
         xEscRkQn+/BcR2lTlbst2mIBpI+/sf1NwKwG/abswx9Y9eng7DE5eK/TcRb0FtD0nR8O
         0IE53t6nPjsYatMdU97aYrSCenT5ODMtfMGMZYT5ZSezNXuCIrOdZ8kQTfs5OhVgI01r
         2vwoylRECmDlfrCQDqcG0jzESlLVlF+HVfhzrq1ATgTAHpdaX6gUejp5XMu6jLi1bFaW
         ON3d2S3gmEb+/nCCvlK+aWYgbobCtBQbn3D1fXdT92Oi9Dm5iU1GSCChgUNgTn11E7rg
         bhig==
X-Forwarded-Encrypted: i=1; AJvYcCXOhusy2Mx8f6JIdMoSnwOStsIqFScJbrH4ZjCSJS8cWvsJXYvI5gudctvhEh8NVhPrfMCkMxKFmw8STxLdx7o9S1qbrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNsNBdwpSd1NnFeorASRVXV5dceHujzNiIxX96E8GoRd+ehM3p
	VIujCaLtGfn6ensPd0igYqPNRI28z0mpklmlCCfLxHnDBt+jWzHJJfu1/BstdRBVRWxPdOix8Kn
	hyK+/e3Cc7S5Q2D6PCxkyGoSrCutl52w=
X-Gm-Gg: ASbGncspUVlnfl2PVP1ZueyPFyvq5nS1ItoaAgsDC4DkYOGfPabNHAa9zJGjUaBtMcL
	44wnheWUVDeNAWHxqHdLZw8Mw/ZbdfC/H02oX+XmC1IsSZXhaiaAZglKxS7HU/sRQCOe9K72Ba+
	1E2MwWAT1fAkLiOXuk8Nxn5J2Z9thH/IwrBFUvvYYRxDnVq6GcpLFgaoX8NkllhDwgmh7qoeK3K
	Lw6XXdGGIx8kUGCZAsBqS1BaXNWYI/XA5FIT1qUdRalESM1Qqzma1w658Nm2ipFA8Q=
X-Google-Smtp-Source: AGHT+IHHbxws3SREQHUm9DXYPSh1lNZGC+x8Xy2uJwCBquseYOMfarK/RwziU8Ml2w72ef92uUul+cCZANWL5gTtfzQ=
X-Received: by 2002:a05:6402:1e96:b0:62d:6cac:1ec2 with SMTP id
 4fb4d7f45d1cf-62fc08d2120mr6186264a12.4.1758387143494; Sat, 20 Sep 2025
 09:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250920045059.48400-1-viswanathiyyappan@gmail.com> <5b51d80e-e67c-437d-a2fc-bebdf5e9a958@lunn.ch>
In-Reply-To: <5b51d80e-e67c-437d-a2fc-bebdf5e9a958@lunn.ch>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Sat, 20 Sep 2025 22:22:11 +0530
X-Gm-Features: AS18NWCYwk4g8GKTtmeraqfyKpXAyJkc7cnfC3ztEpzTK4PVyVgiyuigIenJluQ
Message-ID: <CAPrAcgOb0FhWKQ6jiAVbDQZS29Thz+dXF0gdjE=7jc1df-QpvQ@mail.gmail.com>
Subject: Re: [PATCH] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
To: Andrew Lunn <andrew@lunn.ch>
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Sept 2025 at 21:00, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sat, Sep 20, 2025 at 10:20:59AM +0530, I Viswanath wrote:
> > syzbot reported WARNING in rtl8150_start_xmit/usb_submit_urb.
> > This is a possible sequence of events:
> >
> >     CPU0 (in rtl8150_start_xmit)   CPU1 (in rtl8150_start_xmit)    CPU2 (in rtl8150_set_multicast)
> >     netif_stop_queue();
> >                                                                     netif_stop_queue();
> >     usb_submit_urb();
> >                                                                     netif_wake_queue();  <-- Wakes up TX queue before it's ready
> >                                     netif_stop_queue();
> >                                     usb_submit_urb();                                    <-- Warning
> >       freeing urb
> >
> > Remove netif_wake_queue and corresponding netif_stop_queue in rtl8150_set_multicast to
> > prevent this sequence of events
>
> Please expand this sentence with an explanation of why this is
> safe. Why are these two calls not needed? The original author of this
> code thought they where needed, so you need to explain why they are
> not needed.
>
>     Andrew
>
> ---
> pw-bot: cr

Hello,

    Thanks for pointing that out. I wasn't thinking from that point of view.

    According to Documentation, rtl8150_set_multicast (the
ndo_set_rx_mode callback) should
    rely on the netif_addr_lock spinlock, not the netif_tx_lock
manipulated by netif
    stop/start/wake queue functions.

    However, There is no need to use the netif_addr_lock in the driver
directly because
    the core function (dev_set_rx_mode) invoking this function locks
and unlocks the lock
    correctly.

    Synchronization is therefore handled by the core, making it safe
to remove that lock.

    From what I have seen, every network driver assumes this for the
ndo_set_rx_mode callback.

    I am not sure what the historical context was for using the
tx_lock as the synchronization
    mechanism here but it's definitely not valid in the modern networking stack.

Thanks
Viswanath
