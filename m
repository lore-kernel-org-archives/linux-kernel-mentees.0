Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638233C198
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641818; cv=pass; b=gm5t67+O5yqgnW1Qg+OcCbnekcxR1YJMoZ3qLZFSTe7CKu8gQrk+haqOJoo8zd0jk3sYSJk8cH97CvsoFV0Whp6LGk7RvoDUFpzCqLZGR4HkqkAM3OMiZGDT1Xh9XLIJxXG+UGqzDpk9ReKixO170DxCPrnZi2A21fPJWbGnaRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641818; c=relaxed/simple;
	bh=8tMNKb/8lxbTk7uHXMMWA43U7ZV+7otKMLFxtDUVTSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OET7N0ytE4c4BZiB1jyiXpviDzjHPBUt0TGiBFArzLJr/Vi2HAoHzn2C7DTR1uH8WP26UxQcfolfRAINUyK8JC4xKAmCz72pQBtrKYkFLl26eBXdkK9OYfJ0AsFUA29GdYJnt9kG1hSvJz8h3mTetM4aSeX0LPpP7lQX1tIcbPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efhm6zN8; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efhm6zN8"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-139c71e8d78so69104c88.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 03:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782641817; cv=none;
        d=google.com; s=arc-20260327;
        b=ILRBEPruL+mzplztGvTQ221ktcqB8qwRwTJodQPU0Y/yr/mQKcRlTcim7i7AhbDXsh
         1mP6KYR2SgDliXFMKVNAd/AvXrmJin6ivl6y7E/YWUTnS5BCp9+i3viftdYcV7Tqbd6k
         05jKSqSwGzehN1amo2kJ755T6/BcFgtc7mwp8ILgktM5uj57lyV8yv4bna4pW6bmQ5Kp
         JLGG7LwqrmT1t1ocKBXYniNqZEU0Phu6t3ffNraSudloq9jhEAJgb666/TjbqYzAGYFT
         xiVtzr+86Vay//SyUIrlevuHMEi2X3ez+hmeVEehd7PsSfUU8NN7S8vNcO+iKF0tYKoG
         2OCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YXAst7xrYRCj66Cp/0A9vR2Egoo+fSdu0Iiejp3JKeE=;
        fh=iP7lllrvEt9PeKTG7s+MC+ByvJJ8q/7mS+2/k8TI9dw=;
        b=TXVknOV6/De32l3KP5OAX3U2Jdvr0X3w/9iND5sXPK1LTxidQz9JtyIn/zzUzgIy94
         rM0msnHJgPorrZzmsjHhTPgf6XU0nM2cpJ8h7gwbld/7piY7KBAYbbFmKa4k8H5Pf/2L
         vTRiZgMyYWCOqVjCDcY/WX40EXUWslOxCMctKLJM54uWlcPxHdNxUxDwfXksMU0FNRf1
         uryxrb8t8lnA/P/OrNddZMZhWYi7p179fMk8Bl8WnWuyHC7rS0pTzPOIQf9/vc7ki0GG
         SuonxrCzShorL0x7VH5upBJSvYTyR2577CuUAUx5E+nvwgGZ96ZUcI5KunSUNgA/Axxs
         xqOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782641817; x=1783246617; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXAst7xrYRCj66Cp/0A9vR2Egoo+fSdu0Iiejp3JKeE=;
        b=efhm6zN8OZPujCWxldZdgmF2iYpOEG2c/65R3UNsgo7AvFw/BhKvhwyNfxFT2nKDkx
         9qoPMqt2KVpAhOKlJX+HDPnOfJzOex7LcbUEk+DohcHK1mjCVliIKXSi8fKKlAlHowO7
         7JhZiMaNGcdCusyE/AYYobt9bm602umlKj0ueOBCtm6SNKu/edokadgBvMfMA9G317+O
         e2nuiC+bTzg5NSe2Bnz8khMBMExtjK+l3XLqY4Cpp97LURQjhtyHUEo3QSbgewneL/NR
         ROykFYe81tGPjLX3gW8+zN8ttjiv9wEpR44a8Oe+3KL7UeQ1dquCystmS9Otmovg3Q2Z
         Ww3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782641817; x=1783246617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXAst7xrYRCj66Cp/0A9vR2Egoo+fSdu0Iiejp3JKeE=;
        b=Pi1S0RfMo0KlotzYObmJOMNh6m/lWkcpk2+rWwrSIr0baDWuGYVgwVcZ95w473lJx1
         sUs8X/MsAZtFx6brAdYDp6YOneQ1OCV3PCYiZNS59+YrOGy82z6Ql+7KkU6JpVdcHSaJ
         s4+gpjWf+lFe46IYV6XWTV/Kt9pW4K8VSlI8VzqsgkOQ1cei1vv61Sd7tunUvuMvwNzW
         9t0icZy+tKjPVpU/ORzyMCETwmiLceTJdb89ER1iITrbPa8gyu6N29dkyBKLp5twdq1R
         2j3u09gfKLP48YavmnqdY0XPUtmmeOsRRsTLjetJxPLqeVgwnIk+I4p8DPxsOSC178w6
         rgEA==
X-Forwarded-Encrypted: i=1; AHgh+RoANVMVRfQJq7OIHoTeiR6xGZqy3gtbSkTGoNccrazxAaiF5r+zticC818anWHs42pUO3/upDC04OoJx0Tm1Nanh/ikUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlfz80UP92/GoCIr2e8potLKcTxLaEpNMyUNfA2pTkj+Am1Xp7
	Nv3B4T2FyPWnaEw6nqDv8ze4+iEBom/f5o8ruIsxmYwir8b+V+kR6sv6sKF28kO9CeFxB6wmEMS
	FMjU2KKtDIeRYmGDGxSxEjYEdKjACHa0=
X-Gm-Gg: AfdE7cm96W0S1UxWx+Y5BvqmYYI8fxD8FVzcNj2f20dSjX/qFlas+FMDvkZ1y+WOT93
	7cPLyEWksjSVlN9ICOamwNhp8uXqD9j6pgHyFBDoFQL+5wN4OlbOdoiRYkOlKyBVbiLYTFFDpdU
	lWOFOM1ylXsfB8Y/XPobm06t/0NtmylN3W/hB/zgMXrsrcj5/dr+UbDPK0WBVe8raGtDCqhacvw
	rAS5VTWTIl3HNiiD18nM3ecf/v9SeplSkfmX6mP+GwrjcRSgpV5A8wFZQ7xEdKN48VnXyyJnG/j
	Mg55U7t5mBIJdea9K7XcSK2DDFYtRB8w8PB4wFUyhsgbYfnyxT4UQLzkcfYWnI+Rmi/l5fm/4z7
	KYjYBmYNtm4+n
X-Received: by 2002:a05:7300:8284:b0:30c:b42d:47cc with SMTP id
 5a478bee46e88-30cb42d4a26mr1645870eec.3.1782641816783; Sun, 28 Jun 2026
 03:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260626214404.852685-1-nico.antinori.7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:16:44 +0200
X-Gm-Features: AVVi8CdV3GkBNIFxfkC3ESboweEmXbUNW5qahhjyWV5NNAdXS9aAO_6owtx-IS0
Message-ID: <CANiq72k8KOmVLrHGOa9SidU=vYqGUqi5dmyW9J1auVMnqaQAeg@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations initialization
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 11:44=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> -    // SAFETY: All zeroes is safe for the `file_operations` type.
> -    let zeroed_ops =3D unsafe { core::mem::MaybeUninit::zeroed().assume_=
init() };
> +    let zeroed_ops =3D pin_init::zeroed();

I would just remove the variable and put `zeroed()` directly in the
fops initializer like we do in other cases, but it is fine of course.

I guess it will go through Binder, but if `rust-next` is preferred,
please let me know.

Thanks!

Cheers,
Miguel
