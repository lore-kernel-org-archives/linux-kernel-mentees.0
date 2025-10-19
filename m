Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16715A86D
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Oct 2025 01:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760836397; cv=none; b=U9912/bWra7T4NkwkYyiSm/7OOh/9yfHgYivnxaUfSiYhJQB+aRxxMTz8rudeqRErMPlHjvI/LcTQygUOzFDWpNl+GiHSCm28EbK9GKfYkyaydPd8tZ0XE6EAi9lVek+waM5W7pfOZewgoanRZiXSdu/SmMrvMTf2ULcbWlgs9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760836397; c=relaxed/simple;
	bh=ycN16ZdUR12Rz3CMFIwbo64D8uYdImlK23EKVoR2q9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouRzfR+fMoWyNzfXl5+Ijny4Af5e7tv7yD/pxTxmnHSFCQzszek+ek3yr1X9c0M7xuGD4PpvoKwh7scTw7Kr1KCWPacNhaSjkQEcbLGdR341xYiiqlnjQ6niJLDrKHXGkAIbENVm/ttNnw8FudZxOFh8C4etJ7f2F2r3PQoZ0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awsdmame; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awsdmame"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so4035275f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 18:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760836394; x=1761441194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqCffS0MkdcG/B0C2qwy945tPaz5iAMXW2RAM//wKK8=;
        b=awsdmames/Vd9PPLjsqMpDJMiT5jLBmXWmtDQYgJNvpHlqae70mdW3zkED5hCy7vfi
         Oz5nCIIZfNw49nRCyG7FhjncgYtJWmYozGl3A5b37yxK43wjwJNa+glfbr83v0iPZsRT
         YTbhdvzfzssM5KMsF/+SdQXcs322vTELRUBsqtpZ0pb08yYN/zHxZXokMJM6uwtcjT8M
         a4M/KsitJMpgy+9FVuei4kiL1Cle1aROqYVUvbgZJxor1WkrrQFzMSoWDBu8mefduu6Z
         y1fA6J+5LUWT/i/u+MIOYnFRuv6bXsCmjLEOdUhgFmREvufGLFuuqHksJHRYNrZuZW6T
         2yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760836394; x=1761441194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqCffS0MkdcG/B0C2qwy945tPaz5iAMXW2RAM//wKK8=;
        b=druF6mKbcnGxVV1QRQrQd7x7FhhDOVlerIiuDalQQWnRVq52kwZvNJM6wImoouM/Qi
         8LI2Vj+Hp5oYa3vT5VoA2tJGAY2USfCzQCD/PaeveG5Q4pHu18y4456tzGKdD0V8GTDb
         0PaA12TtZuLrOCW1Eko1ECftwEXKyQ+g420fQJayX49goSbRx8iWwSKMvqUQSE7AKo4P
         a4JhJCtSo8SftcJ65+EXrgdVtUwhl5v/KwA4TzzAp2T2UK+8431tBT6NTFX4MQ/S9z1q
         LPrKzhzxpNm+4yruCW48zTPRRew3pJ+Eyt+NmiY/dgoWJPErp9D/KI2vhUTKcSBycH74
         XKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIlMzgPZhJ8eb0DWOKgXIUQlMP5JcQfjxrCbTETzGkYFiLq0QP6rQeG9sk4oscfx2ERU6R5nnQj/pOSOns26l9NHwcIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdA0kXiOXmIaxULWe/6LYsKxq/+D0WsKMwyfcpFsOI+497ppp3
	Yo5nkpnjMfI/6Lv8xZ5wKJ5+c5lsPkhFDdHTQssVmUQcj4oTzsFgmVhI69WFJr1gGRp2LmRkxxn
	sdYSQ8oPDBczo0O18+cyCr88jo2kHw38=
X-Gm-Gg: ASbGncu1rcHivzvxgDylojv6p9RDCKce6+yYgoBpHbQGS4Sh8ZUtEOABTnY0QG7nniq
	fkOutm/Towj3D+IRvQ8uVshBEntg++NLpCx52mFD1ptjPRCfqAS+rUJgrj6WFdPZ4LeCnaAW9xz
	fcogCIfyLhDa9OtTLXkyZ7mZeSytvvRM6Qn6s/Dolt57319vbDvyBRMvUTIZLbGfl333B9KO8x/
	44Y+J7dK3ckg529GZxDQGVtO5zyeNN7CS7wJ7mIpRpTgcAREU8lMn3zOajltBd/pIp/zO8M0yd0
	Rppjgq+4iL5KnXJWfYdBDE6Klkhm
X-Google-Smtp-Source: AGHT+IFGfgUCaIDK4EOgSAG3sWnV3n/0YMtEyKtWx7opXLcgYBMX4mZ1XBeMJbT75JRVdWx9oY0XQc+e9rWWM5ycj4E=
X-Received: by 2002:a05:600c:468d:b0:45f:28d2:bd38 with SMTP id
 5b1f17b1804b1-471178b14acmr61603585e9.18.1760836393523; Sat, 18 Oct 2025
 18:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251018181156.59907-1-nooraineqbal@gmail.com>
In-Reply-To: <20251018181156.59907-1-nooraineqbal@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 18 Oct 2025 18:13:02 -0700
X-Gm-Features: AS18NWCinBurDJyOY_gktgSZeVjS-bMOMD7I5Ui94jU4eqSqJIbM_iViSKXLBac
Message-ID: <CAADnVQ+pXhEsumx6NapCU0sCJw9vdB3TdLMLtCoHa7_sqCRH1A@mail.gmail.com>
Subject: Re: [PATCH] bpf: sync pending IRQ work before freeing ring buffer
To: neqbal <nooraineqbal@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, david.hunter@linuxfoundation.org, 
	syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 11:12=E2=80=AFAM neqbal <nooraineqbal@gmail.com> wr=
ote:
>
> Fix a possible vmalloc out-of-bounds access caused by pending IRQ work
> by ensuring all pending IRQ work completes before freeing.
>
> Fixes: 457f44363a88 ("bpf: Implement BPF ring buffer and verifier support=
 for it")
> Reported-by: syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D2617fc732430968b45d2

Why do you think irq_work_run_list() processes bpf ringbuf in
the above splat?

> Tested-by: syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com
> Signed-off-by: neqbal <nooraineqbal@gmail.com>

Use your real name.

> ---
>  kernel/bpf/ringbuf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/bpf/ringbuf.c b/kernel/bpf/ringbuf.c
> index 719d73299397..d706c4b7f532 100644
> --- a/kernel/bpf/ringbuf.c
> +++ b/kernel/bpf/ringbuf.c
> @@ -216,6 +216,8 @@ static struct bpf_map *ringbuf_map_alloc(union bpf_at=
tr *attr)
>
>  static void bpf_ringbuf_free(struct bpf_ringbuf *rb)
>  {
> +       irq_work_sync(&rb->work);

Sort-of kind-of makes sense, but bpf_ringbuf_free() is called
when no references to bpf map are left. User space and bpf progs
are not using it anymore, so irq_work callbacks should have completed
long ago.

pw-bot: cr
