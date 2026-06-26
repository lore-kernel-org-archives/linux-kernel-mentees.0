Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE8A3F8715
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jun 2026 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484728; cv=pass; b=kwCX4ypdlpSMw3QLV2Yj5vuM2MGZO3+YfygX/MWXcXVwnITJnM9VEfHLgD/EO7YoDPMw3gFqVDK/Bw9QYQGsKfftKjLHuRwk8PRx+UTQBfw2i3TY41SuSv9ofH/h2Shx71W3X2LQE6X6ecfETtB8VopDQ7wK5ZxrjnssfLc1CaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484728; c=relaxed/simple;
	bh=JgIm8AA9Zjjh7D1ovkYcsrGMqQbcuYy0WQb7hHxtyiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMT0YPi8/xjJNTmOhr7495ac5WFPW7VL8GHw3fphgC456BqXhVKUjejw1wDFpMeWaZLip6Iy3+T1iO3YBZHR7ffBTgDzR5Zwun4ZB/iHwVbBAlYoa3qvcd8REnJkwboGruk1FNbWFcwcFAHuUaxMK+bg1tiHHpx4crEUePXJnds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTHJdEOw; arc=pass smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTHJdEOw"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB0F82136
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jun 2026 14:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRmlH-3b5F21 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2026 14:38:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=amir73il@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E13A482133
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13A482133
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qTHJdEOw
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E13A482133
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jun 2026 14:38:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-697f6c67028so2095802a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jun 2026 07:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782484723; cv=none;
        d=google.com; s=arc-20260327;
        b=Lq4uB59Jgt1YaDNGCe6wR4xFlgN88jzTiYtXSgn6v6dASt177RgnM6SR+MrYeIdzr8
         H4k+pJWMAZDRuMxZFGCwHqMb3Pdqk+9LiJhyGgtdQF6tFrj8l60z1N44rKu4Fj6jqXK/
         sB5VGIfoFkKkUuX46jboMyy9ZlFXpKDLJNzvsBeRLnU5tPHzehXNEc90StZzwuoBeQ88
         tYJG0aaahLKZRiHB9swoJvxd0dzL4TDx9RM2RO+VyhPgaNU1KaR3zY1T7xnE6t55sq5I
         mtLk2sAb9L5MeMH7AHy05w4yTcYDWNmw2CUn7BE0YXVCcgUvpZqI6Q4oAScArWoZrNDV
         e34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NZkDpMwweXCiqfWsJ0lGNfjpMrHkvZ0iw15/OwY52I=;
        fh=W3mb5nwyt5V3NMaieeq/XIKgmV8hETz0zMZfPnXKts4=;
        b=AcCYGbg/5gh/44kcrs2S/AAwWCwl5eydBuMQO9D6S2Ry9a7mcTDHzn3BZirQi9K/ZX
         RPChGbMsp3xw2CYfKoOU00kq53W6dhT5nWWwnMVivqsVpk5k/nybvgbeaozLIxWBeNQH
         CahhcydHf70YnOCI7TFcPbodU2xwHmxyxwc9dmT0K/p9/B8iMNBrJw/mq3Xwn6PUoVuQ
         Jz+Ui4LAXf5IYELN6cZWLQVfGzD3xongiK7+NjB0LkxsYhsDjUlvYhqC/Wuwe5Z+1dZO
         SUCcsXjNWC1vFAxYaD14aFGMczTBA6Crdv0ll9ix4J4qZFIm7D32jRTig3C1tP40Htqe
         IX2g==;
        darn=lists.linuxfoundation.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782484723; x=1783089523; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NZkDpMwweXCiqfWsJ0lGNfjpMrHkvZ0iw15/OwY52I=;
        b=qTHJdEOwncAvt7ZtPHdnUBtwsmkqNuAXI3xtHqOAqMlD4C6X5kTh6ZhuyA7mpTfYSG
         t+4T5jN7Tr3Mz+0EHYkjH8S/jLxgoVApS4/VA6w2agpiFyuJE7cL8iDGGDNefhfIgGh0
         jrcMuD+gUd3Ij5R6g3hwfE6iadGpyBk0STIt8dNZkkASh5mo/YR+QU/91EOhyAVNnjXb
         jb60MKGdY7c/aFKf1vyKorVAz20ppgXhn2ozK6lYw8qXONGcwb7oXFlB8GKPlYjLfVYJ
         DSiXtU74kwQwsXLaLBUgxKaqEi5j11JqJ3DNxgv2YTlukAJy2ov//cWLPTA+BCRQjVAG
         sQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484723; x=1783089523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NZkDpMwweXCiqfWsJ0lGNfjpMrHkvZ0iw15/OwY52I=;
        b=EUoK9dnzFzcUz5ri1R/IVUlne5yrNTUoP+LPLWb/P/eLI5XqrI2gJ4qTEkODE7Zj61
         NMifs5jOzFYb2lS6MUt28uoroXGWGFKZydJ8FqVDH07wvQA3RUz//xa11X2DwgtU6U57
         AcXz/KslHTdEWkuimgX1Ue6O0Cdiz4Xi89X0GcwF/1HHf0D+RVIRYkYBHHcJshj9Kl5k
         VRRmj5ehawxe3c8/5xRtYfYrESN7AtwfJ6ZKgZUxoxnnbtsjHTEONMXAjicJjyWZl9mn
         oUBkhIIYTVS5qK4HOU6EACb0mUeIbudgrt8jyOBq/SbHcprJPbItr2mco12T7k3X8AvY
         BJpA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+5Ga0KApsOWrjlORiANdtVaK72gcoaz3A7GZVHtHq6IpS1a9hzHgT61IaKb/L3AzH9p1jOHVZa1TBTvUpcd6qvzqDNQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzV7Ck2xJdC2fRDE/qXdg4zIGpGk5uhTD53jkTxNlR4BYQ5na9W
	G+nxwV22YpCG9zJzhb1VcItpqhz89J5jyP2bh7+f4yDVXJYr/zfo6TOTZVfDChFNXN3HAW/B2C4
	GLIPLKXTZXs4VbKaAojlL2HyexJwbB0I=
X-Gm-Gg: AfdE7clyy0MP3fey7YAEJHknOONgK9QhSSBFiGyZ4EeIH8xrvldKltwKhXU/qwLDTk8
	DwvW6QeNHJupRSsBsmo7eoe+cvBBmhZ8O7+JKGKHrZfIJpc6vVriMGeayEPO9f1abEGCSqkSMIp
	YiN0F85waXgSyVQVFk49oIBtiBzs5oQvQzoeduculzQ2IvsdZU9PB+BbIZ7RbmqJTGm+Rpdj8jQ
	nisMaS8tjIuZGvvq9VV4CwnbhLFeL418+nkuCjufgsRvdM0XIBREdCaPnBF5dhkJY8SDkTKL50v
	vzrjEQ08Bmqg8Xoi2rYYgpgF7l4lk+A=
X-Received: by 2002:a05:6402:285:b0:698:3b7b:e488 with SMTP id
 4fb4d7f45d1cf-6983b7bed03mr119681a12.20.1782484722944; Fri, 26 Jun 2026
 07:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com> <20260626125131.2117-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260626125131.2117-1-mahad.ibrahim.dev@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 26 Jun 2026 16:38:31 +0200
X-Gm-Features: AVVi8CeM-RNwVAqreeV_Nwx16YD-9KXFumzlmVWJuV8CDE9zGnWPYkQd3pEMU38
Message-ID: <CAOQ4uxgX0Oqc+KnEHx6n01UfNQAOPfk3m2rQ3vYTGM98HOV0Yw@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: replace passthrough backing-id IDR with a
 counter and hashtable
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	Joanne Koong <joannelkoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 2:51=E2=80=AFPM Mahad Ibrahim
<mahad.ibrahim.dev@gmail.com> wrote:
>
> The passthrough backing-id IDR carries a /* FIXME: xarray might be space
> inefficient */ on its idr_alloc_cyclic() call. Replace it with a cyclic
> counter for allocation and a hashtable for lookup.
>
> The hashtable keys are already the set of live ids, so allocation needs
> only a counter: it takes the next value, skipping any already present,
> all under fc->lock. A live-id count makes it return -ENOSPC when full.
>
> The hashtable is allocated lazily when passthrough is negotiated, so it i=
s
> present whenever passthrough is enabled; every dereference is already gat=
ed
> on fc->passthrough, so no NULL checks are added. On allocation failure
> passthrough is left off and the mount continues.
>
> Lookup is now O(chain) rather than the IDR's bounded walk, but runs only =
at
> backing setup, off the read/write path.
>
> Testing
>
> Tested under KASAN and KCSAN in separate builds, since the two cannot be
> enabled together. The workload was passthrough_hp under fio with parallel
> open/close churn; ftrace confirmed concurrent allocation, lookup, and
> removal across CPUs. No KASAN use-after-free and no KCSAN data race in
> fs/fuse/backing.c.
>
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
>
> ---
>
> v2:
>  - drop the IDA; allocate with a cyclic counter and resolve collisions
>    via the hashtable's membership check under fc->lock (Miklos)
>  - add a live-id count to bound allocation and return -ENOSPC when full
>
> Uniqueness now comes from the hashtable rather than an allocator that own=
s
> the id space, so this should stay clear of any future 64-bit or
> user-assigned-id work. The id is kept 32-bit and kernel-allocated here.
>
> Lookup uses 256 fixed buckets, so chains lengthen at very high backing
> counts; an rhashtable would keep it flat but adds complexity. The fixed
> table seemed simpler for the expected counts - happy to switch if you'd
> prefer.
>
>  fs/fuse/backing.c | 98 +++++++++++++++++++++++++++++++++++++----------
>  fs/fuse/fuse_i.h  | 31 +++++++++++++--
>  fs/fuse/inode.c   |  8 ++--
>  3 files changed, 111 insertions(+), 26 deletions(-)
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 472b6afa7dff..77f4d4b00bf4 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -35,49 +35,99 @@ void fuse_backing_put(struct fuse_backing *fb)
>
>  void fuse_backing_files_init(struct fuse_conn *fc)
>  {
> -       idr_init(&fc->backing_files_map);
> +       fc->backing_ids_count =3D 0;
> +       fc->backing_files_next_id =3D 1;

looks like your first alloc will be 2.

> +       fc->backing_htable =3D NULL;
>  }
>
>  static int fuse_backing_id_alloc(struct fuse_conn *fc, struct fuse_backi=
ng *fb)
>  {
>         int id;
> +       struct fuse_backing *iterator;
>
> -       idr_preload(GFP_KERNEL);
>         spin_lock(&fc->lock);
> -       /* FIXME: xarray might be space inefficient */
> -       id =3D idr_alloc_cyclic(&fc->backing_files_map, fb, 1, 0, GFP_ATO=
MIC);
> +
> +       if (fc->backing_ids_count =3D=3D INT_MAX) {
> +               id =3D -ENOSPC;
> +               goto out;
> +       }
> +
> +retry:
> +       id =3D fc->backing_files_next_id;
> +       fc->backing_files_next_id =3D (id =3D=3D INT_MAX) ? 1 : id + 1;
> +
> +       hash_for_each_possible(fc->backing_htable->backing_files_ht,
> +                              iterator, node, id) {
> +               if (iterator->id =3D=3D id)
> +                       goto retry;
> +       }

The hash table change is good but this allocator I really hate.
I know that Miklos proposed this, but the way it is implemented can
cause soft lockup and in general if you are implementing an allocator
you are probably doing it wrong.

Also I am concerned that with Joanne's backing inode patches,
backing id maps may be a lot more dense and backing id's a lot more
long lived than with backing id's for open/close lifecycle.

I think it was a mistake to provide a kernel allocator for backing ids -
the server is responsible for every other aspect of managing backing files.

Can we still salvage this UAPI?

Maybe:
1. Do not goto retry, instead return -EAGAIN let userspace retry
2. fuse_passthrough_open() can implement the retry loop
3. At least until INT_MAX, EAGAIN is not expected and for existing servers
    with short file open/close lifecycles, EAGAIN should be rare
4. Server/libfuse know exactly which backing ids are allocated,
    so they can use whatever algorithm they like for efficient allocation
5. All we need to do is support server allocated backing id
    and check it against the hash table lookup

+#define FUSE_BACKING_FLAG_SERVER_ID 1
+
 struct fuse_backing_map {
        int32_t         fd;
        uint32_t        flags;
-       uint64_t        padding;
+       uint64_t        id;
 };

It should be a very minimal addition to implement this.
BTW, we make it 64bit for future extensions (such as backing stripe)
although OPEN response still supports only 32bit backing ids.

Will this cause regressions?

Maybe, but I think that the existing users of fuse passthrough are
still pretty close to upstream and not yet in distributed servers (?)
so I hope this will be fine - if not, there are solutions.

Miklos, do you agree?

> +
> +       fb->id =3D id;
> +       hash_add_rcu(fc->backing_htable->backing_files_ht, &fb->node, id)=
;
> +       fc->backing_ids_count++;
> +
> +out:
>         spin_unlock(&fc->lock);
> -       idr_preload_end();
>
> -       WARN_ON_ONCE(id =3D=3D 0);
>         return id;
>  }
>
> +int fuse_backing_htable_alloc(struct fuse_conn *fc)
> +{
> +       struct fuse_backing_htable *ht;
> +
> +       ht =3D kzalloc_obj(struct fuse_backing_htable);
> +       if (!ht)
> +               return -ENOMEM;
> +
> +       hash_init(ht->backing_files_ht);
> +       fc->backing_htable =3D ht;
> +
> +       return 0;
> +}
> +
>  static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc,
>                                                    int id)
>  {
> -       struct fuse_backing *fb;
> +       struct fuse_backing *iterator;
> +       struct fuse_backing *fb =3D NULL;
>
>         spin_lock(&fc->lock);
> -       fb =3D idr_remove(&fc->backing_files_map, id);
> +       hash_for_each_possible(fc->backing_htable->backing_files_ht,
> +                              iterator, node, id) {
> +               if (iterator->id =3D=3D id) {
> +                       hash_del_rcu(&iterator->node);
> +                       fb =3D iterator;
> +                       break;

This fb may very likely be alive and referenced by an open
file, so the very least is to set fb->id =3D 0, to make it anonymous,
so debug prints won't show different fb's with the same id.

> +               }
> +       }
> +
> +       if (fb)
> +               fc->backing_ids_count--;
> +
>         spin_unlock(&fc->lock);
>
>         return fb;
>  }
>
> -static int fuse_backing_id_free(int id, void *p, void *data)
> +void fuse_backing_files_free(struct fuse_conn *fc)
>  {
> -       struct fuse_backing *fb =3D p;
> +       struct fuse_backing *fb;
> +       struct hlist_node *tmp;
> +       int bkt;
>
> -       WARN_ON_ONCE(refcount_read(&fb->count) !=3D 1);
> -       fuse_backing_free(fb);
> -       return 0;
> -}
> +       if (!fc->backing_htable)
> +               return;
>
> -void fuse_backing_files_free(struct fuse_conn *fc)
> -{
> -       idr_for_each(&fc->backing_files_map, fuse_backing_id_free, NULL);
> -       idr_destroy(&fc->backing_files_map);
> +       hash_for_each_safe(fc->backing_htable->backing_files_ht,
> +                          bkt, tmp, fb, node) {
> +               hash_del_rcu(&fb->node);
> +               WARN_ON_ONCE(refcount_read(&fb->count) !=3D 1);
> +               fuse_backing_free(fb);
> +       }
> +
> +       kfree(fc->backing_htable);
> +       fc->backing_htable =3D NULL;
>  }
>
>  int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map=
)
> @@ -169,10 +219,18 @@ int fuse_backing_close(struct fuse_conn *fc, int ba=
cking_id)
>
>  struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backi=
ng_id)
>  {
> -       struct fuse_backing *fb;
> +       struct fuse_backing *iterator;
> +       struct fuse_backing *fb =3D NULL;
>
>         rcu_read_lock();
> -       fb =3D idr_find(&fc->backing_files_map, backing_id);
> +       hash_for_each_possible_rcu(fc->backing_htable->backing_files_ht,
> +                                  iterator, node, backing_id) {
> +               if (iterator->id =3D=3D backing_id) {
> +                       fb =3D iterator;
> +                       break;
> +               }
> +       }
> +
>         fb =3D fuse_backing_get(fb);
>         rcu_read_unlock();
>
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 85f738c53122..db4c07a496f0 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -30,6 +30,7 @@
>  #include <linux/pid_namespace.h>
>  #include <linux/refcount.h>
>  #include <linux/user_namespace.h>
> +#include <linux/hashtable.h>
>
>  /** Default max number of pages that can be used in a single read reques=
t */
>  #define FUSE_DEFAULT_MAX_PAGES_PER_REQ 32
> @@ -94,6 +95,10 @@ struct fuse_backing {
>         /* refcount */
>         refcount_t count;
>         struct rcu_head rcu;
> +
> +       /* ID Allocation */
> +       int id;

move this to the hole next to count.

Mahad,

I am guessing that you are a student doing a summer project?
and you picked up on the FIXME comment?
It's fine, no complaints about that, but TBH, I don't know that there
is huge value to real life users
from making this change, because the measurements were not done on
real life workloads.

However, I do know that there are real users who would benefit from moving =
the
allocator to userspace, so by slightly changing your plan you could also he=
lp
real users and learn how real upstream development works.

Thanks,
Amir.
