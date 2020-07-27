Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43E4C433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:16:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75BAF2070A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pesu-pes-edu.20150623.gappssmtp.com header.i=@pesu-pes-edu.20150623.gappssmtp.com header.b="fbHGlTFf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75BAF2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pesu.pes.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A10485FA2;
	Mon, 27 Jul 2020 14:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTMQBpzjzda7; Mon, 27 Jul 2020 14:16:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B55985F9D;
	Mon, 27 Jul 2020 14:16:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96CECC004F;
	Mon, 27 Jul 2020 14:16:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BB47C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 73E55881B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Onyu0AvbHrRW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:16:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4089D881A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:16:19 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id i80so9070128lfi.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXHUq+GPzg8FK4S6+EdRbVWjybtJrgatUKy7SXDL+iQ=;
 b=fbHGlTFf6UiyosFji1yVJnin+2GpGhwuMIPQk7R8Cqngdmtmmg1w4zzgLnMdEpBEuT
 Mmt2zAwdmQpGxnKbdugxOngK/qljcak+sVw4DgmLFFotPEWfxXneTVPUzftqhVUQwMq5
 n/q6XExE/jCJ4L0yjPt6zNXF7WVpGxZk4m7mPEllW6Xt4Gi1DwdFlkIS3j/nJAwpJYLX
 7xEYVflxmjWCSY/WVFfbArZ+84/KIb/+Cgx28PsngTO9BIhoCfA9UOzGEf0ETh97unxY
 91VoWjO1fCd54WjlybfBQlCDiyAFK6DD8wnnYSFjibzBCsXJwd/jihIBgjO/PA2TTceg
 Caug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXHUq+GPzg8FK4S6+EdRbVWjybtJrgatUKy7SXDL+iQ=;
 b=c8m6sM88E7pbLr96IKYCajiVskB881fl4J1vrgCzwmT6wfQVudPdWpmzm3D0pejx1x
 9ad1qslhwlkpKgk3QEV8MZT2znUxEb/HguV+J04Y36FsUOytkYyzA1tJjQdSkz6J89j/
 JaU8oRbUg+Xp8K0mDAfqQqO33qwrkE8AGTF12vmtWluTtPJLXQQ1cabJ19s3NyitdZcw
 mk+wD4WLYSENsXUfDWfMW8rdKnqyvRT9MHLyTveRUI82cPIlAPeczSPTwqg3q52yjUGM
 KfAhyynFbqXaegVwu1EM+uSeaW1ymz4xSzsPhYQLSoklVUafWJL7TBuMNqmo+ZWUWIs1
 FA+A==
X-Gm-Message-State: AOAM530iMFrPBOzGFiSQdwI6pxn9Bf8nbHZiXUwVy1l/kP31Ul08KJBu
 Cbd7aC7SxAPVKTrQnbq5N7Uy/6ls+mlOsN6buAkcaw==
X-Google-Smtp-Source: ABdhPJxBBdhHhJDhPI/I8NlecIrpo2ELWEx0rUO4NX/elZOnTncGFz78jyf4SCcCXLSNshfYOoEt/z0QAG9tUI0/pPM=
X-Received: by 2002:ac2:4144:: with SMTP id c4mr11891945lfi.118.1595859377115; 
 Mon, 27 Jul 2020 07:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200727131057.7a3of3hhsld4ng5t@pesu.pes.edu>
 <20200727132256.GA3933866@kroah.com>
In-Reply-To: <20200727132256.GA3933866@kroah.com>
From: B K Karthik <bkkarthik@pesu.pes.edu>
Date: Mon, 27 Jul 2020 19:46:05 +0530
Message-ID: <CAAhDqq2N6nTHpz_CNTwh-ZRK-rQO0uUXO41iOouKn690R494Ww@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux Kernel Network Developers <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jon Maloy <jmaloy@redhat.com>,
 tipc-discussion@lists.sourceforge.net, Ying Xue <ying.xue@windriver.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: tipc: fix general
	protection fault in tipc_conn_delete_sub
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

On Mon, Jul 27, 2020 at 6:53 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 27, 2020 at 06:40:57PM +0530, B K Karthik wrote:
> > fix a general protection fault in tipc_conn_delete_sub
> > by checking for the existance of con->server.
> > prevent a null-ptr-deref by returning -EINVAL when
> > con->server is NULL
> >
> > general protection fault, probably for non-canonical address 0xdffffc0000000014: 0000 [#1] PREEMPT SMP KASAN
> > KASAN: null-ptr-deref in range [0x00000000000000a0-0x00000000000000a7]
> > CPU: 1 PID: 113 Comm: kworker/u4:3 Not tainted 5.6.0-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Workqueue: tipc_send tipc_conn_send_work
> > RIP: 0010:tipc_conn_delete_sub+0x54/0x440 net/tipc/topsrv.c:231
> > Code: 48 c1 ea 03 80 3c 02 00 0f 85 f0 03 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 18 48 8d bd a0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 c0 03 00 00 48 c7 c0 34 0b 8a 8a 4c 8b a5 a0 00
> > RSP: 0018:ffffc900012d7b58 EFLAGS: 00010206
> > RAX: dffffc0000000000 RBX: ffff8880a8269c00 RCX: ffffffff8789ca01
> > RDX: 0000000000000014 RSI: ffffffff8789a059 RDI: 00000000000000a0
> > RBP: 0000000000000000 R08: ffff8880a8d88380 R09: fffffbfff18577a8
> > R10: fffffbfff18577a7 R11: ffffffff8c2bbd3f R12: dffffc0000000000
> > R13: ffff888093d35a18 R14: ffff8880a8269c00 R15: ffff888093d35a00
> > FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 000000000076c000 CR3: 000000009441d000 CR4: 00000000001406e0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  tipc_conn_send_to_sock+0x380/0x560 net/tipc/topsrv.c:266
> >  tipc_conn_send_work+0x6f/0x90 net/tipc/topsrv.c:304
> >  process_one_work+0x965/0x16a0 kernel/workqueue.c:2266
> >  worker_thread+0x96/0xe20 kernel/workqueue.c:2412
> >  kthread+0x388/0x470 kernel/kthread.c:268
> >  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> > Modules linked in:
> > ---[ end trace 2c161a84be832606 ]---
> > RIP: 0010:tipc_conn_delete_sub+0x54/0x440 net/tipc/topsrv.c:231
> > Code: 48 c1 ea 03 80 3c 02 00 0f 85 f0 03 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 18 48 8d bd a0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 c0 03 00 00 48 c7 c0 34 0b 8a 8a 4c 8b a5 a0 00
> > RSP: 0018:ffffc900012d7b58 EFLAGS: 00010206
> > RAX: dffffc0000000000 RBX: ffff8880a8269c00 RCX: ffffffff8789ca01
> > RDX: 0000000000000014 RSI: ffffffff8789a059 RDI: 00000000000000a0
> > RBP: 0000000000000000 R08: ffff8880a8d88380 R09: fffffbfff18577a8
> > R10: fffffbfff18577a7 R11: ffffffff8c2bbd3f R12: dffffc0000000000
> > R13: ffff888093d35a18 R14: ffff8880a8269c00 R15: ffff888093d35a00
> > FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000020800000 CR3: 0000000091b8e000 CR4: 00000000001406e0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >
> > Reported-and-tested-by: syzbot+55a38037455d0351efd3@syzkaller.appspotmail.com
> > Signed-off-by: B K Karthik <bkkarthik@pesu.pes.edu>
> > ---
> >  net/tipc/topsrv.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/net/tipc/topsrv.c b/net/tipc/topsrv.c
> > index 1489cfb941d8..6c8d0c6bb112 100644
> > --- a/net/tipc/topsrv.c
> > +++ b/net/tipc/topsrv.c
> > @@ -255,6 +255,9 @@ static void tipc_conn_send_to_sock(struct tipc_conn *con)
> >       int count = 0;
> >       int ret;
> >
> > +     if (!con->server)
> > +             return -EINVAL;
>
> What is wrong with looking at the srv local variable instead?
>
> And how is server getting set to NULL and this function still being
> called?

tipc_conn_send_work makes a call to connected() which just returns con
&& test_bit(CF_CONNECTED, &con->flags)
maybe we can add this check to the implementation of connection() if
you agree, but I found this solution to be fairly simpler because I'm
not sure where else connected() is being used, and I did not want to
introduce redundant function calls.

Yes we can replace con->server with the local variable srv. Extremely
sorry, I hadn't noticed it earlier.

please let me know if i've wrongly understood any of these.
thanks,

karthik
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
