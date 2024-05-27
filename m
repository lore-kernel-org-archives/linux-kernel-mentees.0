Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFA415E5CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 12:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814389; cv=none; b=VkiSInijL0PouJoTz6ihRivyQUDszvcl+gTu+aVfuIch75cowAG7BGaUkx5OsB8m49iYSLyvqmr6fPQUhJzyqnOc4a4ll5Km7cgBSMFYXvvl7VOGRYBpNkYE0m4RgPuppG6oJm8nt8/HAXeKPJV2sSdwlIzCt9AxcETJeDgAl10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814389; c=relaxed/simple;
	bh=kBPorpQ7vBYqMRTfoGQhRu1WySBg6CbmBx69KpiwWGE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=So4+njljgZYIEJunrq7joyjCA5VxR1ofOYvaQgf1VGiz4nVIhyCPdZuUM8+Py3ZL7Dozfoz/jQRFwW+42RIaD7TwZONMFCpQauT507PquSvV+ELarahrOExrYTgP0qEV/UcjCU+OvGcBBGB3T+V8/jvjqoK/pmvbx/H+iKWvr4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=N0/wY+f3; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="N0/wY+f3"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A76581EAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 12:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id au8-LoI3oWGb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 12:53:07 +0000 (UTC)
X-Greylist: delayed 569 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 27 May 2024 12:53:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 034A681BD6
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 034A681BD6
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=N0/wY+f3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 034A681BD6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 12:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 269E247C5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1716813813; bh=hZwk0AW8MLiViFy52ADHgAvY9XF6YcrHWsC+PnuwlD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N0/wY+f3sVLJ5hmYykdJ3dqt8t9u6adwghZY4UVPJQrK/haj1xVCL/ipi7mnAIIZP
	 aOZRYUUa5Ix8zduN2WqD5lpzg79od4xBJ3E+rnSFWVBEt/7cKqb/RwmEsaus9ENcNd
	 HsvjHPtklHZk45chyYMocmPBDPI+EX6DsefwzWSc+pczfBLBEyodip6PgKa5AduTxp
	 9+9XooKIm3+c6J+Bwrth+T/WHs6mPTGRpy8ImJA/EQiFEXEaUtrWu/jsMngUcIelgG
	 92ZF3BDtAlLm/+3XxoqWLNNGflc5/gc/fwF/UAWq8/jo90vhoOq8judBV8PTuaQF8u
	 Yzg/RnE7R5mhA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 269E247C5F;
	Mon, 27 May 2024 12:43:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: yskelg@gmail.com
Cc: skhan@linuxfoundation.org, Jinwoo Park <pmnxis@gmail.com>, Austin Kim
 <austindh.kim@gmail.com>, shjy180909@gmail.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Yunseong Kim
 <yskelg@gmail.com>
Subject: Re: [PATCH v3] Documentation: cve Korean translation
In-Reply-To: <20240527103003.29318-1-yskelg@gmail.com>
References: <20240527103003.29318-1-yskelg@gmail.com>
Date: Mon, 27 May 2024 06:43:32 -0600
Message-ID: <87ikyzpgqz.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

yskelg@gmail.com writes:

> From: Yunseong Kim <yskelg@gmail.com>
>
> This is a Documentation/process/cve korean version.

Thank you for working to improve our documentation.  A couple of
questions, though:

> Reviewed-by: Jinwoo Park <pmnxis@gmail.com>
> Signed-off-by: Yunseong Kim <yskelg@gmail.com>

1) Why do I have three versions of it in my mailbox, sent over a period
   of 13 minutes?  What changed between the versions?

   Normally, you want to wait for reviews to come in on one version
   before posting the next, and you should put a comment after the "---"
   line saying what changed.

2) When did this review from Jinwoo Park happen?  I was not copied on
   that.

Thanks,

jon
