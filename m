Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005CBC77B62
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Apr 2023 16:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A79E60E8A;
	Wed,  5 Apr 2023 16:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A79E60E8A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BJSatbPa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0agtISM2YGoI; Wed,  5 Apr 2023 16:43:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C1C9860709;
	Wed,  5 Apr 2023 16:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C9860709
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D60BC0036;
	Wed,  5 Apr 2023 16:43:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72E8AC002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 16:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A1DA60709
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 16:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A1DA60709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bphtppEuX1Wq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 16:43:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D1860C00
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21D1860C00
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 16:43:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h8so142646014ede.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Apr 2023 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680713028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5TPofhCRqsaDy+QKQvLq1nSwBkzlsiF3K1oEcaeWETM=;
 b=BJSatbPaHofJrC6zTpy2LSmzhLS6wGpgUE/yxHwMHt14zaVJ7j2hMM4hcIWsUMyniM
 C0zc+hvP3Mn1uhlwIYzgoVXROsKYNv1hiERfBFYGH1qcCoH6S4O0sJOZp/Kzx7rnNj9e
 vT0kMTBLAkF3VLAU/zwcey/VZwB61sCjj1VUW9Xc6RZJfxPPVYX3ZCyj2lPNH3oaSU8y
 jSbe2k2D8fQwAW63JjsL5GA3ETZesnfDiqRa+JinPNm8iMxmDwabdy0sXMx6KzmRiDtC
 KtwDL4llhQV4WC/oFSO7rzs+7vMvyfh3+rF1fCEYZXl0gl71+wEJKfBhYVXXbRsiA0/5
 CvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680713028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5TPofhCRqsaDy+QKQvLq1nSwBkzlsiF3K1oEcaeWETM=;
 b=tFy/rVEVdhKAHhcuEnXZnbZT+nhx20iqqTez7nbYx6+T0O1xAVS2vURj54q+HaiPI9
 MIXP+ZcMfrTjR8BjKMUf5ABcBWbm0wrKIE6mYnzfEiQorgarT3TcT247klQv5OWPeGgL
 Ty1g0JUyC/GcKsJHdc9sZkmRtASyd7v6oP15aumLf9u4fQpDyU8ia/Y1CmpD1WG4aeud
 I/n4ejyO2oFa0SNJhG0uFT5WmRQUubI5vORi1RcrKbPNcQxc757i/bdcK3hKQcdML7Ne
 2YKC4+PXreXR2uK808yUUYoA8dsEfk0MueYCIT5U/7GSYQkSgXk4TSFmpIZd2VQcPHfg
 vtGA==
X-Gm-Message-State: AAQBX9fXkGIit+8qdbCHA05DxRxhRRfDaUjy172iIl3cLKmQ6rRou3sR
 kcT259lgcbgqlJA3kGjJ2myPnzJohJvetxi7APqNXA==
X-Google-Smtp-Source: AKy350brlMtCY3MiHnXwsnAhEHJalJ563bCxczrxwMKUFenq7zwkD9t+eK36V53WCL82GEcl+rfePCbO5dT/2PpAUWU=
X-Received: by 2002:a17:907:8b92:b0:92a:a75e:6b9 with SMTP id
 tb18-20020a1709078b9200b0092aa75e06b9mr1773679ejc.11.1680713027992; Wed, 05
 Apr 2023 09:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230330155305.423051-1-ivan.orlov0322@gmail.com>
 <20230331013301.ecgkjymaf3ws6rfb@google.com>
 <CAHbLzkoJ2zvKZpqd6NqikpCc8rGR02C87f0fPq8qwb1BF3K+9Q@mail.gmail.com>
In-Reply-To: <CAHbLzkoJ2zvKZpqd6NqikpCc8rGR02C87f0fPq8qwb1BF3K+9Q@mail.gmail.com>
Date: Wed, 5 Apr 2023 09:43:36 -0700
Message-ID: <CAAa6QmTLXSvygQQNk=8C4pB3D2Twy1guzo=+-aXhCqNAE3Q3MA@mail.gmail.com>
Subject: Re: [PATCH v2] mm: khugepaged: Fix kernel BUG in
 hpage_collapse_scan_file
To: Yang Shi <shy828301@gmail.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
 akpm@linux-foundation.org, linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Zach O'Keefe via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Zach O'Keefe <zokeefe@google.com>
Content-Type: multipart/mixed; boundary="===============8971795042681613500=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8971795042681613500==
Content-Type: multipart/alternative; boundary="000000000000018df005f8997fc3"

--000000000000018df005f8997fc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 5:58 PM Yang Shi <shy828301@gmail.com> wrote:

> On Thu, Mar 30, 2023 at 6:33=E2=80=AFPM Zach O'Keefe <zokeefe@google.com>=
 wrote:
> >
> > On Mar 30 19:53, Ivan Orlov wrote:
> > > Syzkaller reported the following issue:
> > >
> > > kernel BUG at mm/khugepaged.c:1823!
> > > invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> > > CPU: 1 PID: 5097 Comm: syz-executor220 Not tainted
> 6.2.0-syzkaller-13154-g857f1268a591 #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine,
> BIOS Google 02/16/2023
> > > RIP: 0010:collapse_file mm/khugepaged.c:1823 [inline]
> > > RIP: 0010:hpage_collapse_scan_file+0x67c8/0x7580 mm/khugepaged.c:2233
> > > Code: 00 00 89 de e8 c9 66 a3 ff 31 ff 89 de e8 c0 66 a3 ff 45 84 f6
> 0f 85 28 0d 00 00 e8 22 64 a3 ff e9 dc f7 ff ff e8 18 64 a3 ff <0f> 0b f3
> 0f 1e fa e8 0d 64 a3 ff e9 93 f6 ff ff f3 0f 1e fa 4c 89
> > > RSP: 0018:ffffc90003dff4e0 EFLAGS: 00010093
> > > RAX: ffffffff81e95988 RBX: 00000000000001c1 RCX: ffff8880205b3a80
> > > RDX: 0000000000000000 RSI: 00000000000001c0 RDI: 00000000000001c1
> > > RBP: ffffc90003dff830 R08: ffffffff81e90e67 R09: fffffbfff1a433c3
> > > R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000000
> > > R13: ffffc90003dff6c0 R14: 00000000000001c0 R15: 0000000000000000
> > > FS:  00007fdbae5ee700(0000) GS:ffff8880b9900000(0000)
> knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00007fdbae6901e0 CR3: 000000007b2dd000 CR4: 00000000003506e0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > Call Trace:
> > >  <TASK>
> > >  madvise_collapse+0x721/0xf50 mm/khugepaged.c:2693
> > >  madvise_vma_behavior mm/madvise.c:1086 [inline]
> > >  madvise_walk_vmas mm/madvise.c:1260 [inline]
> > >  do_madvise+0x9e5/0x4680 mm/madvise.c:1439
> > >  __do_sys_madvise mm/madvise.c:1452 [inline]
> > >  __se_sys_madvise mm/madvise.c:1450 [inline]
> > >  __x64_sys_madvise+0xa5/0xb0 mm/madvise.c:1450
> > >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > >  do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
> > >  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > >
> >
> > Thanks, Ivan.
> >
> > In the process of reviewing this, I starting thinking if the !shmem cas=
e
> was
> > also susceptible to a similar race, and I *think* it might be.
> Unfortunately, my
> > time has ran out, and I haven't been able to validate ; I'm less
> familiar with
> > the file-side of things.
> >
> > The underlying problem is race with truncation/hole-punch  under OOM
> condition.
> > The nice do-while loop near the top of collapse_file() attempts to avoi=
d
> this
> > scenario by making sure enough slots are available. However, when we
> drop xarray
> > lock, we open ourselves up to concurrent removal + slot deletion. Those
> slots
> > then need to be allocated again -- which under OOM condition is failabl=
e.
> >
> > The syzbot reproducer picks on shmem, but I think this can occur for
> file as
> > well. If we find a hole, we unlock the xarray and call
> > page_cache_sync_readahead(), which if it succeeds, IIUC, will have
> allocated a
> > new slot in our mapping pointing to the new page. We *then* locks the
> page. Only
> > after the page is locked are we protected from concurrent removal (Note=
:
> this is
> > what provides us protection in many of the xas_store() cases ; we've
> held the
> > slot's contained page-lock since verifying the slot exists, protecting
> us from
> > removal / reallocation races).
>
> IIUC, the find_lock_page() should be able to handle the race. It does
> check whether the page is truncated or not after locking the page.
>

Ugh. Duh. You=E2=80=99re right, and I=E2=80=99m not sure how I missed that =
implication; we
*did* succeed in locking the page in page cache. Well, the above rant just
looks foolish now.

Anyways, sorry for the false alarm, Ivan, and thanks for keeping me honest,
Yang!




> >
> > Maybe I'm just low on caffeine at the end of the day, and am missing
> something,
> > but if I had more time, I'd be looking into the file-side some more to
> verify.
> > Apologies that hasn't occurred to me until now ; I was looking at one o=
f
> your
> > comments and double-checked why I *thought* we were safe.
> >
> > Anyways, irrespective of that looming issues, some more notes to follow=
:
> >
> > > The 'xas_store' call during page cache scanning can potentially
> > > translate 'xas' into the error state (with the reproducer provided
> > > by the syzkaller the error code is -ENOMEM). However, there are no
> > > further checks after the 'xas_store', and the next call of 'xas_next'
> > > at the start of the scanning cycle doesn't increase the xa_index,
> > > and the issue occurs.
> > >
> > > This patch will add the xarray state error checking after the
> > > 'xas_store' and the corresponding result error code. It will
> > > also add xarray state error checking via WARN_ON_ONCE macros,
> > > to be sure that ENOMEM or other possible errors don't occur
> > > at the places they shouldn't.
> >
> > Thanks for the additions here. I think it's worthwhile providing even
> more
> > details about the specifics of the race we are fixing and/or guarding
> against to
> > help ppl understand how that -ENOMEM comes about if the do-while loop h=
as
> > "Ensured" we have slots available (additionally, I think that comment
> can be
> > augmented).
> >
> > > Tested via syzbot.
> > >
> > > Reported-by: syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com
> > > Link:
> https://syzkaller.appspot.com/bug?id=3D7d6bb3760e026ece7524500fe44fb024a0=
e959fc
> > > Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> > > ---
> > > V1 -> V2: Add WARN_ON_ONCE error checking and comments
> > >
> > >  mm/khugepaged.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > index 92e6f56a932d..8b6580b13339 100644
> > > --- a/mm/khugepaged.c
> > > +++ b/mm/khugepaged.c
> > > @@ -55,6 +55,7 @@ enum scan_result {
> > >       SCAN_CGROUP_CHARGE_FAIL,
> > >       SCAN_TRUNCATED,
> > >       SCAN_PAGE_HAS_PRIVATE,
> > > +     SCAN_STORE_FAILED,
> > >  };
> >
> > I'm still reluctant to add a new error code for this as this seems like
> quite a
> > rare race that requires OOM to trigger. I'd be happier just reusing
> SCAN_FAIL,
> > or, something we might get some millage out of later: SCAN_OOM.
> >
> > Also, a reminder to update include/trace/events/huge_memory.h, if you g=
o
> that
> > route.
> >
> > >
> > >  #define CREATE_TRACE_POINTS
> > > @@ -1840,6 +1841,15 @@ static int collapse_file(struct mm_struct *mm,
> unsigned long addr,
> > >                                       goto xa_locked;
> > >                               }
> > >                               xas_store(&xas, hpage);
> > > +                             if (xas_error(&xas)) {
> > > +                                     /* revert shmem_charge performe=
d
> > > +                                      * in the previous condition
> > > +                                      */
> >
> > Nit: Here, and following, I think standard convention for multiline
> comment is
> > to have an empty first and last line, eg:
> >
> >  +                                      /*
> >  +                                       * revert shmem_charge performe=
d
> >  +                                       * in the previous condition
> >  +                                       */
> >
> > Though, checkpatch.pl --strict didn't seem to care.
> >
> > > +                                     mapping->nrpages--;
> > > +                                     shmem_uncharge(mapping->host, 1=
);
> > > +                                     result =3D SCAN_STORE_FAILED;
> > > +                                     goto xa_locked;
> > > +                             }
> > >                               nr_none++;
> > >                               continue;
> > >                       }
> > > @@ -1992,6 +2002,11 @@ static int collapse_file(struct mm_struct *mm,
> unsigned long addr,
> > >
> > >               /* Finally, replace with the new page. */
> > >               xas_store(&xas, hpage);
> > > +             /* We can't get an ENOMEM here (because the allocation
> happened before)
> > > +              * but let's check for errors (XArray implementation ca=
n
> be
> > > +              * changed in the future)
> > > +              */
> > > +             WARN_ON_ONCE(xas_error(&xas));
> >
> > Nit: it's not just that allocation happened before -- need some
> guarantee we've
> > been protected from concurrent removal. This is what made me look at th=
e
> file
> > side.
> >
> > >               continue;
> > >  out_unlock:
> > >               unlock_page(page);
> > > @@ -2029,6 +2044,11 @@ static int collapse_file(struct mm_struct *mm,
> unsigned long addr,
> > >       /* Join all the small entries into a single multi-index entry *=
/
> > >       xas_set_order(&xas, start, HPAGE_PMD_ORDER);
> > >       xas_store(&xas, hpage);
> > > +     /* Here we can't get an ENOMEM (because entries were
> > > +      * previously allocated) But let's check for errors
> > > +      * (XArray implementation can be changed in the future)
> > > +      */
> > > +     WARN_ON_ONCE(xas_error(&xas));
> >
> > Ditto.
> >
> > Apologies I won't be around to see this change through -- I'm just out
> of time,
> > and will be shutting my computer down tomorrow for 3 months.  Sorry for
> the poor
> > timing, for raising issues, then disappearing. Hopefully I'm wrong and
> the
> > file-side isn't a concern.
> >
> > Best,
> > Zach
> >
> > >  xa_locked:
> > >       xas_unlock_irq(&xas);
> > >  xa_unlocked:
> > > --
> > > 2.34.1
> > >
>
>

--000000000000018df005f8997fc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 3, 2023 at 5:58 PM Yang Shi &lt;<a href=3D"mail=
to:shy828301@gmail.com">shy828301@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)">On Thu, Mar 30, 2023 at 6:33=E2=80=AFPM Zach O&#39;Keefe &lt;<a h=
ref=3D"mailto:zokeefe@google.com" target=3D"_blank">zokeefe@google.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; On Mar 30 19:53, Ivan Orlov wrote:<br>
&gt; &gt; Syzkaller reported the following issue:<br>
&gt; &gt;<br>
&gt; &gt; kernel BUG at mm/khugepaged.c:1823!<br>
&gt; &gt; invalid opcode: 0000 [#1] PREEMPT SMP KASAN<br>
&gt; &gt; CPU: 1 PID: 5097 Comm: syz-executor220 Not tainted 6.2.0-syzkalle=
r-13154-g857f1268a591 #0<br>
&gt; &gt; Hardware name: Google Google Compute Engine/Google Compute Engine=
, BIOS Google 02/16/2023<br>
&gt; &gt; RIP: 0010:collapse_file mm/khugepaged.c:1823 [inline]<br>
&gt; &gt; RIP: 0010:hpage_collapse_scan_file+0x67c8/0x7580 mm/khugepaged.c:=
2233<br>
&gt; &gt; Code: 00 00 89 de e8 c9 66 a3 ff 31 ff 89 de e8 c0 66 a3 ff 45 84=
 f6 0f 85 28 0d 00 00 e8 22 64 a3 ff e9 dc f7 ff ff e8 18 64 a3 ff &lt;0f&g=
t; 0b f3 0f 1e fa e8 0d 64 a3 ff e9 93 f6 ff ff f3 0f 1e fa 4c 89<br>
&gt; &gt; RSP: 0018:ffffc90003dff4e0 EFLAGS: 00010093<br>
&gt; &gt; RAX: ffffffff81e95988 RBX: 00000000000001c1 RCX: ffff8880205b3a80=
<br>
&gt; &gt; RDX: 0000000000000000 RSI: 00000000000001c0 RDI: 00000000000001c1=
<br>
&gt; &gt; RBP: ffffc90003dff830 R08: ffffffff81e90e67 R09: fffffbfff1a433c3=
<br>
&gt; &gt; R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000000=
<br>
&gt; &gt; R13: ffffc90003dff6c0 R14: 00000000000001c0 R15: 0000000000000000=
<br>
&gt; &gt; FS:=C2=A0 00007fdbae5ee700(0000) GS:ffff8880b9900000(0000) knlGS:=
0000000000000000<br>
&gt; &gt; CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033<br>
&gt; &gt; CR2: 00007fdbae6901e0 CR3: 000000007b2dd000 CR4: 00000000003506e0=
<br>
&gt; &gt; DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000=
<br>
&gt; &gt; DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400=
<br>
&gt; &gt; Call Trace:<br>
&gt; &gt;=C2=A0 &lt;TASK&gt;<br>
&gt; &gt;=C2=A0 madvise_collapse+0x721/0xf50 mm/khugepaged.c:2693<br>
&gt; &gt;=C2=A0 madvise_vma_behavior mm/madvise.c:1086 [inline]<br>
&gt; &gt;=C2=A0 madvise_walk_vmas mm/madvise.c:1260 [inline]<br>
&gt; &gt;=C2=A0 do_madvise+0x9e5/0x4680 mm/madvise.c:1439<br>
&gt; &gt;=C2=A0 __do_sys_madvise mm/madvise.c:1452 [inline]<br>
&gt; &gt;=C2=A0 __se_sys_madvise mm/madvise.c:1450 [inline]<br>
&gt; &gt;=C2=A0 __x64_sys_madvise+0xa5/0xb0 mm/madvise.c:1450<br>
&gt; &gt;=C2=A0 do_syscall_x64 arch/x86/entry/common.c:50 [inline]<br>
&gt; &gt;=C2=A0 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80<br>
&gt; &gt;=C2=A0 entry_SYSCALL_64_after_hwframe+0x63/0xcd<br>
&gt; &gt;<br>
&gt;<br>
&gt; Thanks, Ivan.<br>
&gt;<br>
&gt; In the process of reviewing this, I starting thinking if the !shmem ca=
se was<br>
&gt; also susceptible to a similar race, and I *think* it might be. Unfortu=
nately, my<br>
&gt; time has ran out, and I haven&#39;t been able to validate ; I&#39;m le=
ss familiar with<br>
&gt; the file-side of things.<br>
&gt;<br>
&gt; The underlying problem is race with truncation/hole-punch=C2=A0 under =
OOM condition.<br>
&gt; The nice do-while loop near the top of collapse_file() attempts to avo=
id this<br>
&gt; scenario by making sure enough slots are available. However, when we d=
rop xarray<br>
&gt; lock, we open ourselves up to concurrent removal + slot deletion. Thos=
e slots<br>
&gt; then need to be allocated again -- which under OOM condition is failab=
le.<br>
&gt;<br>
&gt; The syzbot reproducer picks on shmem, but I think this can occur for f=
ile as<br>
&gt; well. If we find a hole, we unlock the xarray and call<br>
&gt; page_cache_sync_readahead(), which if it succeeds, IIUC, will have all=
ocated a<br>
&gt; new slot in our mapping pointing to the new page. We *then* locks the =
page. Only<br>
&gt; after the page is locked are we protected from concurrent removal (Not=
e: this is<br>
&gt; what provides us protection in many of the xas_store() cases ; we&#39;=
ve held the<br>
&gt; slot&#39;s contained page-lock since verifying the slot exists, protec=
ting us from<br>
&gt; removal / reallocation races).<br>
<br>
IIUC, the find_lock_page() should be able to handle the race. It does<br>
check whether the page is truncated or not after locking the page.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ugh. Duh. You=E2=
=80=99re right, and I=E2=80=99m not sure how I missed that implication; we =
*did* succeed in locking the page in page cache. Well, the above rant just =
looks foolish now.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Anywa=
ys, sorry for the false alarm, Ivan, and thanks for keeping me honest, Yang=
!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)"><br>
&gt;<br>
&gt; Maybe I&#39;m just low on caffeine at the end of the day, and am missi=
ng something,<br>
&gt; but if I had more time, I&#39;d be looking into the file-side some mor=
e to verify.<br>
&gt; Apologies that hasn&#39;t occurred to me until now ; I was looking at =
one of your<br>
&gt; comments and double-checked why I *thought* we were safe.<br>
&gt;<br>
&gt; Anyways, irrespective of that looming issues, some more notes to follo=
w:<br>
&gt;<br>
&gt; &gt; The &#39;xas_store&#39; call during page cache scanning can poten=
tially<br>
&gt; &gt; translate &#39;xas&#39; into the error state (with the reproducer=
 provided<br>
&gt; &gt; by the syzkaller the error code is -ENOMEM). However, there are n=
o<br>
&gt; &gt; further checks after the &#39;xas_store&#39;, and the next call o=
f &#39;xas_next&#39;<br>
&gt; &gt; at the start of the scanning cycle doesn&#39;t increase the xa_in=
dex,<br>
&gt; &gt; and the issue occurs.<br>
&gt; &gt;<br>
&gt; &gt; This patch will add the xarray state error checking after the<br>
&gt; &gt; &#39;xas_store&#39; and the corresponding result error code. It w=
ill<br>
&gt; &gt; also add xarray state error checking via WARN_ON_ONCE macros,<br>
&gt; &gt; to be sure that ENOMEM or other possible errors don&#39;t occur<b=
r>
&gt; &gt; at the places they shouldn&#39;t.<br>
&gt;<br>
&gt; Thanks for the additions here. I think it&#39;s worthwhile providing e=
ven more<br>
&gt; details about the specifics of the race we are fixing and/or guarding =
against to<br>
&gt; help ppl understand how that -ENOMEM comes about if the do-while loop =
has<br>
&gt; &quot;Ensured&quot; we have slots available (additionally, I think tha=
t comment can be<br>
&gt; augmented).<br>
&gt;<br>
&gt; &gt; Tested via syzbot.<br>
&gt; &gt;<br>
&gt; &gt; Reported-by: <a href=3D"mailto:syzbot%2B9578faa5475acb35fa50@syzk=
aller.appspotmail.com" target=3D"_blank">syzbot+9578faa5475acb35fa50@syzkal=
ler.appspotmail.com</a><br>
&gt; &gt; Link: <a href=3D"https://syzkaller.appspot.com/bug?id=3D7d6bb3760=
e026ece7524500fe44fb024a0e959fc" rel=3D"noreferrer" target=3D"_blank">https=
://syzkaller.appspot.com/bug?id=3D7d6bb3760e026ece7524500fe44fb024a0e959fc<=
/a><br>
&gt; &gt; Signed-off-by: Ivan Orlov &lt;<a href=3D"mailto:ivan.orlov0322@gm=
ail.com" target=3D"_blank">ivan.orlov0322@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; V1 -&gt; V2: Add WARN_ON_ONCE error checking and comments<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 mm/khugepaged.c | 20 ++++++++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 20 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/mm/khugepaged.c b/mm/khugepaged.c<br>
&gt; &gt; index 92e6f56a932d..8b6580b13339 100644<br>
&gt; &gt; --- a/mm/khugepaged.c<br>
&gt; &gt; +++ b/mm/khugepaged.c<br>
&gt; &gt; @@ -55,6 +55,7 @@ enum scan_result {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SCAN_CGROUP_CHARGE_FAIL,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SCAN_TRUNCATED,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SCAN_PAGE_HAS_PRIVATE,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0SCAN_STORE_FAILED,<br>
&gt; &gt;=C2=A0 };<br>
&gt;<br>
&gt; I&#39;m still reluctant to add a new error code for this as this seems=
 like quite a<br>
&gt; rare race that requires OOM to trigger. I&#39;d be happier just reusin=
g SCAN_FAIL,<br>
&gt; or, something we might get some millage out of later: SCAN_OOM.<br>
&gt;<br>
&gt; Also, a reminder to update include/trace/events/huge_memory.h, if you =
go that<br>
&gt; route.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #define CREATE_TRACE_POINTS<br>
&gt; &gt; @@ -1840,6 +1841,15 @@ static int collapse_file(struct mm_struct =
*mm, unsigned long addr,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0go=
to xa_locked;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xas_store(&amp;xas, hpage);<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (xas_error(&amp;xas)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* rev=
ert shmem_charge performed<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in =
the previous condition<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br=
>
&gt;<br>
&gt; Nit: Here, and following, I think standard convention for multiline co=
mment is<br>
&gt; to have an empty first and last line, eg:<br>
&gt;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br=
>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* revert shmem_charge performed<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* in the previous condition<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*/<br>
&gt;<br>
&gt; Though, <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"=
_blank">checkpatch.pl</a> --strict didn&#39;t seem to care.<br>
&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mappin=
g-&gt;nrpages--;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shmem_=
uncharge(mapping-&gt;host, 1);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result=
 =3D SCAN_STORE_FAILED;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto x=
a_locked;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nr_none++;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; @@ -1992,6 +2002,11 @@ static int collapse_file(struct mm_struct =
*mm, unsigned long addr,<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Finally,=
 replace with the new page. */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xas_store(&=
amp;xas, hpage);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We can&#39;t =
get an ENOMEM here (because the allocation happened before)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * but let&#39;s=
 check for errors (XArray implementation can be<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * changed in th=
e future)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON_ONCE(xas=
_error(&amp;xas));<br>
&gt;<br>
&gt; Nit: it&#39;s not just that allocation happened before -- need some gu=
arantee we&#39;ve<br>
&gt; been protected from concurrent removal. This is what made me look at t=
he file<br>
&gt; side.<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<b=
r>
&gt; &gt;=C2=A0 out_unlock:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_page=
(page);<br>
&gt; &gt; @@ -2029,6 +2044,11 @@ static int collapse_file(struct mm_struct =
*mm, unsigned long addr,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Join all the small entries into a si=
ngle multi-index entry */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xas_set_order(&amp;xas, start, HPAGE_PM=
D_ORDER);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xas_store(&amp;xas, hpage);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Here we can&#39;t get an ENOMEM (because =
entries were<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * previously allocated) But let&#39;s check=
 for errors<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * (XArray implementation can be changed in =
the future)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0WARN_ON_ONCE(xas_error(&amp;xas));<br>
&gt;<br>
&gt; Ditto.<br>
&gt;<br>
&gt; Apologies I won&#39;t be around to see this change through -- I&#39;m =
just out of time,<br>
&gt; and will be shutting my computer down tomorrow for 3 months.=C2=A0 Sor=
ry for the poor<br>
&gt; timing, for raising issues, then disappearing. Hopefully I&#39;m wrong=
 and the<br>
&gt; file-side isn&#39;t a concern.<br>
&gt;<br>
&gt; Best,<br>
&gt; Zach<br>
&gt;<br>
&gt; &gt;=C2=A0 xa_locked:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xas_unlock_irq(&amp;xas);<br>
&gt; &gt;=C2=A0 xa_unlocked:<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
<br>
</blockquote></div></div>

--000000000000018df005f8997fc3--

--===============8971795042681613500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8971795042681613500==--
