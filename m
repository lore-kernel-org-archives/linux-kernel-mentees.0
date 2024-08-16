Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC180045
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 06:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723789723; cv=none; b=C0CHbyIn+e6/IQzXUgP9Sf1a94A0A0I0Qmuf5BXWz9eFijfVGxQzPwNYzve///6Q5xwF8xc+ghJTQpWWfneUoAyZo/8SgzvNoiQ5OG5HFD2suZiJnGX1dWxxQzvuClYtkY/FInYGMNi53/DhdOTOoPVTCFXnjDsTehVBICkrZ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723789723; c=relaxed/simple;
	bh=bVnL9mWO+xmONoQ2eXFIoAdzIAkO74CrAfNgWl/8wQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw03v8fufcHfrXXAlIQD26me93UmPBwjFYj6uiMw73CqiAuFzSOzQTME8EFsIMm77V+30nAdWUEs2dMAAYcsiq72fVgkkyEeBr7v5zdqNZ38wXZmqCPPr8I5Aq24AiB8qsFipiG3PjoFVg+DvMAarMWryVR2UBKUbEkltqpaO6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jgF5YHXh; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jgF5YHXh"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136366067E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 06:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kIvEm1_zeK3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Aug 2024 06:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A93E6059A
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A93E6059A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jgF5YHXh
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4A93E6059A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 06:28:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD2ED620B5;
	Fri, 16 Aug 2024 06:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2408CC32782;
	Fri, 16 Aug 2024 06:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723789718;
	bh=bVnL9mWO+xmONoQ2eXFIoAdzIAkO74CrAfNgWl/8wQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgF5YHXhDG7xNu6YZUMR5XN0X5XI+S1s4/09D5fDM9woPI+sW2ISpjwlFRiapvU1S
	 ZJzo9xEd0rkXK+w07ZUPhkOOi48JBvS8W5VN7VZZOEmvdF2x0rSEoGLt7RjUQqPN8o
	 W5ixzsKFQHTCyTv+RRAG0tjLd8yask/L80FFodb8=
Date: Fri, 16 Aug 2024 08:28:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>
Cc: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	Dave Kleikamp <dave.kleikamp@oracle.com>,
	Manas Ghandat <ghandatmanas@gmail.com>
Subject: Re: [PATCH 6.2.y] jfs: define xtree root and page independently
Message-ID: <2024081652-oxidize-unreal-405b@gregkh>
References: <20240815183641.7875-1-sergio.collado@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240815183641.7875-1-sergio.collado@gmail.com>

On Thu, Aug 15, 2024 at 08:36:41PM +0200, Sergio González Collado wrote:
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

You submitted this for a lot of kernel trees that are not supported at
all (i.e. end-of-life).  There's nothing we can do with those backports,
sorry.

You can always see the active kernel versions on the front page of
kernel.org.

thanks,

greg k-h
