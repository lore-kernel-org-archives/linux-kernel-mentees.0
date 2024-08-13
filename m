Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD719A282
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552725; cv=none; b=TJsrGgTVt1/F5TKPbNVUiHd7Mh1/a4DdnvxnaiDbJokWBm18Wht8XnpYwIAyXd4sjLcrgXKcme9cA3bBl0jGLIEKVYKCf6MyGJYM+V0R0q4Y3mmEIDb/x5lTsSwlktDGOcuYwmc0Mfcps5tB7w/8Wwp2Z50JjWOkqVBZnI1Xk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552725; c=relaxed/simple;
	bh=lPTcntDWAP9ZgrzLsA+hOyT0ui0pqN4m3i/LqJnLmFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAxDW62Ab0BqboCh8FrmHiRCoIdEWS1Cobc6hTQuTGVbBYVUHQ2yXTBUX0nyQNatvmuU+OWZQqCXLFhevbzBbp/GQCMHT4cGxI5cjxrdmNMcUGKW5J7/tJlKyEc6zvq1zjSUmjAbA3DGzP1dGdvjNvR9dXOKhhjKs/Y5FDCRrEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0cX+7TfR; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0cX+7TfR"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D2F60592
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 12:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xpbaebo5SM_v for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Aug 2024 12:38:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94781600BB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94781600BB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0cX+7TfR
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 94781600BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 12:38:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 562D961524;
	Tue, 13 Aug 2024 12:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91123C4AF09;
	Tue, 13 Aug 2024 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723552722;
	bh=lPTcntDWAP9ZgrzLsA+hOyT0ui0pqN4m3i/LqJnLmFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0cX+7TfRqnxA52EUeFcWVvXT1TPDxiTG7r7LUyim58LTr5X/MePsa1u7EigjNb63+
	 OdhvQrKt0NgF8YogQ27Z+ul1zW0o4FoCq7HhcClzAIxPZp+5J1UvFn2EHIYrwsU91R
	 Mar+RDQZBf5IYYqMIR8Sl+iTokzSZBHxEHdpz3vw=
Date: Tue, 13 Aug 2024 14:38:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net,
	skhan@linuxfoundation.org, Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: vhci: manage mutex with cleanup helpers
Message-ID: <2024081309-lion-overlying-16a1@gregkh>
References: <20240813121829.6693-1-0xff07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813121829.6693-1-0xff07@gmail.com>

On Tue, Aug 13, 2024 at 08:18:28PM +0800, Yo-Jung (Leo) Lin wrote:
> Use macros in liunx/cleanup.h for automatic resource cleanup.

That says what you do, but not _why_ you want to do it.

> 
> Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> ---
>  drivers/bluetooth/hci_vhci.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
> index c4046f8f1985..70f0c28372ec 100644
> --- a/drivers/bluetooth/hci_vhci.c
> +++ b/drivers/bluetooth/hci_vhci.c
> @@ -19,6 +19,7 @@
>  #include <linux/errno.h>
>  #include <linux/sched.h>
>  #include <linux/poll.h>
> +#include <linux/cleanup.h>
>  
>  #include <linux/skbuff.h>
>  #include <linux/miscdevice.h>
> @@ -468,9 +469,9 @@ static int vhci_create_device(struct vhci_data *data, __u8 opcode)
>  {
>  	int err;
>  
> -	mutex_lock(&data->open_mutex);
> -	err = __vhci_create_device(data, opcode);
> -	mutex_unlock(&data->open_mutex);
> +	scoped_guard(mutex, &data->open_mutex) {
> +		err = __vhci_create_device(data, opcode);
> +	}

This isn't correct, but also, it's not needed at all :(

greg k-h
