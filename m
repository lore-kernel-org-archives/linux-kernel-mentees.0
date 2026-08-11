Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801334499A1
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786459419; cv=none; b=iOajdU9Pz/8pRhf71RLw+4cZz3zM+1QaqXohMMJdcdIoeaqRtUhQkfX/yLkk0wUiuaL2WdhJ5Aa5sQXVp3atNdRjn+rMrJlddbKxd84yaf8oZ58HJGrQiIWjB7uqEdMDESKj5r3mAYfMBOVTVgEg9/hoUge78MvYs9mnuB8DYxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786459419; c=relaxed/simple;
	bh=1P9l62yx7Nzv3bIICI1uduDZAxBz+2R2qseDQnTY1Dc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IQu6XKW3df9g/7pzYO9TTZaIuriRhbV0E3DOniCl5O4e1Kb0MM+xXRwFT45xGj4lttSu/e1be2xEqf62Cfpy7OzpWJX4jGOdxnA594pVweshxZj3T9obzpm+rGZdNMptcI9xorxtiA0dLG3+D1uDFBtWJuTJZ9DNecPzCsvImT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m529zdLb; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m529zdLb"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81eaf3709b4so41954857b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786459416; x=1787064216; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lhr48ORyh4YoiC1XBSoZDdeizVPdbIlhjfg7vaMIrKA=;
        b=m529zdLbss2do9WHgYVKmRx37nSxM8SC9SVrk1A3E4f46jesZcEIIgnp/bRGMQ1nAq
         xoVTzg9TMG3Skn40XaqX425SD/lO40iCQhlhCnNv84A1E3VLk4Q2YiVOgqksLNDqsjR/
         ofyeXKrzJhRn4WgPEKlLEDJgyS0pL1XK7jgs/+4uuRcc0rq53DGeIn7e/N3OvwZ0wYe8
         DlBEl7/35YxJ0tsTeYCarquOQKaEOQkSfUMLpvFURSPCd+o4fsHSRgWVl/U1rN1IY1KV
         GnKPC3aV7wqPIb6bzu+oypJbr9AIjv0AjNWDx3fPBbn4G7KYMkcvbj3L9eDxIyW815w4
         KYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786459416; x=1787064216;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhr48ORyh4YoiC1XBSoZDdeizVPdbIlhjfg7vaMIrKA=;
        b=p2FGGGVF5NkJGMWhOFBgB+Vqs38yifIhev7i2sA9+8mPtx6Ch0dhCSMoHakjwYg/+k
         /SwXUahQ/zTSJf9H12S7Wcc0Q/UrQLBPqQv0TFlbvwxI9vt6v7C/vIvCYrh17elfd6ya
         Noudo5z7UXdAPiVWzXJDiWzN81cgx9+RSq1d+PagbUZ1lPXwVz6NOXgFEQZHplhgFBtu
         /2Hxf+az5u4nJ8tdRq6+6NDwgvYeumXEX2DjjB2KBKk+Y8m0Me0WYffBNgAWAAVwKvcG
         vef7UUaCZKojnEnKprDG+VNO0OySmQKO1Ew67b8fy6SbvySOAL0bTZjI/EyvJ1zBcE/A
         lXRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6W0zEmfoYHOFeUdLC5KX3cni3MPnZjEbFert5w57MgYh+JeFHA0b6XSDXvb9QPViGO5arCdSVFMNfJ21DjfHeXC9X+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZiv73i+qnd5O/phb4GyNcFn7eUe9uXV2Eeg+4xmSrbQWxzKvE
	+Ul2bYDNVRkr6AYcT2oH6TwzjxCDiIbUHlVI157PLiC2h2HgFSzIAto=
X-Gm-Gg: AR+sD10cWfhKUK5s917vEjBDVVwh9GQhxtyCUdBh/+e+3tKpvHhRQbs+RjnGlNIkWS9
	dg89lkEtGvKU5k1C8rLICHdh+y/op74OLSY9LHRbmSxRnu07vC2L7+kEXh8SAXzglMCz+mIcJAA
	/yjvFKNbp0VuHpqB+aXLrwVJaDiHXfZjZuYwnN9zkj5SjVfjhPe8zCKlOGpzD+MIDvbTyxaCVYU
	qelUAHgLR8AAZ2hrTC8REmLJvKXOdRCaWVQGlBtCiq14p4WK59QD2LpMsvtMmY1CxgjrEd196IG
	xQ6rRJk7++PKct5oSc3JFt9gDRr0e+jw1IpJPEX7msI/5Kn6u9OfhIsD7NyumQJwMv3F1+Og2AV
	PAknS0upt0Tt8gSG66BEZ/hnagSrgqlewdO+v6KYKtlvFLJgdor/zsOIYwdZkLykM/L+WpqqgkC
	K3/CnUqFZjvYftiCFLMQskROpkPK6Gd+nAkIFsUCEWuIgaaJyvDzcibOnaF7GVqYPGl69jUHqQp
	a8NFctki0nooV/nruE4Y4Ne
X-Received: by 2002:a05:690c:9e:b0:7bd:cf35:e33b with SMTP id 00721157ae682-82f2cd0550cmr25224097b3.17.1786459416049;
        Tue, 11 Aug 2026 07:43:36 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82eb5fb7a22sm11871067b3.0.2026.08.11.07.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 07:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 11:43:29 -0300
Message-Id: <DKM70AZE2094.3397PWQQ3TC3@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel-mentees@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Sashiko"
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Igor Korotin" <igor.korotin@linux.dev>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.20.0
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
 <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>
 <DJCA8F2F93US.1KMA54SKQ364K@gmail.com>
 <DJRJCCGCXYOL.2O4HP9N37SPAK@gmail.com>
 <178628144572.5226.7072490581990266256@linux.dev>
In-Reply-To: <178628144572.5226.7072490581990266256@linux.dev>

On Sun Aug 9, 2026 at 10:17 AM -03, Igor Korotin wrote:
> Hello Nicol=C3=A1s
>
> Sorry for the delay.
>
> Yes, worth fixing regardless of real users -- inc_ref taking a lock it
> doesn't need is a real bug, not speculative work.
>
> Instead of adding a separate Rust-only wrapper, please consider splitting
> i2c_get_adapter itself: pull the increment into a helper, export it, and
> call it directly from inc_ref -- no lock, no lookup:
>
> +bool __i2c_adapter_get(struct i2c_adapter *adapter)
> +{
> +	if (try_module_get(adapter->owner)) {
> +		get_device(&adapter->dev);
> +		return true;
> +	}
> +	return false;
> +}
> +EXPORT_SYMBOL(__i2c_adapter_get);
> +
>  struct i2c_adapter *i2c_get_adapter(int nr)
>  {
>  	struct i2c_adapter *adapter;
>
>  	mutex_lock(&core_lock);
>  	adapter =3D idr_find(&i2c_adapter_idr, nr);
> -	if (!adapter)
> -		goto exit;
> -
> -	if (try_module_get(adapter->owner))
> -		get_device(&adapter->dev);
> -	else
> +	if (adapter && !__i2c_adapter_get(adapter))
>  		adapter =3D NULL;
> -
> - exit:
>  	mutex_unlock(&core_lock);
>  	return adapter;
>  }
>  EXPORT_SYMBOL(i2c_get_adapter);

Excellent! Thank you for this suggestion and the explanation!

>
> Heads up for v2: Trevor Chan has a patch changing AlwaysRefCounted::inc_r=
ef
> to an associated function (fn inc_ref(obj: &Self)). Not merged yet --
> rebase onto it if it lands first.

I think it is better to wait until Trevor Chan's patch gets merged since
it is in v7 [1] and already has been reviewed by some mantainers. If I send=
=20
this fix and gets merged first he will probably have conflicts and have
to send a v8.

I'll keep an eye on the progress of that patch and once it is merged I
am going to send this fix.

Thank you,
Nicol=C3=A1s

[1] https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trev=
rosa.dev/T/#u
