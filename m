Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFA3C19F4F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 19:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FBF541DF7;
	Wed, 16 Aug 2023 19:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FBF541DF7
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jmUg4WZv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Slvk4tpbqjD; Wed, 16 Aug 2023 19:15:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E2E5141D8A;
	Wed, 16 Aug 2023 19:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2E5141D8A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1D2AC0072;
	Wed, 16 Aug 2023 19:15:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CF1BC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 19:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08E3741D96
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 19:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E3741D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8o_y7wMy0lU
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 19:15:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F346B41D8A
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 19:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F346B41D8A
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26A4161FED;
 Wed, 16 Aug 2023 19:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1380DC433C7;
 Wed, 16 Aug 2023 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1692213355;
 bh=72YlqPhkOdrbhyCp3YFbVRU56Qy6DgtXMIcnpb3LfUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmUg4WZvE56CBBpixX0YhC43+TGzHWtj8Ly1JmOeeef/GO/dl9RPsvAZOIT9anLlT
 Xuo/FYNFQMw/6UmVgLhevpIIVmaUzLxnF8YTTw0NMDvSSfjVTjWHGHIZbRoUnhaHXu
 dvGmt8QFVClqfUHcGS/ifXY+JgPBgDq6OOOlBP+U=
Date: Wed, 16 Aug 2023 21:15:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manas Ghandat <ghandatmanas@gmail.com>
Subject: Re: [PATCH v4] ntfs : fix shift-out-of-bounds in ntfs_iget
Message-ID: <2023081621-mosaic-untwist-a786@gregkh>
References: <20230813055948.12513-1-ghandatmanas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230813055948.12513-1-ghandatmanas@gmail.com>
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 linkinjeon@kernel.org, anton@tuxera.com
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

On Sun, Aug 13, 2023 at 11:29:49AM +0530, Manas Ghandat wrote:
> Currently there is not check for ni->itype.compressed.block_size when
> a->data.non_resident.compression_unit is present and NInoSparse(ni) is
> true. Added the required check to calculation of block size.
> 
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0
> Fix-commit-ID: upstream f40ddce88593482919761f74910f42f4b84c004b

What is this last tag for?  That's a kernel release version, what can be
done with that?

confused,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
