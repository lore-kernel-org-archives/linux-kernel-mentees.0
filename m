Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113DDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:36:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447452073A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Icc7IPLj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 447452073A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76C6787D98;
	Wed, 14 Oct 2020 09:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOUs7KLez4WO; Wed, 14 Oct 2020 09:36:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E1EB687C89;
	Wed, 14 Oct 2020 09:36:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9DB8C07FF;
	Wed, 14 Oct 2020 09:36:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D019AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B70B1879E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nK5LxFPwMkX0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:36:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 14387878EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:36:43 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id k9so2183858qki.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 02:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S1mZoPzOULBVppUuwIsrkOnA3m7UVFepvP6qZbPkerI=;
 b=Icc7IPLjSSzJzhThhTFcc8m3OnoL6u6yzqQlWSSn3pLRjOGDGr9POc/otcf1QnVto/
 SNoXCN3ahUZgnZP1/rmR0FsvcPbGndEwiGu44whZrkH93opqZI2VPfwT1P/nkisJeSPM
 MLmHeduoTeOuXhGtrN57mau6TNx9QiPF9kX+2p+MAhjbAF05IM59gFvfMAH/RFvbsDv2
 d8SxsJZp/y4YyNiRyHbZST5zk+uROwBIG7VHGdBsyGxg6jmO3flCMa4kS6H0nlCwzLu5
 rpdNgsKTQ45o0rp92BCBcNSs1iTTnjWrJ8G3eWf1PF64ALHf7kbcoM/W1lYUuZqO60O2
 7fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S1mZoPzOULBVppUuwIsrkOnA3m7UVFepvP6qZbPkerI=;
 b=FIPpJ9n9yP8PUCuzxGMweGCGbcLhMH+8Tl3XV8rP90Jg9iEqB4mjUHc7vAXjj1G08R
 y70e5uXS221JT5qyjNbcESGFRV5DD1rHgLMfh+Cgg56JA3d7Ms9bTlkXgMf7ReF3ptBB
 R3wU8UY6OphvfowS271iacHpVY0/ujJ3X64JxP8zoETG0r8ggIemwCHiPsSM4Nyc4tsM
 sFHx6+WGG+p1n1KVRuUI4tdMkEeaiuqBzEil2P/WHQPfnHXlXTN9zw677y60/C7pIflm
 yLi6TQ1F229I/sUXjMeHpGSryKD6Jd/g9usXYmRA9922GrHjajKjF9JdS0CRow+bdvcP
 x+zA==
X-Gm-Message-State: AOAM5315vDVSCL1BJKepw3vbxX//bIcJSw1xvLio/XeFWQhAvk8aeX/F
 fvXRMKIMCJVzg8qxbbjsYNSdT5uYNclusYCS0ZJRRw==
X-Google-Smtp-Source: ABdhPJz8J2FqfqW9ABRegkbnG+RLBKEuO8nLEjrkBf70l4R+t1GZOuSu2CtQhcMqLt+L4DGZUZ/hDFjjjnCMV/2sTRs=
X-Received: by 2002:a37:4d41:: with SMTP id a62mr1251183qkb.265.1602668201795; 
 Wed, 14 Oct 2020 02:36:41 -0700 (PDT)
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
Date: Wed, 14 Oct 2020 11:36:30 +0200
Message-ID: <CACT4Y+aYPRvpOTubV6xL3sCoU=ukpd9Bv6yJdL7wzd=JjQfhPA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Oct 14, 2020 at 11:28 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Wed, Oct 14, 2020 at 11:21 AM Dmitry Vyukov via
> Linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
> wrote:
> >
> > On Wed, Oct 14, 2020 at 11:13 AM Fox Chen <foxhlchen@gmail.com> wrote:
> > > > Oh, from groups. Yes, that won't work for the kernel. That also
> > > > generated an HTML email, which is generally not welcome on kernel
> > > > mailing lists.
> > > >
> > >
> > > Got it! thank you!
> > >
> > > If I miss the original email, without using "groups", how can I reply
> > > to the thread??
> > > Apart from manually copying/pasting the content, recipients, and
> > > setting in-reply-to, Is there any convenient way??
> >
> > No, unfortunately, no convenient way. Nature of email-based
> > development workflow.
> >
> > I think I've seen some web archives in the past that allowed you to
> > forward an email to yourself, and then you can reply to it normally.
> > But I don't remember where it was. Maybe you can find it.
> >
>
> If the mailing list is archived on lore.kernel.org
> (https://lore.kernel.org/lists.html), you can search the email there
> and you will find a suitable mailto link (which might work for your
> client)
>
> Alternatively, you can download an mbox, load that with an email
> client, and then respond from mutt, pine etc.
>
> syzkaller-bugs is not archived at lore.kernel.org, but I assumed all
> those emails there also go out to lkml.
>
> If useful, we could ask to archive syzkaller-bugs on lore.kernel.org as well.

All syzbot emails are also CCed to LKML, so searching linux-kernel should do.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
