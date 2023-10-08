Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0393FE95A67
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Oct 2023 06:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9340B40535;
	Sun,  8 Oct 2023 06:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9340B40535
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PuqeMXVc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iC_wDCPPybi; Sun,  8 Oct 2023 06:05:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3CD2C403A9;
	Sun,  8 Oct 2023 06:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD2C403A9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1ADABC0039;
	Sun,  8 Oct 2023 06:05:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FF0AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 06:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BE0B610AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 06:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE0B610AA
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=PuqeMXVc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1j_bfl9DFZML
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 06:05:47 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 322E56108E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 06:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 322E56108E
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 458B2B80B6D;
 Sun,  8 Oct 2023 06:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA68C433C9;
 Sun,  8 Oct 2023 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696745143;
 bh=6G4E2k0CfxZ9RMVM/HKCgdTvuF8wdlnMz5WMcwKbtiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PuqeMXVcKbcaBDb+fC1tnut7M9vrgyJMrCuNtLsk/3bJoBgGgW22YJk1NZzmTVLbw
 +t8OLkbdY5K541GwTxUqJ7J+MU7Vjq0eQvD0o4W1/0PC9lOoXljrbbu8vqzDRZbz75
 x0daNe4E/8V0YueTZfR4j2fKeO1D4NUq2inl0+hA=
Date: Sun, 8 Oct 2023 08:05:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuran Pereira <yuran.pereira@hotmail.com>
Subject: Re: [PATCH] Bluetooth: hci_conn_failed: Fix memory leak
Message-ID: <2023100830-agreeably-jokingly-e6b4@gregkh>
References: <AM9P192MB1267F1B8CA16CEEF884C9F2CE8CFA@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM9P192MB1267F1B8CA16CEEF884C9F2CE8CFA@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
Cc: johan.hedberg@gmail.com, marcel@holtmann.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
 syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com,
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

On Sun, Oct 08, 2023 at 11:33:34AM +0530, Yuran Pereira wrote:
> The hci_conn_failed() function currently calls hci_connect_cfm(), which
> indirectly leads to the allocation of an l2cap_conn struct in 
> l2cap_conn_add().
> This operation results in a memory leak, as the l2cap_conn structure
> becomes unreferenced.
> 
> To address this issue and prevent the memory leak, this patch modifies
> hci_conn_failed() to replace the call to hci_connect_cfm() with a
> call to hci_disconn_cfm().
> 
> Fixes: 9b3628d79b46 ("Bluetooth: hci_sync: Cleanup hci_conn if it cannot be aborted")
> Reported-by: syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=39ec16ff6cc18b1d066d
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>  net/bluetooth/hci_conn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 7a6f20338db8..1d2d03b4a98a 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -1248,7 +1248,7 @@ void hci_conn_failed(struct hci_conn *conn, u8 status)
>  	}
>  
>  	conn->state = BT_CLOSED;
> -	hci_connect_cfm(conn, status);
> +	hci_disconn_cfm(conn, status);
>  	hci_conn_del(conn);
>  }
>  
> -- 
> 2.25.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documetnation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
