Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3E8C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 07:39:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE039207C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 07:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYR4fKNO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE039207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E5648708A;
	Mon,  7 Sep 2020 07:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l69v6g0eI760; Mon,  7 Sep 2020 07:39:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49BAF87059;
	Mon,  7 Sep 2020 07:39:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C367C0052;
	Mon,  7 Sep 2020 07:39:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA1B1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B5EEF204B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bY0Ng19UKnxt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:39:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by silver.osuosl.org (Postfix) with ESMTPS id C441320442
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:39:11 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t16so11649339ilf.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Sep 2020 00:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jb0yGKUvp9XNThh0IC9o/7IKGdk+2XCPVnkltVJxloU=;
 b=MYR4fKNOgttWaatn6FQmwi9CR7WGtXbKXKHZXpSnPd5xkLvimkV6N4G0NFWKWI515q
 qlDng9QYN3FcTrergNBh4IFjwFDCymH7Ro7QUfoRsnjZMFi7dd6utFRA1TQsphK7jtAr
 jvY1OqKoCFya4n0xioOVp+mbq7yePZmpD1VD/9qUKh628f9hNgtqv18Uw9346zs8e9s7
 bwlwsxcrjmCWPYRXL2lPTRRIcTCxsJa1qQpc0LwVYEpd4Io+NupVbqR9ee6zahSo088h
 g+mi0Eg8yMFhTrctL56W11DWSb38WYW2iaigW8/CCXfqFX+3cBVLunjy9D6G0wLG1vNQ
 5dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jb0yGKUvp9XNThh0IC9o/7IKGdk+2XCPVnkltVJxloU=;
 b=mBNKXjBBX/PYg+w9W7yCnbrEz4gAUgM6xCu4lih1g3sEQwyEUALygaUNbheE23Ewlr
 AClO/xKEuCWMnntJkZ9IXFUP494tcuC+xzTO3LLzA4erUQVMbHlwBMx002jLnujONP5w
 skyCerq+q/zr8q1VvxTLevFMU3ApK9Q0HCOskJG+qKRLBylF//PsF6XyTNLfj9+tlDWv
 UphnKAtMXjxHv2ccnu7IUVz2qsXWJqV8YMf0WfZIeGRYR9MdYjr172eKOOno+VD/8Lgh
 J2VYvWPSrL3zBVGIVeNE3BJ327cj7SrVWsCdfjtnGpKKCZhcxoxtLU2yzPr2eriyyJly
 fI+Q==
X-Gm-Message-State: AOAM532Zy1js5/wVhgJZ61gR3doYVxvW8iIJ9d3yan508xCUZnZeQqe6
 f+NT+sSV3+DEeb9cvpEV8P1hdX2W61ZcPkQNKQE=
X-Google-Smtp-Source: ABdhPJz2K48A+4boOeSkYzmMLTCTOb4DYLFY5ZoT+DwMqQw/EN7EpBXMFP9wIuxsSdIjNDT2TC647IzE7wNsHNkyRWk=
X-Received: by 2002:a92:c7a8:: with SMTP id f8mr17498916ilk.24.1599464350970; 
 Mon, 07 Sep 2020 00:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2008270707440.9436@felia>
 <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
 <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
 <alpine.DEB.2.21.2008310702520.8556@felia>
 <a6f436fe39f48d9b7e537bdfad07fc7e@disroot.org>
In-Reply-To: <a6f436fe39f48d9b7e537bdfad07fc7e@disroot.org>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 7 Sep 2020 09:38:59 +0200
Message-ID: <CAKXUXMz8MphA5PYtLe_mB+3qNV-PSimmSVS2+P5vpv=4+VsBFw@mail.gmail.com>
To: Ayush <ayush@disroot.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Regarding "Linux Kernel: Evaluate and
	Improve checkpatch.pl"
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

On Sun, Sep 6, 2020 at 11:59 AM Ayush <ayush@disroot.org> wrote:
>
> August 31, 2020 10:44 AM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
>
> > On Sun, 30 Aug 2020, Ayush wrote:
> >
> >> August 27, 2020 10:59 AM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
> >>
> >> On Mon, 24 Aug 2020, Ayush wrote:
> >>
> >> August 22, 2020 1:36 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
> >>
> >> On Fri, 21 Aug 2020, Ayush wrote:
> >>
> >> Hints to the first task:
> >>
> >> Can you create a list of all non-merge commits that were added in the
> >> version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
> >> and not already in v5.7?
> >>
> >> Can you share the script/command you executed and the resulting list on
> >> github?
> >>
> >> Can you run your script on all commits of this list above and record
> >> all checkpatch.pl reports, and store them in your github repository?
> >>
> >> Can you suggest ideas how to aggregate the findings and create a
> >> statistics? For example: Which type of error is reported most?
> >> Can you implement that idea?
> >>
> >> I also suggest to have a look at
> >> the options ./scripts/checkpatch.pl --list-types and
> >> ./scripts/checkpatch.pl --show-types. The option --show-types changes
> >> the output of checkpatch.pl to list type identifiers, so it is easier
> >> to parse and aggregate the output.
> >>
> >> Please also share the script you create for that purpose on your
> >> github repository.
> >>
> >> The second task is to pick one warning that appears often and improve
> >> checkpatch.pl to handle that better and get it accepted by the kernel
> >> community.
> >>
> >> Hints to the second task follow when the first task is solved.
> >>
> >> If you fail on any of those tasks, you are out of the selection process.
> >>
> >> Lukas
> >>
> >> Sir,
> >>
> >> I have attempted the task 1 and pushed the same to GitHub.
> >>
> >> Please have a look and suggest improvements.
> >>
> >> https://github.com/eldraco19/evalute_improve_checkpatch_pl
> >>
> >> Please let me know if there are any issues with this.
> >>
> >> So far, so good.
> >>
> >> Here are the questions we want to answer:
> >>
> >> - So what are the 20 categories that occur most?
> >>
> >> You are getting close to that answer, but you are not there yet.
> >>
> >> Then look at the findings. For those 20 categories, are there specific
> >> findings that are multiple times false positives?
> >>
> >> So, the script complains about something, but it does not get that the
> >> patch author wrote something completely unrelated to the error message.
> >>
> >> Lukas
> >>
> >> Sir,
> >>
> >> I tried the given tasks and it can be found here,
> >>
> >> https://github.com/eldraco19/evalute_improve_checkpatch_pl/blob/master/STATS.md
> >>
> >> The solution is implemented a bit complicated, but well, at least, it
> >> works if I believe your report. (I only read the code, but did not run
> >> it.)
> >>
> >> The goal now is to find a class of false positives and improve
> >> checkpatch.pl accordingly.
> >>
> >> I suggest that you look at the specific DIFF_IN_COMMIT_MSG reported
> >> errors?
> >>
> >> Provide a short assessment for each DIFF_IN_COMMIT_MSG error in the
> >> 10 commits.
> >>
> >> It should tell:
> >> - what lines in the commit message did checkpatch.pl complain about?
> >> - what is the pattern in the commit message?
> >> - does patch(1) really stumble over that pattern?
> >> - how would this pattern need to be provided to patch(1) so that it
> >> would stumble over it?
> >> - if no, why not?
> >> - can we change checkpatch.pl to not raise an error for such a
> >> situation? So, only raise an error when the pattern would really make
> >> patch stumble on it?
> >>
> >> Depending on the evaluation, we might continue to improve checkpatch.pl
> >> for reporting this error type, or we decide to look at GIT_COMMIT_ID
> >> errors, where I can quickly spot some false positives.
> >>
> >> Best regards,
> >>
> >> Lukas
> >>
> >> Sir,
> >>
> >> I analysed the given error type and my analysis can be found here:
> >>
> >> https://github.com/eldraco19/evalute_improve_checkpatch_pl/blob/master/DIFF_IN_COMMIT_MSG.md
> >
> > Evaluation looks sound. Although, I cannot really see the analysis of all
> > 10 commits. You say the 10 commits fall into two classes, but how can
> > anyone else judge this from your report?
> >
> > I also do not fully understand your conclusion; to me, it seems to
> > contradict itself. Fortunately, I think your analysis suggests that there
> > is not a clear improvement to checkpatch.pl, as far as I see.
> >
> > So, I do not think that this is a good starting point for a change of
> > checkpatch.pl.
> >
> > I suggest that you look at the error type GIT_COMMIT_ID. I have found some
> > cases that seem to be suitable for improvement of the checkpatch.pl
> > script.
> >
> > Lukas
>
> Sir,
>
> I have been looking for more improvements in checkpatch.pl, especially with GIT_COMMIT_ID.
>
> I found that commits which mentioned "revert commits" in their description will get error
> even if they follow the proper syntax.
>
> for example: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200903&id=e8a170ff9a3576730e43c0dbdd27b7cd3dc56848
>
> In this example,
> commit description has,
>
> commit 193392ed9f69 ("Revert "drm/amd/display: add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")
>
> which is correct as per the syntax, but checkpatch still gives an error.
>
> So, I tried to fix this by:
>
> ---
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 149518d2a6a7..01df2b9b2236 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2874,6 +2874,9 @@ sub process {
>                                 $rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
>                                 $orig_desc .= " " . $1;
>                                 $hasparens = 1;
> +                       } elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("(Revert "[^"]+[^"]")"\)/i) {
> +                               $orig_desc = $1;
> +                               $hasparens = 1;
>                         }
>
>                         ($id, $description) = git_commit_info($orig_commit,
> ---
> (on linux next-20200903)
>

First, your email client is broken. Just to let you know. My client is
broken, too :) I did not bother now to pull out my working email
client...

Generally, you identified the right place to add this extended check
and the check makes sense.

> This patch fixes the issues with commits of the similar type given in the above example but some cases like
>
> - commit 1234567890ab ("Revert
> "foo bar"")
>
> - commit 1234567890ab ("Revert "foo
> bar"")
>
> - commit 1234567890ab
> ("Revert "foo bar"")
>
>
> basically the cases where next-line comes are not handled. But there can a lot of different patterns where next-line is coming, so do we add a separate if condition for all the patterns? or we just continue giving
> an error in case of next-line?
>

I think you should extend this whole check to work properly with line
breaks. You can see how this is implemented currently in checkpatch.pl
just a few lines above, right?

Can you provide a full list of checkpatch.pl findings in v5.4..v5.8
where all the different commit 1234567890ab ("Revert "..."") variants
in the commit message appear?

Then, we can use those commits directly as test cases for your extension?

Best regards,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
