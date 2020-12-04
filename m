Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00543C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:10:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C09122519
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C09122519
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C0ADD87246;
	Fri,  4 Dec 2020 10:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWxrtPJiXm5e; Fri,  4 Dec 2020 10:10:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1845786FB4;
	Fri,  4 Dec 2020 10:10:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 087F1C0FA8;
	Fri,  4 Dec 2020 10:10:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA14CC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B0739876E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfH3dgzFpI7L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:10:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8A2EE8769F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:10:03 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f18so5927533ljg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Scw0ub4ve9KprT/1LKilbX5flPNn+/KfNgLbs+ev0ro=;
 b=Zzc7lv/SoixPalmXZR+y3Ay0fGNvAQaUguzDxluD+Hh3iTMIye70JiCl7yDafOL3U5
 prRAHxUX9k1ruhC2ID9QdmZSgpwR8GDqZ0k+LBZBezmnADlgPTSMyOP+4thYDJx06szR
 qBFkqiBZzKDuL72y1lfNSN+jmSeslgidjCr/vjoBLClcxxKAmEbInZAKsSFEdnIUa/5n
 N09iKMyUaw9/HGGjDA+n1INoviwETWjx84C8HXKRJ1JpVMr7bGneQnG45y44SK9Gi7bw
 /FGDNtMMslEJh3QeYUyhUTEwxg9+FFcFythpYEgpPMvDg7l7wspH3YIhDfupzjkxaRHJ
 TIjg==
X-Gm-Message-State: AOAM5332yTrRkMIJ0J2iEgurnOoOGUTv6Nw+QvtVmBlII42orNNa1pNl
 2mf/9dY4VMpyp4O1tHoExyE=
X-Google-Smtp-Source: ABdhPJyPorb0Anq450t8S8hFFFtaafSD0yKRf2ssqk/+h9mGf77P+6iaYQ/lpbfszkQxGCALOWdreg==
X-Received: by 2002:a2e:1606:: with SMTP id w6mr3271570ljd.57.1607076601623;
 Fri, 04 Dec 2020 02:10:01 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id d19sm1545050lfc.139.2020.12.04.02.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:10:00 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl82r-0005Sp-VL; Fri, 04 Dec 2020 11:10:34 +0100
Date: Fri, 4 Dec 2020 11:10:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oLGdtViazqIKDX@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-10-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-10-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 09/15] usb: serial: io_edgeport:
 use usb_control_msg_recv() and usb_control_msg_send()
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

On Wed, Nov 04, 2020 at 12:16:57PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/io_edgeport.c | 73 ++++++++++++--------------------
>  1 file changed, 27 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
> index ba5d8df69518..8479d5684af7 100644
> --- a/drivers/usb/serial/io_edgeport.c
> +++ b/drivers/usb/serial/io_edgeport.c
> @@ -568,34 +568,29 @@ static int get_epic_descriptor(struct edgeport_serial *ep)
>  	int result;
>  	struct usb_serial *serial = ep->serial;
>  	struct edgeport_product_info *product_info = &ep->product_info;
> -	struct edge_compatibility_descriptor *epic;
> +	struct edge_compatibility_descriptor epic;
>  	struct edge_compatibility_bits *bits;
>  	struct device *dev = &serial->dev->dev;
>  
>  	ep->is_epic = 0;
>  
> -	epic = kmalloc(sizeof(*epic), GFP_KERNEL);
> -	if (!epic)
> -		return -ENOMEM;
> -
> -	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> -				 USB_REQUEST_ION_GET_EPIC_DESC,
> -				 0xC0, 0x00, 0x00,
> -				 epic, sizeof(*epic),
> -				 300);
> -	if (result == sizeof(*epic)) {
> +	result = usb_control_msg_recv(serial->dev, 0,
> +				      USB_REQUEST_ION_GET_EPIC_DESC, 0xC0,
> +				      0x00, 0x00, &epic, sizeof(epic), 300,
> +				      GFP_KERNEL);
> +	if (result) {

Here's another logical error due to the test being inverted, which
results in the uninitialised stack-allocated buffer to be used for debug
printks (potentially leaking stack data) in case of errors.

>  		ep->is_epic = 1;
> -		memcpy(&ep->epic_descriptor, epic, sizeof(*epic));
> +		memcpy(&ep->epic_descriptor, &epic, sizeof(epic));
>  		memset(product_info, 0, sizeof(struct edgeport_product_info));
>  
> -		product_info->NumPorts = epic->NumPorts;
> +		product_info->NumPorts = epic.NumPorts;
>  		product_info->ProdInfoVer = 0;
> -		product_info->FirmwareMajorVersion = epic->MajorVersion;
> -		product_info->FirmwareMinorVersion = epic->MinorVersion;
> -		product_info->FirmwareBuildNumber = epic->BuildNumber;
> -		product_info->iDownloadFile = epic->iDownloadFile;
> -		product_info->EpicVer = epic->EpicVer;
> -		product_info->Epic = epic->Supports;
> +		product_info->FirmwareMajorVersion = epic.MajorVersion;
> +		product_info->FirmwareMinorVersion = epic.MinorVersion;
> +		product_info->FirmwareBuildNumber = epic.BuildNumber;
> +		product_info->iDownloadFile = epic.iDownloadFile;
> +		product_info->EpicVer = epic.EpicVer;
> +		product_info->Epic = epic.Supports;
>  		product_info->ProductId = ION_DEVICE_ID_EDGEPORT_COMPATIBLE;
>  		dump_product_info(ep, product_info);
>  
> @@ -614,16 +609,12 @@ static int get_epic_descriptor(struct edgeport_serial *ep)
>  		dev_dbg(dev, "  IOSPWriteLCR     : %s\n", bits->IOSPWriteLCR	? "TRUE": "FALSE");
>  		dev_dbg(dev, "  IOSPSetBaudRate  : %s\n", bits->IOSPSetBaudRate	? "TRUE": "FALSE");
>  		dev_dbg(dev, "  TrueEdgeport     : %s\n", bits->TrueEdgeport	? "TRUE": "FALSE");
> -
> -		result = 0;
> -	} else if (result >= 0) {
> +	} else {
>  		dev_warn(&serial->interface->dev, "short epic descriptor received: %d\n",
>  			 result);
>  		result = -EIO;

...and the driver now always fails to probe with -EIO.

>  	}
>  
> -	kfree(epic);
> -
>  	return result;
>  }
>  
> @@ -2168,11 +2159,6 @@ static int rom_read(struct usb_serial *serial, __u16 extAddr,
>  {
>  	int result;
>  	__u16 current_length;
> -	unsigned char *transfer_buffer;
> -
> -	transfer_buffer =  kmalloc(64, GFP_KERNEL);
> -	if (!transfer_buffer)
> -		return -ENOMEM;
>  
>  	/* need to split these reads up into 64 byte chunks */
>  	result = 0;
> @@ -2181,25 +2167,18 @@ static int rom_read(struct usb_serial *serial, __u16 extAddr,
>  			current_length = 64;
>  		else
>  			current_length = length;
> -		result = usb_control_msg(serial->dev,
> -					usb_rcvctrlpipe(serial->dev, 0),
> -					USB_REQUEST_ION_READ_ROM,
> -					0xC0, addr, extAddr, transfer_buffer,
> -					current_length, 300);
> -		if (result < current_length) {
> -			if (result >= 0)
> -				result = -EIO;
> +		result = usb_control_msg_recv(serial->dev, 0,
> +					      USB_REQUEST_ION_READ_ROM, 0xC0,
> +					      addr, extAddr, data,
> +					      current_length, 300, GFP_KERNEL);
> +		if (result)
>  			break;
> -		}
> -		memcpy(data, transfer_buffer, current_length);
> +
>  		length -= current_length;
>  		addr += current_length;
>  		data += current_length;
>  
> -		result = 0;
>  	}
> -
> -	kfree(transfer_buffer);
>  	return result;
>  }

Here a single allocation of a buffer that get's used repeatedly is
replaced with one allocation per iteration. I suggest leaving this as
is.

Please just drop this patch.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
