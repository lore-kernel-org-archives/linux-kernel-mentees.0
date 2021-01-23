Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F419C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 10:12:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 907A322273
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 10:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 907A322273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 14F98873C3;
	Sat, 23 Jan 2021 10:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYDP-PQ0rqLq; Sat, 23 Jan 2021 10:12:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5759D87398;
	Sat, 23 Jan 2021 10:12:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E007C08A1;
	Sat, 23 Jan 2021 10:12:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4C8EC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 10:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D8FBA86B82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 10:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59n-CVFvg_sN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 10:12:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B054686B2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 10:12:04 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id h7so11059231lfc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 02:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4IbynVZnmyitd40A00Sx62f5wUwR04Yo2hURh7PeCk=;
 b=YXNbANnXatDCohtC5CTzu3W2ZrDE+KbLMwM1wdzZkweSEiFNbWhC33bdUSKqBU4/CI
 AGXKtaMW9FKPyXXX2UQJ+I5Pa9QaS4uGfei87Ree6qNUqeAtakMliw1ppshdmOJ0EAEq
 gS7m1mOWlclb9HXoODur6tT/aATMH/LIFcZofa3I6fQGm/V2tAk1NoqmA/i/fV6Eu37E
 jvqg376Uq25iynoT9XT+qkGfSNjoV9R+OLARutzd2E/kJy0GQuYOHNVtxlUy6SG9t+eT
 OFbfT5cs7+BuvvPP91pfhzvr4gO/a6Rx4f4BV0J1h8GTCVohoebIZWuhatbq5Cz6WfhR
 VPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4IbynVZnmyitd40A00Sx62f5wUwR04Yo2hURh7PeCk=;
 b=AtRZRPBWPgWMIqLPFmmcfNU0Sl5kJ3U0PazltvnPalCZuV8Qd4rVe1+6CwW8zRmp5C
 v1jXbX1bt4dciI9ODzTm8eVDErY8fQhxkUlRUZ0sIOqWPa9xvAkie2wkB7G5Rrb7Ruvp
 frs2WdHrCPJatdvfvos9yUSD2z8gQRmZaP4dvSUnyQ1D2jZxFhibHij9u1n/SsbJ8WLW
 Iz/R0fWNx5r3TVHv/DTW1UcY/8rUB/64uhAXHTK/DsZjNJWvuumn9MMb/3E19RjRZpOL
 ZKY5a5BQXvgoppuO9rzhjt3UnaXdEjwBH1Hjqu408TeAueBGHioA+1Ya+aiPm8MaEFCx
 st+A==
X-Gm-Message-State: AOAM533XKt/V5CyCNUQcUqiE36jSe9yxKBtNmdm32oh2h/GrQzvAYDp1
 JeKKRZ61hw33U9D+IpiOSLqPnV2jwTHLD1GzgPc=
X-Google-Smtp-Source: ABdhPJwsBmCdKbAPp1VsNx4P2o4hD6QAyNUgUZl3drTYdB0PzsQ89IIhfOsAFcvzmq/VednVHrgNqgZlxfacz8AQvVk=
X-Received: by 2002:a19:240a:: with SMTP id k10mr104997lfk.442.1611396722676; 
 Sat, 23 Jan 2021 02:12:02 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5DZH0=kr6JaE0wv4iC+pq-9YG=SLPE_15jiQ1YnW1_1rg@mail.gmail.com>
 <CAKXUXMz06TQmbeeugD0F0n6+ESYM6bNOi2oVw4Q7d_8qBh3D+w@mail.gmail.com>
In-Reply-To: <CAKXUXMz06TQmbeeugD0F0n6+ESYM6bNOi2oVw4Q7d_8qBh3D+w@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 23 Jan 2021 15:41:58 +0530
Message-ID: <CABJPP5BXmrpc=q3t3_K1zwBjhSAfOMd=4OOQ1t-wfxP53RR1Mg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Addition of verbose mode to checkpatch
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

On Sat, Jan 23, 2021 at 8:44 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Fri, Jan 22, 2021 at 10:27 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Hi Lukas and all,
> > Recently while going through the warnings emitted by checkpatch,
> > the necessity of a verbose mode came up once again. Joe had
> > already suggested that a verbose mode would probably be worked
> > on.
> >
> > As for how that could be done, that leaves us at a couple of options.
> > Since writing verbose messages for all warnings aren't possible at once,
> > there can be an optional extension when emitting messages:
> >
> > Currently, a warning can be emitted by
> > WARN("TYPE", "Message")
> > which could be converted to say:
> > WARN('TYPE", "Message", "Verbose")
> >
> > Another way is to leave the original warning emitting syntax intact
> > and instead go for a dictionary for verbose messages:
> > our %dict = (
> > "TYPE1" => "Verbose",
> > "TYPE2" => "Verbose"
> > ...);
> >
> > Although this leaves us the ability to customize the verbose output
> > for each warning of a particular type.
> >
> > Which do you think would be best? Certainly more options might be
> > possible, so any new inputs will be nice as well!
> >
>
> I think any of the two approaches would work.
>
> But how about a completely different approach?
>
> The verbose message is really an explanation of why kernel developers
> think this rule should be followed (what is the history, what does it
> try to warn about, what are possible fixes, what are accepted
> deviations, ...).
>
> So, this should not be placed into the checkpatch.pl script itself,
> but into Documentation.
>
> checkpatch.pl would simply quickly parse the Documentation and present
> the content for the specific rules that were violated.
>
> Let's say this Documentation is in
> ./Documentation/tools/checkpatch.rst, and they contain subsections
> with labels/name with the TYPE identifier. Then when a warning of TYPE
> is relevant for a specific patch, you print the description from that
> one subsection.
>
> In checkpatch itself, you would only need a very generic mechanism then.
>

That sounds great to me!
Even I had it in mind but thought maybe checkpatch could be less
reliant on other
files. But this also solves our purpose for an external documentation
for checkpatch
rules, so its a kinda win win situation.

I think maybe we will need a special structure for the documentation file itself
but its certainly doable.

Do you think I should go on to propose this idea to Joe now?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
