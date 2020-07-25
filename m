Return-Path: <SRS0=EU8F=BE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BBEC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 10:45:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4699B206F6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 10:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9dx9GXW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4699B206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1BA8E2079A;
	Sat, 25 Jul 2020 10:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TivpYifTmIR; Sat, 25 Jul 2020 10:45:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ABB1D20504;
	Sat, 25 Jul 2020 10:45:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97774C004D;
	Sat, 25 Jul 2020 10:45:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EE8FC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 10:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7A1B988A1F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 10:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igR1XqWsuBEB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 10:45:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DFA70889FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 10:45:00 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d1so5834571plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mw7/94BNaGAP671q/l4zcNRypbQ7/HXqY8h0Z+X694Y=;
 b=E9dx9GXWAwQ7BS1lvhzr3sZfUxFAkQCxs5IbeVy6jaQBBHsu94zA60eqL7E+EYJo3Q
 o5M+JZQTvCGluvRrFru0n9ayJVBFbIPfRMQE3qHhtea2kG1q7aVghq19KypExGrLAUjv
 rqkoqBHRFNw0zGwNJJ7iwYwjWq4UEfVTDiIlgjoTnK5Qk+oJn7BF6JvErc+BT17cAe+D
 b3RMdbOnWIRDid3pzE+IeXsA5eUKrikE6bw4eUpym3hL+75cArFaB7Oe6L0E3hrAgpWn
 saFfcPuc743cXNpG/pAQ+Xnqlixj6NgfwXV6ybUWRxa9hfHHASeXsmQQO50KX+HUcRhv
 wP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mw7/94BNaGAP671q/l4zcNRypbQ7/HXqY8h0Z+X694Y=;
 b=b/piff4KrckthD4SCbVw/40N63heErixm/jgLr81BZoE356EEY7N012SpHguswZr2u
 PQWYbeQ9FOhRubCRCxT32KQuXS5zPi2EoUKxrocsp5u6QLvYgw8qzHL0sRvwaF4Qd4CF
 BVsPGtVLmCuOzjxZ4w9Do6O2/2ViEBlmZdWS47czI0/pjrt+U85Kd6bl6oqgXHIPP3rC
 HxtKoIr/s8Oeo/6/GvnXgJesQX0cJT2nBEQh4GkqwktMLIfNfBDbpOnjsxRf8wtcKUQW
 JUiP2lYm/kEolXtpPi/UqRlmR4VRFLFdB/Q8QfH6tVsgHb1fKSf43OGXaj7EYqKm6ey9
 t2Zw==
X-Gm-Message-State: AOAM531UHkfxkgE9z8LDmGJU1pL11ucXSfULQfr7szO9BbUyPJ362zzT
 m2fvDkG6uoL7P5XdlIztuGY66f5dZ4y9K0rLkDI=
X-Google-Smtp-Source: ABdhPJyZDOpYfyd7juxBE+IWrL4ffBNacFmyQCYFqqh7ePdTGjI1aHlUpxfwYpP49GEn93LRwwbAcoFpFZzFsh2mt/M=
X-Received: by 2002:a17:90a:498b:: with SMTP id
 d11mr10012883pjh.129.1595673900537; 
 Sat, 25 Jul 2020 03:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
 <20200724223746.GA1538991@bjorn-Precision-5520>
 <CAHp75VdSr1rguc9HJVh_rA1nBh1uyCdr18eyPosWPzCH1K2=zg@mail.gmail.com>
In-Reply-To: <CAHp75VdSr1rguc9HJVh_rA1nBh1uyCdr18eyPosWPzCH1K2=zg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 25 Jul 2020 13:44:44 +0300
Message-ID: <CAHp75VfKeTCBOne3tDSM46q6m_FE+7hS3H9Hx5C3RRPvueqZAQ@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] spi: spi-topcliff-pch: use
	generic power management
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

On Sat, Jul 25, 2020 at 1:42 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Jul 25, 2020 at 1:37 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Jul 24, 2020 at 11:16:55PM +0300, Andy Shevchenko wrote:

...

> > If it's a bug that spi-topcliff-pch.c disables but never enables
> > wakeup, I think this should turn into two patches:
> >
> >   1) Fix the bug by enabling wakeup in suspend (or whatever the right
> >   fix is), and
> >
> >   2) Convert to generic PM, which may involve removing the
> >   wakeup-related code completely.
>
> Works for me.

The only problem here, is that the 2nd is already in the Mark's tree
and he doesn't do rebases.
So, it will be the other way around.


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
