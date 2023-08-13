Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C75DC001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 06:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD38840982;
	Sun, 13 Aug 2023 06:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD38840982
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kz4aRbI8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGUAH-DMC-7k; Sun, 13 Aug 2023 06:25:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 96D394095A;
	Sun, 13 Aug 2023 06:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D394095A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63217C0071;
	Sun, 13 Aug 2023 06:25:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B757DC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85560403A2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85560403A2
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=kz4aRbI8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N398VAUqYNEV
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:25:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5118D402F5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 06:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5118D402F5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15B496092E;
 Sun, 13 Aug 2023 06:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53F9C433C8;
 Sun, 13 Aug 2023 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691907921;
 bh=2dOStIhvj0hP/8SNzHVd3iSox1StUq7IjUlQ2BWwArk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kz4aRbI8xlS0Pse41HXf7xfB1EI0IRhs/C59cGHQVxw2SZTqBPxwtRpylHoeNmx/i
 E7enHEvUsHIjuYQdaTka6IxxKRbNzobUqXqdrVbTTsfBUbOcEs2SJtlwmTbR6sIFPt
 dvXQfSiwdB2afIzzpyx9c9EYp7DM1V+T74tbTZbs=
Date: Sun, 13 Aug 2023 08:25:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: 20230801155823.206985-1-ghandatmanas@gmail.com
Subject: Re: Ping
Message-ID: <2023081356-grew-passage-e17c@gregkh>
References: <301364dc-9709-8c8e-6881-66863cb3d29b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <301364dc-9709-8c8e-6881-66863cb3d29b@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com, salah.triki@gmail.com,
 linux-kernel@vger.kernel.org, luisbg@kernel.org
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

On Sun, Aug 13, 2023 at 11:48:29AM +0530, Manas Ghandat wrote:
> Just a friendly ping to the patch :)

There was no context here at all as to what patch you are responding to :(
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
