Return-Path: <SRS0=sDOq=IS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C618C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 16:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0520561878
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 16:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0520561878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA1F2401DD;
	Sat, 20 Mar 2021 16:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsKUncwFhypz; Sat, 20 Mar 2021 16:04:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF0F2401DA;
	Sat, 20 Mar 2021 16:04:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95A42C000A;
	Sat, 20 Mar 2021 16:04:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74A78C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 557BB605CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IhM-dLtPS7v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:04:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04D4E605B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:04:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 75so14661466lfa.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 09:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KE0WMootWm16d6fHb/1g/t/bT+n72yoTQW8hbyv3dnM=;
 b=tVd9A1sws3Gp7nUjK0Jx6Kr32eCxPRZag3IA0YZxEhsxSolc5D1r73kdCQVAhgT6RS
 E/SrV3dxUAMLerW9NsPFZ9h4Rm0ShMm0bAAnW70uSERZDVexbMXESeEirxaCntiggmri
 U4WkYqVovyVkbjkPpF1hGZiiDB72RbpoQiAU6O5Cx44FXHN8uxZMYeMjTY5dBVe5+KNb
 MpN7gdrrVRXjXDMuAF0+G+ghI3BbXGayFhOXxlE1S9gVIGhfw2+U1hNmHjs4TA1pAI+d
 CbL78Mwl2cda/Wt5nNUBKgRgrkH9rigUHEULrA7qBMKKod8O9IMGP5bgtNFm0t7pJXad
 v70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KE0WMootWm16d6fHb/1g/t/bT+n72yoTQW8hbyv3dnM=;
 b=YaGMydVZ9tAimybSEGbWkHxlIa3bPvksoouMhG41EHBykS+c2qrjVaPPfpivmdHrOP
 sjYmjcaUy1A1nnqql1th5Pel6rPlyTOE8lIARh+8z3Y0hae1jTP/fpTPx88o4ibjdftT
 JgDJ4awpvbYBR7hdvjw8PJyet6CPq0a0JsGtXUNOinQ6VVQgxxgkRblXHdwThhYA7fMh
 0cMHygNy+DX0WBZ7uZziV+2LNhVCcj7ScF75hkagkmflqb45m++FOwPcwAQbEgk0qkiB
 1ChxwT0MiBfCirKXI6+OwxmLHWl+AbErqY4dRbq8zjFIWdBpLgtNK5cb6EH8GNXA8W9Z
 QGCA==
X-Gm-Message-State: AOAM5320CNN8+SZZiauct2w6o7E76RB5jL7HDOztK1+DVp60bsktvCVE
 Lrk0koQE9XAhkwcsSz0I5RMjF3xMGRB6BC4DVAE=
X-Google-Smtp-Source: ABdhPJzjIPFt1HpZF0v8eybD2IRFMjhrhdNOEM6Y9xB+pOrK65f78wOIVBwnnFNoWt9qeD1dqTp1aHPMJsWX0tUdhc0=
X-Received: by 2002:ac2:5e9d:: with SMTP id b29mr3946194lfq.31.1616256267750; 
 Sat, 20 Mar 2021 09:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5Amu7dr=i1moc4eK2+WEhQky5V5HsweiOPzxaxGTitZdg@mail.gmail.com>
 <CAKXUXMwiFQc+A0A+FCu7c1_i3EW_CezRv_0oNu=9Fm8SMbhxnw@mail.gmail.com>
In-Reply-To: <CAKXUXMwiFQc+A0A+FCu7c1_i3EW_CezRv_0oNu=9Fm8SMbhxnw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 20 Mar 2021 21:34:17 +0530
Message-ID: <CABJPP5CoSQV93h+hCMae=b6aaDK4WrphRALx_drw5mm8UF2OjQ@mail.gmail.com>
Subject: Re: Mentorship report first draft
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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

On Sat, Mar 20, 2021 at 7:33 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Dwaipayan, see my comments below inline.
>
> Fix those minor issues, give the report to somebody else for another
> review (and get some more comments), and then I think we are all good
> to publish this.

Sure I will fix them. How are we going to publish it? We just share the link it
is hosted on or something else?

>
> Lukas
>
> > ---
> > title: "Linux Kernel checkpatch.pl mentorship"
> > date: 2021-03-06T02:05:17+05:30
> > draft: false
> > ---
> >
> > ## Checkpatch - What is it?
> > [checkpatch.pl](https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl) is a trivial style checker for patches sent to the linux kernel.
> >
> > Why is it needed you say?</br>
> > I did an analysis on checkpatch warnings on about 50k commits from v5.4.</br>
> > (Find the full report {{% link checkpatch_out_50k.txt %}}here{{% /link %}})
> >
> > The top errors were then generated via the following shell command:
> > ```/bin/bash
> > cat checkpatch_out_50k.txt | grep -oP "(?:WARNING|ERROR|CHECK):(\w+)" \
> > | sort | uniq -c | sort -nr  | head -n6
> > ```
> >
> > Count of errors | Error Types | Error
> > ----------------|-------------|------
> > 41999 | <span style="color:green">CHECK</span> | CAMELCASE
> > 13629 | <span style="color:green">CHECK</span> | PARENTHESIS_ALIGNMENT
> > 11491 | <span style="color:orange">WARNING</span> | LONG_LINE
> > 8106 | <span style="color:green">CHECK</span> | SPACING
> > 6825 | <span style="color:orange">WARNING</span> | LEADING_SPACE
> > 4394 | <span style="color:green">CHECK</span> | OPEN_ENDED_LINE
> >
> > Hmm...The no. of stylistically incorrect bits still continue to exist and
>
> Drop the Hmm... or replace it by "As we can see,"
>
> Replace no. by number. (It is not good to abbreviate here.)
>
Okay will do.

> > are still merged into the kernel code. To make the kernel code more
> > stylistically coherent, we can:
> >
> > > - Create cleanup patches for the existing code
> > > - Make sure new patches are stylistically consistent
> >
> > Both of these are where checkpatch comes handy.
> >
> > ## Checkpatch in the patch submission process
> >
> > Before sending out the patches to the mailing list, it is recommended to
> > run checkpatch over the patches.
> >
> > In general, a Kernel developer would:
> >
> > > - Create the patch with his proposed changes.
> > > - Build check the patch, run additional tools like checkstack, sparse etc.
>
> maybe add "check for compiler warnings",
> checkstack does not exist anymore.
>

Oops the documentation seems to be outdated then.
https://www.kernel.org/doc/html/latest/process/submit-checklist.html
point no. 10
Will correct

> such as sparse and coccinelle
>
> > > - Run checkpatch.pl over the patches to eliminate all trivial style violations.
> > > - Send out the patch to the maintainers and mailing list.
> >
> >
> > The only catch here is that checkpatch is not always right. It is just a dumb
> > perl script. If the code looks better with checkpatch errors, let it be.
> >
>
> This is fine to say for the author or as direct advice to a developer, here
> I would phrase more neutral.
>
> > ## Drawbacks of checkpatch
> >
> > Checkpatch is only a static trivial style checker. It does not have the
> > capabilities of a full c based parser like [clang-format](https://www.kernel.org/doc/html/latest/process/clang-format.html). In this sense it is limited in
>
> write instead
> "a tool using a full-fledged C parser, such as clang-format"
>
> > what it can do. Still, it is highly valuable as a style checker tool and can
> > ease the work of maintainers and increase the chances of the patch being accepted
> > by the community.
> >
> > ## What did we do to improve it?
> >
> > Over the first 3 months of my mentorship period, I primarily focused on
>
> s/3/three/
>
> (write out numbers up to twelve).
>
> > eliminating false-positives from checkpatch as well as adding new rules.
> >
> s/false-positives/false positives/
> > Consider the following patch commit log:
> >
> > ```diff
> > #include asm/bitsperlong.h avoid further potential userspace pollution
> > by moving the #define of SHIFT_PER_LONG to bitops.h which is not
> > exported to userspace.
> > ```
> >
> > A kernel developer in 2020 would not see any checkpatch warning.
> >
> > A kernel developer in 2021 would see the following warning:
> > ```\bin\bash
> > WARNING: Commit log lines starting with '#' are dropped by git as comments
> > #82:
> > #include asm/bitsperlong.h avoid further potential userspace pollution
> > ```
> >
> > During the last 3 months I worked on two major features:
> >
>
> s/3/three/
>
> > > - Addition of a verbose mode to checkpatch
> > > - Addition of an external documentation to checkpatch
> >
> > For the documentation we decided to document all checkpatch message types,
> > their meanings and how to resolve them. This is still a work in progress.
> > Contributions are definitely welcome :-P.
> >
>
> Drop the :-P ; you are serious, we want to see contributions from others.
>
> > ### Verbose Mode
> >
> > This was one of the new additions we did to checkpatch.
> >
> > One can run checkpatch like this:
> >
> > ```/bin/bash
> > ./scripts/checkpatch.pl -v test.patch
> > ```
> >
> > All verbose descriptions can be seen by pairing the verbose option
> > with --list-types:
> >
> > ```/bin/bash
> > ./scripts/checkpatch.pl --list-types -v
> > ```
> >
> > ### Checkpatch Documentation
> >
> > The checkpatch documentation can be viewed from the kernel root
> > at `Documentation/dev-tools/checkpatch.rst`.
> >
>
> simply:
>  The checkpatch documentation is at `Documentation/dev-tools/checkpatch.rst`
>  in the kernel repository.
>
> > To build the documentation make sure you have configured sphynx
> > either in the system or in a python virtualenv. Next the kernel
> > doc can be built using:
> >
> > ```/bin/bash
> > make htmldocs
> > ```
> >
> > ## How to contribute to the documentation?
> >
> > The documentation is still a work in progress. Feel free to send
> > the patches to the kernel-doc mailing list, and add me (Dwaipayan
> > Ray <dwaipayanray1@gmail.com>) and Lukas (Lukas Bulwahn <lukas.bulwahn@gmail.com>) for reviewing it.
> >
> > The documentation is writted in rst syntax. Refer
> > [here](http://openalea.gforge.inria.fr/doc/openalea/doc/_build/html/source/sphinx/rest_syntax.html) for a quick guide.
> >
> > Before sending out the mail, please always:
> >
>
> s/writted/written/
> s/mail/patch/
>
> > > - checkpatch.pl your changes
> > > - build check your patch (in this case check the generated html docs)
> > > - spell check your patch (this can be easily done through checkpatch
> > >   using --codespell flag if you already have the codespell dictionary)
> >
> > ## Acknowledgements
> >
> > During my mentorship period I learned a lot from my mentors.
> > I would like to thank Lukas for his constant support as my mentor,
> > Joe for his guidance with checkpatch and everyone in the community for being such
> > amazing people.
> >
>
> > The kernel contribution process may look old but it works. This is due to the dedication of everyone in the community, which I am glad to be a part of.
>
> I think you need to explain that this is something you learned in this
> mentorship, and that newcomers might think at first, but where you
> have been surprised.

Yes sure I will be elaborating a bit on these. I feel that I should be able
to motivate others to enter this process.

Thanks for the review Lukas. I will be making the necessary changes.

Thanks & Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
