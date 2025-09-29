Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D11302CC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Sep 2025 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759162300; cv=none; b=BpbYfnWYOXU5EbJ34MiNVkmdz9tuAcyMxLWKE1dNm691L0uf+CjL9gX39Mnd/bxHNnzFx3rNlAB4A2KuGSYccHy0MVx0O4FBDvHmDICUUfd2kIw6RU7gZg989xUywpS6k3c02jQhtxzE4PoxdcSVfC1WLdmn6vBK6w0jKq5gdRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759162300; c=relaxed/simple;
	bh=1C8ybsyb9yQ1UmO5cXiz1kvHuhwCzJqJDcXcWDZOKp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sgQPOdrv0W/WOaEGxws1va8dlb6PCJXlOnkWlgtZ9E90ZeTpaye14uRxMK2VUnzo3cHlhYfq27COJTCOJS+vgtWUWqz5Hd/JEvvNgUZchdOYkgb6CAs7CgCBrBR8XRM8MKL1VtShp1Vrp3Fd1t9H1gT8oN47xkvocamHao1fqBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xQ740c/6; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xQ740c/6"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A508124A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Sep 2025 16:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUghYeEvqXWB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Sep 2025 16:11:37 +0000 (UTC)
X-Greylist: delayed 497 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 29 Sep 2025 16:11:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CC968102A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC968102A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xQ740c/6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1CC968102A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Sep 2025 16:11:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D9C7C0244A;
	Mon, 29 Sep 2025 16:02:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0A5E606AE;
	Mon, 29 Sep 2025 16:03:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10995102F1892;
	Mon, 29 Sep 2025 18:03:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=96HEK4UvGCOo8Woo1oy+a2odFHzZgoRuFfoU8CA6IEw=;
	b=xQ740c/6iaZTnCc/giPM9R+u8rp4EOQWA0FFEej9Sh4ewD6Y10jYcCo4LlEmBO2aW6BPSs
	EIdoYs12ibW1QZHTwoyxIjfYBPKm3RJjQ2MkiPcSmdofc90GfmTtAHDQh0Rnu0mvwjo8JT
	L2T+zQgCuYD9EvdO2Kg8ftKpJuRO3ZEbT7RFp0HDB5YVLDB8M6S0sP4PlW6hMEwAWbSdJO
	jL6b6OO8Dq1051tvgrc8m4UX1jDxdqDurfkDuz3dKFwkCiysUUtIY1whDZzMX7ixkK4dUN
	l9cY3E9Ul2+CGNM2321atV6aWatEwzjFtfOAiYTAOYO6fWZ7dYQmfqfDF3pYwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Rahul Kumar <rk0006818@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
In-Reply-To: <20250922071137.900508-1-rk0006818@gmail.com>
References: <20250922071137.900508-1-rk0006818@gmail.com>
Subject: Re: [PATCH] mtd: jedec_probe: use struct_size() helper for cfiq
 allocation
Message-Id: <175916179288.52129.13789986252755392222.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 18:03:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 22 Sep 2025 12:41:37 +0530, Rahul Kumar wrote:
> Documentation/process/deprecated.rst recommends against performing
> dynamic size calculations in the arguments of memory allocator
> functions due to the risk of overflow. Such calculations can wrap
> around and result in a smaller allocation than expected.
> 
> Replace the size calculation in cfiq allocation with struct_size()
> helper to make the code clearer and handle overflows correctly.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: jedec_probe: use struct_size() helper for cfiq allocation
      commit: 527668868862e0db65efc88fe82040f1e48d4ab3

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

