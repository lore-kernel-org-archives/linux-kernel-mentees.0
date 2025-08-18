Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C979CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755535966; cv=none; b=WlM5hbmGTTRWQ5hpnqaeqrmIZEf2fa+qh90iyUcgoSVn2hyU4N7Ps+IfDBX3n9lEsVHFeZp/kGzp8r2YddEvOXfclwcqlD3fP4LRD+grsWtRx68XxB4Sfaep77gCLObjVmbcvfKs4QUkX4Y534SFyY0R8I1CwqnGE2fj9XwbZoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755535966; c=relaxed/simple;
	bh=RaZ61BdX4xFg8kvTPwXNCloQmCraD3QMXDwjjRuBcCQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q2GrqUDhJzKe/CrJbgkbfkHLLsD0XFrybW3J9DqM7z9vU8SBAALLqPOhZoBa+sdsIVaZCTzQKZWyTCaDQ3m+ujkrQInW2nSbFu9qtZzUL28FWfMUkyX6KXWZ6LKHv+qX6IVDIBj5JR9DjXrPJU+yxrT9Ke7vfYfCddeWGaxSfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=a4ClcLts; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="a4ClcLts"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06FD6400DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HKahjJIsGAz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 16:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60C6840515
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60C6840515
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=a4ClcLts
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 60C6840515
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C9FBB40AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755535960; bh=jJoGfkPGzsovkqrZFk1ijrUb5+RpNsRfmQGTU3tcLYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a4ClcLtseQNfJ2HsK4yIgpDDIPypDBvyfHk33o4L47ucdFlgqbh2V3fPTEPxeGI5C
	 GGne/mxIGdbeN14dc56VyXkEcUvEEchNZIl5+EFZKJguHI/MOElHpV1WRzjD7h5ljU
	 mo0zFXMH4VX5wBQEBLpmmrdjSw0kW/g0AOVMC61anZno3VfqRBxlSaTCwGEWW/mtw3
	 l/eVMfpV+/Z+HgktROcgSl3ehRD+2rGsMVKJ3Mmo5LOmifdc0Nn4jTdR1teTw2KXQV
	 RZyvnLsxgHiBW0orEIr/9PGu4laR2NLPjyuR+761HNTR7jSXQNbp+PEYX5p87rj+BI
	 Q6vTnD9as6UcQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C9FBB40AE3;
	Mon, 18 Aug 2025 16:52:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: NIKIL PAUL <snikilpaul@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,  skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 2/2 v3] docs: rcu: Replace multiple dead OLS links in
 RTFP.txt
In-Reply-To: <CAHHgkHp-oMuCfRGqL6FGrDNSi3a3HzU7uW27vUfNW7evk1m4+Q@mail.gmail.com>
References: <20250812163233.7330-2-snikilpaul@gmail.com>
 <CAHHgkHp-oMuCfRGqL6FGrDNSi3a3HzU7uW27vUfNW7evk1m4+Q@mail.gmail.com>
Date: Mon, 18 Aug 2025 10:52:38 -0600
Message-ID: <877bz08td5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

[CCs restored]

NIKIL PAUL <snikilpaul@gmail.com> writes:

> A smal follow-up, Do i need to do any more changes on this before getting accepted?
> It has two more changes which weren't in the previous version.

So I only received 2/2, so I lack some context here.  It seems you only
reposted this one patch out of the series?  When you make changes, you
need to post the whole series so that maintainers know what is going on.

Thanks,

jon
