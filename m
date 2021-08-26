Return-Path: <SRS0=MGRu=NR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22BEC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 14:09:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510FE60E78
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 14:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 510FE60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BEA860647;
	Thu, 26 Aug 2021 14:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXXjIdIm0FHA; Thu, 26 Aug 2021 14:09:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2DD2260619;
	Thu, 26 Aug 2021 14:09:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06133C0010;
	Thu, 26 Aug 2021 14:09:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49AFBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 14:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3911542626
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 14:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAX4Jgw9e5hD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 14:09:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEAC042620
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 14:09:15 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id q68so3159126pga.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IHu9tR/6Cya7biP79tZOJnTzvsP2TvD1XGVXSlWQptc=;
 b=nOxTMSOthtkjbNfMJmiDbRBqwR99W6NY3um9pitOe/YvF8Pesoqc3KYuvI4jKAq9lW
 Mhc/Danh+eSy4aK6FNWZMrAJ/azsGr8x1yUHM4YB/R0HbBAgD/LmJbyxopQxKsUSp9la
 8HoXUT/gI8ZK3UiSnY4xt47YDXyTiN+Q7xEmgLZXlso26skqrAHmpJBcX7r6Iu4aukXh
 pcVbQ5R1RONsrj3/5VOVsG+FlVEgK532l/tHTgGUuap8A9h7IAWHY+1skfFGILmMFM+a
 4bWN+iJo0wPiZHsrM5IYdlBhF9EJyZFlxfqlEaL4Ofq9Q+chfhWpi4DozZHl/+jJ+/UZ
 IVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IHu9tR/6Cya7biP79tZOJnTzvsP2TvD1XGVXSlWQptc=;
 b=IH3j9uQLHv6DnS2RkP4ABAliKhPYK9PYvGu2e8mxvRwj4XzB3BY8HrcVORBqn1Frb9
 ORl8/OlbcbAgHPR28M9xHsWV3MEtaakDMGeapfc0Zn+MS7FFaLU7hyhLSXaUreWbK1gG
 giMyhil26uoudmBPf4RFroV2DHMXrWyJOwGT8ZgvDWdVHY2KSU8DaCjIK0bd6XMVDAiL
 ue6/F8bh4I22M+TVtmG96p7YqvxN5Kx5Wz1DJUrvOmtvFrM+bCXoCOc3gma1OrlCZpNB
 4IRpQqNHdkiaa31Z6QAiW49iIuYwqb4ZsZUM+7PT5gXKUakqmWw3nVVOBvh8ta/d9JsY
 6aXQ==
X-Gm-Message-State: AOAM5338DyCAcmvf6Nkiye/gZSdJqANHvAdUufYM3/Ob/x/8o0oDsLHP
 KQKgs3ZjQkmEEStm3V0MzVLogI03uPlB2de7k2s=
X-Google-Smtp-Source: ABdhPJwdW5JDTSv7/6D2pbzvuhN3sHFkC2wCg7ta7mwBvl1yqMkNzMe2+t9z1HROcwNl3zJWpalmuWHvOcP29Ak1JBo=
X-Received: by 2002:aa7:800b:0:b029:330:455f:57a8 with SMTP id
 j11-20020aa7800b0000b0290330455f57a8mr3861506pfi.7.1629986955001; Thu, 26 Aug
 2021 07:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210817081401.3440-1-utkarshverma294@gmail.com>
 <YRuyoWujcSB6zKl5@kroah.com>
In-Reply-To: <YRuyoWujcSB6zKl5@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 26 Aug 2021 17:08:35 +0300
Message-ID: <CAHp75Vev9=mkNxi__eH3Lj+a9_rNBQ8M90EGgvsjbtQ_OqcOtg@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_mid: Use pci_irq_vector() to get IRQ
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Jiri Slaby <jirislaby@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Aug 17, 2021 at 3:59 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Aug 17, 2021 at 01:44:01PM +0530, Utkarsh Verma wrote:
> > Instead of a direct assignment, use pci_irq_vector() to get the
> > Linux IRQ number.
>
> Why is this needed?

It's not.

> > +     uart.port.irq = pci_irq_vector(pdev, 0);
>
> What problem does this solve?
>
> Do not describe what you are doing, but rather, _why_ you are doing it.

I think I know what was the motivation here, but actually there is no
problem with current code. Indeed, when we enable MSI we have to
update the vIRQ line, but this is done in the platform related
->setup() callbacks (for example, dnv_setup() does it). So we have two
scenarios:
 1) there is no MSI enabled and in this case pdev->irq is correct;
 2) we have MSI enabled and we need to update previously saved pdev->irq.

What you, Utkarsh, are doing in the patch has no effect, because at
that point MSI will never be enabled and pci_irq_vector(pdev, 0) will
return the very same value as kept in pdev->irq.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
