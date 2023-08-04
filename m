Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC055C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 09:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350F4840AF;
	Fri,  4 Aug 2023 09:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 350F4840AF
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KfAgx545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIbFu649BZBc; Fri,  4 Aug 2023 09:31:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2726A83F44;
	Fri,  4 Aug 2023 09:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2726A83F44
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13878C0071;
	Fri,  4 Aug 2023 09:31:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 204D0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 09:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E114260FA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 09:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E114260FA3
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=KfAgx545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aPELXYA7BvqD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 09:31:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6D3460FC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 09:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6D3460FC0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E14EE61F6B;
 Fri,  4 Aug 2023 09:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CEBC433C8;
 Fri,  4 Aug 2023 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691141460;
 bh=ytIilxh+58GrQ8OHf133q4mTeWcJ92IHYhytXiXB5rU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KfAgx545kZ70EWgy/+Qb+hWmMEmrKZQ4cXGMJdY2hV7euni4BE1fHneZEIwQoT2tD
 kpG95qee0OZIpoJNWQtYz1004mw5SxWuamuq9N27z25x+G+x6dXM5smrmEkqP9liQ4
 R+uXXT2TpN7giDd+y24XYCNJWdLQvZl/EkhLcNWE=
Date: Fri, 4 Aug 2023 11:30:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH v2] ath6kl: replace one-element array with flexible-array
 member
Message-ID: <2023080410-unadorned-vertigo-c0b8@gregkh>
References: <20230804045554.6934-1-rauji.raut@gmail.com>
 <2023080433-patio-staining-2cfe@gregkh> <87sf8zs2oi.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sf8zs2oi.fsf@kernel.org>
Cc: Atul Raut <rauji.raut@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Fri, Aug 04, 2023 at 10:10:37AM +0300, Kalle Valo wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Thu, Aug 03, 2023 at 09:55:54PM -0700, Atul Raut wrote:
> >
> >> One-element arrays are no longer relevant, and their
> >> place has been taken by flexible array members thus,
> >> use a flexible-array member to replace the one-element
> >> array in struct ath6kl_usb_ctrl_diag_cmd_write
> >> 
> >> This fixes warnings such as:
> >> ./drivers/net/wireless/ath/ath6kl/usb.c:109:8-12: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >> 
> >> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
> >> ---
> >>  drivers/net/wireless/ath/ath6kl/usb.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wireless/ath/ath6kl/usb.c
> >> index 5220809841a6..c8ecc9e85897 100644
> >> --- a/drivers/net/wireless/ath/ath6kl/usb.c
> >> +++ b/drivers/net/wireless/ath/ath6kl/usb.c
> >> @@ -106,7 +106,7 @@ struct ath6kl_usb_ctrl_diag_cmd_write {
> >>  	__le32 cmd;
> >>  	__le32 address;
> >>  	__le32 value;
> >> -	__le32 _pad[1];
> >> +	__le32 _pad[];
> >
> > Are you sure this is actually a variable length array?
> 
> It's not, it's just padding. We both told this in v1:
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20230731012941.21875-1-rauji.raut@gmail.com/

Hey, I'm consistent, nice!  :)

But Atul, that's not good to ignore our review comments.  Usually that
ends up meaning that everyone will then just ignore your submissions,
generally a not-good resolution.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
