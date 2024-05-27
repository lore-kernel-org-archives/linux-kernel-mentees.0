Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921015EFCE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818290; cv=none; b=ky+Jvi6peQgauwHYoekp7mlc8/9gaRa16FQ1veRdo35xUvSxmS5hfvqJ0g9hxQ14iA3VMEfVARN1CJQZdxqOwzNtsxtp1Wu9bWWKjMrK1Ojxp0B8IP0RbVcEy+JyEkwtZR0XYmVEcmBzmX/2PDCQELWfCJcS8sIIjnVDXW/abn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818290; c=relaxed/simple;
	bh=+nP0nFvWQTGmKN1h8mBWXPdJ/NyR49065Fmlx0vf/hE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g0ruPmGHn5DIc2iMZd84vBQtrxzTFtHBt+6P5v4pjl1ksj1nyG4V9QSmFE7N2MvgaQcLPAV8XPWJ/zUoUgKbQ+D992JpoKMfX3bBj4OENvIzskvsPK9ZCV92sAh6mEbRTWzNfYjkj4IqfX0VMsU3Bt8gyb9sXAZ2NPhv3dZweGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KRzARuGC; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KRzARuGC"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1876401CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 13:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzezpcmFRuDC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 13:58:08 +0000 (UTC)
X-Greylist: delayed 465 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 27 May 2024 13:58:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04D2C4010C
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D2C4010C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=KRzARuGC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 04D2C4010C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 13:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 44AC247C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1716817818; bh=JskqYYyNz3dMD01WU+7KptXTcnGKmuo6XobKIxRvLCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KRzARuGChKTGCcbDUHYk3ELS9q4KssOknufzQxGTvfXOYWjW45Z5x8qzsjfzSsh2a
	 xQsNZcSAkOz3vRGzBnu1c9h9405N7mTbZSH97gBrvdKAJ5zbPrqJ0LRXGFWCyI4bhy
	 FDHUfk9nkcQZ/AGfp+4zLcGA/t2njvkxCwpjVYm6w9ZdQraiWGHxDutSh87SC7Ldwj
	 Me4QJzwPCFh1rk6BeYpfckdQM63R5O4KCec53FY8sYM3V8/1HQ/ZktC0rcnVtOt3Nj
	 QJdNEEAkl8Yt3KLdp3nrBaUKQm9IA5Y/BN+bEOqnB5DhUknVa0icYvVTEeUPuKrb5D
	 hv3NM+N13yIqg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 44AC247C39;
	Mon, 27 May 2024 13:50:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yunseong Kim <yskelg@gmail.com>
Cc: skhan@linuxfoundation.org, Jinwoo Park <pmnxis@gmail.com>, Austin Kim
 <austindh.kim@gmail.com>, shjy180909@gmail.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3] Documentation: cve Korean translation
In-Reply-To: <bf37bf39-32d3-457f-abd6-115215d631af@gmail.com>
References: <20240527103003.29318-1-yskelg@gmail.com>
 <87ikyzpgqz.fsf@meer.lwn.net>
 <bf37bf39-32d3-457f-abd6-115215d631af@gmail.com>
Date: Mon, 27 May 2024 07:50:17 -0600
Message-ID: <87o78rnz3a.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Yunseong Kim <yskelg@gmail.com> writes:

>> 1) Why do I have three versions of it in my mailbox, sent over a period
>>    of 13 minutes?  What changed between the versions?
>
> Sorry, I forgot the name of the reviewer when I first sent the
> documentation content related patch version 2.

Which is fine, but...

>>    Normally, you want to wait for reviews to come in on one version
>>    before posting the next, and you should put a comment after the "---"
>>    line saying what changed.
>> 
>> 2) When did this review from Jinwoo Park happen?  I was not copied on
>>    that.

You did not answer this question.  Reviews should generally be done in
public, but that does not seem to have happened here?

Thanks,

jon
