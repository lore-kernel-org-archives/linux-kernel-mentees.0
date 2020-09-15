Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F25C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:27:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCAF922251
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="O7FS3Ydc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCAF922251
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2F30E2076F;
	Tue, 15 Sep 2020 13:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mNQemsCm-0H; Tue, 15 Sep 2020 13:27:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D9D92204F0;
	Tue, 15 Sep 2020 13:27:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9013C0864;
	Tue, 15 Sep 2020 13:27:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51FE3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4130986693
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahQA40fMUOGC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:27:21 +0000 (UTC)
X-Greylist: delayed 00:45:08 by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 845AD86214
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:27:21 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y11so3089305qtn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vY7wEhQoY9KMQ3xGzg34Kjunk3poDNcfgwyWA+4aih4=;
 b=O7FS3YdcJHyE5n8qxH4w2BM+XsSYufvVMY9kAmDmvl6L0Rbn77mhvNndK0MjLYe3sa
 VHdnbHAjRSTLt43EBqU7AqcnGRWPgyauBR1FO6APHtvl5H5HQPnybUbxPwtxIhgpeRiK
 2yeq1CQe1JBCUx3x8fNhgCRIplVVo0hvF62A3VB/z6ajgwzA/cQpvX5ZL+OYcoV8aTYk
 hOGpS3CdHy0BYtHxhBX1/M6Xy67L/tRJ0OwligOATxvU5cJ7cG59UNdIJc+LhIvHLSlv
 mcrOwN1A5+XzMXIIlooJoPg2jEwlkdiXyUsMcktPgbqSM32jxDXoZSJgs2fsBCbM4sBr
 7r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vY7wEhQoY9KMQ3xGzg34Kjunk3poDNcfgwyWA+4aih4=;
 b=fbsxxEeGZxZqFiJnr7Zv9u667qqeVfNOiIsgPymqHvDGRo3dvol4nQ6U5F/wpduoP/
 jCfBIq0+/bBOUJ9IGtDMK3CKDgnNlxdu699n8x15VAPdWYpJsiZqkLDcHu/wMeyNKzWW
 WgXCSa2wWWd7q8NBHXF1vULFMObY256KhX5UtqoSLib9tIIC8LYdVN6rUD79cGtOkduf
 g4FTL2O4XQPWlMdJeeIDF7oHLqPdtwNH5+i8Xciiz4uTGQO5BFNeix/MVDS/roiSUXEp
 LsDYIrjYuC5U+zQI1yqXgHDA2YUQsZXnqHTr4mAuoFpsWIBPe4jdEYYmu2jzxRwYjilA
 eBVQ==
X-Gm-Message-State: AOAM531fNbR9+XVUTuWbXiMepTfIO4HMtV6LuOzEK1jVDrGSz7r5jG5V
 AP7o7+6547E4Gz+71fy1fLc6wg0CpI+V1Ubr29llCg==
X-Google-Smtp-Source: ABdhPJyShvx6MBJWB9aEOGmsuw9EtKsZiHyuZeCJyFGmT7J8tx9cAmgkJG7utOU05wtUsAJzoYiGj/s2/IDnvRYMQug=
X-Received: by 2002:ac8:bc9:: with SMTP id p9mr5803892qti.50.1600176440253;
 Tue, 15 Sep 2020 06:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
 <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
 <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com>
 <CAOY-YVmYR70itmk6oNC_7L+o1kxfd2_W0EgCYn4KEQyGK-KPRw@mail.gmail.com>
In-Reply-To: <CAOY-YVmYR70itmk6oNC_7L+o1kxfd2_W0EgCYn4KEQyGK-KPRw@mail.gmail.com>
Date: Tue, 15 Sep 2020 15:27:09 +0200
Message-ID: <CACT4Y+Yo_m9C1t7AHpVq+5E-RDejMQYpK2eZUk1JTTwo+Lf3-Q@mail.gmail.com>
To: Himadri Pandya <himadrispandya@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Question regarding marking bugs as
	"invalid"
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

On Tue, Sep 15, 2020 at 3:23 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > > > Hi,
> > > >
> > > > Is it correct to mark bugs as "invalid" if they have reproducers but
> > > > the reproducer doesn't trigger any issue on testing current status? If
> > > > not, then what should be done about such bugs?
> > > >
> > > > Thanks & Regards,
> > > > Himadri
> > > >
> > >
> > > Himadri,
> > >
> > > if possible try to determine which commit fixed the issue the
> > > reproducer triggered.
> > >
> > > You can potentially bisect with the reproducer on the git history or
> > > you can simply look in the git log of the affected files if someone
> > > mentioned fixing something related to the trigger.
> > >
> > > That helps to make sure we do not just close reproducers that just
> > > need a lot of time, configuration or luck to hit a certain crash.
> >
> >
> > Hi Himadri,
> >
> > Basically what Lukas said.
> > Bulk closing all of them as "invalid" would be bad for several
> > reasons. Either do some reasonable amount of degging, or wait for
> > syzbot fix bisection, maybe it will shed some light. It should happen
> > after 30 days since last crash IIRC. Also all testing requests/results
> > are shown on the dashboard, so this bit of information is not lost.
>
> Understood.
>
> I incorrectly assumed(before posting this question) that I should mark
> such bugs as invalid and sent the command to syzbot for one such bug.
> Now I understand that it was not the right thing. It doesn't show on
> the dashboard and I don't know how to undo it :(.
>
> Bug's dashboard link -
> https://syzkaller.appspot.com/bug?id=4c7fd5b46451d957a3d8188f393f1982f9753fe7

Hi Himadri,

Transitions to terminal states are not undo-able. Consider the same
bug is rediscovered concurrently with one undoing "#syz invalid". Now
we have 2 versions of the same bug and it will be an incomprehensible
mess.

But marking one bug in such a way is not the end of the world. We have
other real bugs marked as invalid. So no worries.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
