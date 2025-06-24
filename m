Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039F2853F8
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769972; cv=none; b=iQubUf0oY/sjes6/JLiPl4lMnQkaqlGR0Ht92UZ5cAAjZaw28zAKa/WYjaZ+gG6jPkWCH8mq8DAeuWEhCiyQDJopQYW6vR4+Vfh720LN4Cg99SKodY0XndGffFMn4ACz4eKoURmwSQJFXOXAXHUzKaHmIYBGKTLIYJNPSDuuN7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769972; c=relaxed/simple;
	bh=dAYn0EfssAKk4QNI5cjNInqaycsqKktvQcISKWckjNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVFHnq8PyVuX2kgdE9yCz96cq3qrhhrw0QNjOgNlVJp4rEfXw7es78FHAZ4Ch2uA7QfDuI156Js1/YorkQ1KglhQqlIwuG1SZCQZ4kevZQlB6b0Sjtdlgxw9InhF8QgNXqZsBcxCApWLU9UEpfmJJOZNCG5dy1oj7vtX6qaZ1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBhCp1EW; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBhCp1EW"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e844a781ca0so187007276.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750769970; x=1751374770; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXEGXnz0a+df5W+FfhZnrWhPAiPAElZm0f8fsVZX0Fw=;
        b=dBhCp1EW91HOZExsewTBIDkumkDq3ELh9K05Qmr8Ha7GzLeoTYtQ1ysM7Uw63UfJkI
         TA/SaN3WG2zfgXaUVZ7rqlDGzaT62mSE+hyQ1vZK/qwP+B04K8PiFSVL+Jmajza7YJQe
         v7CsavOIKsX1q6zDgy1rfUQgJ/kvIHcYLc2wF7l8gveWPu5ezqfS8ewXJuQWF1cKpsUw
         LRxVaXcAVy8aJvjdLLsp7PGA5iC6plCr4Fun/Th9N//gpzSRCWAkKej2rzOgfSfY9RMK
         1xBDQ2l8CKQj90KY5ZXvlL0f1HRMmolZrYTh7un9kJRaYWxBTuCcPTBR8XSMEXVRD+Tu
         u6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769970; x=1751374770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXEGXnz0a+df5W+FfhZnrWhPAiPAElZm0f8fsVZX0Fw=;
        b=XRMzn/K/iL7QlivaMmbjT6b5kn+zMgQBtN6YRaavKBTuWCZc0rbGB2Jw/LGWczVs3t
         EBPDp6/D3rWadfK3061AkbyjlNeSBR+/LBj42ihz7/0xUmEpw8L86QtJfll/9eA87ygu
         qA4m+FMA8Igsl3pV+Gl+i3Cg5W9zc2vYTNk0yRcyAPb2frNoFb+4ii+pQOlDq1Zc4ZQ8
         403Aj2x4NeerTQHzbOfsHQfTBHb6s6IaUnr4hsvFMfnxusBI1aMWhfIq43C7nsybzZkJ
         hM3FjLmkWxDjLPvuk/hNfug94v1iChlt51pJ0Ao9IQ9dwM47RzgDOPCaPN5fUHNkfCTt
         odkw==
X-Forwarded-Encrypted: i=1; AJvYcCXNausqIlEJNGMM9fnD7kzPqNOk+2IUFjXdwYQOa88FUzOQdBG6sJXsaSBfaMhcEJBB83IchtRTCmCdySrwO44UOc2Hvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWy6E2p1g6mpuFRFWnQ0goXWM8j667rAKiScMk0Kz/e03LT8Wq
	fVsoJMSSXYKPij78f15NDQPBpkkFA7L796iWtBaGqxVuJubib5l21p9PpJ+OYayV8o/1CGzYxtW
	OO1xirmZ7p7yVyY4O/ju4CgoTd+GE+Lk=
X-Gm-Gg: ASbGncsWnlOu7SPQD7/1i0mmQ4026SYOwzbZlX5Ob6G9iOsC8AWHw8dW1kR6HEihzVy
	dl1g10ML8LaHFzbpQkpEb5WXbFDmrWqurGEO/kri644gxhTcD6PMnDJfUtmejcTC6pqUrdROlCg
	kJrHK/KIjOfNtiJO7yc9IFMXBdX0wN4opFxWhqFqZWZwqtfiywhqkj07Y=
X-Google-Smtp-Source: AGHT+IFvCeaZzKHMdYWrE1NUmXGqOeTl6mqBUnlIc9WE5OJM9ZB0ZpndjNLaByWjgS1VW99YxVSV89DUdGGvZOd+CoM=
X-Received: by 2002:a05:6902:2e09:b0:e82:14ac:77eb with SMTP id
 3f1490d57ef6-e842bd144bamr8550147276.8.1750769969472; Tue, 24 Jun 2025
 05:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622090720.190673-1-abdelrahmanfekry375@gmail.com> <fb0f1e3c-2229-4860-b46a-b99f6dbfdfe6@redhat.com>
In-Reply-To: <fb0f1e3c-2229-4860-b46a-b99f6dbfdfe6@redhat.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 15:59:18 +0300
X-Gm-Features: AX0GCFvvC-fqrHPcAXlNkROP7sMaBEpAgC6_zly4W-ELrMge3AhPG2o-bdZmr3E
Message-ID: <CAGn2d8OguuLUkRaT68MkL0_VJ5hh5CZfONCaruEHcASdxfJbDA@mail.gmail.com>
Subject: Re: [PATCH net-next v5] docs: net: sysctl documentation cleanup
To: Paolo Abeni <pabeni@redhat.com>
Cc: corbet@lwn.net, davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, skhan@linuxfoundation.com, jacob.e.keller@intel.com, 
	alok.a.tiwari@oracle.com, bagasdotme@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:54=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 6/22/25 11:07 AM, Abdelrahman Fekry wrote:
> > @@ -593,10 +629,16 @@ tcp_min_rtt_wlen - INTEGER
> >       Default: 300
> >
> >  tcp_moderate_rcvbuf - BOOLEAN
> > -     If set, TCP performs receive buffer auto-tuning, attempting to
> > +     If enabled, TCP performs receive buffer auto-tuning, attempting t=
o
> >       automatically size the buffer (no greater than tcp_rmem[2]) to
> > -     match the size required by the path for full throughput.  Enabled=
 by
> > -     default.
> > +     match the size required by the path for full throughput.
> > +
> > +     Possible values:
> > +
> > +     - 0 (disabled)
> > +     - 1 (enabled)
> > +
> > +     Default: 0 (disabled)
>
> This uncorrectly changes the default value: should be 1.
>
> >  icmp_echo_ignore_broadcasts - BOOLEAN
> > -     If set non-zero, then the kernel will ignore all ICMP ECHO and
> > +     If enabled, then the kernel will ignore all ICMP ECHO and
> >       TIMESTAMP requests sent to it via broadcast/multicast.
> >
> > -     Default: 1
> > +     Possible values:
> > +
> > +     - 0 (disabled)
> > +     - 1 (enabled)
> > +
> > +     Default: 0 (disabled)
>
> Same here.
>
Thanks for feedback , will change it and look for other mistakes
> /P
>
