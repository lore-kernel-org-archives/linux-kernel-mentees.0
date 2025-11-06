Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93450302CD0
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Nov 2025 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445355; cv=none; b=Zg1VSuO+zHjqwv2MAzUpuYzKhzypN/uVaI4jaFKQxabJbG3pql+XV81zsdtJYiWfTUTJ22tWdSh0LNUNLKff7549MiUdAHR99FSCOxDNXsdBGgvLj9DAOdY4JoCg5hrQBY5NtMPT2fi72zYkZofv6+DiT/zGPxjg8BgazB/pQ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445355; c=relaxed/simple;
	bh=MLg3hiFxO0FS9fuavJ/JSEbJ+y7jTxCzr2x6pNOCnlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsppUjelHCfyqPzJgL/z31q9R6LLEkObn0BPbIBWgBmT4dqUXibAh2P/H77MCO7k95zSeOqz5VVADZhdWg9AvlpiLvgnq/vYRV+OLnmz/bZKASBTt7N3spp08QSFfPVXOYupNDkYOcaycjquMfgiWlodOZl9bgUrK+lRJs0sHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCXdiQkE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCXdiQkE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so1441432a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 06 Nov 2025 08:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762445352; x=1763050152; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/WVmVHenIdK3KCEFMeF1CP0bfdkN9fPLWoBNVC7n1U=;
        b=HCXdiQkE1NEl1pVQ8EOdee4vGYsGKs//HTJODab5ohfYZKz6IxlrduiKAJaBTRi3Tb
         cyk5SnDnCaLX35WKAeu6gX4TvciVtdhpv8Kgwi6nMEkex1IU9sIYQ6sYSZYApdPbYxW8
         fMpdrRskVU5mGj7VxuqLDOeck+0T08d455mvDTbfr0F81tyO0suHH3F3Ap/v8vrVna33
         a6zfZvHMIcbaOrBTjSXpQDx9Uu5hwuLvSCdiMupzQV7rdzC3gTNu0V0wJlEyN0fDB4Ez
         jrTXgqdfo8M4F9lgmzs1Fs6goI1+wr1QNvrPIOUaavCkcaTnU7oW7E5ZIhnXkxShJQsa
         F0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445352; x=1763050152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/WVmVHenIdK3KCEFMeF1CP0bfdkN9fPLWoBNVC7n1U=;
        b=IBgHgIJ/Y8Ez8W6aW7ujsoqYL9oeEF8vPBNjOd9LQt2s30qxg/tG0ZjkXwB1ZMkJsO
         7DnXPt/pGK2zGPxmy5TPBiw7aVf28h9/znMbd52A3PDyKb3wfPCEfTqvzPJ8vDXaHOvA
         fURbCTbDjIQS2LcXc3j1xIxO6ltg/4z9Pr3r4g25IoJNpnxJvnAjlVB9Si3tAAsh4ims
         1dsIxU9LFVzXfzbjgqBbRiihW9o/lECAMkqvvsCIqe55JHmvjUMPce88DM8U7+5B25xf
         /9FdIxibWdTeyNrQAoWbIWt5O2ruH03tmcVPvRj2TONk9U4POIO/ZE/O49adwQlUoN4k
         FjGw==
X-Forwarded-Encrypted: i=1; AJvYcCXBwLVc4UZFAYwJVBs1/yaoDNIxy1HRWtdZPt+ILaTdnB+ZHkaLnnLAZgweeFeoekeYcqMtB5LO0wbjvgtltDGUrwT6vA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6AA+7hbofCzq6sd2rDxJBJXp8Kq9XjPRkX7eYZXPNMIWT5ISq
	p8PONxbGwTLKGV8IDa9vvTyj9eGGPGWybMtAO/hBg23Yju8iQpt/j7dKefy2n6CBvR0XXpHYNb8
	ndIM1Chy4KV6X5Lim+EJVEoWSDf/mF2c=
X-Gm-Gg: ASbGnctT3giR+GK7ifaElmveafabZDelOhY0YTzDgsd2xD85a6/wjeh3tAKhWRR03BM
	xbi+d7/Xuu6b/YNJ7u+ei52Y+GPkxJW6wf/3P0Fm751QRbgfQtXlJ4uLm9CUaQzcaaMdlvjaWjC
	u3MZim0KZ4evxeAiQMWpBcua+JYdMsu1dlx/6NGcz0Rbi3wYwtagGoMJaJ/YP4SX2k3ZZ4aeb/6
	8kYlvXN6BDkF8vm+cMPXRPbiXcDFDoJYsinYIMqXh/4iDyP9zfuPZjgaPZBG4FdzBzcAAe0/p7l
	yN3OlxYUrkK7F9fJ0isiC43ie8jYq0QA/oWsuTbaX7ouKIUXLU8DybpU/9foRMnhEg==
X-Google-Smtp-Source: AGHT+IEhSIJc5Z5I5NnrKkJBGLV9NZNcAoGr82x4X4tSXvlTQWMJrPj0B4VjrofC5qDWeUguEUAvAwWik8JyOF9e8g4=
X-Received: by 2002:a05:6402:280a:b0:63b:d7f0:d93a with SMTP id
 4fb4d7f45d1cf-6410588e1a2mr8115751a12.3.1762445351811; Thu, 06 Nov 2025
 08:09:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028174222.1739954-1-viswanathiyyappan@gmail.com>
 <20251028174222.1739954-2-viswanathiyyappan@gmail.com> <20251030192018.28dcd830@kernel.org>
 <CAPrAcgPD0ZPNPOivpX=69qC88-AAeW+Jy=oy-6+PP8jDxzNabA@mail.gmail.com> <20251104164625.5a18db43@kernel.org>
In-Reply-To: <20251104164625.5a18db43@kernel.org>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Thu, 6 Nov 2025 21:38:59 +0530
X-Gm-Features: AWmQ_bl5uAbPtelIBkdQOTDm-ZMeds5DYrYna8z74wPG5EKsLuiEbCWlKgzolEU
Message-ID: <CAPrAcgMXw5e6mi1tU=c7UaQdcKZhhC8j-y9woQk0bk8SeV4+8A@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH net-next v3 1/2] net: Add ndo_write_rx_config and
 helper structs and functions:
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, sdf@fomichev.me, kuniyu@google.com, ahmed.zaki@intel.com, 
	aleksander.lobakin@intel.com, jacob.e.keller@intel.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, khalid@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Nov 2025 at 06:16, Jakub Kicinski <kuba@kernel.org> wrote:
> I wouldn't use atomic flags. IIRC ndo_set_rx_mode is called under
> netif_addr_lock_bh(), so we can reuse that lock, have update_config()
> assume ownership of the pending config and update it directly.
> And read_config() (which IIUC runs from a wq) can take that lock
> briefly, and swap which config is pending.

How does this look?

It's possible for the actual work of set_rx_mode to be in a work item
so we need to validate that dev->addr_list_lock is held in update_config()

// These variables will be part of dev->netif_rx_config_ctx in the final code
bool pending_cfg_ready = false;
struct netif_rx_config *ready, *pending;

void update_config()
{
    WARN_ONCE(!spin_is_locked(&dev->addr_list_lock),
    "netif_update_rx_config() called without netif_addr_lock_bh()\n");

    int rc = netif_prepare_rx_config(&pending);
    if (rc)
        return;

    pending_cfg_ready = true;
}

void read_config()
{
    // We could introduce a new lock for this but
    // reusing the addr lock works well enough
    netif_addr_lock_bh();

    // There's no point continuing if the pending config
    // is not ready
    if(!pending_cfg_ready) {
       netif_addr_unlock_bh();
       return;
    }

    swap(ready, pending);
    pending_cfg_ready = false;

    netif_addr_unlock_bh();

    do_io(ready);
}

On the topic of virtio_net:

set_rx_mode in virtio_net schedules and does the actual work in a work
item, so would
the correct justification here be moving I/O out of the rtnl lock?

If this looks good, I will start working on v4
