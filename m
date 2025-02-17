Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C647187858
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 19:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820089; cv=none; b=Sbc86Dl/WacycfToETEGHw1XUCH/CybdbsuJeQ2I9MYcgOpRWYvXnmCwfrjjXB1hl/GwXLQoeqE5XPZWvklXOjYRk2z5LAH6C/CPaS1qHHsTPMd7kj8IJOS/XbszfK3yqw8DVlVecTzAM7cg9z/b6KUpj21jOC3P0Q6fweLVgJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820089; c=relaxed/simple;
	bh=sF4dNgTXt9P2MfDrCOM2x387UotJwcbVDhqQcOqS8qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYZeKGRkSAIta2eYADh7xfOdWBy57LtZ51fhS85zmlmcsGE42DauAV9zupZfnZ0gPqPkpk+AbrTPDbArCnvFgijl8gmKSWZY3HKm5qlQoOM6IoeT/q7nj7ifAgaqnSlxcGcnDN+m2tLLLGNc2A4+cEUMW3ZlWeCBMLfnu5T8m5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HWdQUPNV; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HWdQUPNV"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so5423023a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 11:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739820086; x=1740424886; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKWt+CGIeGqmvl6o4duXuS4HEdgdnEPBpkkM9quSgZM=;
        b=HWdQUPNVdLEMulkHhwVPaJxn50nck5bldKJE0E46phsk7y8cPFriLhcJS4h/vqEBJJ
         H/31uLAaAXF7alssimX6/4StpYTbIDiL+KTz67TX0C7qrjP7Qz9hC1hAbQhIOlEbXlX3
         ga6tyDfObXlXpALQGUcsazg5cTW520BIQqJ40VMvvaSZCR2bMu9WUQq8OWF/xTcXdIaH
         L6CLMh7zahE0l6Ck9/rlgow9CUcdAg47EBnkkDaCG+KsBQRJwGmz+BU9rg5uO/e6ohke
         WxQBTtC5Mv/2lKsthoWSAHH1TvGwOST3OWw179YarfejiwpTBBdN51lchKuduY7S7gj/
         tgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820086; x=1740424886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKWt+CGIeGqmvl6o4duXuS4HEdgdnEPBpkkM9quSgZM=;
        b=c56ycO4hJPJno/qztjauo43Ai1VZx4ygWAeOZsWAQMjWtidxpEF616CtFVd6uyJntK
         DMDgOroriGsRBXQYMSVjkPIB4laVSLyM+9haAZQKOKr0h73pIM1nM6pdKVRmS9CNF4YH
         qbX4uXavGNKUhNl2Y7iW+BMvTy+9OwfSUILK7uPSWwsJZf5REA0tEaPHAnsJvWGM3Odm
         kznt0n7oMmmGQV9SrTODvhnC5QzvwPgz32xZAHHKMz+yysdwv3PH2puo+Z0gza5KU9Cc
         4XwqN75iMrdRt/hPPmUFhgzyCyihJVjJLmj/LLlMTSnDSmNKISyLlRfkNG71hB3vttt/
         EzeA==
X-Forwarded-Encrypted: i=1; AJvYcCUh32ZdRUvEQlRoTvI1iZhZ4q1FceQ2wDj1RyHSDKj4IcczW0vsvnndP3donV/aSVYMWXL3WwtiUHcRkgWrIlb2ZwGR5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSvBasv6eibkm8a8y0QPwgOCso4IT3zLs0iNUEJD++gx7aMqH5
	TEnxxMlS9GTiMGTGfDCbqyaaewUQRYCM+HnXvQDu0LbLmM/eUSdNwAarNjPJbVF3P+JBduzohpz
	h8jP5JLpPyjlGRFtaswP70Xfa1Scr2f5RFT3o
X-Gm-Gg: ASbGncuJtaAs9b5Ljp05JsRsPgV7BHAP0G4+kaH49vWgvtzVhfvyoqnlHUJGul8pD9w
	iaKlQUPq61aNUkhhB5LxULCpi0hFqXyIIv7DoNuizQpere97c/qne7cFa8aauaKN1rRkd2252do
	bYrIc27FVG98gA0yUUA6IMCHGeci7KVw==
X-Google-Smtp-Source: AGHT+IEap8PYC/gcmteZ5/Wv1Z18lYQy4FdMXowXmrhdhBEF8xkPaOCqgelb/BmzAGvTlxW6HATJTR3fKO7HM9UtNHA=
X-Received: by 2002:a05:6402:268a:b0:5de:594d:e9aa with SMTP id
 4fb4d7f45d1cf-5e03602e4a5mr29725670a12.8.1739820085654; Mon, 17 Feb 2025
 11:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO9wTFgtDGMxgE0QFu7CjhsMzqOm0ydV548j4ZjYz+SCgcRY3Q@mail.gmail.com>
 <CANn89iLjxy3+mTvZpS2ZU4Y_NnPHoQizz=PRXbmj7vO7_OGffQ@mail.gmail.com> <CAO9wTFjaLBbrT7JKBBN=2NMhSRmxzPk_jLSuG=i6Y5anZJnvEA@mail.gmail.com>
In-Reply-To: <CAO9wTFjaLBbrT7JKBBN=2NMhSRmxzPk_jLSuG=i6Y5anZJnvEA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 17 Feb 2025 20:21:14 +0100
X-Gm-Features: AWEUYZl_PHuXaZdgyEUWM3QOrrhFjFhmZ0Rtac0XSGxtCN7MSzV1nZp0v_yrI1I
Message-ID: <CANn89iJmOKiALL9r_9+nyy5bdYwMUEX+LAkmswMyWwNC53yEew@mail.gmail.com>
Subject: Re: [PATCH] net: dev_addr_list: add address length validation in
 __hw_addr_insert function
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 8:05=E2=80=AFPM Suchit K <suchitkarunakaran@gmail.c=
om> wrote:
>
> Hi Eric,
> Thanks for the feedback! I'm new to kernel development and still
> finding my way around.
> I wasn't working from a syzbot report on this one; I was just
> exploring the code and felt there is no parameter validation. I went
> ahead and made this change based on that impression. I realized my
> changelog should have been more generic. Sorry about that. Also since
> it's not based on a syzbot report, is it good to have this change?
> Your insights and suggestions would be most welcome. I will make the
> required changes accordingly.
> Thanks.

I think these checks are not necessary.

1) The caller (dev_addr_mod) provides non NULL pointers,
    there is no point adding tests, because if one of them was NULL,
    a crash would occur before hitting this function.

2) Your patch would silently hide a real issue if for some reason
dev->addr_len was too big.
