Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0E364029
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Sep 2026 07:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248974; cv=none; b=kwROfGJWtTWPmJiD4nZ9r6CnlLBZqyYXHcOv287aZODim26fpA4BJAoFLLSsslTWta4LhaZV8muiPy71pOmih9XzXLjmloO+uRRVCHaeav5/eLQbEMnD6sSkWgGD8jU+Jfqdbjh58P/pNhiaGq1oD39to8q5Vy7Raj03FVQ2dPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248974; c=relaxed/simple;
	bh=FTVtOS2eU9uFM6OaYkTYMDLx5uX4yn/45eASeMrP48s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cQc6qucXoa1h0GjVbCTTthQ+EXcjMV75nrdw8B1pEg1DyRJpEIAxMnVsrcfubOQHU7qDSCulBnI2/544e/NKTM/b8xPSMkbE6xjy97a9PSIMiFAaN3G650PgkwAYy0JWbjcocePQGy9gNK/VLjOwEQsQJHRbdsJn2TWhbjt6zsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ItGtiZzQ; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ItGtiZzQ"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4997b060af8so4347635e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Sep 2026 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788248971; x=1788853771; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FTVtOS2eU9uFM6OaYkTYMDLx5uX4yn/45eASeMrP48s=;
        b=ItGtiZzQ0Tfct3yX4s/fre+DF39UoZ9XCvtr72aMen7eVIHQGR1hJVfVbvWSP6RGrB
         7tyEP8uP4H9Rc3nLIyDzoUow+gFb5FwdQ+8F70REBcuT3mOdW0rI6AF2BkwzehepW5Bf
         R9VcgbDLM1UeN6SB+JE14Ibb/6VYmKfnqYt2NQfshY8ll/P9lQzJrIuZGzUU3/Z9NCLM
         KAPRZD4Uev3Ah9h1wbHhGDPIPlS7pbooFKhYVuWPw4qJIXaad4Upcft6T91WCd3aAeD9
         ALL25aORIT/2bgRJ5wKM4zVANKp45rTmSZP3a5Z7vilPyxkyV9VKP2mbxSu6PpbpQ8br
         PunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248971; x=1788853771;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTVtOS2eU9uFM6OaYkTYMDLx5uX4yn/45eASeMrP48s=;
        b=K2o4vITqvbWcBdnmdXrCYbZmhrFnUyAzD80U1sFeyn7OrdQE41uDq7VG4MgIXcA2nE
         EDhnIyJL2hFKgKSLwEGLxHuVebpr7pJl4aHa+69Wt81qFR5P5yKcar4ap7ae2VK65fhc
         ACMPPQmaKQ3adt2XiL/LmX/SuiWqBQdjl3C8bEg011Ec56F6MwcmO/5tCkkJuuE84oEh
         tJP3XFUGmRjQkj+j2PgPmzRfazue6bECBDo4KpQla0FoK46f2DwnWPIfEoC7DpZ8wbZg
         VyLI4+apZsSynn7KAroNKF6afJtYFSMIoHHxN6OQ7IADocDNKFOuElSMRjW2yz67U3H3
         WYig==
X-Forwarded-Encrypted: i=1; AHgh+RrjK4gE5byLplLhTQD+hwCB+AvZg332DeqGi5oygvF72dFwT+q/pbB4dQdPTTgD3PC7PoBnQv9blzJ1+wxFL+FshjBdeA==@lists.linux.dev
X-Gm-Message-State: AFuF++m2cuxx2is/T/gcqZxsJETR/TJ5ZKFeSwFR0sJzBHbi5vPwsJ19
	6Jw0TGdXzNo1Y47nACGNYtsdiw3IzBkpUlmFIpzov0kAcF38V40IbZj3hE3wuFjy3QXWORpLo5w
	54VhlGGf5KmFZTje0tw==
X-Received: from wmdp18.prod.google.com ([2002:a05:600c:5d2:b0:49b:e3d:cab5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr453426275e9.14.1788248971200;
 Tue, 01 Sep 2026 00:49:31 -0700 (PDT)
Date: Tue, 1 Sep 2026 07:49:30 +0000
In-Reply-To: <20260831222857.1402608-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260831222857.1402608-1-nico.antinori.7@gmail.com>
Message-ID: <apaDisOTtL5r5a3I@google.com>
Subject: Re: [PATCH] rust_binder: simplify Result<()> uses
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Brigham Campbell <me@brighamcampbell.com>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 07:27:10PM -0300, Nicol=C3=A1s Antinori wrote:
> `kernel::error::Result<T =3D (), E =3D Error>` is a type alias for
> `core::result::Result<T, E>` with `()` as the default type argument
> for T. Explicitly specifying `Result<()>` is redundant.
>=20
> This change makes all usages of `Result` consistent across the driver.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1128
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

I don't really think this matters, but shrug.

Acked-by: Alice Ryhl <aliceryhl@google.com>
