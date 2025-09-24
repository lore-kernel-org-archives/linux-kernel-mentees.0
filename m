Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4328136E
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758701270; cv=none; b=TgvRK8BWVPQQRuxaWvSrBG6iavg22zPgypRNnKek7/uGThHBZ51JIOk3tNgTYjoB8v/N4scdGBxznZJAyQC7jtZLeGk4LDOw3sc0/7q7Dyxu4Nj15cqLY6feXYbAQPyTRP7dY+dUiv6B328cvdzyrrcWcETux4vVJ7Df5fbZ4oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758701270; c=relaxed/simple;
	bh=CPJFhlS86lHjQ8Ti2XaTHsWA+1yz9pSmmfGw3hKwYcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+Ho4NIGVSidJQPKpx1nhTUoRA/tH1qNUVOflZVOP7CGWlm/l6O31cTJsmko9dFGR5OyHkF+LuGXMnlGOHO8E8+v1BUTRdrsfLtvF7Kp+wDld5XDVUi8LVkc6h9ktFh7az4Ltt45MNUm5Q73elRW4b0HFuoYg16EQLw83p4xKnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSHOPQAW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSHOPQAW"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7322da8so1172664466b.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758701267; x=1759306067; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPJFhlS86lHjQ8Ti2XaTHsWA+1yz9pSmmfGw3hKwYcE=;
        b=VSHOPQAWSJ9KcWSkTDbk+T/NYRX8gyHNyDjemsL/C3nANFins+SYkyvvSVssFch9Zy
         kFRvxpZlMHehQ8VgEr5R+81YGHRuB7X4nj5zsMTyv6WSOfqLREO0DPQ5H4JbxIofYuHO
         6TUyEus7cnv8eu35gndAGr2lAlp2RJcR7sx0eqVmN8RrMuXFS5YsoaHenuudOfjFceky
         JULbWwutB6nXotWHzyH4aNiIzddm+sv14YMuljVIVgbN0VMcZsVUnbrWRqqzkYHY1GFW
         MnyUeLJCkonohFuahiT+/DIb9V1jjzYhsoirxTPyMCleD0sN/pI0HqMDODZ+tnj6288q
         1ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758701267; x=1759306067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPJFhlS86lHjQ8Ti2XaTHsWA+1yz9pSmmfGw3hKwYcE=;
        b=tD8N/foPPMwZjHkJucVPoHjEKl8vAJ2kPZ6le0gfJL6uPljZJo7qynob6LfIL2W9Q7
         U9RlAP7Ip2WvqwoJ4ujvEiQWUj+Ijtht2H81X66fj+XOp1q8POrFNl9q08bYZdjio9Bs
         xvi72StisQGdsK73hS6hmuyPFEeGBT8GUsgX/l/ow6cw3fB2UcI4opqPaIyXp1rdkfyT
         oI6I19k5Vaw5tcxLu61QKfK64Q87wWKAOl+szWIkfvEockOpfAwQWxYi7u+e5HNsgX4g
         0vpG+Ye6FevFDoSAE7KsRRqvDK64UW+4dH7i27zmbRIMjZHK/ZyiB7m9X10sZOhl5G4M
         jYtw==
X-Forwarded-Encrypted: i=1; AJvYcCWlsIs4wUPqnDl9dwK48Ok2yxOTSbL1M0H3H/v0oRRnm40NExCbptjQ7xgt9/wvE9HGVl3mupPBs+2w6Sh5cMcPHpF9cA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEk4elacA+3Js8Z6J6jbb6reKF5lgoeJjd9TNB1k7y5yRvzDAD
	CzonGsovk1D02Q1j3xqOhoTR1t7wqX3nxyQTfl8iNmhiFLpQH9m9hZAI9kWRoqDCxPbpEbRUwlY
	1Beg2PNjDeEQmGqZa05UFI6yeKuHdNo0=
X-Gm-Gg: ASbGncvhGEWvraeVj/ulhoA8pb77yrmnL7gGnIpvAVcktP5jYA1N+z5a36HrZGTEInR
	nRjVkfh2zuwyXOX+9na4ZgAWM0CPXPDdak0w76h3GzuubLGwr25sDmsbgktEWjtwFJpSYzBDBrR
	0TIGeSncyg1cFWujSiiElwa4AIVKaciUUCczmwEc8rulU5DAoLN0/eQGAgHaLcgrAArwVddCaLO
	lZF+9p5swTgWmxYvLKYWiX7Z/oZsQPbu+pQWgUENx7Kyh+EpyzMWA==
X-Google-Smtp-Source: AGHT+IFWa4lkAHwf/4SArdm61wLTC4F7gQbf86GEjLZLwo2VefWv8FFXmP8OkTgdIk6qtNPTw6EZddqMonym0lxMhp0=
X-Received: by 2002:a17:907:26c4:b0:b2b:a56f:541a with SMTP id
 a640c23a62f3a-b3027260835mr530198366b.7.1758701266609; Wed, 24 Sep 2025
 01:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923022205.9075-1-viswanathiyyappan@gmail.com> <20250923164916.5b8c7c28@kernel.org>
In-Reply-To: <20250923164916.5b8c7c28@kernel.org>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 24 Sep 2025 13:37:33 +0530
X-Gm-Features: AS18NWCT-FjALMCOah9bf_auRuFbM1Q3yx9_Iw8e7RGCWur-FeBhqSVRINH2d0w
Message-ID: <CAPrAcgOzf4XYGA8X6TneRrmVwYVYgF=KvnpmRbT6XA+D9HR6jQ@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: remove rtl8150 driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 05:19, Jakub Kicinski <kuba@kernel.org> wrote:

> Thanks for sending this one.
> Based on Michal's reply I guess we need to wait a bit longer.

Sorry, this version breaks the build.

I will submit a v2 that removes the driver properly

I hope we won't need to apply it.

Thanks
Viswanath
