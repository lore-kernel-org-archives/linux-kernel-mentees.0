Return-Path: <SRS0=bgCq=ME=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2121C07E99
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 11:55:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2906610E6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 11:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2906610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E66F40153;
	Mon, 12 Jul 2021 11:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wQrXpMJC29q; Mon, 12 Jul 2021 11:55:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4510B400DD;
	Mon, 12 Jul 2021 11:55:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B772C001A;
	Mon, 12 Jul 2021 11:55:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F84CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 11:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17338605E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 11:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3j-ddl1bDw6W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 11:55:34 +0000 (UTC)
X-Greylist: delayed 00:07:11 by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41DD160597
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 11:55:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="210006289"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="210006289"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 04:48:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="561721690"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 04:48:18 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1m2uQ0-00CD4d-KB; Mon, 12 Jul 2021 14:48:12 +0300
Date: Mon, 12 Jul 2021 14:48:12 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
 dev_pm_ops
Message-ID: <YOwr/GMIExCoNjeZ@smile.fi.intel.com>
References: <CAHp75Vfpj+ENMe9u-SMKfvCsyFtOucUT9bD3qfWX+QjccZ9ZyQ@mail.gmail.com>
 <20210708214706.GA1059661@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210708214706.GA1059661@bjorn-Precision-5520>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Jul 08, 2021 at 04:47:06PM -0500, Bjorn Helgaas wrote:
> On Thu, Apr 02, 2020 at 11:23:27PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 2, 2020 at 11:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Thu, Apr 02, 2020 at 09:33:46PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> > > > >
> > > > > Convert the legacy callback .suspend() and .resume()
> > > > > to the generic ones.
> > > >
> > > > Thank you for the patch.
> > > >
> > > > Rather then doing this I think the best approach is to unify gpio-pch
> > > > and gpio-ml-ioh together.
> > > > Under umbrella of the task, the clean ups like above are highly
> > > > appreciated.
> > >
> > > I'd be all in favor of that, but what Vaibhav is working toward is
> > > eliminating use of legacy PM in PCI drivers.  I think unifying drivers
> > > is really out of scope for that project.
> > >
> > > If you'd rather leave gpio-ml-ioh.c alone for now, I suggest that
> > > Vaibhav move on to other PCI drivers that use legacy PM.  If we
> > > convert all the others away from legacy PM and gpio-ml-ioh.c is the
> > > only one remaining, then I guess we can revisit this :)
> > 
> > Then skip this driver for good.
> > 
> > > Or, maybe converting gpio-ml-ioh.c now, along the lines of
> > > 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), would be one small
> > > step towards the eventual unification, by making gpio-pch and
> > > gpio-ml-ioh a little more similar.
> > 
> > I think it will delay the real work here (very old code motivates
> > better to get rid of it then semi-fixed one).
> 
> With respect, I think it is unreasonable to use the fact that
> gpio-ml-ioh and gpio-pch should be unified to hold up the conversion
> of gpio-ml-ioh to generic power management.
> 
> I do not want to skip gpio-ml-ioh for good, because it is one of the
> few remaining drivers that use the legacy PCI PM interfaces.  We are
> very close to being able to remove a significant amount of ugly code
> from the PCI core.

Makes sense (1).

> gpio-ml-ioh and gpio-pch do look quite similar, and no doubt it would
> be great to unify them.  But without datasheets or hardware to test,

Datasheets are publicly available (at least one may google and find some
information about those PCH chips). I have in possession the hardware for
gpio-pch. I can easily test that part at least.

> that's not a trivial task, and I don't think that burden should fall
> on anyone who wants to make any improvements to these drivers.

> Another alternative would be to remove legacy PCI PM usage
> (ioh_gpio_suspend() and ioh_gpio_resume()) from gpio-ml-ioh.  That
> would mean gpio-ml-ioh wouldn't support power management at all, which
> isn't a good thing, but maybe it would be even more motivation to
> unify it with gpio-pch (which has already been converted by
> 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"))?

With regard to (1) probably we may exceptionally accept the fix to gpio-ml-ioh,
but I really prefer to do the much more _useful_ job on it by unifying the two.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
