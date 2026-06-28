Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D7F36E49B
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641352; cv=pass; b=idattyNWZ5beD0Ki0n00Th6xViaQMhVjIIceL9RgEjcbqGDMp5ErJLxsIfh08VHjTxxmMnv8JepnI+hYOqJpiWWaOMb0iIjWeDghw/nRG93vHV3P13nXJztfW6KpW7d+2qZb7J0J0/FCtRxJLMhvIyLTNRx+MfOPvALYS0zwYXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641352; c=relaxed/simple;
	bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BY6VgEM2l6oGHH3Shkk1cxvJdnGW/DuidS3EePgMfddDtNIlblWgbTbgI89YAaTg2ureBbiXTpuUChKPgijWO2jype0BAlPRJ+jObLWsVaVEpEFGR/dRh9OEPoDu/amOE06EdrQ2f21fGb8MgKE9GeBM1YTYn/V7BoSrWCc0WBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3huoYa4; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3huoYa4"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30cb5001e5bso72094eec.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 03:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782641349; cv=none;
        d=google.com; s=arc-20260327;
        b=g3P9vK3elnTIJe8HitLzJFwHnGHvYEkOS2HSJcwBcjDOhwnvpT02YQNGHwHHWP0Dph
         dTlUYFtcmgYPAeNsd5GnPgqHOcwvftU4jgyubqKzaN4hZRaEv8SyyF1EwX6xpWqCtPjj
         QivQZxdiXa+Lnl9LcwpTN+/Xrg+gkBod0Ih5efZ/RTTF0SUVpRXLz+T3EEKCrk7iE+dq
         LNIpvcIrPJIJH3lQuPMhAs+V9Tj3+/gAO4kclSGamj+zKs4Xdb9fMrMeQ0PzbGr3Rlcc
         qJAcT7ep3SHc2I69ESEdm9dao+T/b48s62Mml2Ai6zBsmozyaaE9iJ5VpcZeW8RbWPzy
         vOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        fh=jcqkKSe1YLhxi0OByxn0EhjNAv8b8rjWqIERxLT2pro=;
        b=o68wqmbw2Ri8AZigxnlT65ItdtHNLMBAcYGyob+KcPNXUrovBPD7+8FvEwk4RcFEvY
         vqgC5xPJFj9yGVLqNdqlGEkswlGZcKChJo79KeUpLIjqSajw85+0Ggs2Ma8otSEIB1WV
         hoGwIzc+WHKkvKjkUQTB1xE6tqFPtYM1zHhHtXroX1AFff97NzRGWAug2dTDpzIBY1AC
         dI1ZZThPg3/rDjfoZbl+lIu8NTWlTn20QeyAJQIRlxl4TyEitWLXfbK3Oumph+i2QfVx
         D4fz9SgX6LDfCacOvTx3EMcouRdMfK7cBdIRTkYWmN7NWpeEeD+iYmfz+G10XgeHj1G3
         v2aQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782641349; x=1783246149; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        b=K3huoYa48ZARgwpqlkv0/x9DN5E9q/yNVHPXc7Fx8LdXIJDvhoIJP2OskRKNLAJiA7
         APKH45UuCdMX9YezbKjn7iDqgU723kj+osP+BDaL+1Qieu3WdwzcRs/XiY6xxgFMLQGz
         LP9bsRkkf5jl/8bC0ubWr6rS8216awToeATZUMDRp/EArC/vYM7T5xCpyd4nkPZr0JnG
         gu8eOCqTP1eHutrghyKnqEroDSg9iPtufLyh8mT6K//cEqxzQYYkXvVnOjdeERquOjZT
         cBTftyo1iJ4M8FAC8EY/vyn3hIBa5jwfEezkxFrpQ67Zdg2ZijaN6BZdTXzlQbGogrLV
         UMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782641349; x=1783246149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        b=ZOUfpf3zFGuCwOvdHVuNBQfH/bFQsXOed6eWBEJKBZbgqfYglO3rJDNKf33Sw9xtty
         Vh77A8ZBd03QIRgS6UwDENxVEexQEgZSEy4LOg//ewrSMDXTOncrO9zLVyoFu6KCocl/
         keLPcPhmo6CIG4lw6mPjcB6DtTOfSY0mVJGcUfXsN34/HUg95pMzxiamtNtnn27fQiu+
         BcGy6Zk/7FSa5UL6OmCZ81vS29vHdkfKRV16HDkipookDlqAJecBOZKcym8P/gAtWA9/
         iSJWI+tu+HyZjO8I7cPCVGJBIuyqenioW1Y7PGFaGax8BZO6eFBub5CqrMEzQGd3LPTt
         rQGQ==
X-Forwarded-Encrypted: i=1; AHgh+RojtfMCh0DwXftPmqF0fMhXGjfUyZ4mgmliHii7+N53ubnYDLL3XIbHc4Tqi9gO/mXbKpLzCiyqujPnheVoiyWvNJVhvg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcg1Jog9W8iAnI0+rXOOTWJ5R7Z3yHWENBieAoW2MW/ZaecCv9
	u2p/DIiW6EsElKFSg9/EJwloEVk3Mzk8x5TwFcn0P+VS+CpWrjtmjusj/nqTL2gwu8exQlMIbyu
	3A012vSlnRiecHomqnJN5Rw/P/zfRrvw=
X-Gm-Gg: AfdE7cm7DmBDqyjBS52s3xsjy+c7+ybW1n04BKBG6wSjUK+Dh/7N3365MZlmYZN+uk7
	MqNJHJ3PRF5pGqCrZ3LjW/yn6q/9UyrMtt0JoHRPnNngxgddoP+Nhpqr+naL6Xx3dZ4/GT62zMV
	itrN7XkrF5/uTqeesYTIcKmT87yZcw7B8tjiIbRIzZwT9e9OBFT2Yxz2OFDd0lFrnh4VlVdC9B1
	v+V0uZmv2z7Q7yOKhZGl/FfVgy4xZO3nzL5hjO3cr6oP9xbZFu0ReqJ4/M+ni348Z86VEg+3ff9
	3pMQklRVxeOZveJujjuNgDWBeuK6JbcikdXumHGUW9Ka1MjisGStKO/gyuO8ROlNJ1R+VhgcVjV
	ZtWREVEpytqUE
X-Received: by 2002:a05:7300:8609:b0:30c:b42d:47d4 with SMTP id
 5a478bee46e88-30cb42d4aa6mr2725415eec.3.1782641348716; Sun, 28 Jun 2026
 03:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625224927.404258-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260625224927.404258-1-nico.antinori.7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:08:56 +0200
X-Gm-Features: AVVi8Cfb_v-G46exRFY3-4t9C9_BwKpZ6hE6o2xuD9yPTXeLyP3R3mkBDkoASc8
Message-ID: <CANiq72mx1EDo4EYLUMN63_MtScJjobbPH3QCZ50oJCnZ9vc27g@mail.gmail.com>
Subject: Re: [PATCH] usb: rust: Use pin_init::zeroed for usb_device_id initialization
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 12:50=E2=80=AFAM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> All types in `bindings` implement `Zeroable` if they can. This enables
> using `pin_init::zeroed()` for `usb_device_id` initialization instead
> of relying on `..unsafe { MaybeUninit::zeroed().assume_init() }`.
>
> This change improves readability and removes unnecessary unsafe blocks.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Looks fine -- if needed I can pick it up via `rust-next`.

Thanks!

Cheers,
Miguel
