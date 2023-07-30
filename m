Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3460C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Jul 2023 10:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36BE281E0F;
	Sun, 30 Jul 2023 10:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36BE281E0F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=r0ZG1YBo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlvFCX1SnyBw; Sun, 30 Jul 2023 10:12:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2073181E04;
	Sun, 30 Jul 2023 10:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2073181E04
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08F0AC0071;
	Sun, 30 Jul 2023 10:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7762C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 10:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0B1A410E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 10:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0B1A410E6
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=r0ZG1YBo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50fErKWGggkJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 10:12:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFA8B410D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 10:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFA8B410D5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 935206068F;
 Sun, 30 Jul 2023 10:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA156C433C8;
 Sun, 30 Jul 2023 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1690711966;
 bh=WpJsh3fyEuGUo6PH6fN0EFyznVrVxs5GaJUXkqK1ArM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r0ZG1YBo7p3AhQ7nCHn4uhQ7Hm7JZrQlbuYQsyASaUYbv1fr1arLvsa/zEP1IFYyX
 T50mHgXA2ipNp2yDKfCOYbDwi68Hb7WY52dPDkG8P+joHA8i+luLhQiq+4ZLw48ZSQ
 JwcrqD1u/ORhlVJXW5jsGt36Rf/WRMuyzex2aP9M=
Date: Sun, 30 Jul 2023 12:12:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: Contributing subsequent patch versions
Message-ID: <2023073013-remix-outscore-c4f9@gregkh>
References: <877cqlmdpg.fsf@gmail.com>
 <8ef54195-4102-0c6c-e14d-efc9bc45cddc@web.de>
 <877cqk5zdt.fsf@gmail.com> <20230728181014.GA607743@mit.edu>
 <87tttlncib.fsf@gmail.com>
 <85938916-305c-c8b9-89db-45e522616526@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85938916-305c-c8b9-89db-45e522616526@web.de>
Cc: Theodore Ts'o <tytso@mit.edu>, Dan Carpenter <error27@gmail.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-ext4@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
