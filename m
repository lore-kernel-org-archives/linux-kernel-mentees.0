Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54D3C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:22:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49CDE22518
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49CDE22518
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA3CC87946;
	Fri,  4 Dec 2020 10:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRugAWqKbmx1; Fri,  4 Dec 2020 10:22:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 23B1B87205;
	Fri,  4 Dec 2020 10:22:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F07DC0FA8;
	Fri,  4 Dec 2020 10:22:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C7CBC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5AE2987946
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6g2jQViwWIp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:22:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AAE9887205
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:22:48 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id x15so4745394ilq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UDSCi9HnwMnZ/AnkETBHNm+gN4z7rvXAQJY03CBe6oE=;
 b=YvtbEU/ilLwnnI8dzak17LijBt+pJBUa0GC6P6HaNCHVgAYzAe3xUo4Sf0myefFXgk
 CYDG7rCksSO/LGZQ90HOC+OKB+QD72eaYQEZpQdZHp9GD8s+gfYBAdfUbndaWiFliKhv
 iNZlyLvqVn8ivrd/KWOvppskDAaoT5YkIvm/y9UQLr648jl2KJ0jePM/9IcJhlCkJEtx
 /vC+pCqN5uPSafIjS+uqmvO7QMfRK9+PHufkcMf1h33BdWui9zjeLKz3riI2BCoTtSqF
 F63Y5yLIAJx+a8OhY9+W14n9tcY4wUu5+gaw3EbUe3OXDKrnWUdKz7mByopkT811aSfP
 p0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDSCi9HnwMnZ/AnkETBHNm+gN4z7rvXAQJY03CBe6oE=;
 b=PMum0BY9defrfKR6AVBvuOIPfQ79TtTOErtrgD5AuxSinaSh75Zj5IJxiUk6BuDMB9
 ej7ZRcIe0VohuqMRZFct26sZMYrFVKzQXLFLzCvn7riesiyeqV1/1eJhC01b8mbMM/Tq
 NL//ojSFQ9BeY4owF9B7d5xoyttwelQk9YkaA5+HJ/VXgVbiR8n4nwSY6kZCb0erCABR
 yNG8DJdbKRRJit3YiFG+W7FhvdG2NUdHfPwf01GHd6iv5MzKFGnKaHkidZ63Iov0xl/H
 qTqbncxHIpI9ReFzoZYADNjgC6nINx2o/BNaC/UG04QO7qqFCY+mFviqvVlTpDTbcHLa
 zYeQ==
X-Gm-Message-State: AOAM531xc6fTAjvz+1FI9kB5mv0GK2cpRmJEHtSTjJL9BIDycPhu9TAL
 FmcWTpfg2us42hBwVrim3qDqPzbw+qqlyKGv9/I=
X-Google-Smtp-Source: ABdhPJwYMOYuirVbud1zRyniUzV/nObKAWmuGNV4b2VMVb35woGXGFNLi9uFCYqbT3gB6yHaX188bYZZVNAGBVLRMMY=
X-Received: by 2002:a92:600e:: with SMTP id u14mr5530767ilb.221.1607077367736; 
 Fri, 04 Dec 2020 02:22:47 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMz71tNsU-vLUtqYNiYEji48hF2EdLhdq+qvPy6Mr1sroA@mail.gmail.com>
 <20201120101254.17712-1-yashsri421@gmail.com>
 <88ca7da2-9204-e061-7b67-1128a16a7852@gmail.com>
 <CAKXUXMy2J6+RSZ1oesVAD_9+fXpCUF8ANRfpmq486_zw+Mrhpg@mail.gmail.com>
 <1c775585-9097-d596-61b2-ec989130685d@gmail.com>
In-Reply-To: <1c775585-9097-d596-61b2-ec989130685d@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 4 Dec 2020 11:22:37 +0100
Message-ID: <CAKXUXMzMq5OemsznzQqVB6wHWMqBFrejDnSU3iznnnF_Jesgrg@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: MAINTAINERS: add
	information about parse-maintainers.pl
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

On Sat, Nov 21, 2020 at 1:59 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 21/11/20 3:27 pm, Lukas Bulwahn wrote:
> > On Fri, Nov 20, 2020 at 11:16 AM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 20/11/20 3:42 pm, Aditya Srivastava wrote:
> >>> parse-maintainers.pl is a script which can be used to automatically
> >>> order the contents of MAINTAINERS file in preferred order (i.e.
> >>> 'MRLSWQBCPTFXNK').
> >>>
> >>> But currently we don't have a documentation on it.
> >>>
> >>> Add documentation regarding the same in MAINTAINERS file.
> >>>
> >>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >>> ---
> >>> the patch applies perfectly on latest next-20201119
> >>>
> >>>  MAINTAINERS | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 5db753fa1295..7ad00af7acd4 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -136,6 +136,9 @@ Descriptions of section entries and preferred order
> >>>             printk, pr_info or pr_err
> >>>          One regex pattern per line.  Multiple K: lines acceptable.
> >>>
> >>> +This order can be generated automatically for you using
> >>> +``scripts/parse-maintainers.pl``.
> >>> +
> >>>  Maintainers List
> >>>  ----------------
> >>>
> >>>
> >>
> >> Rationale for my changes:
> >> I did not go into much detail of its working here.
> >> A bit detail on this can be to use 'scripts/parse-maintainers
> >> --sorted' which produces the sorted file in MAINTAINERS.new by
> >> default. The input and output default files can be changed using
> >> '--input' and '--output' options. However, here I have omitted these
> >> details as running with '--help' option already provides this
> >> information in detail.
> >> So just making user aware of the script should serve our purpose.
> >>
> >> What do you think?
> >>
> >
> > It makes sense not to put that into MAINTAINERS.
> >
> > Do you understand how to use ./scripts/parse-maintainers, though?
> >
> Yes. From what I have understood, parse-maintainers.pl orders the
> maintainers lists in ASCII order.
>
> So, the list for '3C59X NETWORK DRIVER' will be displayed before
> '3CR990 NETWORK DRIVER'.
>
> It further orders the entries inside every list in this alphabetical
> order: 'MRLSWQBCPTFXNK'.
>
> > So if the warning with checkpatch is shown on a patch, what would you
> > need to execute to get a corrected patch?
> >
>
> We can directly use this command 'scripts/parse-maintainers.pl
> --output="MAINTAINERS" --order' to replace the MAINTAINERS with the
> correct order.
> However, I wouldn't recommend going for it. This is so because:
> 1) The MAINTAINERS file at that time might not be ordered properly for
> all the different lists in it or among each other. This will result
> into producing more numbers of changed lines as desired.
>
> For eg, currently MAINTAINERS is not ordered properly. Running
> parse-maintainers.pl on it results in placing 'DELL WMI NOTIFICATIONS
> DRIVER' before 'DELL WMI SYSMAN DRIVER' and so on. (producing changes
> with 112 Removals and 113 Additions, for simple ordering)
>
> However if we are sure that these misplaced orders should not be
> placed in that way, we can add a warning and fix for this too ie for
> mutual ASCII ordering of the lists.
> But this might need the list to be ordered once, otherwise for any
> further changes to MAINTAINERS, it will emit this warning.
>
> The best option currently though might be to use
> 'scripts/parse-maintainers.pl --order'. This creates a new
> MAINTAINERS.new file, without harming our 'MAINTAINERS' file.
> Now, one can check if their entries are correct manually and fix it
> accordingly.
> However, we can maybe automate this (as I think) by:
> Read MAINTAINERS.new and store these lists entries as hashes and
> replace it somehow (maybe using line numbers) in MAINTAINERS with the
> sorted one.
>
> > So if the warning with checkpatch is shown on a patch, what would ou
> > you need to execute to get a corrected patch?
>
> Again coming to this question, I don't think we can modify the patch
> alone, as the line numbers and other informations in the diff
> generated may change drastically. So, I think the user should probably
> consider making changes in MAINTAINERS itself and then creating patch.
>
> What do you think?
>

Yes, but we need to provide some help on how to do that... I have no
clue and there is no documentation :)

So, let us assume I create a patch where checkpatch warns I broke MAINTAINERS.

Which steps do I need to do? Can we---for the sake of common
understanding and making the workflow work smoothly---go together the
steps that need to be done?

I guess step 1, you create a quick patch that modifies a MAINTAINERS
section to be wrongly ordered, and send it to me to run checkpatch.pl
and apply it on my latest linux-next tree...

Lukas

> Thanks
> Aditya
>
> > Lukas
> >
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
