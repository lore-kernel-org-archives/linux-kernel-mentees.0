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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B59C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 07:43:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBCE61930
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 07:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBCE61930
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E904402A7;
	Mon, 22 Mar 2021 07:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KztskcrFkTIY; Mon, 22 Mar 2021 07:43:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 768CF40299;
	Mon, 22 Mar 2021 07:43:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64A6FC000B;
	Mon, 22 Mar 2021 07:43:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8201CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D866065D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGQW9favhy_P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:43:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBB0160647
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:43:26 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id u10so19835003lju.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 00:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GW6MrLpzlCtSZ5zQbDRcLYVywXdIJSldF1aB16Ol+84=;
 b=Vy202KPfws4rHXl852Gu/CvwlbL3X+vS2z9WBBOhFnnE7s3QNjzDY3kOkLB8UqmApE
 Ap8m5gGfOZ+RChoMLSc3m89Xc8MNJdevxbAAHANKylzg9Ck3UDtq5WV0xX7tKZiNaieR
 kGJv7m4yfS8WN1NKdS1zTwnbc95y7OYvBffjQWtH0nvqfaCNQ6U36bTdP4GJ/y5DqvL1
 WvN4wqXeYd+VHh1TVxTpkk6xXbxp+E5/5NOoiDyUoM5dHOA239/VtL6WATtVOX5kymmY
 w/qKJXVjlCgPo/RqGitqw25J+jLb5O/gITRs+ZSKOpU1JIag68ZGI06ailiXPUDcD0FZ
 +sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GW6MrLpzlCtSZ5zQbDRcLYVywXdIJSldF1aB16Ol+84=;
 b=sfrt5AgMM/zyzJeY8tKqtKkspLIi+ht71s47Qiid6nYpbdwfsh4tdMTcA0jdEOYi2n
 HqbMtz75jCkrO87V0c6CqmFGY0K9dJ7LMy26r9VMuZCZXxN+HTbt/97Xdri+jORGwKQR
 u0c14yRwZRkNUss0cDClHBHM51w0wG2/mVQsJj6P4KEYp5/mcko3f/lNLySZv7j9MmcA
 IixulR6uomGuWPjM82r4yN+nxHS2cmUqZ+qybuGTAzCULAqos8vzFT28h3EWNS6AhYRG
 dYtnif7Wlm1ly+CAUhpImp5k2GP1n2yO21l5GyPnS1ujVzTgZhWXf1hcdbIuJK819QbZ
 0SgQ==
X-Gm-Message-State: AOAM532y3uHVECrgxAdNIHs+xJ4wrg1b38yOZOnFeAotiv5y2PmtL3m5
 7d7z0IgD0NUT5bl0A1v+LltRKLwH71Zts1sxcPo=
X-Google-Smtp-Source: ABdhPJzbh6liZjsXM2HrML96ENOyzm+1PglzfLVxbi9P1qlc7AhVZEAkaR7s48/vlx+zA//FkZ7Ve+o94bHKW7f1IDs=
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr9195267ljj.284.1616399004743; 
 Mon, 22 Mar 2021 00:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210321112645.60823-1-dwaipayanray1@gmail.com>
 <CAKXUXMzPmU0DN7CCU_Gyuag3EwuGZHjkwbZdGwAhCOqKvUNhuw@mail.gmail.com>
In-Reply-To: <CAKXUXMzPmU0DN7CCU_Gyuag3EwuGZHjkwbZdGwAhCOqKvUNhuw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 22 Mar 2021 13:13:13 +0530
Message-ID: <CABJPP5ArFdRYBtsbD9dheqBqqx15mGKjfiQSkgW4LwBu60ijaQ@mail.gmail.com>
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

On Mon, Mar 22, 2021 at 1:03 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
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
>
> Let us go for a wider review on linux-doc and lkml...
>
Sure will do

> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
>
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
>
> Capital letter means SHOUTING. I do not see the need to shout here...
>
> Maybe that was needed in the original mail... in the documentation, we
> are happy that the reader reads it at all...
>

Yes that makes sense. We don't wanna scare our readers too. So i will
correct this.

Thanks!
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
