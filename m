Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABDB258CE7
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758746569; cv=none; b=qJbEs/eHzYE9kivs4QG0c6wE9QaVaNCd75vtcPRuMZB2+8X1Y63ZwgiNZncy+2zuPmRqcxDTARFS8yjLVgmX975o44YoPzy/ipCNqtjB7V0YBpQeAC12u9XeENj9hPD16fVL9elqWdFZqO690SIMSa30s9G/MCChHwSk83QTRTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758746569; c=relaxed/simple;
	bh=Ucz/i9AWOR9GXa1xL/rpLdGn6X6OtYj7N42zAdlWFDc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kh9PwfklD2t7jk0h9w+2w1+0N2X7JGulmjQccpW5aNH3RRCNITq0+F/ramDem/IXz+UGhvkIgMtURwrEue3TTWokHm+efTtujeqgLtz2MnxspvNdDI4Bp4SKuoqzmSfyJ1zl4Ij1LzuLkML6JIIHoYF0M2Hkur9r9DGDxy3m5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L52sgcMN; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L52sgcMN"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57ea78e0618so220562e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758746565; x=1759351365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYnzcg/e5OYQohYl91H+gnYqtu6/MdF2Xt8l0Tcfgig=;
        b=L52sgcMNtXhHTUIYlhk6pG09/Wgcdi1QoiwmjsnhBUKQzur8htIBNors1BqmxnfUwv
         g946LBzrw/de8rXIkC1Fv6xo6y0kvAS8xihfZoIco+aVdXWE0/Oaa0lzrv5XrPQoyvJ+
         6AHugLmjSS83XoyuzLI1cGyRnAmu5gQ9S/oV7282UwQrGDlYyTgEWrGLcSYUH1jdvHvs
         kTWVFaO+ADqs7DjzOoy2uEyzIw5hkMUTGTuNCqtR7WS4Xtx6n1N022j+tyh/RPHqvgfc
         Y1ogvA5Q4xpF2woumNEwq3pPWKXbIYjGqQz2KFzvLHKAmpB+U+dmAaGLRlbuJoCckeF6
         KvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746565; x=1759351365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYnzcg/e5OYQohYl91H+gnYqtu6/MdF2Xt8l0Tcfgig=;
        b=uVwlB+jrJbH6lAlqKMt1aG8+5Cp4zYoynrgsrv+XvfjBS2/oQ2/XWdUjldJB6r4v+j
         6ccDfZwyqg2wzBs1ByNJ4xpkUR7GWSt1bFKAZi4J2kMm+zvQ6DLW7FFxdJW1/dOwjMxk
         PnnaiN87muZvGNf0o7nDWxfvbJY9XFTezTcXHEpS0VQzHn+Qq/H1vW6wjNBWlQeqtWrk
         18+wcXu2xdwkcIuBSKj0I4hf5BG06vq85MSVdsARP4yRg5LL8VDpmMi2plzn5Rt7uHiN
         93gBIh2JdAVxvnaUvNHnknLS16vs0Iftv2EubXcydI8QtiJf/v+K4CxXCgh3NBGmpybP
         l0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwamHaCzzV3/scZ2y4PQXamJMilvYQJPTvJb3WmOO3ImCTQh3kL+7kQoutGABWgk5Gsfmi1WReZ8SRKJPtuzfAdnqZjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzS4ZttpXcG4+1KYmcozDZyYV4KO0PVomOhnR3OwGaQ6mOMrrDu
	DKqE+zMdTxiTdaTdOehAKhSo/L5AqJTQGR2oq5LTr7Q+rnUf6rUkKsiV
X-Gm-Gg: ASbGncuKjhCi8wlSAIjlwzl1+X1oo9Q57f+c7/J2u4V/LFi1KDb/r17L90k4v76xShC
	7cct5TQfbP8prfBRIHd46uu1Te2naCmvG+hBCgzfhRaZMnHE0qN8wijuL7cmQtn45F6PrHs8EAj
	PabVBygdt+eZfHIcqC6Q8hP2u3EdPUtjmeYb75e61IpWUkLwREu+zNdlx0E0Jx91P6GxQ6FIBO/
	u1rBsQ1O7BC7sxHoEnyyTGcYr2BOFFj6BpHeiomZp6MaTF6lHTR0d9vUZDxNp7njOsJSZHDsJHT
	jTpAFehXUd42nMXTujj0mJrumfclHjRcV4w/4V5Dzpd9bJWtsPLVq9QlHxfnlmziOENU/Zy5XMj
	5Hqwek3eVCBLkA82Chml4WSwL0KrI2cICMys=
X-Google-Smtp-Source: AGHT+IGyzL5f93thSN0PEzq2w767/JoDNWiJBH5bF6LdKrr9vgdH4gRJ604q0DP0F1tZQOVY9vZyEg==
X-Received: by 2002:ac2:4f0e:0:b0:55f:4ac2:a595 with SMTP id 2adb3069b0e04-582d0c284e2mr270160e87.16.1758746565220;
        Wed, 24 Sep 2025 13:42:45 -0700 (PDT)
Received: from foxbook (bfe191.neoplus.adsl.tpnet.pl. [83.28.42.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166560dcsm368e87.94.2025.09.24.13.42.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 24 Sep 2025 13:42:44 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:42:39 +0200
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
Message-ID: <20250924224239.3ec0fcca.michal.pecio@gmail.com>
In-Reply-To: <20250924195055.15735499.michal.pecio@gmail.com>
References: <20250924134350.264597-1-viswanathiyyappan@gmail.com>
	<20250924135814.GC5387@cabron.k.g>
	<20250924195055.15735499.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Sep 2025 19:50:55 +0200, Michal Pecio wrote:
> Do you happen to remember what was the reason for padding all TX frames
> to at least 60 bytes?
> 
> This was apparently added in version "v0.5.0 (2002/03/28)".
> 
> I'm yet to test the exact effect of this hack (will the HW really send
> frames with trailing garbage?) and what happens if it's removed (maybe
> nothing bad? or was there a HW bug?), but this part caught my attention
> because I think nowadays some people could consider it "information
> leak" ;) And it looks like a waste of bandwidth at least.

Sorry, stupid question, such frames are illegal.

That being said, I see that other drivers pad them with zeros or
other fixed pattern ('skb_padto(skb, ETH_ZLEN)' seems to be common)
rather than just DMA beyond the specified length.
