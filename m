Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CFEC388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 10:48:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 595DB22384
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 10:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpi63dg6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 595DB22384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6EE18711B;
	Tue,  3 Nov 2020 10:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Ce5zmj0KKCS; Tue,  3 Nov 2020 10:48:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13CBF8718D;
	Tue,  3 Nov 2020 10:48:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CFDCC0889;
	Tue,  3 Nov 2020 10:48:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0C09C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D84B2870E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yruLe7d5530H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:48:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2480D8701C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:48:21 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id w65so13862646pfd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 02:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rKa+JgzadxzWS3bdsoFXKOpjwWVP8DbpJnaCBUt14mo=;
 b=qpi63dg6RuLyzF9O47QcF7vcoiD+4QFUfxKAw8oKDqOaSdbinO/wT6qcAcQdnoWd4Z
 7sG1u23gZWuG9RC0vn6yrrHtnoWfhqPfnzB2NIKwKnup3D0p1qiWYqv9sMf3gikX0aJN
 vVRmftQqrce7TX4H30ZyqMcXwRyKd58ia9q8QL/iYhLtdj63q7HkOEFwCwXPldpgYoz3
 IjubeWJ85dG8h5TEfloxM/AZee178RiKZCGmtt+uO25ehGFMZnrmkasq8LqTS5P7SUKc
 sZV3JlEIFmYGSBI6M4tLTKCilw1LEmaF8hzn2BtfgsbzDeWgKzisjWJJHjSuGqru6iVd
 mNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rKa+JgzadxzWS3bdsoFXKOpjwWVP8DbpJnaCBUt14mo=;
 b=KxUJvs6l6jO7adeRzgHOUN7e2ofz1f9R1cRoA7psrJMkWvOk0HItpX/F2M/s1vZA+i
 IRtsFzK6L96d+PVSKXPPcnStMrR5Fm5Vu9p/GIsS4PT77bRyjs1u5tqSFKO4QsbkhFLf
 T6NWFNoknwtfJTO3vojR10wZbdUj+13PUU83dEJpUv9fndJfUnjLI5naa/oXf8llZsXI
 efu2SI+uwZhMpOAYImN9jyit3ocD2pg870Oeq5NzdPS1Nq3H8EQXDSwM6w6IYVIJdTU+
 mW0OVB5UYlTXv8Dz6Q/AmoriAJP2p6w0+1T+sfoCxM3hGLS+KQmEGBFxE6AbQn7jh4kN
 jk7w==
X-Gm-Message-State: AOAM533xhnDMw+fEa+6yZC+HkJUOqdO5TwRLGSX1ncFOSPt/WvEUcqoJ
 miCnEvcP0Ve4UsQ4D1EAGK+89gzwiePcGhSOjuo=
X-Google-Smtp-Source: ABdhPJxMkcNLPT3Yz759qyIzP/3KsBKciOfH87QdigzUYnNTt8Typ2gcfJpVpSv32xsCNO6oLRV2+1eYYd0se9avpSo=
X-Received: by 2002:a63:4511:: with SMTP id s17mr9135338pga.4.1604400500661;
 Tue, 03 Nov 2020 02:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <20201103000507.ufzukd2vkb5h2e3b@Rk>
 <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
In-Reply-To: <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2020 12:49:09 +0200
Message-ID: <CAHp75VdYhe4YEAzULMNkhihTQwHAP3fC2F6iD=datqzyzd=4fQ@mail.gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 wang jun <availa@outlook.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
Subject: Re: [Linux-kernel-mentees] Any other ways to debug GPIO interrupt
 controller (pinctrl-amd) for broken touchpads of a new laptop model?
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

On Tue, Nov 3, 2020 at 12:12 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/3/20 1:05 AM, Coiby Xu wrote:
> > On Tue, Oct 27, 2020 at 11:09:11AM +0100, Hans de Goede wrote:

...

> > [1] https://lore.kernel.org/patchwork/comment/1522675/
>
> This is a case where Andy is obviously right and you should just use the
> higher precision "unit = 15625" value (except probably that is wrong too,
> see below).
>
> We have had similar issues with the docs for getting the TSC frequency
> on some Intel chips, where the docs said 16.6 MHz for a certain register
> value, where what they meant was 100/6 MHz which really is significantly
> different. This was leading to a time drift of 5 minutes / day on non
> networked (so no NTP) Linux systems.
>
> I think this is what Andy was referring to when he wrote:
> "What the heck with HW companies! (Just an emotion based on the experience)"

Exactly!

...

> Actually all the values look somewhat suspect. The comment:
>
> >                 Debounce        Debounce        Timer   Max
> >                 TmrLarge        TmrOutUnit      Unit    Debounce
> >                                                         Time
> >                 0       0       61 usec (2 RtcClk)      976 usec
> >                 0       1       244 usec (8 RtcClk)     3.9 msec
> >                 1       0       15.6 msec (512 RtcClk)  250 msec
> >                 1       1       62.5 msec (2048 RtcClk) 1 sec
>
> Helpfully gives the values in RtcClks. A typical RTC clock crystal
> is 32 KHz which gives us 31.25 usec per tick, so I would expect the
> values to be:

I guess you are mistaken here. Usual frequency for RTC is 32.768kHz
[1], which gives more or less above values

30.51757
61.03515
244.14062
15625
62500

[1]: https://en.wikipedia.org/wiki/Real-time_clock
(just google: rtc clock frequency)

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
