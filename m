Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F8E290BD5
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493947; cv=none; b=RXrt1ey0HBHSOlRo0lb7npQ7/Hdu0uuX3iE5e2mzu/acV5zG5+J6mnsKOri7+bp2busEJRJ5InUyuEdLjh4648hAAdztkMNKUPSMUoU03nt0mL1cNXEcAXnEmU+6ys7DGxzyPX0jRIEKF9SQK1542pURe0TVUBNevL5XhyhsvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493947; c=relaxed/simple;
	bh=mKodv+sKlayKFfKvzNuhrQzdX3PKR6NGBRJMnFiQnVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQyeGqyX10KX8NlF7HTpSV+GLH33Ql0UNvman0keh+9hDZPtN8iY2anjOQsyiYHZJM7YGxPeyY5lyvesmrrPjQ2lVEmz442x6MOVYH8A3uCHB9VPbZGsePlowGmUd5BQe1EcnxQMiSNinxXwUrwKyuT+JH8pA+3psbvtL6uv+88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzAvtr8g; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzAvtr8g"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55b823c9129so6837311e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754493944; x=1755098744; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ak6kkG0Gr5ILhCz9qlDe4Tz2QPMgdqhFKKAgptHzkg=;
        b=MzAvtr8giF/Kx39JgKiKIgYpwgyfG2fGxxZlEdP+7gJ9BlT5gybPdC0cnYflCx+KVA
         gufTR818Qxbx0QXDAa6gMI2xPY8Qtv7E1hfDrdR/RvwDOT0On5gpsmt1sJmpw+X5iiux
         PWZBR9ETP13q9Vv5FPHvd0l6ND8MVM6FaDMIlVgHqRj8tyedskMWqgZEFhkw0jsgSFLu
         nvhKFshWjZ45GOJI16tnAaALAHpOajkhrtW4gBLE0lqqWxlYCsFjsQQEdS/ITadbnQOb
         mnMe85Y68CBJRT/r+JUGX0FUsHf1KyZM9RLPRBMpHaYZ7v3Ap+13jVoTZljcZMu8kjS/
         2wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493944; x=1755098744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ak6kkG0Gr5ILhCz9qlDe4Tz2QPMgdqhFKKAgptHzkg=;
        b=f5+PNyBD+jx1v+eMNnoeU/jt/Rh6d6t9iWBJ6AidZrL9A91ECM9vfboVY/iduL0Lwh
         p1kb5aZ1Jkf99AhG9s5aCKMY7TLkerWkLKbx1yXpohTgZDub70TmqKPyQyWD7YUDlJjE
         Di6nxF3gWaaaFIFEmxTAkCWTyWNY5uEW9R9RLvwSitD0+CDOeREuDpgTsRKMNvNHyI6N
         u8rXy87uaN5T4KOE9O5/aViJHr7XX1ndGn5gKeiN7G4gXS2CAZBZrvY6ddoX7cB7gzMW
         pMSpnkHhkAAE0V8ZH0DyLhgsBUS18+Rg65PH5OhsDYCPvKk2GePaEtJIfoUQWji6ixHq
         u1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUE3psGcB6C+rQ03ppTOwCbYjNKnW5J8yD/kbYP9HzLdGGypr7GBcoZRxY4DqojcCYYGNbZxtviu1KueB7oSrPCZVCf3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZZ2/N9P0JCP8Dc6dSb5q/92Hfe/NWDcpAsu1jA1ZCwSQY5Lju
	HEgJQRCaNc1vW0AaDG7Hf+5gYJ9s7Z6fHxMpDmzHaiR2YuwSk9MjgZgqugloWNzZjS9ajmOcnLD
	08XSUmP1tusnnl9DarR/tya0ZKjzF4mM=
X-Gm-Gg: ASbGncvx2m9R8PpaKHl4HGp95m022Gg2Msnc54NXxRQi3assNjbJZ/hyOzNX1JGgDij
	bs92BkwA5n1QPZNBw00ZExGoeP5glzLWU1d/f0uhHC2OHQLX+fIx3zTRCsJbXDv67P3UIpQLwyH
	T1BIHTVrIM+aWV5zeLYzocDSk8i0mWBu1H+OUksZvzlyt4L8i6uc9rPQoAh0P2T0wAB3yO1hJKF
	GZpV/GXVopiJWNUp2wRVjQS34HHKSQ3fFwPnoTazA==
X-Google-Smtp-Source: AGHT+IFuXucBMEFtpCtDsz4YxIbE8W+P3+as9anTHGHj6dyv4YdatbL3BW3rJ6ST71SpMX9C+9AlGI3nNgbMQZCuM6E=
X-Received: by 2002:a05:6512:1589:b0:55b:920c:33eb with SMTP id
 2adb3069b0e04-55caf35898amr981949e87.42.1754493943616; Wed, 06 Aug 2025
 08:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250806110230.23949-1-pranav.tyagi03@gmail.com> <CAADnVQJQV5Z_LsrBCa2=UwQ9NhPbkpNvZ9N7nf1sv-QunEj1FQ@mail.gmail.com>
In-Reply-To: <CAADnVQJQV5Z_LsrBCa2=UwQ9NhPbkpNvZ9N7nf1sv-QunEj1FQ@mail.gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 6 Aug 2025 20:55:31 +0530
X-Gm-Features: Ac12FXz2S0kDjSFEJFEpV8_XL9LeoNM4mZxNsuwnlSJbqILHu0d2FLO1xgfQ7Tw
Message-ID: <CAH4c4jKvMBfaRaAoHbBn45vKzCHMBRjJ7UCOqa8FDXXQ7c_L2w@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf/progs: use __auto_type in swap() macro
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Mykola Lysenko <mykolal@fb.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 8:33=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Aug 6, 2025 at 4:02=E2=80=AFAM Pranav Tyagi <pranav.tyagi03@gmail=
.com> wrote:
> >
> > Replace typeof() with __auto_type in xdp_synproxy_kern.c.
> > __auto_type was introduced in GCC 4.9 and reduces the compile time for
> > all compilers. No functional changes intended.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c b/to=
ols/testing/selftests/bpf/progs/xdp_synproxy_kern.c
> > index 62b8e29ced9f..b08738f9a0e6 100644
> > --- a/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
> > +++ b/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
> > @@ -58,7 +58,7 @@
> >  #define MAX_PACKET_OFF 0xffff
> >
> >  #define swap(a, b) \
> > -       do { typeof(a) __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } whi=
le (0)
> > +       do { __auto_type __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } w=
hile (0)
>
> Sorry, not doing this churn. The code is fine as-is.
>
> --
> pw-bot: cr

I understand. Thanks
