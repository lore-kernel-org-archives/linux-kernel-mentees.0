Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1322CC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 17:50:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6250B2067D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 17:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkBS0ebX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6250B2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BE9A120104;
	Mon,  9 Nov 2020 17:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ly475et7S5QG; Mon,  9 Nov 2020 17:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C0757200ED;
	Mon,  9 Nov 2020 17:50:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6820C0889;
	Mon,  9 Nov 2020 17:50:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9D62C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 17:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C650C200ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 17:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpuKXq12ZxR0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 17:50:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by silver.osuosl.org (Postfix) with ESMTPS id B472620034
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 17:50:40 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id l12so6365836ilo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 09:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GFAnB88bwC8qBInjj0+zQrlWyd0sC3PJYwp2Tp8pUF8=;
 b=LkBS0ebXgeFN2WSwUhFAn6zXzsaeZ1nn4swDE1QaOgUJLr+FoG7Nqcb4yU+juvdelC
 qG6sMqnLrlAyRdOVnw+bi/P5w0pjXlPnJ7nw8p0tvkVvjX2Q6yDbOAEZfOmVAC//IxG+
 K7/O1zeaTmfe3NnyHwZd/lhnkkC37hAxrDu0YrJG8cIbnfFfd1Ea5eRqcHe1IJ8DCUXY
 Qrup/YD3BWwbQ0nz1gRZMstGaicjo0OSq3Zas4+R0vAfh3QnGTqBfuZYXtGoFWNkeEOH
 KH5cG7C/FTmtjT7yRwUcYnV+MPGbZ9L+AC1ECmPCUk4GkC6EIt66Z9StZnca5dIdmQmC
 emrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GFAnB88bwC8qBInjj0+zQrlWyd0sC3PJYwp2Tp8pUF8=;
 b=mMaAbGW809bEw7JIoOr/F9BXYIQMsfgD+pNMpF9IpBfnh+zl2xrU89lWAOKSPC/H5A
 VUXPxr+bLov709KzlaVb19idx0nW9q+LIk/2fRU8lhu/T9U1fJuJW6pY9nSVX8LDkvLb
 ItCM2BwScbVHq3BVWR0s3l+i5fZ0rxXXK/F9DmcL/wApgAwJES9EIcuctzkX++4e66Zb
 bMv3+NHvmXop6Q4awyBcrm6bgGU8b+2syAtCwvdSmkWMde3psqlJqzRvl6kKMFVItpeF
 0VbnNPLkEk8DNQK+HDYYqTT8F+MF4UmBjv3ORF+NZ4dUFzLS7VmeAwXGZLrLcRigd1br
 Os1w==
X-Gm-Message-State: AOAM532gIaNOFgARf+y+bpZyseh8wUb5LCS/eoEZdbwBoTOXuY4W9lJ4
 joPDzw8k5uOKwKrxuz2RM3shnp8/qwzlmyI1czQ=
X-Google-Smtp-Source: ABdhPJyly5FxEdic9/di1EFl9FRI0iL87XdLGxZrNQTV8l386bcUPMamc2flY63+oZ95FTOuZgPCiAbKwWPGLHsjBmM=
X-Received: by 2002:a92:512:: with SMTP id q18mr10567348ile.147.1604944239805; 
 Mon, 09 Nov 2020 09:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20201109131040.19266-1-yashsri421@gmail.com>
 <CAKXUXMyVqjG+XvZ+dnB=3NEnGcNOtcYFW2r5cJ3KCEzTE35rXQ@mail.gmail.com>
 <292a3930-9515-2387-40d3-63a14a61250b@gmail.com>
 <CAKXUXMwCT2DcE9iFQXfkaEuDpWW_yG=O2HuW-Vz3ek6Lsx25Lg@mail.gmail.com>
 <b1c10804-5d49-bb17-a228-66644a997961@gmail.com>
In-Reply-To: <b1c10804-5d49-bb17-a228-66644a997961@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 9 Nov 2020 18:50:29 +0100
Message-ID: <CAKXUXMz7gNS+oMYmRpcmj+4Y-d7n_BfZuOuJZhJqOhn_-dHA+g@mail.gmail.com>
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

On Mon, Nov 9, 2020 at 5:35 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 9/11/20 8:15 pm, Lukas Bulwahn wrote:
> > On Mon, Nov 9, 2020 at 3:33 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 9/11/20 7:10 pm, Lukas Bulwahn wrote:
> >>> On Mo., 9. Nov. 2020 at 14:10, Aditya Srivastava <yashsri421@gmail.com>
> >>> wrote:
> >>>
> >>>> Currently checkpatch warns us if there is no 'Signed-off-by' line
> >>>> for the patch.
> >>>>
> >>>> E.g., running checkpatch on commit f68e7927212f ("Revert
> >>>> "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
> >>>> reports this error:
> >>>>
> >>>> ERROR: Missing Signed-off-by: line(s)
> >>>>
> >>>> Provide a fix by adding a Signed-off-by line corresponding to the author
> >>>> of the patch before the start of diff(s)
> >>>>
> >>>
> >>> Can you please provide an evaluation first?
> >>>
> >>> As far as remember, the fix is often not to add a Signed-off-by: tag but it
> >>> requires something completely different.
> >>>
> >>
> >> I have generated the 'git logs' of the commits causing
> >> MISSING_SIGN_OFF at:
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task7/summary_log.txt
> >>
> >> Actually this fix was suggested by Joe at:
> >> https://lore.kernel.org/linux-kernel-mentees/e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com/
> >>
> >
> > Yes I know. Now look at the reports.
> >
> > The rc and release commit tags do not get a Signed-off-by
> > intentionally. Other than that, reverts (for reverts is probably best
> > to explain how to do a revert... so that a sign-off-by is included)
> > and typos.
> >
> >
> > Lukas
> >
>
> Yes, I agree. But for the typos, the user must get BAD_SIGN_OFF
> warning for "Non-standard signature". So user will have to fix that
> manually. If so, this error is already avoided.
>

But then the fix should not be applied if there is a BAD_SIGN_OFF
warning, right?

Typos can also be fixed automatically by a fuzzy match. That is a
different feature, though and a different (next) patch.

> For the release commits, I think the user(s) may not use checkpatch
>

Agree. You can filter those out of your evaluation.

> For the rest (ie reverts) with no sign-offs, I think that if we just
> add the sign off line, it serves our purpose.
> Of course if we explain them to revert with sign-off, it will be
> probably the same outcome.
>

Then do both. Provide a fix in checkpatch.pl and provide documentation.

So, how many are because of reverts and how many are because of typos?

Also, how many reverts do currently include a proper sign-off?

When the majority does not include a proper sign-off on revert commit,
maybe the convention is to not have a sign-off on reverts.
When we have some data on that, we can discuss this with some central
maintainers in the kernel community.

If that is the case, then the fix is to change checkpatch.pl not to
complain on revert commits because of a missing sign-off.

> Thus, I feel that we can proceed with this fix for this class of error.
> What do you think/suggest?
>

Please continue on the steps above.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
