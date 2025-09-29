Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3CF30CB2D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Sep 2025 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161797; cv=none; b=sOL5Vohpq8A9S7UtB7qxC5a2Ky7STiHWffsmxnYwex2Tr54bBOPVo9L+5EUIE2nh3MBtSHcMD5GEBvJfDfRvmniHjl8UWKvtdQnItbXGzkUarRXog+PrFzijQvMA2yg1EaKi1m9BtXcHo7jcMg4Xw8iwWwcopSY2uI6O6gAe7Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161797; c=relaxed/simple;
	bh=jVXr4AKnZ9tRYCRE5NnK8FcxuJH0gJDr7VmgwMzBeJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F3yEAKO+MsxyKlExfZrTMhnBxxU9M9rAeMiW72X+cH9sI+bPdFS2sUBhpnX6OPw3xEy0BkqCAo+JQiYrmJ4qE0k7iYL+vIb6T8FiUT9//XCORyWFkAFL9qDIY2NdsrZiPmMokWEOUey/p85Do4C9WkqUsTMAnoYJ1MjEFLSos1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B0xSdimB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B0xSdimB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7BD5FC02449;
	Mon, 29 Sep 2025 16:02:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22860606AE;
	Mon, 29 Sep 2025 16:03:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7E9D102F198F;
	Mon, 29 Sep 2025 18:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sQfl2NHN0WXhah4rCT/bpWcrE66H3N6ruqjxAFkBiiM=;
	b=B0xSdimB4aS63FiBHbCdqTuzpFs+u082wH0WE3X/z8bURTWNDzgv/lhDWnkOs8dr5BfFSo
	xnPsTiBfUJxavTckGLzv6rXPqtSPIFvnPVaM2QLZnj0x3knweqOBQRCtgAL16/a1nJe3j4
	7aMS+woaXmRGv42J/JRvznFDXAxPm0Z0S7T1y/lu21kLzprjiwQjVn+4pd62aQPOUdzac8
	YTSQDUxDgkVR8nnRNpdvE0F4EbbCjziB0GjfHA9Cn4kYQAKHHePLpO6nCfPDQ1fMM48tfS
	9mIzganwJLr2Y8WiCmdO6Sz1yAOAaGAmQU9Xly3v0VQJbNrwJUkSuQJspwN+1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, 
 Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
 linux-kernel-mentees@lists.linux.dev
In-Reply-To: <20250918184420.76047-1-krishnagopi487@gmail.com>
References: <20250918184420.76047-1-krishnagopi487@gmail.com>
Subject: Re: [PATCH] mtd: cfi: use struct_size() helper for cfiq allocation
Message-Id: <175916178765.52129.18095278414992754665.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 18:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 19 Sep 2025 00:14:14 +0530, Gopi Krishna Menon wrote:
> Documentation/process/deprecated.rst recommends against performing
> dynamic size calculations in the arguments of memory allocator
> function due to the risk of overflow. Such calculations can
> wrap around and result in a smaller allocation than what the caller
> was expecting.
> 
> Replace the size calculation in cfiq allocation with struct_size()
> helper to make the code clearer and handle the overflows correctly.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: cfi: use struct_size() helper for cfiq allocation
      commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

