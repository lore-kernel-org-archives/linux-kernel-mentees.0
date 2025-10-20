Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEDE2773D3
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760977052; cv=none; b=ZJtCYlpY4IRvkVrfiSOTTCnjGfpHDoRdQYp+QD0lfRxfNPFg+Ya/cARbYjoaJyMlIcjcLhOeEKon8tEHo9Sv0RKR70vxcqiJLw8R+xmAvB2Vfx/oB6wA3HGRn/BZjnFuEMJG+EOG+Ur4xMnbbn+/KEJGjP21CJnjcKUW8zRoqQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760977052; c=relaxed/simple;
	bh=ULurqNgTjIRm8jXItaQmTq6l/zmGPnpuvlJ/4FEyZY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3HqRZR02X3neMZFv+F/SdPTHnu4aCf6mua6Egbju2ZAxw3WG/vC7HbjciL/27Cvo4UrRoTETBka7jJVyySn5lBzAyIPw7ECRe/OsHjqLK/e1vWC9Le2kFOKpustYTzeldoInbp6nkid/NY5TxmXtVt6g6chlyCJN+oj783JA5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWT8Xhh4; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWT8Xhh4"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6a7ed1ff9eso1929245a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760977051; x=1761581851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JV3ElJ0PE7M/5axYF+HEhAt8OP699X7xWQsv/feFME=;
        b=TWT8Xhh44Z/lx7Z9qWEGXW8DpKKRNWkZ2HIMuLWItMifNT8VjdR1/yBCAtlA4Yvfod
         eOKSbNBil4bKWnSV5iA5T7uozsVQwSSr2Kzt1DMdFpUY0/Xb5RY36wZolio1lltaMyJo
         M0Ev/LLsfzpUcOpzDKrcOoASxo1YJqf1HCJdwFhypcyUHn4gecwFQlgG/2hpmIKkvA7O
         j9OIFXvMKNZ48g7nVA5DauBepR1tIPo3H6a8t9FIT6NyZ150SngBY0YOsf3lKJFVaP1N
         wieWaHpr0oL/qUcPFII54YWjBHakNyEQ+ETEY69lSvUOB2o+MbpuVKB5Mzh3UIyKiHjH
         uHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760977051; x=1761581851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JV3ElJ0PE7M/5axYF+HEhAt8OP699X7xWQsv/feFME=;
        b=r1ceaOlz57qkx/sCOA+a+mpJ+ft7XwPbNB0rgKACOGKrdZq5AGQrw9VaHRSN4aY05b
         ehUgcfj/p2X/PmEKysBru+taICZ516hlJsVpOYr1nX+rVG8R1DYEqeEi8cLNN4PH/Zc2
         7NWxwc9QKr6FYmKioqH7sh9GX5LSw/kj6ucU4l7c35QNQjb9UQKETiDjUOP5a0WHR8iO
         3OHT2KxhqXmxcjbmlkX2G9WdIP25er6/nt9G+Ox4RdS9tnp3MtAx5/C6ICkqRVS6VWXB
         rG2yHbGV3TbHRPKehcCaYmcsjeZ7GFBz5IzlXa57QjEuHCZ4dpmPMaAwc0qIIabTO8IV
         S2tw==
X-Forwarded-Encrypted: i=1; AJvYcCU7JUDDd17RBpzy91gUIYA2ZTBu2TRLIkAOTuDiL1ZFnvmyBivkmiAiECSex0kzvu6mCPSgrpwEmb0s9gIIIiyzs3957Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx7YDTXTvobhxM09CqO0O62z0+oZym+REehs3FtEhy/aoacY+J
	gZ2XP9kbm+VpuKU8S05lRJ3GRqtNlgs98OKindkxl7mXrXtHCxN1C+oP7UHdtuvuqlFr4Wqj6Rd
	zOl84mNNdFqaPvQ6qh37vCycAke4oZag=
X-Gm-Gg: ASbGncs+e9ohjp6Du5dY+MJH7/jx35qjcVCNQ0Gm4nrD8P4nToinuT4ayHmoVDMjK3Y
	VbUVwUY6X+hQUm37gFPB5Q4Wzvhx4CZ1qeweB0SlEQ0DjhjAr1LjNPPjWGdysGZlrVWDuMYiKUE
	VV4LE1W5CPfer2ZxgRzabR5EWMm/pLaC1wR4DVrdc/ZweXRX/loOoLWGF5y6qwg0UX7BMVAQDRe
	JqVEPna84r07pGjCzVrUoviXgth0FbaV/p+cFWMsuC6JhqRGb4J7GXrv5HBQa82ivRj6r4t0KS3
	xhT3YKZkBhc=
X-Google-Smtp-Source: AGHT+IGbh3vIY6677DF9brRXSRdqlbWv3B0n8wxI06Wzk1E/BOpWWUwdp56dVrMID+U6pR7TEAzyQ0+fm4lNYwaxZ54=
X-Received: by 2002:a17:903:138a:b0:290:567a:bb98 with SMTP id
 d9443c01a7336-290cc6da1fdmr167710265ad.57.1760977050441; Mon, 20 Oct 2025
 09:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAADnVQ+pXhEsumx6NapCU0sCJw9vdB3TdLMLtCoHa7_sqCRH1A@mail.gmail.com>
 <20251019223006.26252-1-nooraineqbal@gmail.com>
In-Reply-To: <20251019223006.26252-1-nooraineqbal@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 20 Oct 2025 09:17:18 -0700
X-Gm-Features: AS18NWBGqjFbbLYWqoMHdvc1S5PFT_whCkYbB4vjL2fGXEzy9hWRYir83-8Tb60
Message-ID: <CAEf4BzbtzHsa8DASzOg-Xqp8_-vG5ekC7JXhwuyZqPhrckU1hA@mail.gmail.com>
Subject: Re: [PATCH] bpf: sync pending IRQ work before freeing ring buffer
To: Noorain Eqbal <nooraineqbal@gmail.com>
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, david.hunter@linuxfoundation.org, 
	eddyz87@gmail.com, haoluo@google.com, john.fastabend@gmail.com, 
	jolsa@kernel.org, kpsingh@kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, sdf@fomichev.me, 
	skhan@linuxfoundation.org, song@kernel.org, 
	syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 3:30=E2=80=AFPM Noorain Eqbal <nooraineqbal@gmail.c=
om> wrote:
>
> On Sat, Oct 19, 2025 at 1:13 UTC, Alexei Starovoitov wrote:
> > Why do you think irq_work_run_list() processes bpf ringbuf in
> > the above splat?
>
> In the syzbot reproducer, GDB shows that when bpf_ringbuf_free() is enter=
ed
> the ring buffer's irq_work was still pending when the map was being freed=
.
>
>     (gdb) p rb->work
>     $5 =3D {
>       node =3D {llist =3D {next =3D 0xffffffff8dc055c0 <wake_up_kfence_ti=
mer_work>},
>               {u_flags =3D 35, a_flags =3D {counter =3D 35}}},
>       func =3D 0xffffffff8223ac60 <bpf_ringbuf_notify>,
>       irqwait =3D {task =3D 0x0}
>     }
>
> Here, `u_flags =3D 0x23` indicates IRQ_WORK_PENDING and IRQ_WORK_BUSY
> are set, which shows that irq_work for the ring buffer was still queued
> at the time of free. This confirms that `irq_work_run_list()` could
> process the ring buffer after memory was freed.
>
> On Sat, Oct 19, 2025 at 1:13 UTC, Alexei Starovoitov wrote:
> > Sort-of kind-of makes sense, but bpf_ringbuf_free() is called
> > when no references to bpf map are left. User space and bpf progs
> > are not using it anymore, so irq_work callbacks should have completed
> > long ago.
>
> You're correct that normally all irq_work callbacks should have completed
> by the time bpf_ringbuf_free() is called. However, there is a small
> race window. In the syzbot reproducer (https://syzkaller.appspot.com/text=
?tag=3DReproC&x=3D17a24b34580000),
> the BPF program is attached to sched_switch and it also writes to the
> ring buffer on every context switch. Each forked child creates the
> BPF program and quickly drops the last reference after bpf_ringbuf_commit=
()
> queues an irq_work. Because the irq_work runs asynchronously, it may stil=
l
> be pending when bpf_ringbuf_free() executes, thus creating a small race
> window that can lead to use-after-free.
>
> Adding `irq_work_sync(&rb->work)` ensures that all pending notifications
> complete before freeing the buffer.

I think this all makes sense and the fix should be good. Please add
the above details (perhaps in a bit more condensed form) to the commit
message.

>
> Thanks,
> Noorain Eqbal
