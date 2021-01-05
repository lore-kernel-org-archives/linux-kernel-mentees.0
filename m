Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B82CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:58:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD5622525
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD5622525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83FF785D45;
	Tue,  5 Jan 2021 08:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngOr2lz5ktaX; Tue,  5 Jan 2021 08:58:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0535F85C9D;
	Tue,  5 Jan 2021 08:58:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA85EC088B;
	Tue,  5 Jan 2021 08:58:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11A6AC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BE069203ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZr-kLNVCeW4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:58:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by silver.osuosl.org (Postfix) with ESMTPS id 061AD203AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:58:45 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id d9so27565097iob.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 00:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qf7RRNySPhfgWfse03rUeAP2F84k+Y7pOAkNo8wX5ro=;
 b=WYWi/SGRSesDKV01AUduU63yM0GBHvgVoDz4IAtAot9zEtHVt/WHFZPglOy9HZnUPE
 Bv1y4CrhgR+JWostqlWoUg8rwD7rpxvkyxnQQGATVyGlKe/MVKdtLVO2ecFMk2QMtqY5
 nrsjgbFom+m62GOrwwbdb8y6C8QJWcDab4bn6zu78VfgbQclZPwR8D9Rlst5Z0lb6P1l
 vdBCJL2c7cnMWdFuGJMvMDH1NRT5H34wRbt6TAVpAQEdPq6/LdvTXpiJoDvoWYpJyYON
 Fpv+yhAkI0jgrpkgpGAutxb2sa2LWcO6tWGZIZySiEL6E3oNHTqr4avSJL7yMg3E6GZV
 nsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qf7RRNySPhfgWfse03rUeAP2F84k+Y7pOAkNo8wX5ro=;
 b=U2eAapiXngwK5OmDmoz9KgTk5iZevG9WKG8mI+XSUrI9E6Yqyyl+urNWMyILW9R0Zr
 yaZWqZPvHcOiVy9uiZzv74VuWBh2iQGKpBGS4vdWCYu2PUy6r9Q6Ts5f3bJOx/u0yOFs
 p4M6IG32cQFD6Ia9uZlJBxSuaTbMjK8sO/ubMIEcX9P7lBLEjjE0wgJHj/bjacxibh9x
 gEvLnS3Bbo7eDr4kcrWKWYjlhd6kE5oTciDm8VWUzpmsujfKcAexIiYQ3EXvq0lpI1UD
 nxwUjRbnaLehx9OPu3/aqbY+QYILo4eu4y8z1upydziyCXhumj0uS9fuus9oOBQfs3+M
 p+GA==
X-Gm-Message-State: AOAM5335jSwqdz3PrKBWLhuUMMkENjLuQmR9k677Zlsz2euZeEt+ax6C
 L6iRYE9a4iH5l8cqYCmE2XPHtsiGZBcF7/PvNcE=
X-Google-Smtp-Source: ABdhPJwtWxQRB8y+a90LQotrtpwgVJjJmmxeJEfpG4HyBTp5rTnyzx9kCCXNvdP1cIFdjDtmB7tkYo1j6iLNfN3mR5Q=
X-Received: by 2002:a02:2b2f:: with SMTP id h47mr64141503jaa.139.1609837124209; 
 Tue, 05 Jan 2021 00:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20210104132536.38016-1-dwaipayanray1@gmail.com>
 <20210104132536.38016-2-dwaipayanray1@gmail.com>
 <CAKXUXMy3XPsfUW80PyQR7KhYL=SOhncgdDzxmgZrOHQnZrfwVw@mail.gmail.com>
 <CABJPP5Bsny-tZjxDni098erqAr6D_+KpsBU9zBSu234GP5raiw@mail.gmail.com>
In-Reply-To: <CABJPP5Bsny-tZjxDni098erqAr6D_+KpsBU9zBSu234GP5raiw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 5 Jan 2021 09:58:33 +0100
Message-ID: <CAKXUXMzQyx9rKqVNwec9ognkbi8Xzw4-jjVCuOXS5OMF3mY_AQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add a new check for
	strcpy/strlcpy uses
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

On Tue, Jan 5, 2021 at 9:19 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Tue, Jan 5, 2021 at 1:32 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Mon, Jan 4, 2021 at 2:25 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > strcpy() performs no bounds checking on the destination buffer.
> > > This could result in linear overflows beyond the end of the buffer.
> > >
> > > strlcpy() reads the entire source buffer first. This read
> > > may exceed the destination size limit. This can be both inefficient
> > > and lead to linear read overflows.
> > >
> > > The safe replacement to both of these is to use strscpy() instead.
> > > Add a new checkpatch warning which alerts the user on finding usage of
> > > strcpy() or strlcpy().
> > >
> > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > ---
> >
> > I remember Joe has already created a patch for that over Christmas
> > break; check lkml before sending this.
> >
> > Other than that, looks good.
> >
> > Lukas
>
> Yes I found it:
> https://lore.kernel.org/lkml/22b393d1790bb268769d0bab7bacf0866dcb0c14.camel@perches.com/
>
> He has converted the uses in code. But I don't think he has created
> the checkpatch rule yet. I will try sending it out to him.
>

Joe pointed you already to the commit. So I think your change is obsolete.

And I fully agree with Joe. strcpy is perfectly fine, when it is clear
from the use that boundaries do not need to be checked.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
