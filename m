Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02100C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 07:11:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CDC8206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 07:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWVUiITJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CDC8206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49AE88604A;
	Tue, 10 Nov 2020 07:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whoSLe_ki3VB; Tue, 10 Nov 2020 07:11:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA96385F4D;
	Tue, 10 Nov 2020 07:11:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EC67C0889;
	Tue, 10 Nov 2020 07:11:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED202C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DF3242042B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVulm7RP2x8H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:11:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 66FC620418
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:11:37 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p7so12750917ioo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 23:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MBsLWymdMTkKNPlWnJnwu5LgZpba2u/Bctmw5fevGxU=;
 b=KWVUiITJ1Aa/J+L9okCz1Fh9t8oKiRMkPFSOv8TGW5JhXyhi8B3qEbp8ZzTeMKFzkW
 LLtdKy0o0lleLxB1X3c4V3yghGs/IKs24qwvUmHoxchNWgAa8abNkyi8AvB2sUicm9la
 SoT2xbv/woxTngt3pdR/i1asxQfcxtuTiBcMzP1FCYgcAZfFZa9Pp/fIlK7JYHDIaGmJ
 jpU5j/o6u3LpjUT5+av8lBZ/1CA8oU0xjUtzKIFVzD2Um/4l61VF6GFqQO9f9Rpz+Mce
 3BGRxBjEZ43Gi8IFc1ItyVt0Zu4XjeNLB2TaTlbuRN5FdGqo04W4PsgeDfozW0TE2trE
 8gEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MBsLWymdMTkKNPlWnJnwu5LgZpba2u/Bctmw5fevGxU=;
 b=i3d0Dg1ui78+ORMgrjSALGI3FsA8sjk8Mmw4/trDyObmYUC6zCVBcFqE/p1hKYwFIE
 2udQjuHs1ztdsIf6mPcH51HJZkCMCnneD48i9mNxlGbcs8QEqmtBJLSSKPpGwi7Dyc0M
 uK9+/5iwvKMA0m3f66/qFsYxFJE1BPm4xqZvuFWTODj8XZmEJFXlzfhAdp0QOl9rsVjJ
 10oaV9I/o2bEuyTL7msc5rAxgZB1WJdU17jW+Ek6SOIt7GrfTderwMgzC02XlyDhjfaD
 458xb1ibYjh9lLh1HrHgOBrwicef4ua6b6+ioKUSe3jMu0porpIke791vAI41mXs956B
 V/ew==
X-Gm-Message-State: AOAM531rnrmvZ5qYolmIy9yijdalkqpx8Hqi0MrPfvWcc91TD56t3nyj
 UHQbMFNw7rqIq4+Vb8nMjuLLYd8bDXe4N3DsHU4=
X-Google-Smtp-Source: ABdhPJzo0AQeUYeCOUV5sp5MbFo8k9vDy2s/alsEKoC0TNln/Y2CYaaa2VIctzAXPgabfIuQXbjqZ+1H1Z88/mhzKQY=
X-Received: by 2002:a5d:970e:: with SMTP id h14mr12778873iol.183.1604992296617; 
 Mon, 09 Nov 2020 23:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20201109131040.19266-1-yashsri421@gmail.com>
 <CAKXUXMyVqjG+XvZ+dnB=3NEnGcNOtcYFW2r5cJ3KCEzTE35rXQ@mail.gmail.com>
 <292a3930-9515-2387-40d3-63a14a61250b@gmail.com>
 <CAKXUXMwCT2DcE9iFQXfkaEuDpWW_yG=O2HuW-Vz3ek6Lsx25Lg@mail.gmail.com>
 <b1c10804-5d49-bb17-a228-66644a997961@gmail.com>
 <CAKXUXMz7gNS+oMYmRpcmj+4Y-d7n_BfZuOuJZhJqOhn_-dHA+g@mail.gmail.com>
 <f7ff3cbf-8573-5d4b-3546-76fc5484eed0@gmail.com>
In-Reply-To: <f7ff3cbf-8573-5d4b-3546-76fc5484eed0@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 08:11:26 +0100
Message-ID: <CAKXUXMwpvGsZBB+7UF1XFiB6KaTys-ALNw-cNNscTxqD-QgEFw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

On Tue, Nov 10, 2020 at 7:43 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 9/11/20 11:20 pm, Lukas Bulwahn wrote:
> > On Mon, Nov 9, 2020 at 5:35 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 9/11/20 8:15 pm, Lukas Bulwahn wrote:
> >>> On Mon, Nov 9, 2020 at 3:33 PM Aditya <yashsri421@gmail.com> wrote:
> >>>>
> >>>> On 9/11/20 7:10 pm, Lukas Bulwahn wrote:
> >>>>> On Mo., 9. Nov. 2020 at 14:10, Aditya Srivastava <yashsri421@gmail.com>
> >>>>> wrote:
> >>>>>
> >>>>>> Currently checkpatch warns us if there is no 'Signed-off-by' line
> >>>>>> for the patch.
> >>>>>>
> >>>>>> E.g., running checkpatch on commit f68e7927212f ("Revert
> >>>>>> "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
> >>>>>> reports this error:
> >>>>>>
> >>>>>> ERROR: Missing Signed-off-by: line(s)
> >>>>>>
> >>>>>> Provide a fix by adding a Signed-off-by line corresponding to the author
> >>>>>> of the patch before the start of diff(s)
> >>>>>>
> >>>>>
> >>>>> Can you please provide an evaluation first?
> >>>>>
> >>>>> As far as remember, the fix is often not to add a Signed-off-by: tag but it
> >>>>> requires something completely different.
> >>>>>
> >>>>
> >>>> I have generated the 'git logs' of the commits causing
> >>>> MISSING_SIGN_OFF at:
> >>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task7/summary_log.txt
> >>>>
> >>>> Actually this fix was suggested by Joe at:
> >>>> https://lore.kernel.org/linux-kernel-mentees/e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com/
> >>>>
> >>>
> >>> Yes I know. Now look at the reports.
> >>>
> >>> The rc and release commit tags do not get a Signed-off-by
> >>> intentionally. Other than that, reverts (for reverts is probably best
> >>> to explain how to do a revert... so that a sign-off-by is included)
> >>> and typos.
> >>>
> >>>
> >>> Lukas
> >>>
> >>
> >> Yes, I agree. But for the typos, the user must get BAD_SIGN_OFF
> >> warning for "Non-standard signature". So user will have to fix that
> >> manually. If so, this error is already avoided.
> >>
> >
> > But then the fix should not be applied if there is a BAD_SIGN_OFF
> > warning, right?
> >
> > Typos can also be fixed automatically by a fuzzy match. That is a
> > different feature, though and a different (next) patch.
> >
> Okay.
>
> >> For the release commits, I think the user(s) may not use checkpatch
> >>
> >
> > Agree. You can filter those out of your evaluation.
> >
> >> For the rest (ie reverts) with no sign-offs, I think that if we just
> >> add the sign off line, it serves our purpose.
> >> Of course if we explain them to revert with sign-off, it will be
> >> probably the same outcome.
> >>
> >
> > Then do both. Provide a fix in checkpatch.pl and provide documentation.
> >
> Okay.
>
> > So, how many are because of reverts and how many are because of typos?
> >
>
> Reverts: 4,
> Typos: 5
> True positives: 2 (3c0edea9b29f9be6, 9ac060a708e05423)
>

So for Reverts and the true positives, your suggested fix works.

For the typos cases, your suggested fix does not work.

You can add this fix but maybe you can also work on how to fix the typo case.
You might consider that the fix is not suggested when there is still
an BAD_SIGNOFF warning (because then it is probably a typo).

I think for the typos in tags, it will emit the BAD_SIGNOFF warning.
You can add a fix option to correct the string by some fuzzy match and
then correct the Signed-off-by: tag.

> > Also, how many reverts do currently include a proper sign-off?
> >> When the majority does not include a proper sign-off on revert commit,
> > maybe the convention is to not have a sign-off on reverts.
> > When we have some data on that, we can discuss this with some central
> > maintainers in the kernel community.
> >
> > If that is the case, then the fix is to change checkpatch.pl not to
> > complain on revert commits because of a missing sign-off.
> >
> So, there are 993 commits which are reverts. Out of these only 4 are
> there which have missing sign offs.(over 4.13..5.8)
>
> I have a doubt, How can I provide documentation? Couldn't find any doc
> file for checkpatch
>

Add an additional hint can be added here:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

E.g., that also reverts should include a Signed-off-by: and that git
revert <some option> does that for you.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
