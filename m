Return-Path: <SRS0=kSKC=IU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDD9C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 07:48:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55EFE61930
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 07:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55EFE61930
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D972582E29;
	Mon, 22 Mar 2021 07:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lByn2PlnInQo; Mon, 22 Mar 2021 07:48:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF95682E19;
	Mon, 22 Mar 2021 07:48:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9879EC000B;
	Mon, 22 Mar 2021 07:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CA9AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 390DC82E29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CxgZUo0NgoS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:48:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEE1282E19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:48:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i26so3867055lfl.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 00:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AchGrvRwQGEodx7tAVWv+ip2jNDEtxHA7sXmBPOB9wA=;
 b=tflize4TOnGVOc5rkf5bURKYBNsrWOTcKf21m0WU+lt1vjE1RM+PsaHf5UwEXaU5H9
 EQoq1hRB6uEHMIWDaJF/gQeNq4mZ9ylpxOThgpSPa+fkUke+CZtyYvl0xIt5AKNmBWhY
 bprMOCCklaZT5W8jh++mxsi6W1A/49nrHxvpoKCVT0PVOWtUta5BlOg4WWPlzrxfPdwU
 hdhlABAdsPjVoctrjlqtjgcrFhDCfAW1P3wAe4e4ufN3T6IB9bLZi6H/d82x0YA21Sf0
 PNXf+JFD41r996EJNrnyiP9hKcYJlwh9/9dpV/xr4cWCMHKoSrejoqbXXDSIl9NXeFZO
 H/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AchGrvRwQGEodx7tAVWv+ip2jNDEtxHA7sXmBPOB9wA=;
 b=Ple0sXH62Cllv4xq54A3617l/N987r2GEorESKHxYlmyOO7rOkV/uLaCnW7shAxCi2
 beMw4414e3RakwQyG/+md2HOxAQJanGhK89o+2eh0+8XS3jyXTsD4xvWLNC4yT0KwiPR
 Wh69pA4s4f9lW6k/S0vcZYrqvEEpThqa/aPKveBLwytRp4AgpVlPfWAEc2a4taPQu8Vv
 9by5kHSzn1ho/wQH7vwU9UtdLzzWjImsVKBm4epB5dwzx04oKP7WedDYKlgjg8H+Ab02
 hXXfvzvQn8LpFkDnmcQIO2V0Ushn7MedabtZBteDIQl/JEdplGa6xxVzqOCMZI9aGLYC
 szLQ==
X-Gm-Message-State: AOAM531TC5BMDLbvhyRvmvQyjswW2Ha5OfXjFQr0mAS5ShWyD4l5svLq
 PQeToq+1eP4fJv9G5SA9UWoFrL1eDSe/H8JAHFs=
X-Google-Smtp-Source: ABdhPJwnbFc3iSEUMcIMQE4YxxZSxxILVr7epSrX1iuTydxLzd7qMEICr5wgg4yxCWMByxB+9fHQsraZfCnB4slvTgY=
X-Received: by 2002:a19:b49:: with SMTP id 70mr8768394lfl.342.1616399283561;
 Mon, 22 Mar 2021 00:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210321112645.60823-1-dwaipayanray1@gmail.com>
 <CAKXUXMyye_xKQseT7p-iq81cWKV0_GOunwb=OZ67qJwUnrKRMA@mail.gmail.com>
In-Reply-To: <CAKXUXMyye_xKQseT7p-iq81cWKV0_GOunwb=OZ67qJwUnrKRMA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 22 Mar 2021 13:17:52 +0530
Message-ID: <CABJPP5DE7sUEW_E+vERizS4cJLEWYfZD9deDagt4S7k7V2KwgA@mail.gmail.com>
Subject: Re: [PATCH -next v3] docs: document all error message types in
 checkpatch
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

On Mon, Mar 22, 2021 at 1:12 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sun, Mar 21, 2021 at 12:26 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
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
> > Changes in v3:
> > - Add more explanation for LOCKDEP
> > - Minor grammar fixes
> >
> > Changes in v2:
> > - Replace 4.10 kernel doc links by latest
> >
> >  Documentation/dev-tools/checkpatch.rst | 319 ++++++++++++++++++++++---
> >  1 file changed, 281 insertions(+), 38 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> > index 2671e54c8320..904fd5fe2484 100644
> > --- a/Documentation/dev-tools/checkpatch.rst
> > +++ b/Documentation/dev-tools/checkpatch.rst
> > @@ -280,43 +280,12 @@ API usage
> >      However this is not always the case (See signal.h).
> >      This message type is emitted only for includes from arch/.
> >
> > -  **ARRAY_SIZE**
> > -    The ARRAY_SIZE(foo) macro should be preferred over
> > -    sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
> > -    array.
> > -
> > -    The macro is defined in include/linux/kernel.h::
> > -
> > -      #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> > -
> >    **AVOID_BUG**
> >      BUG() or BUG_ON() should be avoided totally.
> >      Use WARN() and WARN_ON() instead, and handle the "impossible"
> >      error condition as gracefully as possible.
> >      See: https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
> >
> > -  **AVOID_EXTERNS**
> > -    Function prototypes don't need to be declared extern in .h
> > -    files.  It's assumed by the compiler and is unnecessary.
> > -
> > -  **AVOID_L_PREFIX**
> > -    Local symbol names that are prefixed with `.L` should be avoided,
> > -    as this has special meaning for the assembler; a symbol entry will
> > -    not be emitted into the symbol table.  This can prevent `objtool`
> > -    from generating correct unwind info.
> > -
> > -    Symbols with STB_LOCAL binding may still be used, and `.L` prefixed
> > -    local symbol names are still generally usable within a function,
> > -    but `.L` prefixed local symbol names should not be used to denote
> > -    the beginning or end of code regions via
> > -    `SYM_CODE_START_LOCAL`/`SYM_CODE_END`
> > -
> > -  **BIT_MACRO**
> > -    Defines like: 1 << <digit> could be BIT(digit).
> > -    The BIT() macro is defined in include/linux/bitops.h::
> > -
> > -      #define BIT(nr)         (1UL << (nr))
> > -
> >    **CONSIDER_KSTRTO**
> >      The simple_strtol(), simple_strtoll(), simple_strtoul(), and
> >      simple_strtoull() functions explicitly ignore overflows, which
> > @@ -325,6 +294,25 @@ API usage
> >      correct replacements.
> >      See: https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
> >
> > +  **LOCKDEP**
> > +    The lockdep_no_validate class was added as a temporary measure to
> > +    prevent warnings on conversion of device->sem to device->mutex.
> > +    It should not be used for any other purpose.
> > +    See: https://lore.kernel.org/lkml/1268959062.9440.467.camel@laptop/
> > +
> > +  **MALFORMED_INCLUDE**
> > +    The #include statement has a malformed path.  This has happened
> > +    because the author has included a double slash "//" in the pathname
> > +    accidentally.
> > +
> > +  **USE_LOCKDEP**
> > +    lockdep_assert_held() annotations should be preferred over
> > +    assertions based on spin_is_locked()
> > +    See: https://www.kernel.org/doc/html/latest/locking/lockdep-design.html#annotations
> > +
> > +  **UAPI_INCLUDE**
> > +    No #include statements in include/uapi should use a uapi/ path.
> > +
> >
> >  Comment style
> >  -------------
> > @@ -353,7 +341,6 @@ Comment style
> >      See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
> >
> >
> > -
> >  Commit message
> >  --------------
> >
> > @@ -397,6 +384,35 @@ Commit message
> >      source patch.
> >      See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
> >
> > +  **DIFF_IN_COMMIT_MSG**
> > +    Avoid having diff content in commit message.
> > +    This causes problems when one tries to apply a file containing both
> > +    the changelog and the diff because patch(1) tries to apply the diff
> > +    which it found in the changelog.
> > +    See: https://lore.kernel.org/lkml/20150611134006.9df79a893e3636019ad2759e@linux-foundation.org/
> > +
> > +  **GERRIT_CHANGE_ID**
> > +    To be picked up by gerrit, the footer of the commit message might
> > +    have a Change-Id like::
> > +
> > +      Change-Id: Ic8aaa0728a43936cd4c6e1ed590e01ba8f0fbf5b
> > +      Signed-off-by: A. U. Thor <author@example.com>
> > +
> > +    The Change-Id line must be removed before submitting.
> > +
> > +  **GIT_COMMIT_ID**
> > +    The proper way to reference a commit id is:
> > +    commit <12+ chars of sha1> ("<title line>")
> > +
> > +    An example may be::
> > +
> > +      Commit e21d2170f36602ae2708 ("video: remove unnecessary
> > +      platform_set_drvdata()") removed the unnecessary
> > +      platform_set_drvdata(), but left the variable "dev" unused,
> > +      delete it.
> > +
> > +    See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> > +
> >
> >  Comparison style
> >  ----------------
> > @@ -426,6 +442,148 @@ Comparison style
> >      side of the test should be avoided.
> >
> >
> > +Macros, Attributes and Symbols
> > +------------------------------
> > +
> > +  **ARRAY_SIZE**
> > +    The ARRAY_SIZE(foo) macro should be preferred over
> > +    sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
> > +    array.
> > +
> > +    The macro is defined in include/linux/kernel.h::
> > +
> > +      #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> > +
> > +  **AVOID_EXTERNS**
> > +    Function prototypes don't need to be declared extern in .h
> > +    files.  It's assumed by the compiler and is unnecessary.
> > +
> > +  **AVOID_L_PREFIX**
> > +    Local symbol names that are prefixed with `.L` should be avoided,
> > +    as this has special meaning for the assembler; a symbol entry will
> > +    not be emitted into the symbol table.  This can prevent `objtool`
> > +    from generating correct unwind info.
> > +
> > +    Symbols with STB_LOCAL binding may still be used, and `.L` prefixed
> > +    local symbol names are still generally usable within a function,
> > +    but `.L` prefixed local symbol names should not be used to denote
> > +    the beginning or end of code regions via
> > +    `SYM_CODE_START_LOCAL`/`SYM_CODE_END`
> > +
> > +  **BIT_MACRO**
> > +    Defines like: 1 << <digit> could be BIT(digit).
> > +    The BIT() macro is defined in include/linux/bitops.h::
> > +
> > +      #define BIT(nr)         (1UL << (nr))
> > +
> > +  **CONST_READ_MOSTLY**
> > +    When a variable is tagged with the __read_mostly annotation, it is a
> > +    signal to the compiler that accesses to the variable will be mostly
> > +    reads and rarely(but NOT never) a write.
> > +
> > +    const __read_mostly does not make any sense as const data is already
> > +    read-only.  The __read_mostly annotation thus should be removed.
> > +
> > +  **DATE_TIME**
> > +    It is generally desirable that building the same source code with
> > +    the same set of tools is reproducible, i.e. the output is always
> > +    exactly the same.
> > +
> > +    The kernel does *not* use the ``__DATE__`` and ``__TIME__`` macros,
> > +    and enables warnings if they are used as they can lead to
> > +    non-deterministic builds.
> > +    See: https://www.kernel.org/doc/html/latest/kbuild/reproducible-builds.html#timestamps
> > +
> > +  **DEFINE_ARCH_HAS**
> > +    The ARCH_HAS_xyz or ARCH_HAVE_xyz patterns are totally wrong.
> > +
> > +    For big conceptual features use Kconfig symbols instead.  And for
> > +    smaller things where we have compatibility fallback functions but
> > +    want architectures able to override them with optimized ones one
> > +    function at a time, we should either use weak functions (appropriate
> > +    for some cases), or the symbol that protects them should the
> > +    SAME SYMBOL WE USE.
> > +    See: http://lkml.iu.edu/hypermail/linux/kernel/1309.3/01646.html
>
> In general, use lore.kernel.org Links for emails.
>
> In this case:
>
> https://lore.kernel.org/lkml/CA+55aFycQ9XJvEOsiM3txHL5bjUc8CeKWJNR_H+MiicaddB42Q@mail.gmail.com/

Thanks. For some reason, I didn't get that thread link by searching on
lkml. Did you use something else to search for this?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
