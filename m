Return-Path: <SRS0=1TFu=BR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C73C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Aug 2020 20:23:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0A72075A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Aug 2020 20:23:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+hpo1S9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D0A72075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 023DD88B5D;
	Fri,  7 Aug 2020 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BhgmItc8SwA; Fri,  7 Aug 2020 20:23:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6AF2888B59;
	Fri,  7 Aug 2020 20:23:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55750C088E;
	Fri,  7 Aug 2020 20:23:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DF0AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 20:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8160380EBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 20:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSfZjS9yWVMi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 20:23:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3F2E587277
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 20:23:23 +0000 (UTC)
Received: from localhost (130.sub-72-107-113.myvzw.com [72.107.113.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C24172074D;
 Fri,  7 Aug 2020 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596831803;
 bh=eZ11znaZyBQszlg13DinqaMSmiV/14OwQJjM/YVoM+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Q+hpo1S9CCaw7/RboOmuRIq5Ozpy9Hdj0Hf44V38d2eDCxlcW+VH8u6vVQkYUeyUl
 flExzj3W5bnBE9Ff7v7xOJyfdoYbK1r0jQE8q9j1KEkFK6giGkFBUL2hekm9yOMFLn
 8o2cIPiustbpSOxrNK9i+etfjHb3UYpZEsZSk0U0=
Date: Fri, 7 Aug 2020 15:23:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200807202321.GA753887@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805193616.384313-3-vaibhavgupta40@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>, linux-kernel@vger.kernel.org,
 Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-i2c@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] i2c: eg20t: use generic
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

[+cc Jean for i801 question below]

On Thu, Aug 06, 2020 at 01:06:16AM +0530, Vaibhav Gupta wrote:
> Drivers using legacy power management .suspen()/.resume() callbacks
> have to manage PCI states and device's PM states themselves. They also
> need to take care of standard configuration registers.
> 
> Switch to generic power management framework using a single
> "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> This also avoids the need for the driver to directly call most of the PCI
> helper functions and device power state control functions, as through
> the generic framework PCI Core takes care of the necessary operations,
> and drivers are required to do only device-specific jobs.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

s/.suspen/.suspend/ above

These both look right to me.

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

Looking at neighboring drivers, it looks like some already use generic
PM but have unnecessary PCI code, e.g., amd_mp2_pci_suspend().
Probably already on your list.

Also, i801_suspend() looks suspicious because it writes SMBHSTCFG, but
I don't see anything corresponding in i801_resume().

> ---
>  drivers/i2c/busses/i2c-eg20t.c | 36 +++++++---------------------------
>  1 file changed, 7 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> index eb41de22d461..843b31a0f752 100644
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
>  	void __iomem *p = adap_info->pch_data[0].pch_base_address;
>  
> @@ -872,31 +871,13 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
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
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> -
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
> -
> -	if (pci_enable_device(pdev) < 0) {
> -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> -		return -EIO;
> -	}
> +	struct adapter_info *adap_info = dev_get_drvdata(dev);
>  
>  	for (i = 0; i < adap_info->ch_num; i++)
>  		pch_i2c_init(&adap_info->pch_data[i]);
> @@ -905,18 +886,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
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
