Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC474275B06
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755799111; cv=none; b=E7ExdpfjJoxgEPmyS0uEe4YU/dMr2o8Ikno4RZVmOh2JdoA9gh+sDiCVbeBOVTCK6SFWewKciQjdvGWM736Ec66rFS1Sa4PZTbdCWr1I5V30FqqkVhzWAnkVkOSCdP7K1ahL8AJFmfWUj/+WWsTm6r2U8eEtDrESFrzCg8sn0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755799111; c=relaxed/simple;
	bh=lKC0gGuRg1LBt3KgL4gxVmPHH38dQCSSXFCh1l/n7tI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OJhce1Sqsj/X3kcVrRnP11WAa/aQn6nDoxDsxolZLHaX9FzivexOTFlnr5B/3dfp0/umV8o8MkLDPlrIN9Mue0s3ZolaGUxPpAKs+SYxuowfWBJMzRdZS2s/HdfdqUrjNKy7Vg0wX0afKFKZJ8L381Vz91s/ZDFql5ZUd0qUTOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lpob/KNh; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lpob/KNh"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FA87845AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0hF0SDBhy_n for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 17:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E62C884411
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E62C884411
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=lpob/KNh
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E62C884411
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8180A40AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755799107; bh=sJ463h7DeyyviDVQo3psqYEE6VLuptjH0+fjF1nwv7E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lpob/KNhqhvg8i/L4sO2QkXheoqc2WaFHfbbSvUxdFWD+5827+rzAMj3LKmcEfEYo
	 qADn7vlj+o54lritT7nEYPnE+CzvwuYk/3wVCVYQmusMsw/q253MGVr/AHKKZc+HMw
	 oA9TwvgR1pmXDrho84EcNZv4ZZukt9+J86mB1z/ZHX491xr04k2/7Unyrf4FdQXNPP
	 rFhzZo45ZLuE3DkQqDqkYBcH9YeiCnCA/hiuf/wwkFh7szXiWliN17VLqcDKIScslN
	 epK/UO9bc8Klt72xvaB43JYuwsm4nmi9LsHtxItIFuITvAw5wpwztWrC3phvYU2rrp
	 0XfNo6gBkPiGQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8180A40AB4;
	Thu, 21 Aug 2025 17:58:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, rdunlap@infradead.org,
 Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: Re: [PATCH v3] docs: replace a duplicated word and add missing
 SPDX-License tag
In-Reply-To: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
References: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
Date: Thu, 21 Aug 2025 11:58:26 -0600
Message-ID: <87ect47e0t.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bartlomiej Kubik <kubik.bartlomiej@gmail.com> writes:

> Fix documentation issues by removing a duplicated word and adding the
> missing SPDX-License identifier.
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>
> Changelog:
>
> Changes since v2:
> - Replace =E2=80=9Cthat=E2=80=9D with =E2=80=9Cthe.=E2=80=9D
>
> Changes since v1:=09=09
> - Add missing SPDX-License tag
> - Remove duplicated word "that"
>
>  Documentation/admin-guide/kernel-parameters.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

A couple of minor notes:

- It is good to indicate *which* file you are modifying; I've rewritten
  the subject line to that end.

- Adding SPDX headers is a bit fraught unless you are truly sure of the
  license under which the file was contributed.  Given the nature of
  this file and all of the people who have touched it, though, GPLv2 is
  the only option that makes any sense.

Applied, thanks.

jon
