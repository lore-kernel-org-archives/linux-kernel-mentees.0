Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54C6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:33:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270B12073A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlRsjAjJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270B12073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88839879E9;
	Wed, 14 Oct 2020 09:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJFvO_hj-sGy; Wed, 14 Oct 2020 09:33:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 792CB86EBB;
	Wed, 14 Oct 2020 09:33:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FC20C07FF;
	Wed, 14 Oct 2020 09:33:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6517BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 533C587613
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2WoPN+C3204
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:33:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6BE9A87557
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:33:19 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id l2so2982664lfk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 02:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJ9KVO0uTIR8DIMeBMgl/s9wLWo0k4dwdBER2qFoQ80=;
 b=mlRsjAjJH66EnSviYrh3Z8ODFPgK27pP0HmBxatjC58DmFr7FmGdsQ7NlKhXCv09+3
 nU/10ZnyzOkUloi231t7cZo+knkQnykS424g44Tzq3Lwqn3xbVVabahsV7zCouBhuilY
 0sk0B3hqU61wWX4A9y+nSa4UV6HWJrvayT0YGu/j50GUexoaWHi27SOsqkNeAT7Lbc77
 VChauVVcAq+ktCjVFz9M66iskKXweJyKDv0LH5GMvvk/LUDubcEI5ZT8K78kdPGbxYR9
 zmsMP5fJZLAIrST5GPS2AGyjRMmO4QRJ00+BSx3CYt2gfo/3HQVRShrzoaiQFut50U2E
 IEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJ9KVO0uTIR8DIMeBMgl/s9wLWo0k4dwdBER2qFoQ80=;
 b=jZz15DXl0LjvLisPD5tM41+cFdJWzMrZojndgIMVrt9USZhapitZ/5plwPCPwQfRmq
 bTe2ggDHkxToT/c7rFL8uoYW0srpIi+aiQKF7F+SzFEJddXlslahpOjH7VwENIgks6uG
 2+Yyu6d+ygoUGkcBH5GKRJ4SAfPrwWvipg2JGaRTgx0CixTLRIy0QKTY0ug49rz0qsXh
 gmx8LTz+bdNCFtNG1zCRb9odeV4/WOT2OQMbzMw6+nhLwabx6rIeQpzzPL3bq/0M8r7S
 P6DsXcpTLwehKnM95fKyW1JrQHZJJLh2Fz3NaDgAZwHVH8CIrg6fgz/5SAckzRH7Pes0
 Yidw==
X-Gm-Message-State: AOAM531+6S0htAixXaI5nVs/N/iMn7FQ+BcQlohk6rlE1GkZtfROAqKh
 t+XtS3m1SseqC8/ClOPWh/bD1eDuBTDMg0sk0Ww=
X-Google-Smtp-Source: ABdhPJwWcSgoA5S7yWXdTlY2w62itHHghAzVOllpb1iFQxqWlMyjYCxxHntKYTkcg3KlVkWURBbN3JeDd61Zt8bUbD8=
X-Received: by 2002:a05:6512:2098:: with SMTP id
 t24mr1196567lfr.116.1602667997668; 
 Wed, 14 Oct 2020 02:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002954fa05b02468d7@google.com>
 <300c32a1-a0de-4f05-b467-0822b3d21733n@googlegroups.com>
 <CACT4Y+bw2EXyKnO6mB3ZKBTWWJ1gd7VMkNvYxD=xwbuRjYwj8g@mail.gmail.com>
 <CAC2o3DKaaxoManhVoFVeB8bLQycPVY8z+ndAVqVaT76vvgzm=Q@mail.gmail.com>
 <CACT4Y+ZBPTwvf9gH8JerBQLNCBvRPvXQpvGvDSHD2Y8Tsc91gw@mail.gmail.com>
 <CAC2o3DJus556g6DOtecZB2a8cGJEtF-WrkvrYVj18EPfYHnK3g@mail.gmail.com>
 <CACT4Y+Z867EecgQZYd49nWr75f-JcPA7pYAJvu1tOZi9JwaQvA@mail.gmail.com>
 <CAKXUXMzFB4RVyYq0XS_1PZWgJVAW+CG8krHQr2iPAPaOykzyGA@mail.gmail.com>
In-Reply-To: <CAKXUXMzFB4RVyYq0XS_1PZWgJVAW+CG8krHQr2iPAPaOykzyGA@mail.gmail.com>
From: Fox Chen <foxhlchen@gmail.com>
Date: Wed, 14 Oct 2020 17:33:06 +0800
Message-ID: <CAC2o3DJk+0y6BXm6QMVgmq737ev4QAoPsBi-J5MipFVzyDj3Lw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [Linux-kernel-mentees] KASAN: slab-out-of-bounds Read in
	squashfs_get_id
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

Hi Lukas,

> If the mailing list is archived on lore.kernel.org
> (https://lore.kernel.org/lists.html), you can search the email there
> and you will find a suitable mailto link (which might work for your
> client)
>
> Alternatively, you can download an mbox, load that with an email
> client, and then respond from mutt, pine etc.

Oh, Great!

> syzkaller-bugs is not archived at lore.kernel.org, but I assumed all
> those emails there also go out to lkml.
>
> If useful, we could ask to archive syzkaller-bugs on lore.kernel.org as well.
>

Yes, that would be helpful.


thanks,
fox
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
