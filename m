Return-Path: <SRS0=bgCq=ME=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B3AC07E99
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 22:36:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE3F611AB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 22:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BE3F611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04752607E8;
	Mon, 12 Jul 2021 22:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwTlZGJghlyy; Mon, 12 Jul 2021 22:36:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CA3AE60610;
	Mon, 12 Jul 2021 22:36:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2D68C0010;
	Mon, 12 Jul 2021 22:36:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C015AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 22:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A797640188
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 22:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8pjwoui2754
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 22:36:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA10A400F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 22:36:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 303CF61183;
 Mon, 12 Jul 2021 22:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626129393;
 bh=ZLUAxjTwJuR1eoy9AUGR/u9jh4N+I5I/fJ261D+fEQk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HOmcKa4Z9wxBEQ9WYqiglwEhp3GIsvbMPGxKk8yReBkc9xoCypcbo8DSB3XreUBAs
 x/q8pHobaTJlwT2XnfKGKWOSDuDFyfSmy+RKeymJeBo8ZHFgH0CDiriZqFdMOkavis
 TipwjcettlCG9w5QkkFlwwdsQESA5PIIGM82CDaMqfVOoNn17hkXW5+9OaVUhZ4WfL
 txUY8Ocbzw5NSfvRvSb0Pu9L2onlsZxpnSn12qAYxFV17HahRbaWSTqFsMHJTPCow1
 aeJZd718H+PvQAUC07Hb6JoxXv2OCMes/TMU18gflDEcFMcHkYuqX64Hh/qqVBUlbU
 A86c7L4B6Qhcg==
Date: Mon, 12 Jul 2021 17:36:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
 dev_pm_ops
Message-ID: <20210712223631.GA1682719@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YOwr/GMIExCoNjeZ@smile.fi.intel.com>
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

On Mon, Jul 12, 2021 at 02:48:12PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 08, 2021 at 04:47:06PM -0500, Bjorn Helgaas wrote:
> > On Thu, Apr 02, 2020 at 11:23:27PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 2, 2020 at 11:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Thu, Apr 02, 2020 at 09:33:46PM +0300, Andy Shevchenko wrote:
> > > > > On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> > > > > >
> > > > > > Convert the legacy callback .suspend() and .resume()
> > > > > > to the generic ones.
> > > > >
> > > > > Thank you for the patch.
> > > > >
> > > > > Rather then doing this I think the best approach is to unify gpio-pch
> > > > > and gpio-ml-ioh together.
> > > > > Under umbrella of the task, the clean ups like above are highly
> > > > > appreciated.
> > > >
> > > > I'd be all in favor of that, but what Vaibhav is working toward is
> > > > eliminating use of legacy PM in PCI drivers.  I think unifying drivers
> > > > is really out of scope for that project.
> > > >
> > > > If you'd rather leave gpio-ml-ioh.c alone for now, I suggest that
> > > > Vaibhav move on to other PCI drivers that use legacy PM.  If we
> > > > convert all the others away from legacy PM and gpio-ml-ioh.c is the
> > > > only one remaining, then I guess we can revisit this :)
> > > 
> > > Then skip this driver for good.
> > > 
> > > > Or, maybe converting gpio-ml-ioh.c now, along the lines of
> > > > 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), would be one small
> > > > step towards the eventual unification, by making gpio-pch and
> > > > gpio-ml-ioh a little more similar.
> > > 
> > > I think it will delay the real work here (very old code motivates
> > > better to get rid of it then semi-fixed one).
> > 
> > With respect, I think it is unreasonable to use the fact that
> > gpio-ml-ioh and gpio-pch should be unified to hold up the conversion
> > of gpio-ml-ioh to generic power management.
> > 
> > I do not want to skip gpio-ml-ioh for good, because it is one of the
> > few remaining drivers that use the legacy PCI PM interfaces.  We are
> > very close to being able to remove a significant amount of ugly code
> > from the PCI core.
> 
> Makes sense (1).
> 
> > gpio-ml-ioh and gpio-pch do look quite similar, and no doubt it would
> > be great to unify them.  But without datasheets or hardware to test,
> 
> Datasheets are publicly available (at least one may google and find some
> information about those PCH chips). I have in possession the hardware for
> gpio-pch. I can easily test that part at least.

If you have a URL for those datasheets, can you share it?  I spent
some time looking but all I found was 1-2 page marketing brochures.

> > that's not a trivial task, and I don't think that burden should fall
> > on anyone who wants to make any improvements to these drivers.
> 
> > Another alternative would be to remove legacy PCI PM usage
> > (ioh_gpio_suspend() and ioh_gpio_resume()) from gpio-ml-ioh.  That
> > would mean gpio-ml-ioh wouldn't support power management at all, which
> > isn't a good thing, but maybe it would be even more motivation to
> > unify it with gpio-pch (which has already been converted by
> > 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"))?
> 
> With regard to (1) probably we may exceptionally accept the fix to
> gpio-ml-ioh, but I really prefer to do the much more _useful_ job on
> it by unifying the two.

Should Vaibhav re-post this patch, or do you want to pull it from the
archives?  I just checked and it still applies cleanly to v5.14-rc1.

Here it is for reference:
  https://lore.kernel.org/lkml/20200402155057.30667-1-vaibhavgupta40@gmail.com/

I'll post a couple small patches toward unifying them.  They don't do
the whole job but they're baby steps.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
