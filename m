Return-Path: <SRS0=DLZg=AT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DCEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jul 2020 10:50:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF5C720674
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jul 2020 10:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linux-powerpc-org.20150623.gappssmtp.com header.i=@linux-powerpc-org.20150623.gappssmtp.com header.b="NWaxEzch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF5C720674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-powerpc.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8B2FF894B8;
	Wed,  8 Jul 2020 10:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fv-TtiwaazO8; Wed,  8 Jul 2020 10:50:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 792B489470;
	Wed,  8 Jul 2020 10:50:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D3BFC077B;
	Wed,  8 Jul 2020 10:50:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B1C2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jul 2020 10:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 81BAB2631D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jul 2020 10:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z+7yZ1Tvnd8h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jul 2020 10:50:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 2A774207A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jul 2020 10:50:31 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id p20so49826963ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 08 Jul 2020 03:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qQUw/m5dPWqaUtm1QGUmKPUd6rNgSK3c1WDMgadyuQU=;
 b=NWaxEzchKzL2dyCGJv3mBTmPqwKK3A/r8gcuZAvYNI+CNBOxlyEhWv0d56OBP61wKj
 FJwUjDEcolsFp6PxkFymeCoXzPhoaDum+rmLoQ/B//DPUKH29e0YjKCoD+63IB/Jusdy
 GUnUP2fpF4vVJ0Ab5u88g5Jtx0e3bEoJb0uOfPnG2+cMiYbkgHkbd74NbCxWBAuKNPr8
 4ul5rjsHNGr047LizKndHxju/mEJYzljDS5/sOuIYUenxR6qSo9RfTINtMOASZpgpdy1
 v7F4fiexnXwZs4zVhZgsPkpoCPnOR7tLULSbpmNgKtvtpjK6D9Fdr5h+H9IZ1XRky6yJ
 A8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qQUw/m5dPWqaUtm1QGUmKPUd6rNgSK3c1WDMgadyuQU=;
 b=nwIjsSa73O3L/WkDkw1EWeTy3+fsMoBKMkVMiwZMD4lUn8o0HwNMN15E6Meo6XUBGZ
 qMQTFu+LmVWnLSK3CEPxo3H0PrTSpkgAlnL050uMofTl/82u0wq/9NLRLgg3mEWjR4MN
 4BDlICn8iEZS2Oo77EvNxmdnWxObT9Bx8aw136KjoIxCnovCvG3HGoShK2k+9iBVQ4Zp
 3XbzGXuYzZQDIOCr6Cz0uXfqCKWGo//O+WckIx+y/X6hNV64UTcCVT4zuXIom0W4fVVV
 JGh+46DF6DZDa3Vs0uIYVkKh8BEwU4CKNtfU5YWBmWSo4aD6hLFBzaRAILpHMk1gdXQ0
 /Kxg==
X-Gm-Message-State: AOAM533NDLpDzQHdmwQqws/YqleLog+6rT7zlzsJGNj4EXnsPNFSeBl5
 e2tAl1J+YAd46OioijBX3hcVXmvfcJUx0Oj/PQf1zmRcF5E=
X-Google-Smtp-Source: ABdhPJzEa9ajUiJz23roTV6kpHpX1754dz4EdyYOHi1EqT8HZ++9AzZ5w67qZnJM0hCUvBCyXyVsyOUl6/cpW7fdBW0=
X-Received: by 2002:aa7:d446:: with SMTP id q6mr66669945edr.218.1594204995887; 
 Wed, 08 Jul 2020 03:43:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:3a1b:0:0:0:0:0 with HTTP;
 Wed, 8 Jul 2020 03:43:15 -0700 (PDT)
X-Originating-IP: [5.35.13.201]
In-Reply-To: <CAOJe8K0aYeba0fOpSz6dzgWUwAP8FTyOpQc8rckWO=RPTKiprw@mail.gmail.com>
References: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
 <20200701165057.667799-7-vaibhavgupta40@gmail.com>
 <CAOJe8K0aYeba0fOpSz6dzgWUwAP8FTyOpQc8rckWO=RPTKiprw@mail.gmail.com>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Wed, 8 Jul 2020 13:43:15 +0300
Message-ID: <CAOJe8K3j=FJ2-J+CqeG-hUXApi+UgqX83U20m-2YpgD+tEvgPg@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>,
 David Dillow <dave@thedillows.org>, Somnath Kotur <somnath.kotur@broadcom.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 Zorik Machulsky <zorik@amazon.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guy Tzalik <gtzalik@amazon.com>, Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ion Badulescu <ionut@badula.org>, Netanel Belgazal <netanel@amazon.com>,
 Jon Mason <jdmason@kudzu.us>, Saeed Bishara <saeedb@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 "David S. Miller" <davem@davemloft.net>, Tariq Toukan <tariqt@mellanox.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 06/11] sundance: use generic
	power management
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

On 7/3/20, Denis Kirjanov <kda@linux-powerpc.org> wrote:
> On 7/1/20, Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>> With legacy PM, drivers themselves were responsible for managing the
>> device's power states and takes care of register states.
>>
>> After upgrading to the generic structure, PCI core will take care of
>> required tasks and drivers should do only device-specific operations.
>>
>> Thus, there is no need to call the PCI helper functions like
>> pci_enable/disable_device(), pci_save/restore_sate() and
>> pci_set_power_state().
>>
>> Compile-tested only.
>>
>> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
>
> Should be fine. I'll try to test it in the upcoming weekend

Unfortunately the suspend mode is broken on my test machine so I will
take some time :/

>
>> ---
>>  drivers/net/ethernet/dlink/sundance.c | 27 ++++++++-------------------
>>  1 file changed, 8 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/dlink/sundance.c
>> b/drivers/net/ethernet/dlink/sundance.c
>> index dc566fcc3ba9..ca97e321082d 100644
>> --- a/drivers/net/ethernet/dlink/sundance.c
>> +++ b/drivers/net/ethernet/dlink/sundance.c
>> @@ -1928,11 +1928,9 @@ static void sundance_remove1(struct pci_dev *pdev)
>>  	}
>>  }
>>
>> -#ifdef CONFIG_PM
>> -
>> -static int sundance_suspend(struct pci_dev *pci_dev, pm_message_t state)
>> +static int __maybe_unused sundance_suspend(struct device *dev_d)
>>  {
>> -	struct net_device *dev = pci_get_drvdata(pci_dev);
>> +	struct net_device *dev = dev_get_drvdata(dev_d);
>>  	struct netdev_private *np = netdev_priv(dev);
>>  	void __iomem *ioaddr = np->base;
>>
>> @@ -1942,30 +1940,24 @@ static int sundance_suspend(struct pci_dev
>> *pci_dev,
>> pm_message_t state)
>>  	netdev_close(dev);
>>  	netif_device_detach(dev);
>>
>> -	pci_save_state(pci_dev);
>>  	if (np->wol_enabled) {
>>  		iowrite8(AcceptBroadcast | AcceptMyPhys, ioaddr + RxMode);
>>  		iowrite16(RxEnable, ioaddr + MACCtrl1);
>>  	}
>> -	pci_enable_wake(pci_dev, pci_choose_state(pci_dev, state),
>> -			np->wol_enabled);
>> -	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
>> +
>> +	device_set_wakeup_enable(dev_d, np->wol_enabled);
>>
>>  	return 0;
>>  }
>>
>> -static int sundance_resume(struct pci_dev *pci_dev)
>> +static int __maybe_unused sundance_resume(struct device *dev_d)
>>  {
>> -	struct net_device *dev = pci_get_drvdata(pci_dev);
>> +	struct net_device *dev = dev_get_drvdata(dev_d);
>>  	int err = 0;
>>
>>  	if (!netif_running(dev))
>>  		return 0;
>>
>> -	pci_set_power_state(pci_dev, PCI_D0);
>> -	pci_restore_state(pci_dev);
>> -	pci_enable_wake(pci_dev, PCI_D0, 0);
>> -
>>  	err = netdev_open(dev);
>>  	if (err) {
>>  		printk(KERN_ERR "%s: Can't resume interface!\n",
>> @@ -1979,17 +1971,14 @@ static int sundance_resume(struct pci_dev
>> *pci_dev)
>>  	return err;
>>  }
>>
>> -#endif /* CONFIG_PM */
>> +static SIMPLE_DEV_PM_OPS(sundance_pm_ops, sundance_suspend,
>> sundance_resume);
>>
>>  static struct pci_driver sundance_driver = {
>>  	.name		= DRV_NAME,
>>  	.id_table	= sundance_pci_tbl,
>>  	.probe		= sundance_probe1,
>>  	.remove		= sundance_remove1,
>> -#ifdef CONFIG_PM
>> -	.suspend	= sundance_suspend,
>> -	.resume		= sundance_resume,
>> -#endif /* CONFIG_PM */
>> +	.driver.pm	= &sundance_pm_ops,
>>  };
>>
>>  static int __init sundance_init(void)
>> --
>> 2.27.0
>>
>>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
