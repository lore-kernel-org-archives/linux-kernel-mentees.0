Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46943C47094
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 05:32:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0CE1613E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 05:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0CE1613E2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53A2F60745;
	Thu, 10 Jun 2021 05:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Tks7IS4ZvBy; Thu, 10 Jun 2021 05:32:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4DDDB6061F;
	Thu, 10 Jun 2021 05:32:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F328C000E;
	Thu, 10 Jun 2021 05:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCF2BC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 05:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A43B640599
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 05:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uM-IBa8HioEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 05:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 120E340594
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 05:32:37 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id u14so11205908qvq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Jun 2021 22:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OaVwnGtK9jh2uHt5Ipx2vrWPn+KDUOXrS2y79saIzrk=;
 b=LVuckSqOTYzxTsUyz/Dn8mquXY7TuARv2fApO1OjzaIq/krnrR5d5ShV+lUflmO6Fz
 sSGKHXNWk/tgIIIHDNg+pGfzKn7Ij6Zvcuw47GW8BrKJG1Pwv/sW2vav62DwI37IgXoh
 6CDEJwoa3NhF5YygebCPdY/XS9lc9Qax0HWp5bhaOBYgSmfN9pehgzm+Niu7t8fS7ioW
 HNf0bjXiJcDigUzABktmGUNYqmhaPmJt91XrVmsJJan64o6ItFsbHqRGu/2doopvFRuN
 4pghcbCmmzTM30tSHsmXGlf293hIE0belEUweoRZkaLT9l7XbckAnVFMsZTl56EwNiCK
 9LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OaVwnGtK9jh2uHt5Ipx2vrWPn+KDUOXrS2y79saIzrk=;
 b=gTFlSXqr7yMLoeLlwQYJeYslJsGNPDHDVV0wt/k0wtZEizW2+2QspWo9zg4DDR4olK
 Dp9Y6DeLzNMmXm7ncFCiPg0J6ovH5vzysRzFjw/dqc4y0xHKJ5Wcbqg23NQhVg4wLgNv
 IWw29q9+lJTPwaVtas/SJgMFbcVSP0Q+zRvLBoNEOHaUEcuOqbGOfZuZbb0aQ97BAFKK
 PB5jsCSQYxfAK3YVYzFclDObtaHW5eOjiQ/QBVMdvDq6D9z0k0seA5clrxyxCUROy35C
 8syOOz2gc9Hojo0ZfaQjyv3XquB2aGiX8rTMAT1Y/dPeAmtKBHTs1ZxiL9wUmJCYgHXt
 +/AA==
X-Gm-Message-State: AOAM531XvcztvWL0FkH6SSUWKDibbP8AzOFcb7nAB37rfqbiqx04fz1V
 zE+0SVKXvOBJjte9+g52W97YiiGcZ/yrESILN0ZHAw==
X-Google-Smtp-Source: ABdhPJwu7pmXAMs2V9ZXOoDK5dq+cT/fCHwSY6uePqbHFnmbXsUP9knMcgVtIw6TjYPoFfcTLio3a7Cw5RC0WPxmb2I=
X-Received: by 2002:a0c:d610:: with SMTP id c16mr3488166qvj.13.1623303156474; 
 Wed, 09 Jun 2021 22:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c2987605be907e41@google.com>
 <20210602212726.7-1-fuzzybritches0@gmail.com>
 <YLhd8BL3HGItbXmx@kroah.com> <87609-531187-curtm@phaethon>
 <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
 <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
 <CACT4Y+b=si6NCx=nRHKm_pziXnVMmLo-eSuRajsxmx5+Hy_ycg@mail.gmail.com>
 <202106091119.84A88B6FE7@keescook>
 <752cb1ad-a0b1-92b7-4c49-bbb42fdecdbe@fb.com>
In-Reply-To: <752cb1ad-a0b1-92b7-4c49-bbb42fdecdbe@fb.com>
Date: Thu, 10 Jun 2021 07:32:24 +0200
Message-ID: <CACT4Y+a592rxFmNgJgk2zwqBE8EqW1ey9SjF_-U3z6gt3Yc=oA@mail.gmail.com>
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
To: Yonghong Song <yhs@fb.com>
Cc: Song Liu <songliubraving@fb.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kees Cook <keescook@chromium.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 KP Singh <kpsingh@kernel.org>, nathan@kernel.org,
 Network Development <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Jun 10, 2021 at 1:40 AM Yonghong Song <yhs@fb.com> wrote:
> On 6/9/21 11:20 AM, Kees Cook wrote:
> > On Mon, Jun 07, 2021 at 09:38:43AM +0200, 'Dmitry Vyukov' via Clang Built Linux wrote:
> >> On Sat, Jun 5, 2021 at 9:10 PM Alexei Starovoitov
> >> <alexei.starovoitov@gmail.com> wrote:
> >>> On Sat, Jun 5, 2021 at 10:55 AM Yonghong Song <yhs@fb.com> wrote:
> >>>> On 6/5/21 8:01 AM, Kurt Manucredo wrote:
> >>>>> Syzbot detects a shift-out-of-bounds in ___bpf_prog_run()
> >>>>> kernel/bpf/core.c:1414:2.
> >>>>
> >>>> This is not enough. We need more information on why this happens
> >>>> so we can judge whether the patch indeed fixed the issue.
> >>>>
> >>>>>
> >>>>> I propose: In adjust_scalar_min_max_vals() move boundary check up to avoid
> >>>>> missing them and return with error when detected.
> >>>>>
> >>>>> Reported-and-tested-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> >>>>> Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
> >>>>> ---
> >>>>>
> >>>>> https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> >>>>>
> >>>>> Changelog:
> >>>>> ----------
> >>>>> v4 - Fix shift-out-of-bounds in adjust_scalar_min_max_vals.
> >>>>>        Fix commit message.
> >>>>> v3 - Make it clearer what the fix is for.
> >>>>> v2 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> >>>>>        check in check_alu_op() in verifier.c.
> >>>>> v1 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> >>>>>        check in ___bpf_prog_run().
> >>>>>
> >>>>> thanks
> >>>>>
> >>>>> kind regards
> >>>>>
> >>>>> Kurt
> >>>>>
> >>>>>    kernel/bpf/verifier.c | 30 +++++++++---------------------
> >>>>>    1 file changed, 9 insertions(+), 21 deletions(-)
> >>>>>
> >>>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> >>>>> index 94ba5163d4c5..ed0eecf20de5 100644
> >>>>> --- a/kernel/bpf/verifier.c
> >>>>> +++ b/kernel/bpf/verifier.c
> >>>>> @@ -7510,6 +7510,15 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> >>>>>        u32_min_val = src_reg.u32_min_value;
> >>>>>        u32_max_val = src_reg.u32_max_value;
> >>>>>
> >>>>> +     if ((opcode == BPF_LSH || opcode == BPF_RSH || opcode == BPF_ARSH) &&
> >>>>> +                     umax_val >= insn_bitness) {
> >>>>> +             /* Shifts greater than 31 or 63 are undefined.
> >>>>> +              * This includes shifts by a negative number.
> >>>>> +              */
> >>>>> +             verbose(env, "invalid shift %lld\n", umax_val);
> >>>>> +             return -EINVAL;
> >>>>> +     }
> >>>>
> >>>> I think your fix is good. I would like to move after
> >>>
> >>> I suspect such change will break valid programs that do shift by register.
> >>>
> >>>> the following code though:
> >>>>
> >>>>           if (!src_known &&
> >>>>               opcode != BPF_ADD && opcode != BPF_SUB && opcode != BPF_AND) {
> >>>>                   __mark_reg_unknown(env, dst_reg);
> >>>>                   return 0;
> >>>>           }
> >>>>
> >>>>> +
> >>>>>        if (alu32) {
> >>>>>                src_known = tnum_subreg_is_const(src_reg.var_off);
> >>>>>                if ((src_known &&
> >>>>> @@ -7592,39 +7601,18 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> >>>>>                scalar_min_max_xor(dst_reg, &src_reg);
> >>>>>                break;
> >>>>>        case BPF_LSH:
> >>>>> -             if (umax_val >= insn_bitness) {
> >>>>> -                     /* Shifts greater than 31 or 63 are undefined.
> >>>>> -                      * This includes shifts by a negative number.
> >>>>> -                      */
> >>>>> -                     mark_reg_unknown(env, regs, insn->dst_reg);
> >>>>> -                     break;
> >>>>> -             }
> >>>>
> >>>> I think this is what happens. For the above case, we simply
> >>>> marks the dst reg as unknown and didn't fail verification.
> >>>> So later on at runtime, the shift optimization will have wrong
> >>>> shift value (> 31/64). Please correct me if this is not right
> >>>> analysis. As I mentioned in the early please write detailed
> >>>> analysis in commit log.
> >>>
> >>> The large shift is not wrong. It's just undefined.
> >>> syzbot has to ignore such cases.
> >>
> >> Hi Alexei,
> >>
> >> The report is produced by KUBSAN. I thought there was an agreement on
> >> cleaning up KUBSAN reports from the kernel (the subset enabled on
> >> syzbot at least).
> >> What exactly cases should KUBSAN ignore?
> >> +linux-hardening/kasan-dev for KUBSAN false positive
> >
> > Can check_shl_overflow() be used at all? Best to just make things
> > readable and compiler-happy, whatever the implementation. :)
>
> This is not a compile issue. If the shift amount is a constant,
> compiler should have warned and user should fix the warning.
>
> This is because user code has
> something like
>      a << s;
> where s is a unknown variable and
> verifier just marked the result of a << s as unknown value.
> Verifier may not reject the code depending on how a << s result
> is used.
>
> If bpf program writer uses check_shl_overflow() or some kind
> of checking for shift value and won't do shifting if the
> shifting may cause an undefined result, there should not
> be any kubsan warning.

I guess the main question: what should happen if a bpf program writer
does _not_ use compiler nor check_shl_overflow()?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
