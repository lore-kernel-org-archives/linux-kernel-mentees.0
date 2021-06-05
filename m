Return-Path: <SRS0=ph3B=K7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70C3C47082
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Jun 2021 19:10:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE6E6136D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Jun 2021 19:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FE6E6136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEA08403EE;
	Sat,  5 Jun 2021 19:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4v5xuQdITuuV; Sat,  5 Jun 2021 19:10:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 139AD401B1;
	Sat,  5 Jun 2021 19:10:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4364C000E;
	Sat,  5 Jun 2021 19:10:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBF60C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 19:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C868383868
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 19:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_59aWVAS-SG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 19:10:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0BD68243B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 19:10:40 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a2so19183193lfc.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 05 Jun 2021 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bi0pwEi0pQ/oYx7SVz3LT6qWBi6qRoYFdBg0PjjtkiU=;
 b=LuXg4DkraiESutoTGMgFWtNaz/vXvFOcBH/rRyEA8MkW6FvWC7kW37LoUs75OFaVGk
 y//mqBrjlcZ/SmtFqs6n2tgyMGvdNczJlR586At142OeIxXINk2wnuAjo5flaxHqe2oN
 V+ROfCEaSuOUCKOtjF5iFK0SW+RPFMswCGkddaiXBvImx3VMDNhT8O5JJ/oq2UA9adQb
 EsHaTJvHNyycot71/VHlUzNR893T2H9nSUO85iph/BXbeiUjcSkZH4hA0A4oKUvz+di3
 zUvvwB35QRYUqcxy1vtZaHY2zS9Joe5MvEfCo1B6qVZVa5/t5fRqBErEro5W10YYZJ6L
 Ewng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bi0pwEi0pQ/oYx7SVz3LT6qWBi6qRoYFdBg0PjjtkiU=;
 b=Zba9SjESRn7/AccBwfw2zoX7MbN/jLsNKm7E6sQZf0WnN85ejkGmVtwAnkobXFY7r3
 AMwsBDxNnY5PUqgNFxLL6lxOCBodpXKQ7F49G6WktJ4IdCpdHrgvLJz/d4P2T89ex8J+
 ewVkeRzifdNCSsilhwiZ0PDoJv2hoS3tWSHKwUZOsa0BAjLPj911YOWcjqWlOMufGHQp
 xZ/+NRfR2iVc2MXUlRtAz22g5QOYHs87NnciiAbHunz38glhx2a7s7yFknj1QeuMM7ki
 Vo0WGrq0L8/EDKNL/snYfElBhfyQ9lSRqum1vYybSJdWnhlsB/mVCFL4VpebhRah3MLH
 EhGw==
X-Gm-Message-State: AOAM531EbMpr9tDs+M+ZxCaGq+FGYwoPMnZWkokLe8fnos4dR2z4Vcsv
 XoLIHTxhhjc5Mx5Sg2Uy6LQaV6Xw7wbiwYmIAYM=
X-Google-Smtp-Source: ABdhPJxkGuWFy365VSP1rud7bkI+QSPlqLX2IOttcHb7321Z43JZOgQDYk9TcAqdmKPMWykGTZgGvbVJNE4GoJz1uJM=
X-Received: by 2002:a05:6512:2010:: with SMTP id
 a16mr4002379lfb.38.1622920238423; 
 Sat, 05 Jun 2021 12:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c2987605be907e41@google.com>
 <20210602212726.7-1-fuzzybritches0@gmail.com>
 <YLhd8BL3HGItbXmx@kroah.com> <87609-531187-curtm@phaethon>
 <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
In-Reply-To: <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 5 Jun 2021 12:10:26 -0700
Message-ID: <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
To: Yonghong Song <yhs@fb.com>
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 KP Singh <kpsingh@kernel.org>, nathan@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Jun 5, 2021 at 10:55 AM Yonghong Song <yhs@fb.com> wrote:
>
>
>
> On 6/5/21 8:01 AM, Kurt Manucredo wrote:
> > Syzbot detects a shift-out-of-bounds in ___bpf_prog_run()
> > kernel/bpf/core.c:1414:2.
>
> This is not enough. We need more information on why this happens
> so we can judge whether the patch indeed fixed the issue.
>
> >
> > I propose: In adjust_scalar_min_max_vals() move boundary check up to avoid
> > missing them and return with error when detected.
> >
> > Reported-and-tested-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> > Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
> > ---
> >
> > https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> >
> > Changelog:
> > ----------
> > v4 - Fix shift-out-of-bounds in adjust_scalar_min_max_vals.
> >       Fix commit message.
> > v3 - Make it clearer what the fix is for.
> > v2 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> >       check in check_alu_op() in verifier.c.
> > v1 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> >       check in ___bpf_prog_run().
> >
> > thanks
> >
> > kind regards
> >
> > Kurt
> >
> >   kernel/bpf/verifier.c | 30 +++++++++---------------------
> >   1 file changed, 9 insertions(+), 21 deletions(-)
> >
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 94ba5163d4c5..ed0eecf20de5 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -7510,6 +7510,15 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> >       u32_min_val = src_reg.u32_min_value;
> >       u32_max_val = src_reg.u32_max_value;
> >
> > +     if ((opcode == BPF_LSH || opcode == BPF_RSH || opcode == BPF_ARSH) &&
> > +                     umax_val >= insn_bitness) {
> > +             /* Shifts greater than 31 or 63 are undefined.
> > +              * This includes shifts by a negative number.
> > +              */
> > +             verbose(env, "invalid shift %lld\n", umax_val);
> > +             return -EINVAL;
> > +     }
>
> I think your fix is good. I would like to move after

I suspect such change will break valid programs that do shift by register.

> the following code though:
>
>          if (!src_known &&
>              opcode != BPF_ADD && opcode != BPF_SUB && opcode != BPF_AND) {
>                  __mark_reg_unknown(env, dst_reg);
>                  return 0;
>          }
>
> > +
> >       if (alu32) {
> >               src_known = tnum_subreg_is_const(src_reg.var_off);
> >               if ((src_known &&
> > @@ -7592,39 +7601,18 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> >               scalar_min_max_xor(dst_reg, &src_reg);
> >               break;
> >       case BPF_LSH:
> > -             if (umax_val >= insn_bitness) {
> > -                     /* Shifts greater than 31 or 63 are undefined.
> > -                      * This includes shifts by a negative number.
> > -                      */
> > -                     mark_reg_unknown(env, regs, insn->dst_reg);
> > -                     break;
> > -             }
>
> I think this is what happens. For the above case, we simply
> marks the dst reg as unknown and didn't fail verification.
> So later on at runtime, the shift optimization will have wrong
> shift value (> 31/64). Please correct me if this is not right
> analysis. As I mentioned in the early please write detailed
> analysis in commit log.

The large shift is not wrong. It's just undefined.
syzbot has to ignore such cases.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
