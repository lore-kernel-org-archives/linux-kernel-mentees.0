Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1C51AEFE7
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720102308; cv=none; b=IR+1PC/ZvNSM5xuRhmLhDJrhK5RkLQXERZosmNASqyqGMEggALvuLrdx4KAccMKK5V5isfsLkhnZxhjPyGy9KqCggRXAwgSNFgjG2cYjJh/bVVt9WGTXZKLygiXXXAirRHaA/yH6D/YRTlhCqnX/2utZrfoyT6nVus2BToo/sWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720102308; c=relaxed/simple;
	bh=XRhdpgAgJQksM+hc2XSPvPPm8ujHiKZ7UFJm+iVlieI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXJKfMddR8N1RleHRaoAVNh5i2ujoCiTuG/96QP9dPMX2yYOLNTxqA/ctIMxXPPEimDCA9Lpj9kdSyzXerhYtQcrZ256fbh0XJ+/FIdmkBwLh7QxAckuwFO+ZBvoGHM1giybMNMgLCzte2OiEcoFiMPjGq+hh2T0abvI3vW7/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l5hlhnUY; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l5hlhnUY"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4241C60B54
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRkK8xYzdmyQ for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Jul 2024 14:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4949660AD9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4949660AD9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=l5hlhnUY
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4949660AD9
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:11:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54C7062731;
	Thu,  4 Jul 2024 14:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A79BC4AF0A;
	Thu,  4 Jul 2024 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720102304;
	bh=XRhdpgAgJQksM+hc2XSPvPPm8ujHiKZ7UFJm+iVlieI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5hlhnUYn9Y4JyZ+q8JUvXmtll3REWvSFFkRAoFD0YZP7c+vynGmtPcpJg6njkKbB
	 ubKgteGytW0Gpj2ppYpvfrSwU9FHnlhBcKai/48YfORtKQMU0OHVWSkcHkBDj3Q5v/
	 3myNGJYmMoUF65ty2diScWuauKaGrztLdhk9o48I=
Date: Thu, 4 Jul 2024 16:11:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: 88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com,
	Linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, luisbg@kernel.org,
	salah.triki@gmail.com,
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fs/befs: fix shift-out-of-bounds in befs_check_sb
Message-ID: <2024070430-smell-cornhusk-1d6c@gregkh>
References: <2023082746-antelope-drop-down-5562@gregkh>
 <20240704135057.1174408-1-dvyukov@google.com>
 <2024070416-hatbox-playlist-9886@gregkh>
 <CACT4Y+arKNML2gLvmXzqdfyJY5ydj0yjfk-NbrZpOLgTOTNH6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+arKNML2gLvmXzqdfyJY5ydj0yjfk-NbrZpOLgTOTNH6A@mail.gmail.com>

On Thu, Jul 04, 2024 at 04:08:40PM +0200, Dmitry Vyukov wrote:
> On Thu, 4 Jul 2024 at 16:04, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jul 04, 2024 at 03:50:57PM +0200, Dmitry Vyukov wrote:
> > > Hi,
> > >
> > > What's the kernel policy for such cases?
> >
> > What "case"?
> >
> > There is no context here at all, and I can't find any patch on lore at
> > all.
> >
> > Please always properly quote stuff...
> 
> It's not easy with kernel lists. I used the lore suggested reply-to
> command. Here is full thread:
> https://lore.kernel.org/all/20240704135057.1174408-1-dvyukov@google.com/

I see no patch on lore on this thread :(
