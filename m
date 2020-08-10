Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF03C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 09:19:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3334820709
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 09:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax7gqxfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3334820709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 04D902268D;
	Mon, 10 Aug 2020 09:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xga86Z-OLDFT; Mon, 10 Aug 2020 09:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 85B522042D;
	Mon, 10 Aug 2020 09:19:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70BD6C0864;
	Mon, 10 Aug 2020 09:19:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CB28C0864
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 09:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 68A8987775
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 09:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ee6A9vYp7NPm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 09:19:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E52287744
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 09:19:53 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id r4so4477187pls.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LG+fIp5OZ25It71Wra3d8yfu2prbPEMG5KpZ0CWWGCc=;
 b=Ax7gqxfGIMFUTMwsQKBmRknt4QVEZlySJYJG1TRzYusE6XvTmcOEpv8tKf3kBk00cX
 ElKMU+sWP7NxGBs4dvW8mIRqLwbUtKRX8tsgz+Qt/3N0vKNZ2cqqW0W4fiReomKI9khn
 RKk8brgclZZsgdpuvH9NCvFkSy90nsuhWs/maKtp9738zFm47LNjKZmdDuOjxnDi6m4c
 5jNvE+Z45Iqj9ky3pLQpBzps3ZU5/6Yfg7MBZL1yshWFIXSjeUolc+B+NytARzbwpdhC
 8wyxvA6qwoJXixTxoyeBMnT+MZ8r+4pvM8u1uo3KJH6hj/+oa8hNfZaQX56qIBx/wNZ/
 xi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LG+fIp5OZ25It71Wra3d8yfu2prbPEMG5KpZ0CWWGCc=;
 b=FekXQutv3/LgrgIuZfDoQ5XI2c8QCfS2pQPSySSxxTlrWcLjLeTDy8UEkP7v2CtbM8
 1693We4LYDjTpNikGPb8qnReHK9IX5AvHU+mH6LzAZnW4XOpzfJfBcYWt2CNPjXqyodb
 ouJ+xeBDtsFqzrxVhdCGExrSEJVLpM8gTclhvToUcCgqlDFyZDZbJIz5gZFqhac/OciG
 o7EbbwCM2wh3aRK+B5/nod0Uz5hSeUzmXdGnoqhcFLDL2KFMnrWsoI0STPkpW8tERNd3
 0Zyy6deN4uLg+Sdpts9Yv2gUMVR3+yTfwM7Jhrg9mv6ATSP1p3ie2M5ATwAjMyeaVu3d
 Y7tg==
X-Gm-Message-State: AOAM531uPLa2zRXIeRWb/w1VPnrJJwCRhO6Qok9EGkN2OtGpGoqun6lK
 LRyTYfTuD1FGayexd1RWwl0=
X-Google-Smtp-Source: ABdhPJx7x4fvEeZF1zvMGSiHBSqpbplJv6jIiVbs9RahcOYpDup1KSq1TWn/T1OM81CeqnCBgD6+oA==
X-Received: by 2002:a17:90b:a45:: with SMTP id
 gw5mr25112629pjb.80.1597051192832; 
 Mon, 10 Aug 2020 02:19:52 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id x12sm7776750pff.48.2020.08.10.02.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 02:19:52 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:48:19 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200810091819.GA6615@gmail.com>
References: <20200805193616.384313-3-vaibhavgupta40@gmail.com>
 <20200807202321.GA753887@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807202321.GA753887@bjorn-Precision-5520>
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

On Fri, Aug 07, 2020 at 03:23:21PM -0500, Bjorn Helgaas wrote:
> [+cc Jean for i801 question below]
> 
> On Thu, Aug 06, 2020 at 01:06:16AM +0530, Vaibhav Gupta wrote:
> > Drivers using legacy power management .suspen()/.resume() callbacks
> > have to manage PCI states and device's PM states themselves. They also
> > need to take care of standard configuration registers.
> > 
> > Switch to generic power management framework using a single
> > "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> > This also avoids the need for the driver to directly call most of the PCI
> > helper functions and device power state control functions, as through
> > the generic framework PCI Core takes care of the necessary operations,
> > and drivers are required to do only device-specific jobs.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> 
> s/.suspen/.suspend/ above
> 
> These both look right to me.
> 
> Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Looking at neighboring drivers, it looks like some already use generic
> PM but have unnecessary PCI code, e.g., amd_mp2_pci_suspend().
> Probably already on your list.
Yes :)
> 
> Also, i801_suspend() looks suspicious because it writes SMBHSTCFG, but
> I don't see anything corresponding in i801_resume().
I will look into it.

Thanks
Vaibhav Gupta
> 
> > ---
> >  drivers/i2c/busses/i2c-eg20t.c | 36 +++++++---------------------------
> >  1 file changed, 7 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> > index eb41de22d461..843b31a0f752 100644
> > --- a/drivers/i2c/busses/i2c-eg20t.c
> > +++ b/drivers/i2c/busses/i2c-eg20t.c
> > @@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
> >  	kfree(adap_info);
> >  }
> >  
> > -#ifdef CONFIG_PM
> > -static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused pch_i2c_suspend(struct device *dev)
> >  {
> > -	int ret;
> >  	int i;
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> >  	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> >  	void __iomem *p = adap_info->pch_data[0].pch_base_address;
> >  
> > @@ -872,31 +871,13 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> >  		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
> >  		ioread32(p + PCH_I2CESRSTA));
> >  
> > -	ret = pci_save_state(pdev);
> > -
> > -	if (ret) {
> > -		pch_pci_err(pdev, "pci_save_state\n");
> > -		return ret;
> > -	}
> > -
> > -	pci_disable_device(pdev);
> > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > -
> >  	return 0;
> >  }
> >  
> > -static int pch_i2c_resume(struct pci_dev *pdev)
> > +static int __maybe_unused pch_i2c_resume(struct device *dev)
> >  {
> >  	int i;
> > -	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> > -
> > -	pci_set_power_state(pdev, PCI_D0);
> > -	pci_restore_state(pdev);
> > -
> > -	if (pci_enable_device(pdev) < 0) {
> > -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> > -		return -EIO;
> > -	}
> > +	struct adapter_info *adap_info = dev_get_drvdata(dev);
> >  
> >  	for (i = 0; i < adap_info->ch_num; i++)
> >  		pch_i2c_init(&adap_info->pch_data[i]);
> > @@ -905,18 +886,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
> >  
> >  	return 0;
> >  }
> > -#else
> > -#define pch_i2c_suspend NULL
> > -#define pch_i2c_resume NULL
> > -#endif
> > +
> > +static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
> >  
> >  static struct pci_driver pch_pcidriver = {
> >  	.name = KBUILD_MODNAME,
> >  	.id_table = pch_pcidev_id,
> >  	.probe = pch_i2c_probe,
> >  	.remove = pch_i2c_remove,
> > -	.suspend = pch_i2c_suspend,
> > -	.resume = pch_i2c_resume
> > +	.driver.pm = &pch_i2c_pm_ops,
> >  };
> >  
> >  module_pci_driver(pch_pcidriver);
> > -- 
> > 2.27.0
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
