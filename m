Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A46C48BE0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 20:00:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78EEC61419
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 20:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78EEC61419
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3919F83DD5;
	Thu, 10 Jun 2021 20:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GT2nyEdmvbcC; Thu, 10 Jun 2021 20:00:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 87F2383DD3;
	Thu, 10 Jun 2021 20:00:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C7ADC000D;
	Thu, 10 Jun 2021 20:00:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76241C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 20:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B5564066E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 20:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2Q9McFbknT3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 20:00:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A46514066D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 20:00:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DAEC613F1;
 Thu, 10 Jun 2021 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623355247;
 bh=ZbRvzCT7wna4OsitGKZ+uEppwjq/LPjh5F/SwhxsvIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=it1PG+R5MO443wIpHpOu52Wp7/yNhdoVxG8Ar5iSyJLybhL0qRCWf+X1Js86t3GNz
 9X2d4POr6Z8djOs42/VuoWMyLaM3oTyaagYIzVmMRiM7EiynqhPxtfyTZqbFMR1rvo
 fxTtwWzLdXGGd+h9Rw06HuGpDATp4XLAcGwL6Je4gcJi8HU7Kpfs3Fm6l+jXisE8il
 I5SEZkaU3f/ZVbStLDvmwkO9oufSpN5FVnVmz4VCS5oEhuC4mJyGn3NidjN3qS32Zv
 DafKhl5qLVDFD/Ly7Wl6shQjosw6s8FsamH/AE+KynX1+5FNSagLp0VOQNAsTO+ceQ
 UCtSRuWwEEtsA==
Date: Thu, 10 Jun 2021 13:00:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Message-ID: <YMJvbGEz0xu9JU9D@gmail.com>
References: <87609-531187-curtm@phaethon>
 <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
 <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
 <CACT4Y+b=si6NCx=nRHKm_pziXnVMmLo-eSuRajsxmx5+Hy_ycg@mail.gmail.com>
 <202106091119.84A88B6FE7@keescook>
 <752cb1ad-a0b1-92b7-4c49-bbb42fdecdbe@fb.com>
 <CACT4Y+a592rxFmNgJgk2zwqBE8EqW1ey9SjF_-U3z6gt3Yc=oA@mail.gmail.com>
 <1aaa2408-94b9-a1e6-beff-7523b66fe73d@fb.com>
 <202106101002.DF8C7EF@keescook>
 <CAADnVQKMwKYgthoQV4RmGpZm9Hm-=wH3DoaNqs=UZRmJKefwGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQKMwKYgthoQV4RmGpZm9Hm-=wH3DoaNqs=UZRmJKefwGw@mail.gmail.com>
Cc: Song Liu <songliubraving@fb.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Alexei Starovoitov <ast@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kees Cook <keescook@chromium.org>,
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

On Thu, Jun 10, 2021 at 10:52:37AM -0700, Alexei Starovoitov wrote:
> On Thu, Jun 10, 2021 at 10:06 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > > > I guess the main question: what should happen if a bpf program writer
> > > > does _not_ use compiler nor check_shl_overflow()?
> >
> > I think the BPF runtime needs to make such actions defined, instead of
> > doing a blind shift. It needs to check the size of the shift explicitly
> > when handling the shift instruction.
> 
> Such ideas were brought up in the past and rejected.
> We're not going to sacrifice performance to make behavior a bit more
> 'defined'. CPUs are doing it deterministically.

What CPUs do is not the whole story.  The compiler can assume that the shift
amount is less than the width and use that assumption in other places, resulting
in other things being miscompiled.

Couldn't you just AND the shift amounts with the width minus 1?  That would make
the shifts defined, and the compiler would optimize out the AND on any CPU that
interprets the shift amounts modulo the width anyway (e.g., x86).

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
