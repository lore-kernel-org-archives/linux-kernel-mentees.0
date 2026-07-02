Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145523A5E90
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Jul 2026 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990541; cv=none; b=ZEnSO4nWrThhBQQsVqjxZ8mohxlLo7o5SRh7wnzCpbDiOzaj4q9lyYYJ/548lYPJtDgRlltMmy7cZxeN4RlStp+qAaYzkzVaUkRuBtDdlKFYAAdFRHV2m4fkf/pQDSwTUJLLhzE9/3/mJcJ9mporgX2r+LvZyT0NlqEpJusdQoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990541; c=relaxed/simple;
	bh=jVCZGfbP7HC+WzTxesl+YUJReLdqruEqQo/d3g5mQHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tM7+OZhrzISaFgWFixyCFKPeWTpSmQSb1Owhi1QQJztBqBarxx/T61P1u4kV02TSPESW5BtPe7lpWi9hK51zKgtzQJvt+IxerPVbImn2G1h0N+bBKdi6pSTl3uzqCStnGNBw2WW8NubM+ala34YT9NTcuN81rymG0Z4P1WaKNqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FD0wExz/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FD0wExz/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-492488f8583so25430665e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Jul 2026 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782990538; x=1783595338; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVCZGfbP7HC+WzTxesl+YUJReLdqruEqQo/d3g5mQHQ=;
        b=FD0wExz/IucIe8f6TX8R27xzNI18CaOSdtpr5eN3up0efcIM64BK9/gEA636Bqw1HP
         s+GCzz0r+ApEhGdoHnOGChmZeFdGue+u5Cv2zhbWBW33potjc6atDju88JnXhUDQp0uM
         aJ1gMHa3oSzPthfI9b5fnDb+EHS0GWU5eAU/iLt4Ql6yEEnRg5/NfVbQ0mz86Zt92uSw
         tE1QzncfiPeDcgZrJ2vkZFJa3qMfUqqevneNr03VsuD7KYdc7bUYCiA/d1Uqxkl3+AWZ
         6/hhNiNwJYav58U52GIbWQy47MLCr3Z+zlhRmGEgFcMFC/5Eys3hwn0oFnubSWk0mmyo
         9H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782990538; x=1783595338;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jVCZGfbP7HC+WzTxesl+YUJReLdqruEqQo/d3g5mQHQ=;
        b=gRR6uewt/FLOHSRmKgTmfpfdw/n/n8Ddh1GqJ4dYqXEkVZ3A2WtDaNdF67OYDLHcmQ
         Qr3n7TOZ8qbcNIwf/q0gXijOntoQ3RgxEXVJ2VmR3AxWkoO/pVwvknmJtEs0T+OzHD6a
         4NUyi+X/cAVlwkN4cIR9TPAG6czTcg8TpYaK56ktfzELp+W0k7dB6pk0KYjjg1Gow/cb
         c5xqti4z98njxrJ1wIrFtLhKLo+/WwWxnUJjdNh+EQawxYCnJPsiVyaEhOMHvQ5nZu1o
         qg9m5z4CsAT4B7AFCNEYo8Dvv1V/h39D7hlSFH28PtoCnAvLjZ0fU2AxHwN5IYzDiD7k
         c/Iw==
X-Forwarded-Encrypted: i=1; AFNElJ8Jo5tmoqFlbKHFhhezA1rr52qA4pvlW0jiohsoo1SNSPfmIBJDK6WQTknH+N91sCkltSRPat7NcDFMZfHHiH9yNS893g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDN9Q0GUssZIxF+CKHt+5PzcIoeNTYAd4lJjwLOj+cC5mP8ISd
	oFEE5qsvkdBE92tB4pUxtRQouDouMABHD4V9y+hpJdm2Wfz6NVJBR9h5ixKvbrM/fcksfWZ7dRO
	88qa5Wfo1DzIEItx52A==
X-Received: from wmer11.prod.google.com ([2002:a05:600c:434b:b0:493:aecc:774a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34d4:b0:493:bd2f:c5fc with SMTP id 5b1f17b1804b1-493c2b3d569mr78696805e9.15.1782990538252;
 Thu, 02 Jul 2026 04:08:58 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:08:56 +0000
In-Reply-To: <20260626214404.852685-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
Message-ID: <akZGyP9dGcQDcQUp@google.com>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations initialization
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 06:44:02PM -0300, Nicol=C3=A1s Antinori wrote:
> All types in `bindings` implement `Zeroable` if they can. This enables
> using `pin_init::zeroed()` for `file_operations` initialization instead
> of relying on `unsafe { core::mem::MaybeUninit::zeroed().assume_init() }`=
.
>=20
> This change improves readability and removes an unnecessary unsafe
> block.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
