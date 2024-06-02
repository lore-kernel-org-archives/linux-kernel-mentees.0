Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491839FD4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Jun 2024 10:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717325858; cv=none; b=t3VJxc482PTHUcd/ZEIOZjRYvQtpvad6o/GBbRL+4EK8LlfEJ+/l+dK4oglvo6GGkwgxldeJWz1n8xlmWINlCbaVzv8B3xJbIW1C34HK6KH5g8+ezE5HyvXYRy9cNJnLrVcDBy7FuD5JZDCKPsVDhyJ3dCQsZHZ0dQVZqVEdc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717325858; c=relaxed/simple;
	bh=wf+hh3TEWD7FVcVBxITIaFaMB6sWnimlNMYFCR109rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZEStDGqLuMr/IOiwA0dFoYWtY1/uOZBMWIknC6msn8o22nG3Jlgc073UQYfQOBQtNRAuOsi8otc5OaZju+3GxPo0REr2a5Pau5UjSxvbqcY9nQN4kvmvZn1DNWY2jGjh/l4DlK8Pksbp9bWPNghAxxeWXemPqnxxdJY9Rtk6/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TBOVV0+G; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TBOVV0+G"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F72B414F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Jun 2024 10:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZaM1lw-pQFC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jun 2024 10:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA4DD414D4
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA4DD414D4
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TBOVV0+G
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EA4DD414D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Jun 2024 10:57:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3125F60B34;
	Sun,  2 Jun 2024 10:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BB8C2BBFC;
	Sun,  2 Jun 2024 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717325853;
	bh=wf+hh3TEWD7FVcVBxITIaFaMB6sWnimlNMYFCR109rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBOVV0+GCDg/JTQ/DtRHL1M7i+ZKtBY/omhzziz5EG1LMLRvq9QX2uAxqfERqZ5wB
	 nQ9tvSIv9zi3MOUlA9/v4bxKUr/RGRn/8RKBxYIWdW6HpGPhRhG/MPZ28FbjQmA7qu
	 7XjvKJHn6U/O7fnwRvHcb7XSPpVDJm/yosPAbjzQ=
Date: Sun, 2 Jun 2024 12:57:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: dan.carpenter@linaro.org, benjamin.tissoires@redhat.com,
	bentiss@kernel.org, jikos@kernel.org, jkosina@suse.com,
	linux-input@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	luke@ljones.dev, skhan@linuxfoundation.org,
	syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] hid: asus: asus_report_fixup: fix potential read out
 of bounds
Message-ID: <2024060212-vacant-scrap-3540@gregkh>
References: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
 <20240602085023.1720492-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602085023.1720492-1-andrewjballance@gmail.com>

On Sun, Jun 02, 2024 at 03:50:23AM -0500, Andrew Ballance wrote:
> syzbot reported a potential read out of bounds in asus_report_fixup.
> 
> this patch adds checks so that a read out of bounds will not occur
> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> Reported-by: syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=07762f019fd03d01f04c
> Fixes: 59d2f5b73921 ("HID: asus: fix more n-key report descriptors if n-key quirked")
> ---
>  drivers/hid/hid-asus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 02de2bf4f790..37e6d25593c2 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1204,8 +1204,8 @@ static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  	}
>  
>  	/* match many more n-key devices */
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		for (int i = 0; i < *rsize + 1; i++) {
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && *rsize > 15) {
> +		for (int i = 0; i < *rsize - 15; i++) {
>  			/* offset to the count from 0x5a report part always 14 */
>  			if (rdesc[i] == 0x85 && rdesc[i + 1] == 0x5a &&
>  			    rdesc[i + 14] == 0x95 && rdesc[i + 15] == 0x05) {
> -- 
> 2.45.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
