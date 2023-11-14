Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5794111732
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSoAV7sj"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9046881F74
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 07:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9046881F74
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=GSoAV7sj
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwvCVxlLatzU
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 14 Nov 2023 07:28:03 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E7F3681F5C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 07:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F3681F5C
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so9881a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 23:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699946881; x=1700551681; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j7k5QLsXr1VaePKPJwpckb69EbdmzQCB0DATBTJO1Js=;
        b=GSoAV7sj644dA+7XXfgtcA2IjbLQclUx3IZtnMMk2x6WfFaqCbuYSmN4M+ru3N+Z10
         AJVJFCjCSg2yzTPiXd9doC+/NGDtrfGvcTBmFjNRyNWyAD7ZLEepsLdtAvHfHpfrK6wP
         oeagS997X9DiebVru5maZp31uj055pEL9zJXOQhKt7eHfmaBp1x6MC+YpIFN03PHb0A5
         0eBpHYj0pbtfkwTesq9inA0dHIg7PSTO7bep4hof1GlaXbKU+vqQpJ2fkB29LGUdxwVT
         6sboILNeCKh6w0uMPji2oogGhXhT6lryzG6aE2CtAahVpMKtxqgb8ym0VFtjwSLnV49e
         72PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699946881; x=1700551681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7k5QLsXr1VaePKPJwpckb69EbdmzQCB0DATBTJO1Js=;
        b=ObSZD53MMpxX9C8/P483NwiPFpXt1+2zdmp+SVOUlT5krJkxgBLl0IzgvW5W4V+MCD
         jZQsuvx/PC2iI8L54Chzl7FSi4HAVavHfDmfb43wkiZluXo/BcfxlCKCUroo79aRvdPC
         I13vwb1yZMjLlEedoroj69nXqkcPZaqjonFJUo2u0eA85AwhKPaWGXunACiSH95i5Wby
         9pYntt+Wb3Rof8ZBEEuNEnrdpkqz7gQ2BWwhpT+8aU4t/ILAfZ7Mr3X67dYf+Uk9Tzsg
         iRUveO7J1xaJauFlS7AC4e3PZe8w1yfJWXB9UQ/gT5DTPZNJFASuMtd+V62jZ2vCcu6p
         /voA==
X-Gm-Message-State: AOJu0Yx6GR/nAwiSTo1D6BvijIhSt/3Ef5M9Dv3ucqAVdwannWOmXQb8
	uBcwxHZVHkGtrN/vcZA9JqA1qlhGaAXu9dWBqOU+KQ==
X-Google-Smtp-Source: AGHT+IGznF9Y+y85mBjQGKheeKLj798TNkdqDfsd+3MX4sGPTet4hqMC5c91b5q2L6Q8B/5J04ZwNG9RIHgzWcPhIOE=
X-Received: by 2002:aa7:dc0f:0:b0:545:94c:862e with SMTP id
 b15-20020aa7dc0f000000b00545094c862emr93008edu.2.1699946880793; Mon, 13 Nov
 2023 23:28:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <VI1P193MB0752058FAECD2AC1E5E68D7399B3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752058FAECD2AC1E5E68D7399B3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 14 Nov 2023 08:27:44 +0100
Message-ID: <CACT4Y+Ya4yTvAmaELJN5st3GJYo1KKzC9qw9sdD0g3jb48O7tg@mail.gmail.com>
Subject: Re: [RFC PATCH] kasan: Record and report more information
To: Juntong Deng <juntong.deng@outlook.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	vincenzo.frascino@arm.com, akpm@linux-foundation.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Nov 2023 at 22:17, Juntong Deng <juntong.deng@outlook.com> wrote:
>
> Record and report more information to help us find the cause of
> the bug (for example, bugs caused by subtle race condition).
>
> This patch adds recording and showing CPU number and timestamp at
> allocation and free (controlled by CONFIG_KASAN_EXTRA_INFO), and
> adds recording and showing timestamp at error occurrence (CPU number
> is already shown by dump_stack_lvl). The timestamps in the report use
> the same format and source as printk.
>
> In order to record CPU number and timestamp at allocation and free,
> corresponding members need to be added to the relevant data structures,
> which may lead to increased memory consumption.
>
> In Generic KASAN, members are added to struct kasan_track. Since in
> most cases, alloc meta is stored in the redzone and free meta is
> stored in the object or the redzone, memory consumption will not
> increase much.
>
> In SW_TAGS KASAN and HW_TAGS KASAN, members are added to
> struct kasan_stack_ring_entry. Memory consumption increases as the
> size of struct kasan_stack_ring_entry increases (this part of the
> memory is allocated by memblock), but since this is configurable,
> it is up to the user to choose.
>
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> ---
>  lib/Kconfig.kasan      | 11 +++++++++++
>  mm/kasan/common.c      |  5 +++++
>  mm/kasan/kasan.h       |  9 +++++++++
>  mm/kasan/report.c      | 28 ++++++++++++++++++++++------
>  mm/kasan/report_tags.c | 18 ++++++++++++++++++
>  mm/kasan/tags.c        | 15 +++++++++++++++
>  6 files changed, 80 insertions(+), 6 deletions(-)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index fdca89c05745..d9611564b339 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -207,4 +207,15 @@ config KASAN_MODULE_TEST
>           A part of the KASAN test suite that is not integrated with KUnit.
>           Incompatible with Hardware Tag-Based KASAN.
>
> +config KASAN_EXTRA_INFO
> +       bool "Record and report more information"
> +       depends on KASAN
> +       help
> +         Record and report more information to help us find the cause of
> +         the bug. The trade-off is potentially increased memory consumption
> +         (to record more information).
> +
> +         Currently the CPU number and timestamp are additionally recorded
> +         at allocation and free.

Hi Juntong,

Thanks for working on this.

As a KASAN developer I understand what this is doing, but I am trying
to think from a position of a user that does not know details of KASAN
implementation. From this position it may be useful to say somewhere
that information is recorded "per heap allocation". Perhaps something
like:

"Currently the CPU number and timestamp are additionally recorded for
each heap block at allocation and free time".

Also it's unclear what the memory consumption increase is. You say
"potentially|, so may it not increase at all? If it increases, by how
much? I obviously want more information, if I can afford it, but I
can't understand if I can or not based on this description. I would
assume that this may be a problem only for small/embedded devices.
Can we provide some ballpark estimation of the memory consumption
increase? And somehow say that's probably not an issue for larger
machines?




>  endif # KASAN
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 256930da578a..7a81566d9d66 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/printk.h>
>  #include <linux/sched.h>
> +#include <linux/sched/clock.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/slab.h>
>  #include <linux/stacktrace.h>
> @@ -50,6 +51,10 @@ void kasan_set_track(struct kasan_track *track, gfp_t flags)
>  {
>         track->pid = current->pid;
>         track->stack = kasan_save_stack(flags, true);
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       track->cpu = raw_smp_processor_id();
> +       track->ts_nsec = local_clock();

What does "local_" mean? Is this clock value comparable across CPUs?


> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>  }
>
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 8b06bab5c406..b3899a255aca 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -187,6 +187,10 @@ static inline bool kasan_requires_meta(void)
>  struct kasan_track {
>         u32 pid;
>         depot_stack_handle_t stack;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       u32 cpu;
> +       u64 ts_nsec;

This increases the size of meta from 8 to 24 bytes.
Can we somehow store the timestamp as 32 bits? Maybe compress the CPU
number (it shouldn't be larger than 20 bits?)?
I see below we report on microseconds, so we don't low bits of the
timestamp as well.


I see there is a deficiency in kasan_cache_create():
https://elixir.bootlin.com/linux/latest/source/mm/kasan/generic.c#L412

If free_meta does not fit into the object, we add it after the object.
But we could overlap it with the object.
For example if the object size is 16 bytes and free_meta size is 24
bytes, we could increase object size to 24, while currently we
increase it to 16+24 = 40.
We need to place it after the object only if we have these other cases
"(cache->flags & SLAB_TYPESAFE_BY_RCU) || cache->ctor".

Currently it affects only kmalloc-8 slab.
But with this change it will affect at least kmalloc-16 slab as well.




> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>  };
>
>  enum kasan_report_type {
> @@ -202,6 +206,7 @@ struct kasan_report_info {
>         size_t access_size;
>         bool is_write;
>         unsigned long ip;
> +       u64 ts_nsec;
>
>         /* Filled in by the common reporting code. */
>         const void *first_bad_addr;
> @@ -278,6 +283,10 @@ struct kasan_stack_ring_entry {
>         u32 pid;
>         depot_stack_handle_t stack;
>         bool is_free;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       u32 cpu;
> +       u64 ts_nsec;
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>  };
>
>  struct kasan_stack_ring {
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index e77facb62900..b6feaf807c08 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -25,6 +25,7 @@
>  #include <linux/types.h>
>  #include <linux/kasan.h>
>  #include <linux/module.h>
> +#include <linux/sched/clock.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/uaccess.h>
>  #include <trace/events/error_report.h>
> @@ -242,27 +243,40 @@ static void end_report(unsigned long *flags, const void *addr, bool is_write)
>
>  static void print_error_description(struct kasan_report_info *info)
>  {
> +       unsigned long rem_usec = do_div(info->ts_nsec, NSEC_PER_SEC) / 1000;
> +
>         pr_err("BUG: KASAN: %s in %pS\n", info->bug_type, (void *)info->ip);
>
>         if (info->type != KASAN_REPORT_ACCESS) {
> -               pr_err("Free of addr %px by task %s/%d\n",
> -                       info->access_addr, current->comm, task_pid_nr(current));
> +               pr_err("Free of addr %px by task %s/%d at %lu.%06lus\n",
> +                       info->access_addr, current->comm, task_pid_nr(current),
> +                       (unsigned long)info->ts_nsec, rem_usec);
>                 return;
>         }
>
>         if (info->access_size)
> -               pr_err("%s of size %zu at addr %px by task %s/%d\n",
> +               pr_err("%s of size %zu at addr %px by task %s/%d at %lu.%06lus\n",
>                         info->is_write ? "Write" : "Read", info->access_size,
> -                       info->access_addr, current->comm, task_pid_nr(current));
> +                       info->access_addr, current->comm, task_pid_nr(current),
> +                       (unsigned long)info->ts_nsec, rem_usec);
>         else
> -               pr_err("%s at addr %px by task %s/%d\n",
> +               pr_err("%s at addr %px by task %s/%d at %lu.%06lus\n",
>                         info->is_write ? "Write" : "Read",
> -                       info->access_addr, current->comm, task_pid_nr(current));
> +                       info->access_addr, current->comm, task_pid_nr(current),
> +                       (unsigned long)info->ts_nsec, rem_usec);
>  }
>
>  static void print_track(struct kasan_track *track, const char *prefix)
>  {
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       unsigned long rem_usec = do_div(track->ts_nsec, NSEC_PER_SEC) / 1000;
> +
> +       pr_err("%s by task %u on cpu %d at %lu.%06lus:\n",
> +                       prefix, track->pid, track->cpu,
> +                       (unsigned long)track->ts_nsec, rem_usec);
> +#else
>         pr_err("%s by task %u:\n", prefix, track->pid);
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>         if (track->stack)
>                 stack_depot_print(track->stack);
>         else
> @@ -544,6 +558,7 @@ void kasan_report_invalid_free(void *ptr, unsigned long ip, enum kasan_report_ty
>         info.access_size = 0;
>         info.is_write = false;
>         info.ip = ip;
> +       info.ts_nsec = local_clock();
>
>         complete_report_info(&info);
>
> @@ -582,6 +597,7 @@ bool kasan_report(const void *addr, size_t size, bool is_write,
>         info.access_size = size;
>         info.is_write = is_write;
>         info.ip = ip;
> +       info.ts_nsec = local_clock();
>
>         complete_report_info(&info);
>
> diff --git a/mm/kasan/report_tags.c b/mm/kasan/report_tags.c
> index 8b8bfdb3cfdb..4d62f1b3e11d 100644
> --- a/mm/kasan/report_tags.c
> +++ b/mm/kasan/report_tags.c
> @@ -26,6 +26,18 @@ static const char *get_common_bug_type(struct kasan_report_info *info)
>         return "invalid-access";
>  }
>
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +static void kasan_complete_extra_report_info(struct kasan_track *track,
> +                                        struct kasan_stack_ring_entry *entry)
> +{
> +       u32 cpu = READ_ONCE(entry->cpu);
> +       u64 ts_nsec = READ_ONCE(entry->ts_nsec);
> +
> +       track->cpu = cpu;
> +       track->ts_nsec = ts_nsec;
> +}
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> +
>  void kasan_complete_mode_report_info(struct kasan_report_info *info)
>  {
>         unsigned long flags;
> @@ -82,6 +94,9 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
>
>                         info->free_track.pid = pid;
>                         info->free_track.stack = stack;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +                       kasan_complete_extra_report_info(&info->free_track, entry);
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>                         free_found = true;
>
>                         /*
> @@ -97,6 +112,9 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
>
>                         info->alloc_track.pid = pid;
>                         info->alloc_track.stack = stack;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +                       kasan_complete_extra_report_info(&info->alloc_track, entry);
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>                         alloc_found = true;
>
>                         /*
> diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
> index 7dcfe341d48e..474ce7e8be8b 100644
> --- a/mm/kasan/tags.c
> +++ b/mm/kasan/tags.c
> @@ -13,6 +13,7 @@
>  #include <linux/memblock.h>
>  #include <linux/memory.h>
>  #include <linux/mm.h>
> +#include <linux/sched/clock.h>
>  #include <linux/static_key.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> @@ -92,6 +93,17 @@ void __init kasan_init_tags(void)
>         }
>  }
>
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +static void save_extra_info(struct kasan_stack_ring_entry *entry)
> +{
> +       u32 cpu = raw_smp_processor_id();
> +       u64 ts_nsec = local_clock();
> +
> +       WRITE_ONCE(entry->cpu, cpu);
> +       WRITE_ONCE(entry->ts_nsec, ts_nsec);
> +}
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> +
>  static void save_stack_info(struct kmem_cache *cache, void *object,
>                         gfp_t gfp_flags, bool is_free)
>  {
> @@ -124,6 +136,9 @@ static void save_stack_info(struct kmem_cache *cache, void *object,
>         WRITE_ONCE(entry->pid, current->pid);
>         WRITE_ONCE(entry->stack, stack);
>         WRITE_ONCE(entry->is_free, is_free);
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       save_extra_info(entry);
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>
>         /*
>          * Paired with smp_load_acquire() in kasan_complete_mode_report_info().
> --
> 2.39.2
>
