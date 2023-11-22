Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878038472
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 02:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8qKtdM1"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F308660FE1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 02:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F308660FE1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U8qKtdM1
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-z--i7PM2wa
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 22 Nov 2023 02:28:07 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 334A1606D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 02:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 334A1606D3
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c1acc1fa98so306495a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 18:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700620086; x=1701224886; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfTZswEnYt7aHpTJOx6kD98hPK28QoQ/YumgrlaBkC0=;
        b=U8qKtdM1TFxlrcJMyNGwg1peOqS7TYEvkm4XvNPD+qTDxHB4A8RZQaoKxS/EIOGa2G
         HBFmYKPuihMfHIUBFd7YJ+WhuvU1Kz4iw4X99Tib6tK0fGFR8x9G5rEnvqSxwnhWl3xT
         X2EPn8BC+j1+vdx1VdUnigqj12TsrGzVL8ZQGuDYHfABEjoluRpKo4IkxkeCsoAO5VIv
         1AC1uuRO/GX0agC+DHroY23npic23pfoSI0tyZJs+ZQGjggSs548s2SPNMTrU3BbjIP3
         tb2VgnbO32EyWP5fVeC9dsghaBzPa/33Ub/72eIFzFS5Aq3ll7rGySLTbDKxRX2CEyJu
         Q2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620086; x=1701224886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfTZswEnYt7aHpTJOx6kD98hPK28QoQ/YumgrlaBkC0=;
        b=DkN9pYKhSJAI1mnpJ9p/fZdfZE4wJBNxLHUwgQ5H1gg6f5ISVmFQMe6TKa1IePeseq
         H+hkP1145H5cm9dpN1I3bP5du7dXifQ5/XuivslhjVhiqw92oaZElDF5COXEmVQAoCru
         l9YC48Byb63iG5o3Ur2EMFdRN90LQCkQvnwbIILu1ece7n8plSx7ToGenQizgUPbQH06
         Uw6bWh6i1SLqhXHBVm81QEpqNYwu6kqywpJ9LVHIDsvnst9kdCPeugHgQrafeN9LPC4v
         r935KS12TmTN0FKNVGKH25A9vX/KLHdP3BbIE57RhIxPRlgUq2Poc+WABNOfuyKbeRXs
         C7Yg==
X-Gm-Message-State: AOJu0YxxIB+gIFtbCtD7smy0peniA7cYlDVNA98eNWQrDkFzUkU/zDco
	BhTcQ5Vd/+2j6Rv46lsmKKdW/9V8WQIS+WP1530=
X-Google-Smtp-Source: AGHT+IHAMQ+tOeNRO2k3sRkUVDLcsPWJuo4/OHgwq3ka2J+5TxYjwdPReGcf9/rYE3eK82vEcdhwoQgJh8lBrOuobi0=
X-Received: by 2002:a17:90a:fe90:b0:280:4a23:3c84 with SMTP id
 co16-20020a17090afe9000b002804a233c84mr6491607pjb.22.1700620086495; Tue, 21
 Nov 2023 18:28:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <VI1P193MB0752C0ADCF4F90AE8368C0B399BBA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752C0ADCF4F90AE8368C0B399BBA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 22 Nov 2023 03:27:55 +0100
Message-ID: <CA+fCnZfBM=UU0AyArERNMxBMeaPvbV-e6uyQDpwgqA5c6_f_DQ@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: Improve free meta storage in Generic KASAN
To: Juntong Deng <juntong.deng@outlook.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, akpm@linux-foundation.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 10:42=E2=80=AFPM Juntong Deng <juntong.deng@outlook=
.com> wrote:
>
> Currently free meta can only be stored in object if the object is
> not smaller than free meta.
>
> After the improvement, even when the object is smaller than free meta,
> it is still possible to store part of the free meta in the object,
> reducing the increased size of the redzone.
>
> Example:
>
> free meta size: 16 bytes
> alloc meta size: 16 bytes
> object size: 8 bytes
> optimal redzone size (object_size <=3D 64): 16 bytes
>
> Before improvement:
> actual redzone size =3D alloc meta size + free meta size =3D 32 bytes
>
> After improvement:
> actual redzone size =3D alloc meta size + (free meta size - object size)
>                     =3D 24 bytes
>
> Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>

I think this change as is does not work well with slub_debug.

slub_debug puts its metadata (redzone, tracks, and orig_size) right
after the object (see calculate_sizes and the comment before
check_pad_bytes). With the current code, KASAN's free meta either fits
within the object or is placed after the slub_debug metadata and
everything works well. With this change, KASAN's free meta tail goes
right past object_size, overlaps with the slub_debug metadata, and
thus can corrupt it.

Thus, to make this patch work properly, we need to carefully think
about all metadatas layout and teach slub_debug that KASAN's free meta
can go past object_size. Possibly, adjusting s->inuse by the size of
KASAN's metas (along with moving kasan_cache_create and fixing up
set_orig_size) would be enough. But I'm not familiar with the
slub_debug code enough to be sure.

If you decide to proceed with improving this change, I've left some
comments for the current code below.

Thank you!

> ---
> V1 -> V2: Make kasan_metadata_size() adapt to the improved
> free meta storage
>
>  mm/kasan/generic.c | 50 +++++++++++++++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 16 deletions(-)
>
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index 4d837ab83f08..802c738738d7 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -361,6 +361,8 @@ void kasan_cache_create(struct kmem_cache *cache, uns=
igned int *size,
>  {
>         unsigned int ok_size;
>         unsigned int optimal_size;
> +       unsigned int rem_free_meta_size;
> +       unsigned int orig_alloc_meta_offset;
>
>         if (!kasan_requires_meta())
>                 return;
> @@ -394,6 +396,9 @@ void kasan_cache_create(struct kmem_cache *cache, uns=
igned int *size,
>                 /* Continue, since free meta might still fit. */
>         }
>
> +       ok_size =3D *size;
> +       orig_alloc_meta_offset =3D cache->kasan_info.alloc_meta_offset;
> +
>         /*
>          * Add free meta into redzone when it's not possible to store
>          * it in the object. This is the case when:
> @@ -401,21 +406,26 @@ void kasan_cache_create(struct kmem_cache *cache, u=
nsigned int *size,
>          *    be touched after it was freed, or
>          * 2. Object has a constructor, which means it's expected to
>          *    retain its content until the next allocation, or

Please drop "or" on the line above.

> -        * 3. Object is too small.
>          * Otherwise cache->kasan_info.free_meta_offset =3D 0 is implied.
> +        * Even if the object is smaller than free meta, it is still
> +        * possible to store part of the free meta in the object.
>          */
> -       if ((cache->flags & SLAB_TYPESAFE_BY_RCU) || cache->ctor ||
> -           cache->object_size < sizeof(struct kasan_free_meta)) {
> -               ok_size =3D *size;
> -
> +       if ((cache->flags & SLAB_TYPESAFE_BY_RCU) || cache->ctor) {
>                 cache->kasan_info.free_meta_offset =3D *size;
>                 *size +=3D sizeof(struct kasan_free_meta);
> +       } else if (cache->object_size < sizeof(struct kasan_free_meta)) {
> +               rem_free_meta_size =3D sizeof(struct kasan_free_meta) -
> +                                                               cache->ob=
ject_size;
> +               *size +=3D rem_free_meta_size;
> +               if (cache->kasan_info.alloc_meta_offset !=3D 0)
> +                       cache->kasan_info.alloc_meta_offset +=3D rem_free=
_meta_size;
> +       }
>
> -               /* If free meta doesn't fit, don't add it. */
> -               if (*size > KMALLOC_MAX_SIZE) {
> -                       cache->kasan_info.free_meta_offset =3D KASAN_NO_F=
REE_META;
> -                       *size =3D ok_size;
> -               }
> +       /* If free meta doesn't fit, don't add it. */
> +       if (*size > KMALLOC_MAX_SIZE) {
> +               cache->kasan_info.free_meta_offset =3D KASAN_NO_FREE_META=
;
> +               cache->kasan_info.alloc_meta_offset =3D orig_alloc_meta_o=
ffset;
> +               *size =3D ok_size;
>         }
>
>         /* Calculate size with optimal redzone. */
> @@ -464,12 +474,20 @@ size_t kasan_metadata_size(struct kmem_cache *cache=
, bool in_object)
>         if (in_object)
>                 return (info->free_meta_offset ?
>                         0 : sizeof(struct kasan_free_meta));

This needs to be changed as well to something like min(cache->object,
sizeof(struct kasan_free_meta)). However, with the slub_debug
conflicts I mentioned above, we might need to change this to something
else.



> -       else
> -               return (info->alloc_meta_offset ?
> -                       sizeof(struct kasan_alloc_meta) : 0) +
> -                       ((info->free_meta_offset &&
> -                       info->free_meta_offset !=3D KASAN_NO_FREE_META) ?
> -                       sizeof(struct kasan_free_meta) : 0);
> +       else {
> +               size_t alloc_meta_size =3D info->alloc_meta_offset ?
> +                                                               sizeof(st=
ruct kasan_alloc_meta) : 0;
> +               size_t free_meta_size =3D 0;
> +
> +               if (info->free_meta_offset !=3D KASAN_NO_FREE_META) {
> +                       if (info->free_meta_offset)
> +                               free_meta_size =3D sizeof(struct kasan_fr=
ee_meta);
> +                       else if (cache->object_size < sizeof(struct kasan=
_free_meta))
> +                               free_meta_size =3D sizeof(struct kasan_fr=
ee_meta) -
> +                                                                       c=
ache->object_size;
> +               }
> +               return alloc_meta_size + free_meta_size;
> +       }
>  }
>
>  static void __kasan_record_aux_stack(void *addr, bool can_alloc)
> --
> 2.39.2
