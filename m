Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF5EC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 14:58:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F789207EA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 14:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F789207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6C99587E4D;
	Fri, 17 Jul 2020 14:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiqdMF9uklv4; Fri, 17 Jul 2020 14:58:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 44EAB87E3B;
	Fri, 17 Jul 2020 14:58:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B3B3C0865;
	Fri, 17 Jul 2020 14:58:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28F60C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 14:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0C479204E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 14:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0w+KCe4dcwY6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 14:58:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 9EAC1204D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 14:58:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 151C3AE7B;
 Fri, 17 Jul 2020 14:58:26 +0000 (UTC)
Date: Fri, 17 Jul 2020 16:58:20 +0200
From: Jean Delvare <jdelvare@suse.de>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Message-ID: <20200717165820.6b5318ad@endymion>
In-Reply-To: <20200713122247.10985-15-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-15-refactormyself@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, helgaas@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 14/35] i2c/busses: Change
	PCIBIOS_SUCCESSFUL to 0
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

Hi Saheed,

On Mon, 13 Jul 2020 14:22:26 +0200, Saheed O. Bolarinwa wrote:
> In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
> Their scope should be limited within arch/x86.

Which PCI specification are you talking about here. In my "PCI Local
Bus Revision 2.3" specification (March 29, 2002), chapter 2 is about
Signal Definition and has nothing to do with the BIOS.

> 
> Change all PCIBIOS_SUCCESSFUL to 0
> 
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
> ---
>  drivers/i2c/busses/i2c-ali15x3.c |  4 ++--
>  drivers/i2c/busses/i2c-nforce2.c |  2 +-
>  drivers/i2c/busses/i2c-sis5595.c | 10 +++++-----
>  3 files changed, 8 insertions(+), 8 deletions(-)

Hmmm. That seems to be a lot of changes to solve an essentially
theoretical problem (if a problem at all). I am not familiar enough
with the PCI subsystem to claim that it is fundamentally wrong, but
enough to say I'm skeptical.

PCI is a cross-architecture standard, and we can't possibly have the
return value of core functions such as pci_write_config_word follow
different conventions depending on the architecture, can we? Does
pci_write_config_word() currently return PCIBIOS_SUCCESSFUL on success
on x86 and 0 on success on other architectures? What about errors, do
we return positive, "PCIBIOS-specific" error codes on x86 and negative,
unix-like error codes on other architectures?

> diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
> index 02185a1cfa77..359ee3e0864a 100644
> --- a/drivers/i2c/busses/i2c-ali15x3.c
> +++ b/drivers/i2c/busses/i2c-ali15x3.c
> @@ -167,11 +167,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
>  	if(force_addr) {
>  		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
>  			ali15x3_smba);
> -		if (PCIBIOS_SUCCESSFUL != pci_write_config_word(ALI15X3_dev,
> +		if (0 != pci_write_config_word(ALI15X3_dev,
>  								SMBBA,
>  								ali15x3_smba))
>  			goto error;

This leaves the code horribly aligned.

> -		if (PCIBIOS_SUCCESSFUL != pci_read_config_word(ALI15X3_dev,
> +		if (0 != pci_read_config_word(ALI15X3_dev,
>  								SMBBA, &a))
>  			goto error;
>  		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
> diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
> index 777278386f58..385f4f446f36 100644
> --- a/drivers/i2c/busses/i2c-nforce2.c
> +++ b/drivers/i2c/busses/i2c-nforce2.c
> @@ -328,7 +328,7 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
>  		u16 iobase;
>  
>  		if (pci_read_config_word(dev, alt_reg, &iobase)
> -		    != PCIBIOS_SUCCESSFUL) {
> +		    != 0) {
>  			dev_err(&dev->dev, "Error reading PCI config for %s\n",
>  				name);
>  			return -EIO;
> diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
> index c793a5c14cda..fbe3ee31eae3 100644
> --- a/drivers/i2c/busses/i2c-sis5595.c
> +++ b/drivers/i2c/busses/i2c-sis5595.c
> @@ -176,10 +176,10 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
>  	if (force_addr) {
>  		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_base);
>  		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
> -		    != PCIBIOS_SUCCESSFUL)
> +		    != 0)
>  			goto error;
>  		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
> -		    != PCIBIOS_SUCCESSFUL)
> +		    != 0)
>  			goto error;
>  		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
>  			/* doesn't work for some chips! */
> @@ -189,15 +189,15 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
>  	}
>  
>  	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
> -	    != PCIBIOS_SUCCESSFUL)
> +	    != 0)
>  		goto error;
>  	if ((val & 0x80) == 0) {
>  		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
>  		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
> -		    != PCIBIOS_SUCCESSFUL)
> +		    != 0)
>  			goto error;
>  		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
> -		    != PCIBIOS_SUCCESSFUL)
> +		    != 0)
>  			goto error;
>  		if ((val & 0x80) == 0) {
>  			/* doesn't work for some chips? */


-- 
Jean Delvare
SUSE L3 Support
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
