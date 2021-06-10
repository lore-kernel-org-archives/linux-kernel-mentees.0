Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8C2C48BDF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 17:52:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B05F61364
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 17:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B05F61364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EBA283B97;
	Thu, 10 Jun 2021 17:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9C_VrttdbMe; Thu, 10 Jun 2021 17:52:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6912B83B17;
	Thu, 10 Jun 2021 17:52:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FBA3C000D;
	Thu, 10 Jun 2021 17:52:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FE06C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0180D82F77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Df2nT-iL5l43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2977782E15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:52:51 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id x14so6088165ljp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=on0Tnjo9EX+wZkS0PcGQkLK+8ozdHMxgRM2ZPf0mD60=;
 b=j9utiUZQhGBbTOtjugU9fdt/FXWpsia1oR3qKOXO/TPLUkuvy8TaWMJ5/wiA8q+zGK
 rNeb/Lo9SaW23+goSZYwxCL81gW4lJ2d8mT/R/NRu3wGbc/KRlVewK+k0Xb/KI26YLLZ
 Cz27Cvxmt+KcIx3sxWdN1VTqPBcHoO/BqkNz4bhpyD4axCSB4iFhYAMvxuKNOOFgSmZq
 9W74zfrKa813xMYFi5ra7SMIN7Y+cZ+aIUMj96Lr5DWGVPUHiAc4QJsseTdfTp221f6e
 1fNG4bxiKO5JWNKCJ4Ampld4s8EJ6RLZ1P5vXV/V17ditBBYMdDdswCtE4Y9BLTqyJ7F
 bvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=on0Tnjo9EX+wZkS0PcGQkLK+8ozdHMxgRM2ZPf0mD60=;
 b=Rbe1qcQjB856fTnBNOILu2uCrMvWbyqG94CpqS+mEF+NfJY5JJfD76/aaTnDBPDef9
 9lG25bgzd4WL3axShDOlfihSfgSzQMErWvo0Z6jFbGpu9NsCYV7dU4y1gV44bL72M1tJ
 nX+nJQaBjUpmZI5a3VSdZYPA3pkA/jukcTxh+Mig0l/UONGfG7vprLfgtbxtNZmJtbqC
 eeSQTtFP7RwRMlKlax3ZTyN74EhdcwkSApTDXSFgBmEyKdCtQqIgSSLWkodtIhZDMYVg
 /H4aU34DxrXX3VYHvgXQyJnSR0lmVqNlW0eDmRh7u2O2M9fiJSBFV88FB1jecyzBBglZ
 Yq9A==
X-Gm-Message-State: AOAM5320dkcJa78ai/FCQtYEiNDzELBQAUdTp2L3Ry7hrxcLa8V1ZAW3
 PNssBPqzELTO2rteQxOxBON62s/sNutaAcdPgOQ=
X-Google-Smtp-Source: ABdhPJws5IUcrVuyFh3x8K8w0l/lXTFkf9nHIYvn2dADR0QD7VRdNZF2eqVjHmAmOhded8cSA4fG+o+m8KFwXjKW8mw=
X-Received: by 2002:a2e:b5c8:: with SMTP id g8mr3170497ljn.204.1623347568936; 
 Thu, 10 Jun 2021 10:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210602212726.7-1-fuzzybritches0@gmail.com>
 <YLhd8BL3HGItbXmx@kroah.com>
 <87609-531187-curtm@phaethon> <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
 <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
 <CACT4Y+b=si6NCx=nRHKm_pziXnVMmLo-eSuRajsxmx5+Hy_ycg@mail.gmail.com>
 <202106091119.84A88B6FE7@keescook>
 <752cb1ad-a0b1-92b7-4c49-bbb42fdecdbe@fb.com>
 <CACT4Y+a592rxFmNgJgk2zwqBE8EqW1ey9SjF_-U3z6gt3Yc=oA@mail.gmail.com>
 <1aaa2408-94b9-a1e6-beff-7523b66fe73d@fb.com> <202106101002.DF8C7EF@keescook>
In-Reply-To: <202106101002.DF8C7EF@keescook>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 10 Jun 2021 10:52:37 -0700
Message-ID: <CAADnVQKMwKYgthoQV4RmGpZm9Hm-=wH3DoaNqs=UZRmJKefwGw@mail.gmail.com>
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
To: Kees Cook <keescook@chromium.org>
Cc: Song Liu <songliubraving@fb.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 KP Singh <kpsingh@kernel.org>, nathan@kernel.org, Yonghong Song <yhs@fb.com>,
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

On Thu, Jun 10, 2021 at 10:06 AM Kees Cook <keescook@chromium.org> wrote:
>
> > > I guess the main question: what should happen if a bpf program writer
> > > does _not_ use compiler nor check_shl_overflow()?
>
> I think the BPF runtime needs to make such actions defined, instead of
> doing a blind shift. It needs to check the size of the shift explicitly
> when handling the shift instruction.

Such ideas were brought up in the past and rejected.
We're not going to sacrifice performance to make behavior a bit more
'defined'. CPUs are doing it deterministically. It's the C standard
that needs fixing.

> Sure, but the point of UBSAN is to find and alert about undefined
> behavior, so we still need to fix this.

No. The undefined behavior of C standard doesn't need "fixing" most of the time.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
