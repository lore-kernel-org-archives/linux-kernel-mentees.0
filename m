Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C063C47094
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 17:06:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC650613DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 17:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC650613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D7460A3F;
	Thu, 10 Jun 2021 17:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9hmflVmbyBp; Thu, 10 Jun 2021 17:06:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6CCAA6066F;
	Thu, 10 Jun 2021 17:06:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4864EC000E;
	Thu, 10 Jun 2021 17:06:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A11C0C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87E6A4010B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8O5Na9lbWfa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:06:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6DE8400F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:06:45 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id k15so2151374pfp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tf6j48/EA7psoQT0Xa+Ykp/HBTN3iYdEAaBd6YZtNzA=;
 b=BQ5qUY2276upuseKeH0xi1cEhRtHiQIFJX1GijU6PYyl4Cthzv0BUWu+InvJdo0fyc
 nG8Pyy9LtiSpoNHDFjrgilIGZVKGi4qnfmsRJ1Ac9bjV3BFqIKua7PDRe5kS9WxvMPHF
 hGCQOxOSvU3j5mYsPkqMaz++wpX7b6l2jSRXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tf6j48/EA7psoQT0Xa+Ykp/HBTN3iYdEAaBd6YZtNzA=;
 b=PYU6sKmJ2nDBh3GCZ7cdIfEjpKidndDOUPvgzYn4QeY7OIZ4707OU1LmXED787kj3y
 ZKUnLYAg35j000+Gh0kA7blVJJBQOMX+BXrPdt4xfYKqaS00aXmSPK6uDnGfs4WUaN7G
 0F7Go1Tjyox6PR1HjCMBDRQJYwl/NJdvhUU3qKdIx8kjBinPZO4xMmIUKptolv2QhuSj
 XI5IuGr4dRDsaF+vedSjGCHfA/10aaRHH3Zsmzx6gQaNaBtBd24/1ofyabjibmrx+2WT
 tBIkLTlzzU2T5BuwPTCo8MiM0yLi6+kaJBk9zLFYVptIlx7zNjkc9n/fIotiGn+0sGFh
 04Dg==
X-Gm-Message-State: AOAM533ae3F/Vra0aQ/YEYOjrj7KA6LAjELP6I8Hg7YVjxjw7Fp0c6vq
 3v3lYqB9czCgcPyo0J733n2c/w==
X-Google-Smtp-Source: ABdhPJziHTvIoTI9UofEIJVEwXLrrUpuk8JpKcfTDvrABtGPTblS2hWs3BzfsL1cKX8HsFyFIrI8Eg==
X-Received: by 2002:a63:5d66:: with SMTP id o38mr5923418pgm.444.1623344804696; 
 Thu, 10 Jun 2021 10:06:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k25sm2852989pfk.33.2021.06.10.10.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 10:06:43 -0700 (PDT)
Date: Thu, 10 Jun 2021 10:06:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Yonghong Song <yhs@fb.com>
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Message-ID: <202106101002.DF8C7EF@keescook>
References: <20210602212726.7-1-fuzzybritches0@gmail.com>
 <YLhd8BL3HGItbXmx@kroah.com> <87609-531187-curtm@phaethon>
 <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
 <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
 <CACT4Y+b=si6NCx=nRHKm_pziXnVMmLo-eSuRajsxmx5+Hy_ycg@mail.gmail.com>
 <202106091119.84A88B6FE7@keescook>
 <752cb1ad-a0b1-92b7-4c49-bbb42fdecdbe@fb.com>
 <CACT4Y+a592rxFmNgJgk2zwqBE8EqW1ey9SjF_-U3z6gt3Yc=oA@mail.gmail.com>
 <1aaa2408-94b9-a1e6-beff-7523b66fe73d@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1aaa2408-94b9-a1e6-beff-7523b66fe73d@fb.com>
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
 KP Singh <kpsingh@kernel.org>, nathan@kernel.org,
 Dmitry Vyukov <dvyukov@google.com>,
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

On Wed, Jun 09, 2021 at 11:06:31PM -0700, Yonghong Song wrote:
> 
> 
> On 6/9/21 10:32 PM, Dmitry Vyukov wrote:
> > On Thu, Jun 10, 2021 at 1:40 AM Yonghong Song <yhs@fb.com> wrote:
> > > On 6/9/21 11:20 AM, Kees Cook wrote:
> > > > On Mon, Jun 07, 2021 at 09:38:43AM +0200, 'Dmitry Vyukov' via Clang Built Linux wrote:
> > > > > On Sat, Jun 5, 2021 at 9:10 PM Alexei Starovoitov
> > > > > <alexei.starovoitov@gmail.com> wrote:
> > > > > > On Sat, Jun 5, 2021 at 10:55 AM Yonghong Song <yhs@fb.com> wrote:
> > > > > > > On 6/5/21 8:01 AM, Kurt Manucredo wrote:
> > > > > > > > Syzbot detects a shift-out-of-bounds in ___bpf_prog_run()
> > > > > > > > kernel/bpf/core.c:1414:2.
> > > > > > > [...]
> > > > > > > 
> > > > > > > I think this is what happens. For the above case, we simply
> > > > > > > marks the dst reg as unknown and didn't fail verification.
> > > > > > > So later on at runtime, the shift optimization will have wrong
> > > > > > > shift value (> 31/64). Please correct me if this is not right
> > > > > > > analysis. As I mentioned in the early please write detailed
> > > > > > > analysis in commit log.
> > > > > > 
> > > > > > The large shift is not wrong. It's just undefined.
> > > > > > syzbot has to ignore such cases.
> > > > > 
> > > > > Hi Alexei,
> > > > > 
> > > > > The report is produced by KUBSAN. I thought there was an agreement on
> > > > > cleaning up KUBSAN reports from the kernel (the subset enabled on
> > > > > syzbot at least).
> > > > > What exactly cases should KUBSAN ignore?
> > > > > +linux-hardening/kasan-dev for KUBSAN false positive
> > > > 
> > > > Can check_shl_overflow() be used at all? Best to just make things
> > > > readable and compiler-happy, whatever the implementation. :)
> > > 
> > > This is not a compile issue. If the shift amount is a constant,
> > > compiler should have warned and user should fix the warning.
> > > 
> > > This is because user code has
> > > something like
> > >       a << s;
> > > where s is a unknown variable and
> > > verifier just marked the result of a << s as unknown value.
> > > Verifier may not reject the code depending on how a << s result
> > > is used.

Ah, gotcha: it's the BPF code itself that needs to catch it.

> > > If bpf program writer uses check_shl_overflow() or some kind
> > > of checking for shift value and won't do shifting if the
> > > shifting may cause an undefined result, there should not
> > > be any kubsan warning.

Right.

> > I guess the main question: what should happen if a bpf program writer
> > does _not_ use compiler nor check_shl_overflow()?

I think the BPF runtime needs to make such actions defined, instead of
doing a blind shift. It needs to check the size of the shift explicitly
when handling the shift instruction.

> If kubsan is not enabled, everything should work as expected even with
> shl overflow may cause undefined result.
> 
> if kubsan is enabled, the reported shift-out-of-bounds warning
> should be ignored. You could disasm the insn to ensure that
> there indeed exists a potential shl overflow.

Sure, but the point of UBSAN is to find and alert about undefined
behavior, so we still need to fix this.


-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
