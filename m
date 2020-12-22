Return-Path: <SRS0=wyXY=F2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0475C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Dec 2020 10:34:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B5122573
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Dec 2020 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B5122573
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9912A27261;
	Tue, 22 Dec 2020 10:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LeGW1I3UC1p; Tue, 22 Dec 2020 10:34:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E665B23492;
	Tue, 22 Dec 2020 10:34:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2306C1825;
	Tue, 22 Dec 2020 10:34:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C8B6C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 10:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4059887286
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmAyCzgd5WV5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 10:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68C1287215
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 10:34:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id h205so30813499lfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iev//84tLTY5pNf5qPS4r1c2ahiTZWGZvD0hydMToR0=;
 b=pAUgwEORlLYSyIqSur26pkPToLN+H8apog9SWQK3/FiwpQoyMMRxF37qmzI8fqqJrl
 Dp9gpWKbi1ZWQKy0S868pKdKfByT5ZzRq6v7KLCVHxel1cS6O3ArcuLVR9cMqIr4Qfne
 P8S/Ru1DXkbSQorofbSJdwEa+mGhroRrRzCGLhYrHsTHsnW86EK3S/Q3B7r7UotcBgQZ
 q7mRp8xcSESO9J2zWP28sOVlAIPkACIgfql99PyV5JWxjNyPd5Pr4N/dpl+CzBugMyju
 S2RfIag8DAhwHjx+L14bMLjsvPEV1QWVHQOu5NCpUcCz+G5d9oiZCvRdC/nKtpn7CVkd
 QK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iev//84tLTY5pNf5qPS4r1c2ahiTZWGZvD0hydMToR0=;
 b=SAcs68j28/jlNoZi4kgzL3RsEQOIZVafYmyC1gNY2iIaodbdZTVFHtWkRlXUqKRq1J
 I0yAQwTeBgoWIXiw9JO1+uCoDqOJhBbfyWNu3QUsxsFdzCfZSRiXmaf28wWQUUrxV2Fa
 CLRzqr8EfIaQi4zlMsEJ9GzNkJdkgBwbWay61Jge67gKwTIp2o2REnqdgK3/QWvY9iIt
 nGKKudMG6djcqRmFjFpnngykOai/44n3ObshtKxLu9lWvgaGVTYzTFfmqm3xDRZzRLI3
 OQuRdArBfQkxwzfT5gRFM0wlRyojDqAE26YHlHzq69/+/xBUJtfLkk5XAoMBlylmtxYh
 izbQ==
X-Gm-Message-State: AOAM533vb9oDjjfl6G3xl2zfUJATSldIAkKTLktPVXVOBYxljhGxxFO4
 OjooeQ9DidKylrkmLm9muA4OmEKDtzwvvAWLF20=
X-Google-Smtp-Source: ABdhPJy00cAVuMqIiuaBFMaS5PzziFJ2PgnEj6RkQSlY1791h4KqCQGjA3jzj9Ht+2r4tRvG/A9BsZW7DaNgzE+PFJo=
X-Received: by 2002:a19:4196:: with SMTP id o144mr9151645lfa.342.1608633275367; 
 Tue, 22 Dec 2020 02:34:35 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
 <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
 <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
 <CABJPP5AOwoshncvbdooy1df4++5NKY-fUMVQUm8yze-w+6-Gmg@mail.gmail.com>
 <CAKXUXMz4fBJ8a_vpYow14yiKoKhC_=bQHHd4WXfOcsxJxqbdcw@mail.gmail.com>
 <660a4bb0-1ba4-acd4-e8bc-a53cccfbf10a@gmail.com>
 <CAKXUXMy7XbmWmj5HOrAJ-fYAdZmK0kd9NnP_i4cpOaS7eqCnrw@mail.gmail.com>
 <CABJPP5At6mYOCDyQWLf72guKaWV1xJxyYPELk+_4WQ8E+f9jfg@mail.gmail.com>
 <fea0e147-4016-b039-f8d0-0ab88ef60484@gmail.com>
In-Reply-To: <fea0e147-4016-b039-f8d0-0ab88ef60484@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 22 Dec 2020 16:04:14 +0530
Message-ID: <CABJPP5BbNdHibThixX0H4m_CF-RWpSwesZ2QpK+it_h7Xe9XfA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Dec 22, 2020 at 3:55 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 22/12/20 1:17 am, Dwaipayan Ray wrote:
> >> Okay, I downloaded and tried it:
> >>
> >> perl ./scripts/applypatch.pl --clang-format test.patch
> >> --branch=test-clang-format-bfq-cgroup
> >>
> >> but it failed:
> >>
> >> git checkout test-clang-format-bfq-cgroup
> >> Already on 'test-clang-format-bfq-cgroup'
> >> git am $patchtest.patch
> >> fatal: could not open '.patch' for reading: No such file or directory
> >> Clang formatted patchfile generated at:
> >> test.patch.EXPERIMENTAL-clang_format-fixes
> >> git checkout test-clang-format-bfq-cgroup
> >> Already on 'test-clang-format-bfq-cgroup'
> >>
> >> How about setting up a minimal travis.ci check that runs this command
> >> on a small git repository with one file and one patch on top for
> >> testing purposes?
> >>
> >> The script does not have error handling yet, so the next steps are
> >> just executed blindly even if the one before failed and is really
> >> required for the next one to do the right thing.
> >>
> >> I generally like the script, let us work a bit on tuning it for proper
> >> error handling, add some basic tests and then discuss it with Miguel.
> >>
> >> Lukas
> >>
> >
> > Hello Lukas,
> > Sorry for being late on this update. I have my college exams going on
> > right now, so that caused a bit of delay.
> >
> > Nevertheless I have applied some changes along with some error handling fixes.
> > The script is available here:
> > https://github.com/raydwaipayan/apply-patch
> >
> > The script has the following options now:
> > usage: $P [options] patchfile(s)
> > Options:
> > --branch=<branch-name> => test branch name
> > --format => Use clang format
> > --clang-format-diff=<s> => clang-format-diff path
> > --help => show this help information
> > --root=<root_dir> => root dir location
> >
> > By default script searches for "clang-format-diff.py" in path. If it goes
> > by any other name that should be supplied using
> > --clang-format-diff="FULL_PATH_OF_EXECUTABLE"
> >
> > I ran the script like this:
> > $ ./scripts/applypatch.pl
> > 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch --format
> >
> > Expected output:
> > git checkout -b test-master
> > Switched to a new branch 'test-master'
> > git am 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
> > Patch applied successfully:
> > 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
> > Running clang-format
> > Diff written to clang-format-fixes.diff
> > git checkout master
> > Switched to branch 'master
> >
> > Lukas, could you check if this script works on your system as expected?
> >
> > Also Aditya, I think the latest clang-format-diff goes by the name
> > 'clang-format-diff-8' on debian based systems. While in my arch based one
> > it goes by 'clang-format-diff.py'. Can you verify whether the script works
> > directly or is the executable path flag needed?
> >
>
> For debian based system, the user will have to add
> --clang-format-diff="/usr/bin/clang-format-diff-8".
>
I think that is currently an extra step for the user. Maybe we can
target most used flavours and fill the binary location automatically.

> A few more improvements can be made. For eg., the script should exit
> if the patch isn't applying. Currently, it continues a step further
> and stops after giving error: "Error: This script requires
> clang-format-diff to be installed.".
> Also, this puts the git status in mid of git am, which needs to be reset.
>
Yeah maybe instead of die we can just return by saying "clang-format won't
apply".

> Maybe we can improve the error message by displaying them about
> "--clang-format-diff" option and giving install options in the error
> message. This should make the script easier to be used.
>

In that case we may have to give instructions for all the available
distributions. Maybe we can point them to the LLVM page?

> One more improvement I guess we can make with the .diff file, by
> renaming .diff after patchfile name. This way it won't be overwritten
> each time and also be in consistency with checkpatch.pl --fix.
>

About this I was thinking we should avoid creating individual diffs.
Since in the future the script may apply a patch series too, we can
just generate a single diff and name accordingly. That way in a single
step the committer can apply all fixes.

> I'll try to make these improvements and send a PR or a patch to you,
> where we can discuss any changes.
>
Thanks Aditya, please do.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
