Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC42DCF61
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709526; cv=none; b=Cks9SQdDwtaCKqtN59PXtHebV6HPXgGC7Lb4faui25s5UTuz9XOJoYUlJm7DsK1Sk4qopLSZOFVBWTcmQZtQq4nfgNP13Twtg9ElY8q3rF/fu2wQGSO+uVOwP7BhXnYz8VAdHRJ55ASXOrZ1PCgPfRPNtYawN0v5paskuMox0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709526; c=relaxed/simple;
	bh=gQ8E927A4tX2ZNYrTzlCctAB5m47ibJs+IG1u3p+hbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7Dl0zH1/TDreinRWT0los+aEyS8Dz1th4PdO2y4EJSRlMktwiFs81Hl89deOBLzNo4cpGHbZW08H8JAY68xst8ClMrCz3/mlArL4hW5oym7I+jWp5KIuembHYW9PnB6iEXVuceZrwoHAIkcQWHYI2G4RwilWH5OZJidmza818w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaQMLE0a; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaQMLE0a"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b29e8a3e453so536087266b.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758709519; x=1759314319; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gQ8E927A4tX2ZNYrTzlCctAB5m47ibJs+IG1u3p+hbo=;
        b=eaQMLE0aHDCr1NJgaDpEIfgpgEXURsZB29iGeMsguMO+KwBdLVlVHAHdJqIiOdj4R7
         A9WuaCiONYxchbeYxRFVi1a5USEqKSuzXPkzrqTNSj0VjoZG/0Iaf1t4HYnFE1qEBluE
         FL80iIqayNqcgW3yOcRzdUhV4jSq4yEGaNBrxl1+WdpZmO30FSG4P1BFbxiWvC+2zLMk
         InmlSOQJYzmWYgLIUflhiaKzfGxyBPOhtxk7H0JqEzJ3l/FhlzFHbNcKFURyQzaKIR6e
         YruDgTSlIiQAVsjh4nspN43WyErr+sIs06ONjIVB9HZhnTFjx7SfNjBufGeNSaR96mK2
         jSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709519; x=1759314319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQ8E927A4tX2ZNYrTzlCctAB5m47ibJs+IG1u3p+hbo=;
        b=g3YEpTGMYIv6xZJLtLlErr4P7zWy2zGGmGCguPiXmniiFPu6Og8QRTzVakfR2Tz9n6
         Qm1NnM6q6U9+4TZQiF8TG4XNdHvHKZpb23Ln379dMXNtnZnAS5Gn1CCazCeFpJHT1PTq
         K36Lt9KIRnqs8airiaGBTCljIRyJ0IXP8O9/1rClfULXJbnc60iZXkPxRmhwGZ1SI+Nh
         j6yLDZGxA/5QQyGPGbo7KPpy81+SDwGRYFtJd9qfCGI26KzjHbItsV6B0k1w3/9e/rTe
         xESRtm38VOUkWaOrymiY48W1TRoRa6gvfnbF69x0ldKC2GDwlw91Xgdg0zA8C2G5U83F
         BGzg==
X-Forwarded-Encrypted: i=1; AJvYcCUqlZg+qmkvgSXKp4cYBtGfWw4aeJiRjzZ84F69lXy503I+lWM0p8+pa+IkF61Xjwd14Ff30iJ0qYJalRfIXEnkb9DJQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzO+wy+XNOmsA8pdhTeFjAQG4jdHq/t6hdo/oif4jhH53ZNZ4Vd
	o7NCNDrfRSlG0IC5TCMTLUGYhJToQHZscf1ElmAT6LEl4uY4401BAfuFU8oBvdcZm8rCdQ+bLgt
	rcmKvOZL0oytsu2vJCPpxPcsU3+vwq4o=
X-Gm-Gg: ASbGncuK1EeIBqLmkMc4lmrRzSCiPHU6cCQiGMChk5YUvEHopS3knpkVbb1L5WgqDv7
	35dbB5wwJDF0LHLr+W7Wwqe31OUXmqTX26ehQ7UEcX68oCr0HX2xXtYBFh9Kcmm1hTD3l7BNpSe
	HoYKbc5O0L+8VBhAoHrAIzE+8slb0vQXQJP17Om5Mrm3fCOF5IUXIsYdimIzInonSn1+o3szkCf
	Sq3VuaDv1vIt4CVXIctGrNfnMHnSjjG7QVgWUbpPPcSVt4YZ84BOA==
X-Google-Smtp-Source: AGHT+IE12lCZ7Wl/ftwQJZ/gaWQP8iDkebbGgJsyR1xTOQTAeL+WLTgk8+fgJ+TjcKwHn6/rpkz17KvFRLGM6maxk9E=
X-Received: by 2002:a17:907:3f95:b0:b07:b782:51cc with SMTP id
 a640c23a62f3a-b302cebc948mr516277766b.64.1758709519082; Wed, 24 Sep 2025
 03:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch> <20250920181852.18164-1-viswanathiyyappan@gmail.com>
 <20250924094741.65e12028.michal.pecio@gmail.com> <CAPrAcgMrowvfGeOqdWAo4uCZBdUztFY-WEmpwLyp-QthgYYx7A@mail.gmail.com>
 <20250924113653.5dad5e50.michal.pecio@gmail.com>
In-Reply-To: <20250924113653.5dad5e50.michal.pecio@gmail.com>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 24 Sep 2025 15:55:07 +0530
X-Gm-Features: AS18NWAdKXxMmFRzk01TMU60U3Xy0PNKUuld4uhrZt1ayU1Hp7kGVqqNqefl328
Message-ID: <CAPrAcgMhphs1U88_POpxAeAp0KzNCH6-xuvNiSBa5dn7ceSU4w@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
To: Michal Pecio <michal.pecio@gmail.com>
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net, 
	david.hunter.linux@gmail.com, edumazet@google.com, kuba@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	petkan@nucleusys.com, skhan@linuxfoundation.org, 
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 15:06, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> I think yes, usually in USB-speak "completion" is when the URB is
> finished for any reason, including error or unlink/cancellation.
> "Free" could suggest usb_free_urb().
>
> But I see your point. Maybe "finish execution" is less ambiguous?
>

I will use completion if it's the standard terminology

> I think it's an irrelevant detail which CPU executed which function.
> It could all happen sequentially on a single core and it's still the
> same bug.
>
> In fact, I just reproduced it with all CPUs offlined except one.

My bad, I see it now. I keep forgetting the actual urb execution
is asynchronous

Thanks
Viswanath
