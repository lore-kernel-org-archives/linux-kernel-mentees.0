Return-Path: <SRS0=qh4O=FP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE39C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Dec 2020 06:17:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D801E23ECF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Dec 2020 06:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D801E23ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B3B886F84;
	Fri, 11 Dec 2020 06:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fnrb6Is+AKZY; Fri, 11 Dec 2020 06:17:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A12BE86F80;
	Fri, 11 Dec 2020 06:17:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85371C0FA7;
	Fri, 11 Dec 2020 06:17:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 936DBC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8630C87250
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q65HqnXFRA2c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:17:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 514B787247
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 06:17:35 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id q1so7749965ilt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 22:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZN8tnHSaaq1SjZGzUT6cMC7KXIi0oxJ1IYRRHYLIbXo=;
 b=AKJLafSBtvGAb+r0hlF1D0K5cGe/KCZXBTlrbzu7EgweAfC+mbK8wBa4J+m+XT3McW
 llAoXgeiPyhuONml5pT8l62orb/Uoviargfvd8pRYVc5lh8to/CSmvuCIUCpweJfLH4n
 UiM/oEGnwTXszSTkPICcrX66/0RryA73SDvzpOvbCiIMa2gYBrNzDOfH6ux9ha4ZKo3f
 XqMndyzjUpm5TgUemilQ0zzeNr6j4q+ddkHujRDuvHs5IghjfV7wKq+HbcJsHS3tFQmP
 oE4s+NjuKLeaHghocpt61pwSXzr9Hs9/wiOrjn/1XNJ20mSiaUWYfaMg3BNhHkTZS4NB
 LNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZN8tnHSaaq1SjZGzUT6cMC7KXIi0oxJ1IYRRHYLIbXo=;
 b=faNr811Xf6n1ENAY/Lj+eb/JnA7WhRG8/E+AscajEZFtGsxNdJn3RFQ9xlmkC4kHkb
 MzLp10bHXYKBY8khaI0yBgEnHy23W3x4PFH/Pm/VIA4puL7Jp9WEjv6G4PE0eA2Wz8Yq
 cX7ioIEzyWS9elzAFkeiZ9Sij/VtFDroozN1E5siBpf+GOSrFqHWjR2/GfYDnzeY3qmv
 4RF6dZMNXWhJ615IAdlWGAkAUY5DGCnSDnk7TncIqXpW+E5Oiy8OecIHPU4oMkUwK0k0
 3zvUvjcaN+jpzAmFL66kTYxi5Bej8QgyBBNr36IRjKk0IFK1ZEVcwsJQ/Mbn4qxuPGEb
 CHpA==
X-Gm-Message-State: AOAM533E6YPqdl22tBLdoL6yqYIS14JZ7Tc6T9VTh/zsTW8KeJurE7Eu
 6NzyJfTNMBQtoL1B3iCJTVCtUqgOKzKlnohM3DY=
X-Google-Smtp-Source: ABdhPJz0/vSHWh6StTsUgiapwcqlW5ZwJqZnnv5BypKzOBAm7/TdejuHFocVY3asK1eJygPE4MX6PBiS3ZToaqsJkyk=
X-Received: by 2002:a92:8587:: with SMTP id
 f129mr13771781ilh.251.1607667454528; 
 Thu, 10 Dec 2020 22:17:34 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
 <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
In-Reply-To: <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 11 Dec 2020 07:17:23 +0100
Message-ID: <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
	test-branch and run clang-format
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

On Sun, Dec 6, 2020 at 11:49 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 5/12/20 9:24 pm, Dwaipayan Ray wrote:
> > Hey Aditya,
> >
> >> - The check with: "(! -e $git_clang_format_file)" doesn't work
> >> correctly for me. Although the command runs properly, after I comment
> >> out this if-section. Probably if we just check for a certain version
> >> of git which added "git clang-format" for the first time, in users
> >> system, it might do the trick.
> >>
> >
> > True, we need to track that version and terminate the script. Although I
> > am curious why it didn't work in your case. Is that file non existent on your
> > system?
> >
> >> - Also "git branch --show-current" is compatible only with Git 2.22 or
> >> above (For eg, mine is 2.17.1). Maybe replace it with "git rev-parse
> >> --abbrev-ref HEAD"?
> >
> > Yes, that version compatibility might be a problem.
> > The other option is nice, but again it causes a certain conflict when the
> > HEAD itself is detached.
> >
> > In a detached HEAD state, "git rev-parse --abbrev-ref HEAD" just returns
> > "HEAD".
> >
> >> diff --git a/block/sed-opal.c b/block/sed-opal.c
> >> index daafadbb88ca..f7929eb67f37 100644
> >> --- a/block/sed-opal.c
> >> +++ b/block/sed-opal.c
> >> @@ -2322,7 +2322,7 @@ static int opal_add_user_to_lr(struct opal_dev *dev,
> >>         mutex_lock(&dev->dev_lock);
> >>         setup_opal_dev(dev);
> >>         ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
> >> -       mutex_unlock(&dev->dev_lock);
> >> +mutex_unlock(&dev->dev_lock);
> >>
> >>         return ret;
> >>  }
> >> --
> >> 2.17.1
> >>
> >>
> >> Now this patch gets applied to a new "test-xyz" branch, but it is not
> >> formatted, ie the added line remains un-indented. Is this expected
> >> behaviour from the script?
> >>
> >
> > Currently it should only output the diff. The --clang-format flag is to be used
> > though. Maybe the diff could be written into a clang-format-fixes.patch file and
> > apply it later on.
> > That way the user has more control over what gets changed.
> >
> Hi Dwaipayan,
> I have modified your script with clang-format-diff here:
> https://gist.github.com/AdityaSrivast/0fc57fbd49db8c05c7b1154d4289174a
>
> As we wanted, it generates a modified patch which is clang formatted,
> with suffix ".clang-format.EXPERIMENTAL". It also modifies the files
> with clang-format in test-branch, which was desired with our
> "--clang-format" flag to this script.
>
> I think the code probably will need to be refactored once we are sure
> that we are on the right track and the script does the desired job.
>
> Lukas, what do you think?
>

Aditya, Dwaipayan, can you set up a git repository that you use
together to work on this script?

And provide a short description of how to use the script with an
example in that repository?

Then, I am happy to try it out... and provide you more feedback.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
