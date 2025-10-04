Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4AEEAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759557088; cv=none; b=TekbtU7A4z8h8e/cMmIGc70d+bUV1rCQuqgyyR84aCP3XE5VPlS92bFTPeHBZsiVyjShd4KLDpTLPnAuPrFcV4U6QtW6ESEfqgI+TDADdu0KgIbrVKmkMYBW/Ft3Gai06ILiwDGtjreQyAPaAxBQ/n+x1Mys2GnrUC8ySyuVOMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759557088; c=relaxed/simple;
	bh=+ulMRQuWFPPzjvhYpoF92z0JmF/KhdQh5Tgtm1C3T+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqVVxXENZmUUCctr/dgX7tNBr4l7gmoXAEAiC5QmgfciflzMbry6lggrULJyDluUjWJspIz/psYh5p/U4iBdZZbVX5i4BKAI8tY8+e8vIKbEdO6GQL0tU+5wDkGF7ALl0GV1wVWGgNLkkGCdFlfom3HYqPnvagzL+pccM3Av/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YStNZktC; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YStNZktC"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F6C14009D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 05:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dg616IhPjoxg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Oct 2025 05:51:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EE44403DC
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EE44403DC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YStNZktC
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0EE44403DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 05:51:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2C60603AC;
	Sat,  4 Oct 2025 05:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1427BC4CEF1;
	Sat,  4 Oct 2025 05:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759557083;
	bh=+ulMRQuWFPPzjvhYpoF92z0JmF/KhdQh5Tgtm1C3T+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YStNZktCjlbmFsf9lI8VoKsUcnp1Wg5iVi9uJGTY264UuGLDVRsVREFo7LyOBQyTT
	 Q7TereM+sySk4DeWjFWDCw69zrR7Lb0HxqbhTYqFoJcoWtwsXFUfS7heeEOW/9Z3Bq
	 +dJWq9TvaYXD0VjbHGaJ2W856zgMxV/tmtXIr1Co=
Date: Sat, 4 Oct 2025 07:51:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
Message-ID: <2025100407-devalue-overarch-afe0@gregkh>
References: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251004040722.82882-1-bhanuseshukumar@gmail.com>

On Sat, Oct 04, 2025 at 09:37:22AM +0530, Bhanu Seshu Kumar Valluri wrote:
> The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
> write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
> attempted to restore the pin configuration for LED outputs and then
> returned only the status of that restore operation, discarding the
> original timeout error saved in ret.
> 
> As a result, callers could mistakenly treat EEPROM write operation as
> successful even though the EEPROM write had actually timed out with no
> or partial data write.
> 
> To fix this, handle errors in restoring the LED pin configuration separately.
> If the restore succeeds, return any prior EEPROM write timeout error saved
> in ret to the caller.
> 
> Suggested-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Fixes: 8b1b2ca83b20 ("net: usb: lan78xx: Improve error handling in EEPROM and OTP operations")
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Note:
>  The patch is compiled and tested.
>  The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
>  found by syzbot earlier.
>  The review mail chain where this fix was suggested is given below.
>  https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/
> 
>  drivers/net/usb/lan78xx.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index d75502ebbc0d..5ccbe6ae2ebe 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -1174,10 +1174,13 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
>  	}
>  
>  write_raw_eeprom_done:
> -	if (dev->chipid == ID_REV_CHIP_ID_7800_)
> -		return lan78xx_write_reg(dev, HW_CFG, saved);
> -
> -	return 0;
> +	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
> +		int rc = lan78xx_write_reg(dev, HW_CFG, saved);
> +		/* If USB fails, there is nothing to do */
> +		if (rc < 0)
> +			return rc;
> +	}
> +	return ret;
>  }
>  
>  static int lan78xx_read_raw_otp(struct lan78xx_net *dev, u32 offset,
> -- 
> 2.34.1
> 
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
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
