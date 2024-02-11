Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B98C5A78A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707648889; cv=none; b=e3H32U4utKIQ3rXu0wVsj+Y/eOx2dXjopIrHEs5x7qeitOcXLejynT4jTPrmZvC+tA9F3uFiecc5lPFbMq35gy3oubq8vc28kpnrGsf7kesWdSpzOgBX+8XlE0jrrNZIRXqTB609NcPlqRSvj158VISA/8MpWnBUNGm/T9RoNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707648889; c=relaxed/simple;
	bh=XidJr1ZlQjXr0bF6dE9gAFyg9lk16J+ooF1DK7KJovc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGL8AlCW2SNQLn33QypsOFqn3DkRmB1o0QkV25a5g3uOxmKRz4TRXM9ky1Dn+DmzMYOr0rbZb4lc+it55XQAjPgt60/nxDt22jS8oINI82U/zf3zEPts1ZvryW1VvBZ6tYXLplUFtq6Twqk4A0aBu7fZcQy8K1r1uFw5SnGUKPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xonQOv+c; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xonQOv+c"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB3CA409A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 10:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B8CoWXRVOhm5
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 11 Feb 2024 10:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB46E4037E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB46E4037E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xonQOv+c
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BB46E4037E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 10:54:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 944CBCE09AA;
	Sun, 11 Feb 2024 10:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B1DC433F1;
	Sun, 11 Feb 2024 10:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707648881;
	bh=XidJr1ZlQjXr0bF6dE9gAFyg9lk16J+ooF1DK7KJovc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xonQOv+crnNzxpR41yVlGsPJsZWPjzgfG1UGAYv1pRg6BgcAd0besjn4nzOtRO0/G
	 TItMQ8vp9vkV8JpXhj/lcnReUVXHQP92WEnRwUdgcsi4OXpV6PaUofBrtnkzTiFSO5
	 54fFSdqBXe8r30QxZM43Fwo9lF4jA1YZT4o2FD8c=
Date: Sun, 11 Feb 2024 10:54:38 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: corbet@lwn.net, linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Fix malformed table error in gadget-testing.rst
Message-ID: <2024021159-banner-dramatic-af88@gregkh>
References: <20240211101324.37266-1-shresthprasad7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240211101324.37266-1-shresthprasad7@gmail.com>

On Sun, Feb 11, 2024 at 03:43:24PM +0530, Shresth Prasad wrote:
> I've replaced all tabs with 8 spaces in gadget-testing.rst so that the
> document is easier to work with. This also fixes a malformed table error
> emitted while compliling the docs.

Please no, tabs are tabs and we all know they are on the 8 character
boundry, so they can stay as-is.

sorry,

greg k-h
