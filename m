Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725DBC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 18:49:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E018F22260
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 18:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmeUWocI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E018F22260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6FAA82042B;
	Sun, 25 Oct 2020 18:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZgJ90tlCqSy; Sun, 25 Oct 2020 18:49:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9963820423;
	Sun, 25 Oct 2020 18:49:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B867C0893;
	Sun, 25 Oct 2020 18:49:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 918E9C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 86123871E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHRNJgnG9dZY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:49:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1149D871E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 18:49:11 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j21so1032189ota.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 11:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LSg549qy70Mq7dxJx8/6H70bAuT8V5694im40uZ0SNs=;
 b=WmeUWocI/jqPKq73+rYbo+xz2qdR0hRyoH4pjmzU9LtqMXqYYWenX11WTMuk5zQSzO
 U4+RTBdGoKLpecF3Cl5qICawY1f/84Tizup3ZyMgxTph0ryPQvnEQDPtB6+k+aCLfuR+
 A6keO3DgOhi5kMbVvA8psDTdZd6YD5pvAt8HTkQTfwijdM6fzH5MNAtFMUa07FmhbUXD
 HRSRlEM5yqQUu228lqFff3z67Nm5VRnzpawKbKSIe0sd0ip/ouSUtv7wH5AQE2OssiIt
 +AvR/01/R4DASlEWqdFyoWJO5vKpKHqxz+ShW6A7gXXcdNZ8kXwaJ3kMyIj22Xb+WbgG
 4aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LSg549qy70Mq7dxJx8/6H70bAuT8V5694im40uZ0SNs=;
 b=Euum8aykJum5c/4nzZgZgGOJb1Pjoky+DKspUTpv1zeCoXc1V3fctdDcnvC/vwxhqP
 eKX0M4JI6TH6qK23vYGNOg6PiktL3d3bKzlgddGZLe1UIggbGqBl8HyyJJcGctHo9RLU
 u+5Q95aUXpRdTise29Mh3xyG+yV7Za4V66s4p+6N+N9Iz48l/dOC17AZjA9AkFlsPww/
 dugvdHvVwsWnLJ+aMpF7IfGVWFFT5/Be2ybh47RdWSgG4+jvW2/jqioqY9oqn/fXPVcE
 wuT6unTrZAijQVwOgLVz8tWo0rxtghQgjLmNKsSLGLwnxdEmINw2gr2r+KwT+fjOTOq7
 lnww==
X-Gm-Message-State: AOAM531xSdBSMo2YEbVt3P1bpLim4YQ2JlcVdhSfXnUGMRR6wWshY+TD
 PtMLIawIVKJq1Th9LBWZ8w8twFjZpyn1qQ+h3TE=
X-Google-Smtp-Source: ABdhPJywsp59BNbGZIhRY2VFs0P/GUR4cmO5ePdL2IzHwq77KfL/KwynUQctQCzCm3jrGYrmuTR3mk+Vsu420cK4VF8=
X-Received: by 2002:a05:6830:1db1:: with SMTP id
 z17mr11626632oti.30.1603651750122; 
 Sun, 25 Oct 2020 11:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201025101537.59133-1-dwaipayanray1@gmail.com>
 <52f88d0bb938c5063ede693a05bf64961af5a496.camel@perches.com>
In-Reply-To: <52f88d0bb938c5063ede693a05bf64961af5a496.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 26 Oct 2020 00:18:40 +0530
Message-ID: <CABJPP5Azq7Pnq+Ki5gKjAGuymHGxK0HwTKsWWw6t3p4dmOSzaw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: extend attributes
	check to handle more patterns
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

> > +                     if (scalar @conv_array > 0 && $conv_possible == 1) {
> > +                             my $replace = join(' ', @conv_array);
> > +                             if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> > +                                      "$replace is preferred over __attribute__(($attr))\n" . $herecurr) &&
> > +                                     $fix) {
> > +                                     $fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*\Q$attr\E\s*\)\s*\)/$replace/;
>
> I looks it would be useful to add
>                                         $fixed[$fixlinenr] =~ s/\}\Q$replace\E/} $replace/;
> so there's a space added between } and any replacements.
>
Hi once again,
Sorry to interrupt your work so many times.

I tried this and seems the space is being applied even without this
fix.
I think the spacing check applies this fix already.

if (ERROR("SPACING",
"space required after that close brace '}'\n" . $herecurr) &&
$fix) {
$fixed[$fixlinenr] =~
s/}((?!(?:,|;|\)))\S)/} $1/;
}

So do you think it's okay without that perhaps?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
