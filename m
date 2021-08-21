Return-Path: <SRS0=6OiN=NM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BABC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Aug 2021 17:34:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C419061242
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Aug 2021 17:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C419061242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6355B40226;
	Sat, 21 Aug 2021 17:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAbeqcIk6IPJ; Sat, 21 Aug 2021 17:34:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 493284020C;
	Sat, 21 Aug 2021 17:34:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1634EC0010;
	Sat, 21 Aug 2021 17:34:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D499C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Aug 2021 17:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AD3280EF8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Aug 2021 17:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwZdK0daAfxO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Aug 2021 17:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 601D180EF3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Aug 2021 17:34:11 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id 14so14419902qkc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Aug 2021 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=beWCGVp9K9hf3HzPZDhk0BVjk4UtEufcqzRoDSlmhV4=;
 b=Uo1iiIhMP8fPJzkJtil8Db/qG6OPeJGTDhrHqFlnie6IiLAj/h5Jwd34vLw1pneGWd
 e9ggncbQqcniHkIYitjYDS3mnpo10UcrVrteylUXTHNcqDcTOb5uW8AyGAj1stjj6l7A
 lx9oDVWY21aZNa3gcl/jRYVXIotthFebrdHcAAlu64AcjBuUVOvOPiI6q2yWVhFNqQYD
 wNXVWC7od7b/kZCnWRSQP6HiK1Xbsn4WYtnhaMZ13TxAEy61fPYcuVDC4RqwnDO8CAii
 5xR8E6xgoRy9p9W5GnLS+PXy0SSOaqH5FGh8OL9zttL6XpfYcXPQC+xDAQU0ty7G4+nu
 SbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=beWCGVp9K9hf3HzPZDhk0BVjk4UtEufcqzRoDSlmhV4=;
 b=sX2gcnOILIrnjJ2elJJEBWBeVgb74scEdR3hn6MjFkqsxEtxOy1jCuD1KuSdbwnKqm
 BJTFO2qhxoNp8g8bJn1syWI3uZTj1vsklhw2KFP7A6BipSEEpaRlMXtuV2PUdFGp7SPu
 p0Bu9xzTV7EwuJtxrN68Zelmz527Yf7mY+KpwiZtVHehFuYp0CWHIo/Rpk6utuIbQogK
 Xo4c+9oEr02cTvTkfExbgC6EAnFOPANK+rxu4XNo9aQwK99+RAis+sdq1656DEYrzqWp
 AwO+xbkLH8elfaiHyvoB3KS3qgnfIsTxJ88tjqRWdAstACjKkp+VbAXfIn4w/uQHENcq
 DzUQ==
X-Gm-Message-State: AOAM532I9WkrRpSI8/Yv/aOfw/TheeuWShDEjjCfxspRehLxNFHjjyAn
 4jBhO1xNmHp2cnhkEWwkqEioIymOoeKrnfGhDOA=
X-Google-Smtp-Source: ABdhPJwQF8QaciEjRdRUJbvqqLyCNJVxZLVJI5PTAhB6LvHLhgcyEK+yUV1qhFfHxgj8rBqaFQ+ankMKKHmyLLjYPos=
X-Received: by 2002:a05:620a:89b:: with SMTP id
 b27mr14068898qka.429.1629567250088; 
 Sat, 21 Aug 2021 10:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210805111207.19171-1-vineshraut2017@gmail.com>
 <CAKXUXMzOugdVkzHJVALZq+NXrk-BKLWtPorDtcJBoPuFU+dpoQ@mail.gmail.com>
In-Reply-To: <CAKXUXMzOugdVkzHJVALZq+NXrk-BKLWtPorDtcJBoPuFU+dpoQ@mail.gmail.com>
From: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Date: Sat, 21 Aug 2021 23:03:57 +0530
Message-ID: <CAMqN5U5oh8pGkokX9srVSqZQckWpGqwYnaUZHth4hycSH=Tg2g@mail.gmail.com>
Subject: Re: [PATCH] mptlan.c: fixed UNNECESSARY_CASTS warning
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Fri, Aug 20, 2021 at 3:30 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Aug 5, 2021 at 1:12 PM Vinesh Raut <vineshraut2017@gmail.com> wrote:
> >
> > multiple UNNECESSARY_CASTS warnings fixed from mptlan.c

> So what is casted here? from which type to which type?
From void pointer to struct sk_buff  pointer.

> Explain which type of bug here specifically would be hidden.
If a pointer is cast (wrongly), bugs like memory corruption,
segmentation faults can occur.
Also, It can affect functionality of the program.

> If you do that, it is much more comprehensible and clearer why this
> deserves to be addressed (or not).
First , it is redundant. It will be difficult to debug. May hide Bugs
if any due to
(wrongly) explicit casting


Regards,
-Vinesh Raut
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
