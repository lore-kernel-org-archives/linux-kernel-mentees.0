Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F66C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:53:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9228922CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9228922CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 31EDD20407;
	Sun, 24 Jan 2021 16:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJd4oiXZLy2Q; Sun, 24 Jan 2021 16:53:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D09CD2042D;
	Sun, 24 Jan 2021 16:53:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0207C0FA7;
	Sun, 24 Jan 2021 16:53:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EF80C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1A1242042D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3uMB4bvaHdU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:53:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by silver.osuosl.org (Postfix) with ESMTPS id 5143620407
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:53:12 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id f1so4567336lfu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 08:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7OXRbfe0fPGaUwXgL+pO/pH62XoqUzZeWAklbVs+6oY=;
 b=J6hPjr9rrZ6S1D2Rwaq0xDsUdoWfaPMkIc1PgjQS8LlZ5CnLFSbbVlgK0Uy2xxkjCV
 I1cX9xsfYIQNNwZKz3S3TczWj6onZTxNcFQHStrSCXM32hwD5EpVRBVY50+Rp+37B7RJ
 NXT8nI8RdscVwGQFecJ1Aekyf8oXDM+NwK6nK6nQFRhAS28hjwOsaj6uX9cB+NyFVBTO
 B3erHzOg7lQvy/fLRINsx/ybtuhuousVfsIcV5I1z4QWWJGYFvZ6ymgYV2NKeqBTRCxD
 y/EKqIjFownYRcmtmcAyOeNaScDJNn4a18slAhlruV4HELpNa7RmfPs6L9VJW59vbqY+
 PqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OXRbfe0fPGaUwXgL+pO/pH62XoqUzZeWAklbVs+6oY=;
 b=FVVfIXDmDWYnTyhNbSiJTVoK+Y7J+X7pcMH46M1NifyuddrN0IzOKwSFj86T9b9DnF
 m0OvaaEilK6LJgR1t61s5VrbqcBXfhMfSVr6zQHBwGavDv9+fv52QJEZ1G50dn02ELAg
 zZk/lr18dbo1KdIVabDth2lN2wpUqSgM3YlOZOe+Xo+kvRKO1PbKAoGsKlLAmK4Ln4v9
 4D96KB9JoEQcB0QEJ62Iu5qvCsteLTOiIw6sjizMu81vsfZKSg15xgP3HKfg9rhXZyfq
 bNPvOWFx/od7L0yiephVVeDZVEZzfxKiteliQkRi0fEoej8lWe02j5BHh388Co7t7OGT
 yNXg==
X-Gm-Message-State: AOAM533AAr3ZN4V39mU8pM4q7YRuENEbqyWBQ9nVKEwcb64zjctpyZDo
 PXxEQObnw1KKZpUnx81yihu9lnI0XhtWPoqThRQ=
X-Google-Smtp-Source: ABdhPJyrxudISK4+R6kRv0FX/k+GwBHjpny0QNF3pUhXPboABtRx9K3Fuh41FaCxJ501AbNrMkjLH5t/Ezor4vGPzNU=
X-Received: by 2002:ac2:5d69:: with SMTP id h9mr582511lft.576.1611507190269;
 Sun, 24 Jan 2021 08:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
 <20210124151933.19696-2-dwaipayanray1@gmail.com>
 <CAKXUXMzeOfjcu-KkBKqM5odsau+v6iQ6DFDDyNY9hZmZSdi0kQ@mail.gmail.com>
In-Reply-To: <CAKXUXMzeOfjcu-KkBKqM5odsau+v6iQ6DFDDyNY9hZmZSdi0kQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 24 Jan 2021 22:23:05 +0530
Message-ID: <CABJPP5C88B5tufjg6Ps807onFEFJ5fTUMeUOX0-VH6fvg8EYag@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 1/3] docs: add documentation
	for checkpatch
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

On Sun, Jan 24, 2021 at 10:11 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sun, Jan 24, 2021 at 4:19 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Add documentation for style checker script checkpatch.pl
> > (scripts/checkpatch.pl).
> >
> > The documentation performs a dual function. At the surface it
> > serves as a documentation for checkpatch and describes the options
> > as well as the messages emitted by checkpatch.
> >
> > The type description messages will be parsed to enable a verbose
> > mode in checkpatch.
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  Documentation/tools/checkpatch.rst | 271 +++++++++++++++++++++++++++++
> >  1 file changed, 271 insertions(+)
> >  create mode 100644 Documentation/tools/checkpatch.rst
> >
> > diff --git a/Documentation/tools/checkpatch.rst b/Documentation/tools/checkpatch.rst
> > new file mode 100644
> > index 000000000000..cbf153040de1
> > --- /dev/null
> > +++ b/Documentation/tools/checkpatch.rst
> > @@ -0,0 +1,271 @@
> > +==========
> > +Checkpatch
> > +==========
> > +
> > +This document describes the kernel script checkpatch.pl.
> > +
> > +.. Table of Contents
> > +
> > +       === 1 Introduction
> > +       === 2 Options
> > +       === 3 Message Levels
> > +    === 4 Type Descriptions
> > +
> > +1 Introduction
> > +--------------
> > +
> > +Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial style
> > +violations in patches and optionally corrects them.  Checkpatch can also be run on
> > +file contexts and without the kernel tree.
> > +
> > +It should be noted that checkpatch may not be always right.  At times the human
> > +judgement should take preference over what checkpatch has to say.  If your code looks
> > +better with the violations, then its probably best left alone.
> > +
> > +
> > +2 Options
> > +---------
> > +
> > +This section will describe the options checkpatch can be run with.
> > +
> > +Usage::
> > +
> > +  ./scripts/checkpatch.pl [OPTION]... [FILE]...
> > +
> > +Available options:
> > +
> > + - -q,  --quiet
> > +
> > +   Enable quiet mode.  All information messages are disabled.  Only the
> > +   messages and a summary report is output.
> > +
> > + - --no-tree
> > +
> > +   Run checkpatch without the kernel tree.
> > +
> > + - --no-signoff
> > +
> > +   Disable the 'Signed-off-by' line check.  The sign-off is a simple line at
> > +   the end of the explanation for the patch, which certifies that you wrote it
> > +   or otherwise have the right to pass it on as an open-source patch.
> > +
> > +   Example::
> > +
> > +        Signed-off-by: Random J Developer <random@developer.example.org>
> > +
> > +   Setting this flag effectively stops a message for a missing signed-off-by line
> > +   in a patch context.
> > +
> > + - --patch
> > +
> > +   Treat FILE as a patch.  This is the default option and need not be
> > +   explicitly specified.
> > +
> > + - --emacs
> > +
> > +   Set output to emacs compile window format.  This allows emacs users to jump
> > +   from the error in the compile window directly to the offending line in the patch.
> > +
> > + - --terse
> > +
> > +   Output only one line per report.
> > +
> > + - --showfile
> > +
> > +   Show the diffed file position instead of the input file position.
> > +
> > + - -g,  --git
> > +
> > +   Treat FILE as a single commit or a git revision range.
> > +
> > +   Single commit with:
> > +
> > +   - <rev>
> > +   - <rev>^
> > +   - <rev>~n
> > +
> > +   Multiple commits with:
> > +
> > +   - <rev1>..<rev2>
> > +   - <rev1>...<rev2>
> > +   - <rev>-<count>
> > +
> > + - -f,  --file
> > +
> > +   Treat FILE as a regular source file.  This option must be used when running
> > +   checkpatch on source files in the kernel.
> > +
> > + - --subjective,  --strict
> > +
> > +   Enable stricter tests in checkpatch.  By default the tests emitted as CHECK
> > +   do not activate by default.  Use this flag to activate the CHECK tests.
> > +
> > + - --list-types
> > +
> > +   Every message emitted by checkpatch has an associated TYPE.  Add this flag to
> > +   display all the types in checkpatch.
> > +
> > +   Note that when this flag is active, checkpatch does not read the input FILE, and
> > +   no message is emitted.  Only a list of types in checkpatch is output.
> > +
> > + - --types TYPE(,TYPE2...)
> > +
> > +   Only display messages with the given types.
> > +
> > +   Example::
> > +
> > +     ./scripts/checkpatch.pl mypatch.patch --types EMAIL_SUBJECT,NO_AUTHOR_SIGN_OFF
> > +
> > + - --ignore TYPE(,TYPE2...)
> > +
> > +   Strip off messages with the given types.
> > +
> > +   Example::
> > +
> > +     ./scripts/checkpatch.pl mypatch.patch --ignore EMAIL_SUBJECT,NO_AUTHOR_SIGN_OFF
> > +
> > + - --show-types
> > +
> > +   By default checkpatch doesn't display the type associated with the messages.
> > +   Set this flag to show the message type in the output.
> > +
> > + - --max-line-length=n
> > +
> > +   Set the max line length (default 100).  On exceeding the given length, a message
> > +   is emitted.
> > +
> > +   The message level is different for patch and file contexts.  For patches, a WARNING is
> > +   emitted.  While a milder CHECK is emitted for files.  So for file contexts, the --strict
> > +   flag must also be enabled.
> > +
> > + - --min-conf-desc-length=n
> > +
> > +   Set the min description length, if shorter, warn.
> > +
> > + - --tab-size=n
> > +
> > +   Set the number of spaces for tab (default 8).
> > +
> > + - --root=PATH
> > +
> > +   PATH to the kernel tree root.
> > +
> > +   This option must be specified when invoking checkpatch from outside
> > +   the kernel root.
> > +
> > + - --no-summary
> > +
> > +   Suppress the per file summary.
> > +
> > + - --mailback
> > +
> > +   Only produce a report in case of Warnings or Errors.  Milder Checks are
> > +   excluded from this.
> > +
> > + - --summary-file
> > +
> > +   Include the filename in summary.
> > +
> > + - --debug KEY=[0|1]
> > +
> > +   Turn on/off debugging of KEY, where KEY is one of 'values', 'possible',
> > +   'type', and 'attr' (default is all off).
> > +
> > + - --fix
> > +
> > +   This is an EXPERIMENTAL feature.  If correctable errors exists, a file
> > +   <inputfile>.EXPERIMENTAL-checkpatch-fixes is created which has the
> > +   automatically fixable errors corrected.
> > +
> > + - --fix-inplace
> > +
> > +   EXPERIMENTAL - Similar to --fix but the input file is overwritten with fixes.
> > +
> > +   DO NOT USE this flag unless you are absolutely sure and you have a backup in place.
> > +
> > + - --ignore-perl-version
> > +
> > +   Override checking of perl version.  Runtime errors maybe encountered after
> > +   enabling this flag if the perl version does not meet the minimum specified.
> > +
> > + - --codespell
> > +
> > +   Use the codespell dictionary for checking spelling errors.
> > +
> > + - --codespellfile
> > +
> > +   Use the specified codespell file.  Default is '/usr/share/codespell/dictionary.txt'.
> > +
> > + - --typedefsfile
> > +
> > +   Read additional types from this file.
> > +
> > + - --color[=WHEN]
> > +
> > +   Use colors 'always', 'never', or only when output is a terminal ('auto').
> > +   Default is 'auto'.
> > +
> > + - --kconfig-prefix=WORD
> > +
> > +   Use WORD as a prefix for Kconfig symbols (default is `CONFIG_`).
> > +
> > + - -h, --help, --version
> > +
> > +   Display the help text.
> > +
>
> Did you copy this from the current checkpatch.pl --help?
>
> Probably it is best to then refactor checkpatch.pl to just print the
> help text by parsing from the Documentation file or have the
> Documentation just include the output from checkpatch.pl --help here.
>

A part of it is copied actually. And some of the options are more thoroughly
explained with examples like the types and the signoff ones. I think more
examples could be added later on as an entra help.

Maybe it would be better off keeping this separate as checkpatch would take
some time to parse this every time the help message is to be printed?

Apart from that what do you think of it in general?

Thank you,
Dwaipayan.

> > +3 Message Levels
> > +----------------
> > +
> > +Messages in checkpatch are divided into three levels. The levels of messages in
> > +checkpatch denote the severity of the error. They are:
> > +
> > + - ERROR
> > +
> > +   This is the most strict level.  Messages of type ERROR must be taken
> > +   seriously as they denote things that are very likely to be wrong.
> > +
> > + - WARNING
> > +
> > +   This is the next stricter level.  Messages of type WARNING requires a
> > +   more careful review.  But it is milder than an ERROR.
> > +
> > + - CHECK
> > +
> > +   This is the mildest level.  These are things which may require some thought.
> > +
> > +4 Type Descriptions
> > +-------------------
> > +
> > +This section contains a description of all the message types in checkpatch.
> > +
> > +.. Types in this section are also parsed by checkpatch.
> > +.. Please keep the types sorted alphabetically.
> > +.. CHECKPATCH_START
> > +
> > +MISSING_SIGN_OFF
> > +
> > +  The patch is missing a Signed-off-by line.  This error must be taken care of
> > +  and a Signed-off-by line should be added according to Developer's certificate of
> > +  Origin.
> > +
> > +NO_AUTHOR_SIGN_OFF
> > +
> > +  The author of the patch has not signed off the patch.  It is required that
> > +  a simple sign off line should be present at the end of explanation of the patch
> > +  to denote that the author has written it or otherwise has the rights to pass it on
> > +  as an open source patch.
> > +
> > +  Sometimes this particular warning can also occur when both email address and name of
> > +  the author do not match the sign off line because checkpatch has no mechanism to say
> > +  if it is the same person.
> > +
> > +  Consider::
> > +
> > +    From: John Doe <john.doe@example.com>
> > +    ...
> > +    Signed-off-by: J. Doe <john@example2.com>
> > +
> > +  While these may point that both the persons are same, checkpatch cannot
> > +  understand that and in such cases this warning can be ignored.
> > +
> > +.. CHECKPATCH_END
> > --
> > 2.30.0
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
