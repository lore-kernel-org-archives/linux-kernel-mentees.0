Return-Path: <SRS0=iE2U=IX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41035C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 06:24:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A79619D5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 06:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8A79619D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF81605F7;
	Thu, 25 Mar 2021 06:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTCmQiNcVmF9; Thu, 25 Mar 2021 06:24:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63446605CB;
	Thu, 25 Mar 2021 06:24:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 494AAC000E;
	Thu, 25 Mar 2021 06:24:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4D3CC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 06:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD5C1605F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 06:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id goHRlvBSPpcd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 06:24:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57CE7605CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 06:24:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id n138so863204lfa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Mar 2021 23:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZZFHYgsE5soGvNOYYoIzbuY4BSiGg4UOpKtWDpocKW8=;
 b=uq21yL/SGM9BYBXzPPvgEhf5KWd4IgzPdKBuY2SliqWOvUiHlQ5FX4MIW4U5/pExkj
 RKxQlfyumzdV13mM34NIDbZNr/xc/1YbRwEW1RxFZKd9NkPv6EPfKtmtNALBOQXvdaat
 vB4hGw5u8QmYEWdIlCzotLMW3SS1pCVsaQQcJ/lcn44TFLYy4HfAyz/CbtxjlnrnIp5k
 6jdWfUsmQCbmETk72iMWF0Sc1bCqmxCKpZBlj3mKM8job5LPw23ZguEesAA1qMnPNlbJ
 SLe19+L6bl0g02EPS4XM41DPiY3J9OGGdtdZBA9BZALw0IGHKfgX5HmCWcE4Ucbze922
 kM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZFHYgsE5soGvNOYYoIzbuY4BSiGg4UOpKtWDpocKW8=;
 b=tyfccuzNklMf1dinopSMr4W6dTeLEfW8NYySM9Tg1DP2Cv2QCTJLhGg+w0DUxOnJhh
 SfOUqXRBXkgn2aYuCwhlc2sI+/9IkZCfxHbd3po5C8Hz6kG5mTiPUh+Bvr4oO0UlvoaO
 Pf2XtPd0Bapyf8eu9uCfBVdI1jj6KJAWPB4UR0EG307Czi6IsfqBWNW0HxbguHrLH//U
 rT4tZWcLLA+m5f4qJDYqo54VOt2jMgZ+i6he+s1acUHtQJCIdire4+Rwl/3SH8txwPvZ
 Ms0lRlJLnrSlF+oyhxF2LCKegXMFsLRZjAd86loODNOerHKQrVvB4xU7/5CItMJzix8t
 K0xA==
X-Gm-Message-State: AOAM533mAaAD6arMjvSRkv7MsNRkHIB+ZVzBZ9Ya+KLRtPuBtJPCANP/
 nqrjxy0x+h9yH96Qy34CTXs2YC3Mbs9N1yOl6yQ=
X-Google-Smtp-Source: ABdhPJyZZNkTsApS4xpQXIuXEFd4eGd2/GJJcmvpqkfWAt+Q4ytUTM988bpMAoUUi11nLyIyrBxuUeXLpztXw+mRsKE=
X-Received: by 2002:a19:b49:: with SMTP id 70mr4237028lfl.342.1616653442022;
 Wed, 24 Mar 2021 23:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5Amu7dr=i1moc4eK2+WEhQky5V5HsweiOPzxaxGTitZdg@mail.gmail.com>
 <CAKXUXMwiFQc+A0A+FCu7c1_i3EW_CezRv_0oNu=9Fm8SMbhxnw@mail.gmail.com>
 <CABJPP5CoSQV93h+hCMae=b6aaDK4WrphRALx_drw5mm8UF2OjQ@mail.gmail.com>
In-Reply-To: <CABJPP5CoSQV93h+hCMae=b6aaDK4WrphRALx_drw5mm8UF2OjQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 25 Mar 2021 11:53:51 +0530
Message-ID: <CABJPP5DNzVZBxK6h1aKNLbOKgxRRuDw7U33zV7_oATV+t98PnA@mail.gmail.com>
Subject: Re: Mentorship report first draft
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

> Thanks for the review Lukas. I will be making the necessary changes.
>

Hello,
Please see the updated document below.
If you feel it's fine then maybe we can proceed with this.

-----------------
## Checkpatch - What is it?
[checkpatch.pl](https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl)
is a trivial style checker for patches sent to the linux kernel.

Why is it needed you say?</br>
I did an analysis on checkpatch warnings on about 50k commits from v5.4.</br>
(Find the full report {{% link checkpatch_out_50k.txt %}}here{{% /link %}})

The top errors were then generated via the following shell command:
```/bin/bash
cat checkpatch_out_50k.txt | grep -oP "(?:WARNING|ERROR|CHECK):(\w+)" \
| sort | uniq -c | sort -nr  | head -n6
```

Count of errors | Error Types | Error
----------------|-------------|------
41999 | <span style="color:green">CHECK</span> | CAMELCASE
13629 | <span style="color:green">CHECK</span> | PARENTHESIS_ALIGNMENT
11491 | <span style="color:orange">WARNING</span> | LONG_LINE
8106 | <span style="color:green">CHECK</span> | SPACING
6825 | <span style="color:orange">WARNING</span> | LEADING_SPACE
4394 | <span style="color:green">CHECK</span> | OPEN_ENDED_LINE

As we can see, the number of stylistically incorrect bits still continue
to exist and are still merged into the kernel code. To make the kernel
code more stylistically coherent, we can:

> - Create cleanup patches for the existing code
> - Make sure new patches are stylistically consistent

Both of these are where checkpatch comes handy.

## Checkpatch in the patch submission process

Before sending out the patches to the mailing list, it is recommended to
run checkpatch over the patches.

In general, a Kernel developer would:

> - Create the patch with his proposed changes.
> - Build check the patch and lookout for compiler warnings.
> - Run additional tools such as sparse, KASAN, etc.
> - Run checkpatch.pl over the patches to eliminate all trivial style violations.
> - Send out the patch to the maintainers and mailing list.


It is to be noted that checkpatch is not always right. And at times the
author's judgement should take precedence over checkpatch.

## Drawbacks of checkpatch

Checkpatch is only a static trivial style checker. It does not have the
capabilities of a tool using a full-fledged C parser, such as
[clang-format](https://www.kernel.org/doc/html/latest/process/clang-format.html)
. In this sense it is limited in what it can do.

Still, it is highly valuable as a style checker tool and can ease the
work of maintainers and increase the chances of the patch being
accepted by the community.

## What did we do to improve it?

Over the first three months of my mentorship period, I primarily focused on
eliminating false-positives from checkpatch as well as adding new rules.

Consider the following patch commit log:

```diff
#include asm/bitsperlong.h avoid further potential userspace pollution
by moving the #define of SHIFT_PER_LONG to bitops.h which is not
exported to userspace.
```

A kernel developer in 2020 would not see any checkpatch warning.

A kernel developer in 2021 would see the following warning:
```\bin\bash
WARNING: Commit log lines starting with '#' are dropped by git as comments
#82:
#include asm/bitsperlong.h avoid further potential userspace pollution
```

During the last three months I worked on two major features:

> - Addition of a verbose mode to checkpatch
> - Addition of an external documentation to checkpatch

For the documentation we decided to document all checkpatch message types,
their meanings and how to resolve them. This is still a work in progress.
Contributions are definitely welcome.

### Verbose Mode

This was one of the new additions we did to checkpatch.

One can run checkpatch like this:

```/bin/bash
./scripts/checkpatch.pl -v test.patch
```

All verbose descriptions can be seen by pairing the verbose option
with --list-types:

```/bin/bash
./scripts/checkpatch.pl --list-types -v
```

### Checkpatch Documentation

The checkpatch documentation is at `Documentation/dev-tools/checkpatch.rst`
in the kernel repository.

To build the documentation make sure you have configured sphynx
either in the system or in a python virtualenv. Next the kernel
doc can be built using:

```/bin/bash
make htmldocs
```

## How to contribute to the documentation?

The documentation is still a work in progress. Feel free to send
the patches to the kernel-doc mailing list, and add me
(Dwaipayan Ray <dwaipayanray1@gmail.com>) and Lukas (Lukas Bulwahn
<lukas/bulwahn@gmail.com>)
for reviewing it.

The documentation is written in rst syntax. Refer
[here](http://openalea.gforge.inria.fr/doc/openalea/doc/_build/html/source/sphinx/rest_syntax.html)
for a quick guide.

Before sending out the patch, please always:

> - checkpatch.pl your changes
> - build check your patch (in this case check the generated html docs)
> - spell check your patch (this can be easily done through checkpatch
>   using --codespell flag if you already have the codespell dictionary)

## Acknowledgements

During my mentorship period I learned a lot from my mentors.
I would like to thank Lukas for his constant support as my mentor,
Joe for his guidance with checkpatch and everyone in the community for being
such amazing people.

The kernel contribution process may look old but it works. At the beginning
when I started sending my initial patches, it looked like a tiring and
unnecessary process. I was more accustomed to creating pull requests rather
than sending patches over mail.

Slowly I found out that scripts like get_maintainer.pl actually lets you easily
find the people associated with that particular code. After finding those
people it's very easy to send the patches to the list and the associated
people. This follows a period of extensive review which is very useful for
having good code. I have got lots of reviews from people in the community
and those patches are successfully merged into the mainline.

So I was really amazed by the process. What is even more amazing is that the
newcomers won't get lost in this extensive process. There are always
people who help and encourage others to create good patches. And that
makes me glad to say that I too am a part of this community.

-------------------

Thanks!
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
