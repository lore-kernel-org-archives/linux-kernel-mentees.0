Return-Path: <SRS0=nhK0=5K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33101C1975A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 16:38:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 026042073E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 16:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="OYN01A8R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 026042073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C7B3087813;
	Wed, 25 Mar 2020 16:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTZgTU149Mew; Wed, 25 Mar 2020 16:38:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4A295875D1;
	Wed, 25 Mar 2020 16:38:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45DA1C1D74;
	Wed, 25 Mar 2020 16:38:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D538C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 16:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 86F33883E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 16:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MaQOizt6eG5Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 16:38:27 +0000 (UTC)
X-Greylist: delayed 00:07:09 by SQLgrey-1.7.6
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D24C7883B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3706; q=dns/txt; s=iport;
 t=1585154306; x=1586363906;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=XODqsNkzk78qQBBhDHsB4Un4cvki1BxKm7wKbk22n68=;
 b=OYN01A8Rsa3Pm5Nq7FpBc6PVm2fbH/QmggwxEBA6tWezD5m2BDJj3HRd
 mthH3bOkKsyhdUVVR7+dx0kvDYAZU75j1XEa7iPHXA5kQi8dIm7yN+5pU
 KMnWyLo2v3kGDBK2emYjcnU12MT16cYv2fCx7qLBShYRcd9YsYvDlYwGJ k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ANAAAgh3te/xbLJq1mGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFpAwEBAQELAYF8gW0gEiqEGYkCh2sIJYlsj2C?=
 =?us-ascii?q?BewoBAQEMAQEvBAEBhEQCgkw2Bw4CAwEBCwEBBQEBAQIBBQRthWKFYwEBAQE?=
 =?us-ascii?q?CASMVQRALFQMCAiYCAiE2BgEMBgIBAYMigkwDDiCtN3WBMoVLgmsNYoE+gQ4?=
 =?us-ascii?q?qAYxIgUE/gREnDIJhPoIbhUGCXgSNWIk3cZgRRIJGkkuENwYdjyeMNy2OZIt?=
 =?us-ascii?q?HkC0CBAsCFYFZAjCBWDMaCBsVgydQGA2OKReBBAEIjRo/AzCPJwEB?=
X-IronPort-AV: E=Sophos;i="5.72,304,1580774400"; d="scan'208";a="24752855"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
 ([173.38.203.22])
 by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 25 Mar 2020 16:31:14 +0000
Received: from [10.63.114.242] ([10.63.114.242]) (authenticated bits=0)
 by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id 02PGVCim026801
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Wed, 25 Mar 2020 16:31:13 GMT
To: Kelsey Skunberg <skunberg.kelsey@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
References: <20200325151708.32612-1-skunberg.kelsey@gmail.com>
Message-ID: <bf3ffd93-5dac-0c38-9029-9e58bfb187a5@cisco.com>
Date: Wed, 25 Mar 2020 18:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325151708.32612-1-skunberg.kelsey@gmail.com>
Content-Language: en-US
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.114.242, [10.63.114.242]
X-Outbound-Node: aer-core-2.cisco.com
Cc: Kelsey Skunberg <kelsey.skunberg@gmail.com>,
 stable <stable@vger.kernel.org>, ddutile@redhat.com, ruslan.bilovol@gmail.com,
 bhelgaas@google.com, linux-kernel-mentees@lists.linuxfoundation.org,
 bodong@mellanox.com
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
From: Ruslan Bilovol via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Ruslan Bilovol <rbilovol@cisco.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 3/25/20 5:17 PM, Kelsey Skunberg wrote:
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

Thanks Kelsey for the quick fix.

Tested-by: Ruslan Bilovol <rbilovol@cisco.com>

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
>   drivers/pci/pci-sysfs.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 13f766db0684..667e13d597ff 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -464,7 +464,10 @@ static ssize_t dev_rescan_store(struct device *dev,
>   	}
>   	return count;
>   }
> -static DEVICE_ATTR_WO(dev_rescan);
> +static struct device_attribute dev_rescan_attr = __ATTR(rescan,
> +							0220, NULL,
> +							dev_rescan_store);
> +
>   
>   static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
>   			    const char *buf, size_t count)
> @@ -481,9 +484,9 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
>   static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0220, NULL,
>   				  remove_store);
>   
> -static ssize_t bus_rescan_store(struct device *dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t dev_bus_rescan_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
>   {
>   	unsigned long val;
>   	struct pci_bus *bus = to_pci_bus(dev);
> @@ -501,7 +504,7 @@ static ssize_t bus_rescan_store(struct device *dev,
>   	}
>   	return count;
>   }
> -static DEVICE_ATTR_WO(bus_rescan);
> +static DEVICE_ATTR(rescan, 0220, NULL, dev_bus_rescan_store);
>   
>   #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
>   static ssize_t d3cold_allowed_store(struct device *dev,
> @@ -641,7 +644,7 @@ static struct attribute *pcie_dev_attrs[] = {
>   };
>   
>   static struct attribute *pcibus_attrs[] = {
> -	&dev_attr_bus_rescan.attr,
> +	&dev_attr_rescan.attr,
>   	&dev_attr_cpuaffinity.attr,
>   	&dev_attr_cpulistaffinity.attr,
>   	NULL,
> @@ -1487,7 +1490,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
>   
>   static struct attribute *pci_dev_hp_attrs[] = {
>   	&dev_attr_remove.attr,
> -	&dev_attr_dev_rescan.attr,
> +	&dev_rescan_attr.attr,
>   	NULL,
>   };
>   
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
