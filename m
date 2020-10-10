Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47035C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 08:09:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D36207FB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 08:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMwOBN4I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5D36207FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 858FE2041E;
	Sat, 10 Oct 2020 08:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1TnoJio08sl; Sat, 10 Oct 2020 08:09:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E75EB20413;
	Sat, 10 Oct 2020 08:09:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE157C07FF;
	Sat, 10 Oct 2020 08:09:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7758C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C63EE86CEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aR+Qwh+I+MqR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:09:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 24E10866AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:09:07 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C808207E8;
 Sat, 10 Oct 2020 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602317346;
 bh=UPcr+Ibg07POMWxl1HvL2IeGuaIGl6soETIqzkJhXjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HMwOBN4IbvGaEGnave/74riINOP0cR6MsHA3Ytl9Ej1+bHp3WLTtGXHkTC/T6Ur/h
 vsuKBIZ6Oo94MAOIGD0BdsudPZN58FgsJUf/zRySLGmTEnhz+mI1rO8cz0lbnaKTYL
 A6MjC3dIF2CncvSx0CKawexv5Z4LWXzbsIhRFvkM=
Date: Sat, 10 Oct 2020 10:09:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201010080904.GA140279@kroah.com>
References: <20201009162030.293781-1-anant.thazhemadam@gmail.com>
 <20201010070007.GB132110@kroah.com>
 <b84879e9-425e-6354-d21a-cd7c5d237be5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b84879e9-425e-6354-d21a-cd7c5d237be5@gmail.com>
Cc: devel@driverdev.osuosl.org,
 syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com,
 Ian Abbott <abbotti@mev.co.uk>, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: comedi: check validity
 of wMaxPacketSize of usb endpoints found
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

On Sat, Oct 10, 2020 at 07:29:13AM +0530, Anant Thazhemadam wrote:
> Hi,
> 
> On 10-10-2020 12:30, Greg Kroah-Hartman wrote:
> > On Fri, Oct 09, 2020 at 09:50:29PM +0530, Anant Thazhemadam wrote:
> >> While finding usb endpoints in vmk80xx_find_usb_endpoints(), check if 
> >> wMaxPacketSize = 0 for the endpoints found.
> >>
> >> Some devices have isochronous endpoints that have wMaxPacketSize = 0
> >> (as required by the USB-2 spec).
> >> However, since this doesn't apply here, wMaxPacketSize = 0 can be
> >> considered to be invalid.
> >>
> >> Reported-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
> >> Tested-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
> >> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> >> ---
> > You sent 2 patches with the same subject, which one is the "latest" one?
> 
> This patch (that you have replied to) is the "latest" one.
> 
> > Please always version your patches and put below the --- line what
> > changed from the previous version, so that maintainers have a chance to
> > know which to accept...
> 
> The other patch (with the same subject line) wasn't supposed to be sent out.
> I realized there was a coding style error in that while sending, and cancelled
> sending it, but it got sent nonetheless.
> I would have included a v2 tag in this patch itself, but I didn't realize that the
> previous one got sent until afterwards. :(
> I'm sorry for that.
> 
> > Can you fix this up and send a v3?
> 
> Shouldn't I resend this patch as a v2 instead? Since there wouldn't be any
> changes from v2 (this patch) to v3 otherwise (unless of course, somebody could
> suggest some more changes that could be made to this patch itself).

The change would be that you are correctly listing the version
information, so it would be v3 :)

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
