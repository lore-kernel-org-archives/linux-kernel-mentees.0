Return-Path: <SRS0=jjuT=LB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA179C47082
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Jun 2021 07:39:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A2846121F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Jun 2021 07:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A2846121F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 374B7400E3;
	Mon,  7 Jun 2021 07:39:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoCKDdnlqfOW; Mon,  7 Jun 2021 07:39:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67F840291;
	Mon,  7 Jun 2021 07:39:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D26BC0030;
	Mon,  7 Jun 2021 07:39:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A611C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Jun 2021 07:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FB29607E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Jun 2021 07:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehW6y8t9-hhM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Jun 2021 07:38:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E62E607BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Jun 2021 07:38:56 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id t9so5463759qtw.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Jun 2021 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FkDnZkLm7S26Fub+7GJQrbQgH8zlz9fkqHVVt8EUVII=;
 b=nHm4WK6cYXy60WGLih3X49PfQoCmkrbdxEffYKfbL3/RwZaUJn+ZpFlw1f4qhBKOsh
 ahRqwNfz/pELzJOgvhEH7fSmrENCdPGqiDPPnxASXGD5q9sd6Dk5WUdbdBbPUArWSpgz
 YhjtWV0vG8EhX7zQlQ+lNbW/aFKCucpeFKWsmDvBb4gvT3urI0A7KLePEk+N9605Vxec
 pkm2nZH26PbCFEe3Rt8MWK2GYZWEhX1zJkTawVJymWS9/t+exzEZtixnPBaQ3CKp7qxO
 KJPc74KVXSeqk4iHCZH7tGPVflFVx/UFdpy6RZ1xAkh+rjGRzUNDiP+yZ5nLQUld/tUh
 Nh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkDnZkLm7S26Fub+7GJQrbQgH8zlz9fkqHVVt8EUVII=;
 b=UNkvCjn5wU1b68Ov/MrJYscJHHydeDBYqHwMWYfNLo88D9s7td8Ajtk/HRlDJ9OR9F
 6RqQ2QGMT+hl9+FSCjbT73ui74EVXa4lqxf36EDDDr2I5I5ch8lIAcK1q/esQ1v5YGLU
 rZKPYRa2f4DDgCd1P6DsEXL6SNGaOoNwUPl9FhdVBXM3gjmL1aVUvQGnJCUKZN9Kv1aA
 LU6X/YBvn15owRLK1R22PCFXK+9zkTAwO+rdVLGt/TubxNgu9U+z/IKdgWrDQpiD8q2j
 YBbbqc1L52TwZwR9o6X1MmL/iP65AlN3bfGWwe6EeTZKuE1GAaIHQBAOsqGBSNq4hxWy
 REZA==
X-Gm-Message-State: AOAM533D5PaF867SDNBWn029EMZex7uoUOkyiuLrgrfbs9M42aclIcyR
 6jSThbdQQPGLmFkj95WAuSo3ymUqo7BS0MqnIo2JQw==
X-Google-Smtp-Source: ABdhPJw+kgwDX9eCqL8hOPDdudAvKTGNSsQ1Stvnfjs7IZaa/qdT3iEe5T8MNwE87hz52U2sn3g3U6qP7w8/LoXc35w=
X-Received: by 2002:ac8:7c4e:: with SMTP id o14mr14825948qtv.290.1623051534847; 
 Mon, 07 Jun 2021 00:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c2987605be907e41@google.com>
 <20210602212726.7-1-fuzzybritches0@gmail.com>
 <YLhd8BL3HGItbXmx@kroah.com> <87609-531187-curtm@phaethon>
 <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
 <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
In-Reply-To: <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
Date: Mon, 7 Jun 2021 09:38:43 +0200
Message-ID: <CACT4Y+b=si6NCx=nRHKm_pziXnVMmLo-eSuRajsxmx5+Hy_ycg@mail.gmail.com>
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Song Liu <songliubraving@fb.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
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

On Sat, Jun 5, 2021 at 9:10 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Sat, Jun 5, 2021 at 10:55 AM Yonghong Song <yhs@fb.com> wrote:
> > On 6/5/21 8:01 AM, Kurt Manucredo wrote:
> > > Syzbot detects a shift-out-of-bounds in ___bpf_prog_run()
> > > kernel/bpf/core.c:1414:2.
> >
> > This is not enough. We need more information on why this happens
> > so we can judge whether the patch indeed fixed the issue.
> >
> > >
> > > I propose: In adjust_scalar_min_max_vals() move boundary check up to avoid
> > > missing them and return with error when detected.
> > >
> > > Reported-and-tested-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> > > Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
> > > ---
> > >
> > > https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> > >
> > > Changelog:
> > > ----------
> > > v4 - Fix shift-out-of-bounds in adjust_scalar_min_max_vals.
> > >       Fix commit message.
> > > v3 - Make it clearer what the fix is for.
> > > v2 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> > >       check in check_alu_op() in verifier.c.
> > > v1 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> > >       check in ___bpf_prog_run().
> > >
> > > thanks
> > >
> > > kind regards
> > >
> > > Kurt
> > >
> > >   kernel/bpf/verifier.c | 30 +++++++++---------------------
> > >   1 file changed, 9 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > > index 94ba5163d4c5..ed0eecf20de5 100644
> > > --- a/kernel/bpf/verifier.c
> > > +++ b/kernel/bpf/verifier.c
> > > @@ -7510,6 +7510,15 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> > >       u32_min_val = src_reg.u32_min_value;
> > >       u32_max_val = src_reg.u32_max_value;
> > >
> > > +     if ((opcode == BPF_LSH || opcode == BPF_RSH || opcode == BPF_ARSH) &&
> > > +                     umax_val >= insn_bitness) {
> > > +             /* Shifts greater than 31 or 63 are undefined.
> > > +              * This includes shifts by a negative number.
> > > +              */
> > > +             verbose(env, "invalid shift %lld\n", umax_val);
> > > +             return -EINVAL;
> > > +     }
> >
> > I think your fix is good. I would like to move after
>
> I suspect such change will break valid programs that do shift by register.
>
> > the following code though:
> >
> >          if (!src_known &&
> >              opcode != BPF_ADD && opcode != BPF_SUB && opcode != BPF_AND) {
> >                  __mark_reg_unknown(env, dst_reg);
> >                  return 0;
> >          }
> >
> > > +
> > >       if (alu32) {
> > >               src_known = tnum_subreg_is_const(src_reg.var_off);
> > >               if ((src_known &&
> > > @@ -7592,39 +7601,18 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> > >               scalar_min_max_xor(dst_reg, &src_reg);
> > >               break;
> > >       case BPF_LSH:
> > > -             if (umax_val >= insn_bitness) {
> > > -                     /* Shifts greater than 31 or 63 are undefined.
> > > -                      * This includes shifts by a negative number.
> > > -                      */
> > > -                     mark_reg_unknown(env, regs, insn->dst_reg);
> > > -                     break;
> > > -             }
> >
> > I think this is what happens. For the above case, we simply
> > marks the dst reg as unknown and didn't fail verification.
> > So later on at runtime, the shift optimization will have wrong
> > shift value (> 31/64). Please correct me if this is not right
> > analysis. As I mentioned in the early please write detailed
> > analysis in commit log.
>
> The large shift is not wrong. It's just undefined.
> syzbot has to ignore such cases.

Hi Alexei,

The report is produced by KUBSAN. I thought there was an agreement on
cleaning up KUBSAN reports from the kernel (the subset enabled on
syzbot at least).
What exactly cases should KUBSAN ignore?
+linux-hardening/kasan-dev for KUBSAN false positive
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
