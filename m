Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39AD538A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pxwaa7Ox"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566F3812E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 04:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566F3812E2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Pxwaa7Ox
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gi9XHYQM-9kE
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 04:34:38 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1A7F4812DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 04:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A7F4812DD
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50babb66dedso2386e87.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 20:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701059676; x=1701664476; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IXbKy2pJw1weWM2AUX6qsAkpX0IgEY8LocF0NM/epjw=;
        b=Pxwaa7OxtRumTbzrMZMRUjDKLXgw5AQDxkMNgxJRs75I6ez4fGPd6zMoKtFjyWavjo
         GSADYThiNinRuiKOu6nuP1L/HdRJyLK5SLE5wg0FXBz6QhEWbmGM+QLsLFXej6ubBEU7
         aqTBGk//qASYOdr0agciS8R1/9AWQI5l+HX5C7utGzvs4Iznb0cDSk5+0OvHokFvaG/y
         BdGmU6lzvZixiWZw+RB2yT+oFPfaHv4TvN04nb5hC2Sk1BThMya7+Zz49Sy25Al+JHGr
         ZV5D/niDNt0p2ky/rDDsetsLLYwoM7xu/sCLo/sZH69yoZ62DYwlaPKhQS7DlEKHyHq6
         kGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701059676; x=1701664476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXbKy2pJw1weWM2AUX6qsAkpX0IgEY8LocF0NM/epjw=;
        b=MGTjbwguEm3Hxk1oN2buPClmKzIl23n5gMQ9joDnNx2bxo1tOWLtiEi+0+Oc//o2Ln
         ckljOgm/79GehD3k6k8FoWpLp4tTEM3mgqSE3MpLrC7NdYQ0mUPVIuJ0FfHkPcuus9ye
         qQ4CczXfJES+8G6VL6cClpQLPfEIzcmIYVCbMhTTporyls33T1GoblTkoMknrvWn5cHC
         0fdIm6QixpDxrRaG4wVfiqHT48znPdWZg//1FFWZoJxIpPmvAf7l++N9fRIoOfbJUnf1
         nGtrxhyQqmK+VV7NqtovX9BGZXEGnhgOUpmdmrzrQ54Nu0l+UPSW13t/eqY4kHjixbwT
         6/kg==
X-Gm-Message-State: AOJu0YyvScI0MkMJGRHlFx2fM665xj6K/pMnl92H/Sbjjs1wNb14/7TD
	MzcB5SyKhZEFb22liiButxzlAkeC/7nN+xy8PRpm6g==
X-Google-Smtp-Source: AGHT+IFhdT60DfmJFK01YP5LJxJl2q5WHKddBuvyqA3O+DhvY0L2910Po9fgOI0KxYcxbbBEVJoe6jXahBGdrtcbosA=
X-Received: by 2002:a05:6512:239e:b0:501:a2b9:6046 with SMTP id
 c30-20020a056512239e00b00501a2b96046mr452354lfv.7.1701059675534; Sun, 26 Nov
 2023 20:34:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <VI1P193MB07529BC28E5B333A8526BEBD99BEA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB07529BC28E5B333A8526BEBD99BEA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 27 Nov 2023 05:34:22 +0100
Message-ID: <CACT4Y+aVjKTxTamnybC9gS7uvSodYjvHst9obo=GjJ_km-_pdw@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: Record and report more information
To: Juntong Deng <juntong.deng@outlook.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	vincenzo.frascino@arm.com, akpm@linux-foundation.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Nov 2023 at 23:25, Juntong Deng <juntong.deng@outlook.com> wrote:
>
> Record and report more information to help us find the cause of the
> bug and to help us correlate the error with other system events.
>
> This patch adds recording and showing CPU number and timestamp at
> allocation and free (controlled by CONFIG_KASAN_EXTRA_INFO). The
> timestamps in the report use the same format and source as printk.
>
> Error occurrence timestamp is already implicit in the printk log,
> and CPU number is already shown by dump_stack_lvl, so there is no
> need to add it.
>
> In order to record CPU number and timestamp at allocation and free,
> corresponding members need to be added to the relevant data structures,
> which will lead to increased memory consumption.
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
> V1 -> V2: Use bit field to reduce memory consumption. Add more detailed
> config help. Cancel printing of redundant error occurrence timestamp.
>
>  lib/Kconfig.kasan      | 21 +++++++++++++++++++++
>  mm/kasan/common.c      | 10 ++++++++++
>  mm/kasan/kasan.h       | 10 ++++++++++
>  mm/kasan/report.c      |  6 ++++++
>  mm/kasan/report_tags.c | 16 ++++++++++++++++
>  mm/kasan/tags.c        | 17 +++++++++++++++++
>  6 files changed, 80 insertions(+)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index 935eda08b1e1..8653f5c38be7 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -207,4 +207,25 @@ config KASAN_MODULE_TEST
>           A part of the KASAN test suite that is not integrated with KUnit.
>           Incompatible with Hardware Tag-Based KASAN.
>
> +config KASAN_EXTRA_INFO
> +       bool "Record and report more information"
> +       depends on KASAN
> +       help
> +         Record and report more information to help us find the cause of the
> +         bug and to help us correlate the error with other system events.
> +
> +         Currently, the CPU number and timestamp are additionally
> +         recorded for each heap block at allocation and free time, and
> +         8 bytes will be added to each metadata structure that records
> +         allocation or free information.
> +
> +         In Generic KASAN, each kmalloc-8 and kmalloc-16 object will add
> +         16 bytes of additional memory consumption, and each kmalloc-32
> +         object will add 8 bytes of additional memory consumption, not
> +         affecting other larger objects.
> +
> +         In SW_TAGS KASAN and HW_TAGS KASAN, depending on the stack_ring_size
> +         boot parameter, it will add 8 * stack_ring_size bytes of additional
> +         memory consumption.
> +
>  endif # KASAN
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index b5d8bd26fced..2f0884c762b7 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/printk.h>
>  #include <linux/sched.h>
> +#include <linux/sched/clock.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/slab.h>
>  #include <linux/stackdepot.h>
> @@ -49,6 +50,15 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags, depot_flags_t depot_flags)
>
>  void kasan_set_track(struct kasan_track *track, gfp_t flags)
>  {
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       u32 cpu = raw_smp_processor_id();
> +       u64 ts_nsec = local_clock();
> +       unsigned long rem_usec = do_div(ts_nsec, NSEC_PER_SEC) / 1000;
> +
> +       track->cpu = cpu;
> +       track->ts_sec = ts_nsec;
> +       track->ts_usec = rem_usec;
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>         track->pid = current->pid;
>         track->stack = kasan_save_stack(flags,
>                         STACK_DEPOT_FLAG_CAN_ALLOC | STACK_DEPOT_FLAG_GET);
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index b29d46b83d1f..2a37baa4ce2f 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -187,6 +187,11 @@ static inline bool kasan_requires_meta(void)
>  struct kasan_track {
>         u32 pid;
>         depot_stack_handle_t stack;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       u64 cpu:20;
> +       u64 ts_sec:22;
> +       u64 ts_usec:22;
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>  };
>
>  enum kasan_report_type {
> @@ -278,6 +283,11 @@ struct kasan_stack_ring_entry {
>         u32 pid;
>         depot_stack_handle_t stack;
>         bool is_free;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       u64 cpu:20;
> +       u64 ts_sec:22;
> +       u64 ts_usec:22;
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>  };
>
>  struct kasan_stack_ring {
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index e77facb62900..8cd8f6e5cf24 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -262,7 +262,13 @@ static void print_error_description(struct kasan_report_info *info)
>
>  static void print_track(struct kasan_track *track, const char *prefix)
>  {
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       pr_err("%s by task %u on cpu %d at %u.%06us:\n",
> +                       prefix, track->pid, track->cpu,
> +                       track->ts_sec, track->ts_usec);
> +#else
>         pr_err("%s by task %u:\n", prefix, track->pid);
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>         if (track->stack)
>                 stack_depot_print(track->stack);
>         else
> diff --git a/mm/kasan/report_tags.c b/mm/kasan/report_tags.c
> index 55154743f915..bf895b1d2dc2 100644
> --- a/mm/kasan/report_tags.c
> +++ b/mm/kasan/report_tags.c
> @@ -27,6 +27,16 @@ static const char *get_common_bug_type(struct kasan_report_info *info)
>         return "invalid-access";
>  }
>
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +static void kasan_complete_extra_report_info(struct kasan_track *track,
> +                                        struct kasan_stack_ring_entry *entry)
> +{
> +       track->cpu = entry->cpu;
> +       track->ts_sec = entry->ts_sec;
> +       track->ts_usec = entry->ts_usec;
> +}
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> +
>  void kasan_complete_mode_report_info(struct kasan_report_info *info)
>  {
>         unsigned long flags;
> @@ -73,6 +83,9 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
>
>                         info->free_track.pid = entry->pid;
>                         info->free_track.stack = entry->stack;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +                       kasan_complete_extra_report_info(&info->free_track, entry);
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>                         free_found = true;
>
>                         /*
> @@ -88,6 +101,9 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
>
>                         info->alloc_track.pid = entry->pid;
>                         info->alloc_track.stack = entry->stack;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +                       kasan_complete_extra_report_info(&info->alloc_track, entry);
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>                         alloc_found = true;
>
>                         /*
> diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
> index 739ae997463d..c172e115b9bb 100644
> --- a/mm/kasan/tags.c
> +++ b/mm/kasan/tags.c
> @@ -13,6 +13,7 @@
>  #include <linux/memblock.h>
>  #include <linux/memory.h>
>  #include <linux/mm.h>
> +#include <linux/sched/clock.h>
>  #include <linux/stackdepot.h>
>  #include <linux/static_key.h>
>  #include <linux/string.h>
> @@ -93,6 +94,19 @@ void __init kasan_init_tags(void)
>         }
>  }
>
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +static void save_extra_info(struct kasan_stack_ring_entry *entry)
> +{
> +       u32 cpu = raw_smp_processor_id();
> +       u64 ts_nsec = local_clock();
> +       unsigned long rem_usec = do_div(ts_nsec, NSEC_PER_SEC) / 1000;
> +
> +       entry->cpu = cpu;
> +       entry->ts_sec = ts_nsec;
> +       entry->ts_usec = rem_usec;

I would timestamp as a single field in all structs and convert it to
sec/usec only when we print it. It would make all initialization and
copying shorter. E.g. this function can be just:

       entry->cpu = raw_smp_processor_id();
       entry->timestamp = local_clock() / 1024;

Dividing by 1024 is much faster and gives roughly the same precision.
This can be unscaled during reporting:

       u64 sec = entry->timestamp * 1024;
       unsigned long usec = do_div(sec, NSEC_PER_SEC) / 1000;

But otherwise the patch looks good to me.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> +}
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> +
>  static void save_stack_info(struct kmem_cache *cache, void *object,
>                         gfp_t gfp_flags, bool is_free)
>  {
> @@ -128,6 +142,9 @@ static void save_stack_info(struct kmem_cache *cache, void *object,
>         entry->pid = current->pid;
>         entry->stack = stack;
>         entry->is_free = is_free;
> +#ifdef CONFIG_KASAN_EXTRA_INFO
> +       save_extra_info(entry);
> +#endif /* CONFIG_KASAN_EXTRA_INFO */
>
>         entry->ptr = object;
>
> --
> 2.39.2
>
