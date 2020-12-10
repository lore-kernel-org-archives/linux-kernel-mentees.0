Return-Path: <SRS0=t6EQ=FO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674A4C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Dec 2020 11:59:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E80F123AC4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Dec 2020 11:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E80F123AC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54AED87311;
	Thu, 10 Dec 2020 11:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfomlW8PuD2C; Thu, 10 Dec 2020 11:59:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5ECE8730D;
	Thu, 10 Dec 2020 11:59:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA26AC0FA7;
	Thu, 10 Dec 2020 11:59:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4E53C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 11:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DCD8687769
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 11:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwUvJhHgRY5i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 11:59:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 32E4887743
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 11:59:54 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id p5so5010911iln.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 03:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3GzATxlNwTHKEDsDvqZcUFGoRV9l32sHH08TzW36GyM=;
 b=h3MnqIGOLt6lRT9h0rrKE8YidpNiqZs9gRxeuPRwoqiABidd6lEHgT+eyYelITxkb2
 egZjVP/YBnvx3lzGQcte8PnM+LvhfDxuzQe3AB3lKWeOG5M1p12GIwwv64zRXmg1DQR/
 s6w3qDN68I9BsXr62XE6ba/DC9lMEqKa/IeZXOg+hwlNk1TcIxEn4Emxi7E+KkTImFnr
 aQA+xhmz36Oler3OigGdumk9hR9g4nGZtdMPzdLR/2ZPzcV4+zQij0TDfl/9L10raqed
 P+9mU0rXSPc1g/YwIVUUd6LgmYVWHEBw6L2EwK8AlLBgGABkkXx0nR1GFULYNZHZjoG3
 Gr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3GzATxlNwTHKEDsDvqZcUFGoRV9l32sHH08TzW36GyM=;
 b=SnHc1ff70koKScQ/6i0TbH3+UK0ZEE2QO0TU34LCfzgsuYNP9RnPqq6xdmEjB0JDQV
 R7ZicWWYul07qNwAwiRMrVo3bRzMzcewhmraCIov+wF4kYT6BJeEpu3ZN6qN8uiolbN8
 XAEOLIiH91OhDuJDWdwMKNO7yaH9SaUgelCYDXMSFkMsy+Do6fwlHkVrp8mgl6sBa7Wj
 CyY/eqd3Du3hz5Kh7jzvmzCB4+DiDE/1yWer56rGl/HXp2YxFfj7EESLMrKN+JRFU/nu
 jsgcampf+Jlq63s7G/pU6hIrtTwmZg33vnrywy+KKvBLC2bqI6dDLgelq12i+V2jOW0T
 j90w==
X-Gm-Message-State: AOAM531NgQP4jh4ZieiZKoIbfKNzair/0/hLngnwEHsob3Ufgy7u6CZB
 On5zILH+DfwvOPE3qTm07/DUaChNE47TTOioLNE=
X-Google-Smtp-Source: ABdhPJyIv5sNDXjgMY4uH7sQCcaY178AXh+ncIY3qAtK5WjQx9ySfrUPbzZd/yd7vpkKR8tv2wwc6W/gtlkeD3t1fmo=
X-Received: by 2002:a92:512:: with SMTP id q18mr8743759ile.147.1607601593442; 
 Thu, 10 Dec 2020 03:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20201207185747.132636-1-dwaipayanray1@gmail.com>
 <CABJPP5BcuBXZuS=eO+83h=mUrDFK3UK9m=AX3DbJx6yXv7m-PA@mail.gmail.com>
In-Reply-To: <CABJPP5BcuBXZuS=eO+83h=mUrDFK3UK9m=AX3DbJx6yXv7m-PA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 10 Dec 2020 12:59:42 +0100
Message-ID: <CAKXUXMxJvx69TJB9r4C7-hHDXpXifmfi2j_g=9+DpRyvJnqokg@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option to
	IS_ENABLED_CONFIG check
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

On Thu, Dec 10, 2020 at 12:50 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Tue, Dec 8, 2020 at 12:28 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Documentation/process/coding-style.rst specifies the use of
> > IS_ENABLED macro:
> >
> > Within code, where possible, use the IS_ENABLED macro to convert a Kconfig
> > symbol into a C boolean expression, and use it in a normal C conditional:
> >
> >         if (IS_ENABLED(CONFIG_SOMETHING)) {
> >                 ...
> >         }
> >
> > checkpatch correspondingly has a check for IS_ENABLED() without
> > CONFIG_<FOO>.
> > Add a --fix option to the check to automatically correct the argument.
> >
> > Macros like:
> >  #if IS_ENABLED(THERMAL)
> >
> > is corrected to:
> >  #if IS_ENABLED(CONFIG_THERMAL)
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 7b086d1cd6c2..751cd13622b9 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -6877,8 +6877,11 @@ sub process {
> >
> >  # check for IS_ENABLED() without CONFIG_<FOO> ($rawline for comments too)
> >                 if ($rawline =~ /\bIS_ENABLED\s*\(\s*(\w+)\s*\)/ && $1 !~ /^${CONFIG_}/) {
> > -                       WARN("IS_ENABLED_CONFIG",
> > -                            "IS_ENABLED($1) is normally used as IS_ENABLED(${CONFIG_}$1)\n" . $herecurr);
> > +                       if (WARN("IS_ENABLED_CONFIG",
> > +                                "IS_ENABLED($1) is normally used as IS_ENABLED(${CONFIG_}$1)\n" . $herecurr) &&
> > +                           $fix) {
> > +                               $fixed[$fixlinenr] =~ s/\bIS_ENABLED\s*\(\s*(\w+)\s*\)/IS_ENABLED(${CONFIG_}$1)/;
> > +                       }
> >                 }
> >
> >  # check for #if defined CONFIG_<FOO> || defined CONFIG_<FOO>_MODULE
> > --
> > 2.27.0
>
> Hi Lukas,
> You probably missed this patch.
> If you are okay with it could I send it off to LKML?
>

Yes, sure, send it to Joe and LKML.

I ran as quick rough estimation: grep -e "\sIS_ENABLED" . -R | grep -v CONFIG

I think:

./lib/crypto/chacha20poly1305-selftest.c: for (total_len =
POLY1305_DIGEST_SIZE;
IS_ENABLED(DEBUG_CHACHA20POLY1305_SLOW_CHUNK_TEST)

could be fixed, is that right?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
