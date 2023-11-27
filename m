Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30777EED2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2/dPIxSL"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2BCB60701
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 09:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2BCB60701
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2/dPIxSL
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13XhdiuUiBLK
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 09:38:26 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5760460093
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 09:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5760460093
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50ba8177c9fso4636e87.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 01:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701077904; x=1701682704; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yXbJLlN8zN8yxyWwSZeLI9CkhU0ZX6ImmCRBdSzQVgU=;
        b=2/dPIxSLcNMLZQPHtgSIcQvyBFCjqumgh1Dy65dRt1eYzxqT1IIJXHhkoRw+MqsQE5
         HjlhQxsW4Pmsao0LRZy98FGSTnodoIF6kTBZcBYReJye0vtrN6JzlL7Gi3WnVVpXX/6q
         FbLP7SSbaysQ0yY3G0vP4tvNYco3TcW9IGT5EN3Rx2DBP3OUOqmEgzTcVbYIz+gpWa6a
         o6QwLMHNCM12gK9sMU1iuIL2HhG20NgyKJ6GpCwU+QhrAI0DOyiMKN//bTcVuVNpUnfy
         tBO+9X16nXqu3BwkvWmUTjnMSTFH3ccMESH/pxvYAHqJwU0BNp915+2ypuNWhV3ZOYBH
         I/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701077904; x=1701682704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXbJLlN8zN8yxyWwSZeLI9CkhU0ZX6ImmCRBdSzQVgU=;
        b=kAAjBZ/dgIuCn2fnS+fdPQnplhZiSypk4wVEVvolJZLGksE7yo14urLAcTT6afYekb
         OGn1Rd0YWWEeEbtVmChBp1vMlk4gx6vtMK3D06lvowA8Ss6+0b6PEqbwJ/l0AseTj4WL
         VcHcXgT3PneLwq0GOie/y2NMjWsc9jePCrhln0YMBYIFB0SBacGjhqxMznw1kGXSP57W
         mNxGaJyjBp3dmn15AYQJZ4kbWXqsecsU8SXoo1tbWbQQbIcBDCMgNhth57RwlzM8HICC
         5GUwkZdZ0PYJYKdusJuhuMl6wggTyW5YUwQ3rEvt+USmI/cmt3J2GaDM9hwFRoGoZUHa
         TVbg==
X-Gm-Message-State: AOJu0Yy+sPxsNQJr/1FXi8sCBa8o98KkxSGHoWPjCC7PUBQv4ra4GozS
	lAi4Yyh9Uwk/9+6eEO/ctcmXQFu+CsCLlXM7IiE34A==
X-Google-Smtp-Source: AGHT+IEa8BFGDd85yIJUytnb26EF+yw70QOFqlN7uMrSweTh3pkDV2IBJs24Go4gfKJMOLkxjBFq+Rwdz8KAkcc+FP0=
X-Received: by 2002:a05:6512:281a:b0:50a:b7b3:19cd with SMTP id
 cf26-20020a056512281a00b0050ab7b319cdmr456358lfb.5.1701077903951; Mon, 27 Nov
 2023 01:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <VI1P193MB07529BC28E5B333A8526BEBD99BEA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+aVjKTxTamnybC9gS7uvSodYjvHst9obo=GjJ_km-_pdw@mail.gmail.com> <VI1P193MB0752C5B781EC2A351EDF62CC99BDA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752C5B781EC2A351EDF62CC99BDA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 27 Nov 2023 10:38:11 +0100
Message-ID: <CACT4Y+YDnXD3SeordJ8X6tQO+7nr5VuWVrJ-DUi3BXac0zdVxw@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: Record and report more information
To: Juntong Deng <juntong.deng@outlook.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	vincenzo.frascino@arm.com, akpm@linux-foundation.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Nov 2023 at 10:35, Juntong Deng <juntong.deng@outlook.com> wrote:
>
> On 2023/11/27 12:34, Dmitry Vyukov wrote:
> > On Sun, 26 Nov 2023 at 23:25, Juntong Deng <juntong.deng@outlook.com> wrote:
> >>
> >> Record and report more information to help us find the cause of the
> >> bug and to help us correlate the error with other system events.
> >>
> >> This patch adds recording and showing CPU number and timestamp at
> >> allocation and free (controlled by CONFIG_KASAN_EXTRA_INFO). The
> >> timestamps in the report use the same format and source as printk.
> >>
> >> Error occurrence timestamp is already implicit in the printk log,
> >> and CPU number is already shown by dump_stack_lvl, so there is no
> >> need to add it.
> >>
> >> In order to record CPU number and timestamp at allocation and free,
> >> corresponding members need to be added to the relevant data structures,
> >> which will lead to increased memory consumption.
> >>
> >> In Generic KASAN, members are added to struct kasan_track. Since in
> >> most cases, alloc meta is stored in the redzone and free meta is
> >> stored in the object or the redzone, memory consumption will not
> >> increase much.
> >>
> >> In SW_TAGS KASAN and HW_TAGS KASAN, members are added to
> >> struct kasan_stack_ring_entry. Memory consumption increases as the
> >> size of struct kasan_stack_ring_entry increases (this part of the
> >> memory is allocated by memblock), but since this is configurable,
> >> it is up to the user to choose.
> >>
> >> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> >> ---
> >> V1 -> V2: Use bit field to reduce memory consumption. Add more detailed
> >> config help. Cancel printing of redundant error occurrence timestamp.
> >>
> >>   lib/Kconfig.kasan      | 21 +++++++++++++++++++++
> >>   mm/kasan/common.c      | 10 ++++++++++
> >>   mm/kasan/kasan.h       | 10 ++++++++++
> >>   mm/kasan/report.c      |  6 ++++++
> >>   mm/kasan/report_tags.c | 16 ++++++++++++++++
> >>   mm/kasan/tags.c        | 17 +++++++++++++++++
> >>   6 files changed, 80 insertions(+)
> >>
> >> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> >> index 935eda08b1e1..8653f5c38be7 100644
> >> --- a/lib/Kconfig.kasan
> >> +++ b/lib/Kconfig.kasan
> >> @@ -207,4 +207,25 @@ config KASAN_MODULE_TEST
> >>            A part of the KASAN test suite that is not integrated with KUnit.
> >>            Incompatible with Hardware Tag-Based KASAN.
> >>
> >> +config KASAN_EXTRA_INFO
> >> +       bool "Record and report more information"
> >> +       depends on KASAN
> >> +       help
> >> +         Record and report more information to help us find the cause of the
> >> +         bug and to help us correlate the error with other system events.
> >> +
> >> +         Currently, the CPU number and timestamp are additionally
> >> +         recorded for each heap block at allocation and free time, and
> >> +         8 bytes will be added to each metadata structure that records
> >> +         allocation or free information.
> >> +
> >> +         In Generic KASAN, each kmalloc-8 and kmalloc-16 object will add
> >> +         16 bytes of additional memory consumption, and each kmalloc-32
> >> +         object will add 8 bytes of additional memory consumption, not
> >> +         affecting other larger objects.
> >> +
> >> +         In SW_TAGS KASAN and HW_TAGS KASAN, depending on the stack_ring_size
> >> +         boot parameter, it will add 8 * stack_ring_size bytes of additional
> >> +         memory consumption.
> >> +
> >>   endif # KASAN
> >> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> >> index b5d8bd26fced..2f0884c762b7 100644
> >> --- a/mm/kasan/common.c
> >> +++ b/mm/kasan/common.c
> >> @@ -20,6 +20,7 @@
> >>   #include <linux/module.h>
> >>   #include <linux/printk.h>
> >>   #include <linux/sched.h>
> >> +#include <linux/sched/clock.h>
> >>   #include <linux/sched/task_stack.h>
> >>   #include <linux/slab.h>
> >>   #include <linux/stackdepot.h>
> >> @@ -49,6 +50,15 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags, depot_flags_t depot_flags)
> >>
> >>   void kasan_set_track(struct kasan_track *track, gfp_t flags)
> >>   {
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +       u32 cpu = raw_smp_processor_id();
> >> +       u64 ts_nsec = local_clock();
> >> +       unsigned long rem_usec = do_div(ts_nsec, NSEC_PER_SEC) / 1000;
> >> +
> >> +       track->cpu = cpu;
> >> +       track->ts_sec = ts_nsec;
> >> +       track->ts_usec = rem_usec;
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >>          track->pid = current->pid;
> >>          track->stack = kasan_save_stack(flags,
> >>                          STACK_DEPOT_FLAG_CAN_ALLOC | STACK_DEPOT_FLAG_GET);
> >> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> >> index b29d46b83d1f..2a37baa4ce2f 100644
> >> --- a/mm/kasan/kasan.h
> >> +++ b/mm/kasan/kasan.h
> >> @@ -187,6 +187,11 @@ static inline bool kasan_requires_meta(void)
> >>   struct kasan_track {
> >>          u32 pid;
> >>          depot_stack_handle_t stack;
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +       u64 cpu:20;
> >> +       u64 ts_sec:22;
> >> +       u64 ts_usec:22;
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >>   };
> >>
> >>   enum kasan_report_type {
> >> @@ -278,6 +283,11 @@ struct kasan_stack_ring_entry {
> >>          u32 pid;
> >>          depot_stack_handle_t stack;
> >>          bool is_free;
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +       u64 cpu:20;
> >> +       u64 ts_sec:22;
> >> +       u64 ts_usec:22;
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >>   };
> >>
> >>   struct kasan_stack_ring {
> >> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> >> index e77facb62900..8cd8f6e5cf24 100644
> >> --- a/mm/kasan/report.c
> >> +++ b/mm/kasan/report.c
> >> @@ -262,7 +262,13 @@ static void print_error_description(struct kasan_report_info *info)
> >>
> >>   static void print_track(struct kasan_track *track, const char *prefix)
> >>   {
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +       pr_err("%s by task %u on cpu %d at %u.%06us:\n",
> >> +                       prefix, track->pid, track->cpu,
> >> +                       track->ts_sec, track->ts_usec);
> >> +#else
> >>          pr_err("%s by task %u:\n", prefix, track->pid);
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >>          if (track->stack)
> >>                  stack_depot_print(track->stack);
> >>          else
> >> diff --git a/mm/kasan/report_tags.c b/mm/kasan/report_tags.c
> >> index 55154743f915..bf895b1d2dc2 100644
> >> --- a/mm/kasan/report_tags.c
> >> +++ b/mm/kasan/report_tags.c
> >> @@ -27,6 +27,16 @@ static const char *get_common_bug_type(struct kasan_report_info *info)
> >>          return "invalid-access";
> >>   }
> >>
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +static void kasan_complete_extra_report_info(struct kasan_track *track,
> >> +                                        struct kasan_stack_ring_entry *entry)
> >> +{
> >> +       track->cpu = entry->cpu;
> >> +       track->ts_sec = entry->ts_sec;
> >> +       track->ts_usec = entry->ts_usec;
> >> +}
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >> +
> >>   void kasan_complete_mode_report_info(struct kasan_report_info *info)
> >>   {
> >>          unsigned long flags;
> >> @@ -73,6 +83,9 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
> >>
> >>                          info->free_track.pid = entry->pid;
> >>                          info->free_track.stack = entry->stack;
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +                       kasan_complete_extra_report_info(&info->free_track, entry);
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >>                          free_found = true;
> >>
> >>                          /*
> >> @@ -88,6 +101,9 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
> >>
> >>                          info->alloc_track.pid = entry->pid;
> >>                          info->alloc_track.stack = entry->stack;
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +                       kasan_complete_extra_report_info(&info->alloc_track, entry);
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >>                          alloc_found = true;
> >>
> >>                          /*
> >> diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
> >> index 739ae997463d..c172e115b9bb 100644
> >> --- a/mm/kasan/tags.c
> >> +++ b/mm/kasan/tags.c
> >> @@ -13,6 +13,7 @@
> >>   #include <linux/memblock.h>
> >>   #include <linux/memory.h>
> >>   #include <linux/mm.h>
> >> +#include <linux/sched/clock.h>
> >>   #include <linux/stackdepot.h>
> >>   #include <linux/static_key.h>
> >>   #include <linux/string.h>
> >> @@ -93,6 +94,19 @@ void __init kasan_init_tags(void)
> >>          }
> >>   }
> >>
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +static void save_extra_info(struct kasan_stack_ring_entry *entry)
> >> +{
> >> +       u32 cpu = raw_smp_processor_id();
> >> +       u64 ts_nsec = local_clock();
> >> +       unsigned long rem_usec = do_div(ts_nsec, NSEC_PER_SEC) / 1000;
> >> +
> >> +       entry->cpu = cpu;
> >> +       entry->ts_sec = ts_nsec;
> >> +       entry->ts_usec = rem_usec;
> >
> > I would timestamp as a single field in all structs and convert it to
> > sec/usec only when we print it. It would make all initialization and
> > copying shorter. E.g. this function can be just:
> >
> >         entry->cpu = raw_smp_processor_id();
> >         entry->timestamp = local_clock() / 1024;
> >
> > Dividing by 1024 is much faster and gives roughly the same precision.
> > This can be unscaled during reporting:
> >
> >         u64 sec = entry->timestamp * 1024;
> >         unsigned long usec = do_div(sec, NSEC_PER_SEC) / 1000;
> >
> > But otherwise the patch looks good to me.
> >
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> >
>
>
> I think it would be better to use left shift and right shift because
> dropping the last 3 bits would not affect the microsecond part and
> would not affect the precision at all.
>
> In addition, 44 bits are enough to store the maximum value of the
> displayable time 99999.999999 (5-bit seconds + 6-bit microseconds).
>
> 010110101111001100010000011110100011111111111111 (99999.999999) >> 3
> = 10110101111001100010000011110100011111111111 (44 bits)
>
> I will send the V3 patch.

Agree.
Modern compilers are smart enough to turn division/multiplication by
pow-2 const into necessary shift, so we may not obfuscate the code.


> >> +}
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >> +
> >>   static void save_stack_info(struct kmem_cache *cache, void *object,
> >>                          gfp_t gfp_flags, bool is_free)
> >>   {
> >> @@ -128,6 +142,9 @@ static void save_stack_info(struct kmem_cache *cache, void *object,
> >>          entry->pid = current->pid;
> >>          entry->stack = stack;
> >>          entry->is_free = is_free;
> >> +#ifdef CONFIG_KASAN_EXTRA_INFO
> >> +       save_extra_info(entry);
> >> +#endif /* CONFIG_KASAN_EXTRA_INFO */
> >>
> >>          entry->ptr = object;
> >>
> >> --
> >> 2.39.2
> >>
>
