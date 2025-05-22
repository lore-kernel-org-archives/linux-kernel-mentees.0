Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D42262FEA
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 08:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901640; cv=none; b=tCmLFYkRE1Gf5guCYLaclLQNQ6G4ZuYoqWFhYEWOvtAT1fkbCA9y66h2keXq5NRj0aFkvq/QB/zLcyTgJdolLP0h+p6Wt2UF/LgnySJ4I01DlflFBxrqHUIxKoBsDPvwEycU1n19OcX9wjUzaF8J6E4A2Cki4D/SfLmDWAeo5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901640; c=relaxed/simple;
	bh=qnh/L98cmCh06yFhdCD+49/1rYyJlK6mPsgNKSKJHOw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dMPYvjNyxA5hCfg3s8tIHiNpjWkpSg5/2fTqxY1eKjJyw0fRgVn80CdrR3vn+YfVBcS8HbuaJeIVfdUHJTg5Q8m30vUlFwBjTCGygAVJKgh8Huqi/v+929d7F37ZM+LtSSDB9/NVvFCYhclDrybgYsziT56DIWl4KtrMvTo/axo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=dbwEkZsf reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="dbwEkZsf"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86a07a1acffso533178439f.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 01:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747901637; x=1748506437; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8fveunfssaG8fltpv/kYgW4QFBaP5Z1Q9jmR2Ucz+w=;
        b=dbwEkZsfTO78SF9/2Z4/fHT27lmkUrap6NFXV6gAUWqPTbXe5UamC1p79IfHOX6u7H
         8OIlkLhossjOytdNAYyGS2JybdQ1shJxJLCer6SFdpvTiz6Y25Tpl3vSxH/vojQEXYPq
         loQrKdFCo8fZk7989FHmoTAM2Fbl5+6UWvHhlKfj2kBLdkoejgLAWpyrla1Ve511oN0M
         KqnbqVsQY8EyllOudI6AkES+e1HHxRct7xZM56xE1HtWg7AwXPOg7XvPT6PPL2Hk3RSr
         dgQXwx9ehW3j//a3CdDW1sRjq7fNzfaTEPdZT/c+wbsyiTH3gHLk7PLu0hwe8duDNbTd
         0ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747901637; x=1748506437;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c8fveunfssaG8fltpv/kYgW4QFBaP5Z1Q9jmR2Ucz+w=;
        b=QE++UXX1HPYlfERUIpvHdYGgb4pydntPpkK4IEk4xQ/xDvXP0EWfqMfv6WULPGXF9s
         IW708Sww2y/9ZFBiu9i7z9RkNmTL5aP9ExGvN6qL1AM/+nS+4WmbA80BOMaz2wc6IJS4
         cgo976GIQTS6KStaE3iGVI0xQgq1iRXpUBKS640zjm8mZVl9UAw9org30YjtqFiaWaX+
         yS6aj4Y53TpzIktNjXfrPX/+nXBVhlt5NMZRRrTRCnE3UlE0sKy5JCF0fNOtXYsOM9uO
         IHWOHKHWLIpbyQjuLc+Ue5fDBV2cZOVe41RSz8YL9qy8dfRjTl4wF19f9D7OkG0GblWp
         l1zg==
X-Forwarded-Encrypted: i=1; AJvYcCVwGe3M9XBp0HQ34D0aDW3ngADh01fwRtsta/IZMkapmUyr2OIgy0VenLYZKFMnvw/do3J66VFVCE1U3g0y5w40hqUHhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBRWBYFv3YkX5ZxKNgeLBtBG3iIDT4UosCe1qHFpG4OkTZ0RGu
	tkMPlA9nvotOvILXr6ygJWkbEwxDB2/Z5LFRykyA6TmwSL69ng53KOAIjW/kT3ZAmpw=
X-Gm-Gg: ASbGncu8d9NdLbw3OEFd4+68Y5eQ8dJ4PWFSHDa73TCJOqI5x2NMyLGtVIh9arpLraP
	Lxu0Bsoa3OwCRV90WOdQLe41pp/4y8U9FBs+srq8vdWgm0g8cF6LGxsrRZJtM6sPPxbCW8DX1oi
	FvnSBn+w3PJuZxEhDw+vflxVYjxTW0Zb+6fmlFoLqu563+WSUw0rrXf0ErqjrRwTZZNx7b48w/s
	cPJ79hFFCj3s+21J7kMBSk8o+f01pqaEgQ8psLwoCEiicxkqIqrRgyTpB+x4of5BxJdMM3ExJ6X
	8bQ/MElhsLJJ1AbxheB+ySNhnOW48dY/rQLRuvtGZVjo9m1q
X-Google-Smtp-Source: AGHT+IGjlgR+V6jDNuVgn2VgB5uR3ziTvMUlyMDL1h3fTHRWO4bCzJmoSqf3GPL+uFJjXhgZZKrRUw==
X-Received: by 2002:a05:6602:4808:b0:867:6680:8191 with SMTP id ca18e2360f4ac-86a2306ee1cmr3484870639f.0.1747901637427;
        Thu, 22 May 2025 01:13:57 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4ea5d9sm3017587173.141.2025.05.22.01.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 02:13:55 -0600
Message-Id: <DA2JF2BN2EX1.221D1WL4QHH8B@brighamcampbell.com>
Subject: Re: [PATCH 1/1] Fixing a minor typo in YAML document
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Jihed Chaibi"
 <jihed.chaibi.dev@gmail.com>
Cc: <heiko@sntech.de>, <briannorris@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>
 <62bd6757-c4d0-42c1-a76d-abea18a8a55e@kernel.org>
 <CANBuOYpRQNx+n6BjpAF0LufpUqRA3wU-GzSNygeWurohXYNF6A@mail.gmail.com>
 <5f7f8cbc-6501-459f-906a-250be5443d0e@kernel.org>
In-Reply-To: <5f7f8cbc-6501-459f-906a-250be5443d0e@kernel.org>

On Sun May 18, 2025 at 4:34 AM MDT, Krzysztof Kozlowski wrote:
>                        If you do not Cc maintainers, how is it supposed
> to be picked up by these maintainers?

While I understand that Jihed made an egregious error in not Cc'ing
everyone listed by get_maintainers.pl, I also appreciate the irony in
the subsystem maintainer complaining that this change isn't going to be
picked up by the subsystem maintainer.

How _did_ you catch this patch without being Cc'ed? Care to explain to
the uninitiated?

Thanks,
Brigham
