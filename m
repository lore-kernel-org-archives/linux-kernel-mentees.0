Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FBCC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 16:48:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D2261179
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 16:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13D2261179
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0477401CF;
	Fri,  6 Aug 2021 16:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mospsw50r-64; Fri,  6 Aug 2021 16:48:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5F88E400F4;
	Fri,  6 Aug 2021 16:48:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36CD2C001A;
	Fri,  6 Aug 2021 16:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A707FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 16:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 840C8606F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 16:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jcUw81xYq96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 16:47:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F42B60627
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 16:47:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1410D61163;
 Fri,  6 Aug 2021 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628268478;
 bh=pDK0bkXKmVreCJ5VsYO8Jcq4mOV4T4XgB6OpvbG+IDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tDgBevHwAVItkmlQn2fF9OPUCIIuu03MsLLjRYl8BmJn1VDWySQZGHOIXkyUyZ6Nh
 jqAzPtCjR2nY0fT6YzlOOwYahnLBALGtR+pkUiwJu+5yGOboSa0464KBHIZqXL/KOL
 8fDlk6umALau3ftWKi+4CjqaLpc0ZsZlSGj+Zrmg=
Date: Fri, 6 Aug 2021 18:47:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] usbip: give back URBs for unsent unlink requests during
 cleanup
Message-ID: <YQ1nun3dwdd620TN@kroah.com>
References: <20210806164015.25263-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806164015.25263-1-mail@anirudhrb.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
 Valentina Manea <valentina.manea.m@gmail.com>, linux-kernel@vger.kernel.org,
 syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Fri, Aug 06, 2021 at 10:10:14PM +0530, Anirudh Rayabharam wrote:
> In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
> not given back. This sometimes causes usb_kill_urb to wait indefinitely
> for that urb to be given back. syzbot has reported a hung task issue [1]
> for this.
> 
> To fix this, give back the urbs corresponding to unsent unlink requests
> (unlink_tx list) similar to how urbs corresponding to unanswered unlink
> requests (unlink_rx list) are given back. Since the code is almost the
> same, extract it into a new function and call it for both unlink_rx and
> unlink_tx lists.
> 
> [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
> 
> Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>  drivers/usb/usbip/vhci_hcd.c | 47 ++++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 4ba6bcdaa8e9..45f98aa12895 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -945,7 +945,8 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
>  	return 0;
>  }
>  
> -static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
> +static void __vhci_cleanup_unlink_list(struct vhci_device *vdev,
> +		struct list_head *unlink_list)
>  {
>  	struct vhci_hcd *vhci_hcd = vdev_to_vhci_hcd(vdev);
>  	struct usb_hcd *hcd = vhci_hcd_to_hcd(vhci_hcd);
> @@ -953,23 +954,25 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>  	struct vhci_unlink *unlink, *tmp;
>  	unsigned long flags;
>  
> +	if (unlink_list != &vdev->unlink_tx
> +			&& unlink_list != &vdev->unlink_rx) {
> +		pr_err("Invalid list passed to __vhci_cleanup_unlink_list\n");
> +		BUG();

Do not allow the system to crash, that is not ok.

> +		return;

This call makes no sense as you just rebooted the machine :(

Handle errors properly and recover from them and move on.  A single tiny
driver should not take down the whole system.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
