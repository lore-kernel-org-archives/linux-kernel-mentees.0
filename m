Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0152B2417DE
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 15:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782661598; cv=pass; b=i645t/hLnpDERvWtFOELIx8n4KNqqelEfHz026SbuyDuo4j/CMtle653kLtxrPenOVzC3SpjQMHw4PgrwhD9h/VcBt8krrdjqnFOkDDlAYdP+suif+tjFqXXh3lXiA2XpdImS/Vun2cTJ5m5WSz8CZh4QGiL76zese3NGaeHoOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782661598; c=relaxed/simple;
	bh=mdUFdyP/nhhnBe5dNeChW8hWoOFKVd+UnuxhJd/prVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIqZhVzREKE6FQyFLYW2QDYOuXhnKU4xLwM8oLtXHDksZ4lAycG0OKAFloL/KzCPSwimff+cqiZ8A9jrVdi5iw6h48tEE8S4DO3lCIYN1CqmDkTj2wOkZuATAZITjPJmRywrfu4Ms4B+l7hI7/wf5vue415HGVvRvelLjD9iyCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggoJ9T2+; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggoJ9T2+"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43cce34c881so1548525fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 08:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782661595; cv=none;
        d=google.com; s=arc-20260327;
        b=KXM8v7c2H/1sE0JCkzDRJxtt23sGqU+MPTJbYtjw3Ey0sK+7MOCvlYfdcMIUgwsBhB
         tCRv33ZaEnvFcl3zrhybrpbeCHvaVbafmJIpyQ4P2CvzNMl4UmX9/e1cbpYwRcUr61L2
         Ai843dHuCkmd/rGwRtOI+ABqq4Iy8EAeo0oiXkuwSR6JHUHF2rzRj56dA+gf0jZaI3CI
         PtjiFDePw6DHKCJMY9cL5NriUdfL4kWcSLn/V4jqwv8B0/ruk6oGCN02ZzladiFrH4Tf
         kDtl2oPGJxmzQqBORFNb/Jt+XJJ6aDlOD/NVE0TQEzwvduW8JnOXyWIlrOG6Sr5BcgvW
         A3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TwK/D+sxvlgb/lYLKarrnyvpZOyu6UoNhP89AnfQs5Y=;
        fh=4ygHPyEWzd5GtiQPm6GgfYRblSRnfryQuCVNSsIqdNM=;
        b=bcd5IEbfoOFMjE6/FdBvm2GaS6SbQ6D6OtZEH3CVE0j6YfiOQZIjYB3a83miE90KPP
         ks/t2Le5S2Xl4jfKG+g3YWlPA1S6q1Z4j/gJj1dAnFOhlDdfVgYNF+QSvlSo9LGDcxBB
         yZ5CiaSGWjSTGuLOahDXKL2L0yyjsryLp0qA9qj5ZAOayMaCrHnwVW3U4EL7IyN2ND2U
         MIodbcq5ZuaBQ+lPgC/Lb8kbtwGkvlvmSeD7v9ikigeSN738Q8ugG5tcA5M0mrWM7kW7
         RFpscBFfPiq9mbQSvrwBv31p3awfAPJ1kZ6xeumQpy2xrRw3S0edMYS5k2nUzMJttnmh
         +OzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782661595; x=1783266395; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwK/D+sxvlgb/lYLKarrnyvpZOyu6UoNhP89AnfQs5Y=;
        b=ggoJ9T2+WjIiqZNziGKrfP5kRm7SpSUwWIvnGga7DUTICPxd2OALtMoVqu4YJyBPWe
         dLuXZQAYjEG6EtKbhDXeHA05k2k5T1Kk8ay+bTrVE2ajsZgQ7f+oG3DCfRv03+RCPBKj
         o0L+U7tnG38ZE5VMNSAEfIzj2gGlMENOPwd1inrmjaBaF65Kgrk1p78GCWyQlz9VfoNi
         i2xidhiUQO5d78cG+wJXJ3S6km+07vFHXzPMqkemnceRr4wvw3ZD/H4qrUwA/X1opsQh
         HZ6tWO753CS+HpLx4i/Hd57aH3Rf6+JKPWanMLsa6Z1+2mKsAyLyfng8fQf/wROlQHxs
         o6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782661595; x=1783266395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TwK/D+sxvlgb/lYLKarrnyvpZOyu6UoNhP89AnfQs5Y=;
        b=sM9nWx3+G7vr6ZZHEs/EAYtbW5Yr+9fM9PeEgU4fBXhyBdHsj7zhDX6etuHePVbrdc
         r4W0n/m4oGtUBQadoaz/NNkHAjvF2aYrJv6TDJb6l/UA/yUeDqX1bkoVRCqLE/JpVMVL
         cLCAVylbBcPcvpeRpU8EvIhCGZwJtwf6IfnTTM+IXi5YioNMFti6VajAGn9IiHnQWhtX
         nVFDHfWtCU/5779bvZxYXkrCrH8CrHgHhVZ0WPjJ1o9x/jlcBRu39fE4M8vvFC8M0zRV
         NMDcG/j8oank3rW1FeY/zPQJqmPo/Eom0WLqno9AG1tbT51Im2x8dHgjlNWGLxMgKeit
         kJhA==
X-Forwarded-Encrypted: i=1; AHgh+RqFP1l8WtNMN6TvPui3U/bjtiaCtxafeI95oMEklPgFk/dTKPxJNack+XTt8jkQ2OxkpiIFp0bjrwNfGYqOeK/V125UjA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yybt5p5a815Vdl5wSqnyYRpBkkEX1IgUyy9mtbT2PTvexkab/6+
	w7JtDcW8O04ivR4QynnJskGzty28FuDcuKadqXaRviZLSVt7tNybLSXHQOJZ0YudTsH7zkk+lPw
	fRf+Xy6Su+AGXuL9mwVF1NYUFfljAEgA=
X-Gm-Gg: AfdE7ckZQiWIvSI0oCAPhnotttVA8ShthCjaedXnhPnvbwDPAFy+hoLsN5kZagWIxlf
	0i6HptNy6u83+9rZ0JmzBuIiP4WXHEm4AvNQX1huA3bKvR0vXquODfLsOn4jstxR+lEsFfP7kV4
	4XMdTTTRyiGC3Vz4bTHkTvywVLzBFsKfT+DVAp2m687nSsBTFd5PIAMNhqhU0tc+qxGGwoYsvqY
	GALyTKMJ5ERGmB+kw/HER7Bi5MPWSEYzyWSd8BB3eoRdCghWRqUQUfQzs+z+jdb7N2e3YTbR4Fp
	hleRp477mca8ENNufhnAdLhJ+tQcir5JaPio
X-Received: by 2002:a05:6870:658e:b0:448:5591:15d9 with SMTP id
 586e51a60fabf-448559126f7mr4849762fac.37.1782661594757; Sun, 28 Jun 2026
 08:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628154051.232214-1-megia.oscar@gmail.com>
In-Reply-To: <20260628154051.232214-1-megia.oscar@gmail.com>
From: David Kahurani <k.kahurani@gmail.com>
Date: Sun, 28 Jun 2026 18:46:23 +0300
X-Gm-Features: AVVi8CeTf6DizADkLm61AypxDKstCAaBxgLYQTdLkrxOaMXxh3_00Jp7bzgcmN8
Message-ID: <CAAZOf24EO8Aiu=nOzzKCPBzgwvJ+Kw=PaWNyOPP4L1A8PfduMg@mail.gmail.com>
Subject: Re: [PATCH v2] Memory leak error in qxl unbind
To: =?UTF-8?B?w5NzY2FyIE1lZ8OtYSBMw7NwZXo=?= <megia.oscar@gmail.com>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel-mentees@lists.linux.dev, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 6:41=E2=80=AFPM =C3=93scar Meg=C3=ADa L=C3=B3pez <m=
egia.oscar@gmail.com> wrote:
>
> I discovered OOM after run script below around two hours in my computer:
>
> while :; do
>     echo [pci qxl id] > /sys/bus/pci/drivers/qxl/unbind
>     echo [pci qxl id] > /sys/bus/pci/drivers/qxl/bind
> done
>
> If you run 10000 times above script kmemleak does not report any
> memory leak, but if you run above script about two hours several
> OOM ocurs and at the end kernel panic.
>
> The OOM isn't just a simple leak; it's a refcount corruption that renders
> the list_lru fix dead code after the first mid-init failure.
>
> Here's the chain:
>
> Bug 1: ttm_global_init ignores ttm_pool_mgr_init() return
> If shrinker_alloc() fails under memory pressure, ttm_pool_mgr_init
> returns -ENOMEM with pool types already initialized (64 list_lru_init
> calls done). ttm_global_init ignored this and returned 0, leaving orphane=
d
> pool types with a NULL mm_shrinker.
>
> Fix: Check ret from ttm_pool_mgr_init; if non-zero, goto out cleans up
> refcount + debugfs.
>
> Bug 2: ttm_pool_mgr_init leaks pool types on shrinker_alloc failure
> If shrinker_alloc fails after all 64 pool types were list_lru_init'd,
> the function returned -ENOMEM without undoing them. With Bug 1 now
> triggering proper error handling, this undo is necessary.
>
> Fix: err_shrinker: label that finalizes + destroys all 64 pool types
> before returning.
>
> You must apply the patch from the link "[PATCH v2] drm/qxl: fix
> use-after-free to qxl_irq_handler in PCI mode" before testing.
> If you don't apply this patch, you will get a UAF error when running
> the script above.
>
> Assisted-by: OpenCode:1.17.8-Big Pickle
> Link: https://lore.kernel.org/virtualization/20260627105445.89827-2-megia=
.oscar@gmail.com/T/#u
> Signed-off-by: =C3=93scar Meg=C3=ADa L=C3=B3pez <megia.oscar@gmail.com>
> ---
>  drivers/gpu/drm/ttm/ttm_device.c |  5 ++++-
>  drivers/gpu/drm/ttm/ttm_pool.c   | 37 ++++++++++++++++++++++++++------
>  include/drm/ttm/ttm_pool.h       |  2 ++
>  3 files changed, 37 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index d3bfb9a696a7..c880a0430363 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -96,7 +96,10 @@ static int ttm_global_init(void)
>                 >> PAGE_SHIFT;
>         num_dma32 =3D min(num_dma32, 2UL << (30 - PAGE_SHIFT));
>
> -       ttm_pool_mgr_init(num_pages);
> +       ret =3D ttm_pool_mgr_init(num_pages);
> +       if (ret)
> +               goto out;
> +
>         ttm_tt_mgr_init(num_pages, num_dma32);
>
>         glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32 |
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 278bbe7a11ad..e0c82804a07d 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1198,6 +1198,17 @@ void ttm_pool_fini(struct ttm_pool *pool)
>          * that no shrinker is concurrently freeing pages from the pool.
>          */
>         ttm_pool_synchronize_shrinkers();
> +
> +       for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> +               for (j =3D 0; j < NR_PAGE_ORDERS; ++j) {
> +                       struct ttm_pool_type *pt;
> +
> +                       pt =3D ttm_pool_select_type(pool, i, j);
> +                       if (pt !=3D &pool->caching[i].orders[j])
> +                               continue;
> +                       list_lru_destroy(&pt->pages);
> +               }
> +       }
>  }
>  EXPORT_SYMBOL(ttm_pool_fini);
>
> @@ -1386,6 +1397,7 @@ static inline u64 ttm_get_node_memory_size(int nid)
>  int ttm_pool_mgr_init(unsigned long num_pages)
>  {
>         unsigned int i;
> +       int ret =3D 0;
>
>         int nid;
>         for_each_node(nid) {
> @@ -1423,8 +1435,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  #endif
>
>         mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool=
");
> -       if (!mm_shrinker)
> -               return -ENOMEM;
> +       if (!mm_shrinker) {
> +               ret =3D -ENOMEM;
> +               goto err_shrinker;
> +       }
>
>         mm_shrinker->count_objects =3D ttm_pool_shrinker_count;
>         mm_shrinker->scan_objects =3D ttm_pool_shrinker_scan;
> @@ -1434,6 +1448,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>         shrinker_register(mm_shrinker);
>
>         return 0;
> +
> +err_shrinker:
> +       ttm_pool_type_fini_and_list_lru_destroy();
> +       return ret;
>  }
>
>  /**
> @@ -1442,17 +1460,24 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   * Cleanup the global pools and unregister the MM shrinker.
>   */
>  void ttm_pool_mgr_fini(void)
> +{
> +       shrinker_free(mm_shrinker);
> +       ttm_pool_type_fini_and_list_lru_destroy();
> +       WARN_ON(!list_empty(&shrinker_list));
> +}
> +
> +void ttm_pool_type_fini_and_list_lru_destroy(void)
>  {
>         unsigned int i;
>
>         for (i =3D 0; i < NR_PAGE_ORDERS; ++i) {
>                 ttm_pool_type_fini(&global_write_combined[i]);
> +               list_lru_destroy(&global_write_combined[i].pages);
>                 ttm_pool_type_fini(&global_uncached[i]);
> -
> +               list_lru_destroy(&global_uncached[i].pages);
>                 ttm_pool_type_fini(&global_dma32_write_combined[i]);
> +               list_lru_destroy(&global_dma32_write_combined[i].pages);
>                 ttm_pool_type_fini(&global_dma32_uncached[i]);
> +               list_lru_destroy(&global_dma32_uncached[i].pages);
>         }
> -
> -       shrinker_free(mm_shrinker);
> -       WARN_ON(!list_empty(&shrinker_list));
>  }
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 26ee592e1994..bda8e816a206 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -97,4 +97,6 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, s=
truct ttm_tt *tt,
>  int ttm_pool_mgr_init(unsigned long num_pages);
>  void ttm_pool_mgr_fini(void);
>
> +void ttm_pool_type_fini_and_list_lru_destroy(void);
> +
>  #endif
> --
> 2.54.0
>
>

This bug is specific so Qemu, so...
