Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B75F46A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707685095; cv=none; b=DSW5+UAC3xwXDqLWkC2MRqp+qkHk6730rooxzwsxi7Nr0GoPoVR7Uv6LanDAjDnu8unYejZ1hDhDpQZlc5F0bXk/ljrJ7J7um3KqAu57QA/HcFbt/pbKOQmUQKZW6DfS8li0TWUpqm76BYGvovj5cxEO0EOqj+Vm3FaPIiy0HbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707685095; c=relaxed/simple;
	bh=RrzSXXk7UtVwrZ1/WZdD3UuUAO/VH8ivj2LiH6i78pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAcm9PEGGbSS3/PC4ZSvnomzgI7HzCGqnGUXEe8OiSnwhCo7uFbpdxbVhBPOZyUJUnf9U7yvauih8FC3Bv68fMlJt660Krw/hIOhomJ11cX4eQS3sj0VITR4WiUDIWAbiaplCiqlhlqw1FjwDRFa4W1472hWVGltmfAdzoEEjmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uCreMs31; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uCreMs31"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9668860FF6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 20:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joILrAYBPXaK
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 11 Feb 2024 20:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F0CF60BFC
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F0CF60BFC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uCreMs31
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9F0CF60BFC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 20:58:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F60ACE0E15;
	Sun, 11 Feb 2024 20:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AC1C433C7;
	Sun, 11 Feb 2024 20:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707685086;
	bh=RrzSXXk7UtVwrZ1/WZdD3UuUAO/VH8ivj2LiH6i78pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCreMs31bJp9DZQJdLJ6VTtdM57bYaq+dRdPIb4UXHb6g4uDbYcbmgQMm3vQU5rwY
	 xuUBE9e+S7itmXZ8vgmoYzqA6B/T5QFPZVfnWQshuDdntOEhx+F1EWsih20D3updw/
	 0SBkcvaWJsK+UbxedyXaq1qgeWRLvvFWJ/n//uWY=
Date: Sun, 11 Feb 2024 20:57:54 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] Fix malformed table error in gadget-testing.rst
Message-ID: <2024021158-rewire-duplicity-c31c@gregkh>
References: <2024021159-banner-dramatic-af88@gregkh>
 <74d67b62-6fa4-4218-b51f-f0d33f19c422@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74d67b62-6fa4-4218-b51f-f0d33f19c422@gmail.com>

On Sun, Feb 11, 2024 at 06:24:24PM +0530, Shresth Prasad wrote:
> I see, sorry about that. I will try some other way to fix the error.

What error, sorry I see no context here (remember, some of us get 1000+
emails a day to do something with, context is key...)

> Also, as mentioned in this thread: https://lore.kernel.org/all/877cjqa5le.fsf@meer.lwn.net/ has the patch already been applied, fixing the issue?

What issue?  Always look in linux-next to see what has been accepted by
maintainers as that tree merges all of them together daily.

thanks,

greg k-h
