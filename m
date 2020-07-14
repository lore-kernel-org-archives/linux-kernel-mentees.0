Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECB7C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 00:38:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1564D2186A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 00:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s042Kyzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1564D2186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E84EC8822A;
	Tue, 14 Jul 2020 00:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id naYumfkTeKEm; Tue, 14 Jul 2020 00:38:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DA2187EB4;
	Tue, 14 Jul 2020 00:38:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50AF5C088E;
	Tue, 14 Jul 2020 00:38:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEB06C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE0B589FFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZgnZW80N+LN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:38:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1A67289E95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:38:18 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43BF721835;
 Tue, 14 Jul 2020 00:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594687097;
 bh=pFcNS2ygVqW7ey6A2Cca3OTCddtdMGr4gJx98JrrPYY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=s042KyzvtI4w4VGAyAkcy2v2y653tZtfuqChNgbbl0qQaDRvArLmp56nOPblDDmFX
 exgh+cqRpD+VVSxisUJXcDotaJf7qZEJrbzrGDxsyVrzVeo1F/OeYxIXhJeZBTbSRu
 QXaXwEPSGMFFUJ2ZslA7SJPv7Ne89gWFHQYESUhI=
Date: Mon, 13 Jul 2020 19:38:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <20200714003814.GA292013@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4a46846-208f-c834-56d7-02543c395795@xs4all.nl>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/6] [media] cx23885: use
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

On Mon, Jul 13, 2020 at 12:01:51PM +0200, Hans Verkuil wrote:
> On 29/06/2020 09:36, Vaibhav Gupta wrote:
> > The .suspend() and .resume() callbacks are not defined for this driver.
> > Still, their power managemgement stucture can be easily upgraded to
> 
> management structure
> 
> > gemeric, without affecting its normal behaviour.
> 
> generic
> 
> > Hence, define them NULL and use struct dev_pm_ops type to bind them.
> > 
> > Compile-tested only.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/media/pci/cx23885/cx23885-core.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
> > index 7e0b0b7cc2a3..da9ee7270dfd 100644
> > --- a/drivers/media/pci/cx23885/cx23885-core.c
> > +++ b/drivers/media/pci/cx23885/cx23885-core.c
> > @@ -2230,14 +2230,18 @@ static const struct pci_device_id cx23885_pci_tbl[] = {
> >  };
> >  MODULE_DEVICE_TABLE(pci, cx23885_pci_tbl);
> >  
> > +#define cx23885_suspend NULL
> > +#define cx23885_resume NULL
> > +
> > +static SIMPLE_DEV_PM_OPS(cx23885_pm_ops, cx23885_suspend, cx23885_resume);
> > +
> >  static struct pci_driver cx23885_pci_driver = {
> > -	.name     = "cx23885",
> > -	.id_table = cx23885_pci_tbl,
> > -	.probe    = cx23885_initdev,
> > -	.remove   = cx23885_finidev,
> > +	.name      = "cx23885",
> > +	.id_table  = cx23885_pci_tbl,
> > +	.probe     = cx23885_initdev,
> > +	.remove    = cx23885_finidev,
> >  	/* TODO */
> > -	.suspend  = NULL,
> > -	.resume   = NULL,
> > +	.driver.pm = &cx23885_pm_ops,
> 
> I don't entirely understand this. Wouldn't it be sufficient to just
> drop the .suspend/.resume assignments here? It is now required for
> driver.pm to be non-NULL?
> 
> I'm not up to speed on the changes, but normally you can leave things
> NULL if you don't support a feature (PM in this case).

I think this patch will break things.  Previously, we had:

  cx23885_pci_driver.suspend == NULL
  cx23885_pci_driver.resume == NULL
  cx23885_pci_driver.driver.pm == NULL

pci_pm_suspend() looks like:

  if (pci_has_legacy_pm_support(pci_dev))
    return pci_legacy_suspend(dev, PMSG_SUSPEND);

  if (!pm) {
    pci_pm_default_suspend(pci_dev);
    return 0;
  }

pci_has_legacy_pm_support() was false since drv->suspend and
drv->resume are both NULL, so we'd take the pci_pm_default_suspend()
path.  After this patch, driver.pm would no longer be NULL, so we'd
take a different path that is clearly not equivalent.

I think you should do this:

  - 	/* TODO */
  -	.suspend  = NULL,
  -	.resume   = NULL,

and leave .driver.pm NULL by not mentioning it at all.  That should be
identical at the object code level since those are the defaults
anyway.

That almost looks like useless churn, but the point of this patch is
to remove use of PCI legacy PM (pci_driver.suspend and .resume) so we
can completely remove that infrastructure from the PCI core, including
the .suspend and .resume members of struct pci_driver, so we really do
need to do it.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
