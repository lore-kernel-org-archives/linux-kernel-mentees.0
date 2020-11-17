Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D52C63697
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 19:31:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5673D221FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 19:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noaFR7Cl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5673D221FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CBA6686963;
	Tue, 17 Nov 2020 19:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfpd7K0h2rrA; Tue, 17 Nov 2020 19:31:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4BFC48691E;
	Tue, 17 Nov 2020 19:31:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E5BAC0800;
	Tue, 17 Nov 2020 19:31:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF7D7C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E01C48691E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5V1+YklL7VTM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:31:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D5BC8628B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:31:12 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 11so25657396ljf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 11:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Bk3s8gUlSx+bDYjvVmGx0UkjeS4L7yY53jMnJ2f8Js=;
 b=noaFR7ClKUdHM+BnuJhOr5D3zVy+0dIJquLfvTclEXblubxyK8oIURMrxeIQ3iWRSW
 9SSN64gqSaCRWmYsJaRDYelVM1UtKWu0Sev09wBTkn/3PGdb88IxeZTJsoERDUan7HVi
 ePl6xZI23qYd/yHocJ2Ljk09sbA4KfUqwe38pEM4OhmA98ebj5pVhzUsHoJdgv6hAaBn
 pkyYdE+5Vcsp6+W4hJH8DkYP5QmjvSDydG/MWqnyi4QNX1Fvn2zb86bNY+406sfYoIIz
 95U59qWGuizSp7lgvuX5qFef5IcWDXuGX39yuZcsApF9Koxbb9kfNNSqUGoIImyDH0B/
 gEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Bk3s8gUlSx+bDYjvVmGx0UkjeS4L7yY53jMnJ2f8Js=;
 b=q8e2Aa1kalo3LnbqeXPFzENIgtsB2WjD8I7BiusymAf3hE7YUuaAuvrm2foqqE3TPo
 2h+2trQz1kewz/EIz1P2d17lM7iPy/1u7d/oazrlhsFC5Fc/F9WJ4uQ2v8wSkdaCEkWH
 awSso271EtK1b0rD//TTxy5Z70h3/3oj4rPaV6m/jEJMoRVFPx1pwO90cXXctCIvwO50
 oZTGu1I6hh7nOvtbpxnfV5Zoi6zsiTZcS/smxINvnNcUKqdCbOOSRCW8vAppUTOyvA54
 NXmehAf5iW0REZZnqEhXGa5JVN4QCeOuk1TJ1dOky6JH2fhWMExxBWw4e4nC5rcOZ0E8
 LG2Q==
X-Gm-Message-State: AOAM531Q0wa3jw5BwcsQDmCoDkIumyWPAtBsPHb/dXJ+gcIogSDP3T1T
 XR/tU+9/LNzS4NG/02nmzUgYPwoAyxlO7EGiqUI=
X-Google-Smtp-Source: ABdhPJy8x94odXrmFZULaMkKIHUlP7wp7sgoWMC52M84QrqxX0WeJIYreMmMm4F+AOFPMUaeZjW2Ng/6LY02RfMdDRM=
X-Received: by 2002:a2e:80c5:: with SMTP id r5mr2323859ljg.297.1605641469871; 
 Tue, 17 Nov 2020 11:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20201117181236.101332-1-dwaipayanray1@gmail.com>
 <CAKXUXMzOyg32kNEZ-nw-YrWD=VsT_zeFwxKdLoD2iTf0u7XkxQ@mail.gmail.com>
In-Reply-To: <CAKXUXMzOyg32kNEZ-nw-YrWD=VsT_zeFwxKdLoD2iTf0u7XkxQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 18 Nov 2020 01:00:38 +0530
Message-ID: <CABJPP5BM83jKnegRUpOFiTOHA0cD2HMO9m15_XUB5o2wr6bndA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix spacing check
	for return with parentheses
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

On Wed, Nov 18, 2020 at 12:41 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Tue, Nov 17, 2020 at 7:13 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > The spacing check is unreachable for return statements
> > followed by an opening parentheses.
> > For example:
> >
> > int foo(int bar, int baz)
> > {
> >         return(bar+baz);
> > }
> >
> > There should be an error emitted for a space between
> > return and the opening parentheses but checkpatch doesn't
> > emit one.
> >
> > Fix the spacing check. Also add --fix option to
> > the check.
> >
>
> Looks good. How do you discover these errors?
>
> Are you creating a test suite for checkpatch?
>

Hi,
Actually not really a test suite, I was just randomly testing out
these style related checks and it was pure luck that I happened
to come across this one :)

Honestly, a proper test suite would be really cool but is it worth
the effort given that there are so many warnings in checkpatch?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
