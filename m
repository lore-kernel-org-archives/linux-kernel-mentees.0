Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18811E260C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Jun 2026 19:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762678; cv=pass; b=Q5JMJHTtNsX6DWDPko1yY6Dkp8DmPTKXLJ8mDTJ6dipADP597UgrQUOQfriqPjhsNE2IDzPgkFPvBbws6fihqBKhNlC0GY9VKJVj+bbXvg5cOoPS3a0uNLHBDW4BHlC4Y/3dNsk+mR7okIqi1gVV8joMPOdlLDJtymsryd4lrG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762678; c=relaxed/simple;
	bh=GYvQZtHKiSZ9Cl/h8gn/k3hLFG3jFxoOR3EaXdOu6tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4TPbRR2bR26m/yiq+bM3uBh2izBZhcQR8Gn3aG5qP5wc3+hoC8YMMj3TKS9tVl1Dgz2fAVNsGN+vC80yq0TDlfQF15Woufoj9S9TWKeCz+GiI1Ytof0UJnKuGIjOj7Y/cENIFqQE+GwKHqKCtCfAazKTMV/uN/HkP5InWySESY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFoWu06P; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFoWu06P"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30cb5001e5bso196785eec.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Jun 2026 12:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782762677; cv=none;
        d=google.com; s=arc-20260327;
        b=lxqACfuHI5uGwZgCYQCQRwZqdimzYJRuzzQXv+aj5dJ+IhWM09gRlslTvX0S0E3E+1
         W0Fb1txgYq9hQRDy/z2JdwXR0a80lVVQRa25XOdv/WeSbNJf1ZGey9RQdRC+PUqAKZnJ
         KfhgF+3QHAUfinvQDWQvbvTF9yxesEmJsRa3jWzgAoqZhN0LyqC/cRIuP4GWLkvwnK8t
         5IwPCoUDkJZpQKtdfo6IL2BrLe8gbHhJGeiAn86Ih58fOYj1sD5HyO1kGlpV3usOC1UD
         rTXPAbBFI6Nf25gQAtEUQLYrZWZB5s5VC3KK8NQCGzkYLY3f0hFf87uBQbraasE+yWW1
         mnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GYvQZtHKiSZ9Cl/h8gn/k3hLFG3jFxoOR3EaXdOu6tA=;
        fh=Artf8dEI8vE6lUBMUjDmMx9266DCIvKaBIsO3yVAzJ0=;
        b=BXehXqL/7ONKJqgUMSl+fkKggYb3NiMdQ4xYLZ0vIrGr7X98gA7LzZxMuDbBt+2eCl
         N1WQwzMW0xL8pp0SzxkOYrUR0mWO7YdAiXUMm92ak84AYiy7JYQFKRSDN0Tzgx2UCVwt
         9T1D80MNCzXNB90dnEY2BWolxyDZW2aLAW4OqBlkDg7OTFTUKWLX+F2u9Ko8vDJ91ol5
         1n/NImGNrr44obRr5VHwR1Kj4Tl6zql7w4lIo2A5niLJfHgjb8ObU8Bw35DZ6P11gSCJ
         ItxXLBAVC4bP5PkPvEDGffmiDxCDNoCxqG1o0hiH1Gr2IbDNcBuI1UuRBS+8GvszAkaL
         Cd1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782762677; x=1783367477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GYvQZtHKiSZ9Cl/h8gn/k3hLFG3jFxoOR3EaXdOu6tA=;
        b=mFoWu06PCvo2hGrKM9+Q/QdkZIxoHGWvz7QR0gT3o4hV6im9mCGrqrNddc8zNPy2Ci
         Vb1Kw42kT5rzT5jaVNgyWlcwnaR8wgNl3/MGxQE9VKg2XC1alDrN9U+qJH3nKSUQhPCv
         6eBvgwJu+TLcabmHZt6S9fwrOZ9mHFxCcSRwu5dNJDbSilBh8G7heNfW91dYmyx3EjuC
         Q3zlNPB/DDHVsSAtmfTqUIMGSuPZTEb450DxCZCjNVWlXk3kw1z6K79jsQik42A95okf
         XeazRxLPHWnGi3uz807RHyJO/cxF9AE9xZIWeqVXpGCnZO+7ibeMxOUq6Sd9lbZl1i/m
         oV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762677; x=1783367477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYvQZtHKiSZ9Cl/h8gn/k3hLFG3jFxoOR3EaXdOu6tA=;
        b=S95iVPbf8i4GQwZkqKwbnQB7FT2DSlcGJxYvLfGxgdPVFxXcWsTNvZVkMIXKKc+M1O
         ikgElIugsxtAEzxhHqcfRwIhztw4nsljelrHirY4rU8oLXU/U6s2IObedzVTKUMM/vC3
         QBYtiWfp/UrE73x6N1TRoGfFppLw/+MiT4EbrawmGPHUkxow9ZWrGgCkiZFvP4OGu53i
         9Yz2v51C5rAak+ixPDOZxy37nETQFNqLGkDry5Fb8wEGrzwI+dkjOzPM0SuIGGSuQus3
         l09RR1FEg773ver8HdD6QQDrIALr82c89SYa43RLscZdwJY30ZuySTwtIWE2xPHZiXU5
         PR2A==
X-Forwarded-Encrypted: i=1; AHgh+RrTXemG1YKNQCS1yUQ/isRMiI/tEuSrmawjys/vi9vKpYYoZDGOwBfiwW0GD2f95XHwf9BKeRjNPJ+icBJ4SOqY/6Jhtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMDKlmj2Rn9Cw6aY6lL3lt9OdDGBAuk4qCMOzPP7487G0m6NCP
	O399SUj5U20ff2mhkKzSGJ9bbdLErW6LBXTZxtE8Bm6NAErTgxMVaWe7yecMq0bqE/IyLg+jRxj
	DzDn2TFfySh0dy2RDIC7oDte7bxXNXIQ=
X-Gm-Gg: AfdE7cm2QvzY3r++WLnhGMx+sLMHyum1i6K9q+3H+75FoZR936xJ6B20Q5CteawRnaD
	I2n7vNcPbXa5CHP3oAuPifqtkFqtzvv4+jiOS7r6d5H1lZONqFmGppThYXO+y+rRXpnXqkyV/fk
	ppEdpz/N3kj3oT1Iya3AkN9bTt7ixOR+2aWrpL6gV+1M7fmWeEjjDQ4GAQYGoO+Ig9TxVJ+uXQ3
	TK/7jFPtEmJyW1bPcJirlmAITLSvUshwt9QhsyInXyYj/keGgJBmT6M25azCvfyXMwA9UTY5fTa
	UHgT8WMO6hT5GncSLpPZVTKOTc4cx7dvrkeQlWMRa1QTGcPsNkO+oO1RYpZOgu0Ii/aSnvW3JDU
	YGTQ80zPruIIwCw0+Sn4bbXg=
X-Received: by 2002:a05:7300:3f27:b0:30c:6a54:3fe6 with SMTP id
 5a478bee46e88-30ee147fc23mr224426eec.8.1782762676955; Mon, 29 Jun 2026
 12:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626203122.713317-1-nico.antinori.7@gmail.com>
 <DJJOZNFW51LZ.IKTXQ8ZIVO55@nvidia.com> <CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com>
 <DJLSIEZ5OBYX.APFOKYYKPU5C@gmail.com>
In-Reply-To: <DJLSIEZ5OBYX.APFOKYYKPU5C@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 21:51:02 +0200
X-Gm-Features: AVVi8CdBhkO1DZcCDL2isjLxHOFx3Y1StSa9vQ4O39-R9Hyrw-U-_JqScw702ps
Message-ID: <CANiq72m80vip+hz5RngvgH4VxU30amzS-ePr6KVKwKvhf3=Ycg@mail.gmail.com>
Subject: Re: [PATCH] rust: iommu: replace core::mem::zeroed with pin_init::zeroed
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 9:46=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> If it is ok, I can send a patch modifying the doc comments to link both
> functions, noting that the const version should be used in const
> contexts/pinned objects and that `Zeroable::zeroed()` should be
> preferred when possible (as Gary commented in [1]).

Of course, please always feel free to send a patch (it depends if the
maintainers end up accepting it, in this case Benno/Gary, but sending
is OK :)

You can also send it as a PR to the pin-init repository -- I think
they still accept both patches here and PRs there, but a PR there may
be easier for them.

Thanks!

Cheers,
Miguel
