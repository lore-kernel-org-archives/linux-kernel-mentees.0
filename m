Return-Path: <SRS0=c32l=H3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D80C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 18:08:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0E4E64F17
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 18:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0E4E64F17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55E014EF3B;
	Thu, 25 Feb 2021 18:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLU6UFC0u0AF; Thu, 25 Feb 2021 18:08:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391634EF34;
	Thu, 25 Feb 2021 18:08:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26A55C000B;
	Thu, 25 Feb 2021 18:08:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 269F5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 18:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 217098417F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 18:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLNIGcZ_S2fr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 18:08:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B4A98417C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 18:08:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id v5so9890521lft.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rj0OsYaNL34XbEioDj/Af/QfOoWUzIIX4i9RAcv1ZFg=;
 b=AKmQ/PwNRQXowoI7jUu6xYvVRJOCtwSnT8+QIWg0tFCHnyB2C7l7UvJDo48V+dGq1W
 vkN1eS9NAIJYUkBwgZaWuuswXJEPsgCIL+d92yFfZt0fPGco0R7LSN99JZT8OvGEOBZ/
 uLcPsWqjY+kvPAB5+N/H+VmK30sEW5cuixh/71u3VAVZRyu8yF7QXRxQDMvIS+/X8yn3
 jcO6xNQVFLk3D96j1tyQqRDneVlLsOA+NrkdutK44UbJ0cCEK24YaOtakHGzRLJ3AGKt
 hMuSolXtPlpv/P7S9bfTd3MlzUJHe4mKYqsB8dKqqYsSQQsy3mCcwFx4JJsRUoztcpZs
 vhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rj0OsYaNL34XbEioDj/Af/QfOoWUzIIX4i9RAcv1ZFg=;
 b=UQdcuW/rFhCnkN5htxvMf0h1HSOAmnFWQO4Ef+7EXpnmjdjzuA7mt4Ss63e7yD4afo
 4McFF7zXKgiYAP41P3SvlguOCdz6rmIiml5tYfbyDPPKm6ikmP3weTCAB2kwlv5aAcXc
 XwT9oZ3tWmMs/0m18nQynB5k+5914avn1oYiaHJa50xbCU/pxrRayyYKmXWXomfuQ0bd
 nc/rIAZuUWzY6jPxmNPGFSI4jjeSoBj2MUiGxrCqNv/j8EOuAPax5bfg9qbYhgk0Jboh
 SLGD2O329V2SRfqMwnVIoeWMH737K1VoRMYapTLkC+oXBTiGiHlJnwAJL06bvY7nfuy6
 tP2Q==
X-Gm-Message-State: AOAM533XTwgtpbeTmDW1lt0XXgaKhHJnXCOpL418pjz8xoGeVG6HM62R
 6xNnMpHS+l+zKYUPlZC9XWbSPHoaJ3g6r5ltgB8=
X-Google-Smtp-Source: ABdhPJzBp9WAKL/MXPLAlb420Bf6OMU9LMbolckfnDjyuf4jlFqeYIq6CKaWAIh1AOxLlu6v8UZLsLhr4X+KSRZL+LU=
X-Received: by 2002:a19:c194:: with SMTP id r142mr2663295lff.342.1614276483823; 
 Thu, 25 Feb 2021 10:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20210222075205.19834-1-dwaipayanray1@gmail.com>
 <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
In-Reply-To: <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 25 Feb 2021 23:38:03 +0530
Message-ID: <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] checkpatch: add verbose mode
To: Joe Perches <joe@perches.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
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

On Thu, Feb 25, 2021 at 11:03 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2021-02-22 at 13:22 +0530, Dwaipayan Ray wrote:
> > Add a new verbose mode to checkpatch. The verbose test
> > descriptions are read from the checkpatch documentation
> > file at `Documentation/dev-tools/checkpatch.rst`.
> >
> > The verbose mode is optional and can be enabled by the
> > flag -v or --verbose.
> >
> > The documentation file is only parsed by checkpatch.pl
> > if the verbose mode is enabled. The verbose mode can
> > not be used together with the --terse option.
>
> I don't have any real objection to this patch set, but as this
> might be added to the Documentation tree and in .rst format,
> perhaps Jonathan Corbet and/or Mauro Carvalho Chehab might have
> some opinion.
>
> Also I do not want to be a maintainer of this .rst file and
> likely neither Jon nor Mauro would either.  Perhaps you?
>

I could take it up if everybody is okay with it!

> Ideally, the patch order would be reversed so the .rst file
> is added first, then checkpatch updated to use it.
>

Sure, if Jonathan or Mauro has no objections to it, I will be happy
to resend it so that it can be picked up properly.

> And _a lot_ more types and descriptive content should be added.

Yes that's for sure. If this makes it I will try to get all of the
other types in.
And if Lukas agrees, a little help from my fellow kernel mentees will
be nice as well!

With warm regards,
Dwaipayan.

> >
> > Changes in v7:
> > - Add color coding support to --list-types option
> >
> > Changes in v6:
> > - Allow using verbose mode with --list-types option
> >
> > Changes in v5:
> > - Change the reference format to use absolute links.
> > - Print verbose descriptions only for the first time
> >   a message type is encountered.
> >
> > Changes in v4:
> > - Change the type description format
> > - Group the message types by usage
> > - Make handling of --terse with --verbose simpler
> >
> > Changes in v3:
> > - Simplify documentation file parsing in checkpatch
> > - Document a total of 33 message types for checkpatch
> >
> > Changes in v2:
> > - Use .rst Field Lists to specify the type descriptions.
> > - Add a few more type descriptions to documentation.
> >
> > Dwaipayan Ray (2):
> >   checkpatch: add verbose mode
> >   docs: add documentation for checkpatch
> >
> >  Documentation/dev-tools/checkpatch.rst | 525 +++++++++++++++++++++++++
> >  Documentation/dev-tools/index.rst      |   1 +
> >  scripts/checkpatch.pl                  | 133 ++++++-
> >  3 files changed, 639 insertions(+), 20 deletions(-)
> >  create mode 100644 Documentation/dev-tools/checkpatch.rst
> >
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
