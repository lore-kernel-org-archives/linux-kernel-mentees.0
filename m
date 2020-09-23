Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F862C49EBF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:24:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1023723119
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaY6iA3x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1023723119
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CCB7C860D1;
	Wed, 23 Sep 2020 10:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TN8BUqD8b7Hj; Wed, 23 Sep 2020 10:24:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6A9D685546;
	Wed, 23 Sep 2020 10:24:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67326C0859;
	Wed, 23 Sep 2020 10:24:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC9EBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB66D86FAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wln8h0ZHGbz6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:24:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5F8D686F9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:24:06 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86EF521BE5;
 Wed, 23 Sep 2020 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600856646;
 bh=4axLnYFaEHtr9+q27LR9CjkX1jMW8YKOSTMnO3OD97o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QaY6iA3xkR5TGJx2K7V/+m5EtdlK9/Fu/ZBAOuocOaJy3KikVsEt/NfipxIsN+KVk
 XcJGR+N15eWXOgxJ+xF6P8Edsu1vbtiUGfcJeEINxQnvOsmq5C5VStjK9T2r3RuHlH
 7NkOmNhwoViSSUm97fxeC28Hzl/9eCFGd8Zvgx9w=
Date: Wed, 23 Sep 2020 12:24:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <20200923102425.GC3154647@kroah.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-2-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923090519.361-2-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, keescook@chromium.org,
 pankaj.laxminarayan.bharadiya@intel.com, oneukum@suse.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org, ogiannou@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 petkan@nucleusys.com
Subject: Re: [Linux-kernel-mentees] [PATCH 1/4] net: usbnet: use
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

On Wed, Sep 23, 2020 at 02:35:16PM +0530, Himadri Pandya wrote:
> Potential incorrect use of usb_control_msg() has resulted in new wrapper
> functions to enforce its correct usage with proper error check. Hence
> use these new wrapper functions instead of calling usb_control_msg()
> directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/net/usb/usbnet.c | 46 ++++------------------------------------
>  1 file changed, 4 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index 2b2a841cd938..a38a85bef46a 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -1982,64 +1982,26 @@ EXPORT_SYMBOL(usbnet_link_change);
>  static int __usbnet_read_cmd(struct usbnet *dev, u8 cmd, u8 reqtype,
>  			     u16 value, u16 index, void *data, u16 size)
>  {
> -	void *buf = NULL;
> -	int err = -ENOMEM;
> -
>  	netdev_dbg(dev->net, "usbnet_read_cmd cmd=0x%02x reqtype=%02x"
>  		   " value=0x%04x index=0x%04x size=%d\n",
>  		   cmd, reqtype, value, index, size);
>  
> -	if (size) {
> -		buf = kmalloc(size, GFP_KERNEL);
> -		if (!buf)
> -			goto out;
> -	}
> -
> -	err = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
> -			      cmd, reqtype, value, index, buf, size,
> +	return usb_control_msg_recv(dev->udev, 0,
> +			      cmd, reqtype, value, index, data, size,
>  			      USB_CTRL_GET_TIMEOUT);
> -	if (err > 0 && err <= size) {
> -        if (data)
> -            memcpy(data, buf, err);
> -        else
> -            netdev_dbg(dev->net,
> -                "Huh? Data requested but thrown away.\n");
> -    }
> -	kfree(buf);
> -out:
> -	return err;
>  }

Now there is no real need for these wrapper functions at all, except for
the debugging which I doubt anyone needs anymore.

So how about just deleting these and calling the real function instead?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
