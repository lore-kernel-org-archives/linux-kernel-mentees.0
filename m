Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749F477986
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Sep 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254621; cv=pass; b=PLvczZQ5LJaKINEFjz8SyILH63ocf9ucsFRTzrT8PjZk5vcP9Q6mkhYDI5GfqlqYZiVsxjGmiQLE+hwBE8Ebc8gBDDxQXXR6vC9CJ1jsDjnZduqmQ7F7KTZM5tPMeVJ9SWvZ54Go7dw1s8RMXCjhh6BIu9Zu6gcQUf22qFam+4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254621; c=relaxed/simple;
	bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJdmqqueI02B4f0J6rXOOTEjqlC2eVttUKCSEYBC+UKMhGeOWCSepvcz2r/ItZVIVrqhaOaEijdpqcneSojS+MBcOCCh6OzHC+/z0bzo5p9aosG5MzQsy3Gm/MshIyDerrKMN8PQNCNZyHXUlNJxMByMfRRc+OUMDRMztRWEXxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3BtjEMW; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3BtjEMW"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbedf082ba2so900685a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Sep 2026 02:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788254618; cv=none;
        d=google.com; s=arc-20260327;
        b=pnOuZb5HJyzZC3Ax3ab/1NY97mGpQ9lWDx/QBtQriEbuInsJvClIntDr1GlGpoOeMy
         C7wRs8kZUF+LNbru3Jd2+bGUdCytTwMsxHuVjzYUSlL7UYxf26Y1HbrC1XwD5eOybZ+Z
         QlAQdT5NDhv5iVEgsyU+Y1GzxMQgP1nE4B2CkqhlpmxtfKXQP/oLwEzzk8qJTAfuYxaB
         8haPHvdIYkRoXoe25tow/LdJpvzl/DQvzA7DGtmNTLyTikt8+gzUVsStcjvJsZR5HwuZ
         RNDO/7Tiw1r5VUAansFlK/4t66Th05NEA+aZ/RSuSDX9WgF+d2togmDuUep/RU6IO2nf
         6YhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        fh=OV5otil/QRhFJnsC332C88UE4SeCeuNSveLdrcW0RTg=;
        b=b+SUbDJWaaRG1+fQj2UIaEzolX2MIBge/pWgwgTW2pkvntWJYWGCaR8/BlpLQjfxsA
         7rIrr/5C5LJwSAje6k05lK5NbN1E9KQTGwzlst+7zP0qQG7mj9wxwp7F9q75BbVta8LO
         eIFfAI02qBJuWerNxL6ynQV9A07f9hEOeRrWD6BRng6YX3OYiZmyayNo8bxHV19OXB/S
         Mvq+WcJoy+eLwKU+GmvIJBv/gfDOJUTGlNK2zk6PpK+b2N/COZfLvsgEPJauelSIfr6X
         h4r6LOSf5X6efn1aUY9p/qbkmrHVmu9m8+WqCZ6HrNHg+f488h+9vOAKmnLkUFVxF+W4
         9Azw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254618; x=1788859418; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        b=L3BtjEMWLF5c7oLEaz0iJYA+hNkL39QxF3IyRcB5bkFaiHuRAQl4Sq97ji2cm9hgl4
         YdNJ0UYtTJK8fdVgMbEzMwO7/CyFkNnMKL+BYonPkXxMlWA3rZoRYygy4Uue7DnL3Dj3
         8eG1/B/K3NY863PKzE4cnlqjv84mKEFt0nEF2w31rk+PP7QGDVNXeUUevKofA6K3AAXo
         CZ2pUAoNTgozTvZpU6bNW0G5O/nCepaHjVQ2BbNNp6cHdSLkOdoa+x2DGgZJVqzsUMCg
         DXwMKC7231CBcaV4dNCwR1t3r5uDgmwGacFyRLrQrHEDyly6ZygyNPPW+Nkg22P64ekK
         GMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254618; x=1788859418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        b=tVXzeOVExML6WHIKv+C6zJMbG6owyoZPWFNXIR2t5IWS5RynznUOG6RsEfje/KQ5DV
         1RIUn/6ttPPZJdc9lImjsOXzNIUfvR9zT8Znmn0V5xpRWKBWiDU0DTecwKPc4/enTvnJ
         20p8GCC4/Mxq07Jw9hFqEdL/WHvFcM98wSIgQmjW2JLN/wN2HStGICXeAsTKDhqwSsdU
         1qV7tQnUmeLMR5uQiLgKDX1qZCz6bCTPidWwUy2H2yuPHejL5uJuH9uMKln3FpyrOsY6
         zKMw6FPPBnx8rwMycwvRjz3/PQupkAZf04hNCJp2JjWptMowH/2dR0mA3+bnpHH7bP8a
         owkg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/AN8EpHVSZDP9F3GQ+VN6cqBNRZ/1Qhlk2/2gs6vhXR4qpCETOMxMEQOuqEqM2dANsuZ8AUq8ZcJfQEqUlhu2BFfazA==@lists.linux.dev
X-Gm-Message-State: AFuF++mY5H8XXIN5yVxBcqNEFS/yDIA4LjDuo143dB0sYhKrRhnII5eb
	ARhbne/mro/5EfRUSthEgOzLN+nXC1N6OKYEQ7ht0eQGeQ8FSxKfNmVa6TJMpRFf+E1TvlbCKyh
	ryp3vKtvwjCtKE4C5Fh1n3e0iSY3XC/A=
X-Gm-Gg: AR+sD12K7AoyLVcWWd2TbS6NnIfnBrRDXfYCe72w0KR3i7bsKCvaO4tORmPdR4JtlCa
	Q47f4KCaQorqv67dCnrP0/j+SLpnxursMZvM1gDEO1k1dyFddPZmAgAgJZKpIQ0BTRgz3e4g0qg
	hwsOIVVyOBpXocGF0uT542LuqGcpUbvjU2SGWMdok+cW2WcFPIjy42HgjCLZBTBZBg/V6/grAZ7
	3RPfM5tGloHxkdCDwl5Wu6OgbcC6RWIEylschSGkWRIcc6uZeUzKx6PqJfzpD/vX+A+dFblbWvv
	JuCUmxUv1wKjYMfDQZ8d1XPHjY2CsHosidIbfEtmNzp3yKwztLbFkn8OL33lbX9GhklhzVOuKNd
	J5VHucA/X5vx7t7mZeSEkwQy+uZxKpGaE3OC4s3dqKyT7ELPaxtbrtfW6MfYH
X-Received: by 2002:a17:902:ec82:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d74def63efmr287603465ad.2.1788254618249; Tue, 01 Sep 2026
 02:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831222857.1402608-1-nico.antinori.7@gmail.com> <apaDisOTtL5r5a3I@google.com>
In-Reply-To: <apaDisOTtL5r5a3I@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 11:23:25 +0200
X-Gm-Features: AcwNN1Wu5eB_orv1F9sI6JCQIgW-VSYn5Wsv7lEuNcyDT35EUe2cbQX4qrZM2lA
Message-ID: <CANiq72kZ7+fhEY3f-j-OkoYQexeBYpnNsrkDtFuovkPgBpn9zA@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: simplify Result<()> uses
To: Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Brigham Campbell <me@brighamcampbell.com>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 9:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> I don't really think this matters, but shrug.

It is the style we have used since 2021, so it is for consistency, and
it preemptively cleans the `useless_default_generic_parameters` lint
Benno requested:

Link: https://github.com/rust-lang/rust-clippy/issues/14848
Link: https://github.com/rust-lang/rust-clippy/pull/16123

Most of the cases are in Binder at the moment, so this one cleans a
good % of them.

I hope that clarifies.

Cheers,
Miguel
