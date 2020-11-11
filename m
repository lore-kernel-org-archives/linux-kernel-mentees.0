Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BA4C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 11:13:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AA820659
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 11:13:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="LuFMYk0d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AA820659
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 18A312A163;
	Wed, 11 Nov 2020 11:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgMVgNd5gh54; Wed, 11 Nov 2020 11:13:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3D764228EF;
	Wed, 11 Nov 2020 11:13:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A4AAC0889;
	Wed, 11 Nov 2020 11:13:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEF2EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 91FBE2A163
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNp+16RYwsaC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:13:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 30CD9228EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:13:20 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id ek7so676511qvb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 03:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G25H3cRGlnqgYp9qHwhX1vczcSDgPbi+Ig9bY020mP0=;
 b=LuFMYk0dUlPR4FVrsNh5uk1umraI3MMg3mRmkuVk63xZv/LMdVaDxOtmuISraXdmiu
 UKgk7K9acPBkbNd769WbQNAn09tEAJWByf8wi9Mgnl5wFZtywKSQYUfQ66tgAEbq0r0k
 Rizv5JWEieM46t96h8fnk0/M4EOOEnS9dzd3kd8H79mDZ3OlTmWv97UbsSo+U7OUp5ts
 AT1fhh+uAxruSeumevEQIRGkKjU+p3qmFrVLRkFzEWFip4RL0bGK7YmBH0+ojSVSVOFr
 yI+aEuPz4c8ZyDe7ncItC/NQqJ5HyLESYlxYaUMCKbfNTi7fFhNCOi47apfNHoaYVD8G
 qLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G25H3cRGlnqgYp9qHwhX1vczcSDgPbi+Ig9bY020mP0=;
 b=tGilY9jmsv1eVV1yJjrMvJLuoKWe8j6z1RPQlXorR1WaBZU5enUMZbibv+2zQu5Xuj
 nhpR1p4JDr6yWRqIQ2Soh44RBOqKeQFssbWPGYMSfCXdxAywl/EHAlFYP0DYXjFz/tXz
 UZlR5uX98zPozDf2O/L7kvEb8h69zpy+c32D5sp9duLSaHvGKFOQzTpjd59yk6HlH9oF
 dsYjMorf8F5MOFZBgTEeWYdvi6hMeWLnijDCDzqmntlOx7mFXa2otpfuGod4Y9+t5YK+
 wA6DD9dCT86iKGKFSlNAOunOt4XEtABHZf/iLx9zG8MJ+Xck9K1bAQ51bNZeLQEY+aES
 eb/Q==
X-Gm-Message-State: AOAM5308wdbjvr2Q8omJ0fZuP3Zx5ehRtZVH8rYycnbon8Ww0yTaYPFu
 PbPHttVNivNyUvKHLwpMBHF+kNmw6R40CPyGiDEw8A==
X-Google-Smtp-Source: ABdhPJyg+2GPaoQR0835u3ehaZDK5bPh7OzIzQ+ehRY2+fCdQNAjE/kWDN0+UK+JeflqywTVYJzDTAQlIzWcj2Yj2r4=
X-Received: by 2002:a05:6214:9c4:: with SMTP id
 dp4mr3755509qvb.44.1605093198973; 
 Wed, 11 Nov 2020 03:13:18 -0800 (PST)
MIME-Version: 1.0
References: <0000000000009323e705ae870d48@google.com>
 <0000000000008dab1205b1208fe6@google.com>
In-Reply-To: <0000000000008dab1205b1208fe6@google.com>
Date: Wed, 11 Nov 2020 12:13:07 +0100
Message-ID: <CACT4Y+ba6jB8h1AptYx31AKsW=adXfgSyr1AdEEyqLmy=d6b9w@mail.gmail.com>
To: syzbot <syzbot+b8639c8dcb5ec4483d4f@syzkaller.appspotmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, jean-philippe@linaro.org,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>, jroedel@suse.de,
 Jan Kara <jack@suse.cz>, Saravana Kannan <saravanak@google.com>,
 Rafael Wysocki <rafael@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, hl1998@protonmail.com,
 linux-block <linux-block@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, dragonjetli@gmail.com,
 Dan Williams <dan.j.williams@intel.com>, johannes.thumshirn@wdc.com,
 linux-kernel-mentees@lists.linuxfoundation.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-kernel-mentees] KASAN: use-after-free Read in
	delete_partition
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Oct 8, 2020 at 5:38 AM syzbot
<syzbot+b8639c8dcb5ec4483d4f@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 08fc1ab6d748ab1a690fd483f41e2938984ce353
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Tue Sep 1 09:59:41 2020 +0000
>
>     block: fix locking in bdev_del_partition
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1259b1e7900000
> start commit:   f75aef39 Linux 5.9-rc3
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3c5f6ce8d5b68299
> dashboard link: https://syzkaller.appspot.com/bug?extid=b8639c8dcb5ec4483d4f
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15c43c79900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173dfa1e900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: block: fix locking in bdev_del_partition
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: block: fix locking in bdev_del_partition
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
