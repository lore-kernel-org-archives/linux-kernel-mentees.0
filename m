Return-Path: <SRS0=NdEt=HH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67481C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Feb 2021 09:11:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB2764F70
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Feb 2021 09:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAB2764F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62D6A86AE9;
	Fri,  5 Feb 2021 09:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_Npp4h26ywI; Fri,  5 Feb 2021 09:11:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B4A0686AB1;
	Fri,  5 Feb 2021 09:11:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F294C08A1;
	Fri,  5 Feb 2021 09:11:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CBF6C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 09:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 72D5686AB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 09:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhlZ1B8vP0eN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 09:11:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 79E8C86A22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 09:11:46 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id q9so5235164ilo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Feb 2021 01:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqbEWawoqYhsuJCxi2Tdceg8yFIc8QeSSPBU+pORiH0=;
 b=CJ02Mq0v3BveW/hmfyh7TlUiQUuBkq2kBr7XkLsJkbsdWR6ivsLKq5HUq36mFHutRj
 P/lpZBjJfTmJEwSDyRkExQBDQkkE4ygVN3hs/ACAQRXGKdxVrd4jA6arYu6Sj8FBA3Ax
 iRpNXpQPHgl/yquwbaHJuBBeqH/Y+uWCB+jqg6OjyLkUPRWia1LYfF5IV+sWWUbhsEbw
 UGnGpMjZkrlhYSY9968DGO7o+HmGmDdj1LmE4qxCEiJdOCgSggXPB5ACmFb92FtRKnBa
 /W3dvmr8jYV0U4FjbkTsky1/qOTsL8YaLmas2YxLwiu1ZcNVAi3dBsMODxmThcsc9LF7
 mOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqbEWawoqYhsuJCxi2Tdceg8yFIc8QeSSPBU+pORiH0=;
 b=GhJC8plx31eMeae08cKbCq/BH1vvYzrh/3lRyj9x7x1i8LmqutJ2/Kd7PjA9Pwomn6
 FWZ8u2LKG0eBRiI/3dZ9iu4R51tCUmVDVhbCVqRahkvcRCw0Y2ybe2msO/Vb5NS5aYXq
 cI9H9bEW9yh5j0czW6om+ruHPhZjP/8q4eMlFw6w2ZafoXTae5yESaGSwDYZObV00SkN
 MreZ6Zl7f+GoBYOmvQ/+ye2E2j6fI0pevZ7QtQk4xGaiiqS2uJJLkBOFMUx9BGAGEYx4
 jhVbDjPgSqUyBFhRK7CSZG6GqxoUTtKBkT9rOBlle/UVkyv9NuidAObnBKDjgjimmL8H
 R9XQ==
X-Gm-Message-State: AOAM533pP5oNryF6//h5aQ4il7IiDX+t6O4xvl5BkurlG0jHXTdHXiNm
 1/5FRA8inWQtbmnyywM0yQi2YBWmsJzN48J4ir8=
X-Google-Smtp-Source: ABdhPJw4J8yoA7oY4l53cMraxynXVeQm43sxT+J8Obl9rBOrK9Np+lbzC4Gt4mK3QqzEWKBhfdj8lQpCYI0iCONkVQQ=
X-Received: by 2002:a92:d1c9:: with SMTP id u9mr3180720ilg.125.1612516305715; 
 Fri, 05 Feb 2021 01:11:45 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5AZG-zyiY96oik0jLdcfZK=ApsHwcYpZHK3O9WdgJ=tcw@mail.gmail.com>
 <CAKXUXMxhjR1MMeHT5oDmy9=7qTNO7xmRemcVN8LsM56RGcuXhQ@mail.gmail.com>
 <CABJPP5BuQ_5D6n0w7AERi+q5bvmeEH23kyeARo0zOtC4MhM5fQ@mail.gmail.com>
In-Reply-To: <CABJPP5BuQ_5D6n0w7AERi+q5bvmeEH23kyeARo0zOtC4MhM5fQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 5 Feb 2021 10:11:34 +0100
Message-ID: <CAKXUXMzL6LfKahMwHBzWM9dSvCpbYjGK4+taiGj9WDeb6+bXfQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Regarding checkpatch docs
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

On Thu, Feb 4, 2021 at 9:46 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Thu, Feb 4, 2021 at 12:43 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Thu, Feb 4, 2021 at 7:25 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > Hi,
> > > I have been writing the checkpatch docs for a while now. As Joe mentioned,
> > > I am trying to write verbose descriptions for all the 214 types in checkpatch.
> > >
> >
> > In which order are you trying to create them?
> >
> > I would like to be involved in writing as well.
> >
> > E.g., how do we structure the 214 rules in the document? What are the
> > top-level chapters, sub-level sections for all different rules?
> >
> > Which should we start with? (Again, I think the checkpatch evaluation
> > can guide us to document the most important rules first.)
> >
>
> So I was trying to document all the types alphabetically. And arranging them
> in that format in the docs file.
>
> Basically, all these types come under the section Type descriptions, and all
> the entries (which are rst field lists), are sorted in alphabetical order.
>
> So the entries are something like:
> :ALLOC_ARRAY_ARGS:
>   The first argument for kcalloc or kmalloc_array should be the
>   number of elements. sizeof() as the first argument is generally
>   wrong.
>
> :ALLOC_SIZEOF_STRUCT:
>   The allocation style is bad.  In general for family of
>   allocation functions using sizeof() to get memory size,
>   p = alloc(sizeof(struct foo), ...)
>   should be:
>   p = alloc(sizeof(*p), ...)
>
> and so on...
>
> I haven't ordered them into sub sections yet. Do we write all the rules
> first so that the verbose mode is enabled, and then structure it later on?
>

Sure, you can do it that way as well. I just fear that you might get
stuck on a set of unimportant rules.

Try going through alphabetically, but do not be afraid to skip a rule
if you get stuck.

> Or do you prefer partitioning it into subsections first, and then writing
> the entries for that subsection? I haven't yet have a robust classification
> as I haven't gone through all the rules yet. Could you suggest something?
>

All good. Do it as you do.

I have an early (not yet robust) classification as well, but when you
do it independently once you are through all the rules, we have two
independent classifications.

Then, we can really compare and build one "perfect" classification by
combining the best from both. This will make the classification really
good to defend, because it is not just "a one-person initial
decision".

> > > How do I send it to you for review? Will a google docs file for the same work?
> > >
> >
> > Sure that works for me; you can also just send me a work-in-progress
> > patch queue (and I will apply it and add more patches on top) or
> > simply share a git repository on github.
> >
> > You can decide, I am perfectly fine with any way you choose.
> >
>
> Sure, then I will be uploading my repository onto github and we can work
> on a separate branch like "checkpatch"

Just send me the link and I pull it.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
