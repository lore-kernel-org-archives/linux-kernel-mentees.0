Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB7AC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Nov 2023 18:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E71403CA;
	Tue,  7 Nov 2023 18:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51E71403CA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MLkZVP1h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gtt5yc_o9FK; Tue,  7 Nov 2023 18:00:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 236994035C;
	Tue,  7 Nov 2023 18:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 236994035C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED56DC0039;
	Tue,  7 Nov 2023 18:00:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEBC4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 18:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C78AB812B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 18:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78AB812B9
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=MLkZVP1h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7AaXCJ4moE-v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 18:00:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 032BA812B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 18:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032BA812B8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49023612FB;
 Tue,  7 Nov 2023 18:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83965C433C9;
 Tue,  7 Nov 2023 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699380035;
 bh=E1Bup6DoIkkVNNMrTYXE6nKFRsOD6Uc+5R8BldSYaTY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MLkZVP1h6zun+CV8t6+cLhtjLAd5xTs15OrSUltDxizu0XZTtM6Gb35sHB3l6jEXl
 E/+CEMlvSxmPON/ADXkmdu8uKouuD3Iq8bUp81wLl0RMSCjiD27djBL08YNl8frEvZ
 oVNBs3W02wfi5BuDM/WfAYg6dildyqZm3pW4w3rkZythwWrxm6w694CfMkIuT7+5O7
 3yTj2GUUAu9D5/5kHXPhG5Ik2OMpdzjOi1++WTEk4udkVz7vdgTifs3mJTMgGLjV9C
 6AQZviUt+bG+cqFG+NAfZ0ys+x/vQ9JC9r6inS1qZpswWp92lshdRYTsmMTT97d6kz
 s4LhJ9L3blV5w==
Date: Tue, 7 Nov 2023 10:00:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yuran Pereira <yuran.pereira@hotmail.com>
Subject: Re: [PATCH] Fixes a null pointer dereference in ptp_ioctl
Message-ID: <20231107100034.09786df1@kernel.org>
In-Reply-To: <DB3PR10MB683554F488A562C8A89286C2E8AAA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
References: <DB3PR10MB683554F488A562C8A89286C2E8AAA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Cc: syzbot+8a78ecea7ac1a2ea26e5@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, richardcochran@gmail.com,
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

On Mon,  6 Nov 2023 06:18:29 +0530 Yuran Pereira wrote:
> This patch fixes the issue by adding a check for tsevq and
> ensuring ptp_ioctl returns with an error if tsevq is null.
> 
> Dashboard link: https://syzkaller.appspot.com/bug?extid=8a78ecea7ac1a2ea26e5

Just Link:

> Reported-by: syzbot+8a78ecea7ac1a2ea26e5@syzkaller.appspotmail.com
> Fixes: c5a445b1e934 ("ptp: support event queue reader channel masks")
> 

No empty lines between tags.

> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>

When you repost please make sure you CC everyone get_maintainer 
(run on  the patch file, not the paths) points out.
And CC Edward Adam Davis <eadavis@qq.com> since his fixing similar
issues.
-- 
pw-bot: cr
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
