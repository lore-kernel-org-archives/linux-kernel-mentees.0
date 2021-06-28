Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77416C2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 16:24:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 017C561455
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 16:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 017C561455
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD71E40294;
	Mon, 28 Jun 2021 16:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vyVNsHJuj3J; Mon, 28 Jun 2021 16:24:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AD12A4027F;
	Mon, 28 Jun 2021 16:24:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 801E2C001A;
	Mon, 28 Jun 2021 16:24:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEC48C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 16:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD14E827AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 16:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ftix7YNywCB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 16:24:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD9D681B01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 16:24:41 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id ay19so4056626vkb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpJ7w32iGqwOk/oM/d0ecaefQixseDwgEeakcU32Bpk=;
 b=J5VVzZnCPxO4E4iVGvXs0S0FNIqPMIYqCPljwFsfMFBLSG5Xf/XsoDBBgz7XgOAHmm
 vj7AoYTLWtcJtxnNJHMOS4ONGe4/xLbiLzUhOqtIS+2VZ8TjR/p4Jp/sjGyshvcYALQV
 jiVsg2puI6vff5H82ZCHshluIz/QfrLLq8Q1ODcK2NxRkPvQDq4NlK8sQLRWj/URdKEZ
 ZLO4SE0JpCoP3lPkkachFV5wjB0I/V2WtBgJTHN8spUvLb5bKq89e41L9bsmNvmMK9vp
 dTyECvKDxu/nb0CWQCyyvTe4MPcCoERzBGkhHsCI7FYD+dGi9i2beYvViJ6+e6YeCT47
 NvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpJ7w32iGqwOk/oM/d0ecaefQixseDwgEeakcU32Bpk=;
 b=Ufx1LLwAfhDlcYpj8lvIo7IU3ytdScjcfMlfLMQR0MtCLABPNkzmn6P6UmRkpeYNh7
 h8vDtKFse5pdbQ9eBkBzjtGTtW3nPALI+8EBxPfcCV0LX6In42mudLsTg5cOqpCt/XK0
 UCy4Ke1yPnjWARAmrAV7W9d4Vs1H4bu2sazRor8r8t7MaaXSFE/HEcrEACuT/aCFcWvf
 cJ3QP81gNOi1cJXTfJ8khTTiZ6RG9DoJVP8GJVpXnV6ncAYFON0SKGPwVcfscorXkKV5
 9fPotScepPu2g14O/ZzDdfeIoDJADpwVmMPlYgOB1hTJeGz1Cs6JVBuK4bhbFX+vr/8Z
 tesw==
X-Gm-Message-State: AOAM531QvOsikh2dCGVZgMJacjxhntVeZlYDjN3038OSWMu1be1JUInE
 Pb/VPKooAh3ogcQksNXsguplbuiz7ri8fNFHgbVYug==
X-Google-Smtp-Source: ABdhPJw91nOsdpuFZV/dLpAyCemkIwoeS+zWUP869PzyBrf5GyGV7tXMqGOVFz318/U7RCY6IgxhF5tRCxgIjbMCSos=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr17539002vko.19.1624897480401; 
 Mon, 28 Jun 2021 09:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
In-Reply-To: <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
Date: Mon, 28 Jun 2021 12:24:19 -0400
Message-ID: <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Phi Nguyen <phind.uet@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Yuchung Cheng <ycheng@google.com>,
 kpsingh@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
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
From: Neal Cardwell via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Neal Cardwell <ncardwell@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Jun 28, 2021 at 12:18 PM Phi Nguyen <phind.uet@gmail.com> wrote:
>
> On 6/28/2021 10:52 PM, Eric Dumazet wrote:
>
> > Unfortunately this patch might break things.
> >
> > We keep changing this CC switching, with eBPF being mixed in the equation.
> >
> > I would suggest you find a Fixes: tag first, so that we can continue
> > the discussion.
> >
> > Thank you.
>
> Thank for your feedback. I will resubmit it with a Fixes tag.
>
> Regard.

Thanks.

Can you also please provide a summary of the event sequence that
triggers the bug? Based on your Reported-by tag, I guess this is based
on the syzbot reproducer:

 https://groups.google.com/g/syzkaller-bugs/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ

but perhaps you can give a summary of the event sequence that causes
the bug? Is it that the call:

setsockopt$inet_tcp_TCP_CONGESTION(r0, 0x6, 0xd,
&(0x7f0000000000)='cdg\x00', 0x4)

initializes the CC and happens before the connection is established,
and then when the connection is established, the line that sets:
  icsk->icsk_ca_initialized = 0;
is incorrect, causing the CC to be initialized again without first
calling the cleanup code that deallocates the CDG-allocated memory?

thanks,
neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
