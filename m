Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F461FBEB0
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Nov 2025 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764433784; cv=none; b=S+chbaOlrcQaX5j3m2bPjoHAjIuajyesmwba1a+De2aNHPru/yldkgpbn6WNS2pt/0fxrRHXpX8YekbtmjV2Q1GsidS4S+vPHISQ6raIWmN1HEGCdk1o/ZHQUawfpgvus1695zWg4ccLhBVPVScsVSGNxAhouwnHnPN73nxXkRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764433784; c=relaxed/simple;
	bh=XxPsk9Eb43fSNiSNuZ5XLjWkiKMYwSYxirqZOM8CWWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0bZmVo3/2EbjxEgvGalnnqqIWhxZBSaD32M45PHH9SiI+DCC+otDvgVoYYrgsEb611khI27vYlQ4px5rcDnZVtb2PrumpBRVnVzRqGRHI83bU86Q67gHaPwuLf4hizzvGZSHDA5/W6NVW+4SchOrhSLIfEj7oZKOhHpkRsjm50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=XB87yqUX; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="XB87yqUX"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787e35ab178so22287957b3.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Nov 2025 08:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764433781; x=1765038581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YIaZWkYsG2+766HIF9sMG2jvdVnfYyu8Q7qgPYfzlE=;
        b=XB87yqUX31NXKqZ4FQLiRoOz8zDWCQoaYGewY6DM19Lo3euuBHz13D9IHTWYyFUVq1
         pjChQx9HmrH9M2xlfZILpps1mgFszE+g/QV9AitqI56Ktyzinf1ecrQef05DC3pKUZWG
         wvBAVXifqxgV//coXhfkMpe7y5lSJxk6xAmxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764433781; x=1765038581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0YIaZWkYsG2+766HIF9sMG2jvdVnfYyu8Q7qgPYfzlE=;
        b=sNnNlXUXemOMciHY5GGOiCSo8Z2e8UqfQsBwIcOBqSvIj65oUNWg9oO5ebWo0WgMeT
         RC7WP0MjOa9LcPmJjoOS7vPP7QLdZKs1FTRaqMGC72mdIFTV/UUGUW/rk75bkqjdEFVW
         NCGFCmfUM0u3Wh9bmVrpuoSHXyms6nOImIxYdqM22VRavZx7dJKJ1PjwSlEtwUdVGRlW
         N28N61Za6gYBkdeaJaCwPftfNuH96lV7gCSIEFJ93C+VmOMfttLmW+WDe5j6+ciB6dw9
         rjZtnXKJn/D7QHZPRgbfU8VdGXhup3TbD3UmPzN0mM0yaCPrgk/7yV9Bf87SdwpDJ2gR
         Obng==
X-Forwarded-Encrypted: i=1; AJvYcCXNL6OJzlZ8l/Q5ScefL/vRYB5sj/qhPeDstvTdzTZSTf6PxAAKQ3jGbeNV3NxRM+fy5xFiMtT5lJge8adXT+QbhIUqkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YydzVMvhcd21DhcFpiWhqCaIihazV0oIf1DMGQF1yy6GZAqnOSm
	s/8EaUSL0Frvqp+VcHlb3Vm1IFK2+kr39VzEJq6oNXl3RW6kK6jw9dvqOwVa1SHGwC4M9L1M63W
	Ofh9r6PQPjWRg/ii23sKKyIUo2P2Wx8ndUy9OknIugw==
X-Gm-Gg: ASbGncvqN5QRJ9kupdsRBxfCBh4segOd5tG0lhi6JWjLpb6vG8Zth9K1Uq70Bvobzpf
	GkD2VOKS3cQi6G23bUmWfZeugzZ1qKNZpewcXQMVnpVEW3xVC6pui+XmpzW+n/2wiIduEuE3onR
	0ratC62Bl5NSfjf+hoAfNvSVqWyNEwNnTj5+EhzD6/xvpDuRCipYAfSb2p/ztASWQrU/tIP6eqx
	MGaJaR6ZEJrbG3fnpFremuYzH+cwgdA+sRW96jFjsj6FUxA73v13QmS6Ofz9psL7S0eyULM+/CS
	83UgWXdo7YVPn9DAKTAdVD0=
X-Google-Smtp-Source: AGHT+IH/amgjYZ4hepMx4cefCAqunHQoT6K399Q1T0St+afGYxSlkQhRoNJixWcVurrbQATvkbcwVxuu1x05BYn110A=
X-Received: by 2002:a05:690c:7448:b0:788:763:179b with SMTP id
 00721157ae682-78a8b5284e1mr261258247b3.45.1764433781248; Sat, 29 Nov 2025
 08:29:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127163219.40389-1-ssrane_b23@ee.vjti.ac.in> <aSlbccUo_YwqehWL@thinkpad>
In-Reply-To: <aSlbccUo_YwqehWL@thinkpad>
From: SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>
Date: Sat, 29 Nov 2025 21:59:29 +0530
X-Gm-Features: AWmQ_bncfrkXutO0UvCWkOMRLGDeLeQrwA1iDa4opKW2TpPzUzBDSLvdOBQIILQ
Message-ID: <CANNWa06MVDaEGKVyNW=LGUsFg+OM-RRW-vfBBkR5Vpb+pk4pxw@mail.gmail.com>
Subject: Re: [PATCH net v2] net/hsr: fix NULL pointer dereference in skb_clone
 with hw tag insertion
To: Felix Maurer <fmaurer@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, jkarrenpalo@gmail.com, 
	arvid.brodin@alten.se, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+2fa344348a579b779e05@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 1:51=E2=80=AFPM Felix Maurer <fmaurer@redhat.com> w=
rote:
>
> On Thu, Nov 27, 2025 at 10:02:19PM +0530, Shaurya Rane wrote:
> > When NETIF_F_HW_HSR_TAG_INS is enabled and frame->skb_std is NULL,
> > hsr_create_tagged_frame() and prp_create_tagged_frame() call skb_clone(=
)
> > with a NULL pointer.
>
> Have you acually tested this or do you have any other indication that
> this can happen? After all, you are suggesting that this kernel crash in
> a syzbot VM is caused by a (very uncommon) feature of hardware NICs.
>
Agreed. The syzbot reproducer uses PRP (protocol=3D1), and the crash
path goes through prp_get_untagged_frame() where __pskb_copy() can
fail and return NULL. I tested the patch with syzbot and the bug no
longer reproduces, confirming this is the actual root cause.

> > Similarly, prp_get_untagged_frame() doesn't check
> > if __pskb_copy() fails before calling skb_clone().
>
> I suspect that this is really the only condition that can trigger the
> crash in question. This would also match that the syzbot reproducer hits
> this with a PRP interface (IFLA_HSR_PROTOCOL=3D0x1).
That makes sense. I've dropped the NETIF_F_HW_HSR_TAG_INS checks and
sent v3 with only the prp_get_untagged_frame() fix.That makes sense.
I've dropped the NETIF_F_HW_HSR_TAG_INS checks and sent v3 with only
the prp_get_untagged_frame() fix and tested it with the syzbot
reproducer .
>
> > This causes a kernel crash reported by Syzbot:
> >
> > Oops: general protection fault, probably for non-canonical address 0xdf=
fffc000000000f: 0000 [#1] SMP KASAN NOPTI
> > KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
> > CPU: 0 UID: 0 PID: 5625 Comm: syz.1.18 Not tainted syzkaller #0 PREEMPT=
(full)
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-=
1.16.3-2~bpo12+1 04/01/2014
> > RIP: 0010:skb_clone+0xd7/0x3a0 net/core/skbuff.c:2041
> > Code: 03 42 80 3c 20 00 74 08 4c 89 f7 e8 23 29 05 f9 49 83 3e 00 0f 85=
 a0 01 00 00 e8 94 dd 9d f8 48 8d 6b 7e 49 89 ee 49 c1 ee 03 <43> 0f b6 04 =
26 84 c0 0f 85 d1 01 00 00 44 0f b6 7d 00 41 83 e7 0c
> > RSP: 0018:ffffc9000d00f200 EFLAGS: 00010207
> > RAX: ffffffff892235a1 RBX: 0000000000000000 RCX: ffff88803372a480
> > RDX: 0000000000000000 RSI: 0000000000000820 RDI: 0000000000000000
> > RBP: 000000000000007e R08: ffffffff8f7d0f77 R09: 1ffffffff1efa1ee
> > R10: dffffc0000000000 R11: fffffbfff1efa1ef R12: dffffc0000000000
> > R13: 0000000000000820 R14: 000000000000000f R15: ffff88805144cc00
> > FS:  0000555557f6d500(0000) GS:ffff88808d72f000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000555581d35808 CR3: 000000005040e000 CR4: 0000000000352ef0
> > Call Trace:
> >  <TASK>
> >  hsr_forward_do net/hsr/hsr_forward.c:-1 [inline]
> >  hsr_forward_skb+0x1013/0x2860 net/hsr/hsr_forward.c:741
> >  hsr_handle_frame+0x6ce/0xa70 net/hsr/hsr_slave.c:84
> >  __netif_receive_skb_core+0x10b9/0x4380 net/core/dev.c:5966
> >  __netif_receive_skb_one_core net/core/dev.c:6077 [inline]
> >  __netif_receive_skb+0x72/0x380 net/core/dev.c:6192
> >  netif_receive_skb_internal net/core/dev.c:6278 [inline]
> >  netif_receive_skb+0x1cb/0x790 net/core/dev.c:6337
> >  tun_rx_batched+0x1b9/0x730 drivers/net/tun.c:1485
> >  tun_get_user+0x2b65/0x3e90 drivers/net/tun.c:1953
> >  tun_chr_write_iter+0x113/0x200 drivers/net/tun.c:1999
> >  new_sync_write fs/read_write.c:593 [inline]
> >  vfs_write+0x5c9/0xb30 fs/read_write.c:686
> >  ksys_write+0x145/0x250 fs/read_write.c:738
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > RIP: 0033:0x7f0449f8e1ff
> > Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 f9 92 02 00 48 8b 54 24=
 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 =
ff ff 77 31 44 89 c7 48 89 44 24 08 e8 4c 93 02 00 48
> > RSP: 002b:00007ffd7ad94c90 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
> > RAX: ffffffffffffffda RBX: 00007f044a1e5fa0 RCX: 00007f0449f8e1ff
> > RDX: 000000000000003e RSI: 0000200000000500 RDI: 00000000000000c8
> > RBP: 00007ffd7ad94d20 R08: 0000000000000000 R09: 0000000000000000
> > R10: 000000000000003e R11: 0000000000000293 R12: 0000000000000001
> > R13: 00007f044a1e5fa0 R14: 00007f044a1e5fa0 R15: 0000000000000003
> >  </TASK>
> >
> > Fix this by adding NULL checks for frame->skb_std before calling
> > skb_clone() in the affected functions.
> >
> > Reported-by: syzbot+2fa344348a579b779e05@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D2fa344348a579b779e05
> > Fixes: f266a683a480 ("net/hsr: Better frame dispatch")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> > ---
> >  net/hsr/hsr_forward.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> > index 339f0d220212..8a8559f0880f 100644
> > --- a/net/hsr/hsr_forward.c
> > +++ b/net/hsr/hsr_forward.c
> > @@ -205,6 +205,8 @@ struct sk_buff *prp_get_untagged_frame(struct hsr_f=
rame_info *frame,
> >                               __pskb_copy(frame->skb_prp,
> >                                           skb_headroom(frame->skb_prp),
> >                                           GFP_ATOMIC);
> > +                     if (!frame->skb_std)
> > +                             return NULL;
> >               } else {
> >                       /* Unexpected */
> >                       WARN_ONCE(1, "%s:%d: Unexpected frame received (p=
ort_src %s)\n",
>
> This check looks good to me.
>
> > @@ -341,6 +343,8 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_=
frame_info *frame,
> >               hsr_set_path_id(frame, hsr_ethhdr, port);
> >               return skb_clone(frame->skb_hsr, GFP_ATOMIC);
> >       } else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
> > +             if (!frame->skb_std)
> > +                     return NULL;
> >               return skb_clone(frame->skb_std, GFP_ATOMIC);
> >       }
> >
> > @@ -385,6 +389,8 @@ struct sk_buff *prp_create_tagged_frame(struct hsr_=
frame_info *frame,
> >               }
> >               return skb_clone(frame->skb_prp, GFP_ATOMIC);
> >       } else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
> > +             if (!frame->skb_std)
> > +                     return NULL;
> >               return skb_clone(frame->skb_std, GFP_ATOMIC);
> >       }
>
> If any of these two conditions happen we have a different, serious
> problem that needs to be fixed elsewhere.
>
> In hsr_create_tagged_frame(), we first check if we have an skb_hsr (an
> skb containing an already tagged message). If we don't, it has to be an
> skb_std (an skb without any tag). If !skb_std, we are either 1) handing
> around a frame without any skb; or 2) handing a PRP frame to an HSR
> function. In both cases, this would need to be fixed where the problem
> is introduced.
>
> Thanks,
>    Felix
>
Thanks, Shaurya
