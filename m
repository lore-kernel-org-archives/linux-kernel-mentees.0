Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2B5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 15:23:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDE852333E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 15:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2+XSPeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDE852333E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D1168772A;
	Wed,  5 Aug 2020 15:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNEhzZ96D1lJ; Wed,  5 Aug 2020 15:23:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0045787726;
	Wed,  5 Aug 2020 15:23:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2B08C0051;
	Wed,  5 Aug 2020 15:23:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BB27C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 15:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 239762051E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 15:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id br3kovAwNTL8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 15:23:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0A985203C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 15:23:34 +0000 (UTC)
Received: from localhost (mobile-166-175-186-42.mycingular.net
 [166.175.186.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 300DD22BED;
 Wed,  5 Aug 2020 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596641013;
 bh=BFqcBYITNyNBWLkZLsFiZsM+0wk0yyEyUZo4cqZHcQU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=T2+XSPehLm5jhlp/tZVgLUhQiXe5DyTRMLTdi0yOnOPWOeqAdcFxXxr4tcWPM+y80
 Cdh4VpRxiqbcyPgLAHJBx9RbeYvUy4PN6Y/AveKgLEbMnjoTIrVDvk9tRf27bcGITh
 ZkJOy9kXskrEFns8q09CV73+xDOXcG2bHwi/3Drg=
Date: Wed, 5 Aug 2020 10:23:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200805152331.GA510793@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720140031.511830-1-vaibhavgupta40@gmail.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>,
 Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>, linux-kernel@vger.kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-i2c@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Qi Wang <qi.wang@intel.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] i2c: eg20t: use generic power
	management
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

[+cc Tomoya, Linus, Qi, Ben from e9bc8fa5df1c]

On Mon, Jul 20, 2020 at 07:30:32PM +0530, Vaibhav Gupta wrote:
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
> 
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
> 
> This driver makes use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(),
> pci_enable_wake() and pci_set_power_state() to do required operations. In
> generic mode, they are no longer needed.
> 
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
> "struct pci_dev*" variable and drv data.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/i2c/busses/i2c-eg20t.c | 39 ++++++++--------------------------
>  1 file changed, 9 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> index 73f139690e4e..c0ddc4cc2ce7 100644
> --- a/drivers/i2c/busses/i2c-eg20t.c
> +++ b/drivers/i2c/busses/i2c-eg20t.c
> @@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
>  	kfree(adap_info);
>  }
>  
> -#ifdef CONFIG_PM
> -static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused pch_i2c_suspend(struct device *dev)
>  {
> -	int ret;
>  	int i;
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct adapter_info *adap_info = pci_get_drvdata(pdev);

Why don't you use "adap_info = dev_get_drvdata(dev)" as you did below,
so you don't need to_pci_dev()?

>  	void __iomem *p = adap_info->pch_data[0].pch_base_address;
>  
> @@ -872,34 +871,17 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
>  		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
>  		ioread32(p + PCH_I2CESRSTA));
>  
> -	ret = pci_save_state(pdev);
> -
> -	if (ret) {
> -		pch_pci_err(pdev, "pci_save_state\n");
> -		return ret;
> -	}
> -
> -	pci_enable_wake(pdev, PCI_D3hot, 0);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> +	device_wakeup_disable(dev);
>  
>  	return 0;
>  }
>  
> -static int pch_i2c_resume(struct pci_dev *pdev)
> +static int __maybe_unused pch_i2c_resume(struct device *dev)
>  {
>  	int i;
> -	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> -
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_restore_state(pdev);
> +	struct adapter_info *adap_info = dev_get_drvdata(dev);
>  
> -	if (pci_enable_device(pdev) < 0) {
> -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> -		return -EIO;
> -	}
> -
> -	pci_enable_wake(pdev, PCI_D3hot, 0);
> +	device_wakeup_disable(dev);

It *looks* wrong to disable wakeup in both suspend and resume.  I
think the usual pattern is to enable wakeup in suspend and disable it
in resume.

But it looks like it's been that way since the driver was added by
e9bc8fa5df1c ("i2c-eg20t: add driver for Intel EG20T").

If the device doesn't support wakeup, I would not expect the driver to
mention wakeup at all.

In any case, I think it's the right thing for *this* patch to preserve
the previous wakeup behavior.  Maybe we want a follow-up patch to just
remove both device_wakeup_disable() calls?

>  	for (i = 0; i < adap_info->ch_num; i++)
>  		pch_i2c_init(&adap_info->pch_data[i]);
> @@ -908,18 +890,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
>  
>  	return 0;
>  }
> -#else
> -#define pch_i2c_suspend NULL
> -#define pch_i2c_resume NULL
> -#endif
> +
> +static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
>  
>  static struct pci_driver pch_pcidriver = {
>  	.name = KBUILD_MODNAME,
>  	.id_table = pch_pcidev_id,
>  	.probe = pch_i2c_probe,
>  	.remove = pch_i2c_remove,
> -	.suspend = pch_i2c_suspend,
> -	.resume = pch_i2c_resume
> +	.driver.pm = &pch_i2c_pm_ops,
>  };
>  
>  module_pci_driver(pch_pcidriver);
> -- 
> 2.27.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
