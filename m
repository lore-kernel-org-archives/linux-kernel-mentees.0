Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750781FC7F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Nov 2024 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731443947; cv=none; b=DNVLZhC/8IQEDM4PhWzEPNf0whCMcPqFFo+vzmnDQf50GEG5uH2KLTLBKRwfelpKBvp/lTrnsq1hKeZimi2dF0BXZqSwfWhUiogwjWEp0z9EAsxF3rYayMIXikG8ugBQQag/gNjvCd2mcsitUi2hSy7Hxr+KEsJJ9uTbALmDNJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731443947; c=relaxed/simple;
	bh=j94YPPKHW+HGIR9yGse9SApV73HQ5pPkVnWZ6EPbohE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t20B2/MR6/fLDoNhr6wx/p6f/6rdjQKulT+d3rNOLquhhImbQBjOmGcNU+m+x7W2wztf7/1/TBWv7EZ4OiYY7ckprPNfewPRVl5yMIbNl8nMTiBtvRlZWathg6T735Jr7IXvkxZiVpccJfWRoONGGhxq5nuQan5EwC1fOHZeNrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=i7pXQKor; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="i7pXQKor"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E36460810
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Nov 2024 20:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxu89cLGP6lz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Nov 2024 20:39:05 +0000 (UTC)
X-Greylist: delayed 600 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 12 Nov 2024 20:39:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEB34605B1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEB34605B1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=i7pXQKor
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EEB34605B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Nov 2024 20:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 22C5E403E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1731442960; bh=2rETktBd99QqoCTmMdd2okuoKC8zuYCdjVSFBuTiRx8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i7pXQKorhE+a7z0fOmtLA3DIJZ2yunwHFi5AaXefErA5kpspQj/NocH2omEjQJoWc
	 XSpVhG+oVlq1HX6TRm30SHiZGfdLBgyEmg9i0q2XudThYutlZsWRbBceMAjXUdmVlM
	 /tvWDIVkc6NrR0s8aBjHVwT/WOCE2ftrgglGBxgO8UklutlxsaYl8SoVX9LWIHiVrN
	 LAXGVBDTVAVbvHEYJ84/sYWjccNLBPQQuG9Q4d6gUAnlrSxZ1iigI7a0/uOvSLvKap
	 FstOwfmgoSvfH9tBba/Avi/rOR+cdyBinVV+ps6W7BClz40p5Ls1jjjmI+Z/8Or6H5
	 U7Gzg4mZUyzSg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 22C5E403E4;
	Tue, 12 Nov 2024 20:22:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Abhinav Saxena <xandfury@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Abhinav Saxena <xandfury@gmail.com>
Subject: Re: [PATCH] docs: fix typos and whitespace in
 Documentation/process/backporting.rst
In-Reply-To: <20241107061911.106040-1-xandfury@gmail.com>
References: <20241107061911.106040-1-xandfury@gmail.com>
Date: Tue, 12 Nov 2024 13:22:39 -0700
Message-ID: <871pzgqk1c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Abhinav Saxena <xandfury@gmail.com> writes:

> - Fix repeated word "when" in backporting documentation
> - Remove trailing whitespace after '$' character
>
> These issues were reported by checkpatch.pl. No functional changes.
>
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> ---
>  Documentation/process/backporting.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
