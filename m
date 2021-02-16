Return-Path: <SRS0=2qHp=HS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C88C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 16 Feb 2021 14:18:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CF864D5D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 16 Feb 2021 14:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5CF864D5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 525746F4C8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 16 Feb 2021 14:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsX4d7peF-WR
	for <linux-kernel-mentees@archiver.kernel.org>;
	Tue, 16 Feb 2021 14:18:57 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 1D3B16F4FD; Tue, 16 Feb 2021 14:18:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 508E56F48C;
	Tue, 16 Feb 2021 14:18:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BA82C0174;
	Tue, 16 Feb 2021 14:18:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 551E4C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Feb 2021 14:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4831D87182
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Feb 2021 14:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4tytMMOcwlk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Feb 2021 14:18:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E155A8717F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Feb 2021 14:18:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id n6so13212845wrv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Feb 2021 06:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ydSVplyCbekENrKjGYCbN31ZHi4GQiUsavtSWIdE7WQ=;
 b=XIBlbgPsJ1B7Xxrwtu/pEkpdbjZWJE+D38NMZJDf59kPikUY8w7fYbO5jLdTBRm4C/
 tYXfcDWipNI0QNLIw5EpR6Vr8NvJ1luoMm5RKZdZpJIBKSxu8QNDcJtdBwu03VYwofXr
 i8FeLuCTUttFXtN4yQuzfDTLw6yxHslE/JtLWEe1bJ0ZehzpAy6kzRLHY7EAya+d5f1w
 6oPCJH81yB/r4RZdbFD7Y3p1Pj61vFfZRK7d7RSDlcp9UXSXJkHJxThWgS4Ewkv/0lGc
 aVBg0W44fq9+R4j4iVxTkekZbUwczPFdcktOWVEop3YRpdBUYSLnqSCdTzLTchmC6JAI
 7/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ydSVplyCbekENrKjGYCbN31ZHi4GQiUsavtSWIdE7WQ=;
 b=UQgQ12eDt7ww6Tik4nOMPnyuk8ewIj1Nfr5yS0+WOTZEc35FbRAavvuUo1SCHmT233
 iA0bIIrjFGz6L+T4EPKdBli+cfmZIUvJKVeHzDhWVM0g1iM6OksUFeWfJl3+x/RgHIcc
 6jTJZx5Yl4+buLYZNMrWnQErsitFHktRJ8fvtA++Cvhl0kdx3yZ6HNc76Uiuc9eJwrCp
 aLNt05sBmLbbUxZXHS773zMzTMzgajlKkpswP7UaHlCwu6olEagaORcm2rTxLXOOTSyW
 KlSA436uLdMiceF4lS3G3MiY8fHYhhj3tl/gimsSLziSuuFgX/Dhstsc54F+VyT5VJLe
 UctQ==
X-Gm-Message-State: AOAM5307OzJXAtfBpRFc1hKOnf0/VxMV7QjjHOrUJHeLYX8Z4xTlKDf9
 MNyWanOqXraq2q26+NG2ljd8yI/2IrEK0ucTa8M=
X-Google-Smtp-Source: ABdhPJzZawgZRLvkKppc98IHqIkXN6SOSc0FzGsVlF0vofBcTa/6OLdIMhh8Rfz21oqxBUkZTxuQKtJ7S+tm/GsYPoM=
X-Received: by 2002:a5d:45ca:: with SMTP id b10mr24528912wrs.9.1613485131379; 
 Tue, 16 Feb 2021 06:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
 <b2e25e683a3e2f31d4dc2d666e082634e30643b3.camel@perches.com>
In-Reply-To: <b2e25e683a3e2f31d4dc2d666e082634e30643b3.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 16 Feb 2021 19:48:52 +0530
Message-ID: <CABJPP5CaAavDMWy8xmQ8Bxpf5549v8fqOz8Zi=g7g6ZGnCAVmg@mail.gmail.com>
To: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v3 2/3] docs: add
	documentation for checkpatch
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

On Sun, Feb 14, 2021 at 10:27 PM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2021-02-13 at 18:45 +0530, Dwaipayan Ray wrote:
> > Add documentation for kernel script checkpatch.pl.
> > This documentation is also parsed by checkpatch to
> > enable a verbose mode.
> >
> > The message types in checkpatch are documented with rst
> > field lists. A total of 33 checkpatch type descriptions
> > are added.
>
> Alphabetic ordering isn't that great for these entries.
> Please group them by use:
>
> whitespace/code layout style:
> SPACING, TRAILING_WHITESPACE, LINE_SPACING
>
> commit message defects:
> BAD_SIGN_OFF, BAD_STABLE_ADDRESS_STYLE, COMMIT_COMMENT_SYMBOL, COMMIT_MESSAGE
>
> Allocation style:
> group: ALLOC_ARRAY_ARGS, ALLOC_SIZEOF_STRUCT, ALLOC_WITH_MULTIPLY
>
> > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> []
> > +4 Type Descriptions
> > +-------------------
> > +
> > +This section contains a description of all the message types in checkpatch.
> > +
> > +.. Types in this section are also parsed by checkpatch.
> > +.. Please keep the types sorted alphabetically.
> > +
> > +:ALLOC_ARRAY_ARGS:
> > +  The first argument for kcalloc or kmalloc_array should be the
> > +  number of elements.  sizeof() as the first argument is generally
> > +  wrong.
>
> If you look at the generated .html file, the output format  is poor.
>
> It would probably be better to use
> **<TYPE>**
> for each of these blocks instead of
> :<TYPE>:
>
> and update the script appropriately.
>

Hi,
Could I get some comment on this grouping for types:

Allocation Style: ALLOC_ARRAY_ARGS, ALLOC_SIZEOF_STRUCT, ALLOC_WITH_MULTIPLY

API Usage: ARCH_DEFINES, ARCH_INCLUDE_LINUX, ARRAY_SIZE, AVOID_BUG,
                    AVOID_EXTERNS, AVOID_L_PREFIX, BIT_MACRO, CONSIDER_KSTRTO

Comment Style: BLOCK_COMMENT_STYLE, C99_COMMENTS

Commit Message: BAD_SIGN_OFF, BAD_STABLE_ADDRESS_STYLE, COMMIT_COMMENT_SYMBOL,
                              COMMIT_MESSAGE, MISSING_SIGN_OFF,
NO_AUTHOR_SIGN_OFF

Comparison Style: ASSIGN_IN_IF, BOOL_COMPARISON, COMPARISON_TO_NULL,
                               CONSTANT_COMPARISON

Spacing & Brackets: ASSIGNMENT_CONTINUATIONS, BRACES, BRACKET_SPACE,
                                  CODE_INDENT, CONCATENATED_STRING,
LINE_SPACING,
                                  TRAILING_WHITESPACE

Others: CAMELCASE, CONFIG_DESCRIPTION

This is what I have done till now. Any suggestions would be nice and if it looks
okay I would like to send the v4 in.

Thanks & Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
