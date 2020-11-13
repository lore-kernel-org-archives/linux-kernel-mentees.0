Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBC8C55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:26:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C2A320691
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggsvuhyy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C2A320691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79273874F4;
	Fri, 13 Nov 2020 15:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iinTmHXLEW52; Fri, 13 Nov 2020 15:26:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DAC11871D3;
	Fri, 13 Nov 2020 15:26:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D273EC088E;
	Fri, 13 Nov 2020 15:26:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B97BC0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 063E4871B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwRijLXKgigU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:26:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 56C29871A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:26:21 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id m13so10113092ioq.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 07:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K/1SrsZ6evejqjPyArdyNB0ZoEeBGqvJB4zjbEzzBQQ=;
 b=ggsvuhyyi8qR3vuNdER9BI5OYxhOBxzFaj5SrWzRxA0IuN2c4HiS4JASBZs6CYaiHY
 Q7qK7zi8EaHArc5CkPpA4nCpw0uiN4f3biUsDn0Uj6V2Ify/tJC/a2F7nK/EPuDVgT97
 GgpQT2CvXwSK0XCsdNRTzM2mHsAZxo5KEAIV9nHbq9oC2j7tBSNocUXGIfItrr6MqCkp
 aKwnJfu6LoRWn9lvy8OvIa9MX7HGaH/Ze7bS6RzLzV/Fd6Ig68wtsAjXQQV1a81pbH7E
 FawvBlZpU7RDgLDWd+WSUa1YI3J42GY6v+ie+IH4suRLtVYGVEzvZucNLmEtIsMHFwKR
 WdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/1SrsZ6evejqjPyArdyNB0ZoEeBGqvJB4zjbEzzBQQ=;
 b=ty1OZK7Ik3nEOoE0dlr6o6IqdA54JKQy6JLCpXM87qAC5MKa2dUtxX6WV4CSLYiJ5J
 NnnH/prkPFlfyNO5aFS0QYLO35G9pEl9NiNqhtg4wwwFVihjBATj3EJ9L67TZyZmFMNP
 Nt0szG7PCaHuOZ028+/+1RdMJ7yqvLShOGaJeZT/VpTPA288po1xidnSJwDBfJAfr3Ru
 ZM2pV8JMtl/JsSoFSfp3ILTBTDTeZ8RuQYwGVS2ZGKSvxfDw84ihXtMbnOOlQnZQNc4W
 noiVu9O/HnOLJ3M2v7zOBBoZkpAcnGaq9+Z364++uTUNW9rwrzwUo+qbjoNi3AlVdSv3
 LkMw==
X-Gm-Message-State: AOAM533udN+yAfwAPgFgt+5pG0rT+MCrOS8jSFOmKY5MGrQdMC6S+6Nk
 d0dYMt0pFx+a8wg83mTcha1wW1h31nzeVo3tpk8=
X-Google-Smtp-Source: ABdhPJyn+7YEXLRxJnPDTDWOnxqcK/G02EklRhaWBSFOVBpYsvCMn89oalpwDJnNzg8odzwc6sk2NvZGfGQWqxHp6xc=
X-Received: by 2002:a05:6638:124d:: with SMTP id
 o13mr2350194jas.98.1605281175587; 
 Fri, 13 Nov 2020 07:26:15 -0800 (PST)
MIME-Version: 1.0
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
 <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
In-Reply-To: <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 13 Nov 2020 16:26:09 +0100
Message-ID: <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fix for BAD_SIGN_OFF: non-standard
	signature
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

On Fri, Nov 13, 2020 at 4:00 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 13/11/20 8:05 pm, Aditya wrote:
> > On 12/11/20 1:34 am, Lukas Bulwahn wrote:
> >> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
> >>>
> >>> Hi Sir
> >>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
> >>> v4.13..v5.8) for non-standard signature and generated reports for it.
> >>> Some mistakes are more frequent than others, whereas some mistakes
> >>> even have a frequency of 1.
> >>>
> >>> Non-standard signatures occurring with their frequency:
> >>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
> >>>
> >>> Complete warning messages:
> >>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
> >>>
> >>> Should I implement the fix similar to TYPO_FIX, where we have a
> >>> separate file for common misspellings and corrected words? Or should I
> >>> make a hash of these misspellings in checkpatch.pl file as well?
> >>>
> >>> Also should I include all these misspelled words in it? Or omit words
> >>> below certain frequency?
> >>>
> >>
> >> I think the best way would be to compute some kind of edit distance to
> >> the known signature tags and if this edit distance is below a certain
> >> threshold, suggest that signature tag as the fix. We can then evaluate
> >> to determine the best suitable threshold. The edit distance between
> >> the different tags are so large that this should always work as
> >> intended.
> >>
> >> Then, we can look into these other creative tags and propose suitable
> >> existing tags for the more frequent ones that are non-standard. Or in
> >> the case, none of the existing ones fit we can start the discussion on
> >> proposing some new standard ones.
> >>
> >
> > I have generated a list of non-standard signatures and their fixes on
> > the basis of edit distance.
> >
> > This is the common list of non standard signatures and fixes (in
> > detail):
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt
> >
> > As I observed, I think, we can consider '<=2' as the threshold edit
> > distance.
> > List for non-standard signature and their proposed fix with edit
> > distance<=2 :
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt
> >
> > I have also generated lists for 3 and 4 edit distance separately for
> > reference:
> > Equal to 3:
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt
> >
> > Equal to 4:
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt
> >
> > For the rest I guess we'll need to hard code eg. for 'Debugged-by',
> > 'Requested-by' etc.
> >
> > These are the complete lists of non-standard signatures:
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
> >

Can you share which non-standard-signatures would be
handled/transformed with edit distance 2 and which would not in a
similar format to non_standard_signs.txt (so, ordered by frequency).

We can then consider those that remain and find a good next strategy
for the most frequent non-standard signatures.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
