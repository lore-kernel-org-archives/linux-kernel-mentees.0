Return-Path: <SRS0=sDOq=IS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B594C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 15:34:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC33A61965
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 15:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC33A61965
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BBAB60685;
	Sat, 20 Mar 2021 15:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Alk_tRfyoeGn; Sat, 20 Mar 2021 15:34:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5132260605;
	Sat, 20 Mar 2021 15:34:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A0C5C000B;
	Sat, 20 Mar 2021 15:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51F8AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 15:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4002960685
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 15:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gIIC21EWgfw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 15:33:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9B6660605
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 15:33:57 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id r20so15644590ljk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t5KS0kdQp57s/mtQhh/v9/SMWJpqPjCtzubIMwMGhXg=;
 b=m66Y/iK41/a3SjGezMtgXoPoYPdnEkWuIy8nJf5WeFtyLYEX599z/dynfl6934YmFP
 WYvprTIGSrkMcE5IFp+l9/nxkEC+Xs0aLUv1zArqXth8lBpoRq1fl/f0FHzESDUO/cp7
 MvwWshmp1R2Dr/GcunIHMEdGfbi/bLMe2PiqCmpVRXiWZIXHOl+wh6VQAbm/AAAf1I7n
 FDRtCJLx0UFmw/6ljEm5x+kDN19uyi+kH/ZUPT58pZcoWNAb9tmYB4yjEkc1sqP3NZk9
 vbUs22DAgjx+affZRl5HurfitUTAV/b/8OKC5qLlLe72E8nIpzNz7qA7T1qNQPrFHIyz
 d80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5KS0kdQp57s/mtQhh/v9/SMWJpqPjCtzubIMwMGhXg=;
 b=uVW1dAIkIZvL9QovRBkv0+0W4WeJX11zU08aSGKLwO44fov+vYWY8qSWwjMwsuBmyl
 4InF2c5Z8fq2Pq23sfYM8WaSUdtcnMG2uZRSMjy0tSx7BKmizAwDu2Z63XJ+NV9snXQ0
 0sPWEyIeo9mjLpVZipMZApmV0Ys/OWIewRtcAfgqb7i/7bTBfB3FRr5uda0drM87gbYg
 5O4iLLqjxZY+ma5I6Gfq7OckIMWsO1nJnMqgQPQN9vv5tOdOQCbG+d+poc34jVBiXjq0
 dxVE+NJpVugu3avzHJiaUVLfPMKdGOFhv1QDrXyJRwKB0A9hDVCuWosytpDILnn7SvYs
 8kww==
X-Gm-Message-State: AOAM53094GDVQ9H4kYNkcvoAkADW2i2U3lMXLmyDvu8LDewRLlGW1tZB
 9Uq7CsW/djqSMRHj6mNB2281/Q+O0OCYfD9ddL8=
X-Google-Smtp-Source: ABdhPJzUGjlgL7+nstHzB+cK1LMhIQmMsgMtt7/EEap92MRADUDPrp8ecBR0q1X48dPOMHU3duNL+Sub25zl/nDDSDU=
X-Received: by 2002:a2e:8e33:: with SMTP id r19mr4080388ljk.40.1616254435591; 
 Sat, 20 Mar 2021 08:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210318190303.4454-1-dwaipayanray1@gmail.com>
 <CAKXUXMwPNPkufGpeR7tSd_F2nJc8Lb95CfC2BTCWY=mLtGb2rg@mail.gmail.com>
In-Reply-To: <CAKXUXMwPNPkufGpeR7tSd_F2nJc8Lb95CfC2BTCWY=mLtGb2rg@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 20 Mar 2021 21:03:45 +0530
Message-ID: <CABJPP5D8QXND7CRcNGC-FXeraTMgfEmmogZfz_u_fsCHuwwZJw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: document all error message types in checkpatch
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

On Sat, Mar 20, 2021 at 8:14 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Mar 18, 2021 at 8:03 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > All the error message types now have a verbose description.
> >
> > Also there are two new groups of message types:
> >
> > - Macros, Attributes and Symbols
> > - Functions and Variables
> >
> > Rearrange the message types to fit these new groups as needed.
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >
> > Changes in v2:
> > - Replace 4.10 kernel doc links by latest
> >
>
> All good, see some further comments below.
>
> I am generally wondering if having kernel.org Links is right, though.
>
> Can you not use "doc:" or "ref:" in the documentation, so that sphinx
> would check those references and create those links automatically?
>
> E.g., in a few releases, documentation might be reorganized and by
> referring to latest, all documentation of previous releases would then
> contain broken links because pages were reorganized in latest.
>

Actually we used ref: links in the initial version. But that posed a problem.
Since this was being parsed by checkpatch, an user would see output
in the form:
ref: `Documentation/process/coding-style.rst`

And the current version would show:

See: https://www.kernel.org/doc/html/latest/process/coding-style.html

This is more intuitive for the person who runs checkpatch in verbose
mode. But at the same time we have to take the risk that if at some point
links are reorganized, we would have to change them too. I think that is
a fair tradeoff, unless we find something better.

> > +  **LOCKDEP**
> > +    lockdep_no_validate class is reserved for device->mutex.
>
> I do not understand this one.
>

I too didn't find a mention of it anywhere other than checkpatch.
On the list what I got was this patch:
https://lore.kernel.org/lkml/1268959062.9440.467.camel@laptop/

They added the novalidate class for lockdep conversions in device->mutex.
I can add this perhaps.

> >    **LINE_SPACING**
> >      Vertical space is wasted given the limited number of lines an
> >      editor window can display when multiple blank lines are used.
> >      See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
> >
> > +  **OPEN_BRACE**
> > +    The opening brace should be following the function definitions on the
> > +    next line.  For any non functional block it should be on the same line
>
> s/non functional/non-functional/
>
> But is non-functional block really a good wording?
>

I am not sure of a particular replacement. We want to mention every block except
a function. They have used the same wording here:
https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces

Do you have any suggestions?

> > +  **CORRUPTED_PATCH**
> > +    The patch seems to be corrupted or lines are wrapped.
> > +    Please regenerate the patch file before sending to the maintainer.
> > +
>
> s/sending to/sending it to/
>
will correct this. thanks.

> > +  **DOS_LINE_ENDINGS**
> > +    For DOS-formatted patches, there are extra ^M symbols at the end of
> > +    the line.  These should be removed.
> > +
> > +  **EXECUTE_PERMISSIONS**
> > +    There is no reason for source files to be executable.  The executable
> > +    bit can be removed safely.
> > +
> > +  **NON_OCTAL_PERMISSIONS**
> > +    Permission bits should use 4 digit octal permissions (like 0700 or 0444).
> > +    Avoid using any other base like decimal.
> > +
> > +  **NOT_UNIFIED_DIFF**
> > +    The patchfile does not appear to be in unified-diff format.  Please
> > +    regenerate the patch before sending to the maintainer.
> > +
>
> s/patch file/patch
>
> > +  **PRINTF_0XDECIMAL**
> > +    Prefixing Ox with decimal output is defective and should be corrected.
> > +
>
> s/O/0/ ?
>
oh sure my bad. They look almost similar

> > +  **TRAILING_STATEMENTS**
> > +    Trailing statements (for example after any conditional) should be
> > +    on the next line.
> > +    Like::
> > +
> > +      if (x == y) break;
> > +
> > +    should be::
> > +
> > +      if (x == y)
> > +              break;
> > --
> > 2.30.0
> >

Thanks!
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
