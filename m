Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8C2727EB
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Nov 2025 17:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747348; cv=none; b=QOiyn8on2nFj7lQL9BH/tdLYiKra7kHaPGuaPy2XSJj17l0GbqN+NI7bkzzt0s2l4/Qqmaz9C5p3w3IimQ9aR6q4UzWyp0C+nMDo6M96rEGoVCvXbf1UZAIa8kJzvOq+Jt2srqqQApBCfMK3yj5Ehig6VR2WThFAU/3QeR4DOas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747348; c=relaxed/simple;
	bh=bbpHoxgmqkgEJqHNWPVdMBw27oGNmoNKaCdnnuCAO/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDZlIs4Gbv1tAC1aZnvjCv5Jqkk59UWcVDUwzf3mPXD1d1waIi5zQF2aeFoXYhxBw5hPPa6P0/nMeMVCJ4iVphX/Z5MNKySU7KBU2kX41IsG389bNbJxP4vTnoFudUhXS14vzAmEr29SaMGdTVr5Jp69ozYDD+XZLBZ6Ifp3u1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDdlANLL; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDdlANLL"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so3894384a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Nov 2025 09:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763747344; x=1764352144; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8ErBzqTgP4cHYgJVQfDWaPxezOQKn0ALUTf491LHzg=;
        b=PDdlANLLC/HocaAqIXjFNe2LhRDuLD+D1bpnBYxurPWsqxOQh/OOu9sC2M1SXTY1p1
         eDN9CWqbHNLqcEdTiqY9qT43wdxQ0PPa8MpW1jB4TC6XwgXvb6rcGi5yHsDt8EN02YQf
         z6tUxEFiIZQmxKibk/jZC5M3LjRoQW1YUqzCTvWJMegpLMzJ5+CjUd9FSN3oYem3140J
         GTEOKtaKDigW+oqhPWUyMIN6FIZycF9yJoXzbdcOgzw6RXVmC/t0yC08L/QsziLmEf3I
         9XtR503243AbKXRfb3B2TCI/JDj1PyTc/lG12O8sOnhAVBXMJxaNn4531ZPJeSgdp81b
         Gxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747344; x=1764352144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8ErBzqTgP4cHYgJVQfDWaPxezOQKn0ALUTf491LHzg=;
        b=W2i8BT9Bm1zk9IhNTcuLbIHpQzGB1jHZLQNMjO2XnWVXmbAOSBLE0ujebYFulTomZ7
         JVY6iGjaoIew5yEw//qSka4p4bcI7pV9II+ZHKds989UOEmKpeE7tAlUJBpkiU93mEtN
         CY2IcBICR2kj+CSbmlo/JYjketOjEpHZSN82qf3/K/JATRtYV7D6KqnClHUt6XKCUXhj
         /dU4yz+SYWyoasd5DL/YPALufTNHhMSNzj/20SzFkYqMtx3zZ/RI6mqKDjUELbN6H0Rh
         /JUBiNPLXL2p5DkQy8SR9fvSaDBL90Z6Gy6yysK3NFPnVAncVKPwXIm1GI5EY68HtzxU
         IXKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTR99kRU1Xtr82ZXjvuCRbuHI3Nhwy82CRtQUVQcJdPi7/8Y242A8Y7991eObdZGTY/GkVxB+44ynujOSFAzfs890LjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSDKlv7gjaCt40A/OSvWKLaAD37uTbpRUnzoZUF+8MCTBkFa6G
	bFEjBAzmJCNq0TTGUVw2Q0/kLZm9gy06jPfyOiolVeP8nj8sThG9OxJvihoYawJr7Y3eQyo9c2/
	qEbH+HPN7oU5mVjW+xVwKI0vgBfftuss=
X-Gm-Gg: ASbGncs2M2CZr4LdSyxvFQdEbK9GrC15BpH9rphiR+Ayjdx92x02X3Ho6zPRF7VM1XT
	dv622YP+NVG8OrgQKFb8z56ShF+qKfZWa+qaC2CjtqxhpBKJeFlEqF6HU+XLPskX7hV40bsWyh7
	i0tAU1tVXLqYumS1hDhKTEJV8ZgwBlVLBJPsc2YJRZXbH0T6679W/UibukeG+aoZMztMwuLp7Y8
	zeL8Jy8PAVC1kYf4aLgAG++cq4QxclrSGAvqmhQSADyWNnVI0qsHCkdRtrF3Ujt/We8KVxGblvd
	5afkOFxraoTLajgkFMnHeO5rkYZd
X-Google-Smtp-Source: AGHT+IE4GS79sSxW/Rd4Ohj496vpRoSTu+pKqkj/hZLDMt5SoW5D+KLGWEEIKTW5/CgPvJlUkWdvl5lidG3EzaU5/BE=
X-Received: by 2002:a05:6402:35cc:b0:640:c918:e3b with SMTP id
 4fb4d7f45d1cf-64554676c63mr2972912a12.26.1763747344224; Fri, 21 Nov 2025
 09:49:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120141354.355059-1-viswanathiyyappan@gmail.com> <20251120071715.28a47b21@kernel.org>
In-Reply-To: <20251120071715.28a47b21@kernel.org>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Fri, 21 Nov 2025 23:18:51 +0530
X-Gm-Features: AWmQ_bnsZ7DyviHAe10zuie-93KQZaGmhmfWVwmmKuclxNtRbUQFHAMN1h6UQus
Message-ID: <CAPrAcgN=RwA5j_hCwHAdSTwyfj5jignvaZ0nNidFqYaY_VeRxA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/2] net: Split ndo_set_rx_mode into snapshot
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me, kuniyu@google.com, 
	skhawaja@google.com, aleksander.lobakin@intel.com, mst@redhat.com, 
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Nov 2025 at 20:47, Jakub Kicinski <kuba@kernel.org> wrote:

> Running
>
> make -C tools/testing/selftests TARGETS="drivers/net/virtio_net" run_tests

This bug seems to be caused by a call to probe() followed by remove()
without ever calling
dev_open() as dev->rx_mode_ctx is allocated there. Modifying
netif_rx_mode_flush_work()
to call flush_work only when netif_running() is true, seems to fix
this specific bug.

However, I found the following deadlock while trying to reproduce that:

dev_close():
    rtnl_lock();
    cancel_work_sync(); // wait for netif_rx_mode_write_active to complete

netif_rx_mode_write_active(): // From work item

    rtnl_lock(); // Wait for the rtnl lock to be released

I can't find a good way to solve this without changing alloc logic to
be partly in
alloc_netdev_mqs since we need the work struct to be alive after
closing. Does this
look good if that's really the most reasonable solution:

struct netif_rx_mode_ctx *rx_mode_ctx;

struct netif_rx_mode_ctx {
    struct work_struct rx_mode_work;
    struct netif_rx_mode_active_ctx *active_ctx;
    int state;
}

struct netif_rx_mode_active_ctx {
        struct net_device               *dev;
        struct netif_rx_mode_config     *ready;
        struct netif_rx_mode_config     *pending;
}

rx_mode_ctx will be handled in alloc_netdev_mqs()/free_netdev() while active_ctx
will be handled in dev_open()/dev_close()

Never call flush_work/cancel_work_sync for this work in core
as that is a guaranteed deadlock because of how everything is serialized
