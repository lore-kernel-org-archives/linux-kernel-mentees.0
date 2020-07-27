Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE91C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:09:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AD52073E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTRw/ggl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9AD52073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A5C585FA6;
	Mon, 27 Jul 2020 14:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQXb9VNF0k27; Mon, 27 Jul 2020 14:09:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3BD585F8F;
	Mon, 27 Jul 2020 14:09:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0884C004F;
	Mon, 27 Jul 2020 14:09:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AACCC004F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0A66F85E03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVVsYWWcxNQI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:09:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A20BF85BD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:09:14 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id ha11so2135586pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ps9gbXfMY9gEoRvLMrM4gPnJ2K1TqhpHPJ+1koA1XlE=;
 b=TTRw/ggloTOv5tFUzkTPMaC9P4H4zn5RUSgZ8tuPIehl4KfhiSnqc9URK/XVaUe0z9
 JvhnfDplOssiiv4MRcwj30vFBpjR4v9d7RJ8vDKStCLcNbW6thmA8ixbQq7fg4n3xfo2
 6OS+is5nsc81nkZU1NgQk0CVMvnX3Q+RDiB8OyOC5muqXa7FHRgTfjETCJeAWpPA1JoW
 FMZeBigEl6suZNwsCToTEl6+A5p34nuUUrcwsS1gHeMrG0zg8uJ5jtDNADTz69f4DOVF
 E0Kpu/yHkIDaffVhBH68Vf7O/qZ1oONBQZRlKhgPYMT5CNneqqMkPbaFwpybMjOZczJh
 KEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ps9gbXfMY9gEoRvLMrM4gPnJ2K1TqhpHPJ+1koA1XlE=;
 b=L6yI07/4+w16xTfhWYt+UfltA3kMB2vw25A6szYRN2pPQb+trrohwU/jtVntvAdL01
 s9p+XgppTQCUsgUN0EL72/USfSX9FSEe2zZW1lN0mYI19cR4vRErhiTfzpIHJ1L8Bc3U
 JdsBvJIuM3f5OCiqrfwbptfyVnHBkpOk+7OpOWHTSvtGQV25iZ5BnhxX1KjTJ9k1sWXn
 NWL5khcFDTfxk8tAC19MRKsTV9BXRqPwBeO4goCPgnOvFkNWuftmzDLExULGnqO2Lkd0
 wWLzKDPA9R1/DCRAFT7VsM8d2/HrC0dhfU8CIeRuVx/PdCE4TVWlR+avQ2siqgfFW0Ir
 u4Ww==
X-Gm-Message-State: AOAM53329HrU1BuoM3Ei0cZmrE51ZB2k+CJrcKtuIvoyaTrdJzbCGZ7i
 9WFgdhK7pMLRlPfVOrwF34js7hxXFOHGh62pMN0=
X-Google-Smtp-Source: ABdhPJxp0MKMIJLZxQNKOBEyl/pD4FWGtiC8dyXDtpZ3+4QH6ixWcadx6p17sd38M60xe6jmlABVkhI9TeebUXIBYb0=
X-Received: by 2002:a17:90a:a393:: with SMTP id
 x19mr16702118pjp.228.1595858954219; 
 Mon, 27 Jul 2020 07:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
 <20200727131742.82289-1-vaibhavgupta40@gmail.com>
 <CAHp75VfmKvAy6bSk70g3c2qJcUzzo0AUhzxR6dFja+ZppGMLRg@mail.gmail.com>
 <20200727134646.GA114726@gmail.com>
In-Reply-To: <20200727134646.GA114726@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Jul 2020 17:08:59 +0300
Message-ID: <CAHp75Vfuw1rAYxy41hVKNaqZQg4W-_Y=6St-X0yb5O4zN6qCfw@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Joe Perches <joe@perches.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] spi: spi-topcliff-pch: drop
	call to wakeup-disable
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

Joe, can we amend checkpatch to at least shout about simple typos in
the tag area?
See below for the context.

On Mon, Jul 27, 2020 at 4:48 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> On Mon, Jul 27, 2020 at 04:38:40PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 27, 2020 at 4:21 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:

...

> > > Fix: f185bcc77980("spi: spi-topcliff-pch: use generic power management")
> >
> > Fixes: and missed space.

(1)

> > > Reported by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > Missed dash.
> > Does checkpatch complain?
> No, I got this message:
> "* .patch has no obvious style problems and is ready for submission"

(2)

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
