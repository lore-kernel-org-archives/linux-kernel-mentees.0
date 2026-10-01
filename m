Received: from mail-yx2-f36.google.com (mail-yx2-f36.google.com [74.125.224.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352F51616C
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  1 Oct 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862232; cv=none; b=K1eNx5zXi1bgFnSzl2xMIundxfigMT+OU2FQldmnO31VmIjPM6O2nGcq/BRThvAF5YYuv/qCwdHjYsB2KzGB2TELK4qAq0UWjUxj7CgWva7sV5aN6itymgcJ67qaaYrbbohKf+/rMqe4Ia9CqMnMBMH1pzCSEOCa8v4P1DuJvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862232; c=relaxed/simple;
	bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=CnwjpgXwmfdlsXBeXjjxMyMGpy1PPqfkJ58ERtuJjMVYoKWVUfEVg16yoxgWYgU7yoKCmVacnzYhA5CA+Lcy+Tum1eOyAtBVpIvOjy5bqlSMeft1rIeeHPJFqWh94RHO1NmLrCFdSqt/sVxMnA1G8GG6DNf5fEZlzIU9KrgneYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Um+DmYta; arc=none smtp.client-ip=74.125.224.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Um+DmYta"
Received: by mail-yx2-f36.google.com with SMTP id 00721157ae682-8acdb1ddd96so9922177b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 01 Oct 2026 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790862228; x=1791467028; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
        b=Um+DmYtakqRgTkzz3OA35+HAh9Z80AQcpWs6PHBbFGvEZ2xm5IZNKiarEurrGQuH7R
         kW0rbaPh1Po3t0of1h9Ub7Fn2Na1krSAYXlV/MZ+o/xVAsKNEWC3DsWCoBT24rP23nGs
         ZyfTHc5F8DOZI0LIOj2VxD0rdJnVtoKJ+fahrfbxSahaXxRDlOjay/QPzigFAiXRc6m+
         nps3ZUOhI/LC6UDwuzRlK42iucE1dK+oG3+VZZ813Mkv/dvGSahRjCCFuEeu1zEOIz+u
         UBnb76WeGYkzaXLSY0t36e94U9vymgT+5CoLAXnkXcc+nJRhU3S8hKIhxA1IW32c2a15
         GcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862228; x=1791467028;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtxTa1VgrUAUHV74VfDLuMxfbVAqObQYg4zUaDxY7zM=;
        b=I6wXOudCJRhEchm+1hzFDArDsLj/rCV804tyTpZOUVpElAIgI8zB+ldRLaoniRXBbd
         8Poe1sTN7ZYU37voRluv3dyU6uoSvWAP2XGnGxTCtMBMXp6uuXav+iUu70A1bCD+J5nn
         tHYgIHyJwfNZW+VJgu4FmOahkt3SZdDcVt/A/tmv5JiwNn91jZ8AzinPPmCzxhQ7fLKS
         qqElpv7JuomZ8+sSv3SkbNTbQ8z7FgUPUKhf1Dl4pVlrNrxQGo4lmeplrOK9r+zHuEy2
         Bf/8QwsejfAX1v23cFnFx/JEZCavWFSt7/M+gFCabguGJvjfFYkCG2cwEc7PVkhoXST7
         8vZw==
X-Forwarded-Encrypted: i=1; AKwUvBy2KqUir7civylpzUVO4RKeiz1QXChkr/9VpBS6GITfDQd7B+c8xw0lrgG1eV7tWQgLa9p27QrBpOIO28xG2x6y4xsdng==@lists.linux.dev
X-Gm-Message-State: AFq9FYKIKYuYSd5BvecV1ImgqlvvNWFzCaJy6RoVL01c80juvUzeAMEq
	3rDKZqEp/RHeuZ0yOypWLBHZ8jawYmxC3elukJyiDuc8fvqFfsD/6P8=
X-Gm-Gg: AYBFou1I3fGmt9ViI6Z1hvjAporeXBNSL6Rgd4noyi6VajsPuDNlgtKUJNG731ZWK/w
	vHZMXw81fXN6LfWMGeMJaVlM8mJ8oY0VKfUBF3npDTKuMDTCECY+t0SGLRPOwcW4kcWqmO7vi+q
	F06QbORWkbuZLCHqR1uVUGMv34qg1cz/FJK4sBXkgmQbnMxgtVS/MiK3rGuY797BAOw57UV7lSZ
	i+XbJl+4FuJHLFJzS86H4/hmdRa6Up7vMveZ7H2nq4z0geAw6PSVpirq+aQqWxYdhigzymTonGq
	WivW9OBwmnwV121zDVpWpYL/8nkxc+hKQ8cunBhR2oJWzXPJ/mlGx9BSd6+3Xr6FI2+ncwDZftF
	6qFrnsI/yTTeR2rVqq8BnYfP7vu0UY5yJRCB1npBbOCrOKt/jQ5ZY6+Lt+G9kBHXVsc50IZ8Qe8
	5l5Sb9A+BJoMt8ZPeM4WohZTKSwAB8tOXjp6nfDSM3hGEjSmciQfnGJXu7d6TwW/eXusYsXPj2u
	S8vwhta6+Dnu8AdRDPF8tDYByr9HNhUkpDZhtyPS6BL
X-Received: by 2002:a05:690c:c353:b0:8a9:a268:d719 with SMTP id 00721157ae682-8ac93fe3e62mr20075197b3.66.1790862228362;
        Thu, 01 Oct 2026 06:43:48 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdaceb3f6sm10232417b3.25.2026.10.01.06.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 10:43:41 -0300
Message-Id: <DLTJOAQSES8X.3ONDW2BU044FQ@gmail.com>
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Brendan Higgins" <brendan.higgins@linux.dev>,
 "David Gow" <david@davidgow.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
X-Mailer: aerc 0.20.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
 <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>
In-Reply-To: <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>

On Wed Sep 30, 2026 at 11:41 AM -03, Miguel Ojeda wrote:
> On Wed, Sep 30, 2026 at 3:23=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Rela=
y
> <devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>>
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>
> I am glad it worked with `b4`! Hopefully no more Gmail issues :)

Yes! Thank you very much for the suggestion! I'll have it that as a
fallback mechanism for now on
>
> (Nit: in cases like this, I would suggest increasing tagging with
> RESEND or maybe increasing the version to avoid the same subject line
> in Lore and other clients.)

Sorry about that! I had the intention but forgot to do it

>
> Cheers,
> Miguel

