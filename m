Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A831986E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755201919; cv=none; b=dg62INOspY69kEnVrrKxmDUiCJRunHO5zDr9I3gx9HG+OfxKO0db4oGWpFpM7gMQeDm/wWezyWFFQg2yitQtiKzWNJZMngMa/h/Iob4bGPpRy1IA8PiEDhy5XE+gzeaoQm7FEKyES8dkW9nnwdFzHI+wb/3VpdBU6MQF06anURE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755201919; c=relaxed/simple;
	bh=jwr1D/M/D6J8UXOLpfzxnHBTHqKQx+aPFWGFdoCo7Fo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NbohtIMuzWIK7WjrmSqy717AuGz7SIvk1pngLiRY837ilqdcvYOZ1CfnvFtlM/TI9xcPd4J5lxWacF0cZfom0kb/Lpww9qDAWqWqc8zL0wCadXvLMB2O8xZ7HAIjLIa6igs7hkwQaUVJ0Oo5vhYaiJxTUpwYHaSqPTSUVLiIdmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FKOxemmD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FKOxemmD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B09B440464
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 20:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gGmTw-Gx1-j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Aug 2025 20:05:16 +0000 (UTC)
X-Greylist: delayed 451 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 14 Aug 2025 20:05:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A71F40073
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A71F40073
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=FKOxemmD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3A71F40073
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 20:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 29D1E40AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755201459; bh=1gbvYz4GsU0PNtrxGdC8PGv96PBc4YyIP2GPO/NWKI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FKOxemmD5CAy8tadlQ6sNqF708V3koVuyEThfv5Ekr86q+wCll0KEaEy2uOrMArXN
	 gXrJibg6o+iVyQpZzy0rO+iwI8mXBepq1hQIwXwhdsc3Y9/iPrRcrz0giYzM4jPwEu
	 6DIVZ147pP5etHteMDoJ/Zc2df6ZAWwpRUABPRTtBrx8AkQDQoPPRRfHwVHi6nvf11
	 Z13Iryqoo1w4NMHj3xbFlavQs9R6HNe5fXo+M6pIbhDdRGc4P/BG2+w2HMUOSmy9DI
	 PfC5zyXc5e2mPOeAI+0jkbqZUlN9iijK8CP7yD3DYo9+402PmOiRKIkfZa+bOvQJdA
	 tmnqHbnm73icg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 29D1E40AD8;
	Thu, 14 Aug 2025 19:57:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ranganath V N <vnranganath.20@gmail.com>, alison.schofield@intel.com
Cc: alim.akhtar@samsung.com, dave@stgolabs.net, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel-mentees@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 rafael@kernel.org, skhan@linuxfoundation.org, vishal.l.verma@intel.com,
 vnranganath.20@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] Documentation: Fix driver-api typos
In-Reply-To: <20250814184304.20448-1-vnranganath.20@gmail.com>
References: <aJ4KEKHn351vQXe_@aschofie-mobl2.lan>
 <20250814184304.20448-1-vnranganath.20@gmail.com>
Date: Thu, 14 Aug 2025 13:57:38 -0600
Message-ID: <87wm75ekwd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Ranganath V N <vnranganath.20@gmail.com> writes:

> Corrected a few spelling mistakes
>
> v2:
> * corrected as per suggestions.
> * improved the phrasing.

For future reference, this information should go below the "---" line so
that the person applying the patch does not have to edit it out.  I can
take care of it this time, no need to resend.

Thanks,

jon
