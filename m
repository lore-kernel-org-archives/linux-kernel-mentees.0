Return-Path: <SRS0=cPux=5O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF5BC43331
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Mar 2020 07:33:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52987206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Mar 2020 07:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52987206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 00226204C7;
	Sun, 29 Mar 2020 07:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atmUfPn94vA5; Sun, 29 Mar 2020 07:33:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EE4572034B;
	Sun, 29 Mar 2020 07:33:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD72BC089E;
	Sun, 29 Mar 2020 07:33:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13606C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 07:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DDD2688302
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 07:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SdBJvU9QquWn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 07:33:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D169387FC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 07:33:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FA18206E6;
 Sun, 29 Mar 2020 07:33:08 +0000 (UTC)
Date: Sun, 29 Mar 2020 09:33:04 +0200
From: Greg KH <greg@kroah.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200329073304.GA3911175@kroah.com>
References: <20200326063524.GA922107@kroah.com>
 <20200328200633.GA102137@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328200633.GA102137@google.com>
Cc: linux-pci@vger.kernel.org, Kelsey Skunberg <kelsey.skunberg@gmail.com>,
 rbilovol@cisco.com, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, ddutile@redhat.com, ruslan.bilovol@gmail.com,
 Kelsey Skunberg <skunberg.kelsey@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, bodong@mellanox.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] PCI: sysfs: Change bus_rescan
 and dev_rescan to rescan
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

On Sat, Mar 28, 2020 at 03:06:33PM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 26, 2020 at 07:35:24AM +0100, Greg KH wrote:
> > On Wed, Mar 25, 2020 at 05:10:33PM -0500, Bjorn Helgaas wrote:
> > > -static DEVICE_ATTR_WO(dev_rescan);
> > > +static struct device_attribute dev_attr_dev_rescan = __ATTR(rescan, 0200, NULL,
> > > +							    dev_rescan_store);
> > 
> > Oops, this should just be DEVICE_ATTR(), no need for __ATTR() as this
> > isn't a kobject-only file.
> > 
> > So how about:
> > 
> > static DEVICE_ATTR(rescan, 0200, NULL, dev_rescan_store);
> 
> I don' think DEVICE_ATTR() works in this case because it uses the
> first argument ("rescan") to build both the C symbol for the
> device_attribute struct and the sysfs filename.
> 
> There are two instances in this file.  The two sysfs "rescan" files
> are not a problem, but the two "dev_attr_rescan_name" C symbols *are*.
> We could resolve that by putting the bus attributes in a different
> source file than the dev attributes, but it doesn't seem worth it now.
> 
> I tentatively have the patch below on pci/misc.  I dropped the
> tested-by and reviewed-by because I didn't want to put words in your
> mouths :)

Ah, yeah, you are right __ATTR() is what you need to use here.

Your patch looks good:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
