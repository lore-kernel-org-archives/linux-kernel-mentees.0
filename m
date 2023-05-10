Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7FAC7EE24
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 08:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0DB661087;
	Wed, 10 May 2023 08:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0DB661087
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0aoBUOd3YU4; Wed, 10 May 2023 08:27:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 18AA560F81;
	Wed, 10 May 2023 08:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18AA560F81
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0ECCC0037;
	Wed, 10 May 2023 08:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0331FC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0C8041C7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0C8041C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jujztYruMjpR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:27:40 +0000 (UTC)
X-Greylist: delayed 00:06:28 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A38B4402E0
Received: from bluemchen.kde.org (bluemchen.kde.org [IPv6:2001:470:142:8::100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A38B4402E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 08:27:40 +0000 (UTC)
Received: from ugly.fritz.box (localhost [127.0.0.1])
 by bluemchen.kde.org (Postfix) with ESMTP id 1972023FB4;
 Wed, 10 May 2023 04:21:09 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
 id 1pwf4O-XGY-00; Wed, 10 May 2023 10:21:08 +0200
Date: Wed, 10 May 2023 10:21:08 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Message-ID: <ZFtT9J0DQI9uSd1x@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, perex@perex.cz,
 tiwai@suse.com, axboe@kernel.dk, 42.hyeyoo@gmail.com,
 surenb@google.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
 <2023051052-recoil-headache-1594@gregkh>
 <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
 <87a5yc626f.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a5yc626f.wl-tiwai@suse.de>
Cc: axboe@kernel.dk, alsa-devel@alsa-project.org,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, 42.hyeyoo@gmail.com, surenb@google.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, May 10, 2023 at 10:06:16AM +0200, Takashi Iwai wrote:
>Also, if it's only about white space fix or some indent level issues,
>that could be rather more noise and disturbs the git change history,
>e.g. it makes difficult to find out the real code changes via git
>blame, especially it touches a huge amount of lines like this.
>
>That said, I'm not going to take such "coding style cleanup" patch
>blindly.  If it's associated with other real fix or enhancement, I'll
>happily take it.  Otherwise, I'd rather leave it.
>
a maybe less confusing way to put it would be "do whitespace cleanups 
only on the lines that contain "real" changes, and maybe in their 
immediate proximity for consistency". that means that whitespace-only 
patches are by definition not acceptable.

regards
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
