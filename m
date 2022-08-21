Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B83DC32772
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Aug 2022 16:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0625B60BB3;
	Sun, 21 Aug 2022 16:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0625B60BB3
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WatGo1Hq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDinOJlkTOY0; Sun, 21 Aug 2022 16:42:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B160F605AC;
	Sun, 21 Aug 2022 16:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B160F605AC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FC80C0032;
	Sun, 21 Aug 2022 16:42:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 258F3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 16:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C7860AF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 16:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C7860AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hnfOc1PHyBlD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 16:42:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D55C605AC
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D55C605AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 16:42:25 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id y19so1568634ilq.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=y69JmQlO6FygAih7FHMgiwqqOzWkTBxWLh4obbN+5DM=;
 b=WatGo1HqGwc6NN7+6dxL4nxUpCMnVnAQ7FAErNyVGjjar/FZ7SHLo4HhBbWcIy5cHm
 ysld1P9Kta6ZTyHqq1aEfzXWW+D5AOJF70AL2AO9Pv+ME0vTC7W77A30+QS17+/p/52B
 NLk+HybNDZcQUzmjXr1dskNR/Mvyc9+dQTNYslgmVUttVMbVI97zf4uTdMxhSlmSSzdf
 dqM53EByXmUp4k0xcXkFnek/HTMpR1GA3PdCqYqJipjg/NlodF7qRoL3oFsrEWyJQ6qX
 1k1EoSmwv6MnaPhUeCPYgOI3zm34smjIaSN55y/OngHNwlXF2O9ZQjTqJ8SAMmEMTY/x
 KK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=y69JmQlO6FygAih7FHMgiwqqOzWkTBxWLh4obbN+5DM=;
 b=gCcHHPLgVlAB7akQ+nz9wpCIIgb009MAdAQY0nxs0MW7p4LK3m+nw9T9eLxvnwaIpP
 uTgBBzsh35AaF3dfVt+y+tqy16bvigvhlEaCEFgc8cVbd+RIL2fJLPZXYx64qB+Ap6z8
 aCcbJDBiMSqo9aHB/XKVe2i7/wz5IYEYX6qoYzd3nrj2F9Gsxc4DtufDCf9dHimbN4/q
 bYmmVetSxxBGKqeSToVNvZa9uDQ2A8780L9179V8RZsQJxo6kBpkdLlp1zYqTXFvudKg
 1zJB0L3GLmC9d3DbsYYAZVToCv+T9++WnVUklIsGalllQRtiEJppRMJ5duginrU/ynw1
 iwhg==
X-Gm-Message-State: ACgBeo1XcW6ZpT6Y3lNz/CR5VSVjc44EtaMV/g20NrwiXFVwuTPFVLq1
 eNUBn+5BZJh3s4nOxDhatMsgkxE/D2CcP2GGHv0=
X-Google-Smtp-Source: AA6agR7DYHJ2swGsZJ2PE/RBRuclXQzErDD1UMI88mkRUEhDDinVfG0/1URQxM6z670bXbs1YppT/hrOhE8GrazzuG8=
X-Received: by 2002:a05:6e02:1c0e:b0:2df:622c:37cd with SMTP id
 l14-20020a056e021c0e00b002df622c37cdmr8248699ilh.234.1661100144528; Sun, 21
 Aug 2022 09:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ce327f05d537ebf7@google.com>
 <20220821125751.4185-1-yin31149@gmail.com>
 <CAABMjtF2GeNyTf6gQ1hk0BiXKY9HWQStBAk_R3w6MCFQ3bOYzA@mail.gmail.com>
In-Reply-To: <CAABMjtF2GeNyTf6gQ1hk0BiXKY9HWQStBAk_R3w6MCFQ3bOYzA@mail.gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Sun, 21 Aug 2022 22:42:13 +0600
Message-ID: <CAABMjtHJX6Rm1Ndg+bECbERWkFYdWbDDYd1-5bVFTu-qwKW=sA@mail.gmail.com>
Subject: Re: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
To: Hawkins Jiawei <yin31149@gmail.com>
Cc: "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-afs@lists.infradead.org, David Howells <dhowells@redhat.com>,
 syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com,
 Eric Dumazet <edumazet@google.com>, Pavel Skripkin <paskripkin@gmail.com>,
 Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Sun, Aug 21, 2022 at 9:58 PM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> On Sun, Aug 21, 2022 at 6:58 PM Hawkins Jiawei <yin31149@gmail.com> wrote:
> >
> The interruptible version fails to acquire the lock. So why is it okay to
> force it to acquire the mutex_lock since we are in the interrupt context?

Sorry, I mean, won't the function lose its ability of being interruptible?
Since we are forcing it to acquire the lock.
> >                         return sock_intr_errno(*timeo);
> > +               }
> >         }
> >  }
>
> thanks,
>   -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
