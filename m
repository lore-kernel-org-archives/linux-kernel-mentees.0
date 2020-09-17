Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8D2C43464
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 21:37:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D78620725
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 21:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcsHyQ2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D78620725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4553F87265;
	Thu, 17 Sep 2020 21:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PZGPlyr_DDn; Thu, 17 Sep 2020 21:37:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E24BC87261;
	Thu, 17 Sep 2020 21:37:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7CE0C0859;
	Thu, 17 Sep 2020 21:37:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E584C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 21:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4D16F87729
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 21:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hK1ZhmFVS7IU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 21:37:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DF431876FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 21:37:46 +0000 (UTC)
Received: from localhost (52.sub-72-107-123.myvzw.com [72.107.123.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF88720725;
 Thu, 17 Sep 2020 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600378666;
 bh=lfE+7NXV2rCh2vNF2xCWV5wyO2bA3VO8Jj9zJUt0k68=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=DcsHyQ2iNLWu6925JgU9Rdo4Mbyqo/wjn8j3u27LU6fh5zwYdNFB7Mhz7fxx/S9/V
 R+OX1D/UFkgnazTvvvV0y0yNHrTNDWfsiLhvt/wPDQK0z63XKRVSsFa/NbG8d0ZnuD
 C/u8TmcXQ92EWaE/lZhe72ILDJIM1/S892+EGVXw=
Date: Thu, 17 Sep 2020 16:37:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Message-ID: <20200917213744.GA1739988@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANk7y0jk0CpAqvBrjr67M4+UMo9oW2+Z1NVUFAFsinLgPZzrEw@mail.gmail.com>
Cc: Linux PCI <linux-pci@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] PCI: Add support for LTR
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

On Thu, Sep 17, 2020 at 10:06:43PM +0530, Puranjay Mohan wrote:
> On Wed, Sep 16, 2020 at 3:31 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Tue, Aug 25, 2020 at 11:31:31PM +0530, Puranjay Mohan wrote:

> > > +     dev = pci_upstream_bridge(dev);
> > > +     while (dev) {
> > > +             max_snoop_sum += dev->max_snoop_latency;
> > > +             max_nosnoop_sum += dev->max_nosnoop_latency;
> >
> > dev->max_snoop_latency and dev->max_nosnoop_latency are not simple
> > scalars, are they?  Aren't they 3 bits of scale and 10 bits of value?
> > I don't think adding these is as easy as "+=" except in the simple
> > case when the scale is "000", i.e., "use the 10 bits of value as-is".
> >
> > I think we have to decode scale * latency for each device in the path,
> > add all those up, then re-encode using the appropriate scale for the
> > config write below.
>
> I was thinking about it. If we use 2 more variables and store the
> scale and value separately, then It will become easy.
> we can add the values directly but, as you said we can't add the
> scales, I will think about this more.

Adding more things to struct pci_dev consumes that space permanently
even though it's only needed during enumeration.  This LTR init is
only done once per device, so there's no need to speed it up by adding
more variables.

You'll just have to see how it looks when you code it up.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
