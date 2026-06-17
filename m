Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7175D2EEE74
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Jun 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681718; cv=none; b=LdrFUiTWa5W+yxzHw8iFIniBrtGuiyFtyYI6dRZpQDkk5NHeBwruviDwa6yui/QyYCKXpEqKvNRWdIwkU/uEc8fVid2s7xpGiNJe7TfR3hSodfAUNVamIx83z5Cw4AfvmwgcTtYL4DnWMv47o0vP2z5z0JYPgLFYB8x1DLdOvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681718; c=relaxed/simple;
	bh=0+urfASc2gfxIY6c/RRftPzs6EUNdqaNb5wjiCzOB5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ajvcsbqTiKlcVmuQmH8lxDVLi6qPv5MgaQMbY+5jmTtGd96jbnrNVsGtQ6yfSNK4fTPoxPR/lUsjhcnOO7xNlbSmpqr4KzIP1PKWvJB1iwNmGRZyGBR6W1cTf1zp9ki2mKVtuNbhP8tRXSxkjPWYuZfm3QLYznRb1HnqL+C5Dp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/8IAX9l; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/8IAX9l"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4619ee2bb93so1118059f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Jun 2026 00:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781681716; x=1782286516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+urfASc2gfxIY6c/RRftPzs6EUNdqaNb5wjiCzOB5w=;
        b=v/8IAX9lNt5ShaUd3XEi68ZSr4qwwuAAEGPZ/X2QNPwptKPf0MYnYSuYFw5RCIs/J+
         mTgzHJE6DyLH/IKj+aX+cBp3mwA6BuXdTbKnB1dqVOzk4xhU/smQAIxmOJi1Ib5ZaqOf
         phriFqp0aWis105WmYgFwec9m8e4IyZzXXYntqVnW/EnBTE5jdV/FgmqmI/A6BPSZfzL
         kuPCxlvF1cS2m2meH90kU2WNNhesL9QmPVIA4Z2FHehF14QEO1hOuFY2Jg0LF2OK38fY
         069qgAeS55kM+Pu6N6G6j9aY2ObJwDFwPo3tjOaHAcyrMvJebRg//eBILm2EW7G+14lT
         mXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681716; x=1782286516;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0+urfASc2gfxIY6c/RRftPzs6EUNdqaNb5wjiCzOB5w=;
        b=fbqNi6QnrTcoGprTjkXUacKJhfPYZ6EpBlvG8vHApu9ijuzQ1kZyUw4kS6gAghbTjm
         48/g2QYYazLd8gjsZZvcEKFQF+/FJ7LxH6bHkFiUatlRwYG50ssqHCOBv4iGUb6AczoJ
         vrJVHSFDC8/QfcO36NFzNBbm0Oa5wk8cpNkysFWzVYvM5RSBUnNfjeInt0UT1ebA7vAW
         9TkzR+SUa7l66JYLYr6awcv/FVX/v097ZcyZi7m42DzSvMYvTK9BiHYyFb6xaEwX6UZG
         LCt7ZTq32zG8A29eYigSg8of8EKDCzSjstob6Y6j7iPLDzrOXmdLfh4jZov5hXDFJQgl
         2gUw==
X-Forwarded-Encrypted: i=1; AFNElJ9FG78z/e8F48seErYTsiSS17Nqty93vWWxAIJea6pZ414xDLoI177o4ODMgK6aLkPwoW3NO2E14mfDEpuccQas3vq7cA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyi2F1IbZeLF9Jed6AtDeJbIUhJyaCtk8PlabTQTzGpj26JHvg
	NzyGaZgGDYPeYKCyABwClzAbKkyJiDsTLGw5FgZz4s0dglUyMYjXPaz4SfccQOuYnxz8hISEsmi
	FMOXOwHkFeQLz9OPkXA==
X-Received: from wrwo4.prod.google.com ([2002:a5d:6844:0:b0:45e:ed83:d3e7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4906:b0:45e:9420:ed16 with SMTP id ffacd0b85a97d-462370e1644mr4713138f8f.10.1781681715479;
 Wed, 17 Jun 2026 00:35:15 -0700 (PDT)
Date: Wed, 17 Jun 2026 07:35:13 +0000
In-Reply-To: <20260616223614.16444-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260616223614.16444-1-nico.antinori.7@gmail.com>
Message-ID: <ajJOMehwVZoX3o4J@google.com>
Subject: Re: [PATCH] usb: rust: mark Device and Interface methods as inline
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 07:36:06PM -0300, Nicol=C3=A1s Antinori wrote:
> When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
> following symbols are generated:
>=20
> $ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
> ...
> ffffffff823f2490 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::dec_ref
> ffffffff823f2470 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::inc_ref
> ...
>=20
> $ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
> ffffffff823f2450 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::dec_ref
> ffffffff823f2430 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::inc_ref
> ...
>=20
> However, these Rust symbols are trivial wrappers around the
> `usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
> functions. It doesn't make sense to go through a trivial wrapper
> for these functions.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
