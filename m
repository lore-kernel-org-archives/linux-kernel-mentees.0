Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471E1CA8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sd/NbJzO"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F8841555
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 20:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F8841555
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sd/NbJzO
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdkXRDGu68NZ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 22 Nov 2023 20:36:24 +0000 (UTC)
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3BB10402E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 20:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB10402E6
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4ac28bd2857so63968e0c.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Nov 2023 12:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700685383; x=1701290183; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vkfEHr78Ys9Zl8oeeDr7y3wj216XnJVscyV3Cx1FHDQ=;
        b=sd/NbJzOz5uo8NO1AAvbyedpgOcj0v//XnxQfNX2XuAmUk1hCV/oYfj20VkF7ebF1W
         SagKh8rRdjr6/Mfy5IAArXUsdzsVkuaMy5ydGYdCi9wnEzecYqOcVKYBSqf9kDPNsvPb
         2MruPYakhaLAT5cB8QdvzQtXBgQqesExnLXsYbdAcuqGOlUkBsy7LGfSBOT4pPa2KmC2
         g5F07kSeHMo7L7+gEidi0ugjUGqXHx6ubtcvPB1JMYc0BpABhEjBHIhWm7U+r2ryqTQo
         yzo4Hyy3ywIC/RVElMgUbfRX1Bzd9SY1pl6yQpYJNLaw6RxxZPbvDr4zUlTvFsyZNPNJ
         T9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700685383; x=1701290183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkfEHr78Ys9Zl8oeeDr7y3wj216XnJVscyV3Cx1FHDQ=;
        b=DGXgva64CMfAXiwR2Hi2Z+GnydCbO5VXwga+fLQWLSSBbiZEedjCBLEZ7ZjfBiJANn
         fR4zddLiVyb/KqnIufU954cx/pgUPz5hN4OuzfPLGFtCGBpjFhQ3sIKazj8szNUAIXpA
         eYyAb9z73zi1JW4A7pwR/VIvR6kxgekzAGirGUYL1slinafhZ7mUxKdrIEfWLde4k4B1
         Jrd6Ro8ns3bUd95zqlp5P7PwOFsj997cS809XIARjFptejEmrUdSMkOmlY339cb9c3Fl
         qH6q3tDoFAxun1Vv7KQLxYNCnSwvRdAc2EmIqU/9qiBkiYLjBI4ytR6MFnR9T4ocbW7P
         0bhQ==
X-Gm-Message-State: AOJu0YzE29emh3aCf83wg2VJVnGJyfOKR6+49hwvO5U+RoMivQcuR4By
	sPtascDnma/t26bPk5OUd5UB7wf6t28KEpCH+wnCig==
X-Google-Smtp-Source: AGHT+IEaacdnUa59qnize/3QcKbGSEsX/+QaFt9aREFTu+hko0hMQ/cZ5K0QHHgTXpOhmPH20kWi4VltLof9HqTi4Bs=
X-Received: by 2002:a1f:4c04:0:b0:4ac:c52d:70f9 with SMTP id
 z4-20020a1f4c04000000b004acc52d70f9mr3579163vka.10.1700685382734; Wed, 22 Nov
 2023 12:36:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <VI1P193MB0752A2F21C050D701945B62799BAA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752A2F21C050D701945B62799BAA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Marco Elver <elver@google.com>
Date: Wed, 22 Nov 2023 21:35:44 +0100
Message-ID: <CANpmjNPvDhyEcc0DdxrL8hVd0rZ-J4k95R5M5AwoeSotg-HCVg@mail.gmail.com>
Subject: Re: [PATCH] kfence: Replace local_clock() with ktime_get_boot_fast_ns()
To: Juntong Deng <juntong.deng@outlook.com>
Cc: glider@google.com, dvyukov@google.com, akpm@linux-foundation.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 21:01, Juntong Deng <juntong.deng@outlook.com> wrote:
>
> The time obtained by local_clock() is the local CPU time, which may
> drift between CPUs and is not suitable for comparison across CPUs.
>
> It is possible for allocation and free to occur on different CPUs,
> and using local_clock() to record timestamps may cause confusion.

The same problem exists with printk logging.

> ktime_get_boot_fast_ns() is based on clock sources and can be used
> reliably and accurately for comparison across CPUs.

You may be right here, however, the choice of local_clock() was
deliberate: it's the same timestamp source that printk uses.

Also, on systems where there is drift, the arch selects
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK (like on x86) and the drift is
generally bounded.

> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> ---
>  mm/kfence/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 3872528d0963..041c03394193 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -295,7 +295,7 @@ metadata_update_state(struct kfence_metadata *meta, enum kfence_object_state nex
>         track->num_stack_entries = num_stack_entries;
>         track->pid = task_pid_nr(current);
>         track->cpu = raw_smp_processor_id();
> -       track->ts_nsec = local_clock(); /* Same source as printk timestamps. */
> +       track->ts_nsec = ktime_get_boot_fast_ns();

You have ignored the comment placed here - now it's no longer the same
source as printk timestamps. I think not being able to correlate
information from KFENCE reports with timestamps in lines from printk
is worse.

For now, I have to Nack: Unless you can prove that
ktime_get_boot_fast_ns() can still be correlated with timestamps from
printk timestamps, I think this change only trades one problem for
another.

Thanks,
-- Marco
