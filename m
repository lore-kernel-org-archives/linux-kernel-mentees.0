Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A87C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 10:43:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24CBE20702
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 10:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w8amJD6D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24CBE20702
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 901AB87268;
	Fri,  6 Nov 2020 10:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0EpCk1wCbqt; Fri,  6 Nov 2020 10:42:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F56587247;
	Fri,  6 Nov 2020 10:42:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2090C0893;
	Fri,  6 Nov 2020 10:42:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D559CC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 10:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A5BA72E0E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 10:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oV-TXyHk76G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 10:42:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id B26F020353
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 10:42:52 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92D4920702;
 Fri,  6 Nov 2020 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604659372;
 bh=lzG1XHFrcM3QcQARAEI6Uz4IHlH2u0wbrmSoCt6+fVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w8amJD6DJbnv+b4uA5X2WJVuUIHmrNo8TXyf8qmXiBGRyNRfwLNP2YgS92BHXN4ig
 n8YQSXUJUGGzCsnYM01r4AvHhG0A40bj/ex9fC89A94WrflT1H4ZpM7TULF+R9ytti
 VJrpSdppG58R+px+5NfxeyTgTmPFdSECl+ZMe2uQ=
Date: Fri, 6 Nov 2020 11:43:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <20201106104338.GA2785199@kroah.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 00/15] usb: serial: avoid using
	usb_control_msg() directly
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

On Wed, Nov 04, 2020 at 12:16:48PM +0530, Himadri Pandya wrote:
> There are many usages of usb_control_msg() that can use the new wrapper
> functions usb_contro_msg_send() & usb_control_msg_recv() for better
> error checks on short reads and writes. Hence use them whenever possible
> and avoid using usb_control_msg() directly.
> 
> Himadri Pandya (15):
>   usb: serial: ark3116: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: belkin_sa: use usb_control_msg_send()
>   usb: serial: ch314: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: cp210x: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: cypress_m8: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: f81232: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: f81534: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: ftdi_sio: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: io_edgeport: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: io_ti: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: ipaq: use usb_control_msg_send()
>   usb: serial: ipw: use usb_control_msg_send()
>   usb: serial: iuu_phoenix: use usb_control_msg_send()
>   usb: serial: keyspan_pda: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: kl5kusb105: use usb_control_msg_recv() and
>     usb_control_msg_send()

For the whole series:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
