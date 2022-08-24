Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2A3C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 19:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF9B082564;
	Wed, 24 Aug 2022 19:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9B082564
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stD87FXNMg-T; Wed, 24 Aug 2022 19:24:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E94FA813F0;
	Wed, 24 Aug 2022 19:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94FA813F0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E68C0032;
	Wed, 24 Aug 2022 19:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0931FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 19:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D014240B15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 19:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D014240B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVN9NJ-iK2Uq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 19:24:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0270940AD9
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by smtp2.osuosl.org (Postfix) with SMTP id 0270940AD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 19:24:47 +0000 (UTC)
Received: (qmail 390799 invoked by uid 1000); 24 Aug 2022 15:24:46 -0400
Date: Wed, 24 Aug 2022 15:24:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH] usb: host: Use helper function to get endpoint
Message-ID: <YwZ6/qkEAk8867qh@rowland.harvard.edu>
References: <20220824130702.10912-1-khalid.masum.92@gmail.com>
 <YwY4cVdB3tVVMIqJ@rowland.harvard.edu>
 <CAABMjtFEfgQtcGKLkd=whFN=WHUywTg=fDAxRQ+zKLiqOFhvQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAABMjtFEfgQtcGKLkd=whFN=WHUywTg=fDAxRQ+zKLiqOFhvQg@mail.gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Matthias Kaehlcke <mka@chromium.org>, Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Wed, Aug 24, 2022 at 11:57:25PM +0600, Khalid Masum wrote:
> On Wed, Aug 24, 2022 at 8:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> >
> > Even this is awkward.  It's silly to look up the endpoint in a table
> > when you already know that it is endpoint 0.  Just do:
> >
> >         ep = &udev->ep0;
> >
> > with no need to check for NULL.
> 
> After further checking, I realized that  usb_device udev is created by
> ehset_single_step_set_feature and depends on usb_hcd and port. So I do
> not get why the endpoint is at udev->ep0. Can you help me with this?

udev is not a usb_device structure; it is a _pointer_ to a usb_device 
structure.  The pointer is created when ehset_single_step_set_feature() 
calls usb_hub_find_child(), but the structure itself gets created long 
before that, when the USB device is first detected and initialized.

You can see this happening where hub_port_connect() calls 
usb_alloc_dev().  The ep0 field is filled in by hub_port_init() and the 
routines it calls.

Alan Stern
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
