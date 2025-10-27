Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A872F690B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578383; cv=none; b=du8OI3nP7RE1EEaeCcyVh/474RGdepjiXMTvNDvIlHoJ+IITr6RVd7+eJayVM6fmSpwphJtAOnVQj25mRosUi1/p1WBIRmedAKiVv+XmSLyahMXtbPy0ivNiim4DfuWHO/6X7Z0woykIcovJx1atJK1150flYvzFwpQWqC2swas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578383; c=relaxed/simple;
	bh=BMapSBYAO53AJvc4WTEhyEXvhYKAuV0mXHwxj9h9aHA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oNx8YaHd0nzrTToes7/aUsWUSozqhiIgdvbkdqDbZwZEvOR+OSOjfXlCcWIFksAzXu4B6t1sEOEB00wBMPUo88TEh1aZqZrAVoDNzY+yMu+dzUSLpF6D1xWenCWoOerVCgiqJWMNdYQLlqb6Eg9jFJxBGg1C+0hEr7fQ1HyMR2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9eLsuyu; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9eLsuyu"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FA4B408F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 15:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSOcour9KVLU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 15:19:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6B394089B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B394089B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M9eLsuyu
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C6B394089B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 15:19:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAB3060377;
	Mon, 27 Oct 2025 15:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FCFC4CEFF;
	Mon, 27 Oct 2025 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761578378;
	bh=BMapSBYAO53AJvc4WTEhyEXvhYKAuV0mXHwxj9h9aHA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M9eLsuyuaL3gq3sqSRLpyKhN+KHGut4HbGKh2FsxoVNRdkC36ADnJFMrp+jklVmlL
	 QnprKg0YFBYVKT43cr4GubNJ65fzPer6vZGREjfmOga3yvDNQBONztC+p4AWaJBVum
	 ujYBxCjH00QACKSxjpxl3PQudAPusWPSLY1m1q2daB/bpmUvVQAcWiSoQoB/e7q8Dt
	 SkEx+j0UuhhkmUEplj+6sQY/FCZihmmcJxbS1kATjMdVBmRLZ4FQWR7ITflaBwLwxn
	 boMQ7QlcT8/y1aDDzJM63/S+e9qSMx/i/XUbbY/zndARO364l2VSpryIJWIPhrvZiq
	 r18qCM4CcaxrQ==
Date: Mon, 27 Oct 2025 08:19:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Jason Xing <kernelxing@tencent.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] selftest: net: fix variable sized type issue not at
 the end of a struct
Message-ID: <20251027081937.3b89d06f@kernel.org>
In-Reply-To: <20251027053156.34368-1-ankitkhushwaha.linux@gmail.com>
References: <20251027053156.34368-1-ankitkhushwaha.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Oct 2025 11:01:56 +0530 Ankit Khushwaha wrote:
> -		struct cmsghdr cm;
>  		char control[512];
> +		struct cmsghdr cm;

This is no longer in the order in which it will appear in the msg.
If the struct placement is not important just use a raw char buffer
for the whole thing.

Before you repost please read at least the TLDR section of:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
-- 
pw-bot: cr
