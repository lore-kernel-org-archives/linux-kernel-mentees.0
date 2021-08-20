Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B578FC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 19:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9ED61057
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 19:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E9ED61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13D1040711;
	Fri, 20 Aug 2021 19:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRGD79tx2qB7; Fri, 20 Aug 2021 19:09:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ECC5440139;
	Fri, 20 Aug 2021 19:09:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0A0FC001A;
	Fri, 20 Aug 2021 19:09:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF924C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCF50606CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqqrV3zPtjsX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:09:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A608A605B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:09:07 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id mq3so7934119pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 12:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wfeE9WQOMAjg86ZldTOQ4/vnwwsEvc0cmORxuVWIq8I=;
 b=ZB+locmNuv9nhac3jt/Lx/a24QpZSmeOWC41MbfmBOqOUqrUT/8r8YpwJSMiOha5W6
 5eLUUxaKr8l95mNPVNfCUgV0kxIpe8/Nk57RN92zCB3gSnOxuHKJe3lYDd8pF0DdP/Sl
 BOEZUNs3VtGKV5TrvVtjzbe2LZGqhj7so17EZDY1Xd5NPdey6SwMsLweM5d6N79PMPYm
 7/KPqOuhUYnFBp1cRq14JLS1lBsZg4NroYUbVQRogFR/NLhSJ+6qnSFCMjCTcemJFYQT
 Bs1i4JCieU6VuALREZ79crPkcmjDJS9+vYrzSMbzn8Son9lxHLEpqTQWsHnFWnFQkGu9
 pepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wfeE9WQOMAjg86ZldTOQ4/vnwwsEvc0cmORxuVWIq8I=;
 b=QECJeQl1Zsfu5IC24dnrysD3goOkKc7vBaQSyx8lVfHdFd2nnSXivNt3KG6FLsKzd/
 jaCy8cYiMoMPavCn4vWNb8BE2Utl9K4BQ3QNsy5gK0pHdgDRpadEQ4hvAN4/EVchrz/9
 nm7EN2KfV+LebikaSY2TNa/e4dZ06U7/b2DfvMdzH9ENcAJcYyLzcIPNGc2FaDdon9ej
 4qyZvQ0Gfl1ka40xSMmzGZ0cgqdFf6Cm3PIk0KaJRBVX+8YDSQXac7kOvpG89QiXEy3F
 3rNweagjPN2tIf9E5FdZKYN7miTieLq/qQUsXXZbTv0RDGroR6apXEV+Ja42XV1kpPnt
 FKbQ==
X-Gm-Message-State: AOAM532/GtBpGkrCoAe94iAo7fBHRcujNv9JMqthNvqm/dXy9l4OosAQ
 VNSfy/dcwUD8g5dDnBJwRps=
X-Google-Smtp-Source: ABdhPJzXZxqkG+E1pQIYTwqra2xjfkbi4FtxXkzMjF2YyHgLrYPKdbqEb/LaPMyxpJuphWWY9J75cA==
X-Received: by 2002:a17:90b:fc5:: with SMTP id
 gd5mr6165165pjb.193.1629486546921; 
 Fri, 20 Aug 2021 12:09:06 -0700 (PDT)
Received: from uver-laptop ([2405:201:6006:a148:700:9528:3533:1b98])
 by smtp.gmail.com with ESMTPSA id u25sm7562330pfn.209.2021.08.20.12.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 12:09:06 -0700 (PDT)
Date: Sat, 21 Aug 2021 00:38:57 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v2] USB: serial: iuu_phoenix: Replace symbolic
 permissions by octal permissions
Message-ID: <20210820190857.GA10162@uver-laptop>
References: <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
 <20210803183735.2525-1-utkarshverma294@gmail.com>
 <CAKXUXMy2eXLT9HOa2zgR08bXvNcVHH_BssLsOcUC==CGxU5OFw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMy2eXLT9HOa2zgR08bXvNcVHH_BssLsOcUC==CGxU5OFw@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Fri, Aug 20, 2021 at 12:09:22PM +0200, Lukas Bulwahn wrote:
> Concerning the subject line (commit message header prefix), check with
> git log --oneline drivers/usb/serial/iuu_phoenix.c for the common
> style of the prefix here. The prefix "USB: serial: iuu_phoenix:" looks
> reasonable; did you check that before or is this just a coincidence
> that it matches?
>

Yes, I did check the previous commits for the appropriate subject line.

> The patch looks good so far. Utkarsh, will you send this now to the
> appropriate recipients according to ./scripts/get_maintainer.pl?
> 

Thanks, I have sent the patch :)

> Lukas
> 
> On Tue, Aug 3, 2021 at 8:38 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> >
> > Fix checkpatch warnings:
> > WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
> > Consider using octal permissions '0644'.
> >
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > ---
> >  drivers/usb/serial/iuu_phoenix.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
> > index 19753611e..0be3b5e1e 100644
> > --- a/drivers/usb/serial/iuu_phoenix.c
> > +++ b/drivers/usb/serial/iuu_phoenix.c
> > @@ -1188,20 +1188,20 @@ MODULE_AUTHOR("Alain Degreffe eczema@ecze.com");
> >  MODULE_DESCRIPTION(DRIVER_DESC);
> >  MODULE_LICENSE("GPL");
> >
> > -module_param(xmas, bool, S_IRUGO | S_IWUSR);
> > +module_param(xmas, bool, 0644);
> >  MODULE_PARM_DESC(xmas, "Xmas colors enabled or not");
> >
> > -module_param(boost, int, S_IRUGO | S_IWUSR);
> > +module_param(boost, int, 0644);
> >  MODULE_PARM_DESC(boost, "Card overclock boost (in percent 100-500)");
> >
> > -module_param(clockmode, int, S_IRUGO | S_IWUSR);
> > +module_param(clockmode, int, 0644);
> >  MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, "
> >                 "3=6 Mhz)");
> >
> > -module_param(cdmode, int, S_IRUGO | S_IWUSR);
> > +module_param(cdmode, int, 0644);
> >  MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, "
> >                  "4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
> >
> > -module_param(vcc_default, int, S_IRUGO | S_IWUSR);
> > +module_param(vcc_default, int, 0644);
> >  MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 "
> >                 "for 5V). Default to 5.");
> > --
> > 2.17.1
> >

Regards,
Utkarsh Verma
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
