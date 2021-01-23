Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1375DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 14:11:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C3722CA1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 14:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C3722CA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2569B87387;
	Sat, 23 Jan 2021 14:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rf3TvpY88qEP; Sat, 23 Jan 2021 14:11:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61F1587379;
	Sat, 23 Jan 2021 14:11:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55B7CC08A1;
	Sat, 23 Jan 2021 14:11:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E4F6C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 14:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1DD1C2E0F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 14:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Blu7PDKjL057
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 14:11:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by silver.osuosl.org (Postfix) with ESMTPS id B59C220457
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 14:11:08 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id v67so11567197lfa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 06:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0WSgeBDZs/4gxhFMZhh35/jOarsT1uJ6N2rAbqkkKM=;
 b=Zx9PtFwvG4xMYTFDdwD72CxUq1aVGlVlSjClUAdtInjXu7BjQZufXv6CnWroo/nLl3
 k9hLwB6D5m3lsRe+SH6RvPinKyWTUjf+F77OZzuIE8oUysvPn8f5DeB0clXKstJgTY6T
 ei0wqdf3dgazxN52Zu8SQ8/C6Wvf7VnKbBJtvXw+vZn+J48bysgGIWuiCe25uiKOIIPx
 DNij/4cwd8eXDkH5K18rgrGp4o0bDEpjgnwy/HFHxrHXLlIzdXMjBeM8OKlIOCyVLt8K
 6R+y+Our3/Sp4edCH/fqDTtlPDXlKjyOc20sQtnM48daEG8gQLuP1918r1a1FTFiZWp2
 mSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0WSgeBDZs/4gxhFMZhh35/jOarsT1uJ6N2rAbqkkKM=;
 b=U5kYz/BV7hKT/lwRR/CrOnQg/2pmAZB/rLe7+9LZTuK74Cn6qyjfAiBN/NzKFsouAa
 pHDeRffcfMc4vUZwu2IFh8ffLNAJtGhsAquGKhyvvGg6qiy2lGt+inNQtjwZQIzhgA9N
 Bq4FNPq4+yFfCr+wK5ZXXEjVvrT8mUlXnk/Nm6N++wKoETvEzkKJYDCMpLbNdL8r7iiI
 6AXw5h0Of+RifYMAggF1ZM+gRM8q9sd+PJhl0XBwg0L06ghZzlOlaIgRMFQnDp3HkIyN
 CIT2usZ1AC/xXH1DGzRUFZYFShATneGvW2xhZsAIC/EHYA6m9rhw49dXn/VS/HksxSGt
 dgYQ==
X-Gm-Message-State: AOAM531EZrPZ1AqqCxZhu893rHDTlX8EvSs8Ae8qYEWRftZTbagPFDfz
 Eii07BS0uG2S76YOHN+1DZCfcEnvVamgeVr4tnA=
X-Google-Smtp-Source: ABdhPJyYah5/SxaZ5d2ZL9vAVUnIB+W4uwlZHa1cPNdCa3t89SDOvLwipzS2nkn0GWAmTxCMUPwGcHxm00SuhGttZq8=
X-Received: by 2002:a19:6447:: with SMTP id b7mr468682lfj.206.1611411066607;
 Sat, 23 Jan 2021 06:11:06 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5DZH0=kr6JaE0wv4iC+pq-9YG=SLPE_15jiQ1YnW1_1rg@mail.gmail.com>
 <CAKXUXMz06TQmbeeugD0F0n6+ESYM6bNOi2oVw4Q7d_8qBh3D+w@mail.gmail.com>
 <CABJPP5BXmrpc=q3t3_K1zwBjhSAfOMd=4OOQ1t-wfxP53RR1Mg@mail.gmail.com>
 <CAKXUXMy532KTuzfE09dJ_Yi4JUV3ZR5cyj-zapkaysFtgN=saw@mail.gmail.com>
In-Reply-To: <CAKXUXMy532KTuzfE09dJ_Yi4JUV3ZR5cyj-zapkaysFtgN=saw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 23 Jan 2021 19:41:02 +0530
Message-ID: <CABJPP5B+bP6iVvSV9WoaF-kai5aOmi5K_toszFqAkjrmWp+emw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>
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

On Sat, Jan 23, 2021 at 6:16 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Sounds good to me.
>
> Dwaipayan Ray <dwaipayanray1@gmail.com> schrieb am Sa., 23. Jan. 2021, 11:12:
>>
>> On Sat, Jan 23, 2021 at 8:44 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>> >
>> > On Fri, Jan 22, 2021 at 10:27 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>> > >
>> > > Hi Lukas and all,
>> > > Recently while going through the warnings emitted by checkpatch,
>> > > the necessity of a verbose mode came up once again. Joe had
>> > > already suggested that a verbose mode would probably be worked
>> > > on.
>> > >
>> > > As for how that could be done, that leaves us at a couple of options.
>> > > Since writing verbose messages for all warnings aren't possible at once,
>> > > there can be an optional extension when emitting messages:
>> > >
>> > > Currently, a warning can be emitted by
>> > > WARN("TYPE", "Message")
>> > > which could be converted to say:
>> > > WARN('TYPE", "Message", "Verbose")
>> > >
>> > > Another way is to leave the original warning emitting syntax intact
>> > > and instead go for a dictionary for verbose messages:
>> > > our %dict = (
>> > > "TYPE1" => "Verbose",
>> > > "TYPE2" => "Verbose"
>> > > ...);
>> > >
>> > > Although this leaves us the ability to customize the verbose output
>> > > for each warning of a particular type.
>> > >
>> > > Which do you think would be best? Certainly more options might be
>> > > possible, so any new inputs will be nice as well!
>> > >
>> >
>> > I think any of the two approaches would work.
>> >
>> > But how about a completely different approach?
>> >
>> > The verbose message is really an explanation of why kernel developers
>> > think this rule should be followed (what is the history, what does it
>> > try to warn about, what are possible fixes, what are accepted
>> > deviations, ...).
>> >
>> > So, this should not be placed into the checkpatch.pl script itself,
>> > but into Documentation.
>> >
>> > checkpatch.pl would simply quickly parse the Documentation and present
>> > the content for the specific rules that were violated.
>> >
>> > Let's say this Documentation is in
>> > ./Documentation/tools/checkpatch.rst, and they contain subsections
>> > with labels/name with the TYPE identifier. Then when a warning of TYPE
>> > is relevant for a specific patch, you print the description from that
>> > one subsection.
>> >
>> > In checkpatch itself, you would only need a very generic mechanism then.
>> >
>>
>> That sounds great to me!
>> Even I had it in mind but thought maybe checkpatch could be less
>> reliant on other
>> files. But this also solves our purpose for an external documentation
>> for checkpatch
>> rules, so its a kinda win win situation.
>>
>> I think maybe we will need a special structure for the documentation file itself
>> but its certainly doable.
>>
>> Do you think I should go on to propose this idea to Joe now?
>>

Hey Joe!
We came across some ideas for a verbose mode in checkpatch. Two basic
ideas were to modify the warning emitting syntax to include an optional
verbose text, say WARN("TYPE", "MESSAGE", "VERBOSE_MSG"), and
another was adding a dictionary of some sorts which contained the verbose
description of the types.

But the most interesting idea here is to use an external documentation file,
say Documentation/tools/checkpatch.rst which can be parsed by checkpatch
and consecutively displays the verbose messages while emitting warnings.
This serves two purposes:
o Adding the verbose mode
o Adding an external documentation for checkpatch

Is this idea acceptable to you?

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
