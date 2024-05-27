Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0645A161306
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821739; cv=none; b=Bf8JE+oxP33rxZYgxP5aSJ7+0cL7Tkjt/EXR2IttrsiULb0IDMpl23W7bJTB7aJX3i3i95ROuVgt5mYJgqZjLYHersx5VTxFK24zkHo4VddgCL359Ne7ubXEMStOCDwwMVf47YugDf0IhMYwwVzX/JQKc2PdrkKEexgcctQJpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821739; c=relaxed/simple;
	bh=WqdfSky25P014jToQJxbbx2jmpw/Y6gIbx3q5jkMXhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=urxqsxfaPyIuRjN/BlzJQ6Vc+ZDnW239uQHN7Zje/i+nJsFqNSkpZtcQC5o7V7rcNEboRsXPwEEFZvYoSxeHW/joQsB3YqYrWaP2opG8XU1rAqfxqLZ0CCTx26niYyTTrOCI+1hAPTxnxiUFPmzKv1sIU78Y3Z+aFWGH4ayO3NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OpSRQSnA; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OpSRQSnA"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A501A40253
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 14:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHFNeF_BjGiF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 14:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C196A4016B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C196A4016B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=OpSRQSnA
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C196A4016B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 14:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3BD0547C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1716821734; bh=JUk9kiyoUx5RdgIxL9VYYk1ttK/biBJXbO+frYzpI0E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OpSRQSnAig4IIYY8BNqix2k+Yb6FWJLwUUDh/7zJR3VliwFvSwhjOVu+Z00OWVUTi
	 KVw4IkJcG5msbhLvlUo1sTFRWleDxOukx7T4tmzLHByyJOy6WBoMQSoE6Z4VSj5BNh
	 wCoU4L9+TRxIe0jBtjA1q9CovmgzTdxCOQMzpRLTRj3LkpHIAEgFEA6yy5+Q2HGI0Q
	 FM43LYmqlZedmh5NcbRxWKNjYk8UYXdxqSsRLcfqgT+CyufHyV+BJrCbjenZAOG8kO
	 7LfrCr41ZPvqI+8bFU0s7/jDCVKQxYGIJHgACbRe+inNRNKS/hgtXKkEvGcJaSVSbY
	 agwtFAZLmVOSA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3BD0547C39;
	Mon, 27 May 2024 14:55:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yunseong Kim <yskelg@gmail.com>
Cc: skhan@linuxfoundation.org, Jinwoo Park <pmnxis@gmail.com>, Austin Kim
 <austindh.kim@gmail.com>, shjy180909@gmail.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3] Documentation: cve Korean translation
In-Reply-To: <8880b0ec-9315-428e-b9c4-e578690d3c08@gmail.com>
References: <20240527103003.29318-1-yskelg@gmail.com>
 <87ikyzpgqz.fsf@meer.lwn.net>
 <bf37bf39-32d3-457f-abd6-115215d631af@gmail.com>
 <87o78rnz3a.fsf@meer.lwn.net>
 <8880b0ec-9315-428e-b9c4-e578690d3c08@gmail.com>
Date: Mon, 27 May 2024 08:55:33 -0600
Message-ID: <877cffnw2i.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yunseong Kim <yskelg@gmail.com> writes:

> On 5/27/24 10:50 =EC=98=A4=ED=9B=84, Jonathan Corbet wrote:
>> Yunseong Kim <yskelg@gmail.com> writes:
>>=20
>>>> 1) Why do I have three versions of it in my mailbox, sent over a period
>>>>    of 13 minutes?  What changed between the versions?
>>>
>>> Sorry, I forgot the name of the reviewer when I first sent the
>>> documentation content related patch version 2.
>>=20
>> Which is fine, but...
>>=20
>>>>    Normally, you want to wait for reviews to come in on one version
>>>>    before posting the next, and you should put a comment after the "--=
-"
>>>>    line saying what changed.
>>>>
>>>> 2) When did this review from Jinwoo Park happen?  I was not copied on
>>>>    that.
>>=20
>> You did not answer this question.  Reviews should generally be done in
>> public, but that does not seem to have happened here?
>
> Oops, sorry about that, Jonathan.
>
> Jinwoo Park sent me the review below, and I've updated some of ambiguous
> words in patch version 2.
>
> https://lore.kernel.org/linux-doc/57f0d90c-4cc6-4418-ab79-6ae026d8ae09@gm=
ail.com/T/#t

It does look like the patch was reviewed, but no Reviewed-by tag was
offered.  *Never* apply a Reviewed-by tag that has not been explicitly
given to you.

Jinwoo, would you like to offer that tag for this patch?

Thanks,

jon
