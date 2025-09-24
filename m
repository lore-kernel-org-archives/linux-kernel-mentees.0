Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA122068B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758736275; cv=none; b=LNMncIBnftqir9DK/qqOU9/bvdTzGA+g4kaHpvw7XAToe9mtSZ8IDQgZEe8CStFpP7h+gw1wUOiSIaYY+docmiMvFofEz+jVcZiOoovVrbRSam5ZBI4Pmr/gL+LipApxii7UmesADOQUgiOc3dAeg1FoKrbLDqt/rg57xZRzDjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758736275; c=relaxed/simple;
	bh=irDF2NGT01tFVGcKv8Aw+yXSxcZKqrHPtgX88XxrmqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZT6WTIk8ViQ9s+5CquonvU68rQPNNIXrLd+8VKGbkpAl0rQ4BL9VCSJhdBa/ubVK2UlgSAw+IOlgvWxLGd5fyk1P9SHIyeHlqGHRpyRUMaWY7Fu3vMkbVNbHxSpsjzG5f29RIO0GqcqHvf9tLkHOtNVq6nNNGkKCiVrpg5J7GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/YLKX9X; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/YLKX9X"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-578ecc56235so51511e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758736270; x=1759341070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pquafnPzR8S6cEVo4ZSJasnk4ic+4rsTQNuSE4g5qVk=;
        b=G/YLKX9XYtNTS3+0RVjYmLMegiuZA24yJuuh3t755ZMXId1kt9E0TkbFARxB7zNi00
         YlaqAJPX7zH8fI/12VSoTAU8883Tsyi17dXCuDu/wHD5nmEXn6AOYudNKs3gCMRSNw7g
         nQ268FPqGk3S9W99KshnSgCfV9HazhdAbNQOPI41BkhrPGG52x73HhmOq79HBlkzZ22F
         ihuhpwvqAmSqZlgTmuftQXjxSoJiYRnt8j2l7ZdXAFivQ99gJTBVM9g9m1wpUWqNziRZ
         eT2uJjyjGnpVthTkOWbNlN132KHthwdkiu7rAKrsmnVCBmtO6Y3B8WhKRcoWWYz4TjaC
         7r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758736270; x=1759341070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pquafnPzR8S6cEVo4ZSJasnk4ic+4rsTQNuSE4g5qVk=;
        b=XZ2O3lrHAtTDdEUq8Pxw6lOFG6Wv5+hixBc54ios1yqosayR/SfpWUDxI3Ev244aUE
         fgsc2ZHKSM7YvpfVzmWZTD1GJuobYwN2OGqfOm9SlYx6+ETXon4uo8s2rHPKDMM9Pso6
         YMIS0We5dHzVeQevzkSDe+KZzswjvrt56v8Xhdn7+gbYxGPhZVIotkiTz8PabfO4+hup
         IW3ScgGmRVCwirdft5RTmXLrNYDY0UPj11FqP6QrQd1gFmXvJ2L//MCgM5q5Ka/KmzH6
         Ifk2cJPWYl4HrMmZ39KV651dGIEfXYzWsDnE+750oFZhyxFwaNsUEpaHYpsD9qCcqpNJ
         O1WA==
X-Forwarded-Encrypted: i=1; AJvYcCXTqdlpOhgKe+KB+ZVmEhT9RgZW8hEE3mXuKYPfN8X6QpQN61fmspz11vwebjbkJ8PEIYKwuojW5WLf4085evSmfVQl+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8riC7yLMrz40mR2wvLLf6Wus/X3+MyxbrHZInRJitWhlzcUot
	TmK/F6u2u65GQFBrGpdk0ivQz4I8zYJjDnKzTcqXTIWGW+OhO6YOiljF
X-Gm-Gg: ASbGncthg4iF+fPbmokowmUcTLZ+QvlWsGKJFAC4YKbfevJgvNKFuId6FCOeB//ObT/
	R+hG4nDcxDk1+d4lINpb+oEdtJCFIZyZPqon0gW5IBHiG8Fjg0rNErpA937hh7ZqvNFdd0xXiBX
	cyu2L21OJAEuRXGZEpZBYdYKQBBcB+Nvb5LtisCKvBZJM2J/8xdHHv4JvStHyJhBVNDUlo3XHaQ
	FnKkDJOxWtpBs3ZETKlAFEZHLW+LRqb1GQxdmykNlQcLZSLd6igNzIqbt2c4xb0Rf+AaHriFSo4
	yTdyQbF8tHvkFsKkXDEsxkdmC2UVA0u0ppOOtvkuR0ns6JT7xKH/GxkA7e9rUfS5nf3tCE2CyW9
	vMNGwzlZspTx6VYC03B38qsRjUc501ZBFxMA=
X-Google-Smtp-Source: AGHT+IFHPEAgajKTiH7Ls3GaEiRPS2Tkaju+/hcYdJg8P1mtwrJiU+kcknlPPPv2gncoIiP6NgFWvg==
X-Received: by 2002:a05:6512:ac5:b0:55f:6d6e:1e97 with SMTP id 2adb3069b0e04-582d4257f20mr104190e87.52.1758736270018;
        Wed, 24 Sep 2025 10:51:10 -0700 (PDT)
Received: from foxbook (bfe191.neoplus.adsl.tpnet.pl. [83.28.42.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44740sm5227645e87.14.2025.09.24.10.51.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 24 Sep 2025 10:51:09 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:50:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>
Cc: I Viswanath <viswanathiyyappan@gmail.com>, kuba@kernel.org,
 edumazet@google.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 pabeni@redhat.com, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
 syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: Re: [PATCH net v3] net: usb: Remove disruptive netif_wake_queue in
 rtl8150_set_multicast
Message-ID: <20250924195055.15735499.michal.pecio@gmail.com>
In-Reply-To: <20250924135814.GC5387@cabron.k.g>
References: <20250924134350.264597-1-viswanathiyyappan@gmail.com>
	<20250924135814.GC5387@cabron.k.g>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Sep 2025 16:58:14 +0300, Petko Manolov wrote:
> netif_[stop|wake]_queue() should have been removed from rtl8150_set_multicast()
> long time ago, but somehow it has slipped under the radar.  As far as i can tell
> this is the only change needed.

Hi,

Glad to see that you are still around.

Do you happen to remember what was the reason for padding all TX frames
to at least 60 bytes?

This was apparently added in version "v0.5.0 (2002/03/28)".

I'm yet to test the exact effect of this hack (will the HW really send
frames with trailing garbage?) and what happens if it's removed (maybe
nothing bad? or was there a HW bug?), but this part caught my attention
because I think nowadays some people could consider it "information
leak" ;) And it looks like a waste of bandwidth at least.

Regards,
Michal
