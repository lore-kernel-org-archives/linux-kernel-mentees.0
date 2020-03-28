Return-Path: <SRS0=0uWt=5N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F5DC2D0EE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Mar 2020 20:06:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E845206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Mar 2020 20:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qd/zSnxF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E845206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4728B87A05;
	Sat, 28 Mar 2020 20:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcvCA1i73IVb; Sat, 28 Mar 2020 20:06:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A75C18761F;
	Sat, 28 Mar 2020 20:06:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E9CAC18DA;
	Sat, 28 Mar 2020 20:06:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57670C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Mar 2020 20:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 42CAC8761F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Mar 2020 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Le2cD8Gw3B7a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Mar 2020 20:06:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AA0ED8761C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Mar 2020 20:06:35 +0000 (UTC)
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A103206E6;
 Sat, 28 Mar 2020 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585425995;
 bh=B6FtBp+Kqnrr1x0jjJQnixnajydww8BM+vQDsjzdV4Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Qd/zSnxFEl0abPfcWo6gRSzrSZZkcwrZmB6C9HPDpLawRVL+DDjkVJC8Cpmt5WF6w
 4QGFmMCNE6+pf6T24if73Y1YLHiQSGisuKL1fBO6cwd/gwNTw12A1BMejm113uK/eU
 JlTxFv2R3UEtRiNGE7C50UFi2CQZ6EOfornWg3Sg=
Date: Sat, 28 Mar 2020 15:06:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Greg KH <greg@kroah.com>
Message-ID: <20200328200633.GA102137@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326063524.GA922107@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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

On Thu, Mar 26, 2020 at 07:35:24AM +0100, Greg KH wrote:
> On Wed, Mar 25, 2020 at 05:10:33PM -0500, Bjorn Helgaas wrote:
> > -static DEVICE_ATTR_WO(dev_rescan);
> > +static struct device_attribute dev_attr_dev_rescan = __ATTR(rescan, 0200, NULL,
> > +							    dev_rescan_store);
> 
> Oops, this should just be DEVICE_ATTR(), no need for __ATTR() as this
> isn't a kobject-only file.
> 
> So how about:
> 
> static DEVICE_ATTR(rescan, 0200, NULL, dev_rescan_store);

I don' think DEVICE_ATTR() works in this case because it uses the
first argument ("rescan") to build both the C symbol for the
device_attribute struct and the sysfs filename.

There are two instances in this file.  The two sysfs "rescan" files
are not a problem, but the two "dev_attr_rescan_name" C symbols *are*.
We could resolve that by putting the bus attributes in a different
source file than the dev attributes, but it doesn't seem worth it now.

I tentatively have the patch below on pci/misc.  I dropped the
tested-by and reviewed-by because I didn't want to put words in your
mouths :)

Bjorn

commit bce34ce1806e ("PCI: sysfs: Revert "rescan" file renames")
Author: Kelsey Skunberg <kelsey.skunberg@gmail.com>
Date:   Wed Mar 25 09:17:08 2020 -0600

    PCI: sysfs: Revert "rescan" file renames
    
    We changed these sysfs filenames:
    
      .../pci_bus/<domain:bus>/rescan  ->  .../pci_bus/<domain:bus>/bus_rescan
      .../<domain:bus:dev.fn>/rescan   ->  .../<domain:bus:dev.fn>/dev_rescan
    
    and Ruslan reported [1] that this broke a userspace application.
    
    Revert these name changes so both files are named "rescan" again.
    
    Note that we have to use __ATTR() to assign custom C symbols, i.e.,
    "struct device_attribute <symbol>".
    
    [1] https://lore.kernel.org/r/CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com
    
    [bhelgaas: commit log, use __ATTR() both places so we don't have to rename
    the attributes]
    Fixes: 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
    Fixes: 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
    Link: https://lore.kernel.org/r/20200325151708.32612-1-skunberg.kelsey@gmail.com
    Signed-off-by: Kelsey Skunberg <kelsey.skunberg@gmail.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Cc: stable@vger.kernel.org	# v5.4+

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 13f766db0684..335dd6fbf039 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -464,7 +464,8 @@ static ssize_t dev_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR_WO(dev_rescan);
+static struct device_attribute dev_attr_dev_rescan = __ATTR(rescan, 0200, NULL,
+							    dev_rescan_store);
 
 static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
@@ -501,7 +502,8 @@ static ssize_t bus_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR_WO(bus_rescan);
+static struct device_attribute dev_attr_bus_rescan = __ATTR(rescan, 0200, NULL,
+							    bus_rescan_store);
 
 #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
 static ssize_t d3cold_allowed_store(struct device *dev,
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
