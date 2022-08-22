Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6A6C28D13
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Aug 2022 16:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F1A8291D;
	Mon, 22 Aug 2022 16:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F1A8291D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cFpOtxOt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BYUS3LAFQCK; Mon, 22 Aug 2022 16:00:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B954D8290B;
	Mon, 22 Aug 2022 16:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B954D8290B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79502C0032;
	Mon, 22 Aug 2022 16:00:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5F04C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 16:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7D1F8291C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 16:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7D1F8291C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JaDbJC2QmV3X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 16:00:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CDED8290B
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CDED8290B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 16:00:45 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso11754131pjj.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=FvmQjkF9ZDVyA2Ag3uiBTxGfKnCghKIGSTohZ1i8iLk=;
 b=cFpOtxOtzfwaOsqhR7c/P3zSbO5PHe4Aej+Z/5qu74aoA7L+quYCbnIn/S99JrbZL6
 PD6Pi8OxWArtogsHXuK0ihoZSsvqkNvgBO7FdtcWCgu2qHt6ynk51RRP1aWdlYZua8+w
 gyArMnH/NQO4J2BidgzfPlHNYnvbekZidzdZRSquB8uKz8P4fu9jsZ6qwp2fEkQ+qKhc
 yQGPHJ6243rt874dTpW05S/lvzzfld9kNDo5y5pcoX8AsgPQpHPsl/A0jKmVEAHyw8Af
 0jsOvYB+6Tr8FxPMlIY07LTcu8Dp7xFRvmn0J3Zod+6dGBgQ8SAxQy4bsT0eSjwE4D9M
 iJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=FvmQjkF9ZDVyA2Ag3uiBTxGfKnCghKIGSTohZ1i8iLk=;
 b=59qA+rhNZ+3L3m92Ll7bqeIs0e3YMDKtvWhZdvvEw7lZA/SK/D5qkKtK10wQndHh8L
 NfUi1iTjWblNI9lPXZCoOQ5SSqBcGTBsyJvoUnXM1bkA6omMBhRzfhZuLAROCAHek3iX
 qyJbOe9GmVjU6ZfRZIgfWJzZjQLsDk2KUZ4LYHH9jskUGcb3jbgtnfUKLVwZE9rfywYe
 xlBHq3QrmyVmwBxvPnSkC5sGmxqKrNEg41ADM1vmyAAFqQtkNhy8ASHqCmExD6iXkKh8
 4JbzxE6fjV+VgfEAr1HtplanhkL7+YsMaUa56PY1S3Vu/fMBc5PpeQHiKXqt26s7QqpT
 xF7A==
X-Gm-Message-State: ACgBeo0doi5GYZvvBnztnCp1MU8NqFYx4mU293e6MZ7uSzQy6Bn9qIPI
 dRp3rj2oLWbBT0dtjbEmniY=
X-Google-Smtp-Source: AA6agR59LmQbdWEk89W5X/9af1tkd4/BZkxiS++0OJ8Sc4EFOQjnWk2t9ViZSha0gb8OweAPai7m3A==
X-Received: by 2002:a17:90a:ab15:b0:1f4:fc25:f180 with SMTP id
 m21-20020a17090aab1500b001f4fc25f180mr29314176pjq.144.1661184045466; 
 Mon, 22 Aug 2022 09:00:45 -0700 (PDT)
Received: from [127.0.0.1] ([103.159.189.130])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a170902d1d500b0016397da033csm8539060plb.62.2022.08.22.09.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 09:00:45 -0700 (PDT)
Date: Mon, 22 Aug 2022 22:00:37 +0600
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Hawkins Jiawei <yin31149@gmail.com>, dan.carpenter@oracle.com
Subject: Re: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
User-Agent: K-9 Mail for Android
In-Reply-To: <20220822153944.6204-1-yin31149@gmail.com>
References: <20220822140532.GF2695@kadam>
 <20220822153944.6204-1-yin31149@gmail.com>
Message-ID: <0ED076C1-6250-43EA-A7BE-948DFAEE851A@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com,
 edumazet@google.com, yin31149@gmail.com, paskripkin@gmail.com,
 marc.dionne@auristor.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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



On August 22, 2022 9:39:43 PM GMT+06:00, Hawkins Jiawei <yin31149@gmail.com> wrote:
>On Mon, 22 Aug 2022 at 22:06, Dan Carpenter <dan.carpenter@oracle.com> wrote:

>I trid this before, it doesn't work as Dan points out. I think
>it seems that mutex_is_locked() only checks whether there is a task

I see.
>holding the mutex, but do not check whether it is current task holding
>mutex. I also tried lockdep_is_held(), lockdep_is_held() seems can detect

Ok.
>call->user_mutex is still held accurately, although this cannot be the patch.

Useful to know! Thanks for the information.

  -- Khalid Masum 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
