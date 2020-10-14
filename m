Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB6EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:28:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF546206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2Sx5AgD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF546206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4AB44875E6;
	Wed, 14 Oct 2020 09:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fslzsr-9xWSF; Wed, 14 Oct 2020 09:28:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB2F98758C;
	Wed, 14 Oct 2020 09:28:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B06CFC07FF;
	Wed, 14 Oct 2020 09:28:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9553C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DF7C687B72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jfq3lH9zzmWr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:28:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35B1587B6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:28:24 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q25so4212204ioh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8EftCVoWMr9g9/3nR/lzczp3hiLspvPCR86qMdeLOw=;
 b=r2Sx5AgDeiwUtJl0QMZ+2d7WkXEKPj+lPuSpVF5xk/uGA2wuHpuBVCyshfP0296XpV
 6RROgeIvdvm8MbLDMVbpoCfawbEj+aL7lNnSV07ZwYpIP2MJfeJ8WysaCeydumyRQG+G
 17SzRoHlY/YMl5wTFRVijpOd0NOyHnWIi/UM3HeAPzI0pWHEn5n8ovjxiuey7Dv2yJB0
 BZDSFhDz0XUnk3lQsn191UyxiIE/JZ16CNPmJ+Bz96/M0DQwH1Qb84dw1EXw0H5N/uD3
 /fUAU5PQNCc6PxzhtWbgHbfS0/+G2Z0RmdVQ5OGYZ/7WXtNUGo24dxSD/ja3O2xR47cx
 fOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8EftCVoWMr9g9/3nR/lzczp3hiLspvPCR86qMdeLOw=;
 b=tWcKAdNtaMMbPgeJArHesQFwzqxM6ctWjMBvcC6dZaw9FI6wQi4EVv6wOW+XQealDY
 Q6jOg9ZC5c3O2sHw0elLDEx/vp8xbCHAyGHo7anHCw1vFnuT0FdgRBq3pfzsH8XIG9zb
 +riyOm/Il9GGKCT2UZOlTbmJoL8ghdsJlRIRvQ74+0T+CgcVmfiYgqgdsHseMtnqhvCL
 Y7o2HneZqyRfbGyFSTr7fk8w6cFfPF8LrSDebh7mehjtjUBjrpFO9/hZhqtV9q8HN2AF
 MrZTYhJbl5vTr+Sb5q+HA0ULZtAnMAtm7y28dIfQIIbtoX/prWxDcqzzvkrzTkH2lxsX
 ANiQ==
X-Gm-Message-State: AOAM530d70AkbjzVFMIiIPg3NsYrO1h4GDjuCuPpUi4jrI3WvVGBDADI
 9ZhShGMPEXtRiHFyVOjDUMDWA13lRJ+p+P0B9B8=
X-Google-Smtp-Source: ABdhPJwe7qvlZkybhAgxE3nhTxpmMPWaxntDD3S8jYyDwbITbcWS3PdQylvEYJkmozx6+Wm5Hm5aRV0J2JXnri3amQY=
X-Received: by 2002:a02:a90c:: with SMTP id n12mr2282565jam.102.1602667703550; 
 Wed, 14 Oct 2020 02:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002954fa05b02468d7@google.com>
 <300c32a1-a0de-4f05-b467-0822b3d21733n@googlegroups.com>
 <CACT4Y+bw2EXyKnO6mB3ZKBTWWJ1gd7VMkNvYxD=xwbuRjYwj8g@mail.gmail.com>
 <CAC2o3DKaaxoManhVoFVeB8bLQycPVY8z+ndAVqVaT76vvgzm=Q@mail.gmail.com>
 <CACT4Y+ZBPTwvf9gH8JerBQLNCBvRPvXQpvGvDSHD2Y8Tsc91gw@mail.gmail.com>
 <CAC2o3DJus556g6DOtecZB2a8cGJEtF-WrkvrYVj18EPfYHnK3g@mail.gmail.com>
 <CACT4Y+Z867EecgQZYd49nWr75f-JcPA7pYAJvu1tOZi9JwaQvA@mail.gmail.com>
In-Reply-To: <CACT4Y+Z867EecgQZYd49nWr75f-JcPA7pYAJvu1tOZi9JwaQvA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 14 Oct 2020 11:28:08 +0200
Message-ID: <CAKXUXMzFB4RVyYq0XS_1PZWgJVAW+CG8krHQr2iPAPaOykzyGA@mail.gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Fox Chen <foxhlchen@gmail.com>
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

On Wed, Oct 14, 2020 at 11:21 AM Dmitry Vyukov via
Linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
wrote:
>
> On Wed, Oct 14, 2020 at 11:13 AM Fox Chen <foxhlchen@gmail.com> wrote:
> > > Oh, from groups. Yes, that won't work for the kernel. That also
> > > generated an HTML email, which is generally not welcome on kernel
> > > mailing lists.
> > >
> >
> > Got it! thank you!
> >
> > If I miss the original email, without using "groups", how can I reply
> > to the thread??
> > Apart from manually copying/pasting the content, recipients, and
> > setting in-reply-to, Is there any convenient way??
>
> No, unfortunately, no convenient way. Nature of email-based
> development workflow.
>
> I think I've seen some web archives in the past that allowed you to
> forward an email to yourself, and then you can reply to it normally.
> But I don't remember where it was. Maybe you can find it.
>

If the mailing list is archived on lore.kernel.org
(https://lore.kernel.org/lists.html), you can search the email there
and you will find a suitable mailto link (which might work for your
client)

Alternatively, you can download an mbox, load that with an email
client, and then respond from mutt, pine etc.

syzkaller-bugs is not archived at lore.kernel.org, but I assumed all
those emails there also go out to lkml.

If useful, we could ask to archive syzkaller-bugs on lore.kernel.org as well.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
