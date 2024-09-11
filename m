Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F055149002
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Sep 2024 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726095257; cv=none; b=RUnC+Bs1tCuDrzncALNYdQoZY4qGF/xwZ8wb5Y22fYgeeEzGzwwjeZ90SVlgCgDbR9SDYH0fVgJuZctuBBzrr1+aoN66z1s25quX/887mB6DpM908/OWK9S64Sear7WwGUtK2bUuVO3Xhttfj6hIsARxE1+tjvJHwiSMdsGc8iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726095257; c=relaxed/simple;
	bh=OXUQXUpLdD82PoL0H0ysJsAEVyqb6IeigzdKnbw+L84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+R3aGxtFRzY+Bxpd/ftjZ1i7xqYEMH9XcxdfzWX3wgVVbT2eSKBzJw2p6/76/h8vKq+BMMqBoxwpFWmfExod6iNIWo5rtrlJRyr7igZ8udqnNlrD/vIQS2T9CIFboDsS1e1QI/bdS6cDpdcSbrGE17FisTPd6h766KKFmu90hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gHAsIhjm; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gHAsIhjm"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94A5481852
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Sep 2024 22:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.493
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AA2eDeXPjgKI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Sep 2024 22:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 893BE81831
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 893BE81831
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=gHAsIhjm
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 893BE81831
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Sep 2024 22:54:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B9E30C0249
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Sep 2024 22:49:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A884FF802;
	Wed, 11 Sep 2024 22:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726094957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qyNislHaCUJw7mzyf1B4jvIcfhaPLsCGQhSJYjqzSrI=;
	b=gHAsIhjmz32JvHLP/2aJsUBRuppIbeLZPhnYHLSQ1ZG4WJAkw3+EtkdsMNp/KbBw8GaQF+
	Jn69IEeKa7ICi3wjNLRVj9a2U9ipqnJF8psnYeX3ZcfbogkQ5UYxQRrXwwFbzJb5afD4hz
	Rpw0EHpSHMNuEZSfN2H8TNlPfO01G9YXuRPBzhK9qCWK9ROPinr2uramTLfb21wKXXJ1HK
	1ZMqyCAlDv7lR4+4lRsdq5Beq5HqXjFlFbG1eJzGRXWgkGTX7p/rpS3lLeV4CBszhjEh4o
	19QXH7ODI7K5bJHKSUUMDTfuUStHCXq7eF3hVnjx3TMeR4pkwfPPX7X9F9+nog==
Date: Thu, 12 Sep 2024 00:49:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] rtc: m48t59: Remove division condition with direct
 comparison
Message-ID: <172609494901.1572134.91739607625534933.b4-ty@bootlin.com>
References: <20240809155631.548044-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809155631.548044-1-abhishektamboli9@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 09 Aug 2024 21:26:31 +0530, Abhishek Tamboli wrote:
> Replace 'year / 100' with a direct comparison 'year >= 100'
> in m48t59_rtc_set_time() function. Improve the code clarity
> and eliminate division overhead.
> 
> Fix the following smatch warning:
> drivers/rtc/rtc-m48t59.c:135 m48t59_rtc_set_time() warn:
> replace divide condition 'year / 100' with 'year >= 100'
> 
> [...]

Applied, thanks!

[1/1] rtc: m48t59: Remove division condition with direct comparison
      https://git.kernel.org/abelloni/c/60a06efc56d7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
