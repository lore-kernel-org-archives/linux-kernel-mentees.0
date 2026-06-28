Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BF33BBC5
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782642706; cv=pass; b=CEIsbe5qnWfigwyhI+NnqQIYN/mDTKy+mcbAJxN9BcyGjVetG3Wj8539nn2jM4SpmkURZgsWGJgoP405Vx9wO0SS6myxqMr31IvLI9LqyCfgM1saWnlRfdzMaV0BuWcwieoTgrT2xX04RnasYYlD3yRDET07IVycZ+HzCPaUbzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782642706; c=relaxed/simple;
	bh=p9T7gPyArMS/KVn5vgGJ/6O04XuwG8iFCNcQCBiuYx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7r6lZPUTnNuO+7rw5VgVrFl/YndtZIPISGLc6eSZlvAJREL074oUrXFbcL/zvBUvDCsUMlm1X0TyuQg+H7BFoNl8GXee0itPscov3i1XLeCyXKOmhU7Q/kKvrjYYpcSlaXUTGco7AZ4SkUc/JCiDADCeVlT9Drq2qsexZRXEVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XImHuX1G; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XImHuX1G"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30c5912314fso274059eec.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 03:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782642704; cv=none;
        d=google.com; s=arc-20260327;
        b=U0E26fOJyqdEYBvrT8Rda7IWPb3plPZn/xYCq+prdw13Kviy4ZmI2BThB9NqZ5UoD6
         QIxCPiKrmf6eShREBo/c6XejDUjz7AWaxCckeXPTJqhTSP1MDPN7EkjMMuOAWHbZ08gV
         P0OgN/2AZxGZ9Ee2qUKGZw3BwQHf+Wx21NW+u6yqQUYOL/d5C04IvAPjSgPbUa0xqh+H
         KGl5Mi+cq2EVCZier9kzAUcagqAX9XXRuSFVxNuKjLc/OegTX52UE9trOgxyNnKVP7zD
         e9959dnWbpI+pYBSaeuK9wqu5/exkM/8GBmyDb0holF61CJVby8NYMgxGxSpQpH58FwM
         OsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9T7gPyArMS/KVn5vgGJ/6O04XuwG8iFCNcQCBiuYx4=;
        fh=Ken6dNfe4eq//gCmMG6Nnx/SdrcPQfiOWRxZqXl+rR8=;
        b=lnPg6OwV3RsUSyVMJlrOqqhS82IEldidRY981UUdRGZbsuwIEHmAfD48EO/GGqk8Bl
         /uu2QbAyQrXXKUPMcxxJS1x2+MW6DxYAdb8b/azJ/1+ZAg/1YTS8YnoodBRE2sK5PYoL
         EGoBDEouzwtlgmNg0UQI+q/8D2vu+muvO46abUxZ8ZlBr4l0uJJ1+9+CPOh1p5bLyL15
         scZ14b4RMyjqRaDTSMHqFJQvjHG2N2lKuWXPzRIIl8KjN5AU4TIWEkZ/KG2nmoNOem6p
         Llso5jNkoKYJ7pJXDbED74RsjM8qMjV4vyY2cyWt6rtEcu5EBeHsPnzqKky9NoX+8mtk
         rZqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782642704; x=1783247504; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9T7gPyArMS/KVn5vgGJ/6O04XuwG8iFCNcQCBiuYx4=;
        b=XImHuX1G6eROIok1u7J+vgm2WZ53YfuiJSht2tGm4+AkbxKeGhRPAF9d981do9Q2Dy
         i/INKaN8zsdO5sXHXMvN2NEvMlnnoIvQZP4xANcs2tpmxLaht5yUGJbqhGSVeaN/1f+f
         06GXOF7alyzr7zXPtD3NeApakaE3J+qG7G/X8sz9riF9At1unUaux6rwbsEKSV5cu0BO
         v1DJwQxDIwhDWBKYJBSILrR60J4PiOAVzdn4CmuuDsE204jL063NPRFa//5dgrCrej+m
         2l+of9Tf/HPTYgyHDitVtyK/kirZjeExYx+upJl458HpD4R5axMJ1OKE8Ba1VT7xuPfr
         Q/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782642704; x=1783247504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9T7gPyArMS/KVn5vgGJ/6O04XuwG8iFCNcQCBiuYx4=;
        b=NAdY2l0qqEPiCD+xJky8P6uJjy/yMrfxA9u9WySFFC3IPTeXdmWL2lTiJkjDBNjDJI
         AFO1aTYCmRchDO5OcfPorRsYtx4s5OtMYYEW+WOa3ZdDmF8Fm4y/yk0RKlfxRiTnV8JB
         AjyRgqNz4hxU8xux3rxf89PAav21i9J+8A+dbT98NXUbJAoYHHcDeXsbluxeAy/HOX36
         vSXZtE2CA79t+xHW6AOPfABX9lIuao+EHfvx0SppiMRVoQQzFXH14IQXGGYlA/iqi09n
         qJuAU6nnUAzeTYSyZgfI6iRwZdWeW86Me9wMCfjd34YAdIlNv5xxMzY1UlnPllmR6aZ4
         yuIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0/cIaEWWlBthowutRckI0Zr3d0bUZzat9HssvXaJgSk0G9WWhMyGEo+4UtauJBS1J+OZQy+pJzNQ7IM+uRDjT03/k2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFFFgt+SLpLEUBOvRhAzUzRAQU0HErVG0jHSlEbuK2bD0vJsS2
	uexOOGgS4eqc2BJF5Jhia8tm1Q9laKWjIgx+Vf1yGlLEtn1njKAcWCdMtbIaDiAg6ZQJ1MijTTW
	59xCtDepgWmX4ztXJq0DMO/qiisYlRTk=
X-Gm-Gg: AfdE7clvfe23WW37eCR+AtHcP0VxfKUjyY9Fr/KwW0cSF24L17e/pXvRBH6LbOl/Fmq
	glxvGKHZavayaBpehkcTtfmB5lp77Hf5unwRHA5D8HAKp/Uxre8Sc4Kmc4LlX/optErwV8mGrZK
	ubS4+S1a7aLHlsLlifmFDztG2v7HQZ3qBHc7cpMS35DNASflL+9f0XRviC3LB5VEeKIwZ8u0NQt
	jaGwE7IiWsdIsyrwR3BRHQtfHryM1kRlM6BvosYTSf/YytVkg/P1fpYNBH19fT+onb95pYOxfGP
	3lBTXEb/SnSFQADX2i1fpSkyxpxawFbA/jvnMvj0E/+dDY56aSvVrOcWegsUfIQ+41nHv6gW7dJ
	pLh2G1KGNYKWu
X-Received: by 2002:a05:7300:d517:b0:30b:6192:5b9 with SMTP id
 5a478bee46e88-30c84def54emr5929447eec.8.1782642703979; Sun, 28 Jun 2026
 03:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626203122.713317-1-nico.antinori.7@gmail.com> <DJJOZNFW51LZ.IKTXQ8ZIVO55@nvidia.com>
In-Reply-To: <DJJOZNFW51LZ.IKTXQ8ZIVO55@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:31:31 +0200
X-Gm-Features: AVVi8Cfa2gu-uh51v2W-N-eZdtsPgwAWc2f3g7iiuHZxmyLE0nd_b1sk7GagU0s
Message-ID: <CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com>
Subject: Re: [PATCH] rust: iommu: replace core::mem::zeroed with pin_init::zeroed
To: Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@kernel.org>
Cc: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
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

On Sat, Jun 27, 2026 at 10:35=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Note that you can also use `..Zeroable::zeroed()` here since we are not
> in const context. Not sure which one we prefer in this case, but I'd
> personally err on the side of not referring to `pin_init` unless we are
> dealing with a pinned object or need to because of a const requirement.

That sounds reasonable -- Benno/Gary, any comments?

By the way, speaking of that: the docs of `zeroed()` (both of them)
could mention the existence of the other (and the `const fn`
difference).

I guess this will eventually go through IOMMU, but I can also take it
via `rust-next` if needed.

Thanks!

Cheers,
Miguel
