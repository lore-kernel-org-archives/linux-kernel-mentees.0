Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61581C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 14:45:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5ED32083B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 14:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTWcb78A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5ED32083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 64CD08708B;
	Mon,  9 Nov 2020 14:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pd0oj2LewKCi; Mon,  9 Nov 2020 14:45:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DACF9870C8;
	Mon,  9 Nov 2020 14:45:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1602C088B;
	Mon,  9 Nov 2020 14:45:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC274C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 14:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C36F785F6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 14:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sOBvVDP5G-fD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 14:45:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1548485F5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 14:45:39 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id x20so8494018ilj.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 06:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0uggRtPvIu6nxIbU7N6NSmFp2Sed6JN7FHuCQ66G3TY=;
 b=jTWcb78ADRyhwluSn7I/vZr8mPrCC3mjzEVHcCgtgjBx074ZynYGBRTWBzwYtK7VS0
 nrFYrIOapPsV6m/RC5KdTPWJVBEpZ+LOvD4n7U0W3fi2D3gu34o7vvRxYSFVfa9zG396
 L8nfj/fTR6oOyR90x+fHu4KPspQAvnjo8HZHFZ5FFiOQB4YyrO/BwvmCllmjREMVVfAo
 ei03hLmSsV0gvbgvIlZiY2Pq2xnBfNacCmbtoIRRE4mpDsgpsvBEYZzllajAUHslmpei
 52vpnFGrs9oAl66pU7oebHx60hjrrLtRhAFpevHGY4Sv0/gjOqqanoG9ENApUsUmAh1R
 HvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0uggRtPvIu6nxIbU7N6NSmFp2Sed6JN7FHuCQ66G3TY=;
 b=F+EaBDeoPzRd7hUAyyNqAmOt2dU9jSq1P5AdXRSEE/H/LjoJrToQSJCCZi4cj4ZjUP
 H1pPl//pwgj131inGHIZ/yKzoXYGtIIJi42MObQJofZoP1BuI3c/u+brDqAZQk63hkaV
 zfXXB5B33VjqXdVjZjllvB00W/ABlvJL1+/sgDOeGKnoboeKlHjmrKgfoxH+0Y5EnCBG
 B7DL4DVV5xj/BggKG4Hg6TnDGtnPyewp/NL8KJWGRyFwz1CzDG1oeWoC3PUpCDXLmDli
 CrxGh+ZsbFvi0Wfzv1sBb4LHvzG91k0IO0Ut1g6+xkhzb3NHcd7n8xK1KRZSUpuZZrWr
 Drkw==
X-Gm-Message-State: AOAM532OkGg2lwesV4oTCrox3O+MA7dQdeioO9TKij1FOO7Ypv+lWXhz
 LbWpBpIxr89OK4fJPSak3C1b04RUOLOY9N0mGLPHslbLDHQ=
X-Google-Smtp-Source: ABdhPJwOpzQ/PHqfW09KfQDw3VXNP55ELc8GUFHseyaxo9HWtIXUr1R322HrAO0tuVIatL8bp2J6lCav9j1Mcr8byiU=
X-Received: by 2002:a92:600e:: with SMTP id u14mr9671448ilb.221.1604933138303; 
 Mon, 09 Nov 2020 06:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20201109131040.19266-1-yashsri421@gmail.com>
 <CAKXUXMyVqjG+XvZ+dnB=3NEnGcNOtcYFW2r5cJ3KCEzTE35rXQ@mail.gmail.com>
 <292a3930-9515-2387-40d3-63a14a61250b@gmail.com>
In-Reply-To: <292a3930-9515-2387-40d3-63a14a61250b@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 9 Nov 2020 15:45:27 +0100
Message-ID: <CAKXUXMwCT2DcE9iFQXfkaEuDpWW_yG=O2HuW-Vz3ek6Lsx25Lg@mail.gmail.com>
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

On Mon, Nov 9, 2020 at 3:33 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 9/11/20 7:10 pm, Lukas Bulwahn wrote:
> > On Mo., 9. Nov. 2020 at 14:10, Aditya Srivastava <yashsri421@gmail.com>
> > wrote:
> >
> >> Currently checkpatch warns us if there is no 'Signed-off-by' line
> >> for the patch.
> >>
> >> E.g., running checkpatch on commit f68e7927212f ("Revert
> >> "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
> >> reports this error:
> >>
> >> ERROR: Missing Signed-off-by: line(s)
> >>
> >> Provide a fix by adding a Signed-off-by line corresponding to the author
> >> of the patch before the start of diff(s)
> >>
> >
> > Can you please provide an evaluation first?
> >
> > As far as remember, the fix is often not to add a Signed-off-by: tag but it
> > requires something completely different.
> >
>
> I have generated the 'git logs' of the commits causing
> MISSING_SIGN_OFF at:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task7/summary_log.txt
>
> Actually this fix was suggested by Joe at:
> https://lore.kernel.org/linux-kernel-mentees/e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com/
>

Yes I know. Now look at the reports.

The rc and release commit tags do not get a Signed-off-by
intentionally. Other than that, reverts (for reverts is probably best
to explain how to do a revert... so that a sign-off-by is included)
and typos.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
