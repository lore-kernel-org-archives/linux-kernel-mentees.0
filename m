Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789DE28851A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908098; cv=none; b=MSnCiyrh3espn9e++zLrlTgd0mIOfxvW4GD1HtQv7lXT4uZjcezvZISqLxFHsoKudKvhI7XDx4iTQhPmv7jtZD8UTxysAd3PWRe9L5zJ4l8gBLw6dF9125U3ODV0uHL65nAaxNN9Fe4IKluyut5RU/ZKpgRRdcxFXaGZTC/0+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908098; c=relaxed/simple;
	bh=CYrmReOgJEw6CessNi+LPb9mjd2I5rHLwVcjJ4YFub8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlcgWkLnDNHam/IY8krprbk0mHV9+nZim+SvjSJuZNucwQc+ptYhg0LErl2YcNCKGvn+vkUIHc0UIO8FeH6abEaNtOfVwe6MvhoQaz1roMijMLPX/EySYrl7YOrl2ZKj5jjrwNotIg8Vkbf+42IMj2sTgRMyBI6ZQmNdShrRHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6WAww4W; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6WAww4W"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7373aa99e2cso874957b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747908097; x=1748512897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYrmReOgJEw6CessNi+LPb9mjd2I5rHLwVcjJ4YFub8=;
        b=W6WAww4WUrHAtbkYZXqkUTW6htB7ALUukacD7ZGp2yVTBfr/0Y9b6BW2Is+jhpAlJx
         NRK6KbXVXuMsxGYLZM5o6XBOtlR/rqMSZqx/6BJb/+BMeEDMQI4NSw2VtF/stkLeQ7hx
         2g9a3DdlMg4tUTnDVbnbrSI2+uWEOA8Nr86tQiYdIuEyl1S7C6pJn79F2dlU7A6DTXua
         Vc9kY9OUMXeOMfgwBI1L7z45BQk3hcn78Hq3lu4CfeNxOhjD/Q8QeLJBLDW6DKHx5IsD
         AiyzJ1RXgwoMBhIt2jFlGskDhN1RgxJiDnTAjYHyfjQYeWevINQyhK/rSdn+rDi2gJQP
         t/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908097; x=1748512897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYrmReOgJEw6CessNi+LPb9mjd2I5rHLwVcjJ4YFub8=;
        b=sMT7NbOHmL2EoBkbwe883xKG7b8lszIi8rSQaPNI+t1rt7gTRWNDttGxGfMup7why7
         NA49nTk3EDDn730OEQusthsiyoUqIadLLPe0cuahWdF71Hj730nULr3eZbkDUKUSoX/o
         AqIIRs+s/3YpXIvQPkRJLGChgwxFQaXOW26DcTA7K9zdccxfmdN7NRFybj/anSoG2sSD
         oKOck0G8wi47kWTVVVIoA2i+9/JikH2GnPsxvDa6CYLQqAY9GhD+Km5tBFDo4VRFD95c
         BJFxGjPlQMNYUEUvoynS/WNCaQIApHt6E+tPLd60jJgFHzbwOcBu/zw6n8QXQVK9TPs4
         kICQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGFsayKjkZC2rgqScrGDawhAupyxl8brepSP6TUa9VYBVKihi1RotoxXlGpxz8nd9PvEA4e0okZrBQWBuVRmMRVAANMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlGHvTq3dVuFyJJKW5FXMcUWfwN3WsRpOT0PREIqRnzjb5pQn6
	xLPZPBilhivZEdcbZEYfp+B9zXaDDGABsKC+o5dDNuj/s5TkQISoeHkPLWfn8gWIXeJapW3dA0r
	4OajospTqsGMzqcg7HDAzvEH8uu9ZRuQ=
X-Gm-Gg: ASbGnctEc0aS0tInWDgMjg8ao1Ylpq46JZOjPEJoQ2+3+lf2vtB0ZhgitgEEVXE3YTt
	bgovqzXguB7bS1/jYa3x8EXX+WkrNdAvMXHMkqOWPvyPRYEgVCzPhChKThIFRunMMZrnDZgpNZt
	ABJyWjlcB6A7M6E8BfOBNN5LTQkcNLqD2k
X-Google-Smtp-Source: AGHT+IFzExsehcETTSxOWLbLeb1X0fQx5IwBe3zVmXIDadcj6RUERIrXPgnO4cDoJ1s3Y+MC91pZVZj3DeWJfX3pE7Q=
X-Received: by 2002:a17:902:f648:b0:231:d162:eeb7 with SMTP id
 d9443c01a7336-231d45265d5mr128885535ad.11.1747908096729; Thu, 22 May 2025
 03:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250310073853.427954-1-richard120310@gmail.com> <DA2LIVGXSOVX.25YPFFEHM5CQB@kernel.org>
In-Reply-To: <DA2LIVGXSOVX.25YPFFEHM5CQB@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 12:01:23 +0200
X-Gm-Features: AX0GCFvmAeJmVX-ceDMr7saR9zM4pb6ECkILyTIpFPOf4gLHVJ_zLWfdsNsyDS4
Message-ID: <CANiq72mFn593RCYGpLeJ2Sk1YSxnJ871Nu28KQLU207zTfMw6g@mail.gmail.com>
Subject: Re: [PATCH] rust: list: Use "List::is_empty()" to perform checking
 when possible
To: Benno Lossin <lossin@kernel.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:53=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>

Added :)

Cheers,
Miguel
