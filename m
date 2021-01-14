Return-Path: <SRS0=ZZOl=GR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4D7C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 14:35:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCBD23A57
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 14:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DCBD23A57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D29D386A72;
	Thu, 14 Jan 2021 14:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8g1YFaoto5UP; Thu, 14 Jan 2021 14:35:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CCA4E86A73;
	Thu, 14 Jan 2021 14:35:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB498C0893;
	Thu, 14 Jan 2021 14:35:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22E2CC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 14:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 06ECD203AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 14:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8aoqmDWif0AJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 14:35:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by silver.osuosl.org (Postfix) with ESMTPS id 5683F2050B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 14:35:26 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id y19so11577821iov.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 06:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=36VIdDmFDzCPGGfi8gVMwG8G5tqrRAfR3+kQXs2qm+4=;
 b=qLJECAnM/FYv7ISJ94Qq2k2ExK5mlkt0FjETlJY4sCPzA31sN1N4BovHLXTHppNrgJ
 x69m/ux3TSeV7zvqqqyeHcYRJDEudjldTAKp51di2RNjC4QGDmLslX7Lp0NeyGphq9SD
 p3YxxlXdFg7+kRYoN9Ay9Kjht2vfA6rRe7U1RKGplm5BN5auZkwLyz/Gde6t31UJ2/Sa
 +MAceiNZCzNkU4lj4g5KYJCbwwWwvQWk7kH8UfvTyvrC0qe2IK2Jfo0UeZtfa9xI0ETI
 l4wUBAv8SSUGsKoCW4bCY908d+rDhVojQE3UD+60PxZIH2i9cTI2Qa28Ldd5IZRHcklL
 6CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=36VIdDmFDzCPGGfi8gVMwG8G5tqrRAfR3+kQXs2qm+4=;
 b=ZRRLcUewuITkDx5XRpzI50Gztvf2ypan37FnZw/gxiVsg1SBdUA/PPvhA9ffeC2LB3
 XsfnTi61ZobR14EtbGhs1ctCQn7uT0aHM1cgUkxfyi4NA8w9iKluWCpwnZCfviN9IjR5
 d0zmUFd6PCEd9xEFQzAmZiFO0AzThpJbmp8jUuUuwzCblkLGavGMm8XtTruHnydfVZP1
 t9SnDeBPixje0TN36Zz+nSTfoiiOaz7+oD4+jRC+jXxwQKczyAlPu573QL2LKVsJUP3P
 SsDagFlDahSRknWry1z4MaY9VA2wkj/Ull/ntFuB/0lLTpbMFGiuipNPKfQV/aRMYlDK
 zPaw==
X-Gm-Message-State: AOAM533poRvfTftU13TXV1lJnaXT8AfmZIZbH0NOr2AkzdOe71rWfBWg
 1y8f6ZE2gSWvobrrCTPAHNBARnFFE6jPuEhhbcA=
X-Google-Smtp-Source: ABdhPJx9/LGfL1GfALySKXZFnuVUy9v8lfvurLJS+jeArdiszP7SXYkOYDfKT4oq76fy501YC1hoccBZHLqY+4lOwlU=
X-Received: by 2002:a02:2b2f:: with SMTP id h47mr6394100jaa.139.1610634925499; 
 Thu, 14 Jan 2021 06:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20210112115421.GB13086@zn.tnic>
 <20210112194625.4181814-1-ndesaulniers@google.com>
 <20210112210154.GI4646@sirena.org.uk>
 <CAKXUXMwoY+__Xrg3uKtz3AzgDorVTKtgtQnisoSWO8Wh0tmDNQ@mail.gmail.com>
 <43a325aa-aa8a-7170-46ab-3353f1ac86a8@gmail.com>
In-Reply-To: <43a325aa-aa8a-7170-46ab-3353f1ac86a8@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 14 Jan 2021 15:35:22 +0100
Message-ID: <CAKXUXMz_SMD06=wvOSQekZ0ZJ_7KAH2K3dRd1ZtuXeYy1ME8+Q@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fwd: [PATCH v4] x86/entry: emit a symbol
	for register restoring thunk
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

Sounds good to me.

On Thu, Jan 14, 2021 at 3:21 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 14/1/21 5:19 pm, Lukas Bulwahn wrote:
> > Dwaipayan and Aditya, here is another candidate for a checkpatch rule.
> >
> > Lukas
> >
> > ---------- Forwarded message ---------
> > From: Mark Brown <broonie@kernel.org>
> > Date: Tue, Jan 12, 2021 at 10:02 PM
> > Subject: Re: [PATCH v4] x86/entry: emit a symbol for register restoring thunk
> > To: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
> > <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
> > <bp@alien8.de>, Fangrui Song <maskray@google.com>, Arnd Bergmann
> > <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Jonathan Corbet
> > <corbet@lwn.net>, <x86@kernel.org>, H. Peter Anvin <hpa@zytor.com>,
> > Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda
> > <ojeda@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Joe Perches
> > <joe@perches.com>, <linux-doc@vger.kernel.org>,
> > <linux-kernel@vger.kernel.org>, <clang-built-linux@googlegroups.com>
> >
> >
> > On Tue, Jan 12, 2021 at 11:46:24AM -0800, Nick Desaulniers wrote:
> >
> > This:
> >
> >> when building with LLVM_IAS=1 (Clang's integrated assembler). Josh
> >> notes:
> >
> >>   So basically, you can use an .L symbol *inside* a function or a code
> >>   segment, you just can't use the .L symbol to contain the code using a
> >>   SYM_*_START/END annotation pair.
> >
> > is a stronger statement than this:
> >
> >> +  Developers should avoid using local symbol names that are prefixed with
> >> +  ``.L``, as this has special meaning for the assembler; a symbol entry will
> >> +  not be emitted into the symbol table. This can prevent ``objtool`` from
> >> +  generating correct unwind info. Symbols with STB_LOCAL binding may still be
> >> +  used, and ``.L`` prefixed local symbol names are still generally useable
> >> +  within a function, but ``.L`` prefixed local symbol names should not be used
> >> +  to denote the beginning or end of code regions via
> >> +  ``SYM_CODE_START_LOCAL``/``SYM_CODE_END``.
> >
> > and seems more what I'd expect - SYM_FUNC* is also affected for example.
> > Even though other usages are probably not very likely it seems better to
> > keep the stronger statement in case someone comes up with one, and to
> > stop anyone spending time wondering why only SYM_CODE_START_LOCAL is
> > affected.
> >
> > This also looks like a good candiate for a checkpatch rule, but that can
> > be done separately of course.
> >
>
> Thanks Lukas!
> I'd like to take a shot at it. This is what I have understood from the
> discussion:
> Introduce a new warning rule for .S files, where ".L" prefixes are
> used in the code, if it is occurring between any kind of START/END pair.
> This is what I am planning to do:
> - Check if the file is ".S" file.
> - If the line contains ".L" prefixed symbol, give user a
> warning/check, so that they can ensure that the line is not inside
> START/END block. (As we may not be able to make sure about the same,
> if the START/END line is not in the patch; otherwise we could run a
> while loop)
>
> What do you think?
>
> Thanks
> Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
