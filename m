Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD824500F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464698; cv=none; b=p2Bw7PVUgTdTxxOSjcyMoMP1kJQRlY8Wpf+656f4DqCSEe2fMBBWpDrDn4vzLwUJiTHmMsysf+4QSLwKcVuRF1X+fm390or2nAQrvwtliNdPWmoNMbQBuApB67CnwVES4qSD341lkxWQzKJNOJn1Xfxc1Lla/85cWoiOqbRB3zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464698; c=relaxed/simple;
	bh=H3LbMmPfwgPxBNF5S7rf/SwEzGMzP3xhrjjQVJ2esug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QT0rATlrl0539jwNK6vlCCnnx4V4HXTThV9eeAEDQ4U0pE5EUYwhS3pfhq1ey1s5JQTqtL3eUYiigyzoRJcOpoRkJztcOyanBoWq+sH08CxdjyOJtVEmqrifUoCh6bie0Q/5Q2Jcgcj1LCBFXJ17KNLUS29DrsGpXsCWuBfJHVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WDa+7yWO; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WDa+7yWO"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD1760746
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 16:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNLxVm18FE5A for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2025 16:38:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 895E2606A6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 895E2606A6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=WDa+7yWO
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 895E2606A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 16:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6BEF044097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739464685; bh=AugokloXn+LJgOYi+jZW4KgQueuJv5Ke/6PGjnYIpJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WDa+7yWOGvzYrZ2e0Ui8z60dvJm7d2L/yEQv6KepmJxu+9SD5Yjz4lhdH6eyoTOd9
	 REGE9VVyI009z7mHNu9B9T2Yxej6kPFNi1S6zWAM4skrMLX7pAwDJA+D1pY/RG3pDJ
	 UTrP66/CtYnYELw8sYCBN60jiZ5N1wvHc8GuK82cMMKTrRqUueeQ3/KUQIerkPRwgH
	 l1cC2gdqmnz0aTMI+SoIRoLYzWAdlz5/kxOzvpXDM7gI+6P2wmasgcOYZpEv3doy3T
	 Gql+P6A82br6/NWSv9gjD2cIidbFiVz2AQs/U6tK7MmEFj3LUW04BjhvtMoTX7Dstn
	 6w6aC1aIasaQg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6BEF044097;
	Thu, 13 Feb 2025 16:38:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Dutt <duttaditya18@gmail.com>
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Aditya Dutt
 <duttaditya18@gmail.com>
Subject: Re: [PATCH] Documentation/driver-api: fixed spelling mistakes
In-Reply-To: <20250211103002.199004-1-duttaditya18@gmail.com>
References: <20250211103002.199004-1-duttaditya18@gmail.com>
Date: Thu, 13 Feb 2025 09:38:04 -0700
Message-ID: <87seoh6brn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Aditya Dutt <duttaditya18@gmail.com> writes:

> Fixed some spelling mistakes identified by misspell tool.
> The example code in Documentation/driver-api/nvdimm/nvdimm.rst contained a
> misspelled identifier (paramaters instead of parameters).
> This typo would have caused a compilation error if copied as-is.
>
> Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
> ---
>  Documentation/driver-api/media/drivers/zoran.rst            | 2 +-
>  Documentation/driver-api/media/maintainer-entry-profile.rst | 2 +-
>  Documentation/driver-api/nvdimm/nvdimm.rst                  | 6 +++---
>  Documentation/driver-api/pm/devices.rst                     | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon
