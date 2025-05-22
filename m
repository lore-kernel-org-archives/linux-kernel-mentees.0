Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AF9288C22
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908337; cv=none; b=b3hEH+cvc6COtODcomCO+TG0ZctIuMeJXLf7cA/n5n16uR1c7TB6+XhJyux1aPAMZS7SdtIlEwELqZOuCZcN5FskO2eNFrBy/APqEYGIG0kU9m4kGuzzr4L38lYTsY94R0Gu2LtY2J3O0Loap8CvUOPB3STgB+SfzsLGBhI6wpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908337; c=relaxed/simple;
	bh=Q5rKfS08I9tmyMlVsdBeqRVKnBYaF6She4DjZREHtTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TsydPng8Mf1sVVmbRnKS3f9a3i+g3uRwhk+Q03HOJsvx8lrtK2dSvSOVqAdWr4+O7ePA3npv8S8kjiPfySSTHHmJQ7mazfPRNpcXPo8s5LkOh8uzGPn8zuq6fWs5LCpP9g1Uu9nLSu9sZ5AHE+K7JhjvLn3XHqBpunk2A0yvvI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVd0Dcsp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVd0Dcsp"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-308218fed40so633718a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747908335; x=1748513135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huYiCXvropVk/UdG9szLyVWmJqN+PwWYW44mWKZJz3w=;
        b=dVd0Dcspf6zA0Tm9JBMeWX86JONZXVERt6mkXfK2EvlgJtIf+8eW7AOmdbMMPTtysO
         CoToNeHnDMkP38yMw4YtPKPIEuCHseGgAngeVY+yT613mqdz3pkrU0/kAt+Fr0o1ZBXW
         dx1knXNCEpTIoGYbIQgWxJQM1XpGZ+6XipAaCSSk+Bofiw20n42S3USPjiu3jg1vAyMN
         Y8yuqaZQUYnMxeTd4zTAlXWDHerjVQTspNVe9/w56sfOXYENi4nBogr9v3+GsSorDkQF
         u6wCwn93U/RydGyHHUZoF7pPY2CtBd6ngi/fP5IzYNf7g7wRPGx4IwwEfLhM/k5z7T66
         YGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908335; x=1748513135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huYiCXvropVk/UdG9szLyVWmJqN+PwWYW44mWKZJz3w=;
        b=k6yQvqzVBvgn6DiEXDSBAKHPw6kOKdw9YFQVOym35bnG/RNwxEvEbDZ0OA+m+Z5bGB
         YQZUUe6dfJciNK5GANWEtWuKyNBkj13NgSN7BoVlfnV4tTgN2ePcrSs+J/QBWAWkXyET
         HVvOiNcDpoOe33Tx7HVtnnmInlPzVdBmtTR8HUWtlQhoGlruJPHClylZ2f67oZiTsWBB
         h0eIsMW6mnEYE9QxfLnoGPs9hgYPauUkZ7ROFu6rTrAEomgD7mcYPDbByuCw+EI9ETYT
         qO5pC9wwgIdPonerDIUQnXNaASiwWQGHAXmJf1Jwc/XzFGDP0kk+IIpoJvDyFh+6V0uH
         PypQ==
X-Forwarded-Encrypted: i=1; AJvYcCUleCUs/cR0PzfEnHW6euUkYObJ965bkGg7Da1mZsysV2+7BfPIqVMmyrh6As3dbtAyrVJVZgTJVxz3D7nXApfAVqQbhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUIFibkaR6nD9mUr7uKf90q8wd37w3WzHd4pcCm7shI4vZpIpn
	kbr5zVjno1JWptKOS4iyyKau7R9qds7SAR+pif/PyRnzYBu/JgabRdEYgGJ19CcxC3bVEb2a8se
	S8FqHRDjXb+rmrfD7rH3hwf2++GxE60k=
X-Gm-Gg: ASbGnctewJBXinpkWkUgSAFgBK0d/wqqxPUKkeGqpUJUM77Dnqt+2WE3xIG/X46FG6G
	SIxsnw8aXPw+6eSvPyjfxH2FuKWLA7uto0WQEp9/keBb0Jb0OlG5/QrFTS+8j5ODEgb9iGEZOPh
	SlW8ozOwRTeQ7WrdtfAG2SiEIMFeo0t5aD
X-Google-Smtp-Source: AGHT+IFDr5rCbfwHsJDqEWFc9eAKzj0qbyDgyUEXbR4okIzS8MsNsg5uv3Mhf6WDlgcslUPjVg7TF0XfI+FkBFNY1uI=
X-Received: by 2002:a17:90b:4a10:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-30e7d5d0691mr14551414a91.6.1747908335085; Thu, 22 May 2025
 03:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250311133357.90322-1-richard120310@gmail.com> <DA2LI55W3BY8.14DMW9GGSAEY5@kernel.org>
In-Reply-To: <DA2LI55W3BY8.14DMW9GGSAEY5@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 12:05:22 +0200
X-Gm-Features: AX0GCFvKq5iif3WqR8hzEtxiweft8Mm7j9J3lEiG80DsyMI5IhoRTKas8HKxJbE
Message-ID: <CANiq72n71k-KJ7krcOXL+fU0x+hU0vzrJTDNb-qT4rjR_JQ=OA@mail.gmail.com>
Subject: Re: [RFC PATCH v2] rust: list: Add examples for linked list
To: Benno Lossin <lossin@kernel.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:52=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> This is a nice example, so
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
> It uses `unwrap` a lot, which might confuse newcomers that that is ok in
> normal code. I'm wondering if we can do something about that though...

Yeah, Danilo et al. mentioned this yesterday in the call.

I think it is not a big deal here since they are inside the
`assert*!`s (which one should not use anyway in normal code) -- the
other lines use `?`, which is good.

But as we discussed, I created a good first issue to tackle this for
both examples (since this one followed the cursor one):

    https://github.com/Rust-for-Linux/linux/issues/1164

I added your tag, by the way.

Cheers,
Miguel
