Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A949FC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 16:25:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A0C208B6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 16:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfRSDBwX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A0C208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E293086717;
	Sun,  8 Nov 2020 16:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5jEHCJfugre; Sun,  8 Nov 2020 16:25:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C61C8670B;
	Sun,  8 Nov 2020 16:25:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3ECA8C0889;
	Sun,  8 Nov 2020 16:25:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A37D7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 16:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8A7CC85C54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 16:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGWdclbLpaii
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 16:24:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 88A6D85C32
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 16:24:57 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u19so7415280ion.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 08:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZanZ5FAiolcm64OF8Vb2XE/rK39hktnM7exQLor5Y9s=;
 b=mfRSDBwXm/38pjzqJiwZOhSyixNU9RN9XLAKH3rQ+IZVX/S+zhLs/h2f5/2uoiKdmX
 4OXEW7KjZKpdsOPKuUmXUugg2JIdXqreUdEhsJb7Xyb6c6aUmHLdSWyDI58RU4pcyuKF
 cr3arI8vcMpfPlgEQlRfv0Axud2raJA2K/i8Xahqv6AqO/xSnKbsW9sgbmve90kGfcrm
 Lnez3mgXneR5UwodXMcE5VUmD3lg47vIuovUHy3cvfbWpP/8KFtz3Rd8wOKOparElJSB
 uxv7bi6I2RQF+Utq6ZsVwN/67K2yfN6vk4GGHF+BuEQ7JQxHeWn/jfck9XKA3JWaa2Jg
 Qq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZanZ5FAiolcm64OF8Vb2XE/rK39hktnM7exQLor5Y9s=;
 b=Z+KnluViSga587i7auAqijNrUbqxEmkfYI7L4EvQv62W1fvc/1RDEKvawxRr9ioSjo
 syKzYwH7ULDFm3B8IKJRQx5/cpCMTfK174H1P30Zv33/Sr0r/HNFxTGmjYUGO49TY+ih
 4E1mBNpWUb73bBWULyIU+lcMo+nKFrkrJefTrip+RaHiu37CMXmX5OaysqqZIAiZRT6A
 55J0q+t7LBNn0w73XQcVkh74vXltMmBTVukYHWGxEshUgviWc3RCf8P/o80firK1tiog
 i7wdWcV6JUxQ8YD41MzpZcKHyRJeWpO0PeholkCWdVsjVdHLZEeXD816nCdEPGvqzIz4
 5LBw==
X-Gm-Message-State: AOAM532L8m0mxTghKGWOXIDSByruxy7GCi0F6fTmavxr0sfAzJZab+XV
 lBnmBsSsQ4ugnPCwx9wgqcFnPX7Y5muCOvxxPJI=
X-Google-Smtp-Source: ABdhPJxxUShEHKcrSchISVeEaEVz6pcGpMYJgkUPE4FcMA8v5le5CxNgY6uZ9tPxzwWDaxD/DOG9eg6V4VLc+mdmF0w=
X-Received: by 2002:a02:3716:: with SMTP id r22mr8003181jar.12.1604852696609; 
 Sun, 08 Nov 2020 08:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20201107121742.27144-1-yashsri421@gmail.com>
 <2837bf55-4bab-ffcc-843c-318c7de26ff4@gmail.com>
 <CAKXUXMxix-9oWtpbS1kAK+PY7hsNuKs7_z3GDvDyJHRadSZYNw@mail.gmail.com>
 <96a7795a-1a95-b1d7-3faa-113fb8c7d048@gmail.com>
 <alpine.DEB.2.21.2011080748070.4909@felia>
 <e5388ca7-847a-5d31-757f-2564fd1a54a2@gmail.com>
In-Reply-To: <e5388ca7-847a-5d31-757f-2564fd1a54a2@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 8 Nov 2020 16:24:46 +0100
Message-ID: <CAKXUXMxdW=MOOnSmXTpq+QWB0e58k4oNy=2Oy4kV00imzD1XQQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for COMMIT_LOG_LONG_LINE
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

On Sun, Nov 8, 2020 at 3:31 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 8/11/20 12:52 pm, Lukas Bulwahn wrote:
> >
> >
> > On Sun, 8 Nov 2020, Aditya wrote:
> >>>
> >>> Why do you not implement a proper word wrap function?
> >>>
> >>
> >> Actually, I had searched on the web regarding it before implementation.
> >> Here I have implemented text wrap only and regex is the best way I
> >> could find of implementing it. Also the same was advised at
> >> stackoverflow. I took help from the same.
> >> Link:
> >> https://stackoverflow.com/questions/956379/how-can-i-word-wrap-a-string-in-perl
> >
> > And stackoverflow is not always a good reference.
> >
> >> Apart from it, perl also provides a wrap function using module
> >> Text::Wrap, but I wasn't sure if I could use this module in my
> >> changes. So, I proceeded with regex.
> >>
> >
> > You can look into that, understand it a bit and then just implement a word
> > wrap from scratch as we would need it here in checkpatch.pl, it should not
> > be that complicated.
> >
> Okay.
>
> >>> A single commit tells us very little if this rule in checkpatch.pl really
> >>> is a good rule or not. A proper evaluation of typical cases of long commit
> >>> lines would help much more to improve this rule.
> >>>
> >>
> >> I generated a list of commit_long_long_line warnings with the line for
> >> which they are occurring at:(v4.13..v5.8)
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task6/summary.txt
> >>
> >> As I could see, most of these messages are plain english. But there
> >> are few instances of links, hex, file locations, such as:
> >>
> >
> > I see many false positive warnings; so most are cases where I would not
> > break the line.
> >
> >> 1)https://lore.kernel.org/lkml/1559767582-11081-1-git-send-email-info@metux.net/
> >>
> >
> > How about detecting all likely URLs and suggesting a proper Link: tag in
> > front of them?
> >
>
> Should we add another warning description for this one? Or while
> fixing, just prefix it with 'Link:'?
>

This should first be another warning, that is the first patch.
Then, we can create some fix option for that warning. That is a second patch.

> >> 2)  /home6/tmricht/linux-next/tools/build/Makefile.build:96: recipe
> >> for target 'libbpf.o' failed
> >>
> >> 3)   8b 35 7b fb e2 00       mov    0xe2fb7b(%rip),%esi # ffffffff82db9e64
> >> <nr_cpu_ids>
> >>
> >> I think we can use a better regex like:
> >> s/(.{1,75}|\S{76,})(?:\s[^\S\r\n]*|\Z)/$1\n/g
> >>
> >> I tested this regex with the above cases, in which
> >> 1) remains unaffected
> >> 2) gets wrapped at "..recipe for" (which is 69 chars in length)
> >> 3) gets wrapped at "# ffffffff82db9e64", which is 64 in length
> >>
> >> I guess I can generate another file with how these lines will be
> >> changed, when used with fix option.
> >> What do you think?
> >>
> >
> > I think 1, 2 and 3 should not be wrapped.
> >
> > 1) should be fixed by adding a Link: prefix
>
> Okay.
>
> > 2) should be warned to just drop the absolute path or so.
>
> We are already warning for the absolute path for this case. All these
> warnings are emitted for:
> Commit 1ce6a9fc1549 ("bpf: fix build error in libbpf with
> EXTRA_CFLAGS="-Wp, -D_FORTIFY_SOURCE=2 -O2"")
>
> I guess for (2), we can check if a line is reported by
> USE_RELATIVE_PATH, we can omit it for long line warning
>

No, we might consider a different output for tool output.

> > 2) and 3) need to detected to be tool output and hence, we accept a longer
> > line limit here.
> >
> So, we should wrap these lines after more characters? Or can we treat
> them as false positives for this warning and just avoid checking such
> lines for this class of warning?
>

We should warn at a longer line limit.

> > I also see a few tags and long commit log warnings.
> >
> > Does checkpatch.pl also warn on long tags? That should be excluded from
> > that check.
> >
> Yes, checkpatch warns currently if we use long commit logs. Eg for
> commit '47987970175 ("ASoC: Intel: create haswell folder and move
> haswell platform files in")'
>
> we get:
> WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description
> (prefer a maximum 75 chars per line)
> #13:
> commit ba57f68235cf ("ASoC: Intel: create haswell folder and move
> haswell platform files in")
>

I wrote tags. I think tag lines should not be warned about long length
(or at least for a different length).

> But probably it will be best if we can wrap these line. I feel so, as
> users tend to use these along the common english lines, and not always
> in a different line, such as:
>
> - MC-aware mode was introduced to mlxsw in commit 7b8195306694
> ("mlxsw: spectrum:
>
> for the commit f9d5b1d50840.
>
> Also I feel that wrapping it might not affect readability as well. For
> eg, I have wrapped the commit messages for my patches as well.
>
> E.g., at,
> https://lore.kernel.org/lkml/20201030114447.24199-1-yashsri421@gmail.com/
> I wrapped the 'E.g.' line which describes that I ran checkpatch.pl,
> and contains the commit message.
>
> What do you think?
>
> > Also, I noticed quite a few 'References: <git-sha> ("<git commit
> > message>")'. I think there is no standard for this yet, but maybe that is
> > worth a discussion to agree on something and then add documentation and a
> > check for that.
> >
> Thanks for pointing it out. I observed all the lines prefixed by
> 'References' and found out that they are either followed by link or
> commit log, except once ie
> "I/O hangs after resuming from suspend-to-ram"
> (https://marc.info/?l=linux-block&m=150340235201348).
> Here user is probably quoting his line and referencing it to the link
> where he might have seen it.
>
> I guess we can either avoid the line prefixed with 'References:'
> completely or selectively avoid links and treat commit logs similar to
> whatever we decide for above.
>

That is a reasonable checkpatch.pl rule and can deserve a fix option as well.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
