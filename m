Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B80C7EE29
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 May 2023 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A19D40154;
	Sun, 28 May 2023 17:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A19D40154
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BC8d4bWb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 059EWb_8qmh4; Sun, 28 May 2023 17:51:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 28AEE400D9;
	Sun, 28 May 2023 17:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28AEE400D9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04DF6C0035;
	Sun, 28 May 2023 17:51:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 233CEC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 17:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC48482DDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 17:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC48482DDE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=BC8d4bWb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fL5DUUz9bh49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 17:51:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C71D82D96
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C71D82D96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 17:51:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1319E60F39;
 Sun, 28 May 2023 17:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012E2C433D2;
 Sun, 28 May 2023 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1685296304;
 bh=V5r5hC5QR4ICHfDH4iKLn7xpPteStIXwKbPBMf+1154=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BC8d4bWbKTVGtHhC+p+r5nXpeWwa6mk656+2fAIewu2QhZ0P7REuIxGe7oGB3SN10
 5ik0Yy0AFO8qzcUMfYToT1dsPmZbhcorvV6Q7KPTiOSLjxY7jNQ1sueeVQhu5rUi7B
 /+sGT2D2FVxEYn2A+ksL15YDFsbMglgY7UKE98Rk=
Date: Sun, 28 May 2023 18:51:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
Subject: Re: [PATCH] Null check to prevent null-ptr-deref bug
Message-ID: <2023052815-deface-crux-4634@gregkh>
References: <000000000000cafb9305fc4fe588@google.com>
 <20230528173546.593511-1-princekumarmaurya06@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230528173546.593511-1-princekumarmaurya06@gmail.com>
Cc: brauner@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 chenzhongjin@huawei.com
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

On Sun, May 28, 2023 at 10:35:46AM -0700, Prince Kumar Maurya wrote:
> sb_getblk(inode->i_sb, parent) return a null ptr and taking lock on
> that leads to the null-ptr-deref bug.
> 
> Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
> ---
> Change since v1: update the commit message.

Your subject: line needs to also be fixed up.  Please see the kernel
documentation for how to do this properly.

thanks

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
