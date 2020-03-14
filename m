Return-Path: <SRS0=5JV7=47=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4951BC0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Mar 2020 10:52:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC4462076D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Mar 2020 10:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oP4Z84GP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC4462076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A26E589814;
	Sat, 14 Mar 2020 10:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id La3IV9pwzX2O; Sat, 14 Mar 2020 10:52:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB86289809;
	Sat, 14 Mar 2020 10:52:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D27B3C18DA;
	Sat, 14 Mar 2020 10:52:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CF86C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 10:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 991598980B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 10:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjQfUjXOeJFy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 10:51:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6CA6589809
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 10:51:58 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id t28so10246793ott.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Mar 2020 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n1RmxQ4NZXQ7rw9vMo4F3cQPPCUsvnJCcy5IALIShCI=;
 b=oP4Z84GPd42J+xB8hV62mLO5B+hW+kjw/d0Ue01sGgE8C+xC0goNZqF3fU2Jt0Wm+C
 I28PCupkKSR+y1/T3hmWzEZboVGwEedrEobKE7Qc9gPmr30pAeV7czi2JvxiCeEw0MYZ
 CQzCaMr6nCK1lxlLR3/auCOBh47TNHrc6Ux5dSjQv3E8RnTsUYhm4Jb92bjNnIv+fp+0
 gnH0EbN3+A0J7Mvb3ZRvg97VD8LGwZ82bAJBUkh7NAdbBixnk3nlibxWRRHwUiGWyt0j
 THWvBbqK618A3ELONiM4Cg7g7yKTfiYx2fsDpKxQDA0+S1Oy+Q3UcpZmQPAS6Aw9uJ47
 FyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n1RmxQ4NZXQ7rw9vMo4F3cQPPCUsvnJCcy5IALIShCI=;
 b=c/kmxKcWtTWP/9fktxJTx2SfwwcS/E0jygKSq0VP/w/9+11quO6YQbacNx/p2RyN50
 jTMfThFGNRbPF5t3Y+ZF34xufwNvBFAIlrTQWnYVFdNSYgf38W923JolCCHKdgr2sGtx
 9W+uUbesYo7cr1ghg9p9G3+iiHo8Aci6sHKCuYScAZu5nk9n34qt2xtXaWvyCCY0A5Ke
 5bbIlk9F1xGqur2dW9ZmypN48Dm4pQAoBhcPsX8wLnZH96Rs1y1wbUBIAh2Gp7Ye9FxM
 VCWWzwkxoRhREiF+JqlYjKFm2o4+mcD/SaM0H1DxGyDbKkzGFjDeS0TWVhuq7A0luEl0
 HQpQ==
X-Gm-Message-State: ANhLgQ1OUQX48wXe9pjx2R27Rr2Pr1Ijf8/gGd3IEEFxBP1vqdeed12X
 PO7kSfklQf79GkoNS+KAVhGMrLxscrOfYxVK4IA=
X-Google-Smtp-Source: ADFU+vu+dpZBMmz/9HMPa6mDlQdZaf3RwuRC66msIav98HL0KnSTzuf63QxzQFJxBOd5qVB498hoIjbwuuHOiITumDs=
X-Received: by 2002:a9d:4d97:: with SMTP id u23mr15243945otk.293.1584183117512; 
 Sat, 14 Mar 2020 03:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
 <20190815153352.86143-2-skunberg.kelsey@gmail.com>
In-Reply-To: <20190815153352.86143-2-skunberg.kelsey@gmail.com>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Sat, 14 Mar 2020 12:51:47 +0200
Message-ID: <CAB=otbSYozS-ZfxB0nCiNnxcbqxwrHOSYxJJtDKa63KzXbXgpw@mail.gmail.com>
To: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Cc: linux-pci@vger.kernel.org, rbilovol@cisco.com, linux-kernel@vger.kernel.org,
 ddutile@redhat.com, bodong@mellanox.com, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3 1/4] PCI: sysfs: Define device
	attributes with DEVICE_ATTR*
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

On Thu, Aug 15, 2019 at 7:01 PM Kelsey Skunberg
<skunberg.kelsey@gmail.com> wrote:
>
> Defining device attributes should be done through the helper
> DEVICE_ATTR_RO(), DEVICE_ATTR_WO(), or similar. Change all instances using
> __ATTR* to now use its equivalent DEVICE_ATTR*.
>
> Example of old:
>
> static struct device_attribute dev_name_##_attr=__ATTR_RO(_name);
>
> Example of new:
>
> static DEVICE_ATTR_RO(_name);
>
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> ---
>  drivers/pci/pci-sysfs.c | 59 +++++++++++++++++++----------------------
>  1 file changed, 27 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 965c72104150..8af7944fdccb 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -464,9 +464,7 @@ static ssize_t dev_rescan_store(struct device *dev,
>         }
>         return count;
>  }
> -static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> -                                                       (S_IWUSR|S_IWGRP),
> -                                                       NULL, dev_rescan_store);
> +static DEVICE_ATTR(rescan, (S_IWUSR | S_IWGRP), NULL, dev_rescan_store);
>
>  static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
>                             const char *buf, size_t count)
> @@ -480,9 +478,8 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
>                 pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
>         return count;
>  }
> -static struct device_attribute dev_remove_attr = __ATTR_IGNORE_LOCKDEP(remove,
> -                                                       (S_IWUSR|S_IWGRP),
> -                                                       NULL, remove_store);
> +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, (S_IWUSR | S_IWGRP), NULL,
> +                                 remove_store);
>
>  static ssize_t dev_bus_rescan_store(struct device *dev,
>                                     struct device_attribute *attr,
> @@ -504,7 +501,7 @@ static ssize_t dev_bus_rescan_store(struct device *dev,
>         }
>         return count;
>  }
> -static DEVICE_ATTR(rescan, (S_IWUSR|S_IWGRP), NULL, dev_bus_rescan_store);
> +static DEVICE_ATTR(bus_rescan, (S_IWUSR | S_IWGRP), NULL, dev_bus_rescan_store);

This patch renamed 'rescan' to 'bus_rescan' and broke my userspace application.
There is also mismatch now between real functionality and documentation
Documentation/ABI/testing/sysfs-bus-pci which still contains old "rescan"
descriptions.

Another patch from this patch series also renamed 'rescan' to 'dev_rescan'

Here is a comparison between two stable kernels (with and without this
patch series):

v5.4
# find /sys -name '*rescan'
/sys/devices/pci0000:00/0000:00:01.2/dev_rescan
/sys/devices/pci0000:00/0000:00:01.0/dev_rescan
/sys/devices/pci0000:00/0000:00:04.0/dev_rescan
/sys/devices/pci0000:00/0000:00:00.0/dev_rescan
/sys/devices/pci0000:00/pci_bus/0000:00/bus_rescan
/sys/devices/pci0000:00/0000:00:01.3/dev_rescan
/sys/devices/pci0000:00/0000:00:03.0/dev_rescan
/sys/devices/pci0000:00/0000:00:01.1/dev_rescan
/sys/devices/pci0000:00/0000:00:02.0/dev_rescan
/sys/devices/pci0000:00/0000:00:05.0/dev_rescan
/sys/bus/pci/rescan

v4.19
# find /sys -name '*rescan'
/sys/devices/pci0000:00/0000:00:01.2/rescan
/sys/devices/pci0000:00/0000:00:01.0/rescan
/sys/devices/pci0000:00/0000:00:04.0/rescan
/sys/devices/pci0000:00/0000:00:00.0/rescan
/sys/devices/pci0000:00/pci_bus/0000:00/rescan
/sys/devices/pci0000:00/0000:00:01.3/rescan
/sys/devices/pci0000:00/0000:00:03.0/rescan
/sys/devices/pci0000:00/0000:00:01.1/rescan
/sys/devices/pci0000:00/0000:00:02.0/rescan
/sys/devices/pci0000:00/0000:00:05.0/rescan
/sys/bus/pci/rescan

Do we maintain this kind of API as non-changeable?

Thanks,
Ruslan

>
>  #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
>  static ssize_t d3cold_allowed_store(struct device *dev,
> @@ -687,16 +684,14 @@ static ssize_t sriov_drivers_autoprobe_store(struct device *dev,
>         return count;
>  }
>
> -static struct device_attribute sriov_totalvfs_attr = __ATTR_RO(sriov_totalvfs);
> -static struct device_attribute sriov_numvfs_attr =
> -               __ATTR(sriov_numvfs, (S_IRUGO|S_IWUSR|S_IWGRP),
> -                      sriov_numvfs_show, sriov_numvfs_store);
> -static struct device_attribute sriov_offset_attr = __ATTR_RO(sriov_offset);
> -static struct device_attribute sriov_stride_attr = __ATTR_RO(sriov_stride);
> -static struct device_attribute sriov_vf_device_attr = __ATTR_RO(sriov_vf_device);
> -static struct device_attribute sriov_drivers_autoprobe_attr =
> -               __ATTR(sriov_drivers_autoprobe, (S_IRUGO|S_IWUSR|S_IWGRP),
> -                      sriov_drivers_autoprobe_show, sriov_drivers_autoprobe_store);
> +static DEVICE_ATTR_RO(sriov_totalvfs);
> +static DEVICE_ATTR(sriov_numvfs, (S_IRUGO | S_IWUSR | S_IWGRP),
> +                                 sriov_numvfs_show, sriov_numvfs_store);
> +static DEVICE_ATTR_RO(sriov_offset);
> +static DEVICE_ATTR_RO(sriov_stride);
> +static DEVICE_ATTR_RO(sriov_vf_device);
> +static DEVICE_ATTR(sriov_drivers_autoprobe, (S_IRUGO | S_IWUSR | S_IWGRP),
> +                  sriov_drivers_autoprobe_show, sriov_drivers_autoprobe_store);
>  #endif /* CONFIG_PCI_IOV */
>
>  static ssize_t driver_override_store(struct device *dev,
> @@ -792,7 +787,7 @@ static struct attribute *pcie_dev_attrs[] = {
>  };
>
>  static struct attribute *pcibus_attrs[] = {
> -       &dev_attr_rescan.attr,
> +       &dev_attr_bus_rescan.attr,
>         &dev_attr_cpuaffinity.attr,
>         &dev_attr_cpulistaffinity.attr,
>         NULL,
> @@ -820,7 +815,7 @@ static ssize_t boot_vga_show(struct device *dev, struct device_attribute *attr,
>                 !!(pdev->resource[PCI_ROM_RESOURCE].flags &
>                    IORESOURCE_ROM_SHADOW));
>  }
> -static struct device_attribute vga_attr = __ATTR_RO(boot_vga);
> +static DEVICE_ATTR_RO(boot_vga);
>
>  static ssize_t pci_read_config(struct file *filp, struct kobject *kobj,
>                                struct bin_attribute *bin_attr, char *buf,
> @@ -1458,7 +1453,7 @@ static ssize_t reset_store(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static struct device_attribute reset_attr = __ATTR(reset, 0200, NULL, reset_store);
> +static DEVICE_ATTR(reset, 0200, NULL, reset_store);
>
>  static int pci_create_capabilities_sysfs(struct pci_dev *dev)
>  {
> @@ -1468,7 +1463,7 @@ static int pci_create_capabilities_sysfs(struct pci_dev *dev)
>         pcie_aspm_create_sysfs_dev_files(dev);
>
>         if (dev->reset_fn) {
> -               retval = device_create_file(&dev->dev, &reset_attr);
> +               retval = device_create_file(&dev->dev, &dev_attr_reset);
>                 if (retval)
>                         goto error;
>         }
> @@ -1553,7 +1548,7 @@ static void pci_remove_capabilities_sysfs(struct pci_dev *dev)
>         pcie_vpd_remove_sysfs_dev_files(dev);
>         pcie_aspm_remove_sysfs_dev_files(dev);
>         if (dev->reset_fn) {
> -               device_remove_file(&dev->dev, &reset_attr);
> +               device_remove_file(&dev->dev, &dev_attr_reset);
>                 dev->reset_fn = 0;
>         }
>  }
> @@ -1606,7 +1601,7 @@ static int __init pci_sysfs_init(void)
>  late_initcall(pci_sysfs_init);
>
>  static struct attribute *pci_dev_dev_attrs[] = {
> -       &vga_attr.attr,
> +       &dev_attr_boot_vga.attr,
>         NULL,
>  };
>
> @@ -1616,7 +1611,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
>         struct device *dev = kobj_to_dev(kobj);
>         struct pci_dev *pdev = to_pci_dev(dev);
>
> -       if (a == &vga_attr.attr)
> +       if (a == &dev_attr_boot_vga.attr)
>                 if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>                         return 0;
>
> @@ -1624,8 +1619,8 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
>  }
>
>  static struct attribute *pci_dev_hp_attrs[] = {
> -       &dev_remove_attr.attr,
> -       &dev_rescan_attr.attr,
> +       &dev_attr_remove.attr,
> +       &dev_attr_rescan.attr,
>         NULL,
>  };
>
> @@ -1699,12 +1694,12 @@ static const struct attribute_group pci_dev_hp_attr_group = {
>
>  #ifdef CONFIG_PCI_IOV
>  static struct attribute *sriov_dev_attrs[] = {
> -       &sriov_totalvfs_attr.attr,
> -       &sriov_numvfs_attr.attr,
> -       &sriov_offset_attr.attr,
> -       &sriov_stride_attr.attr,
> -       &sriov_vf_device_attr.attr,
> -       &sriov_drivers_autoprobe_attr.attr,
> +       &dev_attr_sriov_totalvfs.attr,
> +       &dev_attr_sriov_numvfs.attr,
> +       &dev_attr_sriov_offset.attr,
> +       &dev_attr_sriov_stride.attr,
> +       &dev_attr_sriov_vf_device.attr,
> +       &dev_attr_sriov_drivers_autoprobe.attr,
>         NULL,
>  };
>
> --
> 2.20.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
