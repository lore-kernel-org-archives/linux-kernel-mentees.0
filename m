Return-Path: <SRS0=isT2=DO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9C4C4363C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 18:54:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F2B2168B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 18:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsV+Y50F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F2B2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A1DE872F6;
	Wed,  7 Oct 2020 18:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xso47VwRGWiV; Wed,  7 Oct 2020 18:54:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7490E872ED;
	Wed,  7 Oct 2020 18:54:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C39BC016F;
	Wed,  7 Oct 2020 18:54:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 375DBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 18:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 31010272BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 18:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id as8X2ouibCPK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 18:54:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 1DADD272E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 18:54:09 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 16so3559482oix.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Oct 2020 11:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q4If+TCyiw9yiNk5xVyk9qCMBHV8IsTz4Qj42igWU3E=;
 b=dsV+Y50FgwarfakCN8ShfjweD0Be9WxVU2H4i1/Bxw2OqJstl+dB01hatMej0NMEkn
 gwQQy5niBpeLEhlPRoTcm1EWWQHmUN+94i5tFZHjdDRKhVI9moPj1xuAZG+dUA+A2xiF
 Qac63cFL1O2lih18X5ANKMI52BUKOrv30FtpZw/jRJz60qwreULbtOh4Qt0mwuL66pvD
 QY6ih1LxWdtG1cOAraQO10kRZN3s505iy8oi3MWe5aB6/dgx3J6JEe7UNBJYqw/xkxpK
 cgQRhkW0dld9bkCGh9PRoetporVnU5sz6Y8TikjJet87rGnB0qLk7y9Lu71IgUmhn9Ck
 jkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4If+TCyiw9yiNk5xVyk9qCMBHV8IsTz4Qj42igWU3E=;
 b=ptFVFZCd22vag+UF3Hc618OXRIPw/5X/bCYT+HsjND5S9xIp/+mguQIkSvRjkum2rc
 ZFauOPD13X5usrBt/txx5OGx8w/nwyRa5/rpZtudFFsxbOOsDeST6WQjowdb8e2pvG3S
 0mBfQVaIiIEq3fDiKFMctRwhlwKe0Mrv4Cs4+ihKxwedu0Gvz4qon7KzA6snMJ8UUrpX
 //WN4H8eXPvDyKY4WCfkaDEN2rFJ4oSibTRdca3+vEdFO/iDW9kG23ElqZS/MkyWrn6d
 9Lb+I/7PrppMBxWiA4mwvloNNuW2x0HvbbccML5V2Vcykb5xJxqcpFz/2egDuFX7VZW/
 f3KQ==
X-Gm-Message-State: AOAM530H/R0dSBCwiYAQtHjivlxtVqZjQJIofQf9NxOMEVGY1SBLrwlG
 NnPK9qtDfhiXsX6AaIZn7OATizEQY+FK3I68VdE=
X-Google-Smtp-Source: ABdhPJxzkA7qPxjE2iqnVluFz/QMlydOFlVvP64bYz4mDnKBkl5ODKeVE6cAcInl1wxe/xQPaZUs64lunnOV6wUSDIo=
X-Received: by 2002:aca:b2d7:: with SMTP id b206mr2934781oif.110.1602096848117; 
 Wed, 07 Oct 2020 11:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201007063315.41585-1-dwaipayanray1@gmail.com>
 <CABJPP5AEELQz0t2+34xYQOJ5e5nQzTUUU6UT8ZH0fqm-tacOmg@mail.gmail.com>
 <a2db6d34e964bd5ca65f59d1a536a61df71fc955.camel@perches.com>
 <CABJPP5B_nscUwm4m+PySN67Cp=i1aR8KXKRuAf2YdAj_950j2Q@mail.gmail.com>
 <b1f15283f770c71923920fef8fc6c643433d1ef9.camel@perches.com>
In-Reply-To: <b1f15283f770c71923920fef8fc6c643433d1ef9.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 8 Oct 2020 00:23:45 +0530
Message-ID: <CABJPP5CwuV8mKZzZqg3AjHubTqE3QzZC1zQyf+U+-Q=kRxKh9A@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new warnings
	to author signoff checks.
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

On Thu, Oct 8, 2020 at 12:14 AM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-10-08 at 00:08 +0530, Dwaipayan Ray wrote:
> > On Wed, Oct 7, 2020 at 11:48 PM Joe Perches <joe@perches.com> wrote:
> > > On Wed, 2020-10-07 at 12:08 +0530, Dwaipayan Ray wrote:
> > > > On Wed, Oct 7, 2020 at 12:03 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > > > > The author signed-off-by checks are currently very vague.
> > > > > Cases like same name or same address are not handled separately.
> > >
> > > Likely now, the type should be changed from NO_AUTHOR_SIGN_OFF
> > > to a single something else for all the other types of messages.
> > >
> > >
> > Since BAD_SIGNOFF is being used for a different context, then
> > probably BAD_AUTHOR_SIGNOFF.
> >
> > Should this work or anything else you have in mind?
>
> That may be a bit too strong a wording as these aren't
> significant/bad defects.
>
> Maybe something like FROM_SIGNOFF_MISMATCH.
>
> It's not anything that would reject the patch.
>
> It's a pity type uses both SIGNOFF and SIGN_OFF.
>
Oh right sorry, It was a "visual mistake" on my part, it's SIGN_OFF
indeed and not SIGNOFF.

And I agree with the strong wording. So I will probably make it
FROM_SIGN_OFF_MISMATCH. And after that send in a
v6. (If I run out of single digit version numbers after this, it will
be embarrassing :(  ).

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
