Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ECFC55179
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 17:00:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6525222E9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 17:00:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcsPQC8f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6525222E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 934CB871F2;
	Wed, 21 Oct 2020 17:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrzHCLINzcZu; Wed, 21 Oct 2020 17:00:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9CA587087;
	Wed, 21 Oct 2020 17:00:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E528AC0052;
	Wed, 21 Oct 2020 17:00:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4C82C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C99528740B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdAtCr5Wjx1Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C6DAC8749F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:00:05 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q136so2807416oic.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/lNuAqJQBzgkNVOhcgKF+WesFRHWS1Sh3QfHJHMJek=;
 b=JcsPQC8fgNKsZX90bGIhKVKtm3AKXR58mffVe7vRpt+Um9oFI6e4qLd8ObK/wjzzT2
 ZCVZerHtDkVUJ9eaf6Zfdcd9qSJ2f5m3u957oNvP4Q2w+O5DOKxKrqra7CTT8L9PaSCs
 +/npakv0N72GjX454MfW/GSIw/X7Fakym2j1o17rixna0OLoqLbWctNY1LDtWOXKKIeR
 pESy0KLoPAm7QPC1QjHpAxUy1dbgZ0ShTPRJ1ElrXIos5WhVhaACwUFgcCYuSivVCPLM
 wRRvkyAvxEUl464FB1y8GQIHubUIdhe3WLgTJOfv7bFQ52u6vQdR+Wqi8iEBwf2SM1WU
 FZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/lNuAqJQBzgkNVOhcgKF+WesFRHWS1Sh3QfHJHMJek=;
 b=K7sxPuKeuVrIcFnvj+a2ssiHAtRpcIRZsNU906pwa0wVTuKlcFhE4JEred2Z5wzPXc
 q6V2EgTlkR/qDNnhE1pdUmX9Kfm1kA5jrDkugHOnlCzwJPZm73i13tNUYWYF2x+R6227
 VHmTVXd1A8m63y8tglUTEGTDX4ej5e5SLzS+oezp8j26OPYYh0a/86ZGatT6jBEjI4KM
 Go32tfZHV0Y6v3UnnTm1+4g2Q7lKJm6l9wT926JV3Xq7LVWqwf2J7uUL9KbzbE79Hbvf
 1Pz3VRaQ/lSShgE1mpQFBpfXJDffGKm29cQp6T8o+OQEANcuPq2xWd6UJVIoT3iE6X4y
 d7XA==
X-Gm-Message-State: AOAM5327BXpjFUtJGpb2B0T4zas2eBsvnvyK37PRGf55jlztjNyTqc6Z
 uyfuRoAkvefKBojGUmeCU5MCxv1z/xNla7uFGx8=
X-Google-Smtp-Source: ABdhPJxny0r2Az5m7MHafOfmDHjyu/fetJxWguF/MrnVqVM2dRg5P7ft5R4uP3p5zrn4+3a3rzzUUyGE7zMnRD+p/Lg=
X-Received: by 2002:aca:420a:: with SMTP id p10mr2765498oia.117.1603299604714; 
 Wed, 21 Oct 2020 10:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201021150120.29920-1-yashsri421@gmail.com>
 <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
 <26647abf8cf14595a0dd22f10ec1c32e3dc2a8c0.camel@perches.com>
 <40ca3f0f9a960799ad0e534b77d778c90119e468.camel@perches.com>
In-Reply-To: <40ca3f0f9a960799ad0e534b77d778c90119e468.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 21 Oct 2020 22:29:35 +0530
Message-ID: <CABJPP5D9noCN9nMD5HdHq+uk=ot+Xcvd35CrC1E1GKy+nHAhGw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

On Wed, Oct 21, 2020 at 10:21 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-10-21 at 08:28 -0700, Joe Perches wrote:
> > On Wed, 2020-10-21 at 08:18 -0700, Joe Perches wrote:
> > > I might add that check to the line below where
> > > the repeated words are checked against long
> > []
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> > > @@ -3062,6 +3062,7 @@ sub process {
> > >
> > >                             next if ($first ne $second);
> > >                             next if ($first eq 'long');
> > > +                           next if ($first =~ /^$Hex$/;
> >
> > oops.  with a close parenthesis added of course...
>
> That doesn't work as $Hex expects a leading 0x.
>
> But this does...
>
> The negative of this approach is it would also not emit
> a warning on these repeated words: (doesn't seem too bad)
>
> $ grep -P '^[0-9a-f]{2,}$' /usr/share/dict/words
> abed
> accede
> acceded
> ace
> aced
> ad
> add
> added
> baa
> baaed
> babe
> bad
> bade
> be
> bead
> beaded
> bed
> bedded
> bee
> beef
> beefed
> cab
> cabbed
> cad
> cede
> ceded
> dab
> dabbed
> dad
> dead
> deaf
> deb
> decade
> decaf
> deed
> deeded
> deface
> defaced
> ebb
> ebbed
> efface
> effaced
> fa
> facade
> face
> faced
> fad
> fade
> faded
> fed
> fee
> feed
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..79d7a4cba19e 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3062,6 +3062,7 @@ sub process {
>
>                                 next if ($first ne $second);
>                                 next if ($first eq 'long');
> +                               next if ($first =~ /^[0-9a-f]+$/i);
>
>                                 if (WARN("REPEATED_WORD",
>                                          "Possible repeated word: '$first'\n" . $herecurr) &&
>
>

Hi,
Can it be considered that the Hex numbers occur
mostly in pairs or groups of 8, like "FF" or "FFFFFFFF"?

I think it might reduce the negative side further.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
