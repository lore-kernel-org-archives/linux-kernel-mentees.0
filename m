Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91799C64990
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Aug 2022 14:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD7F60E65;
	Thu, 25 Aug 2022 14:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD7F60E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjY-vEVdPwzR; Thu, 25 Aug 2022 14:19:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1201860669;
	Thu, 25 Aug 2022 14:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1201860669
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D68A1C0032;
	Thu, 25 Aug 2022 14:19:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFA76C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 14:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A639A40C71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 14:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A639A40C71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmUEzONvxBVx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 14:19:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B50400CB
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by smtp2.osuosl.org (Postfix) with SMTP id 55B50400CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 14:19:27 +0000 (UTC)
Received: (qmail 2307 invoked by uid 1000); 25 Aug 2022 10:19:26 -0400
Date: Thu, 25 Aug 2022 10:19:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH v2] usb: host: Initiate urb ep with udev ep0
Message-ID: <YweE7jCfGDhLB16G@rowland.harvard.edu>
References: <20220824203107.14908-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824203107.14908-1-khalid.masum.92@gmail.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Arnd Bergmann <arnd@arndb.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Kaehlcke <mka@chromium.org>,
 Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
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

On Thu, Aug 25, 2022 at 02:31:07AM +0600, Khalid Masum wrote:
> Currently we look up for endpoint in a table and initate urb endpoint
> with it. This is unnecessary because the lookup will always result in
> endpoint 0.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
> Changes since v1:
>  - Remove endpoint lookup and NULL check
>  - Remove unnecessary variable *ep
>  - Initiate urb ep with udev ep0
>  - Update commit message
>  - v1 Link: https://lore.kernel.org/lkml/20220824130702.10912-1-khalid.masum.92@gmail.com/ 
> 
>  drivers/usb/core/hcd.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 94b305bbd621..05f30ae5570b 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2158,21 +2158,14 @@ static struct urb *request_single_step_set_feature_urb(
>  {
>  	struct urb *urb;
>  	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> -	struct usb_host_endpoint *ep;
>  
>  	urb = usb_alloc_urb(0, GFP_KERNEL);
>  	if (!urb)
>  		return NULL;
>  
>  	urb->pipe = usb_rcvctrlpipe(udev, 0);
> -	ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
> -				[usb_pipeendpoint(urb->pipe)];
> -	if (!ep) {
> -		usb_free_urb(urb);
> -		return NULL;
> -	}
>  
> -	urb->ep = ep;
> +	urb->ep = &udev->ep0;
>  	urb->dev = udev;
>  	urb->setup_packet = (void *)dr;
>  	urb->transfer_buffer = buf;

Acked-by: Alan Stern <stern@rowland.harvard.edu>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
