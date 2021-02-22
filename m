Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3073DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 04:48:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9691A64EB4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 04:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9691A64EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4C9E487090;
	Mon, 22 Feb 2021 04:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiyRlZfH2HNe; Mon, 22 Feb 2021 04:48:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 613BA87036;
	Mon, 22 Feb 2021 04:48:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E04AC000A;
	Mon, 22 Feb 2021 04:48:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE50FC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 04:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B58FC831F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 04:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrFaxeIN_Tzp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 04:48:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CDEC831C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 04:48:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id r23so54378113ljh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 20:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T9VDWpnb5lfzit8yS6WyeZO6cXnnRi0ASXtFAlOXtGQ=;
 b=ZQoECtYg95T1WUJ7rlkNUoB2fEylQMU7nwAvu80LUOe9PriPH731NwSWpIt3UMdrwy
 q2TZkMl+WJUbgbyN4Y7yRP71IC+3SNBAlZi5a7lDpiNaCS6L1BDgdeD8aL+ys9cS98s9
 BySvhwM1g7Tx9AOfo3eIoWJ6VNN42rMKoJBZgv+GDc2hQyZP29/uHQ7NuXRJ9qk1DRQM
 VcmLLBO28lo/fl48XKkL+VMaweH8G9GCftKvoz143k++SiUEIJ5YOLIeJq2Vw9QrF2y8
 /VEvOioie6CNb/v6xawdP2amBGcX2VuVGOND59Pwm7xAFt+t9OwZzs4RIRbaO3PaeU9J
 JaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T9VDWpnb5lfzit8yS6WyeZO6cXnnRi0ASXtFAlOXtGQ=;
 b=pfwmSvxDhu/0PP11Du/7TSm9pLrliQIJqV9hPDhVb2wSW6TQm4d/hCsYD0Kl0kVFuS
 OM2eXgJcfhus4mDSkSy9MOJqvpeHikE3f9e9PIVZVRQDMNC8S7BuwDugSkZsCQLL8GUi
 4Gx72Ew4h/+TNt2Q5KuprtLLRqCVHabYIksTg9oTWwcQ/RtneybX25FVh44tUhO0WJ4c
 eEdJuzeXjH/9XZN+kZ+LK9gO6rwfBoxBJEXm4nniGbhBeqiTKNWkqlxb1hj4M1NjpSRj
 d+6+SSGSZ7Jr3maDEL2Ph2bU7LUfyrwWQVSNyXBRMIYcP0lFE49uRW1eUt62m+FcXhsS
 yHtQ==
X-Gm-Message-State: AOAM531rfNGWt5vJhbhK6fgYXJpH6WFCbFc2eDVpSQlJfN7JFdpviO0p
 G/SCPv5tMIkj0bHucGzjhjSp/UPBB5Ttt6CkhS8=
X-Google-Smtp-Source: ABdhPJzlpPEGc66709Uzvnm1Zpg1ZXQG6r4s65eRlBlZOsGe+xlTtKrspZuH9YpF0jiHOjquWIq8/vtjeAmZojXDg80=
X-Received: by 2002:a19:c194:: with SMTP id r142mr4959749lff.342.1613969312967; 
 Sun, 21 Feb 2021 20:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20210221115802.19788-1-dwaipayanray1@gmail.com>
 <20210221115802.19788-2-dwaipayanray1@gmail.com>
 <46c3b16602f36858b194b22dfbdb2150e25f5d94.camel@perches.com>
 <CABJPP5CJKUeaxUqKzuJD5pd2HsHKcAx9x3iCm6W+Z8AuXiR5Rg@mail.gmail.com>
 <7bd4520e2552e1a9ae7eccb812c197d6a955e85c.camel@perches.com>
In-Reply-To: <7bd4520e2552e1a9ae7eccb812c197d6a955e85c.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 22 Feb 2021 10:18:33 +0530
Message-ID: <CABJPP5BkFj1N+PNpLmT4J_kNuD0q14EvmOQoLEkA8760iG4TfQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v6 1/2] checkpatch: add verbose
	mode
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

On Mon, Feb 22, 2021 at 8:14 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2021-02-22 at 00:05 +0530, Dwaipayan Ray wrote:
> > On Sun, Feb 21, 2021 at 11:36 PM Joe Perches <joe@perches.com> wrote:
> > >
> > > On Sun, 2021-02-21 at 17:28 +0530, Dwaipayan Ray wrote:
> > > > Add a new verbose mode to checkpatch.pl to emit additional verbose
> > > > test descriptions. The verbose mode is optional and can be enabled
> > > > by the flag -v or --verbose.
> > >
> > > OK, maybe add color coding to the list_types output.
> > Okay, nice idea!
> []
> > Sure, I will do something like this.
> > Are there any other improvements you can see right now
> > or will the coloring thing suffice?
>
> A lot more descriptive output for the .rst file and
> of course a lot more of the types documented...
>

Sure I was hoping to do that over time after getting
this series in...

Nevertheless I will send the v7 in right away with the color
code changes.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
