Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C667DC83F11
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Aug 2023 16:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38FFE40AB9;
	Sun, 27 Aug 2023 16:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38FFE40AB9
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PhicOAyD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlZNa1LY4UCA; Sun, 27 Aug 2023 16:47:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E4DA040A02;
	Sun, 27 Aug 2023 16:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4DA040A02
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1C2EC0039;
	Sun, 27 Aug 2023 16:47:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA244C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 16:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A159460DFF
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 16:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A159460DFF
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=PhicOAyD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 072O0QmwY0dI
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 16:47:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6B9360A79
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 16:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B9360A79
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B646D619B3;
 Sun, 27 Aug 2023 16:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62FBC433C7;
 Sun, 27 Aug 2023 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1693154857;
 bh=/2yYss0mXQw0a3CVsDaLwI8APat97dVsnVdJ8zWStSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PhicOAyD28nAEWr9xc2z8+o1cKDLNIsQtH5yWLyh3YO9zmqrtppWipR3gh/C3bho7
 7e9tW0q2fxd5pujoqQ60nefSa1MEbzDyxTXmEzWGAu4lcoQ64it+24XZ+3LtsW/8el
 TvhYq4OOUph0LTGvvjUiPhnKsMMOPUFbE/M1/C4c=
Date: Sun, 27 Aug 2023 18:47:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: 88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com
Subject: Re: [PATCH] fs/befs: fix shift-out-of-bounds in befs_check_sb
Message-ID: <2023082746-antelope-drop-down-5562@gregkh>
References: <24deab57-5480-3af6-17e6-0874aeaef3db@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24deab57-5480-3af6-17e6-0874aeaef3db@gmail.com>
Cc: salah.triki@gmail.com,
 syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 luisbg@kernel.org
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

On Sun, Aug 27, 2023 at 04:46:40PM +0530, Manas Ghandat wrote:
> Hi Greg,
> 
> Sorry for directly mailing to you but I tried to reach the maintainers for
> quite some time now. I haven't received any response on my patch. I was told
> to mail you in order to get my patch pulled.
> 

I have no context here, sorry.

Also, I am not a filesystem developer or maintainer.  And befs?  I doubt
that's maintained anymore as the operating system is long obsolete,
right?

confused,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
