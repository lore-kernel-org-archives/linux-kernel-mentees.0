Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050E257B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 02:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720665738; cv=none; b=VzolkS7wEtyVtvjXrYbZwAdL9ozS1YrnkjAp3H3ooQ9y8GBtsNR6loKMy3snFUy589g+/WprWtHTRBldlxWWH17FPJ4e9dzp5sOOsuVqsLVPkHKjdOOpuxLFDkDIlzdKuoxesK2US89EwwEP83UzuuEGgtyKDm5lufYwUTra6EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720665738; c=relaxed/simple;
	bh=PP+UCm2LVmmj3GNTFmi05xT/IodpvXYirFBYe1yPqyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcw/pDODNP3ligHGEe59G2FsmAyAqVrgUsd2mcmv/KbbhV3SZVGT/vHP9OPxibFM/MWBjFlwq59iHi6oDkzCr/OnZCn61RSV39E/Nkuv+qKWE11P09foTFHSvK/4TMeBJSQzUbzDu0wxRHcZS6uJuWlCYDqKPj+v3AByNsLL4xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=PINhV/+R; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="PINhV/+R"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02DFD607C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 02:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrJHWIPFCPRY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jul 2024 02:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C783B607A9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=mit.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C783B607A9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=PINhV/+R
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C783B607A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jul 2024 02:42:15 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-116-79.bstnma.fios.verizon.net [173.48.116.79])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 46B2g7wI028035
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 22:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1720665729; bh=F7H3+b2mAWAnFVkw4AcAdFXp3IHMf4irGnW5EZZM87s=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=PINhV/+RMiou4iHMX8KKjwNVuGiLgvJFw9v3r6kBYH8+Y/vQd48bir2+83ml0j/W1
	 qdwIoRHp23eeD92ltl2aL/WCysMYv07jqzR8m0Sf5I9FhtVnr+MCB6Znw7EQyg8en1
	 UqS7FsombG8OCK5GUywVc1ESWZoEYDl4AwXETWm33POkOH0OFrWiBBgpNX2ci+sgAS
	 DytK1LrSLpY9/iZiQxSELWZGxjbVj9QgXFtA24Zw+8jSpSf14vTfrW9nfa7RoFG/V1
	 vhWzG/zJKYOxfBatU0HU82EMkEIi/37pRdAI1psvyglyxSOJlIN8xhVOfhUMCAc3xl
	 Jn9570MFehGdQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 364EB15C0250; Wed, 10 Jul 2024 22:42:07 -0400 (EDT)
Date: Wed, 10 Jul 2024 22:42:07 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Pei Li <peili.dev@gmail.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+2cab87506a0e7885f4b9@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] Fix WARNING in __ext4_ioctl
Message-ID: <20240711024207.GC10452@mit.edu>
References: <20240702-bug8-v2-1-be675f490db1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-bug8-v2-1-be675f490db1@gmail.com>

Thanks for the patch; however, the correct fix submitted by Kees with
this commit:

commit be27cd64461c45a6088a91a04eba5cd44e1767ef
Author: Kees Cook <kees@kernel.org>
Date:   Thu May 23 15:54:12 2024 -0700

    ext4: use memtostr_pad() for s_volume_name
    
    As with the other strings in struct ext4_super_block, s_volume_name is
    not NUL terminated. The other strings were marked in commit 072ebb3bffe6
    ("ext4: add nonstring annotations to ext4.h"). Using strscpy() isn't
    the right replacement for strncpy(); it should use memtostr_pad()
    instead.
    
    Reported-by: syzbot+50835f73143cc2905b9e@syzkaller.appspotmail.com
    Closes: https://lore.kernel.org/all/00000000000019f4c00619192c05@google.com/
    Fixes: 744a56389f73 ("ext4: replace deprecated strncpy with alternatives")
    Signed-off-by: Kees Cook <keescook@chromium.org>
    Link: https://patch.msgid.link/20240523225408.work.904-kees@kernel.org
    Signed-off-by: Theodore Ts'o <tytso@mit.edu>

						- Ted
