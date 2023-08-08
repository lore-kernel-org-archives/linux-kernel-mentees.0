Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC11C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57C3541690;
	Tue,  8 Aug 2023 16:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C3541690
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=y+qJvfVe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-A2-Ylq9ReN; Tue,  8 Aug 2023 16:36:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2225841600;
	Tue,  8 Aug 2023 16:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2225841600
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0007C0072;
	Tue,  8 Aug 2023 16:36:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F559C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 16:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C75461127
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 16:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C75461127
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=y+qJvfVe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXfvl4DVSsgh
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 16:36:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 614FE60BC0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 16:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 614FE60BC0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22474624E6;
 Tue,  8 Aug 2023 16:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F417C433C8;
 Tue,  8 Aug 2023 16:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691512600;
 bh=s2rPxOfy1Y0fjPSjnYAH7dGDP+SH3CfSccoZNpyTO+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y+qJvfVesc1nYGZoi+Lsb5+ELO7xkN0t4o6lfG5rhCYoXYVw1mXVn7lmCpIeG/2w4
 8yvsHlP5NZwsDZpf6kXdzggArbTh8fFgIplFSYwX2q3CZwKYR6QqfgQn79qhMN4S9O
 FncaicQUOicY7U210nvS+eRi/er10vurr5W9h7DI=
Date: Tue, 8 Aug 2023 18:36:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manas Ghandat <ghandatmanas@gmail.com>
Subject: Re: [PATCH v2] ntfs : fix shift-out-of-bounds in ntfs_iget
Message-ID: <2023080811-populace-raven-96d2@gregkh>
References: <2023080821-blandness-survival-44af@gregkh>
 <20230808102958.8161-1-ghandatmanas@gmail.com>
 <2023080833-pedicure-flavorful-921c@gregkh>
 <CAEt2hJ5icep5dF_OhuZwe0zig4VKCTKuQ0=iYfpOek7Ebp12Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEt2hJ5icep5dF_OhuZwe0zig4VKCTKuQ0=iYfpOek7Ebp12Lw@mail.gmail.com>
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

On Tue, Aug 08, 2023 at 08:45:02PM +0530, Manas Ghandat wrote:
> In the above patch I have mentioned what are the changes from the version
> 1. Also since most of the lines of the patch were a change due to some
> indentation error, the whole patch appears as the diff.

As my bot said:

> > - This looks like a new version of a previously submitted patch, but you
> >   did not list below the --- line any changes from the previous version.
> >   Please read the section entitled "The canonical patch format" in the
> >   kernel file, Documentation/process/submitting-patches.rst for what
> >   needs to be done here to properly describe this.

Please read that and submit a new patch based on the requirements there.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
