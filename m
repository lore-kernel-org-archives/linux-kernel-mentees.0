Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B05226CF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763479296; cv=none; b=VDEttZgQR2eMmoh0ec9bUJ1Y6SK2ukYsLp6dskRTTYFatUpco8HRVM/4M5aSyiCF/7jsyn/95lJMVjozbAqBg7x9tkF6zRKAZBq7u1fbqp9aUDFY3cZo+rNM/iNQ3LfbGJF1VkodRRBW3SDwp22S6o71tOjpVRvopqTbRQJY4uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763479296; c=relaxed/simple;
	bh=3tC/7RGBTLAz6SX00JnXVxOOzBzpTg9gCtsy6n2iSAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7l8EK7h1Y787TZXZm05T/0Z/2M4fA+iwgLKixCOPvXlbcTDGtfFmSthm1aYRavTaZknLeFEEE5OP/Sw4tyo53LumGTkHFCH4uOiMchywDcD2g7by1f9QWH3IAqkYWOpX57F83YBvwaGLMkIrYN7DrrLZYjalF3mrMs8mETsGUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=bIA2cuiL; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="bIA2cuiL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9B0F4024B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 15:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.998
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcwXIXFXQ5Tw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Nov 2025 15:21:33 +0000 (UTC)
X-Greylist: delayed 1286 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 18 Nov 2025 15:21:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B91C740092
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B91C740092
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=bIA2cuiL
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=<UNKNOWN> 
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B91C740092
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y9XALeKfiEwQpLNtrIYQtwh2NhbNt1WeeA0fPDhNUO8=; b=bIA2cuiLTuGAw1R3PEQz/pYIC2
	qBCCwuijAQ6cKvzeMGBJ+NyF8sk4ZxWsfMDfMn4NfDOpY5OwIu/CZocxTBXLrxZBCGX1N1f6vKEnw
	vWhr+xbOrLCgO1s9EbdIOJRw3ZTjrLof2N+yew8uL2lsXjI+ViqSBgXf0uJmEWTuUuAkuL8XIT00B
	LiQAoQtFjdi80MPxMiloqqTob+o2fpXxa5WilP585rB/2yQlnce8u5DDcx0Yyrbzr6Z14imM2qBcw
	M8/6c8CWWIW3dwFaI5gb2O+qb9dgeSkd/3vIeqt9r8+lUJjZp5GcD/sHyk9Fzaz2gqnn3tE49b6tR
	h0UkFfvw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNBV-00000008sEd-3aUE;
	Tue, 18 Nov 2025 14:59:57 +0000
Date: Tue, 18 Nov 2025 14:59:57 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: brauner@kernel.org, jack@suse.cz,
	syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com,
	frank.li@vivo.com, glaubitz@physik.fu-berlin.de,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	slava@dubeyko.com, syzkaller-bugs@googlegroups.com,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] fs/super: fix memory leak of s_fs_info on
 setup_bdev_super failure
Message-ID: <20251118145957.GD2441659@ZenIV>
References: <20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Nov 14, 2025 at 05:52:27PM +0100, Mehdi Ben Hadj Khelifa wrote:
> Failure in setup_bdev_super() triggers an error path where
> fc->s_fs_info ownership has already been transferred to the superblock via
> sget_fc() call in get_tree_bdev_flags() and calling put_fs_context() in
> do_new_mount() to free the s_fs_info for the specific filesystem gets
> passed in a NULL pointer.
> 
> Pass back the ownership of the s_fs_info pointer to the filesystem context
> once the error path has been triggered to be cleaned up gracefully in
> put_fs_context().
> 
> Fixes: cb50b348c71f ("convenience helpers: vfs_get_super() and sget_fc()")
> Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
> Note:This patch might need some more testing as I only did run selftests 
> with no regression, check dmesg output for no regression, run reproducer 
> with no bug.

Almost certainly bogus; quite a few fill_super() callbacks seriously count
upon "->kill_sb() will take care care of cleanup if we return an error".
