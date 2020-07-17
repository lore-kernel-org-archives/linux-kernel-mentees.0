Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6C2C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 15:11:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980D620775
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 15:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 980D620775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5ABAD87E6E;
	Fri, 17 Jul 2020 15:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSyMZYD4m3Sf; Fri, 17 Jul 2020 15:11:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDA0487E6A;
	Fri, 17 Jul 2020 15:11:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9AF1C07FF;
	Fri, 17 Jul 2020 15:11:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBDE9C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B170487E6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OndQ1A9f04FN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 15:11:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 90AA487E5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 15:11:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53A09B1C4;
 Fri, 17 Jul 2020 15:11:14 +0000 (UTC)
Date: Fri, 17 Jul 2020 17:11:08 +0200
From: Jean Delvare <jdelvare@suse.de>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Message-ID: <20200717171108.6e9f1b16@endymion>
In-Reply-To: <20200713122247.10985-16-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-16-refactormyself@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, helgaas@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 15/35] i2c/busses: Tidy
	Success/Failure checks
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

On Mon, 13 Jul 2020 14:22:27 +0200, Saheed O. Bolarinwa wrote:
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
> ---
> This patch depends on PATCH 15/35

Not possible, as this *is* patch 15/35. Not really worth mentioning
anyway, as it is expected that patches in a given series may depend on
any earlier patch in the same series.

> 
>  drivers/i2c/busses/i2c-ali15x3.c |  5 ++---
>  drivers/i2c/busses/i2c-nforce2.c |  3 +--
>  drivers/i2c/busses/i2c-sis5595.c | 15 +++++----------
>  3 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
> index 359ee3e0864a..c9e779cc184e 100644
> --- a/drivers/i2c/busses/i2c-ali15x3.c
> +++ b/drivers/i2c/busses/i2c-ali15x3.c
> @@ -167,11 +167,10 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
>  	if(force_addr) {
>  		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
>  			ali15x3_smba);
> -		if (0 != pci_write_config_word(ALI15X3_dev,
> -								SMBBA,
> +		if (pci_write_config_word(ALI15X3_dev, SMBBA,
>  								ali15x3_smba))
>  			goto error;

You can't possibly leave the code with such a ugly alignment and run
away. The whole point of tidying patches it to have more readable code
in the end, right?

> -		if (0 != pci_read_config_word(ALI15X3_dev,
> +		if (pci_read_config_word(ALI15X3_dev,
>  								SMBBA, &a))
>  			goto error;
>  		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
> diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
> index 385f4f446f36..54d2985b7aaf 100644
> --- a/drivers/i2c/busses/i2c-nforce2.c
> +++ b/drivers/i2c/busses/i2c-nforce2.c
> @@ -327,8 +327,7 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
>  		/* Older incarnations of the device used non-standard BARs */
>  		u16 iobase;
>  
> -		if (pci_read_config_word(dev, alt_reg, &iobase)
> -		    != 0) {
> +		if (pci_read_config_word(dev, alt_reg, &iobase)) {
>  			dev_err(&dev->dev, "Error reading PCI config for %s\n",
>  				name);
>  			return -EIO;
> diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
> index fbe3ee31eae3..b016f48519d3 100644
> --- a/drivers/i2c/busses/i2c-sis5595.c
> +++ b/drivers/i2c/busses/i2c-sis5595.c
> @@ -175,11 +175,9 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
>  
>  	if (force_addr) {
>  		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_base);
> -		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
> -		    != 0)
> +		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base))
>  			goto error;
> -		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
> -		    != 0)
> +		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a))
>  			goto error;
>  		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
>  			/* doesn't work for some chips! */
> @@ -188,16 +186,13 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
>  		}
>  	}
>  
> -	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
> -	    != 0)
> +	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val))
>  		goto error;
>  	if ((val & 0x80) == 0) {
>  		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
> -		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
> -		    != 0)
> +		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80))
>  			goto error;
> -		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
> -		    != 0)
> +		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val))
>  			goto error;
>  		if ((val & 0x80) == 0) {
>  			/* doesn't work for some chips? */

Overall I'd be happy to have a more consistent style for checking
errors on PCI config registers access, so this seems to be going into
the right direction.

-- 
Jean Delvare
SUSE L3 Support
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
