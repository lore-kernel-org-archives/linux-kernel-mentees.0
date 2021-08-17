Return-Path: <SRS0=4CcE=NI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0555C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 12:59:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AAFC60EBD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 12:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AAFC60EBD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C93260815;
	Tue, 17 Aug 2021 12:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mre3-rb2A-ti; Tue, 17 Aug 2021 12:59:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F3CE560699;
	Tue, 17 Aug 2021 12:59:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCE0AC001A;
	Tue, 17 Aug 2021 12:59:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82C68C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 12:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F7EF404DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 12:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62fLSMNC0Tmp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 12:59:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A0DC404B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 12:59:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D98860EBD;
 Tue, 17 Aug 2021 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629205155;
 bh=nLqij11ZwTdXwOC5iKH5vBOKi+8GTdVjmeB6OF4J7Rc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gIxB0yQG6aVN5x9v3HwI6A3Y1gM2ik7KIStMDm/c93Dm5mQLeNxbOJPNovbnW0JqN
 PHFkLd7qI0Gckykc5bd5gwZ23iWY1/ck6KPVoLnJb/Hs3UQfuXwQPAWobYXISPJMGG
 6UKSMIiOiAJXsSwW77L7yOurb6VbfGfW/HYSDgSQ=
Date: Tue, 17 Aug 2021 14:59:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Utkarsh Verma <utkarshverma294@gmail.com>
Subject: Re: [PATCH] serial: 8250_mid: Use pci_irq_vector() to get IRQ
Message-ID: <YRuyoWujcSB6zKl5@kroah.com>
References: <20210817081401.3440-1-utkarshverma294@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817081401.3440-1-utkarshverma294@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
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

On Tue, Aug 17, 2021 at 01:44:01PM +0530, Utkarsh Verma wrote:
> Instead of a direct assignment, use pci_irq_vector() to get the
> Linux IRQ number.

Why is this needed?

> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_mid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_mid.c b/drivers/tty/serial/8250/8250_mid.c
> index efa0515139f8..3a279ce0e904 100644
> --- a/drivers/tty/serial/8250/8250_mid.c
> +++ b/drivers/tty/serial/8250/8250_mid.c
> @@ -299,7 +299,7 @@ static int mid8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	memset(&uart, 0, sizeof(struct uart_8250_port));
>  
>  	uart.port.dev = &pdev->dev;
> -	uart.port.irq = pdev->irq;
> +	uart.port.irq = pci_irq_vector(pdev, 0);

What problem does this solve?

Do not describe what you are doing, but rather, _why_ you are doing it.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
