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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD194C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:57:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3470B22CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3470B22CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F59985F55;
	Sun, 24 Jan 2021 16:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-0YMviMz7_K; Sun, 24 Jan 2021 16:57:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1DD9185F2F;
	Sun, 24 Jan 2021 16:57:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0910AC0FA7;
	Sun, 24 Jan 2021 16:57:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DFE8C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C624871EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxhGTHDaYsNw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:57:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 40AF18720F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:57:38 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id h11so21659913ioh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YSKwo8eIsOzbuOMHkT1fGVdE+3S8e0FhLthyV8GnGlM=;
 b=RGWS6pvGAzU1RjmvxmefLd5lwcmkYQkul2c7tFblhUpQ+57GE4pD01/k/+hT1yq815
 eRyXAkeD3xgGaDS3Ffx6K6hbrd+3IkN22oZ2bCL6XKsmTy8RNnLWTnNytSfMiZq0Dg52
 mccxt6J4qZOr8PCIfEPTABwjmZm4D39ABc544qqt77UNB8mXGqEgyKhEz/IOjO/srcbN
 ssCh6yzf235lAnrYsbwgCV9PSmnaT6UialcihAuydZKSAGGmwPRjUeC9K/LE+flOBLaa
 21xfiBigkR/P0eLN+hH0mth4t6Z3yJHq18kLV3ViP51hr/Y1m5g2TTFE4tspBIULEa1Y
 WDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YSKwo8eIsOzbuOMHkT1fGVdE+3S8e0FhLthyV8GnGlM=;
 b=oZ/jJ4qeMAlbBel5R7zoxWYU7V8X1N0Kzi8n/ZDZle9xTNOmcilPakL2n+8UYrNslo
 hF3YCCs2yhTAtS+6Sa2v88DdHkdigKC29g1hAL6eeynUJFNI+CNfbX+1M2Ly8mSQvmsF
 UssD+YM7yw6sWTIYnLhSnlhwyl2cC5nc5qGOyTphECKaxiJEI1inh7PexUeqh/C0m/B6
 lpzF1lHkOGsyXSc65KygvpyAUXuUvwPaYkRNQj30JEyR/wMO9iAJhu2Ypk9MrT3R43ei
 Cp1hpfapIMQbZjTuDFLIRapJQL3HLboXlRq9JZA6xX0ueBiabSn9Z77NJibfNxBY4sk2
 FqfQ==
X-Gm-Message-State: AOAM5305NIJe/nMAc/a3IZYs3imcKpL/wL/tG30FA2ITf8yBnjoDQXeV
 br9kTlo2cUB43WBPq5oDQlr40oQD5GRK4+n6lJI=
X-Google-Smtp-Source: ABdhPJwoodPF7FGl6rhpo6w9vbt6ICuX1pPHOKVAlO9xh+FgW1G4BOMpMnPU4n2/lWanoZsQRVoX+5E2Ioaz9LC0DgM=
X-Received: by 2002:a05:6e02:2196:: with SMTP id
 j22mr425805ila.64.1611507457526; 
 Sun, 24 Jan 2021 08:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
 <20210124151933.19696-2-dwaipayanray1@gmail.com>
 <CAKXUXMzeOfjcu-KkBKqM5odsau+v6iQ6DFDDyNY9hZmZSdi0kQ@mail.gmail.com>
 <CABJPP5C88B5tufjg6Ps807onFEFJ5fTUMeUOX0-VH6fvg8EYag@mail.gmail.com>
In-Reply-To: <CABJPP5C88B5tufjg6Ps807onFEFJ5fTUMeUOX0-VH6fvg8EYag@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 24 Jan 2021 17:57:26 +0100
Message-ID: <CAKXUXMxwOiN=oNgHzGA2ZZHyLqiL1_jH+15rL50LLXDqYjOnYA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
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

On Sun, Jan 24, 2021 at 5:53 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sun, Jan 24, 2021 at 10:11 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Sun, Jan 24, 2021 at 4:19 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > Add documentation for style checker script checkpatch.pl
> > > (scripts/checkpatch.pl).
> > >
> > > The documentation performs a dual function. At the surface it
> > > serves as a documentation for checkpatch and describes the options
> > > as well as the messages emitted by checkpatch.
> > >
> > > The type description messages will be parsed to enable a verbose
> > > mode in checkpatch.
> > >
> > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > ---
> > >  Documentation/tools/checkpatch.rst | 271 +++++++++++++++++++++++++++++
> > >  1 file changed, 271 insertions(+)
> > >  create mode 100644 Documentation/tools/checkpatch.rst
> > >
> > > diff --git a/Documentation/tools/checkpatch.rst b/Documentation/tools/checkpatch.rst
> > > new file mode 100644
> > > index 000000000000..cbf153040de1
> > > --- /dev/null
> > > +++ b/Documentation/tools/checkpatch.rst
> > > @@ -0,0 +1,271 @@
> > > +==========
> > > +Checkpatch
> > > +==========
> > > +
> > > +This document describes the kernel script checkpatch.pl.
> > > +
> > > +.. Table of Contents
> > > +
> > > +       === 1 Introduction
> > > +       === 2 Options
> > > +       === 3 Message Levels
> > > +    === 4 Type Descriptions
> > > +
> > > +1 Introduction
> > > +--------------
> > > +
> > > +Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial style
> > > +violations in patches and optionally corrects them.  Checkpatch can also be run on
> > > +file contexts and without the kernel tree.
> > > +
> > > +It should be noted that checkpatch may not be always right.  At times the human
> > > +judgement should take preference over what checkpatch has to say.  If your code looks
> > > +better with the violations, then its probably best left alone.
> > > +
> > > +
> > > +2 Options
> > > +---------
> > > +
> > > +This section will describe the options checkpatch can be run with.
> > > +
> > > +Usage::
> > > +
> > > +  ./scripts/checkpatch.pl [OPTION]... [FILE]...
> > > +
> > > +Available options:
> > > +
> > > + - -q,  --quiet
> > > +
> > > +   Enable quiet mode.  All information messages are disabled.  Only the
> > > +   messages and a summary report is output.
> > > +
> > > + - --no-tree
> > > +
> > > +   Run checkpatch without the kernel tree.
> > > +
> > > + - --no-signoff
> > > +
> > > +   Disable the 'Signed-off-by' line check.  The sign-off is a simple line at
> > > +   the end of the explanation for the patch, which certifies that you wrote it
> > > +   or otherwise have the right to pass it on as an open-source patch.
> > > +
> > > +   Example::
> > > +
> > > +        Signed-off-by: Random J Developer <random@developer.example.org>
> > > +
> > > +   Setting this flag effectively stops a message for a missing signed-off-by line
> > > +   in a patch context.
> > > +
> > > + - --patch
> > > +
> > > +   Treat FILE as a patch.  This is the default option and need not be
> > > +   explicitly specified.
> > > +
> > > + - --emacs
> > > +
> > > +   Set output to emacs compile window format.  This allows emacs users to jump
> > > +   from the error in the compile window directly to the offending line in the patch.
> > > +
> > > + - --terse
> > > +
> > > +   Output only one line per report.
> > > +
> > > + - --showfile
> > > +
> > > +   Show the diffed file position instead of the input file position.
> > > +
> > > + - -g,  --git
> > > +
> > > +   Treat FILE as a single commit or a git revision range.
> > > +
> > > +   Single commit with:
> > > +
> > > +   - <rev>
> > > +   - <rev>^
> > > +   - <rev>~n
> > > +
> > > +   Multiple commits with:
> > > +
> > > +   - <rev1>..<rev2>
> > > +   - <rev1>...<rev2>
> > > +   - <rev>-<count>
> > > +
> > > + - -f,  --file
> > > +
> > > +   Treat FILE as a regular source file.  This option must be used when running
> > > +   checkpatch on source files in the kernel.
> > > +
> > > + - --subjective,  --strict
> > > +
> > > +   Enable stricter tests in checkpatch.  By default the tests emitted as CHECK
> > > +   do not activate by default.  Use this flag to activate the CHECK tests.
> > > +
> > > + - --list-types
> > > +
> > > +   Every message emitted by checkpatch has an associated TYPE.  Add this flag to
> > > +   display all the types in checkpatch.
> > > +
> > > +   Note that when this flag is active, checkpatch does not read the input FILE, and
> > > +   no message is emitted.  Only a list of types in checkpatch is output.
> > > +
> > > + - --types TYPE(,TYPE2...)
> > > +
> > > +   Only display messages with the given types.
> > > +
> > > +   Example::
> > > +
> > > +     ./scripts/checkpatch.pl mypatch.patch --types EMAIL_SUBJECT,NO_AUTHOR_SIGN_OFF
> > > +
> > > + - --ignore TYPE(,TYPE2...)
> > > +
> > > +   Strip off messages with the given types.
> > > +
> > > +   Example::
> > > +
> > > +     ./scripts/checkpatch.pl mypatch.patch --ignore EMAIL_SUBJECT,NO_AUTHOR_SIGN_OFF
> > > +
> > > + - --show-types
> > > +
> > > +   By default checkpatch doesn't display the type associated with the messages.
> > > +   Set this flag to show the message type in the output.
> > > +
> > > + - --max-line-length=n
> > > +
> > > +   Set the max line length (default 100).  On exceeding the given length, a message
> > > +   is emitted.
> > > +
> > > +   The message level is different for patch and file contexts.  For patches, a WARNING is
> > > +   emitted.  While a milder CHECK is emitted for files.  So for file contexts, the --strict
> > > +   flag must also be enabled.
> > > +
> > > + - --min-conf-desc-length=n
> > > +
> > > +   Set the min description length, if shorter, warn.
> > > +
> > > + - --tab-size=n
> > > +
> > > +   Set the number of spaces for tab (default 8).
> > > +
> > > + - --root=PATH
> > > +
> > > +   PATH to the kernel tree root.
> > > +
> > > +   This option must be specified when invoking checkpatch from outside
> > > +   the kernel root.
> > > +
> > > + - --no-summary
> > > +
> > > +   Suppress the per file summary.
> > > +
> > > + - --mailback
> > > +
> > > +   Only produce a report in case of Warnings or Errors.  Milder Checks are
> > > +   excluded from this.
> > > +
> > > + - --summary-file
> > > +
> > > +   Include the filename in summary.
> > > +
> > > + - --debug KEY=[0|1]
> > > +
> > > +   Turn on/off debugging of KEY, where KEY is one of 'values', 'possible',
> > > +   'type', and 'attr' (default is all off).
> > > +
> > > + - --fix
> > > +
> > > +   This is an EXPERIMENTAL feature.  If correctable errors exists, a file
> > > +   <inputfile>.EXPERIMENTAL-checkpatch-fixes is created which has the
> > > +   automatically fixable errors corrected.
> > > +
> > > + - --fix-inplace
> > > +
> > > +   EXPERIMENTAL - Similar to --fix but the input file is overwritten with fixes.
> > > +
> > > +   DO NOT USE this flag unless you are absolutely sure and you have a backup in place.
> > > +
> > > + - --ignore-perl-version
> > > +
> > > +   Override checking of perl version.  Runtime errors maybe encountered after
> > > +   enabling this flag if the perl version does not meet the minimum specified.
> > > +
> > > + - --codespell
> > > +
> > > +   Use the codespell dictionary for checking spelling errors.
> > > +
> > > + - --codespellfile
> > > +
> > > +   Use the specified codespell file.  Default is '/usr/share/codespell/dictionary.txt'.
> > > +
> > > + - --typedefsfile
> > > +
> > > +   Read additional types from this file.
> > > +
> > > + - --color[=WHEN]
> > > +
> > > +   Use colors 'always', 'never', or only when output is a terminal ('auto').
> > > +   Default is 'auto'.
> > > +
> > > + - --kconfig-prefix=WORD
> > > +
> > > +   Use WORD as a prefix for Kconfig symbols (default is `CONFIG_`).
> > > +
> > > + - -h, --help, --version
> > > +
> > > +   Display the help text.
> > > +
> >
> > Did you copy this from the current checkpatch.pl --help?
> >
> > Probably it is best to then refactor checkpatch.pl to just print the
> > help text by parsing from the Documentation file or have the
> > Documentation just include the output from checkpatch.pl --help here.
> >
>
> A part of it is copied actually. And some of the options are more thoroughly
> explained with examples like the types and the signoff ones. I think more
> examples could be added later on as an entra help.
>
> Maybe it would be better off keeping this separate as checkpatch would take
> some time to parse this every time the help message is to be printed?
>

Well, it is going to be difficult to keep it in sync if it is in two places.
Parsing a file should not take that long... and speed for printing
help is not crucial, nobody is going to call --help hundred or
thousand of times...

> Apart from that what do you think of it in general?
>

I think the whole help text deserves to be restructured, some options
are more standard, others very very special...

Maybe you can think about a good new structure here?

Lukas

> Thank you,
> Dwaipayan.
>
> > > +3 Message Levels
> > > +----------------
> > > +
> > > +Messages in checkpatch are divided into three levels. The levels of messages in
> > > +checkpatch denote the severity of the error. They are:
> > > +
> > > + - ERROR
> > > +
> > > +   This is the most strict level.  Messages of type ERROR must be taken
> > > +   seriously as they denote things that are very likely to be wrong.
> > > +
> > > + - WARNING
> > > +
> > > +   This is the next stricter level.  Messages of type WARNING requires a
> > > +   more careful review.  But it is milder than an ERROR.
> > > +
> > > + - CHECK
> > > +
> > > +   This is the mildest level.  These are things which may require some thought.
> > > +
> > > +4 Type Descriptions
> > > +-------------------
> > > +
> > > +This section contains a description of all the message types in checkpatch.
> > > +
> > > +.. Types in this section are also parsed by checkpatch.
> > > +.. Please keep the types sorted alphabetically.
> > > +.. CHECKPATCH_START
> > > +
> > > +MISSING_SIGN_OFF
> > > +
> > > +  The patch is missing a Signed-off-by line.  This error must be taken care of
> > > +  and a Signed-off-by line should be added according to Developer's certificate of
> > > +  Origin.
> > > +
> > > +NO_AUTHOR_SIGN_OFF
> > > +
> > > +  The author of the patch has not signed off the patch.  It is required that
> > > +  a simple sign off line should be present at the end of explanation of the patch
> > > +  to denote that the author has written it or otherwise has the rights to pass it on
> > > +  as an open source patch.
> > > +
> > > +  Sometimes this particular warning can also occur when both email address and name of
> > > +  the author do not match the sign off line because checkpatch has no mechanism to say
> > > +  if it is the same person.
> > > +
> > > +  Consider::
> > > +
> > > +    From: John Doe <john.doe@example.com>
> > > +    ...
> > > +    Signed-off-by: J. Doe <john@example2.com>
> > > +
> > > +  While these may point that both the persons are same, checkpatch cannot
> > > +  understand that and in such cases this warning can be ignored.
> > > +
> > > +.. CHECKPATCH_END
> > > --
> > > 2.30.0
> > >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
