Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22EAC46466
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 18:47:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9DD20853
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 18:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbADtAEg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9DD20853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DC50D2002B;
	Mon,  5 Oct 2020 18:47:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dT2ona-IZSeP; Mon,  5 Oct 2020 18:47:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B58212001E;
	Mon,  5 Oct 2020 18:47:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94F38C07FF;
	Mon,  5 Oct 2020 18:47:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41DBCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 18:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2AB1F8700D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 18:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8iAGIc8EiSWJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 18:47:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5165C86FBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 18:47:21 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n61so9625855ota.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XQjx4ARCOaA2Q3w4kWrTamyGCaoXmzrJw6IcbfLdyk4=;
 b=hbADtAEgbdwpvlYNo3faqt+P+U0ye7bUZqMOOg6MFw6APVUSBDhEB9pOLtDWotBoxj
 h/ol56CXi/ZM09Su4P+xHHA8yoFXKO+yKouICKddLgjIwzY8qO9KUHWBFyAVpmrmbfw4
 s6+sDUUDpCCrFrmS9fioCiVegCgTTzsBu8CEg/79jYVxQn701bHyJmURrjkZ8P+aEkWb
 oWnobPquo/nwPxiOEmMebRPc+KBi7+F7O2aK9a5tVpNKw+yke5d0hIRVaET2pbzlO9os
 1ppHKBytY+wmahSasdz/Jj/+YoIemLO76yY16My6Rx77tkDMyBvLwvsYMnKV0FzE/t1x
 ZWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XQjx4ARCOaA2Q3w4kWrTamyGCaoXmzrJw6IcbfLdyk4=;
 b=iXUQpAnOCN7c7pxnsl08NOKlD8teovKV2q+oP+1Ob9R5RsbHGCJtN88P8WKDwd1QCS
 yQJezQIdn4lP/KG+Z2PUcMuu3t9dODTUxb/qwj2uGI+VGAtqhPYrBu0nXknlTfxD+KyC
 Q62hZ89Xd94s31fN3EA0yXFBQbMi++bzwdnbL8OwPU67qoWBfli8vXD+e1dU9S2yYgqF
 qCm9RVUYvAXl1RnB39jxxHnQ7D7wXOSVR2GbzqL4fvoS+pvOSiXzGiXM37YNSXGQfoXc
 zISJ/9o+WtlVCmm8ps7icOVLdS1Csx8Hxkl7lly95a1wsw8ntciBFNKd5KK+8QFgsOT/
 78CA==
X-Gm-Message-State: AOAM531Pi7WTZgF+mrfoVUU85xPnaid1UkgOnh3mQHHzlax5pG4JgleM
 0QZHUQ++E9IpJIhuiBmDszN4uVQ+SmxQfBwrbPU=
X-Google-Smtp-Source: ABdhPJyLCnElkhzehx+gGblvdGwyvr63QqKxsu4szbqFIma5EJahiU+IMo+92Sx6DaOFjnKvArimCbYKbikZz9YRX/w=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr443856otf.265.1601923640321; 
 Mon, 05 Oct 2020 11:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201005173933.171074-1-dwaipayanray1@gmail.com>
 <14c9d8808feabe987e7fdac867d21ff88561011a.camel@perches.com>
In-Reply-To: <14c9d8808feabe987e7fdac867d21ff88561011a.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 6 Oct 2020 00:16:58 +0530
Message-ID: <CABJPP5D9d7egEMWbYJnp7STYyB9OeW3sWzcnyXvRTKFbUmXU4g@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add new warnings
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

On Mon, Oct 5, 2020 at 11:53 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-10-05 at 23:09 +0530, Dwaipayan Ray wrote:
> > The author signed-off-by checks are currently very vague.
> > Cases like same name or same address are not handled separately.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > +                                             if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
> > +                                                     $address1 = $1.$2;
>
> More common in this code is "$1" . "$2" not $1.$2
>
> > @@ -6891,9 +6917,29 @@ sub process {
> []
> > +                     # 4 -> names match, addresses excuding mail extensions (subaddresses) match
>
> excluding
>
> perhaps "subaddress detail" instead of "mail extensions (subaddresses)"
>
> And maybe add "from RFC 5233"
>
> > +
> > +                     my $sob_msg = "'From: $author' != 'Signed-off-by: $author_sob'";
> > +
> > +                     if ($authorsignoff == 0) {
> > +                             WARN("NO_AUTHOR_SIGN_OFF",
> > +                                  "Missing Signed-off-by: line by nominal patch author '$author'\n");
> > +                     } elsif ($authorsignoff == 2) {
> > +                             WARN("NO_AUTHOR_SIGN_OFF",
> > +                                  "From:/Signed-off-by: email name mismatch:\n$sob_msg\n");
>
>
> Still no need for a newline to separate the output message.
>

Thanks, I will fix these.

Are there any more changes needed? I shall try to wrap it
in v3 then.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
