Return-Path: <SRS0=nhK0=5K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02BCC43331
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 22:10:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9711A20719
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 22:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FltFgdlK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9711A20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 775F225C08;
	Wed, 25 Mar 2020 22:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ig4iEMwWziEN; Wed, 25 Mar 2020 22:10:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 44A7425AD0;
	Wed, 25 Mar 2020 22:10:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F0D9C1D7C;
	Wed, 25 Mar 2020 22:10:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A814C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ECAB125C08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 22:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CahdoYFD3XUN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 22:10:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C49225AD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 22:10:35 +0000 (UTC)
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0F9620719;
 Wed, 25 Mar 2020 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585174235;
 bh=wloj/EPW+OkyZtwQxndjXMPki61/NdW12lp51YiYTEc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=FltFgdlKsLUIr06TgjYDl3xuTRpmeUvHTz9DBzAOP0fcHWjtGO2OAqUAgsmhfCTK9
 SO/Jn7FWP/Lbgnjd1M5kl9cS43HivJClsd1JipENC9IyU/ha2yT8xElvQXZWT03EtB
 UHw+RwlbloTcmJQU79d0wgbveu8CzrA9KTUurhPk=
Date: Wed, 25 Mar 2020 17:10:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Message-ID: <20200325221033.GA88141@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325151708.32612-1-skunberg.kelsey@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: linux-pci@vger.kernel.org, Kelsey Skunberg <kelsey.skunberg@gmail.com>,
 rbilovol@cisco.com, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, ddutile@redhat.com, ruslan.bilovol@gmail.com,
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

Hi Kelsey,

On Wed, Mar 25, 2020 at 09:17:08AM -0600, Kelsey Skunberg wrote:
> From: Kelsey Skunberg <kelsey.skunberg@gmail.com>
> 
> rename device attribute name arguments 'bus_rescan' and 'dev_rescan' to 'rescan'
> to avoid breaking userspace applications.
> 
> The attribute argument names were changed in the following commits:
> 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
> 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
> 
> Revert the names used for attributes back to the names used before the above
> patches were applied. This also requires to change DEVICE_ATTR_WO() to
> DEVICE_ATTR() and __ATTR().
> 
> Note when using DEVICE_ATTR() the attribute is automatically named
> dev_attr_<name>.attr. To avoid duplicated names between attributes, use
> __ATTR() instead of DEVICE_ATTR() to a assign a custom attribute name for
> dev_rescan.
> 
> change bus_rescan_store() to dev_bus_rescan_store() to complete matching the
> names used before the mentioned patches were applied.
> 
> Fixes: 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
> Fixes: 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
> 
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Kelsey Skunberg <kelsey.skunberg@gmail.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> 
> v2 updates: 
> 	commit log updated to include 'Fixes: *' and Cc: stable to aid commit
> 	being backported properly.
> 
>  drivers/pci/pci-sysfs.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 13f766db0684..667e13d597ff 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -464,7 +464,10 @@ static ssize_t dev_rescan_store(struct device *dev,
>  	}
>  	return count;
>  }
> -static DEVICE_ATTR_WO(dev_rescan);
> +static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> +							0220, NULL,
> +							dev_rescan_store);
> +
>  
>  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
>  			    const char *buf, size_t count)
> @@ -481,9 +484,9 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
>  static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0220, NULL,
>  				  remove_store);
>  
> -static ssize_t bus_rescan_store(struct device *dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t dev_bus_rescan_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
>  {
>  	unsigned long val;
>  	struct pci_bus *bus = to_pci_bus(dev);
> @@ -501,7 +504,7 @@ static ssize_t bus_rescan_store(struct device *dev,
>  	}
>  	return count;
>  }
> -static DEVICE_ATTR_WO(bus_rescan);
> +static DEVICE_ATTR(rescan, 0220, NULL, dev_bus_rescan_store);
>  
>  #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
>  static ssize_t d3cold_allowed_store(struct device *dev,
> @@ -641,7 +644,7 @@ static struct attribute *pcie_dev_attrs[] = {
>  };
>  
>  static struct attribute *pcibus_attrs[] = {
> -	&dev_attr_bus_rescan.attr,
> +	&dev_attr_rescan.attr,
>  	&dev_attr_cpuaffinity.attr,
>  	&dev_attr_cpulistaffinity.attr,
>  	NULL,
> @@ -1487,7 +1490,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
>  
>  static struct attribute *pci_dev_hp_attrs[] = {
>  	&dev_attr_remove.attr,
> -	&dev_attr_dev_rescan.attr,
> +	&dev_rescan_attr.attr,
>  	NULL,
>  };

Thanks for taking care of this!  Two questions:

1) You supplied permissions of 0220, but DEVICE_ATTR_WO()
uses__ATTR_WO(), which uses 0200.  Shouldn't we keep 0200?

2) I think the use of __ATTR() for the device side and DEVICE_ATTR()
for the bus side is confusing.  Couldn't we accomplish the same thing
with a patch like the following (compiled but not tested)?

Bjorn


commit 06094b3fd9f1 ("PCI: sysfs: Revert "rescan" file renames")
Author: Kelsey Skunberg <kelsey.skunberg@gmail.com>
Date:   Wed Mar 25 09:17:08 2020 -0600

    PCI: sysfs: Revert "rescan" file renames
    
    We changed these sysfs filenames:
    
      .../pci_bus/<domain:bus>/rescan  ->  .../pci_bus/<domain:bus>/bus_rescan
      .../<domain:bus:dev.fn>/rescan   ->  .../<domain:bus:dev.fn>/dev_rescan
    
    and Ruslan reported [1] that this broke a userspace application.
    
    Revert these name changes so both files are named "rescan" again.
    
    The argument to DEVICE_ATTR_WO() determines both the struct
    device_attribute name and the .store() function name.  We have to
    use __ATTR() so we can specify different .store() functions for
    the two "rescan" files.
    
    [1] https://lore.kernel.org/r/CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com
    
    [bhelgaas: commit log]
    Fixes: 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
    Fixes: 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
    Link: https://lore.kernel.org/r/20200325151708.32612-1-skunberg.kelsey@gmail.com
    Signed-off-by: Kelsey Skunberg <kelsey.skunberg@gmail.com>
    Cc: stable@vger.kernel.org	# v5.4+

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 13f766db0684..bf025a2c296d 100644
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
