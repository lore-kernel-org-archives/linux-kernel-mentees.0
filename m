Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E161E3762
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Nov 2025 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405146; cv=none; b=dUhNrpmZ5k05mvIMt5vVyPnE4uv3iE3OBA9AdJ67izk74R5RcmngSy+H71QFoVpuq4QxVqhCxfM4y5s5SjoJoDVw5hfncygXoIfMVPfMTAENh5pVRdSIsV2Z1Fh5jDqCuEJ5+iVlAjWEA+S87rFulKcAfsbmBL4OBK42bPg9+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405146; c=relaxed/simple;
	bh=XfpLeaMZaftJPa7XH4d6g3rAc3/MCc5v2eE3X/twjBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCR2qH3RSkNiFaGksdGA3CmACLUtm+zYduDfINH/ZStXgBV9T2OG0Pea68yE8HhqAxJ30j7W22ftpPdaY8t+dM7YCe5wgxRBVxIZv6O+GIKeqYp1PO08bb4mepwRWQ6B1DBE5NYQZWMET4QJKSLmPxWiR6x0pewG00HTX0gj8Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mykb70uw; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mykb70uw"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29844c68068so45985605ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Nov 2025 10:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763405144; x=1764009944; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wucYSeQ2nsQ8Jk+wJRdH9jEs+0g/nJs2i4hQi0un/g=;
        b=Mykb70uwcVsdTjf1eduGUuxRjBvPpverG+TtThVl4m/0cn76Adg5njtcxDLDjLq9Wl
         61DwWnIvQrJRxOALf5yhtZjnUQykKqvmP1TjY3jdMWnQWWaSR9q0bKC0NHKGv3RYVt1i
         P0GY5huEYijw3/NRinGOraMl+uZjjziB+cn3JEZSQOUQiaj/rneqzhO3VlhCE0h07UGC
         XbFQgGFV8WOzopAFiJUSdrl0xB4grztqa1I8mEq3VoOxmCT3eDLZSUEKqE79vYSuMlcZ
         NPQOzzpOpYULKUXqpYNYRcfY6x5pMKISzADqEpbtE/zWTy2e7ReIk3RbcGHiSwW9H3U/
         GpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405144; x=1764009944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7wucYSeQ2nsQ8Jk+wJRdH9jEs+0g/nJs2i4hQi0un/g=;
        b=n3jZ0Tzc0SBOb2pvUHQfMuI9YIherSiPiXJ7d8kcO4BMFb15b+T4NdElzhcJ3aw42J
         UG6xOuf4h/wiksJbxzPSTTiZgV50kiHIxGo2niUjDXHDwrSDKehNDrQgSdaEaXCpGcMu
         +PQZyomt31O5+WltYtBQ1D4epg+9wbUTmjON3tjjY1WaZUe9K2J2vX4mpeepQvhK43Zz
         nxWgcDhkgFjN+7Df5XhQysghI+TRJl/XfCgJeO3QZQ17RpWFAPaXpNDE2p+gBEhe0w3f
         bLJ8oJnaM7nz+lEfOuauIab07PGAU6EREwqBj8Gt2vk6OdcU2Pz2Yuv94ToHtb2D4TsS
         yq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxZ5Yhrdh3+MPwOjNsDuq6F7SyrqtJwb06NNzS/emuTLYEguPFx3af+X3Z6fcDMyMydIC8My0vydqZehRMnME55gtQag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgUzq/SgPCmGzw9I+hCZWjPLQlUdujYhCq0w2G8T+iNC2/h4dX
	nva/LcrLHd5YC264XzWm8a8vH9um+apCTnYU9QjLPVzAon43lFg5uPCHKmG1tuyDmNACEkNuZQ2
	iFVPiH3o3LdLrd6pxtY4gh5jZM1ePVp0=
X-Gm-Gg: ASbGncs/3XQaapyAfPKYbWZfSTBFyIyXe5F+fhFyQDTYSLiRy8F89Ha5pnqMj1k5s3d
	MjNykvC+oy+U0qPi7e1T/iysc11W5anot7sc2BT/J1Hh7GjyfUJjIZloy2J2MO1wjCyRW3LcuDf
	KoVG5fqevF3NYQfgZ06LKXYMxavuRiXbsvQjUDLG1WZjmn2x/KrLrcSDeBE4vdkFalo3aXN42gt
	/cJ53n0f5TJem+1Tb4eYrlT+k1wPgeAFPa7KQEgeSKR9aTOsnY8X24GpZyoAOJ/1EJFCe3ddxZe
X-Google-Smtp-Source: AGHT+IHaGw3phEOQw4Qpur0eLmyhxso8M4IG4GnZLwbf/2toORgNJUKXRKe/uLp0l71+D3q3BCbIbJuZDTs9RGbD+0c=
X-Received: by 2002:a17:90b:510c:b0:343:b610:901c with SMTP id
 98e67ed59e1d1-343fa74be77mr14049811a91.26.1763405144456; Mon, 17 Nov 2025
 10:45:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251114193729.251892-1-ssranevjti@gmail.com> <aReUv1kVACh3UKv-@casper.infradead.org>
 <CANNWa07Y_GPKuYNQ0ncWHGa4KX91QFosz6WGJ9P6-AJQniD3zw@mail.gmail.com>
 <aRpQ7LTZDP-Xz-Sr@casper.infradead.org> <20251117164155.GB196362@frogsfrogsfrogs>
 <aRtjfN7sC6_Bv4bx@casper.infradead.org>
In-Reply-To: <aRtjfN7sC6_Bv4bx@casper.infradead.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 17 Nov 2025 10:45:31 -0800
X-Gm-Features: AWmQ_bnuhsyqplW3EwmS5X2rilTR8nQ_4xwujfWlx5dY8gU3dMEgLDCj7uI7O6I
Message-ID: <CAEf4BzZu+u-F9SjhcY5GN5vumOi6X=3AwUom+KJXeCpvC+-ppQ@mail.gmail.com>
Subject: Re: [PATCH] mm/filemap: fix NULL pointer dereference in do_read_cache_folio()
To: Matthew Wilcox <willy@infradead.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>, 
	akpm@linux-foundation.org, shakeel.butt@linux.dev, eddyz87@gmail.com, 
	andrii@kernel.org, ast@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ bpf@

On Mon, Nov 17, 2025 at 10:03=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Mon, Nov 17, 2025 at 08:41:55AM -0800, Darrick J. Wong wrote:
> > I wondered why this whole thing opencodes kernel_read, but then I
> > noticed zero fstests for it and decid*******************************
> > *****.
>
> I wondered the same thing!  And the answer is that it's special BPF
> stuff:
>
>         /* if sleeping is allowed, wait for the page, if necessary */
>         if (r->may_fault && (IS_ERR(r->folio) || !folio_test_uptodate(r->=
folio))) {
>                 filemap_invalidate_lock_shared(r->file->f_mapping);
>                 r->folio =3D read_cache_folio(r->file->f_mapping, file_of=
f >> PAGE_SHIFT,
>                                             NULL, r->file);
>                 filemap_invalidate_unlock_shared(r->file->f_mapping);
>         }
>
> if 'may_fault' (a misnomer since it really means "may sleep"), then we
> essentially do kernel_read().
>
> Now, maybe the right thing to do here is rip out almost all of
> lib/buildid.c and replace it with an iocb with IOCB_NOWAIT set (or not).
> I was hesitant to suggest this earlier as it's a bit of a big ask of
> someone who was just trying to submit a one-line change.  But now that
> "it's also shmem" has entered the picture, I'm leaning more towards this
> approach anyway.

As I replied on another email, ideally we'd have some low-level file
reading interface where we wouldn't have to know about secretmem, or
XFS+DAX, or whatever other unusual combination of conditions where
exposed internal APIs like filemap_get_folio() + read_cache_folio()
can crash.

The only real limitation is that we'd like to be able to control
whether we are ok sleeping or not, as this code can be called from
pretty much anywhere BPF might run, which includes NMI context.

Would this kiocb_read() approach work under those circumstances?

>
> Looking at it though, it's a bit weird that we don't have a
> kiocb_read().  It feels like __kernel_read() needs to be split into
> half like:
>
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 833bae068770..a3bf962836a7 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -503,14 +503,29 @@ static int warn_unsupported(struct file *file, cons=
t char *op)
>         return -EINVAL;
>  }
>
> -ssize_t __kernel_read(struct file *file, void *buf, size_t count, loff_t=
 *pos)
> +ssize_t kiocb_read(struct kiocb *iocb, void *buf, size_t count)
>  {
> +       struct file *file =3D iocb->ki_filp;
>         struct kvec iov =3D {
>                 .iov_base       =3D buf,
>                 .iov_len        =3D min_t(size_t, count, MAX_RW_COUNT),
>         };
> -       struct kiocb kiocb;
>         struct iov_iter iter;
> +       int ret;
> +
> +       iov_iter_kvec(&iter, ITER_DEST, &iov, 1, iov.iov_len);
> +       ret =3D file->f_op->read_iter(iocb, &iter);
> +       if (ret > 0) {
> +               fsnotify_access(file);
> +               add_rchar(current, ret);
> +       }
> +       inc_syscr(current);
> +       return ret;
> +}
> +
> +ssize_t __kernel_read(struct file *file, void *buf, size_t count, loff_t=
 *pos)
> +{
> +       struct kiocb kiocb;
>         ssize_t ret;
>
>         if (WARN_ON_ONCE(!(file->f_mode & FMODE_READ)))
> @@ -526,15 +541,9 @@ ssize_t __kernel_read(struct file *file, void *buf, =
size_t count, loff_t *pos)
>
>         init_sync_kiocb(&kiocb, file);
>         kiocb.ki_pos =3D pos ? *pos : 0;
> -       iov_iter_kvec(&iter, ITER_DEST, &iov, 1, iov.iov_len);
> -       ret =3D file->f_op->read_iter(&kiocb, &iter);
> -       if (ret > 0) {
> -               if (pos)
> -                       *pos =3D kiocb.ki_pos;
> -               fsnotify_access(file);
> -               add_rchar(current, ret);
> -       }
> -       inc_syscr(current);
> +       ret =3D kiocb_read(&kiocb, buf, count);
> +       if (pos && ret > 0)
> +               *pos =3D kiocb.ki_pos;
>         return ret;
>  }
>
