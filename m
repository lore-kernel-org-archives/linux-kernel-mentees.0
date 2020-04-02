Return-Path: <SRS0=QmcU=5S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1229C2BA15
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 20:16:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADA220678
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Apr 2020 20:16:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y/f3RgNV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ADA220678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7E36926633;
	Thu,  2 Apr 2020 20:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnpiQZoi6znV; Thu,  2 Apr 2020 20:16:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E5BD6203E8;
	Thu,  2 Apr 2020 20:16:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBBF9C1D74;
	Thu,  2 Apr 2020 20:16:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43DEAC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 20:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C0B5891F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 20:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txp1QbLL6K-t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 20:16:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8C067892B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Apr 2020 20:16:08 +0000 (UTC)
Received: from localhost (mobile-166-170-223-166.mycingular.net
 [166.170.223.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFB8420678;
 Thu,  2 Apr 2020 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585858568;
 bh=vRDaO7ScVc229V31QF7SuQbcUJkQRXGo5xDwf7t6Rgo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=y/f3RgNVI6crhzIS7qSj1VQ++zuo/g/C8ZdK9hF7pR0IU0jJtMEtdm+iKaoFo8TVI
 hxkeqpP35YRS7gjYGEzUSvUKAeP5jnWTnmjigNd5LXNnrNlypIcYcM0Qxl5VBL4XG8
 cmnEakssPXoj0UZVVybmIhuSyxDWzj7fOPDDxCPc=
Date: Thu, 2 Apr 2020 15:16:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200402201605.GA74927@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VcYSaAYx5qy7S0ppb77afgz=Ma=7=opfgSMCBnnjmoWfw@mail.gmail.com>
Cc: andy@kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
 dev_pm_ops
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

On Thu, Apr 02, 2020 at 09:33:46PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > Convert the legacy callback .suspend() and .resume()
> > to the generic ones.
> 
> Thank you for the patch.
> 
> Rather then doing this I think  the best approach is to unify gpio-pch
> and gpio-ml-ioh together.
> Under umbrella of the task, the clean ups like above are highly appreciated.

I'd be all in favor of that, but what Vaibhav is working toward is
eliminating use of legacy PM in PCI drivers.  I think unifying drivers
is really out of scope for that project.

If you'd rather leave gpio-ml-ioh.c alone for now, I suggest that
Vaibhav move on to other PCI drivers that use legacy PM.  If we
convert all the others away from legacy PM and gpio-ml-ioh.c is the
only one remaining, then I guess we can revisit this :)

Or, maybe converting gpio-ml-ioh.c now, along the lines of
226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), would be one small
step towards the eventual unification, by making gpio-pch and
gpio-ml-ioh a little more similar.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
