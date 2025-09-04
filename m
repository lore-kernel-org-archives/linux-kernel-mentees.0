Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71C26A1C4
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Sep 2025 19:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014544; cv=none; b=sFuwBaF0J1CrZY/HKW3rq3ui4LdSnUP0yRyLdaYmRjBRsArU6d73kAKo9EGPrAtEleCiLGvLZ4beBBGLKiOnI4rdLOUuu5iSXCxqogcQmazjStbj5BMNCqbAH/X0kV2Pn3nH1RD+jTCT8j07SW/C6FRfh1tPvhxWDPp4gG/EYRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014544; c=relaxed/simple;
	bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moItSsUQ0VQfyRD8FNtfFpe/8/Zvs+atmhkpO4PCiEpMr4iV4UXAgoon6QPjQ2RiZgb/Y06iVKYhGKz/jVMkgwxbmPWuFGJl2AXqD1Ro8GOyMZlvgxOewMhiTW14ylACvtlFa7sxb+EBI52TRpKqEm0GNyCVVxhTBqeINays5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qij99O5V; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qij99O5V"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336dc57f3f2so13712521fa.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Sep 2025 12:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014539; x=1757619339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
        b=Qij99O5VnS1OVFtQaqNo/vWXZ6J1vdccB2s8DUv1O9Uwf81tSSn3YkF9k8HnCpJKF5
         BIAUhJX2EnIsLgTjyBWqrOK8FjNSI8ke/Xw/ruOxNmQjgdP3VZA6YS6eAnu1pqB7ZeIf
         GHJUXQ7y6tv3XCX3PCTyO6WVUzwFGugsoK0cK68udoDlAkzCY+PZG5VfQBKAWZWM4e3c
         VMAn60FvnEsolqTaYz8cA2TNNzI0+sQOYbtqy+juRrXPcgIZzH4FezeWIoz6XjhaIErc
         BaVW4kpHmikofh2Cwu1ql8GWDt1rAgOVd9jZZzK3DHj91Gk1Fb1Pw2W2PHRTcdA5+D3o
         xOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014539; x=1757619339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
        b=Tg06Z9hdPFenuB+XbaJ/RLGeE5BviH8lxaeZY4dAJD/Jebx6vGup4kCDYWLaaCxiu5
         j0zcIQidiqKYXJlhD75Sy3N1faNALTVBHiuL9w/4inSDwu3IMEct7KYsnlBjQxOIEuEk
         yVi0ymSB7BdVU1DsrMpuhgJa0CJUuPSkVptzRQExhvHG0hSXGLkA2IGOWR5QCVqjKbhj
         7bXWG/8KPHTx9BEhm55DgoWOjIJ0SmhulYcf3mjFUMCFWwwuaJ+3EJktOkstiaaCskBq
         jcpnkdvPLNVx+zyqgHKTHeKoLU0Kgh7EM77tb+B8MckF7q0fy7OCP9hakLW7FHztN2yk
         NZaw==
X-Forwarded-Encrypted: i=1; AJvYcCViF62X8LGZze8aozZB7me0k+VMVg3WPdJsyNJK1yZuwpoTfE5wXNfMTYVx+1cAge7ESX/a4G8uWMPSnEU7HPrMdX/qtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPxWWoPxd4Pb5MR23RrREaFjowvvU7+VK+MYMTg7bVyUgCTMd+
	260oBTaRHI/B5wIIwH0meN4FfOKbQYrxicuGgTThdAC7pUb9bkYh1zgFw5dgqPuJ67soCB6Y6Kb
	kL2oIFUAIj+kMcfpGHZ+iAdmFKgoP0FgI+Hy+fR4/dA==
X-Gm-Gg: ASbGncu+l8qrbLZbFmbqXFugji7Ir2PmuuBH41nmH97Gg/v3i3lfJh6096dln68rmG5
	aghC/sMLys0OwsZUyZw8rXCn2s2xsokfA6Ap9QT/xIYb/D/HhptP3l0AB7CltumXuQP9irSqTN6
	GdCrI78E/qSiYLBYbJdpGzIf7uYfMfsy43NjVU0aRAUgxwB4mGFollalZRS6qT7tdTJhZpphOYF
	pPOohcniUlBwhpB8g==
X-Google-Smtp-Source: AGHT+IFk6qWrCgBCMUMmRXmwNfVdMojmRglmfhyiJ5psNymemT9FqXab1r+PbaMVvluse9Mju6Gt2tnrWCGHPJdZfDY=
X-Received: by 2002:a05:651c:1079:b0:332:3fd0:15fb with SMTP id
 38308e7fff4ca-336ca5c1a70mr38397421fa.0.1757014539436; Thu, 04 Sep 2025
 12:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:35:28 +0200
X-Gm-Features: Ac12FXwi4fLng12UMi28VuiL73WI6CiLUWCY-CJjaRNMNpJieZixpye9Zb1GrH8
Message-ID: <CACRpkdYMHMvFCzcA0G9sj+xSrjXROU4OmnV=x0EPfRBpVycQtg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: dlan@gentoo.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 12:01=E2=80=AFPM Hendrik Hamerlinck
<hendrik.hamerlinck@hammernet.be> wrote:

> The datasheet lists this signal as PRI_TDI, not PRI_DTI.
> Fix the pin name to match the documentation and JTAG naming
> convention (TDI =3D Test Data In).
>
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Patch applied!

Yours,
Linus Walleij
