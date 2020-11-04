Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B39C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 08:05:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6AAD221F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 08:05:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+9tP6Rk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6AAD221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1D76720356;
	Wed,  4 Nov 2020 08:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vl56O6JGpeAk; Wed,  4 Nov 2020 08:05:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0FBCD20338;
	Wed,  4 Nov 2020 08:05:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8BA6C0889;
	Wed,  4 Nov 2020 08:05:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE91EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 94D4D20356
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDnyuMglMcqU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:05:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 38D1820338
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:05:33 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id s25so14518495ejy.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Nov 2020 00:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=WOMWgWeotGz02y1OCfCO5T8Q2arx3bVYsMb8EgGzCd0=;
 b=Z+9tP6RkBdXk6Y9IAMjDbheni5BJGFSxnMW1CYuoCFshL+vNCol7lWuRRcu2ZC+KSL
 IgX3AFo+rJOAVJDrQCs93uvGXR2PhahaS4YfyiH1n+UyneYInQqvvr7aGHyDrxvlpnXt
 9Uj2AKe+fXTaFFQcKhlXdoZMGolTL+LJ0Do5wUAkOsYcYyqJNWUGxKh6mBk/ey+eItGD
 kNYMtgoBT+ZK/mQGn60I5PImqFytZ2+DoWoLA6E+U+4wkwd6Dg6slx4xblQsfcPtSNmV
 ZvG/rMTuJ4GtXL2LcxCdqPxAglYJamwXxpTt2Ip2YqO5tqS7gKx0Rh8BGDYMQEzkl02v
 ligw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=WOMWgWeotGz02y1OCfCO5T8Q2arx3bVYsMb8EgGzCd0=;
 b=lWFTfwCtEDOe+5dQjr6YYNzn5d+mioSfXYv6soRRnM57Bepxf9HwzTpV9+Uw5cN5Ip
 1pQZT/mPjElSCAtwH141+EjuvtUTephAuIZZAenYgeGyf5QpMcs758YxfxY21MyzZb/F
 z60wef1dbU088MsE9xOS1bhTf0baxfKjFxTFm7AqNC6AiA7gh+KQHfcpuDeq4+zqlhvk
 3UJRATUcQFruHZbi53FLpXU7mmUm+NnUoHoNmjMq0NRs3JNxbprGzcnIyLRD4yHfuiym
 DlhwMnv6Q+bSvAHdh6qivSXfQrx+Gqmxt7Mmq7lTmLdysun+uBL2oHIxL7BEpeqwcLNC
 moWg==
X-Gm-Message-State: AOAM5331jWdIWHBkb7plppcgGv3vMMstZO/+HYQHfJMsiOSmHPMVCmdy
 ERrgoY5I+o+NbxnkulzeYf6hE5L4L6U=
X-Google-Smtp-Source: ABdhPJxTbSkVnGzrsQoq6aStC7vkS1i2BKZ221hDwgKBN4UWOkeEKpRv88hGHOzEX9DlA+9XVYZs+Q==
X-Received: by 2002:a17:906:3087:: with SMTP id
 7mr23586689ejv.375.1604477131554; 
 Wed, 04 Nov 2020 00:05:31 -0800 (PST)
Received: from felia ([2001:16b8:2df3:e100:d1f6:5677:9c1c:230a])
 by smtp.gmail.com with ESMTPSA id a1sm603607edv.88.2020.11.04.00.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 00:05:30 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 4 Nov 2020 09:05:29 +0100 (CET)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <6c275d95c3033422addfc256a30e6ae3dd37941d.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2011040848420.21917@felia>
References: <20201103054810.21978-1-dwaipayanray1@gmail.com>
 <CABJPP5DkJ3gwZDW+FBShs3Yo8z6GfP4LSMRW4hO5hL+fVXjShQ@mail.gmail.com>
 <e9d540c35ac04f0bb69e26d29c76c7cbd5693df8.camel@perches.com>
 <CAKXUXMwH+tEBSV6xA952xQQFe+HvdJ5ew6V=n63sk89enj6p7Q@mail.gmail.com>
 <6c275d95c3033422addfc256a30e6ae3dd37941d.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Aditya Srivastava <yashsri421@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
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



On Tue, 3 Nov 2020, Joe Perches wrote:

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

As far as I know from private converations, some maintainers do have 
early testing branches, rebase those, squash commits and hence, they 
might also sanitize the 'commit messages' if it works reliably; but I am 
not a maintainer. I guess we implement something useful and then ask some 
early-adopting maintainers to give it a spin and get some feedback.

> > Let us try to add these
> > sanitizing rules to checkpatch.pl with fix options for now; if that
> > sanitizing feature becomes a monster script of its own within
> > checkpatch.pl, we can refactor that into an independent script for
> > cleaning up.
> 
> I rather doubt an independent script is going to be worthwhile
> as these rules shouldn't be all that complex.
>

Good to know. Okay, so let us add the rules and corresponding fix options 
to checkpatch.pl.

> The only prefixes acceptable for a stable address should be
> CC:|Cc:|cc:.  There are 2 uses in the last 100k commits for
> Signed-off-by: and Acked-by: with stable addresses, those should have a
> message/warning emitted in the future.
> 
> The forms used with those cc: stable addresses:
> 
> 2777	stable without comment
> 1381	stable # comment
> 74	stable [ comment ]
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
> 

Thanks for your evaluation and hints.
I agree with them as well. Let us try to establish one common way from 
comments.

Dwaipayan, if you code this into checkpatch.pl, maybe you can also add 
some hints on conventions for tags in the kernel (process) documentation 
to explain the rules and conventions we think make sense.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
