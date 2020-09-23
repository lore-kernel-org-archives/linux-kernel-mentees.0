Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2755C52D16
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:22:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9946523787
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:22:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2i1jUvoL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9946523787
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 41AC322D10;
	Wed, 23 Sep 2020 10:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqlV5-f6FKge; Wed, 23 Sep 2020 10:22:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F20AB228E7;
	Wed, 23 Sep 2020 10:22:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CED4DC0859;
	Wed, 23 Sep 2020 10:22:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42A86C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B13386F9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wN+Yv9LG5A99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:22:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A38CF86F8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:22:37 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71CFC21BE5;
 Wed, 23 Sep 2020 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600856557;
 bh=XWz+vZF1g9LHOoSDkcsY0DgfgY9ECKBeXlo0tAjLp3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2i1jUvoLRFBz01yCEMI3AOBl7f7kw3YeK1wDQAayGCIXdpUkkkYqac305/pA+Xk2t
 rz8XlHaWtW2W13ht3sKCDS3XCKPPmcTSwwMVrPaFlfp9A5sW4wbcJ1BozSbPzVhOsl
 2czFjN+d/NXfHtVMK4ZP3O4jv8B36hSznoXXwG7Q=
Date: Wed, 23 Sep 2020 12:22:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <20200923102256.GA3154647@kroah.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-5-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923090519.361-5-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, keescook@chromium.org,
 pankaj.laxminarayan.bharadiya@intel.com, oneukum@suse.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org, ogiannou@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 petkan@nucleusys.com
Subject: Re: [Linux-kernel-mentees] [PATCH 4/4] net: rndis_host: use
 usb_control_msg_recv() and usb_control_msg_send()
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

On Wed, Sep 23, 2020 at 02:35:19PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> usb_control_msg() with proper error check. Hence use the wrappers
> instead of calling usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/net/usb/rndis_host.c | 44 ++++++++++++++----------------------
>  1 file changed, 17 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
> index 6fa7a009a24a..30fc4a7183d3 100644
> --- a/drivers/net/usb/rndis_host.c
> +++ b/drivers/net/usb/rndis_host.c
> @@ -113,14 +113,13 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
>  		buf->request_id = (__force __le32) xid;
>  	}
>  	master_ifnum = info->control->cur_altsetting->desc.bInterfaceNumber;
> -	retval = usb_control_msg(dev->udev,
> -		usb_sndctrlpipe(dev->udev, 0),
> -		USB_CDC_SEND_ENCAPSULATED_COMMAND,
> -		USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> -		0, master_ifnum,
> -		buf, le32_to_cpu(buf->msg_len),
> -		RNDIS_CONTROL_TIMEOUT_MS);
> -	if (unlikely(retval < 0 || xid == 0))
> +	retval = usb_control_msg_send(dev->udev, 0,
> +				      USB_CDC_SEND_ENCAPSULATED_COMMAND,
> +				      USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> +				      0, master_ifnum, buf,
> +				      le32_to_cpu(buf->msg_len),
> +				      RNDIS_CONTROL_TIMEOUT_MS);
> +	if (unlikely(xid == 0))
>  		return retval;
>  
>  	/* Some devices don't respond on the control channel until
> @@ -139,14 +138,11 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
>  	/* Poll the control channel; the request probably completed immediately */
>  	rsp = le32_to_cpu(buf->msg_type) | RNDIS_MSG_COMPLETION;
>  	for (count = 0; count < 10; count++) {
> -		memset(buf, 0, CONTROL_BUFFER_SIZE);
> -		retval = usb_control_msg(dev->udev,
> -			usb_rcvctrlpipe(dev->udev, 0),
> -			USB_CDC_GET_ENCAPSULATED_RESPONSE,
> -			USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> -			0, master_ifnum,
> -			buf, buflen,
> -			RNDIS_CONTROL_TIMEOUT_MS);
> +		retval = usb_control_msg_recv(dev->udev, 0,
> +					      USB_CDC_GET_ENCAPSULATED_RESPONSE,
> +					      USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> +					      0, master_ifnum, buf, buflen,
> +					      RNDIS_CONTROL_TIMEOUT_MS);
>  		if (likely(retval >= 8)) {

retval here is never going to be positive, right?  So I don't think this
patch is correct :(

>  			msg_type = le32_to_cpu(buf->msg_type);
>  			msg_len = le32_to_cpu(buf->msg_len);
> @@ -178,17 +174,11 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
>  				msg->msg_type = cpu_to_le32(RNDIS_MSG_KEEPALIVE_C);
>  				msg->msg_len = cpu_to_le32(sizeof *msg);
>  				msg->status = cpu_to_le32(RNDIS_STATUS_SUCCESS);
> -				retval = usb_control_msg(dev->udev,
> -					usb_sndctrlpipe(dev->udev, 0),
> -					USB_CDC_SEND_ENCAPSULATED_COMMAND,
> -					USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> -					0, master_ifnum,
> -					msg, sizeof *msg,
> -					RNDIS_CONTROL_TIMEOUT_MS);
> -				if (unlikely(retval < 0))
> -					dev_dbg(&info->control->dev,
> -						"rndis keepalive err %d\n",
> -						retval);
> +				retval = usb_control_msg_send(dev->udev, 0,
> +							      USB_CDC_SEND_ENCAPSULATED_COMMAND,
> +							      USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> +							      0, master_ifnum, msg, sizeof(*msg),
> +							      RNDIS_CONTROL_TIMEOUT_MS);

You lost the error message that the previous call had if something went
wrong.  Don't know if it's really needed, but there's no reason to
remove it here.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
