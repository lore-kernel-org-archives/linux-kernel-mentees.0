Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18FBC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 19:05:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099DB21556
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 19:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpaxtWiZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 099DB21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 797D586C6A;
	Mon,  2 Nov 2020 19:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tdxT-BD67MX; Mon,  2 Nov 2020 19:05:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CB52869C5;
	Mon,  2 Nov 2020 19:05:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70B59C088B;
	Mon,  2 Nov 2020 19:05:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90B95C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 19:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 77CE2872D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 19:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ai1HZ8Pv+C+a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 19:05:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DEA16872D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 19:05:34 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f38so11616211pgm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 11:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vcOhR29x/3SnW8U2CiNt+tjrEtmXX7l2/92ojb4Pxpk=;
 b=DpaxtWiZMjYbNo0DhrRLPVPSP/knuZbX22hAKpoM8DDfByERoFXxP2piGgMQDgO8FB
 QpMU2sUHj4oBBdInmgoStMt9hb9Tvkrab3cxlKadC6i3L+G7/IEZDzMbR3+YbxFoU4PN
 iRrwWgGNFS7NeorZ7Nkl9OTuX3fy2gAg/PjLKxHUSeJqeQsWJ26mwcOAV+faia2Miugq
 qzrIm9NdoX2QE6aWnu7m4SZwchqhGiUwL9M+Omn9gd3IKO26JkF7gI3xTdiYZ39Zh+LL
 qzmHCPf9s3uO5KfbHNXDcsyGeUxP7JnW6N6vB3ZRvwLVZPF516V0RilwrDI7NBkZAo7t
 Geng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vcOhR29x/3SnW8U2CiNt+tjrEtmXX7l2/92ojb4Pxpk=;
 b=GzPGruHcVLKeXVjYyiathuzlEO6wzCU0UGKub/jQwDIe3OA2/LfOOCZ5gJM0Squ2b9
 RxRWTjgpNDTLcqk4aG+WQdXwZ/TCCrnmvftlA3Y03W/2smo6Z2+xlpJsZsSyw3BOAopa
 86vFxKChnSctx8Jb4ZSbaIy1PWV4GNsepSP0WKdliiE4izoTtO6TDchZ6QTH8LBEfpjw
 d7W01nC1647gg2GReDmAXHve+bc9e4/U+qY0GugdNAgHtXVx2s909lWzwUbyUOni6t2r
 5qJlQYtlYdAyXr8sFrHVqJb8EW/sst5q/embKQAweS8MmWRCX62uYG9/y5WNOy7ByZgi
 Tj1g==
X-Gm-Message-State: AOAM531KB2aLVisNOLaiiLqlg8OvDqqqHCapeytqykVqU6XdTEyhA2ho
 j+aByd0AIor96RAaYD39O6zJ3cuqyWdgAM5iuXI=
X-Google-Smtp-Source: ABdhPJwPsbRWemfkUlObMtOEO+o6kF8HnAmoiWPrvzISru+uRYkWEuV0YWL7lyNWyivDdL7ZHYZPxLy4Y0igrwHoNm0=
X-Received: by 2002:a17:90a:fb92:: with SMTP id
 cp18mr19506158pjb.228.1604343934441; 
 Mon, 02 Nov 2020 11:05:34 -0800 (PST)
MIME-Version: 1.0
References: <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
 <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
 <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
 <20201030045421.si3r5zsbeeyhkwns@Rk>
In-Reply-To: <20201030045421.si3r5zsbeeyhkwns@Rk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Nov 2020 21:06:23 +0200
Message-ID: <CAHp75Vej=LT06MEmoAvAxrHY7zzvPKEJLe03C3BN5X4EZos_JA@mail.gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linus Walleij <linus.walleij@linaro.org>, wang jun <availa@outlook.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
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

On Fri, Oct 30, 2020 at 6:54 AM Coiby Xu <coiby.xu@gmail.com> wrote:
> On Tue, Oct 27, 2020 at 06:09:49PM +0200, Andy Shevchenko wrote:
> >On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 10/27/20 4:13 PM, Andy Shevchenko wrote:

...

> >> I see, so then the right thing to do for the bug which we are seeing
> >> on some AMD platforms would be to honor the debounce setting I guess ?
> >>
> >> Can you and/or Mika write a patch(set) for this ?
> >
> >I will look at it, but meanwhile I would postpone until having a
> >Mika's Ack on the action that my understanding and course of actions
> >is correct.

I will soon send a support patch against ACPI GPIO library code.

> If you don't mind, let me write this patch(set) instead:)

I leave to you whatever AMD code. It will suit our both interests :-)

> I feel itchy
> to fix this touchpad issue by myself after spending about a month of
> my internship at Linux Foundation investigating this touchpad issue.
> There are many enthusiastic Linux users waiting to get their touchpads
> fixed and I could prioritize this task since I don't have other
> obligations. I have provided a fallback solution [1] to save their
> touchpads but it seems patches on gpiolib-acpi.c and pinctrl-amd could
> reach mainline kernel much earlier.
>
> [1] https://lore.kernel.org/patchwork/patch/1323245/


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
