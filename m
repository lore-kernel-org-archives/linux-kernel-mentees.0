Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12F1B142B
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105133; cv=none; b=h+EESRV0tUIKK5RU2UF2FBQ+UDkJduapdCNqQVvcdT2rcT9DiipYfbZdhb8tr+wFpn4KvoBQKlOqmLKQBiLSjjA55Wfu+ZyovVXeTIf3oF4S2SaE0rN10An45KDWwNUBomA8JHi/SDGTC25MGCIVkmY66PskTWBNbiuUcbNzh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105133; c=relaxed/simple;
	bh=ShJwbW3WR/RLZ5Lf9ChwJdrMelDZwDBgn186WpNaogM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRxFchLwIT9MHE8t496KqiZNxTyq0LgkN6AnQ5dxp9Cm+9PciBx1V4zylrSIWNEIU3M5a57Ew/6vZW2mrlp+rzchOuERfSP3mHavN4jHH5xxm7AkEO+YlHenFu4D4i0cF+/lbwr8mXWdup54GrIdghcf9JrRlTWhl/EyW/L3W2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Aingwe3S; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Aingwe3S"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8D660777
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhqwwYBmZpbY for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Jul 2024 14:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB10B6073A
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB10B6073A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Aingwe3S
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DB10B6073A
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:58:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BBCD626E5;
	Thu,  4 Jul 2024 14:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8ECC3277B;
	Thu,  4 Jul 2024 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720105129;
	bh=ShJwbW3WR/RLZ5Lf9ChwJdrMelDZwDBgn186WpNaogM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aingwe3S+0NOyj/n+uzSZ9xFVXWfWKlGl7DQZIR/7qHkZiAQLe+T4vyhQiqq3W5wk
	 4rFU/q5WGg/kDWBsDMzVC84HOlKXBxUU4HXwIKC+yzA0q2xhZdesqIzPoIwId7Rcqn
	 +sCafHz5T1fR32kB4yq85oxFnDiUK8X/HzKrtZAM=
Date: Thu, 4 Jul 2024 16:58:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: 88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com,
	Linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, luisbg@kernel.org,
	salah.triki@gmail.com,
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fs/befs: fix shift-out-of-bounds in befs_check_sb
Message-ID: <2024070419-calamity-blade-02fb@gregkh>
References: <2023082746-antelope-drop-down-5562@gregkh>
 <20240704135057.1174408-1-dvyukov@google.com>
 <2024070416-hatbox-playlist-9886@gregkh>
 <CACT4Y+arKNML2gLvmXzqdfyJY5ydj0yjfk-NbrZpOLgTOTNH6A@mail.gmail.com>
 <2024070430-smell-cornhusk-1d6c@gregkh>
 <CACT4Y+az44BGCQ_DjOoCjfcQHEt6YEPi=pksFCRj=-zMrPwSQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+az44BGCQ_DjOoCjfcQHEt6YEPi=pksFCRj=-zMrPwSQQ@mail.gmail.com>

On Thu, Jul 04, 2024 at 04:13:52PM +0200, Dmitry Vyukov wrote:
> On Thu, 4 Jul 2024 at 16:11, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > On Thu, Jul 04, 2024 at 03:50:57PM +0200, Dmitry Vyukov wrote:
> > > > > Hi,
> > > > >
> > > > > What's the kernel policy for such cases?
> > > >
> > > > What "case"?
> > > >
> > > > There is no context here at all, and I can't find any patch on lore at
> > > > all.
> > > >
> > > > Please always properly quote stuff...
> > >
> > > It's not easy with kernel lists. I used the lore suggested reply-to
> > > command. Here is full thread:
> > > https://lore.kernel.org/all/20240704135057.1174408-1-dvyukov@google.com/
> >
> > I see no patch on lore on this thread :(
> 
> Oh, it wasn't properly threaded, sorry.
> Here is the patch:
> https://lore.kernel.org/all/20230801155823.206985-1-ghandatmanas@gmail.com/

Ah, ok, resend it and cc: the vfs maintainer, it should probably go
through their tree for other abandoned filesystems.

thanks,

greg k-h
