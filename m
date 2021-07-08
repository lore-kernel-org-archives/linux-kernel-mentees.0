Return-Path: <SRS0=J1f0=MA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C12C07E96
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jul 2021 21:47:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B743461607
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jul 2021 21:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B743461607
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DB2C41CEC;
	Thu,  8 Jul 2021 21:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfUvV61yhT3f; Thu,  8 Jul 2021 21:47:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 922EC4022F;
	Thu,  8 Jul 2021 21:47:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64774C0010;
	Thu,  8 Jul 2021 21:47:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9B57C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 21:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D848F60D7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 21:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuKx1RJK5ody
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 21:47:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A3CF60D78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 21:47:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E7F961606;
 Thu,  8 Jul 2021 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625780827;
 bh=mrhrj7r8a/qXiw0M9WJaa1DCHBkLNSRdzlM6SWlPTKE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=oXC1SpBo1ZihpDDEULeQAk6w2SDXIHgfxJgsYjq252DCnaUUT30xkukiAfUimCtXc
 BMR4woyeM+Rfd2iwqsrQBBHBN4Z9DEITqKxG6L73lW/gFVxxPEcUCT68YEpg2JXB+l
 5VOi6QrEUCacBgxZl/id89uBAGiL0ocodTd01YmA5eLsrCJU/mNOyWJ0tLjMC7K1Pg
 9dxITECxLSUyGGlO+GMCKNFMEtJZb4/frXQYucndDj9mSlw/INEpUX10Mial7LAX3D
 jDRTmyfx1pjrDE/DW8FBsDyLz4bh8FfIkmvrfhvCkDzvocl6CTHRc7bTglGlbBLbwF
 5AJBC3yoMdehA==
Date: Thu, 8 Jul 2021 16:47:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
 dev_pm_ops
Message-ID: <20210708214706.GA1059661@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vfpj+ENMe9u-SMKfvCsyFtOucUT9bD3qfWX+QjccZ9ZyQ@mail.gmail.com>
Cc: andy@kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org,
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

[+cc linux-pci]

On Thu, Apr 02, 2020 at 11:23:27PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 2, 2020 at 11:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Thu, Apr 02, 2020 at 09:33:46PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> > > >
> > > > Convert the legacy callback .suspend() and .resume()
> > > > to the generic ones.
> > >
> > > Thank you for the patch.
> > >
> > > Rather then doing this I think the best approach is to unify gpio-pch
> > > and gpio-ml-ioh together.
> > > Under umbrella of the task, the clean ups like above are highly
> > > appreciated.
> >
> > I'd be all in favor of that, but what Vaibhav is working toward is
> > eliminating use of legacy PM in PCI drivers.  I think unifying drivers
> > is really out of scope for that project.
> >
> > If you'd rather leave gpio-ml-ioh.c alone for now, I suggest that
> > Vaibhav move on to other PCI drivers that use legacy PM.  If we
> > convert all the others away from legacy PM and gpio-ml-ioh.c is the
> > only one remaining, then I guess we can revisit this :)
> 
> Then skip this driver for good.
> 
> > Or, maybe converting gpio-ml-ioh.c now, along the lines of
> > 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), would be one small
> > step towards the eventual unification, by making gpio-pch and
> > gpio-ml-ioh a little more similar.
> 
> I think it will delay the real work here (very old code motivates
> better to get rid of it then semi-fixed one).

With respect, I think it is unreasonable to use the fact that
gpio-ml-ioh and gpio-pch should be unified to hold up the conversion
of gpio-ml-ioh to generic power management.

I do not want to skip gpio-ml-ioh for good, because it is one of the
few remaining drivers that use the legacy PCI PM interfaces.  We are
very close to being able to remove a significant amount of ugly code
from the PCI core.

gpio-ml-ioh and gpio-pch do look quite similar, and no doubt it would
be great to unify them.  But without datasheets or hardware to test,
that's not a trivial task, and I don't think that burden should fall
on anyone who wants to make any improvements to these drivers.

Another alternative would be to remove legacy PCI PM usage
(ioh_gpio_suspend() and ioh_gpio_resume()) from gpio-ml-ioh.  That
would mean gpio-ml-ioh wouldn't support power management at all, which
isn't a good thing, but maybe it would be even more motivation to
unify it with gpio-pch (which has already been converted by
226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"))?

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
