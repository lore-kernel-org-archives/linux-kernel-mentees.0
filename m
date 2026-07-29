Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4879E47ACC6
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Jul 2026 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326268; cv=pass; b=T+ExZw3UYriu9hne+1SvrhZARxjZaJLmrTxYWN2PeWxOti4Dna8OLHALCjEYGfi/YMlvgGLyszWpt5HRcgEVH8E4//g9ZMeIA7i2moSwAhEuXE+YLxx5766ePiinlGJKa5L5p5Vv/16upvdXnQ9SBfzrAncdVYSZ/3B4C9EiXEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326268; c=relaxed/simple;
	bh=60YCmCOXhVqx/rJShpz/w/xG/I4d3UIZ51Eh6YU/s28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nb6iiyKFdc/FykkapYbBh2wqkjvMdQilaL37kljYar8FUXnn2Y6NL4eul8F7D5LZ5Jx+Z6hmivN/CMfszjfZHk0t5oH/0oH13sbBWq0I2B+8IN7PAWnFV6hIPIgFOVbF6y4HDMzEMWbLqstYab7Dr1z3KuYyLtmwWHKs0mTEDbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RH6vFYJV; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RH6vFYJV"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c86945164so6080771fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Jul 2026 04:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785326265; cv=none;
        d=google.com; s=arc-20260327;
        b=iE+FPQL+X9kWLezr1idgbBbFZ8xnvAXM1nWGufqzPxCgKpnSVz93uv8rhk93FkGoFK
         rRM07cqiJTdXzJv7oUL4SNM/eyI/lii7cZVcN4C9UJdqTyFOXmiU8BceKEi4yqnVOQ/1
         ngayF61wm/xpD3+R4MMSmT046sKgAKi1cEi0QsDKZXG2xYS05xBiXsGSZ9XN733YDMJg
         dWl9wrxKRp4Xtpc1i3BqWkxCdjYK6GVxHIQf2b7nxkt7TACYSIDBvLgKrA4PnWA+wtuv
         15D+6/UJLzd2hAC9IX425XMcmSaW0h4y1+ZGeYxkjrGn5ehGygWOyCjy6MriQZzsJrNa
         nPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcH4aYYuKoXJSYfGcjaRA3AXaiTJLDBIulQO5B/oLDo=;
        fh=Ql3epcAJfdv3gJ7/IAeixJg4ga4IAeXozawJYV40tU4=;
        b=K49/9rK6JxhoCfYtFL+MjPDdUizBrO4QRoCaZbgclUVu+YGktERLTwOiTMVqTwX630
         p1PEahHqeg0F2Nxbk82ScgTyAl8FrRXHXs5YZywgjNHbvAxCSfV//AFM3LKJx9rue83Q
         6OU0V/u9IU9o0W7yfUfk++zoBkAG2t9wXbEDFwTS52Xx+MqTQ35dg97gL+amloTHr1xe
         7OYyEe4tCjQXqSCSbhGpz6WRfUcYAFdZiyNrfi4SIIc1qkslBms1wb2n7Ip4mQ9p30Ve
         nQoREskY+cyqKFCZSd8kViZUzw/tYssfxoqBwe8ilBXRzAoahGZ8jrpAPpXmK5xJCVoo
         dkxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326265; x=1785931065; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcH4aYYuKoXJSYfGcjaRA3AXaiTJLDBIulQO5B/oLDo=;
        b=RH6vFYJVuM+NaHNTYndmsFSBm6rbVfr1C55icTk4zXgcaG5qwNfgsMQx4w3b8YZ6iU
         LcH7WaKmPHZlRpyndWsaCCBiHCOU/UqIwp8fRClnyYPracNupmjlf7IPJ0XbFoEJtgi1
         ZBCm3/PQOaNyGjkjJomNag2MZqomQ0YyDZ+1oTiJ9BVlfN1yipo4LjSac8srUeF0Gy0S
         x/JV+fNQ8TsjuUdB4zgnE+fPoytdzVYFRTxPFdWn4yLEHwtSyyQF/nb3fV9yvFr7dHFT
         48Wcpy0AEMyXkcpcrIdo8zNmcWF8iZxGQQQ8ELcLVugs7easO42r9cONUXIKCSlD5AjG
         ksjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326265; x=1785931065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcH4aYYuKoXJSYfGcjaRA3AXaiTJLDBIulQO5B/oLDo=;
        b=sdLeBbVYqVx9vR5MRbkXzKJ/t2CzCcFZIS7uxitAS/r8wPNneghAU7FC+Jr2smYZ6q
         X0pMFMgQpnq5aAUxLVFV+GeHnPa3coDGjGkfzSa5SlcoAYjmSiPCLcYxOSb3HMMaH7PZ
         YmtRTM2llnveNIAmmYs7FSngQ0waCcq0yp/cQKMGOUuleIGuHsHwr2CV+j1d19KIkFAL
         jRe332AtD8UxC9Kjthjo1u/CczyIT+szDlj5w4UnM1VgsTRsPnLQKQJSIld44AdEPihR
         CaKY0wKazDq3Pdkb+3BnigOlwjyGxSrfSZUHdLkKGqjOpzGGhfYfjIZuLCP9zD1neUoT
         rMhA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+DSQrh0o+d3tSl1O0cXBpzJnm0iwQtfftlgc8mZFs2HjKtwxm8Cj6iyNXYY1P43dV1bx4gZ3UdjJi5jpiuNJE+xcJ1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO2CI6QjhJidX6QpJKyL3y+tIMlw7osFew6ebsYj8GA6pwq2+l
	pJBRzuIiaRfPdAysQIdhtTAXtFIwSZKUrM2l0pR4aclNzD+QoNfxFzS9YayAYTTB5TzOA0Ormnb
	0auAfPX/093ac6EvML44LPzvREAVRCg==
X-Gm-Gg: AR+sD11PgSvchIzvmAq/7w85RkL0H+WBaq5Amn6luOvHkAr4dpDGKhYQWbRYmpa+Q5W
	idhO6xuHlbc0+mlWihFpkYgGsywfiq3YJDkgKgJHtF4aKQ8nw3UQL4KTlzOtsMIP+x5nDPTK0sI
	tB8QFiCsM0XYOaS6LzboVj7FCh8QtmU1MhQsRmjDjWhsNiRDqHNUfTVo9RvD9syp656o8L8ngEJ
	MMZmMgi85QUHNh5D0ZYpYuPNNl7IHMiYuEYOQgRaTK1rncd5VsCk8aZZrdoBCjIELM80uL1Ge6n
	jpn+trONEaqhGc391YCIbg8M6L3d7WARVjjoopOGrORyARczj4S9trUcn2J9O9Jof7ClVGZcUro
	ICcj196ho1MBZBLmX5Xjy4io=
X-Received: by 2002:a05:651c:b0a:b0:39c:7089:8053 with SMTP id
 38308e7fff4ca-39f51eaff35mr14776261fa.29.1785326265114; Wed, 29 Jul 2026
 04:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728204636.20998-2-jakovnovak30@gmail.com> <b78f734a-440d-4fad-bba8-df77894c5aa0@kernel.org>
In-Reply-To: <b78f734a-440d-4fad-bba8-df77894c5aa0@kernel.org>
From: jakov novak <jakovnovak30@gmail.com>
Date: Wed, 29 Jul 2026 13:56:49 +0200
X-Gm-Features: AUfX_mwf1PG6jikzexvDJHP2AFA6m_tRT9_DJ5v8FJfou5IEMZUwV0atpg6abhU
Message-ID: <CAPUiDP1POYKJQ=Gfm-irzUmGaSNfZm+qO0xGP7Z=FO8a=R-6Kw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/khugepaged: replace mutex_lock/mutex_unlock usage
 with guard macro
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"\\ Liam R . Howlett \\" <liam@infradead.org>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I guess the error checking could be moved inside the if
(!khugepaged_thread) block like:

if (!khugepaged_thread) {
  struct task_struct *new_thread =3D kthread_run...

  if (IS_ERR(new_thread)) {
    pr_err...
    return PTR_ERR(new_thread);
  }

  khugepaged_thread =3D new_thread;
}

I can send a v3 with these changes if this looks good to everybody.

Best,
Jakov

On Wed, Jul 29, 2026 at 9:56=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 7/28/26 22:46, Jakov Novak wrote:
> > Currently, khugepaged locks the khugepaged_mutex in two functions:
> > start_stop_khugepaged and khugepaged_min_free_kbytes_update. Remove
> > mutex_lock/mutex_unlock usage in these functions and replace it with th=
e
> > guard macro. This makes the code more readable (removing a goto stateme=
nt)
> > and makes it harder to introduce bugs in the future.
> > No functional changes introduced.
> >
> > Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> > v2:
> >   - Added #include <linux/cleanup.h> to the includes at the top of the =
file
> >   - Moved err declaration to the scope where it's used in
> >     start_stop_khugepaged
> >   - Made default case return 0 instead of err in start_stop_khugepaged
> >
> >  mm/khugepaged.c | 15 ++++++---------
> >  1 file changed, 6 insertions(+), 9 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 617bca76db49..7890bd3e2a9d 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/ksm.h>
> >  #include <linux/pgalloc.h>
> >  #include <linux/backing-dev.h>
> > +#include <linux/cleanup.h>
> >
> >  #include <asm/tlb.h>
> >  #include "internal.h"
> > @@ -3111,18 +3112,17 @@ void set_recommended_min_free_kbytes(void)
> >
> >  int start_stop_khugepaged(void)
> >  {
> > -     int err =3D 0;
> > -
> > -     mutex_lock(&khugepaged_mutex);
> > +     guard(mutex)(&khugepaged_mutex);
> >       if (hugepage_enabled()) {
> >               if (!khugepaged_thread)
> >                       khugepaged_thread =3D kthread_run(khugepaged, NUL=
L,
> >                                                       "khugepaged");
> >               if (IS_ERR(khugepaged_thread)) {
> > +                     int err;
> >                       pr_err("khugepaged: kthread_run(khugepaged) faile=
d\n");
> >                       err =3D PTR_ERR(khugepaged_thread);
> >                       khugepaged_thread =3D NULL;
> > -                     goto fail;
> > +                     return err;
> >               }
>
> While at it, can we just do
>
> struct task_struct *new_thread =3D kthread_run...
>
> if (IS_ERR(new_thread)) {
>         pr_err("khugepaged: kthread_run(khugepaged) failed\n");
>         return PTR_ERR(new_thread);
> }
> khugepaged_thread =3D new_thread;
>
> ?
>
> Avoid the suboptimal err variable and temporarily assigning error values =
to the
> global variable.
>
> --
> Cheers,
>
> David
