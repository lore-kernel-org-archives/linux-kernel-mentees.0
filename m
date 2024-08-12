Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B9F17E44F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473482; cv=none; b=lwiPnby9bkTafRuN8KTaGh4hnZhLsFSjZ8AKCkIkuUBI4iL2in9H4tKlywMkFC2VqBJi5G1gpiyLeI10/lSZer80luhXKnPBj1QMGvDEDAxge339kK2DO2NDiV9/PS7kOMRwhfC1kBtuekw3cSMJvYY1CzuxKNhIWlo6k7ZHOd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473482; c=relaxed/simple;
	bh=J33ODb0jdMvjGXfb18N7gUExMr1Pv8FO7J+BGOW5v+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dC4lYCd1VKxHaSddhlTdQjzGlq7D8+z2VvvFaE9vAV6nSx66w5zJ5G0FJlpA3x49S12f/nUPUnRa5l7nI5hUJRgEDcnacan0c+pf0WUOH3g/NsfzfO5JjmWS2grBEgJ9PU5HfgCJGNPOQsF9XiIOZmMT/6vBhoQGW6oMRw1sQCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kXkm0NEp; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kXkm0NEp"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2FF8607E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 14:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqjC0WHY2E-B for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Aug 2024 14:38:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 451BA607DC
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 451BA607DC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kXkm0NEp
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 451BA607DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 14:37:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 376CD60921;
	Mon, 12 Aug 2024 14:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86056C4AF0D;
	Mon, 12 Aug 2024 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723473478;
	bh=J33ODb0jdMvjGXfb18N7gUExMr1Pv8FO7J+BGOW5v+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXkm0NEpf4kQbZnomlRPANxhd/3X5UuUXyWhN5Wb3jnnmxZ297yJCV1i/1vxAsyjN
	 hEpL1wcHOynepItstH2X9yY/Wi4r5XY1TcOoT78AOubpxIh7FJJAIk/67IO/pk2YYH
	 z/UDBLSF9fGkBzyFr+sKELedS5teZE9JzJ5JPvYc=
Date: Mon, 12 Aug 2024 16:37:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>
Cc: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	Dave Kleikamp <dave.kleikamp@oracle.com>,
	Manas Ghandat <ghandatmanas@gmail.com>,
	syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com
Subject: Re: [PATCH 6.1.y] jfs: define xtree root and page independently
Message-ID: <2024081227-habitat-cough-dfb0@gregkh>
References: <20240730201315.19917-1-sergio.collado@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730201315.19917-1-sergio.collado@gmail.com>

On Tue, Jul 30, 2024 at 10:13:15PM +0200, Sergio González Collado wrote:
> From: Dave Kleikamp <dave.kleikamp@oracle.com>
> 
> [ Upstream commit a779ed754e52d582b8c0e17959df063108bd0656 ]
> 
> In order to make array bounds checking sane, provide a separate
> definition of the in-inode xtree root and the external xtree page.
> 
> Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
> Tested-by: Manas Ghandat <ghandatmanas@gmail.com>
> (cherry picked from commit a779ed754e52d582b8c0e17959df063108bd0656)
> Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
> Reported-by: syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com
> ---

What about 6.6.y?  We can't take commits only to older kernels, that
would mean you would have a regression.

Please resubmit for all relevant branches.

greg k-h
