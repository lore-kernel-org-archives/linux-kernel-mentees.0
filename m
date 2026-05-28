Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238F2E738A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 May 2026 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980579; cv=none; b=CBSjTZSwSVOAqWZSap/T1vVPpIpxyH9qEMb1M9l2MWHd8Gpkp//ODUeUTfVE8IZLQsID6XL3U5orrxbjWwumBnMJcfAuulxtEzfGU58r9S8AlPirfCZH96cKSobR2xsZUxzurV6k8O6SS79VF7EpDD5/ZitHJA8pt9/ulJeHjgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980579; c=relaxed/simple;
	bh=xPqOgVgYGPTJ6C4KNZOo2bJJEjldBGZAb8uJ3RyJDwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvflYnkVh1VUsk0Nris493AuZGTfAxlk5F1K+PYYnXxcpKZEzV0kj+WdwW4360rnfS7KJqEjOpwBOLS19nbS7SgH1a2aKPeWWa3lSwl2N0BT0tldtvXbYxT+TQhomo5nsHo1RSlxE1vd9sUiPtjFeDhMOLRGg/WTSHDrOMaxMpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=QGpZd9wz; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="QGpZd9wz"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22F7742878
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 May 2026 15:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZd-PUW8qI0M for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2026 15:02:44 +0000 (UTC)
X-Greylist: delayed 360 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 28 May 2026 15:02:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3C4942824
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=mit.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C4942824
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=QGpZd9wz
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=<UNKNOWN> 
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D3C4942824
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 May 2026 15:02:43 +0000 (UTC)
Received: from macsyma.thunk.org (c-73-9-28-129.hsd1.il.comcast.net [73.9.28.129])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64SEubRc017388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 10:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1779980200; bh=iqKteAK984FjwrM5PUMtor5r+Y3QTmrXtVrkLQwwr/4=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=QGpZd9wzqCbV7xQH0w76CblTqieXM7kUoSXGpxAjVPSbj1/Ypa5DYfskjVMGOk1lL
	 UOMZoB8JI1dTstXcJNcUCLR93e/lr9X2x86cZEkeMNiY1RfXMGaqFLSeobMNftFnCY
	 bR1bbRXL/+LefT26bWZVRa2mH5PVGu+jkSgWFZ26rURVEss6rUU2HpVXSyDyHlPYw8
	 WaKruws0uRJ8H8rlCVbUMzbq88EEGrEa4YaURnPD6LZcBztWBjNIbAeuQJmcQ7z76V
	 f0NSzZZyOR6t3k19wK8wcBEpc++pSnvGVq6C6Ug6GbHBu2EWVlLUaQHsc8YOvgUhHC
	 TLIBHlcdOMD0w==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id D7F236B6C0A3; Thu, 28 May 2026 09:56:36 -0500 (CDT)
Date: Thu, 28 May 2026 09:56:36 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Abdellah Ouhbi <abdououhbi1@gmail.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org, me@brighamcampbell.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] ext4: Use %pe to print PTR_ERR() in namei.c
Message-ID: <3ogsm2rbiyacwos6i3han5lwkuobxjjggpwfmkjbv45hrhqwh7@6d5mxzdvidbq>
References: <20260424152245.142308-1-abdououhbi1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424152245.142308-1-abdououhbi1@gmail.com>

On Fri, Apr 24, 2026 at 04:22:45PM +0100, Abdellah Ouhbi wrote:
> Fix coccicheck warning
> ./namei.c:150:25-32: WARNING: Consider using %pe to print PTR_ERR()
> 
> Replace %ld with %pe and PTR_ERR(bh) with bh pointer.
> The %pe specifier automatically converts error pointers to
> human-readable error names instead of raw error codes.
> 
> Signed-off-by: Abdellah Ouhbi <abdououhbi1@gmail.com>

I've folded the three patches you had sent into a single commit.  For
this kind of cleanup, there's no reason to have separate patches for
each file.

Thanks,

						- Ted
