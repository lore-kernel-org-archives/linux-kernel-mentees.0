Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51CEC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 20:03:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3CE20674
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 20:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlnaKg9p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3CE20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBEBD86D73;
	Tue,  3 Nov 2020 20:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yjuOGwjoZ-d7; Tue,  3 Nov 2020 20:03:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2296786C02;
	Tue,  3 Nov 2020 20:03:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B40DC088B;
	Tue,  3 Nov 2020 20:03:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1238C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 20:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 92CDD8746A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 20:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gv+c8OwBZhzZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 20:03:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5886187466
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 20:03:14 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id i6so23951410lfd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 12:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rcG44gg9JsBMcXwjHb9lFTw4mEeTDRbo5E0yF7tkVWM=;
 b=IlnaKg9pnQyq0XUhrMVsb14/FfEzSGxZgCGRFpNWpo0uhl/vXHX/tQm5vYGv5dWTFJ
 GKogd8GDu22uIOaPdGPGkL1Noh5+YlHSCNA6BFxfWdlZLRI04t6OwpEq/arYeti4M3j6
 9aNcXUFYVIDR76sfBfVmD/XU0AnosmmaEPl2pddcOMgn+5tjPeNG1kCOn7tl+FqHkCUJ
 6fai9CFex2KGCDSkW5hS4lEipbq7S9Th+80kKKaULtkkORrKztFPpw7JBn8RNM07jNaL
 sabXXa8ThiDQMraZ8yXB3uVHIoMTj5FBH9KqRab3ge25ceqIRO7KP8bNNOyd5yY1Ce4p
 aIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcG44gg9JsBMcXwjHb9lFTw4mEeTDRbo5E0yF7tkVWM=;
 b=F1Dobm3KogmGQLlfQBq8rI4dpEt6CVH3moBWXBadXry7AQRAynH4hsR8LMtZ4rd5ST
 ADG/Hvj9hSTM0tqHGINpLK5ZNqGtOWV0OhryKPC5JVZI1NXdX+UZ//Z/3BD8+3JAY6jo
 4+wzeSHjlLZu8N8luezG+dKr+ZetqWlMWUTSDgkSjqR7cV9NAtSVhziGixbxpm+m4g4L
 pNuHCjdkqtnIVptgd+WSut+HgdQjBc9NBTCqWRsuooIofrcTl50+R4m8FCYPvv8jepBp
 ULhZ6CF8FeNikh+fb71AMmQm00SIRXF/dv86a8rM53HWIJhCXDG3TQXvnxt3Mw7lZbOJ
 /dGA==
X-Gm-Message-State: AOAM533aj6Xgy+U6i5O1XseQfB8Zu7vkiNykGlNqcv6aJTAd05lTXPd4
 C5myQsmTGr5CFIK3MNSsgj6tr1IplMqnUp506Qo=
X-Google-Smtp-Source: ABdhPJycWFdT224NrSwndSwQpqkFFygXdjoqovHnnFXfJksc8uvzfhyps3gDpGQo2rQBVrc/co9YDPwlOQUVk+JVbIA=
X-Received: by 2002:a19:834e:: with SMTP id f75mr7941538lfd.111.1604433792181; 
 Tue, 03 Nov 2020 12:03:12 -0800 (PST)
MIME-Version: 1.0
References: <20201103054810.21978-1-dwaipayanray1@gmail.com>
 <CABJPP5DkJ3gwZDW+FBShs3Yo8z6GfP4LSMRW4hO5hL+fVXjShQ@mail.gmail.com>
 <e9d540c35ac04f0bb69e26d29c76c7cbd5693df8.camel@perches.com>
 <CAKXUXMwH+tEBSV6xA952xQQFe+HvdJ5ew6V=n63sk89enj6p7Q@mail.gmail.com>
 <6c275d95c3033422addfc256a30e6ae3dd37941d.camel@perches.com>
In-Reply-To: <6c275d95c3033422addfc256a30e6ae3dd37941d.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 4 Nov 2020 01:32:41 +0530
Message-ID: <CABJPP5D3xVKGC2ESwQbgO4_5eEB5A1JFxKB-ghCOsWGU3FoEbg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: improve email
	parsing
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

On Wed, Nov 4, 2020 at 1:02 AM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-11-03 at 09:10 +0100, Lukas Bulwahn wrote:
> > Maybe you can coordinate among each other who would want to create
> > suitable fix rules here?
>
> Yes please.
>
> > Also, start with the class of the most frequent mistakes for
> > unexpected content after email addresses.
> >
> > I imagine that a maintainer can simply run a tag sanitizing script
> > which just cleans up those stupid mistakes before creating their git
> > trees or sending git pulls to Linus.
>
> Does anyone really do that?
> It generally requires rebasing or post processing each commit after
> being committed before another commit occurs.
>
> > Let us try to add these
> > sanitizing rules to checkpatch.pl with fix options for now; if that
> > sanitizing feature becomes a monster script of its own within
> > checkpatch.pl, we can refactor that into an independent script for
> > cleaning up.
>
> I rather doubt an independent script is going to be worthwhile
> as these rules shouldn't be all that complex.
>
> The only prefixes acceptable for a stable address should be
> CC:|Cc:|cc:.  There are 2 uses in the last 100k commits for
> Signed-off-by: and Acked-by: with stable addresses, those should have a
> message/warning emitted in the future.
>
> The forms used with those cc: stable addresses:
>
> 2777    stable without comment
> 1381    stable # comment
> 74      stable [ comment ]
>
> So I suggest standardizing on no comment and # comment with any other
> style getting a warning.
>
> For non-stable <foo>-by: and cc: addresses and other signatures:
>
> Likely any content after a email address other than a parenthesized
> block should have some checkpatch message emitted.
>
> This should be OK:
>
> Signed-off-by: Full Name (comment) <address@domain.tld> (maintainer:...)
>
> But perhaps this should not be OK:
>
> Signed-off-by: Full Name (comment) <address@domain.tld> # comment
>
> There are 316 uses of this # comment style in the last 100k commits
> and 103 with (comment) after the address.
> Maybe the # use should be ok, maybe not.
>
> And anyone that uses a multiple comments in a name or a even
> a single comment in the email address should also get warned.
>
> The below should not be OK even if actually valid address forms:
>
> Signed-off-by: Full (comment1) Name (comment2) <address@domain.tld>
> Signed-off-by: Full Name <address@(comment)domain.tld>
>

Thanks for your time and review.

I will try to handle these in my next iteration.
Probably there could be extra warnings under
BAD_SIGN_OFF to handle these cases.

Am currently looking to achieve the following:
- unexpected content after email
- Use of multiple name comments
- Use of comments in between address
- stable@vger signoffs

Thanks & Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
