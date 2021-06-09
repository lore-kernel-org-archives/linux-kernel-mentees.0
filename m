Return-Path: <SRS0=caaf=LD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749B1C48BCF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Jun 2021 18:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F7D3613D5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Jun 2021 18:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F7D3613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E581C60796;
	Wed,  9 Jun 2021 18:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQ9gM-gMGjKs; Wed,  9 Jun 2021 18:20:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EDCEA60633;
	Wed,  9 Jun 2021 18:20:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BACECC000D;
	Wed,  9 Jun 2021 18:20:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C643C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jun 2021 18:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4935460796
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jun 2021 18:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsNmg6ZgiDGi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jun 2021 18:20:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5685360633
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jun 2021 18:20:36 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id u18so19068727pfk.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Jun 2021 11:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pMNtPdB4yeaOaJg4oKXM0D8sPt6m955IeGjoIXPrk70=;
 b=PazdJpi79UQEsNsJQD2CIaSYmwpf00Mw0MCZeW5GC2zdnsa0IB92sYjdiUDujBLmOv
 3yiW/7qHaVhsPjbZomfBsLbYDeD+/ig/7taYFSIjA7Cs35U9xgJInZA2nA7XIhz+eX/f
 YAYlYYJX5H3ZqKlrBYtQLFY0ybk6rdc7RljwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pMNtPdB4yeaOaJg4oKXM0D8sPt6m955IeGjoIXPrk70=;
 b=uAndoqAtZq2AOuSRqJoKFa/E1M02adVNrtFHqlMiDdDux/vdVZAewFZEOm3HjGdnbi
 DRcomzreItbU1NPtXvI2VtdTlHGXbl+9AzRfhXR2aQRR8BpSLWycAqaIu8ZP5v4kYtvb
 z8v8wfTsdu/30GbaJlbuxJLHHF+rSol27Y8Jhx35oxV27p1y/Gcp8Ryeni4/ol7gjBeH
 gMEhMWLqo2BUjFvCzoL4y+ZUTZi8EYFDGtHo3ZaXUnO40y5aiAddtXKX3roKcVGrGvll
 DIGu3nN4iwQAqxxjYwnMoOU7e8LPVLGpiOSGtcG86TPc4pSiEfP61ETx1Vxz8xMS/Hyw
 KNjA==
X-Gm-Message-State: AOAM531UNzgy+H34p9l9hZKXL0lzFnJNAK4Rhutq211yrJWfKtCxXi+c
 B7vme0TG0g+P0umKP5zdwoCUHw==
X-Google-Smtp-Source: ABdhPJwLivfhU+7xTPT8sWB9xanESizvLeRBJblRt/PXXDrCMVDmnpcAtkIZk9u/qQeEhmYEwcu4IA==
X-Received: by 2002:a62:3444:0:b029:2ec:9658:a755 with SMTP id
 b65-20020a6234440000b02902ec9658a755mr1010418pfa.71.1623262835683; 
 Wed, 09 Jun 2021 11:20:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p14sm445214pgk.6.2021.06.09.11.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 11:20:34 -0700 (PDT)
Date: Wed, 9 Jun 2021 11:20:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Message-ID: <202106091119.84A88B6FE7@keescook>
References: <000000000000c2987605be907e41@google.com>
 <20210602212726.7-1-fuzzybritches0@gmail.com>
 <YLhd8BL3HGItbXmx@kroah.com> <87609-531187-curtm@phaethon>
 <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
 <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
 <CACT4Y+b=si6NCx=nRHKm_pziXnVMmLo-eSuRajsxmx5+Hy_ycg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+b=si6NCx=nRHKm_pziXnVMmLo-eSuRajsxmx5+Hy_ycg@mail.gmail.com>
Cc: Song Liu <songliubraving@fb.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 KP Singh <kpsingh@kernel.org>, nathan@kernel.org, Yonghong Song <yhs@fb.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Jun 07, 2021 at 09:38:43AM +0200, 'Dmitry Vyukov' via Clang Built Linux wrote:
> On Sat, Jun 5, 2021 at 9:10 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> > On Sat, Jun 5, 2021 at 10:55 AM Yonghong Song <yhs@fb.com> wrote:
> > > On 6/5/21 8:01 AM, Kurt Manucredo wrote:
> > > > Syzbot detects a shift-out-of-bounds in ___bpf_prog_run()
> > > > kernel/bpf/core.c:1414:2.
> > >
> > > This is not enough. We need more information on why this happens
> > > so we can judge whether the patch indeed fixed the issue.
> > >
> > > >
> > > > I propose: In adjust_scalar_min_max_vals() move boundary check up to avoid
> > > > missing them and return with error when detected.
> > > >
> > > > Reported-and-tested-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> > > > Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
> > > > ---
> > > >
> > > > https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> > > >
> > > > Changelog:
> > > > ----------
> > > > v4 - Fix shift-out-of-bounds in adjust_scalar_min_max_vals.
> > > >       Fix commit message.
> > > > v3 - Make it clearer what the fix is for.
> > > > v2 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> > > >       check in check_alu_op() in verifier.c.
> > > > v1 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
> > > >       check in ___bpf_prog_run().
> > > >
> > > > thanks
> > > >
> > > > kind regards
> > > >
> > > > Kurt
> > > >
> > > >   kernel/bpf/verifier.c | 30 +++++++++---------------------
> > > >   1 file changed, 9 insertions(+), 21 deletions(-)
> > > >
> > > > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > > > index 94ba5163d4c5..ed0eecf20de5 100644
> > > > --- a/kernel/bpf/verifier.c
> > > > +++ b/kernel/bpf/verifier.c
> > > > @@ -7510,6 +7510,15 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> > > >       u32_min_val = src_reg.u32_min_value;
> > > >       u32_max_val = src_reg.u32_max_value;
> > > >
> > > > +     if ((opcode == BPF_LSH || opcode == BPF_RSH || opcode == BPF_ARSH) &&
> > > > +                     umax_val >= insn_bitness) {
> > > > +             /* Shifts greater than 31 or 63 are undefined.
> > > > +              * This includes shifts by a negative number.
> > > > +              */
> > > > +             verbose(env, "invalid shift %lld\n", umax_val);
> > > > +             return -EINVAL;
> > > > +     }
> > >
> > > I think your fix is good. I would like to move after
> >
> > I suspect such change will break valid programs that do shift by register.
> >
> > > the following code though:
> > >
> > >          if (!src_known &&
> > >              opcode != BPF_ADD && opcode != BPF_SUB && opcode != BPF_AND) {
> > >                  __mark_reg_unknown(env, dst_reg);
> > >                  return 0;
> > >          }
> > >
> > > > +
> > > >       if (alu32) {
> > > >               src_known = tnum_subreg_is_const(src_reg.var_off);
> > > >               if ((src_known &&
> > > > @@ -7592,39 +7601,18 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
> > > >               scalar_min_max_xor(dst_reg, &src_reg);
> > > >               break;
> > > >       case BPF_LSH:
> > > > -             if (umax_val >= insn_bitness) {
> > > > -                     /* Shifts greater than 31 or 63 are undefined.
> > > > -                      * This includes shifts by a negative number.
> > > > -                      */
> > > > -                     mark_reg_unknown(env, regs, insn->dst_reg);
> > > > -                     break;
> > > > -             }
> > >
> > > I think this is what happens. For the above case, we simply
> > > marks the dst reg as unknown and didn't fail verification.
> > > So later on at runtime, the shift optimization will have wrong
> > > shift value (> 31/64). Please correct me if this is not right
> > > analysis. As I mentioned in the early please write detailed
> > > analysis in commit log.
> >
> > The large shift is not wrong. It's just undefined.
> > syzbot has to ignore such cases.
> 
> Hi Alexei,
> 
> The report is produced by KUBSAN. I thought there was an agreement on
> cleaning up KUBSAN reports from the kernel (the subset enabled on
> syzbot at least).
> What exactly cases should KUBSAN ignore?
> +linux-hardening/kasan-dev for KUBSAN false positive

Can check_shl_overflow() be used at all? Best to just make things
readable and compiler-happy, whatever the implementation. :)

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
