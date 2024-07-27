Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D369D1C680
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722059279; cv=none; b=Oyd26kKWdy5jmWwXF3UFUcqXVjuf1+crkjUwPxXS8j9UWIIHu2wcVdaRypdJNF468DZnh269uoR8HP7dV2+g+RRGUM1aza4MLVSm+Etkr3N6qBjqgwL/fyCOIc8k+Td1KaoZDXYKpSshXsOGSik3or0JGdwA80BCwqDMuu2SWvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722059279; c=relaxed/simple;
	bh=ln5NTakwSSNf0pLbN2vKA1hAEvoY08AWdFsn0HbEjds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG8o26nWoONqdgrCNQbh6AansCiAHpT/yIptGi9GWbBAUWZm6+ZZmkrIvGHX5JCNcpFxI1IUyZQBc95dK6m3X0NZ1ThoIMMpQzUovSqneTonscAdmuN0BEAAPoWuQfftSNIUWyi+smaTvCFjhmo5/vCBKzS7W55fqC1rQOAG0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=STBp318R; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="STBp318R"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78A2F40E25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1lImt1S0kA4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 05:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D5AA4010F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D5AA4010F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=STBp318R
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6D5AA4010F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 05:47:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 79D42602C2;
	Sat, 27 Jul 2024 05:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F9C32781;
	Sat, 27 Jul 2024 05:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722059275;
	bh=ln5NTakwSSNf0pLbN2vKA1hAEvoY08AWdFsn0HbEjds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STBp318RJJkng2MU9cFb9t6xqJ1YSEundwIFKBFFczhm1GAGppmhBxAwUG71L2Eah
	 gNZ82czSGNj3XNkHSDIAxk0TxLQwO3+B661ph9k9LMSgHNO3qM/z+F69ELcejiudOo
	 ILRuqcQKrBfxkQ6HIglcL93s0GKoNkbQUFV3qjEM=
Date: Sat, 27 Jul 2024 07:47:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
Subject: Re: hfsplus: Initialize directory subfolders in hfsplus_mknod
Message-ID: <2024072704-scorpion-pretzel-cecb@gregkh>
References: <20240727052349.74139-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727052349.74139-1-simeddon@gmail.com>

On Sat, Jul 27, 2024 at 10:53:50AM +0530, Siddharth Menon wrote:
> hfsplus: Initialize directory subfolders in hfsplus_mknod

Shouldn't this be in the subject line only?

And no [PATCH]?

> Addresses uninitialized subfolders attribute being used in `hfsplus_subfolders_inc` and `hfsplus_subfolders_dec`.

Linewrap please.

> 
> Fixes: https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
> Reported-by: syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/x/report.txt?x=16efda06680000
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  fs/hfsplus/dir.c | 3 +++
>  1 file changed, 3 insertions(+)

As this is a v2 patch, you must describe below the --- line what changed
from the first one.

thanks,

greg k-h
