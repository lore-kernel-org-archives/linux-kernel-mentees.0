Return-Path: <SRS0=qNgb=MY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC44C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 21:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2FC60F5A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 21:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E2FC60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F5E40381;
	Sun,  1 Aug 2021 21:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZpiC2EVAq0N; Sun,  1 Aug 2021 21:07:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F28A94037F;
	Sun,  1 Aug 2021 21:07:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD09AC0010;
	Sun,  1 Aug 2021 21:07:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F10EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 21:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CAAD83925
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 21:07:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTRuPIN6qLKW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 21:07:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24FCA838D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 21:07:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u3so29950179lff.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dS7pNqSBc0P3A3WE6qvQ00cFeCQuVokYFHJuQKird3U=;
 b=egbmJN1RtVq4meV5l4wFlYRQVAE10j6zbtvT5OQVbfJ4czgwKh/g+Miz834JYU5fFy
 AhpEKhjo20ptkLbyVQLpmgHnR0tbLg3780o47E0G5GPQlQgLKYXP3bOKPK5BvzTTlsj2
 h2HFgAq13e91hNSMbvCVU6Vs1YC28r7dr13+KHKTzLwBSlaAEVp5mgOWLnuDzrZW+mdZ
 8gdyO+inuAWOCY6s7y/FkD2aMkQ0WnhT2K1IGk/2WJcNNDjic2u5CdPAVql5M44+R56B
 0JecQcrBBGxuZjgL2YE+tZVKT6NgKlcCJHYXwfEps5X7bCpzrYZ8vhZtU+On+S5XIsdI
 NhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dS7pNqSBc0P3A3WE6qvQ00cFeCQuVokYFHJuQKird3U=;
 b=PpFT6pT/aobbjiXGqybHKBGY7ToDcMgt1czH+sQbccg7HteHF9yo0GYMA4KlZU3O01
 2OeZzmH6i5LMjCo9JS5dzIH4J+CeRSmGIwmgGwU0S6Dej6Pz2f9LgS6XmMt0aQOw8fkZ
 kNVrW/8clUMld+oPu0LbEeXOKpE6DJxcpOfcC8tl5xzaAqIJBv8LgXOBpJ7TSrev6lWX
 fsrTlMXRbvdu8v8SfnPvzFtor1P9z9vlLNc+70QIoUz2wHL0MzFL+69dCXN1Rp0PYeJQ
 i3bmPMdqoLVdcpsXlqHS4W6L+rF3lbJG28YLnPM/+jbH2yV+dnDwzJde9vSiVDMt9MZb
 Li5w==
X-Gm-Message-State: AOAM533GG2Y5VHwUGIHn6Eo7LfF6jyIQPw/5K+jJsYwLHdXq/Ek/oFAC
 c23cZpWPXK2NETbp5ElOYkXqDKB9oZyEJvb6+PI=
X-Google-Smtp-Source: ABdhPJz1XDagGb1+lYBz2PMJTOzZyO27GJQqtceU8mvfdAujyTfullRqXaS32+IHdnheLtIvMqBbvCGX98iyBMhoJm8=
X-Received: by 2002:a05:6512:455:: with SMTP id
 y21mr3225751lfk.246.1627852069796; 
 Sun, 01 Aug 2021 14:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <CADywMdoz9NMyEcx+Rd5_ne9eR4HZCTEc5yvKP3JuHAnfnnD0Yg@mail.gmail.com>
 <CABJPP5DXD_gpaZs13MthNMf-cn=YTYtDSTw056UqRysu70-5ag@mail.gmail.com>
In-Reply-To: <CABJPP5DXD_gpaZs13MthNMf-cn=YTYtDSTw056UqRysu70-5ag@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 2 Aug 2021 02:37:38 +0530
Message-ID: <CABJPP5B1e8RbsL-aBoA6zqA2zH0=hQw-=DvkEhS7PfwW2UZ8=Q@mail.gmail.com>
Subject: Re: Request for tasks regarding Checkpatch Documentation mentorship
 program (LFX)
To: Rahul Balaji <rahulbalaji78@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Aug 2, 2021 at 2:33 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sat, Jul 31, 2021 at 12:26 AM Rahul Balaji <rahulbalaji78@gmail.com> wrote:
> >
> > Respected sir,
> >
> > I am interested in working on the checkpath documentation project under your mentorship and would like to work on tasks for the selection process.
> >
> > Sincerely,
> > Rahul Balaji
> >
>
> On Sat, Jul 24, 2021 at 6:41 PM Yash Singhal <ramusinghal112@gmail.com> wrote:
> >
> > Hello Mentors,
> > I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
>
> Thanks for your interest in working with the checkpatch documentation.
>
> The zeroth task is to learn suitable netiquette for the communication with
> the kernel community. Below are some basic rules and pointers for this
> mentorship. More information on kernel netiquette is also at
> https://people.kernel.org/tglx/notes-about-netiquette.

<snip>

Rahul,
Seems that this was a duplicate mail.
You can ignore this and continue making the patches as Lukas
already informed you.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
