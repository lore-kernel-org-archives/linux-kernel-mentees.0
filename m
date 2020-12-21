Return-Path: <SRS0=69VX=FZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26DEC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Dec 2020 15:58:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310A122B51
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Dec 2020 15:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 310A122B51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E25A186687;
	Mon, 21 Dec 2020 15:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NFaeW5WO3l8K; Mon, 21 Dec 2020 15:58:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E5B986214;
	Mon, 21 Dec 2020 15:58:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAE16C0893;
	Mon, 21 Dec 2020 15:58:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFB56C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 15:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EB4128789C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 15:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmQpwj-F4UJ6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 15:58:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 04C9887440
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 15:58:45 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id t8so9242443iov.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 07:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EwWijBnSltlgTEzJzqXGjVClYmKQHbHidRzLX1E8k80=;
 b=t627Ddhlu0OdAYuZ/2UnFa01ahwlEiaZJ0H0OprSJ+f2d25QTUeecdGlWfxMWGVzUc
 02qyZta756LfExE+U2P0iJRKx1pTOWNwjw5CsHOfs1ITkNuwWNx93ZQ3WXmwNQ5pAh8F
 HILIUyJitkcCphPDmftyGFeWSoYNvN305AV83T14Cb79ZRCWnNbuvbJDm8IQEZbE9GIT
 EIp8zNi9gUzolq4I4eYLkRvY1IBG6bZtucw/Z9CtNR5qqXwH1UPN4LqudvwqCbhuN8ta
 zu8+Nw+dE2XBt7TS5whwFq3j8ueuPg4xNicPqEkuAzWQI2f7J19yQfAZqljcalmCk+w3
 f+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EwWijBnSltlgTEzJzqXGjVClYmKQHbHidRzLX1E8k80=;
 b=lFd1ApYzsdDSQSrrtZawWw7oqsmE6d9rNp26bpmo4HECzbd8Yi4c3PBZ3ozcPqjM+W
 25Z6qJbcdLbFKZlYY7JWOhVitYAxz1xEk37R4yLlnYOqf0HhssxAYQ4fMFdMJz7HAD5G
 QLkeE5BSSydLh3nE7ogjyGdK0hM1GKEQnqL1yOwBUhdj7pN4CGaRSjqmN7xlazrlSWfW
 vRcZzJwwk4J5FY/UxaEdCuqnkGHjC0rFZV+08vB7JfPlhcxricn/Mf+kD+1VGK2lft/z
 MIE5xQvbo1HMfYuBOlzKg8BvGzZ1h8DjEzbSnITXs8cPNw2pPD5zyAtxHHxMjpbZ2qqB
 mPaQ==
X-Gm-Message-State: AOAM532rGWCZw64urwdnJf4DUwU3eDkZUSQg04Tnu7+twgRAH8sYRFYC
 uM+apPpdalPpUwCpVuhqVeD7fyhS4NPA+fRaveKY5yzweY0=
X-Google-Smtp-Source: ABdhPJw4ce3stSiQKncN2J4aAv1q2AcvapQdijYzWMR/cSJtIizubQCNG1s7ls7m6zc5XCsuhl9uvu2b6X0tr910ltc=
X-Received: by 2002:a6b:6d1a:: with SMTP id a26mr14762120iod.158.1608566324272; 
 Mon, 21 Dec 2020 07:58:44 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMz6TuYZkZJbgDBPiH4MmecUUbLjPct9XnZZu12VP+w4mw@mail.gmail.com>
 <20201220183307.8744-1-yashsri421@gmail.com>
 <CAKXUXMw-AtthCG9y4_wYBKaF36BbxFmdHfzPi7FS+fSJqaK+3Q@mail.gmail.com>
 <b36da61d-fa2d-0ae1-1408-d89710162e56@gmail.com>
In-Reply-To: <b36da61d-fa2d-0ae1-1408-d89710162e56@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 21 Dec 2020 16:58:37 +0100
Message-ID: <CAKXUXMyf+Fs_MAkkFRzT7g0-7y7AKDnvNjng+tkQBp4ZRxFpCQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: ignore files not
	following NETWORKING_BLOCK_COMMENT_STYLE
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

On Mon, Dec 21, 2020 at 4:29 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 21/12/20 10:57 am, Lukas Bulwahn wrote:
> > On Sun, Dec 20, 2020 at 7:33 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently checkpatch.pl gives warning for NETWORKING_BLOCK_COMMENT_STYLE
> >> for files in net/ and drivers/net which do not follow the networking
> >> comment style.
> >> But some of these files seem to follow the generic comment style instead
> >> of networking style and some rather mixed style of comment.
> >>
> >> For e.g., drivers/net/wireless/ralink/rt2x00 largely follows generic
> >> kernel comment style in spite of being inside drivers/net.
> >>
> >> Provide an ignore file(".networking_block_comment_styles.ignore"), where
> >> users can add the files they want to ignore this warning.
> >>
> >
> > I believe that is a really bad design decision here.
> >
> > Imagine that in one directory, the maintainer wants to adjust ten
> > rules for checkpatch.
> >
> > Are we going to implement this logic for those ten rules individually?
>
> No, only the files which are not following the networking comment
> style, and are inside net/ or drivers/net should be added. The files
> which are following the networking style already, need not add
> themselves anywhere.
>
> I feel, normally maintainer will want entire directory to follow the
> same style. So, they can just add their directory in the .ignore file
> and it will be ignored from the warning.
>

I understand that.

> > Is the maintainer going to add
> >
> > None of that is obviously acceptable: 1. because there are better
> > design decisions; 2. because tailoring checkpatch would simply not be
> > worth the cost of having all those individual files laying around in
> > the repository and the complication throughout the whole script.
> >
>
> We have earlier used a similar approach with ".get_maintainer.ignore",
> where the users add their signature to be ignored from being mentioned
> by "get_maintainers.pl" script.
> Link: https://lore.kernel.org/patchwork/patch/939769/

Yeah, I know that. It is known to be called the "Christoph file in the
root directory", because for years, it only contained Christoph as he
was the only person that requested that feature. It is a good example
of a terrible feature.

>
> We just need one file for our purpose (i.e., not necessarily .ignore
> file).
> Here I have used .ignore file in the root directory, so that it is
> easier for the maintainer to edit it and add their directory in it.
>

Do you know how many maintainers in this project exist?
For the kernel, this what you suggest just does not make sense...

> If not in the root directory(as the files look scattered), perhaps we
> can place it in script directory as .ignore or .txt file, or maybe
> just place these directories in the form of a hash in the script
> itself. But perhaps we'll need a list of directories to ignore and
> then we'll be able to form the hash.
>

Which problem are you trying to solve?

> > Also, you already recognized that there is already a feature to ignore
> > or select rules through command-line parameters.
> >
> > So, how about coming up with a proper .checkpatch config file format
> > and then use the already available feature to configure the checkpatch
> > run?
> >
>
> The user can add "--ignore NETWORKING_BLOCK_COMMENT_STYLE" line in
> their .checkpatch.conf file, and checkpatch will then ignore this
> class of warning.
>
> Somewhat similar to this repository here:
> https://github.com/openil/u-boot/blob/master/.checkpatch.conf
>
> But this file(".checkpatch.conf") is ignored by git and is not
> committed (as different users may require different configurations).
> So every user will have to add this line in their individual config files.
>

I do not get what you say. Isn't this just a configuration question?
You configure it to be part of the configuration.

> Also, if the user starts working on a different file, where the
> networking comment style is followed, he will again have to delete
> this configuration line from the config file, to get this warning.
>
> I'm not sure, if we can add directory/file specific configuration in
> .checkpatch.conf. But again, if it was possible, we'll be specifying
> individual files, and telling them to be avoided, similar to the
> current approach.
>

A suitable feature can be implemented.

Think about 100 people modifying the same file at the same time and
the problem this brings during merging.

Think about commits moving directories from one place to the other and
the effort of keeping this file correct.

I would suggest not to have any "checkpatch.config" at the root level
mentioning all the different directories, as you are suggesting.

I suggest instead:

Have multiple ".checkpatch.conf" files in the different directories
and let checkpatch determine the relevant rules that need to be
applied to a specific file by traverse along the file hierarchy.
Generalize the method to work for any checkpatch rule, not just the
block_comment_style rule here.

Feel free to submit your current proposal to Joe Perches and lkml if
you are convinced of your idea and willing to get more feedback
(probably just more rejection). I personally believe this will be
rejected by others as well.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
