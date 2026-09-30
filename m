Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1EB46D093
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Sep 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779303; cv=pass; b=Z4wd8w16ysrpLWkmFIZNMH8nlTEe4AfGOYw0lDV4g944tXY87ufK61GB9Z5NekDdFUMZbquzm9lO6NsJvhPtt6XOuPhF1DfUzbZdKF0IvNWB1/04tk+puPFIAZPGjpFogxix6bycmi/4hfzZmek3SZib96H7NuD+WHvHAVLm+t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779303; c=relaxed/simple;
	bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BY2Qo+8N/Ykdw9q0dF+HlIM91EfF42w2HjW2SZeQWIIcaUaavtd1m4Clh9OKqYUmd4uj4bGpygUVkMWHzWg0RZhJIciziULYdPhgBuS9WRoAiUOwupZeioo7lI0IjpdBAOKuRET2pFw05N3/ukKkKS0eDUp1FqMBgXDYi5dh/9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpJyr2bB; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpJyr2bB"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso410916eec.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Sep 2026 07:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790779283; cv=none;
        d=google.com; s=arc-20260327;
        b=KPF7OFfST2juw16b3bWjnQP066XXhCgCo5KzUyxLtUbrrPfiTdriWn1fU2RP61WMsH
         4BpnoOpzpWcGFlgOX/q6eDGHUdyQpdth8UYEExTqJ+MXjfgNI0z0zTkzrRdInvddJ1Uw
         h6wEPHwexJLAtM/20nxrpZQRhw9fLYwIcCxEonD7f8ajMurW3V62TE+GJukvB3aqevQ7
         NedVnBRtfcUR8QNG6+0X0XuAtZafW6W+KbS/7/PYcdgOMbwTcdSRMV/XTDciweK1eUTq
         7ho0DAc5/k4CXwl8ks+9Pz/0bt4605onuo3CCvMPVNJTARdB4wIW3nMLshboaX0Swft1
         zbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        fh=dBAOep6EAPDsFijv9uZWpxevBSrgG40GFqQuli8ijHk=;
        b=ZxKkrBThquuzSuFHlSymHUn+bkIa/M5w30rrs5OIAK488aX+HZP9XaKWPj2SOE1GKL
         xiaEYE7Jx6jvqq1STyrluuOo9/AJK3aFEQWa3YJMGQZt06xcxuRwlWcW7xgAUijHFtvD
         l2ZopYzvmnN1WKy0Ys9pecQaZfLFChr0n65zgHS5HStmebC2Qqi8sMHc3ScZVhSMlGMo
         OSne4SFKX0aMBLU1M3rHn3R3yD7X2Zgr3o5jKVrhaTzKyij47m0hkZr3khvSSAROz6fX
         uHs99Dw4QVY3AfnSdWYNUsVFnPL8gLAo9aLat6gaB/uLBT56KeqLUiVsW4ebNABQu8SF
         8B3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779283; x=1791384083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        b=lpJyr2bBziFqqfaL0yvlVCEva+gRRIz954aUx6IkCJSxLOV6ALxKEILU8LEopg2d4F
         cuKwPayTzrP0hayGT9IX0ALQjimEkOSMtJrYfAFtweyOzc22SXI25igfN4AbghoGvHEA
         dshyWhQxY1cSZ/FuT3w8HqFmk46Xg+tNsIK0dZ9pPdiXA6hb5YqNisxw9CYHdNI74E8F
         yeStxEbdJ7qjQOJxcDTFGv8dy3vU2J9iOpl97OrWyx6pUObBoZey1fhwwV8v8IsnMxWy
         APJbmjfy0NA9m6FhNmef7gBPzFQMkjFs77GDb8XDjnfZ+bWwNdL+Ipng8b3hIpgjxIwo
         e/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779283; x=1791384083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        b=1lK5ZVJOfnE7YP1gpqjGyy/Ar61rJtArbi13XJVwXG6NjzZc4psJEjx35mvwmY1e3d
         8fa7FQyuWF8s2ueisxhyPzpII4uVSuAOb/Sa5QOhvQbTHpznBcFU4/5WTYZF0iCguiqW
         SoLLQnDSBpyhZpjh6dk6ArzLouWl4MrOR3vmWG6qwgECs3/gKt1FsbhuUUVCXH4dgbde
         VXMWkvZ/N6QZ/pyydFjx2iQHjqQztoRigWwG89KM6hDb69YAvHXszOgsY4DoxM7dLU2q
         a+lZl/p2TYzrNz8mCO/PSk0mgXzim6zrWemZ26GuuUJzNc4ZdXP/voTSBYDunsNyK/U0
         +JOg==
X-Forwarded-Encrypted: i=1; AKwUvBzm7ekMiCIjGXP1jXPzRzauCV2zF2UcAt96kInDGBVsA1yfmkmN7TsmKXjHJuVXWr54xaggNh18j9Pqdakt4/sU1OcjLg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLwDt9QWy6o8wISio1xrnO2fNoEcBdn9sOTuwuVt+sgOycBuUnY
	Z/EcNjJDdn+l+IqWc3yQlfI6CRglk+oj4Oip0zMolxY1A1XOaP5H+M8DvemasmaFDLJnWJlwhJ1
	ZAdddAgcurXJyfZqM0EROynC0guMcvAU=
X-Gm-Gg: AYBFou29/2+tiHW56oCCwTtfGLd7tZKKiB/GmiS0ZBnTmClA+3ZGm6FcvccN44x/bB4
	rW915P5brHSfaLlmLY25WSgM2MHo6NWGBhJul26kTsvn69KpRnH9JpfhlWwVaP5czrFymjhXliq
	635DxqvEYJMOntWGvJ/l2TzoBpBWajcE+KQaVn5+0e38T6EWXEY2zGAjfx4f1k4hvswnwqbALOi
	I9ND/EKrsGyZBPyBjkDjUctfiGngDoJPNRIyjTtTNpanHY8jyr6VFciQKB8NCm2ztSm3Ht35imX
	K9q0+RahGeK/TGDcTzf7Qgmz6wWPADQNMEA40dlfMbBEq5vO2oQGYIw022sf4IFc3wGk5qaYKfY
	CWKOmtDlt/AVSr0h1O0lZ49OT9uJxooHK6lWnyxVyw+RdLgROHs9au+v1mxheK4wL2EkGnQusMe
	GVJ46QL1tcVnhkq6NOvPaCp0AWovx4decfEzVK5+m9km7fMykpX2EkZ1gKpthsfA==
X-Received: by 2002:a05:693c:41d0:10b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34cdbcd280emr3610200eec.2.1790779282558; Wed, 30 Sep 2026
 07:41:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
In-Reply-To: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 16:41:08 +0200
X-Gm-Features: AclHuK_ynM6whJXw6qHZ7KW0enKmjR2gXUpLMMaayW1XxJgbGhEQ4tEW6NDWhxM
Message-ID: <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:23=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].

I am glad it worked with `b4`! Hopefully no more Gmail issues :)

(Nit: in cases like this, I would suggest increasing tagging with
RESEND or maybe increasing the version to avoid the same subject line
in Lore and other clients.)

Cheers,
Miguel
