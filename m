Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC4FC32796
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 14:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE76660FA0;
	Wed, 24 Aug 2022 14:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE76660FA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-t4Mumj-Yn0; Wed, 24 Aug 2022 14:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DA30B605E3;
	Wed, 24 Aug 2022 14:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA30B605E3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1175C0033;
	Wed, 24 Aug 2022 14:48:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56B65C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 14:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 139508290B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 14:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 139508290B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Art1t5HtfFnR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 14:48:12 +0000 (UTC)
X-Greylist: delayed 00:07:20 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5843827F3
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by smtp1.osuosl.org (Postfix) with SMTP id C5843827F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 14:48:11 +0000 (UTC)
Received: (qmail 380982 invoked by uid 1000); 24 Aug 2022 10:40:49 -0400
Date: Wed, 24 Aug 2022 10:40:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH] usb: host: Use helper function to get endpoint
Message-ID: <YwY4cVdB3tVVMIqJ@rowland.harvard.edu>
References: <20220824130702.10912-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824130702.10912-1-khalid.masum.92@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Matthias Kaehlcke <mka@chromium.org>, Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
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

On Wed, Aug 24, 2022 at 07:07:02PM +0600, Khalid Masum wrote:
> Current implementation to convert urb pipe number to struct 
> usb_host_endpoint in rquest_single_step_set_feature_urb is a little
> messy. 
> 
> Use usb_pipe_endpoint helper function to get the endpoint instead.
> 
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>  drivers/usb/core/hcd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 94b305bbd621..107e29d5d3ae 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2165,8 +2165,7 @@ static struct urb *request_single_step_set_feature_urb(
>  		return NULL;
>  
>  	urb->pipe = usb_rcvctrlpipe(udev, 0);
> -	ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
> -				[usb_pipeendpoint(urb->pipe)];
> +	ep = usb_pipe_endpoint(udev, urb->pipe);
>  	if (!ep) {
>  		usb_free_urb(urb);
>  		return NULL;

Even this is awkward.  It's silly to look up the endpoint in a table 
when you already know that it is endpoint 0.  Just do:

	ep = &udev->ep0;

with no need to check for NULL.

Alan Stern
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
