Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768C018FDDB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204456; cv=none; b=HgNPQ0whlTGT0ZGRrUJyBQcaHGiXZnEfiIjXc+y0Af33Stz2uPkCRx/nOe6OewlEE/FijFT7LLjgx24f17EYUczEddEid5HGaKG66/aSlBP3+OwRmd6TdtpTR7AKNPs+HkY487k3xyiWaDozUE3DWJt6hrXkJQ5Qg0o/YxR+5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204456; c=relaxed/simple;
	bh=KnNH/QY3pm6VM2U2Ri0bh2Sw0a4Ubxf4FKAIDqns42A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lw8ua/T6XZeF8J9hInwAfrx/yL4dBhbRJcVtTWvJY9VbaL5IHTQa3gfdDffExwTBPVjdA23m2lXbg3i91gtDQ+Lg+Dvlt0dZ73HKH8q6E5MbDjvQdAEEZ8sXQv4be/X8WaVfbAB4A0/6ZXmXVG099tPJVJX2SuPyZjaEOfDlizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jLd7aB1x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jLd7aB1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96989C4CEF4;
	Tue, 26 Aug 2025 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756204455;
	bh=KnNH/QY3pm6VM2U2Ri0bh2Sw0a4Ubxf4FKAIDqns42A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLd7aB1xWZEqZVdcMscscZs5q2R1wwU0aUEX5pu8Adx3GI8pnNW3Obmx8ivHpaGqb
	 zErRaty/8Q1D+tTNKRuWdkaQBmDM6jWPzauq/hf//0oLFe+O1uolpD0c0Yqi/vD/tW
	 I3m7YF4G6EAgyrnejXsn01MSIUj95C6eYk0J+Q9g=
Date: Tue, 26 Aug 2025 12:34:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ally heev <allyheev@gmail.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: Re: Linux Kernel Mentorship Fall 2025
Message-ID: <2025082640-immortal-matted-e1b5@gregkh>
References: <CAMB6jUGOMwxXe=-04hSF8BEro_SZdQXa3XuVvkrrzCWqeG7KXw@mail.gmail.com>
 <CAMB6jUEL7juRQ=sz=rXooMMduEedwb185k+1kXbcWRD-17sq_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMB6jUEL7juRQ=sz=rXooMMduEedwb185k+1kXbcWRD-17sq_g@mail.gmail.com>

On Tue, Aug 26, 2025 at 03:54:02PM +0530, ally heev wrote:
> Dear Linux Kernel Mentorship Team,
> 
> I am writing to follow up on my application for the Linux Kernel
> Mentorship Program. I submitted the required evaluation tasks last
> week and also sent an email to skhan@linuxfoundation.org. However, I
> have not yet received any feedback regarding the status of my
> application.
> 
> When I log into the portal, it still shows “Application Pending”,
> while the Linux Kernel Mentorship website now indicates that
> applications are closed. I would appreciate it if you could clarify
> the current status of my application:
> - Is my application still being considered?
> - Has the mentorship program been temporarily shelved or finalized?
> - Should I interpret the lack of feedback as a rejection?

Applications are still being considered, please give the reviewers some
patience in selecting them.

thanks,

greg k-h
